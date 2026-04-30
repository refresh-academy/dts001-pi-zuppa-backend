insert into users (nome, cognome, telefono, username, password, email, livello_accesso, abilitazione)
values ('Svetlana', 'Vitu', '3896234393', 'svetty', 'panda', 'svetlana.vitu@refresh-academy.org', 'coordinatore', true),
('Simone', 'Querzoli', '3348484309', 'Paddington', 'fabrizioèuncornuto', 'simone.querzoli@refresh-academy.it', 'volontario', true),
('Irene', 'Ruscelli', 'test1', 'crocutacrocuta', '1312Izzy<32024Lea', 'irene.ruscelli@refresh-academy.org', 'coordinatore', true),
('Nicolas', 'Carotenuto', 'test', 'niko.car', 'overwatch', 'nicolas.carotenuto@refresh-academy.org', 'coordinatore', true),
('Big', 'Boss', 'test', 'Admin', 'piuzuppa', '', 'coordinatore', true),
('Laura', 'Venturi', '3204455667', 'laura.venturi', 'laura123', 'laura.venturi@piuzuppa.org', 'volontario', true),
('Giulia', 'Berti', '3279988776', 'giulia.berti', 'giulia123', 'giulia.berti@piuzuppa.org', 'volontario', true),
('Paolo', 'Rinaldi', '3351234567', 'paolo.rinaldi', 'paolo123', 'paolo.rinaldi@piuzuppa.org', 'volontario', false);

insert into sites (nome)
values ('Saffi'),
('San Donato'),
('Savena'),
('Battiferro'),
('Navile'),
('Porto');

insert into products (nome, articolo_peso, unita_collo, unita_bancale, codice_barre)
values ('pomodoro preconfezionato 5 kg', true, 1, 6, '1234567890128'),
('biscotti confezionati 500 grammi', false, 6, 8, '1231231232'),
('pasta secca 500 grammi', false, 24, 48, '2345678901234'),
('riso parboiled 1 kg', false, 12, 36, '3456789012345'),
('ceci precotti 400 grammi', false, 24, 72, '4567890123456'),
('petto di pollo surgelato 2 kg', true, 4, 24, '5678901234567'),
('olio extravergine 1 litro', false, 12, 40, '6789012345678'),
('pane confezionato 550 grammi', false, 10, 60, '7890123456789'),
('passata di pomodoro 700 grammi', false, 12, 50, '8901234567890'),
('lenticchie secche 500 grammi', false, 20, 60, '9012345678901');

insert into stock (site_id, product_id, quantita, scadenza)
values (1, 1, 6, '2006-12-30'),
(1, 3, 240, '2027-09-12'),
(1, 7, 30, '2027-10-10'),
(2, 2, 48, '2027-01-25'),
(2, 8, 200, '2026-11-15'),
(2, 9, 90, '2027-05-21'),
(3, 4, 90, '2027-11-01'),
(3, 5, 64, '2027-03-17'),
(3, 10, 80, '2027-12-10'),
(4, 6, 72, '2027-06-20'),
(4, 7, 22, '2027-10-10'),
(5, 3, 110, '2027-08-30'),
(5, 9, 55, '2027-07-04'),
(6, 1, 12, '2026-12-18'),
(6, 8, 130, '2026-10-30');

insert into recipes (nome, descrizione)
values ('maccheroni al sugo', ''),
('zuppa di legumi', 'Zuppa calda di legumi con passata di pomodoro.'),
('riso alle verdure', 'Riso lessato condito con verdure miste.'),
('insalata di ceci', 'Ceci con olio e pane di accompagnamento.'),
('pollo al forno', 'Pollo al forno con contorno semplice.');

insert into recipe_product (recipe_nome, product_nome, quantita_per_pasto)
values ('maccheroni al sugo', 'pomodoro preconfezionato 5 kg', 0.08),
('maccheroni al sugo', 'pasta secca 500 grammi', 0.12),
('maccheroni al sugo', 'passata di pomodoro 700 grammi', 0.08),
('maccheroni al sugo', 'olio extravergine 1 litro', 0.01),
('zuppa di legumi', 'lenticchie secche 500 grammi', 0.10),
('zuppa di legumi', 'passata di pomodoro 700 grammi', 0.05),
('riso alle verdure', 'riso parboiled 1 kg', 0.09),
('riso alle verdure', 'olio extravergine 1 litro', 0.01),
('insalata di ceci', 'ceci precotti 400 grammi', 0.15),
('insalata di ceci', 'olio extravergine 1 litro', 0.01),
('pollo al forno', 'petto di pollo surgelato 2 kg', 0.18),
('pollo al forno', 'olio extravergine 1 litro', 0.01),
('pollo al forno', 'pane confezionato 550 grammi', 0.12);

insert into entities (nome, telefono, indirizzo, email)
values ('Caritas', '051-5789321', 'via Irnerio 45', 'caritas@piuzuppa.org'),
('CSM', '051-223344', 'villa mazzacorati', 'csm@piuzuppa.org'),
('ASP', '051-778899', 'via bianconiglio', 'asp@piuzuppa.org'),
('Comune', '051-111111', 'via liberoparadisus', 'comune@piuzuppa.org'),
('Croce Rossa', '051-445566', 'via Emilia Levante 90', 'crocerossa@piuzuppa.org'),
('Antoniano', '051-989898', 'via Guinizelli 3', 'antoniano@piuzuppa.org');

insert into meal_types (tipo)
values ('Standard'),
('Vegetariano'),
('Vegano'),
('Halal'),
('No latticini'),
('Senza glutine');

insert into guests (nome, cognome, residente, data_nascita, numeri_famigliari, professione, telefono)
values ('Giuseppe', 'Rezzonico', true, '1986-05-27', 5, 'panificatore', '339151312'),
('Marco', 'Rossi', true, '2001-11-03', 1, 'disoccupato', '051225072'),
('Sara', 'Bellucci', false, '1994-02-16', 2, 'badante', '3407755112'),
('Ahmed', 'Farouk', true, '1989-08-09', 4, 'muratore', '3339988112'),
('Elena', 'Moro', false, '1978-12-22', 1, 'collaboratrice domestica', '3386677881'),
('Luca', 'Neri', true, '1999-03-13', 3, 'magazziniere', '3341199332'),
('Fatima', 'Said', true, '1991-07-04', 2, 'sarta', '3314400221'),
('Paolo', 'Ferri', false, '1983-10-30', 1, 'elettricista', '3295500112'),
('Mina', 'Haddad', true, '1996-06-11', 2, 'barista', '3277700443'),
('Antonio', 'Greco', true, '1971-01-19', 1, 'pensionato', '3202233445'),
('Chiara', 'Serra', true, '1992-09-12', 2, 'cassiera', '3291234501'),
('Youssef', 'Khan', false, '1987-04-02', 3, 'autista', '3291234502'),
('Valentina', 'Riva', true, '1990-01-26', 1, 'segretaria', '3291234503'),
('Omar', 'Benali', true, '1995-11-18', 4, 'operaio', '3291234504'),
('Francesca', 'Leoni', false, '1984-03-07', 2, 'cuoca', '3291234505'),
('Moussa', 'Diallo', true, '1993-07-28', 5, 'facchino', '3291234506'),
('Giada', 'Palmieri', true, '2000-05-15', 1, 'studentessa', '3291234507'),
('Rachid', 'Amiri', false, '1981-12-04', 2, 'meccanico', '3291234508'),
('Elisa', 'Conti', true, '1998-08-22', 3, 'commessa', '3291234509'),
('Samir', 'Nasser', true, '1979-02-10', 1, 'custode', '3291234510'),
('Noemi', 'Fontana', false, '1997-06-03', 2, 'assistente', '3291234511'),
('Karim', 'Salah', true, '1988-10-29', 4, 'idraulico', '3291234512'),
('Alessandro', 'Doni', true, '1991-01-14', 1, 'magazziniere', '3291234513'),
('Marta', 'Guidi', false, '1985-09-30', 2, 'addetta pulizie', '3291234514'),
('Hassan', 'Mekki', true, '1994-12-19', 3, 'aiuto cuoco', '3291234515');

insert into guest_meal (guest_id, meal_type, ricevimento_pasto)
values (1, 'Standard', 'mensa'),
(1, 'Standard', 'asporto'),
(2, 'Vegetariano', 'mensa'),
(2, 'Vegetariano', 'asporto'),
(3, 'Vegano', 'mensa'),
(4, 'Halal', 'mensa'),
(5, 'No latticini', 'asporto'),
(6, 'Standard', 'mensa'),
(7, 'Halal', 'asporto'),
(8, 'Senza glutine', 'mensa'),
(9, 'Vegetariano', 'asporto'),
 (10, 'Standard', 'mensa'),
 (11, 'Vegetariano', 'mensa'),
 (12, 'Halal', 'asporto'),
 (13, 'No latticini', 'mensa'),
 (14, 'Halal', 'mensa'),
 (15, 'Standard', 'asporto'),
 (16, 'Vegano', 'mensa'),
 (17, 'Vegetariano', 'asporto'),
 (18, 'Senza glutine', 'mensa'),
 (19, 'Standard', 'mensa'),
 (20, 'No latticini', 'asporto'),
 (21, 'Vegano', 'mensa'),
 (22, 'Halal', 'asporto'),
 (23, 'Standard', 'mensa'),
 (24, 'Vegetariano', 'mensa'),
 (25, 'Halal', 'mensa');

insert into guest_entity (guest_id, entity_id)
values (1, 3),
(2, 4),
(3, 1),
(4, 5),
(5, 2),
(6, 6),
(7, 1),
(8, 3),
(9, 4),
(10, 2),
(11, 6),
(12, 5),
(13, 2),
(14, 1),
(15, 4),
(16, 3),
(17, 6),
(18, 5),
(19, 2),
(20, 1),
(21, 4),
(22, 3),
(23, 6),
(24, 5),
(25, 2);

insert into guest_site (guest_id, site_id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

insert into user_site (user_username, site_id)
values ('svetty', 3),
('svetty', 1),
('crocutacrocuta', 3),
('Paddington', 4),
('niko.car', 2),
('laura.venturi', 5),
('giulia.berti', 6),
('paolo.rinaldi', 1),
('Admin', 2);

insert into roles (nome)
values ('cucina'),
('magazzino'),
('accoglienza'),
('autista');

insert into user_role (role_id, user_username)
values (1, 'crocutacrocuta'),
(2, 'svetty'),
(3, 'Paddington'),
(1, 'niko.car'),
(2, 'Paddington'),
(3, 'crocutacrocuta'),
(1, 'laura.venturi'),
(4, 'giulia.berti'),
(2, 'paolo.rinaldi'),
(3, 'Admin');

insert into daily_meal_stats (data, site_id, meal_type, qta_prodotti, qta_avanzati, notes)
values ('2026-04-18', 1, 'Standard', 120, 7, 'Turno regolare'),
('2026-04-18', 2, 'Vegetariano', 45, 3, 'Aumento richieste vegetariane'),
('2026-04-18', 4, 'Halal', 38, 2, 'Consegne puntuali'),
('2026-04-19', 1, 'Standard', 118, 5, 'Buona affluenza'),
('2026-04-19', 3, 'Vegano', 26, 1, 'Servizio mensa ridotto'),
('2026-04-19', 6, 'Senza glutine', 19, 0, 'Nessun avanzo');

insert into meal_logs (data, guest_id, site_id, meal_type, modalita_ricevimento, consegnato)
values ('2026-04-18', 1, 1, 'Standard', 'mensa', true),
('2026-04-18', 2, 2, 'Vegetariano', 'mensa', true),
('2026-04-18', 3, 3, 'Vegano', 'mensa', true),
('2026-04-18', 4, 4, 'Halal', 'mensa', true),
('2026-04-19', 5, 5, 'No latticini', 'asporto', true),
('2026-04-19', 6, 6, 'Standard', 'mensa', true),
('2026-04-19', 7, 4, 'Halal', 'asporto', true),
('2026-04-19', 8, 3, 'Senza glutine', 'mensa', false),
('2026-04-19', 11, 1, 'Vegetariano', 'mensa', true),
('2026-04-19', 12, 4, 'Halal', 'asporto', true),
('2026-04-19', 13, 2, 'No latticini', 'mensa', true),
('2026-04-19', 14, 4, 'Halal', 'mensa', true),
('2026-04-19', 15, 5, 'Standard', 'asporto', true),
('2026-04-19', 16, 3, 'Vegano', 'mensa', true),
('2026-04-19', 17, 2, 'Vegetariano', 'asporto', true),
('2026-04-19', 18, 6, 'Senza glutine', 'mensa', true);

insert into daily_absences (data, guest_id, ragione)
values ('2026-04-19', 9, 'Visita medica'),
('2026-04-19', 10, 'Trasferimento temporaneo'),
('2026-04-19', 19, 'Impegno lavorativo'),
('2026-04-19', 20, 'Pratica amministrativa');