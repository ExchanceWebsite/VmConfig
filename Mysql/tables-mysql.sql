Create database ExchanceDB;
use ExchanceDB;

CREATE TABLE Localidade (
  id_localidade INT auto_increment NOT NULL,
  pais VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  cep VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_localidade));


CREATE TABLE  Estudante (
   id_estudante INT auto_increment NOT NULL,
   nome VARCHAR(30) NOT NULL,
   idade INT NOT NULL,
   descricao VARCHAR(300) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(120) NOT NULL,
   telefone VARCHAR(45) NOT NULL,
   cpf  CHAR(11) NOT NULL,
   fk_localidade  INT NOT NULL,
  PRIMARY KEY (id_estudante),
    FOREIGN KEY (fk_localidade)
    REFERENCES Localidade (id_localidade));
  
CREATE TABLE  Host_family (
   id_host_family INT auto_increment NOT NULL,
   nome VARCHAR(30) NOT NULL,
   Verificado CHAR(25) NOT NULL,
   descricao VARCHAR(300) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(120) NOT NULL,
   fk_localidade INT NOT NULL,
  PRIMARY KEY (id_host_family),
    FOREIGN KEY (fk_localidade)
    REFERENCES Localidade (id_localidade));


CREATE TABLE Comentario (
   id_comentario INT auto_increment NOT NULL,
   fk_proprietario INT NOT NULL,
   fk_destinatario INT NOT NULL,
   comentario VARCHAR(300) NOT NULL,
   data_postagem DATE NOT NULL,
  PRIMARY KEY (id_comentario, fk_proprietario, fk_destinatario),
    FOREIGN KEY (fk_proprietario)
    REFERENCES Estudante (id_estudante),
    FOREIGN KEY (fk_destinatario)
    REFERENCES Host_family (id_host_family));


CREATE TABLE Acomodacao (
   id_acomodacao INT auto_increment NOT NULL,
   fk_host INT NOT NULL,
   fk_localidade INT NOT NULL,
   reservado BOOLEAN NOT NULL,
   descricao VARCHAR(300) NOT NULL,
   inicio_disponibilidade DATE NOT NULL,
   fim_disponibilidade DATE NOT NULL,
   valor_diaria FLOAT NOT NULL,
   regras VARCHAR(150) NOT NULL,
  PRIMARY KEY (id_acomodacao, fk_host),
	FOREIGN KEY (fk_localidade)
    REFERENCES Localidade (id_localidade),
    FOREIGN KEY (fk_host)
	REFERENCES Host_family (id_host_family));
    

CREATE TABLE Reserva (
   id_reserva INT auto_increment NOT NULL,
   fk_estudante INT NOT NULL,
   entrada DATE NOT NULL,
   saida DATE NOT NULL,
   forma_pagamento VARCHAR(20) NULL,
   fk_acomodacao INT NOT NULL,
   fk_host INT NOT NULL,
  PRIMARY KEY (id_reserva, fk_estudante, fk_acomodacao, fk_host),
    FOREIGN KEY (fk_estudante)
    REFERENCES Estudante (id_estudante),
    FOREIGN KEY (fk_acomodacao, fk_host)
    REFERENCES Acomodacao (id_acomodacao , fk_host));
      
    
CREATE TABLE Integrante (
   id_integrante INT auto_increment NOT NULL,
   nome VARCHAR(30) NOT NULL,
   parentesco VARCHAR(20) NOT NULL,
   idade INT NOT NULL,
   fk_host INT NOT NULL,
  PRIMARY KEY (id_integrante, fk_host),
    FOREIGN KEY (fk_host)
    REFERENCES Host_family (id_host_family));
    
CREATE TABLE Imagem (
   id_imagem INT auto_increment NOT NULL,
   nome VARCHAR(50) NOT NULL,
   caminho BLOB NOT NULL,
   is_documeto TINYINT NOT NULL,
   is_foto TINYINT NOT NULL,
   fk_estudante INT,
   fk_host INT,
  PRIMARY KEY (id_imagem, fk_estudante, fk_host),
    FOREIGN KEY (fk_estudante)
    REFERENCES Estudante (id_estudante),
    FOREIGN KEY (fk_host)
   REFERENCES Host_family (id_host_family));