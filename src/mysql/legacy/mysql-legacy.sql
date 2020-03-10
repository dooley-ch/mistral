-- *******************************************************************************************
-- **  File:  mysql-legacy.sql
-- **  Description: Creates the preferred database
-- **  Created: 10-03-2020
-- **
-- **  History:
-- **  10-08-2020: Initial version
-- **
-- *******************************************************************************************

USE mistral_legacy;

CREATE TABLE artist (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(100)  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE employee (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	title                varchar(25)      ,
	first_name           varchar(30)  NOT NULL    ,
	last_name            varchar(60)  NOT NULL    ,
	date_of_birth        date      ,
	hire_date            date  NOT NULL    ,
	address              varchar(50)  NOT NULL    ,
	city                 varchar(30)  NOT NULL    ,
	state                varchar(12)      ,
	country              varchar(25)      ,
	post_code            varchar(12)      ,
	phone                varchar(25)      ,
	fax                  varchar(25)      ,
	email                varchar(50)  NOT NULL    ,
	manager_id           int      ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Idx_employee_email` UNIQUE ( email ) ,
	CONSTRAINT `Fk_employee_employee` FOREIGN KEY ( manager_id ) REFERENCES employee( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_employee_manager_id` ON employee ( manager_id );

CREATE TABLE genre (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(30)  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE media_type (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(40)  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE playlist (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(40)  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE version (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	major                tinyint  NOT NULL DEFAULT 1   ,
	minor                smallint  NOT NULL DEFAULT 0   ,
	build                smallint  NOT NULL DEFAULT 1
 );

CREATE TABLE album (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	title                varchar(120)  NOT NULL    ,
	artist_id            int  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Fk_album_artist` FOREIGN KEY ( artist_id ) REFERENCES artist( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_album_artist_id` ON album ( artist_id );

CREATE TABLE customer (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	first_name           varchar(30)  NOT NULL    ,
	last_name            varchar(60)  NOT NULL    ,
	company              varchar(60)      ,
	address              varchar(50)  NOT NULL    ,
	city                 varchar(30)  NOT NULL    ,
	state                varchar(12)      ,
	country              varchar(25)  NOT NULL    ,
	post_code            varchar(12)      ,
	phone                varchar(25)      ,
	fax                  varchar(25)      ,
	email                varchar(50)  NOT NULL    ,
	support_rep_id       int      ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Uk_customer_email` UNIQUE ( email ) ,
	CONSTRAINT `Fk_customer_employee` FOREIGN KEY ( support_rep_id ) REFERENCES employee( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_customer_support_rep_id` ON customer ( support_rep_id );

CREATE TABLE invoice (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	invoice_date         datetime  NOT NULL    ,
	address              varchar(50)  NOT NULL    ,
	city                 varchar(25)  NOT NULL    ,
	state                varchar(12)      ,
	country              varchar(30)  NOT NULL    ,
	post_code            varchar(12)      ,
	total                decimal  NOT NULL    ,
	customer_id          int  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Fk_invoice_customer` FOREIGN KEY ( customer_id ) REFERENCES customer( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_invoice_customer_id` ON invoice ( customer_id );

CREATE TABLE track (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	name                 varchar(150)  NOT NULL    ,
	composer             varchar(200)      ,
	milliseconds         int      ,
	bytes                int      ,
	unit_price           decimal  NOT NULL    ,
	album_id             int  NOT NULL    ,
	media_type_id        int  NOT NULL    ,
	genre_id             int  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Fk_track_album` FOREIGN KEY ( album_id ) REFERENCES album( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `Fk_track_media_type` FOREIGN KEY ( media_type_id ) REFERENCES media_type( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `Fk_track_genre` FOREIGN KEY ( genre_id ) REFERENCES genre( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_track_album_id` ON track ( album_id );

CREATE INDEX `Idx_track_media_type_id` ON track ( media_type_id );

CREATE INDEX `Idx_track_genre_id` ON track ( genre_id );

CREATE TABLE invoice_item (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	quantity             int  NOT NULL    ,
	unit_price           decimal  NOT NULL    ,
	track_id             int  NOT NULL    ,
	invoice_id           int  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Fk_invoice_item_track` FOREIGN KEY ( track_id ) REFERENCES track( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `Fk_invoice_item_invoice` FOREIGN KEY ( invoice_id ) REFERENCES invoice( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_invoice_item_track_id` ON invoice_item ( track_id );

CREATE INDEX `Idx_invoice_item_invoice_id` ON invoice_item ( invoice_id );

CREATE TABLE playlist_track (
	`ID`                 int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	playlist_id          int  NOT NULL    ,
	track_id             int  NOT NULL    ,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT `Uk_playlist_track_playlist_id_track_id` UNIQUE ( playlist_id, track_id ) ,
	CONSTRAINT `Fk_playlist_track_playlist` FOREIGN KEY ( playlist_id ) REFERENCES playlist( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `Fk_playlist_track_track` FOREIGN KEY ( track_id ) REFERENCES track( `ID` ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE INDEX `Idx_playlist_track_playlist_id` ON playlist_track ( playlist_id );

CREATE INDEX `Idx_playlist_track_track_id` ON playlist_track ( track_id );
