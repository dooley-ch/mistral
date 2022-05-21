CREATE TABLE xxx_artist(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  name TEXT,
  name_lower TEXT,
  lock_version INTEGER
);

CREATE INDEX xxx_artist_ix_record_id ON xxx_artist("record_ID");

CREATE TABLE xxx_album(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  title TEXT,
  title_lower TEXT,
  "artist_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_album_ix_record_id ON xxx_album("record_ID");

CREATE TABLE xxx_genre(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  name TEXT,
  name_lower TEXT,
  lock_version
);

CREATE INDEX xxx_genre_ix_record_id ON xxx_genre("record_ID");

CREATE TABLE xxx_media_type(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  name TEXT,
  name_lower TEXT,
  lock_version INTEGER
);

CREATE INDEX xxx_media_type_ix_record_id ON xxx_media_type("record_ID");

CREATE TABLE xxx_track(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  name,
  name_lower TEXT,
  composer TEXT,
  milliseconds INTEGER,
  bytes INTEGER,
  unit_price INTEGERL,
  "media_type_ID" INTEGER,
  "genre_ID" INTEGER,
  "album_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_track_ix_record_id ON xxx_track("record_ID");

CREATE TABLE xxx_playlist(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  name TEXT,
  name_lower TEXT,
  lock_version INTEGER
);

CREATE INDEX xxx_playlist_ix_record_id ON xxx_playlist("record_ID");

CREATE TABLE xxx_playlist_track(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL ,
  "playlist_ID" INTEGER,
  "track_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_playlist_track_ix_record_id ON xxx_playlist_track("record_ID");

CREATE TABLE xxx_employee(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  title TEXT,
  first_name TEXT,
  last_name TEXT,
  date_of_birth TEXT,
  hire_date TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  phone TEXT,
  fax TEXT,
  email TEXT,
  "manager_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_employee_ix_record_id ON xxx_employee("record_ID");

CREATE TABLE xxx_customer(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  title TEXT,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  phone TEXT,
  fax TEXT,
  email TEXT,
  "employee_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_customer_ix_record_id ON xxx_customer("record_ID");

CREATE TABLE xxx_invoice(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  invoice_date TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  total INTEGER,
  "customer_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_invoice_ix_record_id ON xxx_invoice("record_ID");

CREATE TABLE xxx_invoice_item(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "action" TEXT NOT NULL,
  "record_ID" INTEGER NOT NULL,
  quantity INTEGER,
  unit_price INTEGER,
  "track_ID" INTEGER,
  "invoice_ID" INTEGER,
  lock_version INTEGER
);

CREATE INDEX xxx_invoice_item_ix_record_id ON xxx_invoice_item("record_ID");
