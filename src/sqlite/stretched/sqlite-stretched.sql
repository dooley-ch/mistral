-- *******************************************************************************************
-- **  File:  sqlite-stretched.sql
-- **  Description: Creates the stretched database
-- **  Created: 08-03-2020
-- **
-- **  History:
-- **  08-08-2020: Initial version
-- **
-- *******************************************************************************************

CREATE TABLE artist (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	name                 text NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE employee (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	title                text     ,
	first_name           text NOT NULL    ,
	last_name            text NOT NULL    ,
	emp_pic              blob     ,
	date_of_birth        date     ,
	hire_date            date NOT NULL    ,
	address              text NOT NULL    ,
	city                 text NOT NULL    ,
	state                text     ,
	country              text     ,
	post_code            text     ,
	phone                text     ,
	fax                  text     ,
	email                text NOT NULL    ,
	manager_id           integer     ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT Idx_employee_email UNIQUE ( email ) ,
	FOREIGN KEY ( manager_id ) REFERENCES employee( ID )
 );

CREATE INDEX Idx_employee_manager_id ON employee ( manager_id );

CREATE TABLE genre (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	name                 text NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE media_type (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	name                 text NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE playlist (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	name                 text NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE album (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	title                text NOT NULL    ,
	artist_id            integer NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( artist_id ) REFERENCES artist( ID )
 );

CREATE INDEX Idx_album_artist_id ON album ( artist_id );

CREATE TABLE customer (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	title                text     ,
	first_name           text NOT NULL    ,
	last_name            text NOT NULL    ,
	cust_pic             blob     ,
	company              text     ,
	address              text NOT NULL    ,
	city                 text NOT NULL    ,
	state                text     ,
	country              text NOT NULL    ,
	post_code            text     ,
	phone                text     ,
	fax                  text     ,
	email                text NOT NULL    ,
	support_rep_id       integer     ,
	commission           real     ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT Uk_customer_email UNIQUE ( email ) ,
	FOREIGN KEY ( support_rep_id ) REFERENCES employee( ID )
 );

CREATE INDEX Idx_customer_support_rep_id ON customer ( support_rep_id );

CREATE TABLE invoice (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	invoice_date         datetime NOT NULL    ,
	address              text NOT NULL    ,
	city                 text NOT NULL    ,
	state                text     ,
	country              text NOT NULL    ,
	post_code            text     ,
	total                integer NOT NULL    ,
	customer_id          integer NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( customer_id ) REFERENCES customer( ID )
 );

CREATE INDEX Idx_invoice_customer_id ON invoice ( customer_id );

CREATE TABLE track (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	name                 text NOT NULL    ,
	composer             text     ,
	milliseconds         integer     ,
	bytes                integer     ,
	unit_price           integer NOT NULL    ,
	album_id             integer NOT NULL    ,
	media_type_id        integer NOT NULL    ,
	genre_id             integer NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( album_id ) REFERENCES album( ID )  ,
	FOREIGN KEY ( media_type_id ) REFERENCES media_type( ID )  ,
	FOREIGN KEY ( genre_id ) REFERENCES genre( ID )
 );

CREATE INDEX Idx_track_album_id ON track ( album_id );

CREATE INDEX Idx_track_media_type_id ON track ( media_type_id );

CREATE INDEX Idx_track_genre_id ON track ( genre_id );

CREATE TABLE invoice_item (
	ID                   integer NOT NULL  PRIMARY KEY autoincrement ,
	quantity             integer NOT NULL    ,
	unit_price           integer NOT NULL    ,
	track_id             integer NOT NULL    ,
	invoice_id           integer NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( track_id ) REFERENCES track( ID )  ,
	FOREIGN KEY ( invoice_id ) REFERENCES invoice( ID )
 );

CREATE INDEX Idx_invoice_item_track_id ON invoice_item ( track_id );

CREATE INDEX Idx_invoice_item_invoice_id ON invoice_item ( invoice_id );

CREATE TABLE playlist_track (
	playlist_id          integer NOT NULL    ,
	track_id             integer NOT NULL    ,
	updated_at           text NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT Uk_playlist_track_playlist_id_track_id UNIQUE ( playlist_id, track_id ) ,
	CONSTRAINT Idx_playlist_track PRIMARY KEY ( playlist_id, track_id ),
	FOREIGN KEY ( playlist_id ) REFERENCES playlist( ID )  ,
	FOREIGN KEY ( track_id ) REFERENCES track( ID )
 );

CREATE INDEX Idx_playlist_track_playlist_id ON playlist_track ( playlist_id );

CREATE INDEX Idx_playlist_track_track_id ON playlist_track ( track_id );

