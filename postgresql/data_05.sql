-- *******************************************************************************************
-- **  File:  data_05.sql
-- **  Created: 25-05-2022
-- **
-- **  History:
-- **  25-05-2022: Initial version
-- **
-- *******************************************************************************************

--
-- Activity Type
--

INSERT INTO activity_type (id, name) VALUES (1, 'Create Customer');
INSERT INTO activity_type (id, name) VALUES (2, 'Create Employee');
INSERT INTO activity_type (id, name) VALUES (3, 'Create Album');

--
-- Activity Source
--

INSERT INTO activity_source(ID, name) VALUES (1, 'Application');
INSERT INTO activity_source(ID, name) VALUES (2, 'System');
INSERT INTO activity_source(ID, name) VALUES (3, 'User');

--
-- Activity Log
--

INSERT INTO activity_log(activity_type_id, activity_source_id, message)
SELECT 1, 3, 'New customer: ' || last_name || ', ' || first_name AS message FROM customer;

INSERT INTO activity_log(activity_type_id, activity_source_id, message)
SELECT 2, 3, 'New Employee: ' || last_name || ', ' || first_name AS message FROM employee;

INSERT INTO activity_log(activity_type_id, activity_source_id, message)
SELECT 3, 2, 'New Album: ' || album.title  AS message FROM album;

--
-- audit tables
--

INSERT INTO xxx_album(action, record_ID, title, title_lower, artist_ID, lock_version)
    SELECT 'I', id, title, title_lower, artist_id, lock_version FROM album;

INSERT INTO xxx_artist(action, record_ID, name, name_lower, lock_version)
    SELECT 'I', ID, name, name_lower, lock_version FROM artist;

INSERT INTO xxx_customer(ACTION, RECORD_ID, TITLE, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE,
                         COUNTRY, POST_CODE, PHONE, FAX, EMAIL, EMPLOYEE_ID, LOCK_VERSION)
    SELECT 'I', id, title, first_name, last_name, address, city, state, country, post_code, phone, fax, email,
           employee_id, lock_version FROM customer;

INSERT INTO xxx_employee(action, record_ID, title, first_name, last_name, date_of_birth, hire_date, address, city,
                         state, country, post_code, phone, fax, email, manager_ID, lock_version)
    SELECT 'I', ID, title, first_name, last_name, date_of_birth, hire_date, address, city, state, country,
           post_code, phone, fax, email, manager_ID, lock_version FROM employee;

INSERT INTO xxx_genre(action, record_ID, name, name_lower, lock_version)
    SELECT 'I', id, name, name_lower, lock_version FROM genre;

INSERT INTO xxx_invoice(action, record_ID, invoice_date, address, city, state, country, post_code,
                        total, customer_ID, lock_version)
    SELECT 'I', ID, invoice_date, address, city, state, country, post_code, total, customer_ID,
           lock_version FROM invoice;

INSERT INTO xxx_invoice_item(action, record_ID, quantity, unit_price, track_ID, invoice_ID, lock_version)
    SELECT 'I', ID, quantity, unit_price, track_ID, invoice_ID, lock_version FROM invoice_item;

INSERT INTO xxx_media_type(action, record_ID, name, name_lower, lock_version)
    SELECT  'I', ID, name, name_lower, lock_version FROM media_type;

INSERT INTO xxx_playlist (action, record_ID, name, name_lower, lock_version)
    SELECT 'I', ID, name, name_lower, lock_version FROM playlist;

INSERT INTO xxx_playlist_track(action, record_ID, playlist_ID, track_ID, lock_version)
    SELECT 'I', id, playlist_id, track_id, lock_version FROM playlist_track;

INSERT INTO xxx_track(action, record_ID, name, name_lower, composer, milliseconds, bytes, unit_price, media_type_ID,
                      genre_ID, album_ID, lock_version)
    SELECT 'I', ID, name, name_lower, composer, milliseconds, bytes, unit_price, media_type_ID, genre_ID,
           album_ID, lock_version FROM track;

--
-- Set the sequence on the tables
--

alter sequence album_id_seq restart with 350;

alter sequence artist_id_seq restart with 280;

alter sequence genre_id_seq restart with 30;

alter sequence invoice_id_seq restart with 420;

alter sequence media_type_id_seq restart with 10;

alter sequence playlist_id_seq restart with 20;

alter sequence playlist_track_id_seq restart with 9000;

alter sequence track_id_seq restart with 3600;
