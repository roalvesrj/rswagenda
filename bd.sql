

CREATE TYPE tipo_tel AS ENUM ('Fixo', 'Celular', 'Comercial', 'Recado');
CREATE TYPE tipo_email AS ENUM ('Particular', 'Comercial');

CREATE TABLE IF NOT EXISTS usuario (
	"id_usuario" serial not null,
	"data_reg_usuario" date not null,
	"email" tipo_email,
	"nome" varchar(60) not null,
	"senha" char(60) not null,
	primary key ("id_usuario"),
	unique ("email")
);

CREATE TABLE IF NOT EXISTS agenda (
    "id_agenda" serial not null,
    "id_usuario" int NOT NULL,
	"data_reg_agenda" date not null,
	"tipo_agenda" varchar(60) not null,
	primary key ("id_agenda")	
);

CREATE TABLE IF NOT EXISTS contato (
    "id_contato" serial not null,
    "id_agenda" int NOT NULL,
	"data_reg_contato" date not null,
	"nome" varchar(60) not null,
	"descricao" varchar(60) not null,
	primary key ("id_contato")
);

CREATE TABLE IF NOT EXISTS email_contato (
    "id_email_contato" serial not null,
    "id_contato" int NOT NULL,
	"email" varchar(60) not null,
    "tipo_email" tipo_email,
	primary key ("id_email_contato")	
);

CREATE TABLE IF NOT EXISTS tel_contato (
    "id_tel_contato" serial not null,
    "id_contato" int NOT NULL,
	"tel" varchar(11) not null,
    "tipo_tel" tipo_tel,
	primary key ("id_tel_contato")	
);

CREATE TABLE if not EXISTS end_contato (
    "id_end_contato" serial not null,
    "id_contato" int NOT NULL,
    "cep" char(8) NOT NULL,
	"logradouro" varchar(60) NOT NULL,
	"numero" int NULL,
	"complemento" varchar(60) NULL,
	"bairro" varchar(60) NOT NULL,
	"cidade" varchar(60) NOT NULL,
	"estado" char(2) NOT NULL,
    "pais" varchar(60) NULL,
    PRIMARY KEY ("id_end_contato")
);

ALTER TABLE "agenda"
    ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "contato"
    ADD FOREIGN KEY ("id_agenda") REFERENCES "agenda" ("id_agenda") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "email_contato"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "tel_contato"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "end_contato"
    ADD FOREIGN KEY ("id_contato") REFERENCES "contato" ("id_contato") ON UPDATE CASCADE ON DELETE CASCADE;


