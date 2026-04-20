insert into  users (nome,cognome,telefono,
username,password,email,livello_accesso,abilitazione)
values ('Svetlana','Vitu','3896234393','svetty','panda',
'svetlana.vitu@refresh-academy.org','coordinatore','true'),
('Simone','Querzoli','3348484309','Paddington','fabrizioèuncornuto','simone.querzoli@refresh-academy.it',
'volontario','true'),
('Irene','Ruscelli','test1','crocutacrocuta','1312Izzy<32024Lea',
'irene.ruscelli@refresh-academy.org','coordinatore','true'),
('Nicolas','Carotenuto','test','niko.car','overwatch',
'nicolas.carotenuto@refresh-academy.org','coordinatore','true'),
('Big','Boss','test','Admin','piuzuppa',
'','coordinatore','true');



insert into sites (nome)
values ('Saffi'),('San Donato'),('Savena'),('Battiferro');

insert into products (nome, articolo_peso, unita_collo, unita_bancale,
codice_barre)
values ('pomodoro preconfezionato 5 kg','true','1','6','1234567890128'),
('biscotti confezionati 500 grammi','false','6','8','1231231232');

insert into stock (site_id, product_id, quantita, scadenza)
values (1,1,'6','2006-12-30'),(2,2,'48','2027-01-25');

insert into recipes (nome, descrizione )
values ('maccheroni al sugo','');

insert into recipe_product values
('maccheroni al sugo','pomodoro preconfezionato 5 kg', '0.08');


insert into entities (nome, telefono,indirizzo ,email)
values ('Caritas','051-5789321','via Irnerio 45', 'pipo@gmail.com'),
('CSM', '051-223344', 'villa mazzacorati','pluto@gmail.com'),
('ASP', '051-778899', 'via bianconiglio','paperino@gmail.com'),
('Comune', '051-111111', 'via liberoparadisus', 'pigrizia@gmail.com');

insert into meal_types (tipo)
values ('Standard'),
('Vegetariano'),
('Vegano'),
('Halal'),
('No latticini');

insert into guests (nome, cognome, residente, data_nascita, numeri_famigliari,
professione, telefono)
values ('Giuseppe', 'Rezzonico','true', '1986-05-27', '5','panificatore','339151312'),
('Marco','Rossi','true','2001-11-03','1','disoccupato','051-225072');

insert into guest_meal (guest_id,meal_type,ricevimento_pasto)
values (1,'Standard','mensa'),
(1,'Standard','asporto'),
(2,'Vegetariano','mensa'),
(2,'Vegetariano','asporto');

insert into guest_entity (guest_id, entity_id)
values ('1','3'),('2','4');

-- popoliamo utenti punti di distribuzione
insert into user_site values 
('svetty','3'),
('svetty','1'),
('crocutacrocuta','3'),
('Paddington','4'),
('niko.car','2');

insert into roles (nome)
values ('cucina'),
('magazzino'),
('accoglienza');

insert into user_role (role_id,user_username)
values (1,'crocutacrocuta'),(2,'svetty'),(3,'Paddington'),(1,'niko.car'),
(2,'Paddington'),(3,'crocutacrocuta');
