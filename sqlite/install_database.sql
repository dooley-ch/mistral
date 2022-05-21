CREATE TABLE version(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  major INTEGER NOT NULL,
  minor INTEGER NOT NULL,
  build INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT version_ak_version UNIQUE(major, minor, build)
);

CREATE TABLE activity_source(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT activity_source_ak_name UNIQUE(name)
);

CREATE TABLE activity_type(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT activity_type_ak_name UNIQUE(name)
);

CREATE TABLE activity_log(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  logged_at TEXT NOT NULL,
  message TEXT NOT NULL,
  activity_type_id INTEGER NOT NULL,
  activity_source_id INTEGER NOT NULL,
  CONSTRAINT activity_type_activity_log
    FOREIGN KEY (activity_type_id) REFERENCES activity_type ("ID"),
  CONSTRAINT activity_source_activity_log
    FOREIGN KEY (activity_source_id) REFERENCES activity_source ("ID")
);

CREATE INDEX activity_log_ix_activity_type ON activity_log(activity_type_id);

CREATE INDEX activity_log_ix_activity_source ON activity_log(activity_source_id)
  ;

CREATE TABLE artist(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  name_lower TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT artist_ak_name UNIQUE(name_lower)
);

CREATE TABLE album(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title TEXT NOT NULL,
  title_lower TEXT NOT NULL,
  "artist_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT album_ak_name UNIQUE(title_lower),
  CONSTRAINT artist_album FOREIGN KEY ("artist_ID") REFERENCES artist ("ID")
);

CREATE INDEX album_ix_artist ON album("artist_ID");

CREATE TABLE genre(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  name_lower TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT genre_ak_name UNIQUE(name_lower)
);

CREATE TABLE media_type(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  name_lower TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT media_type_ak_name UNIQUE(name_lower)
);

CREATE TABLE track(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  name_lower TEXT NOT NULL,
  composer TEXT,
  milliseconds INTEGER,
  bytes INTEGER,
  unit_price INTEGER NOT NULL,
  "media_type_ID" INTEGER NOT NULL,
  "genre_ID" INTEGER NOT NULL,
  "album_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT album_track FOREIGN KEY ("album_ID") REFERENCES album ("ID"),
  CONSTRAINT genre_track FOREIGN KEY ("genre_ID") REFERENCES genre ("ID"),
  CONSTRAINT media_type_track
    FOREIGN KEY ("media_type_ID") REFERENCES media_type ("ID")
);

CREATE INDEX track_ix_media_type ON track("media_type_ID");

CREATE INDEX track_ix_genre ON track("genre_ID");

CREATE INDEX track_ix_album ON track("album_ID");

CREATE UNIQUE INDEX track_ix_track ON track(name_lower, "album_ID");

CREATE TABLE playlist(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  name_lower TEXT NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT playlist_ak_name UNIQUE(name_lower)
);

CREATE TABLE playlist_track(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "playlist_ID" INTEGER NOT NULL,
  "track_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT playlist_track_ak_playlist_track UNIQUE("playlist_ID", "track_ID"),
  CONSTRAINT playlist_playlist_track
    FOREIGN KEY ("playlist_ID") REFERENCES playlist ("ID"),
  CONSTRAINT track_playlist_track FOREIGN KEY ("track_ID") REFERENCES track ("ID")
);

CREATE INDEX playlist_track_ix_playlist ON playlist_track("playlist_ID");

CREATE INDEX playlist_track_ix_track ON playlist_track("track_ID");

CREATE TABLE employee(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title TEXT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  date_of_birth TEXT,
  hire_date TEXT NOT NULL,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  phone TEXT,
  fax TEXT,
  email TEXT NOT NULL,
  "manager_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT employee_employee
    FOREIGN KEY ("manager_ID") REFERENCES employee ("ID")
);

CREATE INDEX employee_ix_manager ON employee("manager_ID");

CREATE TABLE customer(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title TEXT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  phone TEXT,
  fax TEXT,
  email TEXT NOT NULL,
  "employee_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT employee_customer
    FOREIGN KEY ("employee_ID") REFERENCES employee ("ID")
);

CREATE INDEX customer_ix_employee ON customer("employee_ID");

CREATE TABLE invoice(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  invoice_date TEXT NOT NULL,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  post_code TEXT,
  total INTEGER,
  "customer_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT customer_invoice
    FOREIGN KEY ("customer_ID") REFERENCES customer ("ID")
);

CREATE INDEX invoice_ix_customer ON invoice("customer_ID");

CREATE TABLE invoice_item(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price INTEGER NOT NULL,
  "track_ID" INTEGER NOT NULL,
  "invoice_ID" INTEGER NOT NULL,
  lock_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT invoice_item_ak_row UNIQUE("track_ID", "invoice_ID"),
  CONSTRAINT invoice_invoice_item
    FOREIGN KEY ("invoice_ID") REFERENCES invoice ("ID"),
  CONSTRAINT track_invoice_item FOREIGN KEY ("track_ID") REFERENCES track ("ID")
);

CREATE INDEX invoice_item_ix_track ON invoice_item("track_ID");

CREATE INDEX invoice_item_ix_invoice ON invoice_item("invoice_ID");
