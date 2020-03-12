-- *******************************************************************************************
-- **  File:  sqlite-preferred-data-1.sql
-- **  Description: Populates the preferred database
-- **  Created: 08-03-2020
-- **
-- **  History:
-- **  08-08-2020: Initial version
-- **
-- *******************************************************************************************

INSERT INTO application("ID",  key, name) VALUES (1, 'A10', 'application 1');
INSERT INTO application("ID",  key, name) VALUES (2, 'A20', 'application 2');
INSERT INTO application("ID",  key, name) VALUES (3, 'A30', 'application 3');
INSERT INTO application("ID",  key, name) VALUES (4, 'A40', 'application 4');
INSERT INTO application("ID",  key, name) VALUES (5, 'A50', 'application 5');

INSERT INTO activity_log(app_id, message) VALUES (1, 'Application 1 added');
INSERT INTO activity_log(app_id, message) VALUES (1, 'Application 2 added');
INSERT INTO activity_log(app_id, message) VALUES (1, 'Application 3 added');
INSERT INTO activity_log(app_id, message) VALUES (1, 'Application 4 added');
INSERT INTO activity_log(app_id, message) VALUES (1, 'Application 5 added');
INSERT INTO activity_log(app_id, message) VALUES (1, 'Sample data loaded');

INSERT INTO log(app_id, entry_type, message) VALUES (1, 'INFO', 'Database Created');
INSERT INTO log(app_id, entry_type, message) VALUES (1, 'INFO', 'Sample data loaded');

INSERT INTO setup(key, value, data_type, app_id) VALUES ('Key1', 'StrValue1', 'String', 1);
INSERT INTO setup(key, value, data_type, app_id) VALUES ('Key2', 'StrValue2', 'String', 1);
INSERT INTO setup(key, value, data_type, app_id) VALUES ('Key3', 'StrValue3', 'String', 1);
INSERT INTO setup(key, value, data_type, app_id) VALUES ('Key4', 'StrValue4', 'String', 1);
INSERT INTO setup(key, value, data_type, app_id) VALUES ('Key5', 'StrValue5', 'String', 1);

INSERT INTO user_setup(key, value, data_type, app_id, usr) VALUES ('Key1', 'StrValue1', 'String', 1, 'ert-345');
INSERT INTO user_setup(key, value, data_type, app_id, usr) VALUES ('Key2', 'StrValue2', 'String', 1, 'ert-345');
INSERT INTO user_setup(key, value, data_type, app_id, usr) VALUES ('Key3', 'StrValue3', 'String', 1, 'ert-345');
INSERT INTO user_setup(key, value, data_type, app_id, usr) VALUES ('Key4', 'StrValue4', 'String', 1, 'ert-345');
INSERT INTO user_setup(key, value, data_type, app_id, usr) VALUES ('Key5', 'StrValue5', 'String', 1, 'ert-345');

INSERT INTO version(major, minor, build, ended_at, status) VALUES (1, 23, 345, CURRENT_TIMESTAMP, 'ENDED');

INSERT INTO xxx_album(action, record_id, version_id, usr, app, title, title_lower, artist_id)
    SELECT 'I', "ID", version, 'xcv-456', 1, title, title_lower, artist_id FROM album;

INSERT INTO xxx_application(action, record_id, version_id, usr, app, key, name, comments)
    SELECT 'I', "ID", version, 'ert-345', 1, key, name, comments FROM application;

INSERT INTO xxx_artist(action, record_id, version_id, usr, app, name, name_lower)
    SELECT 'I', "ID", version, 'ghg-456', 1, name, name_lower FROM artist;

INSERT INTO xxx_customer(action, record_id, version_id, usr, app, first_name, last_name, company,
                         address, city, state, country, post_code, phone, fax, email, support_rep_id)
    SELECT 'I', "ID", version, 'rytr-345', 1, first_name, last_name, company, address, city, state, country,
           post_code, phone, fax, email, support_rep_id FROM customer;

INSERT INTO xxx_employee(action, record_id, version_id, usr, app, title, first_name, last_name, address, city, state,
                         country, post_code, phone, fax, email, manager_id)
    SELECT 'I', "ID", version, 'iop-345', 1, title, first_name, last_name, address, city, state, country, post_code,
           phone, fax, email, manager_id FROM employee;

INSERT INTO xxx_genre(ACTION, RECORD_ID, VERSION_ID, USR, APP, NAME, NAME_LOWER)
    SELECT 'I', "ID", version, 'iop-345', 1, name, name_lower FROM genre;

INSERT INTO xxx_invoice(action, record_id, version_id, usr, app, invoice_date, address, city, state, country,
                        post_code, total, customer_id)
    SELECT 'I', "ID", version, 'iop-456', 1, invoice_date, address, city, state, country, post_code,
           total, customer_id FROM invoice;

INSERT INTO xxx_invoice_item(action, record_id, version_id, usr, app, invoice_id, track_id, unit_price, quantity)
    SELECT 'I', "ID", version, '45678-II',  2, invoice_id, track_id, unit_price, quantity FROM invoice_item;

INSERT INTO xxx_media_type(action, record_id, version_id, usr, app, name, name_lower)
    SELECT 'I', "ID", version, 'uiw-345', 2, name, name_lower FROM media_type;

INSERT INTO xxx_playlist(action, record_id, version_id, usr, app, name, name_lower)
    SELECT 'I', "ID", version, 'ert-789', 1, name, name_lower FROM playlist;

INSERT INTO xxx_playlist_track(action, record_id, version_id, usr, app, playlist_id, track_id)
    SELECT 'I', "ID", version, 'vbn-345', 1, playlist_id, track_id FROM playlist_track;

INSERT INTO xxx_track(action, record_id, version_id, usr, app, name, composers, milliseconds, bytes, unit_price,
                      album_id, media_type_id, genre_id)
    SELECT 'I', "ID", version, 'xcv-456', 3, name, composer, milliseconds, bytes, unit_price, album_id,
           media_type_id, genre_id FROM track;

