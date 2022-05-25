-- *******************************************************************************************
-- **  File:  install.sql
-- **  Created: 24-05-2022
-- **
-- **  History:
-- **  24-05-2022: Initial version
-- **
-- *******************************************************************************************

DROP TABLE IF EXISTS invoice_item;
DROP TABLE IF EXISTS invoice;

DROP TABLE IF EXISTS customer;

DROP TABLE IF EXISTS employee;

DROP TABLE IF EXISTS playlist_track;
DROP TABLE IF EXISTS playlist;

DROP TABLE IF EXISTS track;

DROP TABLE IF EXISTS album;

DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS media_type;

DROP TABLE IF EXISTS activity_log;
DROP TABLE IF EXISTS activity_source;
DROP TABLE IF EXISTS activity_type;

DROP TABLE IF EXISTS version_item;
DROP TABLE IF EXISTS "version";

DROP TABLE IF EXISTS xxx_album;
DROP TABLE IF EXISTS xxx_artist;
DROP TABLE IF EXISTS xxx_customer;
DROP TABLE IF EXISTS xxx_employee;
DROP TABLE IF EXISTS xxx_genre;
DROP TABLE IF EXISTS xxx_invoice;
DROP TABLE IF EXISTS xxx_invoice_item;
DROP TABLE IF EXISTS xxx_media_type;
DROP TABLE IF EXISTS xxx_playlist;
DROP TABLE IF EXISTS xxx_playlist_track;
DROP TABLE IF EXISTS xxx_track;


CREATE TABLE "version"(
  id smallint NOT NULL,
  major smallint NOT NULL,
  minor smallint NOT NULL,
  build smallint NOT NULL,
  is_valid boolean NOT NULL DEFAULT false,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT version_pkey PRIMARY KEY(id),
  CONSTRAINT version_build UNIQUE(major, minor, build)
);

INSERT INTO "version"(id, major, minor, build) VALUES (1, 1, 0, 1);


CREATE TABLE version_item(
  id serial NOT NULL,
  step varchar(40) NOT NULL,
  "comment" varchar(500) NOT NULL,
  version_id smallint NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT version_item_pkey PRIMARY KEY(id)
);

ALTER TABLE version_item
  ADD CONSTRAINT version_item_version_id_fkey
    FOREIGN KEY (version_id) REFERENCES "version" (id);


CREATE TABLE activity_source(
  id smallint NOT NULL,
  "name" varchar(50) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT activity_source_pkey PRIMARY KEY(id),
  CONSTRAINT activity_source_name UNIQUE("name")
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'activity_source created', 1);

CREATE TABLE activity_type(
  id smallint NOT NULL,
  "name" varchar(50) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT activity_type_pkey PRIMARY KEY(id),
  CONSTRAINT activity_type_name UNIQUE("name")
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'activity_type created', 1);

CREATE TABLE activity_log(
  id serial NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  message text NOT NULL,
  activity_source_id smallint NOT NULL,
  activity_type_id smallint NOT NULL,
  CONSTRAINT activity_log_pkey PRIMARY KEY(id)
);

ALTER TABLE activity_log
  ADD CONSTRAINT activity_log_activity_source_id_fkey
    FOREIGN KEY (activity_source_id) REFERENCES activity_source (id);

ALTER TABLE activity_log
  ADD CONSTRAINT activity_log_activity_type_id_fkey
    FOREIGN KEY (activity_type_id) REFERENCES activity_type (id);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'activity_log created', 1);

CREATE TABLE artist(
  id serial NOT NULL,
  "name" varchar(100) NOT NULL,
  name_lower varchar(100) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT artist_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'artist created', 1);

CREATE TABLE genre(
  id serial NOT NULL,
  "name" varchar(30) NOT NULL,
  name_lower varchar(30) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT genre_pkey PRIMARY KEY(id),
  CONSTRAINT genre_name_key UNIQUE("name")
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'genre created', 1);

CREATE TABLE media_type(
  id serial NOT NULL,
  "name" varchar(40) NOT NULL,
  name_lower varchar(40) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT media_type_pkey PRIMARY KEY(id),
  CONSTRAINT media_type_name_key UNIQUE("name")
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'media_type created', 1);

CREATE TABLE playlist(
  id serial NOT NULL,
  "name" varchar(50) NOT NULL,
  name_lower varchar(50) NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT playlist_pkey PRIMARY KEY(id),
  CONSTRAINT playlist_name_key UNIQUE("name")
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'playlist created', 1);

CREATE TABLE album(
  id serial NOT NULL,
  title varchar(120) NOT NULL,
  title_lower varchar(120) NOT NULL,
  artist_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT album_pkey PRIMARY KEY(id)
);

ALTER TABLE album
  ADD CONSTRAINT album_artist_id_fkey
    FOREIGN KEY (artist_id) REFERENCES artist (id);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'album created', 1);

CREATE TABLE track(
  id serial NOT NULL,
  "name" varchar(1500) NOT NULL,
  name_lower varchar(1500) NOT NULL,
  composer varchar(200),
  "milliseconds" integer NOT NULL,
  bytes integer NOT NULL,
  unit_price numeric(6,2) NOT NULL,
  album_id integer NOT NULL,
  genre_id integer NOT NULL,
  media_type_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT track_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'track created', 1);

CREATE TABLE playlist_track(
  id serial NOT NULL,
  playlist_id integer NOT NULL,
  track_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT playlist_track_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'playlist_track created', 1);

CREATE TABLE employee(
  id serial NOT NULL,
  title varchar(10),
  first_name varchar(30),
  last_name varchar(50),
  date_of_birth date,
  hire_date date,
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  phone varchar(20),
  fax varchar(20),
  email varchar(120),
  manager_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT employee_pkey PRIMARY KEY(id),
  CONSTRAINT employee_email_key UNIQUE(email)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'employee created', 1);

CREATE TABLE customer(
  id serial NOT NULL,
  title varchar(10),
  first_name varchar(30),
  last_name varchar(50),
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  phone varchar(20),
  fax varchar(20),
  email varchar(120),
  employee_id integer,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT customer_pkey PRIMARY KEY(id),
  CONSTRAINT customer_email_key UNIQUE(email)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'customer created', 1);

CREATE TABLE invoice(
  id serial NOT NULL,
  invoice_date date NOT NULL,
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  total integer NOT NULL,
  customer_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT invoice_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'invoice created', 1);

CREATE TABLE invoice_item(
  id serial NOT NULL,
  quantity smallint NOT NULL,
  unit_price smallint NOT NULL,
  track_id integer NOT NULL,
  invoice_id integer NOT NULL,
  lock_version smallint NOT NULL DEFAULT 1,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT invoice_item_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'invoice_item created', 1);

ALTER TABLE track
  ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES album (id)
  ;

ALTER TABLE track
  ADD CONSTRAINT track_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genre (id)
  ;

ALTER TABLE track
  ADD CONSTRAINT track_media_type_id_fkey
    FOREIGN KEY (media_type_id) REFERENCES media_type (id);

ALTER TABLE playlist_track
  ADD CONSTRAINT playlist_track_playlist_id_fkey
    FOREIGN KEY (playlist_id) REFERENCES playlist (id);

ALTER TABLE playlist_track
  ADD CONSTRAINT playlist_track_track_id_fkey
    FOREIGN KEY (track_id) REFERENCES track (id);

ALTER TABLE employee
  ADD CONSTRAINT employee_fkey FOREIGN KEY (manager_id) REFERENCES employee (id)
  ;

ALTER TABLE customer
  ADD CONSTRAINT customer_employee_id_fkey
    FOREIGN KEY (employee_id) REFERENCES employee (id);

ALTER TABLE invoice
  ADD CONSTRAINT invoice_customer_id_fkey
    FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE invoice_item
  ADD CONSTRAINT invoice_item_track_id_fkey
    FOREIGN KEY (track_id) REFERENCES track (id);

ALTER TABLE invoice_item
  ADD CONSTRAINT invoice_item_invoice_id_fkey
    FOREIGN KEY (invoice_id) REFERENCES invoice (id);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'foreign keys mapped', 1);

CREATE TABLE xxx_artist(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  "name" varchar(100),
  name_lower varchar(100),
  lock_version smallint,
  CONSTRAINT xxx_artist_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_genre(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  "name" varchar(30),
  name_lower varchar(30),
  lock_version smallint,
  CONSTRAINT xxx_genre_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_media_type(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  "name" varchar(40),
  name_lower varchar(40),
  lock_version smallint,
  CONSTRAINT xxx_media_type_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_playlist(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  "name" varchar(50),
  name_lower varchar(50),
  lock_version smallint,
  CONSTRAINT xxx_playlist_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_album(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  title varchar(120),
  title_lower varchar(120),
  artist_id integer,
  lock_version smallint,
   CONSTRAINT xxx_album_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_track(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  "name" varchar(1500),
  name_lower varchar(1500),
  composer varchar(200),
  "milliseconds" integer,
  bytes integer,
  unit_price numeric(6,2),
  album_id integer,
  genre_id integer,
  media_type_id integer,
  lock_version smallint,
  CONSTRAINT xxx_track_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_playlist_track(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  playlist_id integer,
  track_id integer,
  lock_version smallint,
  CONSTRAINT xxx_playlist_track_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_employee(
  id serial NOT NULL,
  title varchar(10),
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  first_name varchar(30),
  last_name varchar(50),
  date_of_birth date,
  hire_date date,
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  phone varchar(20),
  fax varchar(20),
  email varchar(120),
  manager_id integer,
  lock_version smallint,
  CONSTRAINT xxx_employee_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_customer(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  title varchar(10),
  first_name varchar(30),
  last_name varchar(50),
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  phone varchar(20),
  fax varchar(20),
  email varchar(120),
  employee_id integer,
  lock_version smallint,
  CONSTRAINT xxx_customer_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_invoice(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  invoice_date date,
  address varchar(60),
  city varchar(40),
  state varchar(20),
  country varchar(30),
  post_code varchar(20),
  total integer,
  customer_id integer,
  lock_version smallint,
  CONSTRAINT xxx_invoice_pkey PRIMARY KEY(id)
);

CREATE TABLE xxx_invoice_item(
  id serial NOT NULL,
  "action" char(1) NOT NULL,
  logged_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  record_id integer NOT NULL,
  quantity smallint,
  unit_price smallint,
  track_id integer,
  invoice_id integer,
  lock_version smallint,
  CONSTRAINT xxx_invoice_item_pkey PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'audit tables created', 1);

UPDATE "version" SET is_valid = true, lock_version = lock_version + 1, updated_at = CURRENT_TIMESTAMP WHERE (id = 1);
