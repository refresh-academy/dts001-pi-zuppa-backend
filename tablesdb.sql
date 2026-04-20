drop table user_role;
drop table user_site;

CREATE TYPE delivery_mode AS ENUM ('mensa', 'asporto');

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
    user_username varchar references users (username),
    site_id int references sites (id)
);

create table user_role (
    user_username varchar references users (username),
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
    abilitazione bool
);

CREATE TABLE meal_types (
tipo VARCHAR(50) UNIQUE NOT null,
id Serial primary key;
);

CREATE TABLE guest_meal (
guest_id int REFERENCES guests(id),
meal_type varchar references meal_types(tipo),
ricevimento_pasto delivery_mode
);

create table entities(
id Serial primary key,
nome Varchar (100) unique not null,
telefono varchar (16) not null,
indirizzo varchar(150) not null,
email VARCHAR(255),
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

CREATE TABLE recipe_product (
    recipe_nome VARCHAR REFERENCES recipes (nome),
    product_nome VARCHAR REFERENCES products (nome),
    quantita_per_pasto DECIMAL(10, 4) NOT NULL, 
    PRIMARY KEY (recipe_nome, product_nome)
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
guest_id int references guests (id),
entity_id int references entities (id)
);

create table guest_site (
guest_id int unique references guests (id),
site_id int unique references sites(id)
);

create table recipe_type (
recipe_nome varchar unique references recipes (nome),
meal_type varchar unique references meal_types (tipo)
);

CREATE TABLE daily_meal_stats (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    site_id INT REFERENCES sites(id),
    meal_type VARCHAR(50) REFERENCES meal_types(tipo),
    qta_prodotti INT NOT NULL,
    qta_avanzati INT DEFAULT 0,
    notes TEXT,
    UNIQUE (data, site_id, meal_type)
);

CREATE TABLE meal_logs (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    guest_id INT REFERENCES guests(id),
    site_id INT REFERENCES sites(id),
    meal_type VARCHAR(50) REFERENCES meal_types(tipo),
    modalita_ricevimento delivery_mode,
    consegnato BOOLEAN DEFAULT TRUE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (data, guest_id, meal_type)
);

CREATE TABLE daily_absences (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    guest_id INT REFERENCES guests(id),
    ragione TEXT,
    UNIQUE (data, guest_id)
);