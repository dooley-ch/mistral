-- *******************************************************************************************
-- **  File:  postgresql-preferred-drop.sql
-- **  Description: Drops the preferred database
-- **  Created: 10-03-2020
-- **
-- **  History:
-- **  10-08-2020: Initial version
-- **
-- *******************************************************************************************

DROP TABLE IF EXISTS activity_log;

DROP TABLE IF EXISTS invoice_item;

DROP TABLE IF EXISTS invoice;

DROP TABLE IF EXISTS customer;

DROP TABLE IF EXISTS employee;

DROP TABLE IF EXISTS log;

DROP TABLE IF EXISTS playlist_track;

DROP TABLE IF EXISTS playlist;

DROP TABLE IF EXISTS setup;

DROP TABLE IF EXISTS track;

DROP TABLE IF EXISTS album;

DROP TABLE IF EXISTS artist;

DROP TABLE IF EXISTS genre;

DROP TABLE IF EXISTS media_type;

DROP TABLE IF EXISTS user_setup;

DROP TABLE IF EXISTS application;

DROP TABLE IF EXISTS version;

DROP TABLE IF EXISTS xxx_album;

DROP TABLE IF EXISTS xxx_application;

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


