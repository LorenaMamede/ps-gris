CREATE DATABASE IF NOT EXISTS PSGRIS2020;
USE PSGRIS2020;

CREATE TABLE Pessoa(
pessoaOid bigint(20) NOT NULL,
nome varchar(80),
numeroDocumento varchar(80),
tipoDocumento varchar(80),
telefone varchar(20),
email varchar(80),
CONSTRAINT PKPessoa PRIMARY KEY (pessoaOid)
);

CREATE TABLE Candidato( 
candidatoOid bigint(20) NOT NULL,
pessoaOid bigint(20) NOT NULL,

CONSTRAINT PKCandidato PRIMARY KEY (candidatoOid),
CONSTRAINT CandidatoEK UNIQUE (pessoaOid)
);

CREATE TABLE Avaliador( 
avaliadorOid bigint(20) NOT NULL,
pessoaOid bigint(20) NOT NULL,
descricao varchar(255),
CONSTRAINT PKAvaliador PRIMARY KEY (avaliadorOid),
CONSTRAINT AvaliadorEK UNIQUE (pessoaOid)
);

CREATE TABLE Palestra(
palestraOid bigint(20) NOT NULL,	
avaliadorOid bigint(20) NOT NULL,
nome varchar(80),
dataRealizacao datetime,
localizacao varchar(255),
descricao varchar(255),

CONSTRAINT PKPalastra PRIMARY KEY (palestraOid),
CONSTRAINT PalestraEK UNIQUE (avaliadorOid)
);

CREATE TABLE Tag(
tagOid bigint(20) NOT NULL,	
palestraOid bigint(20) NOT NULL, 
nome varchar(80),
dataEntrega datetime,
descricao varchar(255),

CONSTRAINT PKTag PRIMARY KEY (tagOid),
CONSTRAINT TagEK UNIQUE (palestraOid)
);





