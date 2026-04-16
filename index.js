const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = 3000;

const pool = new Pool({
    user:'postgres',
    password:'refresh2026',
    host:'localhost',
    port:5432,
    database: 'postgres',
    //path per trovare la schema del progetto
    options: ' -c search_path=piuzuppa'
});
app.use(express.json());

// logger middleware obbligatorie
app.use((req, res, next) => {
    req.time = new Date(Date.now()).toString();
    console.log(req.method, req.hostname, req.path, req.time, req.body);
    next();
});

const pickFirst = (...values) => values.find((value) => value !== undefined && value !== null);

//restituisce la lista degli utenti
app.get('/users', async (req, res) => {
    const query = `
        SELECT 
            u.id, u.nome, u.cognome, u.username, u.password, u.telefono, u.email, u.livello_accesso, 
            ARRAY_AGG(DISTINCT s.nome) AS sites, 
            ARRAY_AGG(DISTINCT r.nome) AS roles 
        FROM users u 
        LEFT JOIN user_role ur ON u.username = ur.user_username 
        LEFT JOIN roles r ON ur.role_id = r.id 
        LEFT JOIN user_site us ON u.username = us.user_username 
        LEFT JOIN sites s ON us.site_id = s.id 
        GROUP BY u.id, u.nome, u.cognome, u.telefono, u.username, u.email, u.livello_accesso;
    `;
    const queryResults = await pool.query(query);
    res.json(queryResults.rows);
});

//restituisce la lista degli ospiti
app.get('/guests', async (req, res) => {
    const query = `
        SELECT 
            g.id, g.nome, g.cognome, g.residente, g.data_nascita, g.numeri_famigliari, g.professione,g.telefono,e.nome, 
            ARRAY_AGG(DISTINCT gm.meal_type ) AS guest_meal 
        FROM guests g 
        LEFT JOIN guest_meal gm ON g.id = gm.guest_id
        LEFT JOIN meal_types mt ON gm.meal_type = mt.tipo 
        LEFT JOIN guest_entity ge ON g.id = ge.guest_id
        LEFT JOIN entities e ON ge.entity_id = e.id
        GROUP BY g.id, g.nome, g.cognome, g.residente, g.data_nascita, g.numeri_famigliari, g.professione,g.telefono,e.nome;
    `;
    const queryResults = await pool.query(query);
    res.json(queryResults.rows);
})

app.get('/meal_types', async(req, res) =>{
    const query = "SELECT * FROM meal_types";
    const queryResults = await pool.query(query);
    res.json(queryResults.rows);
})

app.get('/entities', async(req, res) =>{
    const query = "SELECT * FROM entities";
    const queryResults = await pool.query(query);
    res.json(queryResults.rows);
})

app.post('/guests', async (req, res) => {
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        const nome = pickFirst(req.body.name, req.body.nome, '').trim();
        const cognome = pickFirst(req.body.surname, req.body.cognome, '').trim();
        const residente = Boolean(req.body.resident ?? req.body.residente);
        const data_nascita = pickFirst(req.body.birthDate, req.body.dataDiNascita, req.body.data_nascita);
        const numeri_famigliari = Number(pickFirst(req.body.familyCount, req.body.numeroFamiliari, req.body.numeri_famigliari, 0));
        const professione = pickFirst(req.body.profession, req.body.professione, '').trim();
        const telefono = String(pickFirst(req.body.phone, req.body.telefono, '')).trim();
        const entityName = String(pickFirst(req.body.entityName, req.body.enteSegnalazione, '')).trim();
        const meals = Array.isArray(req.body.meals) ? req.body.meals : [];

        if (!nome || !cognome || !data_nascita || !professione || !telefono || !entityName) {
            await client.query('ROLLBACK');
            return res.status(400).json({ error: 'Missing required guest fields' });
        }

        if (meals.length === 0) {
            await client.query('ROLLBACK');
            return res.status(400).json({ error: 'At least one meal is required' });
        }

        const guestRes = await client.query(
            `INSERT INTO guests (nome, cognome, residente, data_nascita, numeri_famigliari, professione, telefono)
             VALUES ($1, $2, $3, $4, $5, $6, $7)
             RETURNING *`,
            [nome, cognome, residente, data_nascita, numeri_famigliari, professione, telefono]
        );

        const guest = guestRes.rows[0];

        const entityRes = await client.query(
            'SELECT id, nome FROM entities WHERE nome = $1',
            [entityName]
        );

        if (entityRes.rowCount === 0) {
            await client.query('ROLLBACK');
            return res.status(400).json({ error: 'Selected entity not found' });
        }

        await client.query(
            'INSERT INTO guest_entity (guest_id, entity_id) VALUES ($1, $2)',
            [guest.id, entityRes.rows[0].id]
        );

        for (const meal of meals) {
            const mealType = String(pickFirst(meal.mealType, meal.tipo, '')).trim();
            const deliveryType = String(pickFirst(meal.deliveryType, meal.consegna, '')).trim();

            if (!mealType || !deliveryType) {
                await client.query('ROLLBACK');
                return res.status(400).json({ error: 'Meal type and delivery are required' });
            }

            await client.query(
                `INSERT INTO guest_meal (guest_id, meal_type, ricevimento_pasto)
                 VALUES ($1, $2, $3)`,
                [guest.id, mealType, deliveryType]
            );
        }

        await client.query('COMMIT');
        res.status(201).json({ ...guest, entity: entityRes.rows[0].nome, meals });

    } catch (err) {
        await client.query('ROLLBACK');
        console.error(err);
        res.status(500).json({ error: "Errore durante la creazione dell'ospite" });
    } finally {
        client.release();
    }
});

//per gestione nuovo utente
app.post('/users', async (req, res) => {
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        const nome = req.body.name || req.body.nome;
        const cognome = req.body.surname || req.body.cognome;
        const telefono = req.body.phone || req.body.telefono;
        const username = req.body.username;
        const password = req.body.password;
        const email = req.body.email;
        const livello_accesso = req.body.accessLevel || req.body.livello_accesso || 'volontario';
        
        const sites = req.body.site || []; 
        const roles = req.body.role || [];

        const userQuery = `
            INSERT INTO users (nome, cognome, telefono, username, password, email, livello_accesso, abilitazione)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
            RETURNING *;
        `;

        const abilitazione = req.body.abilitazione !== undefined ? req.body.abilitazione : true;

        const userRes = await client.query(userQuery, [
            nome, 
            cognome, 
            telefono, 
            username, 
            password, 
            email, 
            livello_accesso, 
            abilitazione
        ]);

        for (const roleName of roles) {
            await client.query(`
                INSERT INTO user_role (user_username, role_id)
                SELECT $1, id FROM roles WHERE nome = $2
            `, [username, roleName]);
        }

        for (const siteName of sites) {
            await client.query(`
                INSERT INTO user_site (user_username, site_id)
                SELECT $1, id FROM sites WHERE nome = $2
            `, [username, siteName]);
        }

        await client.query('COMMIT');

        const newUser = userRes.rows[0];
        res.json({ ...newUser, sites, roles });

    } catch (err) {
        await client.query('ROLLBACK');
        console.error(err);
        res.status(500).json({ error: "Errore durante la creazione dell'utente" });
    } finally {
        client.release();
    }
});


//modifica utente
app.patch('/users/:id', async (req, res) => {
    const { id } = req.params;
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        const currentUserRes = await client.query(
            'SELECT username FROM users WHERE id = $1',
            [id]
        );

        if (currentUserRes.rowCount === 0) {
            await client.query('ROLLBACK');
            return res.status(404).json({ error: 'User not found' });
        }

        const previousUsername = currentUserRes.rows[0].username;
        const nome = pickFirst(req.body.name, req.body.nome, '');
        const cognome = pickFirst(req.body.surname, req.body.cognome, null);
        const telefono = pickFirst(req.body.phone, req.body.telefono, '');
        const username = req.body.username;
        const password = req.body.password;
        const email = req.body.email;
        const livello_accesso = pickFirst(req.body.accessLevel, req.body.livello_accesso, 'volontario');
        const abilitazione = req.body.abilitazione !== undefined ? req.body.abilitazione : true;

        const userUpdateQuery = `
            UPDATE users 
            SET nome=$1, cognome=$2, telefono=$3, username=$4, password=$5, email=$6, livello_accesso=$7, abilitazione=$8
            WHERE id=$9 RETURNING *;
        `;

        const userRes = await client.query(userUpdateQuery, [
            nome,
            cognome,
            telefono,
            username,
            password,
            email,
            livello_accesso,
            abilitazione,
            id
        ]);

        if (previousUsername !== username) {
            await client.query(
                'UPDATE user_role SET user_username = $1 WHERE user_username = $2',
                [username, previousUsername]
            );
            await client.query(
                'UPDATE user_site SET user_username = $1 WHERE user_username = $2',
                [username, previousUsername]
            );
        }

        await client.query('DELETE FROM user_role WHERE user_username = $1', [username]);
        const roles = req.body.role || [];
        for (const roleName of roles) {
            await client.query(
                `INSERT INTO user_role (user_username, role_id) 
                 SELECT $1, id FROM roles WHERE nome = $2`, 
                [username, roleName]
            );
        }

        await client.query('DELETE FROM user_site WHERE user_username = $1', [username]);
        const sites = req.body.site || [];
        for (const siteName of sites) {
            await client.query(
                `INSERT INTO user_site (user_username, site_id) 
                 SELECT $1, id FROM sites WHERE nome = $2`, 
                [username, siteName]
            );
        }

        await client.query('COMMIT');
        res.json({ ...userRes.rows[0], sites, roles });

    } catch (err) {
        await client.query('ROLLBACK');
        console.error(err);
        res.status(500).send("Update failed");
    } finally {
        client.release();
    }
});

//elimina utente
app.delete('/users/:id', async (req, res) => {
    const { id } = req.params;
    const client = await pool.connect();

    try {
        await client.query('BEGIN');

        const userRes = await client.query(
            'SELECT username FROM users WHERE id = $1',
            [id]
        );

        if (userRes.rowCount === 0) {
            await client.query('ROLLBACK');
            return res.status(404).json({ error: 'User not found' });
        }

        const username = userRes.rows[0].username;

        await client.query('DELETE FROM user_role WHERE user_username = $1', [username]);
        await client.query('DELETE FROM user_site WHERE user_username = $1', [username]);

        const deleteRes = await client.query(
            'DELETE FROM users WHERE id = $1 RETURNING *',
            [id]
        );

        await client.query('COMMIT');
        res.json(deleteRes.rows[0]);
    } catch (err) {
        await client.query('ROLLBACK');
        console.error(err);
        res.status(500).send('Delete failed');
    } finally {
        client.release();
    }
});

//"type":"commonjs" in fondo alla pagina obbligatorio
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})




