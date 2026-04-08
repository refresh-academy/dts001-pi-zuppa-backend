insert into  users (nome,cognome,telefono,
username,password,email,livello_accesso,
punto_distribuzione,ruolo,abilitazione)
values ('Svetlana','Vitu','3896234393','svetty','panda',
'svetlana.vitu@refresh-academy.org','coordinatore',
'Savena','cucina','true'),
('Simone','Querzoli','3348484309','Paddington','fabrizioèuncornuto','simone.querzoli@refresh-academy.it',
'volontario','San Donato','magazzino','true'),
('Irene','Ruscelli','test1','crocutacrocuta','1312Izzy<32024Lea',
'irene.ruscelli@refresh-academy.org','coordinatore',
'Savena','accoglienza','true'),
('Nicolas','Carotenuto','test','niko.car','overwatch',
'nicolas.carotenuto@refresh-academy.org','coordinatore',
'Saffi','magazzino','true');
('Big','Boss','test','Admin','piuzuppa',
'','coordinatore',
'Saffi','magazzino','true');


insert into sites (nome)
values ('Saffi'),('San Donato'),('Savena'),('Battiferro');

insert into products (nome, articolo_peso, unita_collo, unita_bancale,
codice_barre);
values ('pomodoro preconfezionato 5 kg','true','1','6','1234567890128'),
('biscotti confezionati 500 grammi','false','6','8','1231231232')

insert into stock (point_distribution_id, product_id, quantita, scadenza)
values ('Saffi','12345789','6','-'),('Savena','987654321','48','-');

insert into recipes (nome, descrizione, ingredienti)
values ('maccheroni al sugo','');

insert into recipe_product values
('maccheroni al sugo','pomodoro preconfezionato 5 kg', "0.08")
('maccheroni al sugo','sale grosso 500g', "0.08")
('maccheroni al sugo','maccheroni 1kg', "0.2")


insert into entities (nome, telefono,via)
values ('Caritas','051-5789321','via Irnerio 45');

insert into guests (nome, cognome, residente, data_nascita, numeri_famigliari
professione, telefono, ente_segnalazione, ricevimento_pasto, pasti)
values ('Giuseppe', 'Rezzonico','si', '27/05/1986', '5','panificatore','339151312', 'Caritas', 'in loco', '5');

-- popoliamo utenti punti di distribuzione
insert into user_site values 
('svetty','Savena'),
('svetty','Saffi'),
('crocutacrocuta','Savena'),
('Paddington','Battiferro'),
('niko.car','San Donato'),
('Admin','Savena'),
('Admin','Battiferro'),
('Admin','San Donato'),
('Admin','Saffi')