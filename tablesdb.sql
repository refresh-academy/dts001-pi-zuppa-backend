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

create table user_site (
    user_username varchar references users (username),
    site_id int references sites (id)
);


create table user_role (
    user_username varchar references users (username),
    role_id int references roles (id)
);

create table roles (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) not null
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
 	ricevimento_pasto varchar (20)not null,
 	pasti varchar (20)not null

);

create table entities(
id Serial primary key,
nome Varchar (100) unique not null,
telefono varchar (16) not null,
via varchar(150) not null 
);

create table recipes (
id Serial primary key,
nome Varchar (100)not null,
descrizione text not null,
--ingredienti text not null
);

create table recipe_product(
    recipe_nome varchar references recipes (nome),
    product_nome varchar references products (nome),
    quantita_per_pasto decimal not null
);

create table products (
id Serial primary key,
nome Varchar (100)not null,
articolo_peso boolean not null,
unita_collo  integer not null,
unita_bancale integer not null,
codice_barre varchar (20) unique not null
);

create table sites(
id Serial primary key,
nome Varchar (100) not null
);

create table stock (
id serial primary key,
site_id integer not null references sites(id),
product_id integer not null references products(id),
quantita integer not null,
scadenza date,
unique (point_distribution_id, product_id)
);


