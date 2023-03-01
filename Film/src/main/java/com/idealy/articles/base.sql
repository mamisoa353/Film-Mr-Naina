DROP TABLE IF EXISTS article;
CREATE TABLE article(
    id serial PRIMARY KEY,
    nom varchar(40),
    description text,
    dateArticle date,
    dateFin date,
    photo text,
    idtype int,
    status VARCHAR,
    datecreation date default current_timestamp,
    datepublication TIMESTAMP,
    idAuteur int,
    Auteur VARCHAR(50),
    importance int DEFAULT 0
);

drop table if exists type;
CREATE TABLE type(
    idType serial primary key,
    designation varchar(50)
);

insert into type(designation)values('Article');
insert into type(designation)values('Evenement');


DROP TABLE IF EXISTS userLogin;
CREATE TABLE userLogin(
    id serial primary key,
    login varchar(60) unique not null,
    password varchar(100)
);
INSERT INTO userLogin VALUES (default, 'admin', '1234');


DROP TABLE IF EXISTS auteurLogin;
CREATE TABLE auteurLogin(
    id serial primary key,
    login varchar(60) unique not null,
    password varchar(100)
);

INSERT INTO auteurLogin VALUES (default, 'Auteur 1', '1234');

select * from Article  limit 2 offset 2;


