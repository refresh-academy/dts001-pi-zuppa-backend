CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cognome VARCHAR(100),
    telefono VARCHAR(16),
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR (100) NOT NULL,
    email VARCHAR(100),
    livello_accesso VARCHAR(20) NOT NULL,
    abilitazione Boolean not null
);

create table roles (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) not null
);

create table sites(
id Serial primary key,
nome Varchar (100) not null
);

create table user_site (
    user_username varchar unique references users (username),
    site_id int references sites (id)
);

create table user_role (
    user_username varchar unique references users (username),
    role_id int references roles (id)
);



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
 	ricevimento_pasto varchar (20)not null
);

DROP TABLE guests;

CREATE TABLE meal_types (
tipo VARCHAR(50) UNIQUE NOT null
);

CREATE TABLE meals (
guest_id int UNIQUE REFERENCES guests(id),
meal_type varchar UNIQUE references meal_types(tipo) 
);

create table entities(
id Serial primary key,
nome Varchar (100) unique not null,
telefono varchar (16) not null,
via varchar(150) not null 
);

create table recipes (
id Serial primary key,
nome Varchar (100) unique not null,
descrizione text not null
);

create table products (
id Serial primary key,
nome Varchar (100) unique not null,
articolo_peso boolean not null,
unita_collo  integer not null,
unita_bancale integer not null,
codice_barre varchar (20) unique not null
);

create table recipe_product(
    recipe_nome varchar unique references recipes (nome),
    product_nome varchar unique references products (nome),
    quantita_per_pasto decimal not null
);

create table stock (
id serial primary key,
site_id integer not null references sites(id),
product_id integer not null references products(id),
quantita integer not null,
scadenza date,
unique (site_id, product_id)
);

create table guest_entity (
guest_id int unique references guests (id),
entity_nome varchar unique references entities (nome)
);

create table guest_site (
guest_id int unique references guests (id),
site_id int unique references sites(id)
);

create table recipe_type (
recipe_nome varchar unique references recipes (nome),
meal_type varchar unique references meal_types (tipo)
);

