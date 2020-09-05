BEGIN TRANSACTION;


CREATE TYPE tipo_telefone AS ENUM ('Fixo', 'Celular', 'Comercial', 'Recado');
CREATE TYPE tipo_mail AS ENUM ('Particular', 'Comercial');


CREATE TABLE IF NOT EXISTS usuario (
    "id_usuario" serial NOT NULL PRIMARY KEY,
    "data_reg" date NOT NULL,
    "nome" varchar(50) NOT NULL,
    "email" varchar(60) NOT NULL UNIQUE,
    "senha" char(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS agenda (
    "id_agenda" serial NOT NULL PRIMARY KEY,
    "id_usuario" int NOT NULL,
    "data_reg" date NOT NULL,
    "tipo_agenda" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS contato (
    "id_contato" serial NOT NULL PRIMARY KEY,
    "id_agenda" int NOT NULL,
    "data_reg" date NOT NULL,
    "nome" varchar(50) NOT NULL,
    "descricao" text NULL
);

CREATE TABLE IF NOT EXISTS contato_telefone (
    "id_telefone" serial NOT NULL PRIMARY KEY,
    "id_contato" int NOT NULL,
    "numero_tel" varchar(11) NULL,
    "tipo_tel" tipo_telefone
);

CREATE TABLE IF NOT EXISTS contato_email (
    "id_email" serial NOT NULL PRIMARY KEY,
    "id_contato" int NOT NULL,
	"email" varchar(60) NOT NULL,
	"tipo_email" tipo_mail
);

CREATE TABLE IF NOT EXISTS contato_endereco (
    "id_end" serial NOT NULL PRIMARY KEY,
    "id_contato" int NOT NULL,
    "cep" char(8) NOT NULL,
    "logradouro" varchar(50) NOT NULL,
    "numero" int NULL,
    "complemento" varchar(40) NULL,
    "bairro" varchar(40) NOT NULL,
    "cidade" varchar(40) NOT NULL,
    "estado" char(2) NOT NULL,
    "pais" char(2) NOT NULL
);


ALTER TABLE "agenda"
    ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "contato"
    ADD FOREIGN KEY ("id_agenda") REFERENCES "agenda" ("id_agenda") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "contato_telefone"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "contato_email"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "contato_endereco"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;


COMMIT;