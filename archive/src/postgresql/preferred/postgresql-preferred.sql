-- *******************************************************************************************
-- **  File:  postgresql-preferred.sql
-- **  Description: Creates the preferred database
-- **  Created: 08-03-2020
-- **
-- **  History:
-- **  11-08-2020: Initial version
-- **
-- *******************************************************************************************

CREATE  TABLE application (
	"ID"                 serial  NOT NULL ,
	"key"                char(3)  NOT NULL ,
	name                 varchar(100)  NOT NULL ,
	comments             text   ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_application_id" PRIMARY KEY ( "ID" ),
	CONSTRAINT uk_application UNIQUE ( "key" )
 );

ALTER TABLE application ADD CONSTRAINT "Cns_application_key" CHECK ( key IS NOT NULL OR LENGTH(key) = 3 );

ALTER TABLE application ADD CONSTRAINT "Cns_application_name" CHECK (name IS NOT NULL OR LENGTH(name) >= 5 );

CREATE  TABLE artist (
	"ID"                 serial  NOT NULL ,
	name                 varchar(100)  NOT NULL ,
	name_lower           varchar(100)  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_artist_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_artist_name" UNIQUE ( name_lower )
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_employee_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Idx_employee_email" UNIQUE ( email ) ,
	CONSTRAINT "Fk_employee_employee" FOREIGN KEY ( manager_id ) REFERENCES employee( "ID" )
 );

CREATE INDEX "Idx_employee_manager_id" ON employee ( manager_id );

CREATE  TABLE genre (
	"ID"                 serial  NOT NULL ,
	name                 varchar(30)  NOT NULL ,
	name_lower           varchar(30)  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_genre_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_genre_name" UNIQUE ( name_lower )
 );

CREATE  TABLE log (
	"ID"                 bigserial  NOT NULL ,
	app_id               integer  NOT NULL ,
	entry_type           varchar(10)  NOT NULL ,
	logged_at            timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	message              text  NOT NULL ,
	method_name          varchar(100)   ,
	stack                text   ,
	extra                text   ,
	CONSTRAINT "Pk_log_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT fk_log_application FOREIGN KEY ( app_id ) REFERENCES application( "ID" )
 );

ALTER TABLE log ADD CONSTRAINT "Cns_log_entry_type" CHECK ( entry_type IN ('INFO', 'WARNING', 'ERROR', 'FATAL', 'DEBUG') );

CREATE  TABLE media_type (
	"ID"                 serial  NOT NULL ,
	name                 varchar(40)  NOT NULL ,
	name_lower           varchar(40)  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_media_type_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_media_type_name" UNIQUE ( name_lower )
 );

CREATE  TABLE playlist (
	"ID"                 serial  NOT NULL ,
	name                 varchar(40)  NOT NULL ,
	name_lower           varchar(40)  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_playlist_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_playlist_name" UNIQUE ( name_lower )
 );

CREATE  TABLE setup (
	"ID"                 serial  NOT NULL ,
	"key"                varchar(20)  NOT NULL ,
	"value"              varchar(300)  NOT NULL ,
	data_type            varchar(20)  NOT NULL ,
	app_id               integer  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_setup_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT fk_setup_application FOREIGN KEY ( app_id ) REFERENCES application( "ID" ) ON DELETE CASCADE ON UPDATE CASCADE
 );

CREATE  TABLE user_setup (
	"ID"                 serial  NOT NULL ,
	"key"                varchar(20)  NOT NULL ,
	"value"              varchar(300)  NOT NULL ,
	data_type            varchar(20)  NOT NULL ,
	usr                  varchar(30)  NOT NULL ,
	app_id               integer  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_user_setup_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT fk_setup_application_0 FOREIGN KEY ( app_id ) REFERENCES application( "ID" ) ON DELETE CASCADE ON UPDATE CASCADE
 );

CREATE  TABLE "version" (
	"ID"                 serial  NOT NULL ,
	major                smallint DEFAULT 1 NOT NULL ,
	minor                smallint DEFAULT 0 NOT NULL ,
	build                smallint DEFAULT 1 NOT NULL ,
	started_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	ended_at             timestamp   ,
	status               varchar(10) DEFAULT 'STARTED' NOT NULL ,
	comments             text   ,
	CONSTRAINT "Pk_version_ID" PRIMARY KEY ( "ID" )
 );

ALTER TABLE "version" ADD CONSTRAINT "Cns_version_status" CHECK ( status in ('STARTED', 'RUNNING', 'ENDED', 'FAILED') );

CREATE  TABLE xxx_album (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  varchar   ,
	title                varchar(120)   ,
	title_lower          varchar(120)   ,
	artist_id            integer   ,
	CONSTRAINT "Pk_xxx_album_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_application (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	"key"                char(3)   ,
	name                 varchar(100)   ,
	comments             text   ,
	CONSTRAINT "Pk_xxx_application_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_artist (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	name                 varchar(100)   ,
	name_lower           varchar(100)   ,
	CONSTRAINT "Pk_xxx_artist_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_customer (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	first_name           varchar(30)   ,
	last_name            varchar(60)   ,
	company              varchar(60)   ,
	address              varchar(50)   ,
	city                 varchar(30)   ,
	"state"              varchar(12)   ,
	country              varchar(25)   ,
	post_code            varchar(12)   ,
	phone                varchar(25)   ,
	fax                  varchar(25)   ,
	email                varchar(50)   ,
	support_rep_id       integer   ,
	CONSTRAINT "Pk_xxx_customer_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_employee (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	title                varchar(25)   ,
	first_name           varchar(30)   ,
	last_name            varchar(60)   ,
	address              varchar(50)   ,
	city                 varchar(30)   ,
	"state"              varchar(12)  NOT NULL ,
	country              varchar(25)   ,
	post_code            varchar(12)   ,
	phone                varchar(25)   ,
	fax                  varchar(25)   ,
	email                varchar(50)   ,
	manager_id           integer   ,
	CONSTRAINT "Pk_xxx_employee_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_genre (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	name                 varchar(30)   ,
	name_lower           varchar(30)   ,
	CONSTRAINT "Pk_xxx_genre_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_invoice (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	invoice_date         date   ,
	address              varchar(50)   ,
	city                 varchar(25)   ,
	"state"              varchar(12)   ,
	country              varchar(30)   ,
	post_code            varchar(12)   ,
	total                decimal   ,
	customer_id          integer   ,
	CONSTRAINT "Pk_xxx_invoice_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_invoice_item (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	invoice_id           integer   ,
	track_id             integer   ,
	unit_price           decimal   ,
	quantity             integer   ,
	CONSTRAINT "Pk_xxx_invoice_id_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_media_type (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	name                 varchar(40)   ,
	name_lower           varchar(40)   ,
	CONSTRAINT "Pk_xxx_media_type_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_playlist (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	name                 varchar(40)   ,
	name_lower           varchar(40)   ,
	CONSTRAINT "Pk_xxx_play_list_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_playlist_track (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	playlist_id          integer   ,
	track_id             integer   ,
	CONSTRAINT "Pk_xxx_playlist_track_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE xxx_track (
	"ID"                 bigserial  NOT NULL ,
	changed_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	"action"             char(1)  NOT NULL ,
	record_id            integer  NOT NULL ,
	version_id           smallint  NOT NULL ,
	usr                  varchar(30)   ,
	app                  integer   ,
	name                 varchar(150)   ,
	composers            varchar(200)   ,
	milliseconds         integer   ,
	bytes                integer   ,
	unit_price           decimal   ,
	album_id             integer   ,
	media_type_id        integer   ,
	genre_id             integer   ,
	CONSTRAINT "Pk_xxx_track_ID" PRIMARY KEY ( "ID" )
 );

CREATE  TABLE activity_log (
	"ID"                 bigserial  NOT NULL ,
	app_id               integer  NOT NULL ,
	message              text  NOT NULL ,
	CONSTRAINT "Pk_activity_log_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT fk_activity_log_application FOREIGN KEY ( app_id ) REFERENCES application( "ID" ) ON DELETE CASCADE ON UPDATE CASCADE
 );

CREATE  TABLE album (
	"ID"                 serial  NOT NULL ,
	title                varchar(120)  NOT NULL ,
	title_lower          varchar(120)  NOT NULL ,
	artist_id            integer  NOT NULL ,
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_album_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_album_title" UNIQUE ( title_lower ) ,
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
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
	"version"            smallint DEFAULT 1 NOT NULL ,
	created_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	updated_at           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	CONSTRAINT "Pk_playlist_track_ID" PRIMARY KEY ( "ID" ),
	CONSTRAINT "Uk_playlist_track_playlist_id_track_id" UNIQUE ( playlist_id, track_id ) ,
	CONSTRAINT "Fk_playlist_track_playlist" FOREIGN KEY ( playlist_id ) REFERENCES playlist( "ID" )  ,
	CONSTRAINT "Fk_playlist_track_track" FOREIGN KEY ( track_id ) REFERENCES track( "ID" )
 );

CREATE INDEX "Idx_playlist_track_playlist_id" ON playlist_track ( playlist_id );

CREATE INDEX "Idx_playlist_track_track_id" ON playlist_track ( track_id );
