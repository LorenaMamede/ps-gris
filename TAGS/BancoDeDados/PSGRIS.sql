CREATE DATABASE PSGRIS;

CREATE TABLE Pessoa(
pessoa_oid uniqueidentifier NOT NULL,
nome varchar(80),
numeroDocumento varchar(80),
tipoDocumento varchar(80),
telefone varchar(20),
email varchar(80)
CONSTRAINT PKPessoa PRIMARY KEY (pessoa_oid),
);

CREATE TABLE Candidato( 
candidato_oid uniqueidentifier NOT NULL,
pessoa_oid uniqueidentifier NOT NULL,

CONSTRAINT PKCandidato PRIMARY KEY (candidato_oid),
CONSTRAINT CandidatoEK UNIQUE (pessoa_oid)
);

CREATE TABLE Avaliador( 
avaliador_oid uniqueidentifier NOT NULL,
pessoa_oid uniqueidentifier NOT NULL,
descricao varchar(255)
CONSTRAINT PKAvaliador PRIMARY KEY (avaliador_oid),
CONSTRAINT AvaliadorEK UNIQUE (pessoa_oid)
);

CREATE TABLE Palestra(
palestra_oid uniqueidentifier NOT NULL,	
avaliador_oid uniqueidentifier NOT NULL,
nome varchar(80),
dataRealizacao datetime,
localizacao varchar(255),
descricao varchar(255),

CONSTRAINT PKPalastra PRIMARY KEY (palestra_oid),
CONSTRAINT PalestraEK UNIQUE (avaliador_oid)
);

CREATE TABLE Tag(
tag_oid uniqueidentifier NOT NULL,	
palestra_oid uniqueidentifier NOT NULL, 
nome varchar(80),
dataEntrega datetime,
descricao varchar(255),

CONSTRAINT PKTag PRIMARY KEY (tag_oid),
CONSTRAINT TagEK UNIQUE (palestra_oid)
);





