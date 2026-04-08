ALTER TABLE users 
ALTER COLUMN punto_distribuzione type VARCHAR(100),
ALTER COLUMN ruolo type VARCHAR(100);

ALTER TABLE users ADD COLUMN abilitazione BOOLEAN;

UPDATE users SET abilitazione = TRUE;