CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cognome VARCHAR(100),
    telefono VARCHAR(16),
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR (100) NOT NULL,
    email VARCHAR(100),
    livello_accesso VARCHAR(20) NOT NULL,
    punto_distribuzione VARCHar(30) not null,
    ruolo VARCHAR(20)
);



insert into  users (nome,cognome,telefono,
username,password,email,livello_accesso,
punto_distribuzione,ruolo)
values ('Svetlana','Vitu','3896234393','svetty','panda',
'svetlana.vitu@refresh-academy.org','coordinatore',
'savena','cucina'),
('Simone','Querzoli','3348484309','Paddington','fabrizioèuncornuto','simone.querzoli@refresh-academy.it',
'volontario','San Donato','magazzino'),
('Irene','Ruscelli','test1','crocutacrocuta','1312Izzy<32024Lea',
'irene.ruscelli@refresh-academy.org','coordinatore',
'savena','accoglienza'),
('Nicolas','Carotenuto','test','niko.car','overwatch',
'nicolas.carotenuto@refresh-academy.org','coordinatore',
'saffi','magazzino');

create table guests (
id SERIAL PRIMARY KEY,
    nome VARCHAR(100) not null,
    cognome VARCHAR(100) not null,
    residente Boolean not null,
    data_nascita Date not null,
    numeri_famigliari Integer not null,
    professione Varchar(50) not null,
    telefono VARCHAR(16) not null,
    ente_segnalazione varchar (50) not null,
 	ricevimento_pasto varchar (20)not null,
 	pasti varchar (20)not null

);



create table entities(
id Serial primary key,
nome Varchar (100) unique not null,
telefono varchar (16) not null,
via varchar(150) not null 
);



create table recipe (
id Serial primary key,
nome Varchar (100)not null,
descrizione text not null,
ingredienti text not null
);

create table products (
id Serial primary key,
nome Varchar (100)not null,
articolo_peso boolean not null,
unita_collo  integer not null,
unita_bancale integer not null,
codice_barre varchar (20) unique not null
);

create table point_distribution(
id Serial primary key,
nome Varchar (100) not null
);

insert into point_distribution (nome)
values ('Saffi'),('San Donato'),('Savena'),('Battiferro');


create table giacenze (
id serial primary key,
point_distribution_id integer not null references point_distribution(id),
product_id integer not null references products(id),
quantita integer not null,
scadenza date,
unique (point_distribution_id, product_id)
);


