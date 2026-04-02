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
app.get('/users',async(req,res)=>{
    const queryResults = await pool.query('SELECT * from users')
    const result = queryResults.rows
    res.json(result);
})



//per gestione nuovo utente
app.post('/users',async(req,res)=>{
    const text = `
        insert into users
        (nome, cognome, telefono, username, password, email, livello_accesso, punto_distribuzione, ruolo)
        values ($1, $2, $3, $4, $5, $6, $7, $8, $9)
        returning *
    `;
        const nome = pickFirst(req.body.name, req.body.nome);
        const cognome = pickFirst(req.body.surname, req.body.cognome);
        const telefono = pickFirst(req.body.phone, req.body.telefono);
        const username = req.body.username;
        const password = req.body.password;
        const email = req.body.email;
        const livello_accesso = pickFirst(req.body.accesLevel, req.body.accessLevel, req.body.livello_accesso);
        const punto_distribuzione = pickFirst(req.body.site, req.body.puntoDistribuzione, req.body.punto_distribuzione);
        const ruolo = req.body.role;
        const values = [nome, cognome, telefono, username, password, email, livello_accesso, punto_distribuzione, ruolo];
        const queryResults = await pool.query(text, values);
        res.json(queryResults.rows);

});



//modifica utente
app.patch('/users/:id',async(req,res)=>{
   
    const text = `
        update  users set nome =$1 , cognome = $2, telefono = $3, username =$4, password =$5, email=$6, livello_accesso=$7, punto_distribuzione=$8, ruolo=$9 where id =$10
        returning *
    `;
        
        const nome = pickFirst(req.body.name, req.body.nome);
        const cognome = pickFirst(req.body.surname, req.body.cognome);
        const telefono = pickFirst(req.body.phone, req.body.telefono);
        const username = req.body.username;
        const password = req.body.password;
        const email = req.body.email;
        const livello_accesso = pickFirst(req.body.accesLevel, req.body.accessLevel, req.body.livello_accesso);
        const punto_distribuzione = pickFirst(req.body.site, req.body.puntoDistribuzione, req.body.punto_distribuzione);
        const ruolo = req.body.role;
        const id = req.params.id;
        const values = [nome, cognome, telefono, username, password, email, livello_accesso, punto_distribuzione, ruolo,id];
        const queryResults = await pool.query(text, values);
        res.json(queryResults.rows);

});


//"type":"commonjs" in fondo alla pagina obbligatorio
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
