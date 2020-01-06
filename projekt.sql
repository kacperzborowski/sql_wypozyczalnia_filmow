-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/KVkjRY7M2EKurLwBqBy4Dg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "uzytkownicy" (
    "uzytkownik_id" tinyint  NOT NULL ,
    "nazwa_uzytkownika" varchar(10)  NOT NULL ,
    "haslo" password  NOT NULL ,
    "ulubione_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_uzytkownicy" PRIMARY KEY (
        "uzytkownik_id"
    )
)

GO

CREATE TABLE "film" (
    "film_id" tinyint  NOT NULL ,
    "zdj" img  NOT NULL ,
    "opis" varchar(150)  NOT NULL ,
    "rok_powstania" year  NOT NULL ,
    "rezyser_id" tinyint  NOT NULL ,
    "scenariusz" varchar(100)  NOT NULL ,
    "gatunek_id" tinyint  NOT NULL ,
    "obsada_id" tinyint  NOT NULL ,
    "premiera" date  NOT NULL ,
    "dl_trwania" varchar(5)  NOT NULL ,
    "ocena_film_id" tinyint  NOT NULL ,
    "jezyk_id" tinyint  NOT NULL ,
    "nagrody_id" tinyint  NOT NULL ,
    "recenzja_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_film" PRIMARY KEY (
        "film_id"
    )
)

GO

CREATE TABLE "serial" (
    "serial_id" tinyint  NOT NULL ,
    "zdj" img  NOT NULL ,
    "opis" varchar(150)  NOT NULL ,
    "rok_powstania" year  NOT NULL ,
    "rezyser_id" tinyint  NOT NULL ,
    "scenariusz" varchar(100)  NOT NULL ,
    "gatunek_id" tinyint  NOT NULL ,
    "obsada_id" tinyint  NOT NULL ,
    "premiera" date  NOT NULL ,
    "dl_trwania" varchar(5)  NOT NULL ,
    "ocena_serial_id" tinyint  NOT NULL ,
    "jezyk_id" tinyint  NOT NULL ,
    "nagrody_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_serial" PRIMARY KEY (
        "serial_id"
    )
)

GO

CREATE TABLE "gatunek" (
    "gatunek_id" tinyint  NOT NULL ,
    "nazwa_gatunku" varchar(20)  NOT NULL ,
    "gatunek_powiazany" varchar(15)  NOT NULL ,
    CONSTRAINT "pk_gatunek" PRIMARY KEY (
        "gatunek_id"
    )
)

GO

CREATE TABLE "rezyser" (
    "rezyser_id" tinyint  NOT NULL ,
    "imie" varchar(10)  NOT NULL ,
    "nazwisko" varchar(10)  NOT NULL ,
    "kraj_pochodzenia" varchar(10)  NOT NULL ,
    "biografia" varchar(50)  NOT NULL ,
    "znany_z_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_rezyser" PRIMARY KEY (
        "rezyser_id"
    )
)

GO

CREATE TABLE "znany_z" (
    "znany_z_id" tinyint  NOT NULL ,
    "film_id" tinyint  NOT NULL ,
    "serial_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_znany_z" PRIMARY KEY (
        "znany_z_id"
    )
)

GO

CREATE TABLE "obsada" (
    "obsada_id" tinyint  NOT NULL ,
    "imie_aktor" varchar(20)  NOT NULL ,
    "nazwisko_aktor" varchar(20)  NOT NULL ,
    "postac" varchar(20)  NOT NULL ,
    "pochodzenie" varchar(10)  NOT NULL ,
    "ocena_aktor_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_obsada" PRIMARY KEY (
        "obsada_id"
    )
)

GO

CREATE TABLE "jezyk" (
    "jezyk_id" tinyint  NOT NULL ,
    "nazwa" varchar(10)  NOT NULL ,
    "napisy" bool  NOT NULL ,
    CONSTRAINT "pk_jezyk" PRIMARY KEY (
        "jezyk_id"
    )
)

GO

CREATE TABLE "ocena_film" (
    "ocena_film_id" tinyint  NOT NULL ,
    "ile" tinyint  NOT NULL ,
    "uzytkownik_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_ocena_film" PRIMARY KEY (
        "ocena_film_id"
    )
)

GO

CREATE TABLE "ocena_serial" (
    "ocena_serial_id" tinyint  NOT NULL ,
    "ile" tinyint  NOT NULL ,
    "uzytkownik_id" tinyint  NOT NULL ,
    CONSTRAINT "pk_ocena_serial" PRIMARY KEY (
        "ocena_serial_id"
    )
)

GO

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "film" ADD CONSTRAINT "fk_film_rezyser_id" FOREIGN KEY("rezyser_id")
REFERENCES "rezyser" ("rezyser_id")
GO

ALTER TABLE "film" ADD CONSTRAINT "fk_film_gatunek_id" FOREIGN KEY("gatunek_id")
REFERENCES "gatunek" ("gatunek_id")
GO

ALTER TABLE "film" ADD CONSTRAINT "fk_film_obsada_id" FOREIGN KEY("obsada_id")
REFERENCES "obsada" ("obsada_id")
GO

ALTER TABLE "film" ADD CONSTRAINT "fk_film_ocena_film_id" FOREIGN KEY("ocena_film_id")
REFERENCES "ocena_film" ("ocena_film_id")
GO

ALTER TABLE "film" ADD CONSTRAINT "fk_film_jezyk_id" FOREIGN KEY("jezyk_id")
REFERENCES "jezyk" ("jezyk_id")
GO

ALTER TABLE "film" ADD CONSTRAINT "fk_film_nagrody_id" FOREIGN KEY("nagrody_id")
REFERENCES "Table 12" ("...")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_rezyser_id" FOREIGN KEY("rezyser_id")
REFERENCES "rezyser" ("rezyser_id")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_gatunek_id" FOREIGN KEY("gatunek_id")
REFERENCES "gatunek" ("gatunek_id")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_obsada_id" FOREIGN KEY("obsada_id")
REFERENCES "obsada" ("obsada_id")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_ocena_serial_id" FOREIGN KEY("ocena_serial_id")
REFERENCES "ocena_serial" ("ocena_serial_id")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_jezyk_id" FOREIGN KEY("jezyk_id")
REFERENCES "jezyk" ("jezyk_id")
GO

ALTER TABLE "serial" ADD CONSTRAINT "fk_serial_nagrody_id" FOREIGN KEY("nagrody_id")
REFERENCES "Table 12" ("...")
GO

ALTER TABLE "ocena_film" ADD CONSTRAINT "fk_ocena_film_uzytkownik_id" FOREIGN KEY("uzytkownik_id")
REFERENCES "uzytkownicy" ("uzytkownik_id")
GO

ALTER TABLE "ocena_serial" ADD CONSTRAINT "fk_ocena_serial_uzytkownik_id" FOREIGN KEY("uzytkownik_id")
REFERENCES "uzytkownicy" ("uzytkownik_id")
GO

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.



