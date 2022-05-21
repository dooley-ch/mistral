-- *******************************************************************************************
-- **  File:  postgresql-legacy.sql
-- **  Description: Creates the legacy database
-- **  Created: 11-03-2020
-- **
-- **  History:
-- **  11-08-2020: Initial version
-- **
-- *******************************************************************************************


CREATE  TABLE artist (
	"ID"                 serial  NOT NULL ,
	name                 varchar(100)  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_artist_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE employee (
	"ID"                 serial  NOT NULL ,
	title                varchar(25)   ,
	first_name           varchar(30)  NOT NULL ,
	last_name            varchar(60)  NOT NULL ,
	date_of_birth        date   ,
	hire_date            date  NOT NULL ,
	address              varchar(50)  NOT NULL ,
	city                 varchar(30)  NOT NULL ,
	"state"              varchar(12)   ,
	country              varchar(25)   ,
	post_code            varchar(12)   ,
	phone                varchar(25)   ,
	fax                  varchar(25)   ,
	email                varchar(50)  NOT NULL ,
	manager_id           integer   ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_employee_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Idx_employee_email" UNIQUE ( email ) ,
	CONSTRAINT "Fk_employee_employee" FOREIGN KEY ( manager_id ) REFERENCES employee( "ID" )
 );

CREATE INDEX "Idx_employee_manager_id" ON employee ( manager_id );

CREATE  TABLE genre (
	"ID"                 serial  NOT NULL ,
	name                 varchar(30)  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_genre_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE media_type (
	"ID"                 serial  NOT NULL ,
	name                 varchar(40)  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_media_type_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE playlist (
	"ID"                 serial  NOT NULL ,
	name                 varchar(40)  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_playlist_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE "version" (
	"ID"                 serial  NOT NULL ,
	major                smallint DEFAULT 1 NOT NULL ,
	minor                smallint DEFAULT 0 NOT NULL ,
	build                smallint DEFAULT 1 NOT NULL ,
	CONSTRAINT "Pk_version_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE album (
	"ID"                 serial  NOT NULL ,
	title                varchar(120)  NOT NULL ,
	artist_id            integer  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_album_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Fk_album_artist" FOREIGN KEY ( artist_id ) REFERENCES artist( "ID" )
 );

CREATE INDEX "Idx_album_artist_id" ON album ( artist_id );

CREATE  TABLE customer (
	"ID"                 serial  NOT NULL ,
	first_name           varchar(30)  NOT NULL ,
	last_name            varchar(60)  NOT NULL ,
	company              varchar(60)   ,
	address              varchar(50)  NOT NULL ,
	city                 varchar(30)  NOT NULL ,
	"state"              varchar(12)   ,
	country              varchar(25)  NOT NULL ,
	post_code            varchar(12)   ,
	phone                varchar(25)   ,
	fax                  varchar(25)   ,
	email                varchar(50)  NOT NULL ,
	support_rep_id       integer   ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_customer_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_customer_email" UNIQUE ( email ) ,
	CONSTRAINT "Fk_customer_employee" FOREIGN KEY ( support_rep_id ) REFERENCES employee( "ID" )
 );

CREATE INDEX "Idx_customer_support_rep_id" ON customer ( support_rep_id );

CREATE  TABLE invoice (
	"ID"                 serial  NOT NULL ,
	invoice_date         date  NOT NULL ,
	address              varchar(50)  NOT NULL ,
	city                 varchar(25)  NOT NULL ,
	"state"              varchar(12)   ,
	country              varchar(30)  NOT NULL ,
	post_code            varchar(12)   ,
	total                decimal  NOT NULL ,
	customer_id          integer  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_invoice_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Fk_invoice_customer" FOREIGN KEY ( customer_id ) REFERENCES customer( "ID" )
 );

CREATE INDEX "Idx_invoice_customer_id" ON invoice ( customer_id );

CREATE  TABLE track (
	"ID"                 serial  NOT NULL ,
	name                 varchar(150)  NOT NULL ,
	composer             varchar(200)   ,
	milliseconds         integer   ,
	bytes                integer   ,
	unit_price           decimal  NOT NULL ,
	album_id             integer  NOT NULL ,
	media_type_id        integer  NOT NULL ,
	genre_id             integer  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_track_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Fk_track_album" FOREIGN KEY ( album_id ) REFERENCES album( "ID" )  ,
	CONSTRAINT "Fk_track_media_type" FOREIGN KEY ( media_type_id ) REFERENCES media_type( "ID" )  ,
	CONSTRAINT "Fk_track_genre" FOREIGN KEY ( genre_id ) REFERENCES genre( "ID" )
 );

CREATE INDEX "Idx_track_album_id" ON track ( album_id );

CREATE INDEX "Idx_track_media_type_id" ON track ( media_type_id );

CREATE INDEX "Idx_track_genre_id" ON track ( genre_id );

CREATE  TABLE invoice_item (
	"ID"                 serial  NOT NULL ,
	quantity             integer  NOT NULL ,
	unit_price           decimal  NOT NULL ,
	track_id             integer  NOT NULL ,
	invoice_id           integer  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_invoice_item_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Fk_invoice_item_track" FOREIGN KEY ( track_id ) REFERENCES track( "ID" )  ,
	CONSTRAINT "Fk_invoice_item_invoice" FOREIGN KEY ( invoice_id ) REFERENCES invoice( "ID" )
 );

CREATE INDEX "Idx_invoice_item_track_id" ON invoice_item ( track_id );

CREATE INDEX "Idx_invoice_item_invoice_id" ON invoice_item ( invoice_id );

CREATE  TABLE playlist_track (
	"ID"                 serial  NOT NULL ,
	playlist_id          integer  NOT NULL ,
	track_id             integer  NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_playlist_track_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_playlist_track_playlist_id_track_id" UNIQUE ( playlist_id, track_id ) ,
	CONSTRAINT "Fk_playlist_track_playlist" FOREIGN KEY ( playlist_id ) REFERENCES playlist( "ID" )  ,
	CONSTRAINT "Fk_playlist_track_track" FOREIGN KEY ( track_id ) REFERENCES track( "ID" )
 );

CREATE INDEX "Idx_playlist_track_playlist_id" ON playlist_track ( playlist_id );

CREATE INDEX "Idx_playlist_track_track_id" ON playlist_track ( track_id );
