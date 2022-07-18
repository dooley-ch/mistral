-- *******************************************************************************************
-- **  File:  install.sql
-- **  Created: 26-05-2022
-- **
-- **  History:
-- **  26-05-2022: Initial version
-- **
-- *******************************************************************************************

SET FOREIGN_KEY_CHECKS = 0;

DROP VIEW IF EXISTS albums;
DROP VIEW IF EXISTS playlists;

DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS invoice_item;
DROP TABLE IF EXISTS media_type;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS playlist_track;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS version;
DROP TABLE IF EXISTS version_item;

DROP TABLE IF EXISTS activity_log;
DROP TABLE IF EXISTS activity_source;
DROP TABLE IF EXISTS activity_type;

DROP TABLE IF EXISTS version_item;
DROP TABLE IF EXISTS version;

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
DROP TABLE IF EXISTS xxx_version;
DROP TABLE IF EXISTS xxx_version_item;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `version`(
  id TINYINT NOT NULL,
  major TINYINT NOT NULL,
  minor TINYINT NOT NULL,
  build TINYINT NOT NULL,
  is_valid BOOLEAN NOT NULL DEFAULT FALSE,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT version_ak_version UNIQUE(major, minor, build)
);

CREATE TABLE IF NOT EXISTS version_item(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  step VARCHAR(40) NOT NULL,
  `comment` VARCHAR(500) NOT NULL,
  version_id TINYINT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS activity_source(
  id TINYINT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT activity_source_ak_name UNIQUE(`name`)
);

CREATE TABLE IF NOT EXISTS activity_type(
  id TINYINT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT activity_type_ak_name UNIQUE(`name`)
);

CREATE TABLE IF NOT EXISTS activity_log(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  message MEDIUMTEXT NOT NULL,
  activity_source_id TINYINT NOT NULL,
  activity_type_id TINYINT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE version_item
  ADD CONSTRAINT version_version_item
    FOREIGN KEY (version_id) REFERENCES `version` (id);

ALTER TABLE activity_log
  ADD CONSTRAINT activity_source_activity_log
    FOREIGN KEY (activity_source_id) REFERENCES activity_source (id);

ALTER TABLE activity_log
  ADD CONSTRAINT activity_type_activity_log
    FOREIGN KEY (activity_type_id) REFERENCES activity_type (id);

INSERT INTO `version`(id, major, minor, build) VALUES (1, 1, 0, 1);

CREATE TABLE IF NOT EXISTS invoice_item(
  id INT NOT NULL AUTO_INCREMENT,
  quantity INT NOT NULL,
  unit_price INT NOT NULL,
  track_id INT NOT NULL,
  invoice_id INT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'invoice_item created', 1);

CREATE TABLE IF NOT EXISTS artist(
  id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  name_lower VARCHAR(100) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT artist_ak_name UNIQUE(name_lower)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'artist created', 1);

CREATE TABLE IF NOT EXISTS album(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(120) NOT NULL,
  title_lower VARCHAR(120) NOT NULL,
  artist_id INT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT album_ak_title UNIQUE(title_lower)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'album created', 1);

CREATE TABLE IF NOT EXISTS media_type(
  id TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  name_lower VARCHAR(40) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT media_type_ak_name UNIQUE(name_lower)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'media_type created', 1);

CREATE TABLE IF NOT EXISTS genre(
  id TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  name_lower VARCHAR(30) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT genre_ak_name UNIQUE(name_lower)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'genre created', 1);

CREATE TABLE IF NOT EXISTS playlist(
  id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  name_lower VARCHAR(50) NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT playlist_ak_name UNIQUE(name_lower)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'playlist created', 1);

CREATE TABLE IF NOT EXISTS track(
  id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  name_lower VARCHAR(150) NOT NULL,
  composer VARCHAR(200),
  milliseconds INT,
  bytes INT,
  unit_price DECIMAL(6,2) NOT NULL,
  album_id INT NOT NULL,
  genre_id TINYINT NOT NULL,
  media_type_id TINYINT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'track created', 1);

CREATE TABLE IF NOT EXISTS playlist_track(
  id INT NOT NULL AUTO_INCREMENT,
  track_id INT NOT NULL,
  playlist_id INT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'playlist_track, created', 1);

CREATE TABLE IF NOT EXISTS employee(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30),
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  hire_date DATE NOT NULL,
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  phone VARCHAR(20),
  fax VARCHAR(20),
  email VARCHAR(120) NOT NULL,
  manager_id INT,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT employee_ak_email UNIQUE(email)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'employee created', 1);

CREATE TABLE IF NOT EXISTS customer(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(10),
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  phone VARCHAR(20),
  fax VARCHAR(20),
  email VARCHAR(120),
  employee_id INT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  CONSTRAINT customer_ak_email UNIQUE(email)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'customer created', 1);

CREATE TABLE IF NOT EXISTS invoice(
  id INT NOT NULL AUTO_INCREMENT,
  invoice_date DATE NOT NULL,
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  total INT NOT NULL,
  customer_id INT NOT NULL,
  lock_version TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'invoice created', 1);

ALTER TABLE album
  ADD CONSTRAINT artist_album FOREIGN KEY (artist_id) REFERENCES artist (id);

ALTER TABLE track
  ADD CONSTRAINT album_track FOREIGN KEY (album_id) REFERENCES album (id);

ALTER TABLE track
  ADD CONSTRAINT genre_track FOREIGN KEY (genre_id) REFERENCES genre (id);

ALTER TABLE track
  ADD CONSTRAINT media_type_track
    FOREIGN KEY (media_type_id) REFERENCES media_type (id);

ALTER TABLE playlist_track
  ADD CONSTRAINT track_playlist_track FOREIGN KEY (track_id) REFERENCES track (id)
  ;

ALTER TABLE playlist_track
  ADD CONSTRAINT playlist_playlist_track
    FOREIGN KEY (playlist_id) REFERENCES playlist (id);

ALTER TABLE employee
  ADD CONSTRAINT employee_employee
    FOREIGN KEY (manager_id) REFERENCES employee (id);

ALTER TABLE customer
  ADD CONSTRAINT employee_customer
    FOREIGN KEY (employee_id) REFERENCES employee (id);

ALTER TABLE invoice
  ADD CONSTRAINT customer_invoice
    FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE invoice_item
  ADD CONSTRAINT track_invoice_item FOREIGN KEY (track_id) REFERENCES track (id)
  ;

ALTER TABLE invoice_item
  ADD CONSTRAINT invoice_invoice_item
    FOREIGN KEY (invoice_id) REFERENCES invoice (id);



CREATE TABLE IF NOT EXISTS xxx_invoice_item(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  quantity INT,
  unit_price INT,
  track_id INT,
  invoice_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_artist(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  `name` VARCHAR(100),
  name_lower VARCHAR(100),
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_album(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  title VARCHAR(120),
  title_lower VARCHAR(120),
  artist_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_media_type(
  id TINYINT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
   record_id INT NOT NULL,
  `name` VARCHAR(40),
  name_lower VARCHAR(40),
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_genre(
  id TINYINT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  `name` VARCHAR(30),
  name_lower VARCHAR(30),
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_playlist(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  `name` VARCHAR(50),
  name_lower VARCHAR(50),
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_track(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  `name` VARCHAR(150),
  name_lower VARCHAR(150),
  composer VARCHAR(200),
  milliseconds INT,
  bytes INT,
  unit_price DECIMAL(6,2),
  album_id INT ,
  genre_id TINYINT,
  media_type_id TINYINT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_playlist_track(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  track_id INT,
  playlist_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_employee(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  title VARCHAR(30),
  first_name VARCHAR(30),
  last_name VARCHAR(50),
  date_of_birth DATE,
  hire_date DATE,
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  phone VARCHAR(20),
  fax VARCHAR(20),
  email VARCHAR(120),
  manager_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_customer(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  title VARCHAR(10),
  first_name VARCHAR(30),
  last_name VARCHAR(50),
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  phone VARCHAR(20),
  fax VARCHAR(20),
  email VARCHAR(120),
  employee_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS xxx_invoice(
  id INT NOT NULL AUTO_INCREMENT,
  logged_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `action` CHAR(1) NOT NULL,
  record_id INT NOT NULL,
  invoice_date DATE,
  address VARCHAR(60),
  city VARCHAR(40),
  state VARCHAR(20),
  country VARCHAR(30),
  post_code VARCHAR(20),
  total INT,
  customer_id INT,
  lock_version TINYINT,
  PRIMARY KEY(id)
);

INSERT INTO version_item(step, comment, version_id) VALUES ('CREATE', 'audit tables created', 1);
