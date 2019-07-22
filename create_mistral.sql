CREATE TABLE artist ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	name                 text  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT Uk_artist_name UNIQUE ( name ) 
 );

CREATE UNIQUE INDEX Pk_BaseTable_0_ID ON artist ( ID );

CREATE TABLE employee ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	title                text   ,
	first_name           text  NOT NULL ,
	last_name            text  NOT NULL ,
	date_of_birth        date   ,
	hire_date            date  NOT NULL ,
	address              text  NOT NULL ,
	city                 text  NOT NULL ,
	state                text   ,
	country              text   ,
	post_code            text   ,
	phone                text   ,
	fax                  text   ,
	email                text  NOT NULL ,
	manager_id           integer   ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY ( manager_id ) REFERENCES employee( ID )  
 );

CREATE UNIQUE INDEX Pk_employee_ID ON employee ( ID );

CREATE INDEX Idx_employee_manager_id ON employee ( manager_id );

CREATE TABLE genre ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	name                 text  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT Uk_genre_name UNIQUE ( name ) 
 );

CREATE UNIQUE INDEX Pk_genre_ID ON genre ( ID );

CREATE TABLE media_type ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	name                 text  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT Uk_media_type_name UNIQUE ( name ) 
 );

CREATE UNIQUE INDEX Pk_media_type_ID ON media_type ( ID );

CREATE TABLE playlist ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	name                 text  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
 );

CREATE UNIQUE INDEX Pk_playlist_ID ON playlist ( ID );

CREATE TABLE album ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	title                text  NOT NULL ,
	artist_id            integer  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT Uk_album_title UNIQUE ( title ) ,
	FOREIGN KEY ( artist_id ) REFERENCES artist( ID )  
 );

CREATE UNIQUE INDEX Pk_album_ID ON album ( ID );

CREATE INDEX Idx_album_artist_id ON album ( artist_id );

CREATE TABLE customer ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	first_name           text  NOT NULL ,
	last_name            text  NOT NULL ,
	company              text   ,
	address              text  NOT NULL ,
	city                 text  NOT NULL ,
	state                text   ,
	country              text  NOT NULL ,
	post_code            text   ,
	phone                text   ,
	fax                  text   ,
	email                text  NOT NULL ,
	support_rep_id       integer   ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY ( support_rep_id ) REFERENCES employee( ID )  
 );

CREATE UNIQUE INDEX Pk_customer_ID ON customer ( ID );

CREATE INDEX Idx_customer_support_rep_id ON customer ( support_rep_id );

CREATE TABLE invoice ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	invoice_date         datetime  NOT NULL ,
	address              text  NOT NULL ,
	city                 text  NOT NULL ,
	state                text   ,
	country              text  NOT NULL ,
	post_code            text   ,
	total                text  NOT NULL ,
	customer_id          integer  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY ( customer_id ) REFERENCES customer( ID )  
 );

CREATE UNIQUE INDEX Pk_invoice_ID ON invoice ( ID );

CREATE INDEX Idx_invoice_customer_id ON invoice ( customer_id );

CREATE TABLE track ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	name                 text  NOT NULL ,
	composer             text   ,
	milliseconds         integer   ,
	bytes                integer   ,
	unit_price           text  NOT NULL ,
	album_id             integer  NOT NULL ,
	media_type_id        integer  NOT NULL ,
	genre_id             integer  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY ( album_id ) REFERENCES album( ID )  ,
	FOREIGN KEY ( media_type_id ) REFERENCES media_type( ID )  ,
	FOREIGN KEY ( genre_id ) REFERENCES genre( ID )  
 );

CREATE UNIQUE INDEX Pk_track_ID ON track ( ID );

CREATE INDEX Idx_track_album_id ON track ( album_id );

CREATE INDEX Idx_track_media_type_id ON track ( media_type_id );

CREATE INDEX Idx_track_genre_id ON track ( genre_id );

CREATE TABLE invoice_item ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	quantity             integer  NOT NULL ,
	unit_price           text  NOT NULL ,
	track_id             integer  NOT NULL ,
	invoice_id           integer  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY ( track_id ) REFERENCES track( ID )  ,
	FOREIGN KEY ( invoice_id ) REFERENCES invoice( ID )  
 );

CREATE UNIQUE INDEX Pk_invoice_item_ID ON invoice_item ( ID );

CREATE INDEX Idx_invoice_item_track_id ON invoice_item ( track_id );

CREATE INDEX Idx_invoice_item_invoice_id ON invoice_item ( invoice_id );

CREATE TABLE playlist_track ( 
	ID                   integer PRIMARY KEY AUTOINCREMENT NOT NULL ,
	playlist_id          integer  NOT NULL ,
	track_id             integer  NOT NULL ,
	version              integer  NOT NULL DEFAULT 1,
	created_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at           timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT Uk_playlist_track_playlist_id_track_id UNIQUE ( playlist_id, track_id ) ,
	FOREIGN KEY ( playlist_id ) REFERENCES playlist( ID )  ,
	FOREIGN KEY ( track_id ) REFERENCES track( ID )  
 );

CREATE UNIQUE INDEX Pk_playlist_track_ID ON playlist_track ( ID );

CREATE INDEX Idx_playlist_track_playlist_id ON playlist_track ( playlist_id );

CREATE INDEX Idx_playlist_track_track_id ON playlist_track ( track_id );
