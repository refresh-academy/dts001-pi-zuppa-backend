SET search_path TO piuzuppa;

-- 1. ROLES & USERS
INSERT INTO roles (nome) VALUES ('cucina'), ('magazzino'), ('accoglienza'), ('autista');

INSERT INTO users (nome, cognome, telefono, username, password, email, livello_accesso, abilitazione)
VALUES 
('Svetlana', 'Vitu', '3896234393', 'svetty', 'panda', 'svetlana.vitu@refresh-academy.org', 'coordinatore', true),
('Simone', 'Querzoli', '3348484309', 'Paddington', 'fabrizioèuncornuto', 'simone.querzoli@refresh-academy.it', 'volontario', true),
('Irene', 'Ruscelli', 'test1', 'crocutacrocuta', '1312Izzy<32024Lea', 'irene.ruscelli@refresh-academy.org', 'coordinatore', true),
('Nicolas', 'Carotenuto', 'test', 'niko.car', 'overwatch', 'nicolas.carotenuto@refresh-academy.org', 'coordinatore', true),
('Big', 'Boss', 'test', 'Admin', 'piuzuppa', '', 'coordinatore', true),
('Laura', 'Venturi', '3204455667', 'laura.venturi', 'laura123', 'laura.venturi@piuzuppa.org', 'volontario', true),
('Giulia', 'Berti', '3279988776', 'giulia.berti', 'giulia123', 'giulia.berti@piuzuppa.org', 'volontario', true),
('Paolo', 'Rinaldi', '3351234567', 'paolo.rinaldi', 'paolo123', 'paolo.rinaldi@piuzuppa.org', 'volontario', false);

-- 2. SITES & STORAGE
INSERT INTO sites (nome) VALUES ('Saffi'), ('San Donato'), ('Savena'), ('Battiferro'), ('Navile'), ('Porto');

-- We need at least one location to put stock in
INSERT INTO storage_locations (nome, site_id, modalita_di_conservazione, stato) 
VALUES ('Scaffale A1', 1, 'ambiente', 'attivo'), ('Cella Frigo 1', 4, 'surgelato/congelato', 'attivo');

-- 3. PRODUCTS (Fixed: added unita_di_misura, colli_per_strato, tipo_codice; removed codice_barre)
INSERT INTO products (nome, articolo_peso, unita_di_misura, unita_per_collo, colli_per_strato, colli_per_bancale, tipo_codice, modalita_di_conservazione)
VALUES 
('pomodoro preconfezionato 5 kg', true, 'kg', 1, 1, 6, 'EAN13', 'ambiente'),
('biscotti confezionati 500 grammi', false, 'pz', 6, 1, 8, 'EAN13', 'ambiente'),
('pasta secca 500 grammi', false, 'pz', 24, 2, 48, 'EAN13', 'ambiente'),
('riso parboiled 1 kg', false, 'pz', 12, 3, 36, 'EAN13', 'ambiente'),
('ceci precotti 400 grammi', false, 'pz', 24, 4, 72, 'EAN13', 'ambiente'),
('petto di pollo surgelato 2 kg', true, 'kg', 4, 2, 24, 'EAN13', 'surgelato/congelato'),
('olio extravergine 1 litro', false, 'L', 12, 4, 40, 'EAN13', 'ambiente'),
('pane confezionato 550 grammi', false, 'pz', 10, 6, 60, 'EAN13', 'ambiente'),
('passata di pomodoro 700 grammi', false, 'pz', 12, 5, 50, 'EAN13', 'ambiente'),
('lenticchie secche 500 grammi', false, 'pz', 20, 3, 60, 'EAN13', 'ambiente');

-- 4. STOCK (Fixed: added location_id)
INSERT INTO stock (site_id, product_id, location_id, quantita, scadenza, codice_barre)
VALUES 
(1, 1, 1, 6.00, '2006-12-30', '1234567890128'),
(1, 3, 1, 240.00, '2027-09-12', '2345678901234'),
(4, 6, 2, 72.00, '2027-06-20', '5678901234567');

-- 5. RECIPES & MAPPING (Fixed: use IDs instead of names)
INSERT INTO recipes (nome, descrizione)
VALUES ('maccheroni al sugo', 'Pasta al pomodoro'), ('zuppa di legumi', 'Zuppa calda');

INSERT INTO recipe_product (recipe_id, product_id, quantita_per_pasto)
VALUES (1, 1, 0.0800), (1, 3, 0.1200);

-- 6. MEAL TYPES & GUESTS
INSERT INTO meal_types (tipo) VALUES ('Standard'), ('Vegetariano'), ('Vegano'), ('Halal'), ('No latticini'), ('Senza glutine');

INSERT INTO guests (nome, cognome, residente, data_nascita, nazionalita, numero_famigliari, professione, telefono, abilitazione)
VALUES ('Giuseppe', 'Rezzonico', true, '1986-05-27', 'Italiana', 5, 'panificatore', '339151312', true);

-- 7. GUEST MAPPINGS
INSERT INTO guest_meal (guest_id, meal_type, ricevimento_pasto) VALUES (1, 'Standard', 'mensa');
INSERT INTO guest_site (guest_id, site_id) VALUES (1, 1);

-- 8. USER MAPPINGS
INSERT INTO user_site (user_username, site_id) VALUES ('svetty', 3), ('Admin', 2);
INSERT INTO user_role (role_id, user_username) VALUES (1, 'crocutacrocuta'), (3, 'Admin');
