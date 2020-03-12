-- *******************************************************************************************
-- **  File:  mysql-legacy-drop.sql
-- **  Description: Drops the legacy database
-- **  Created: 08-03-2020
-- **
-- **  History:
-- **  08-08-2020: Initial version
-- **
-- *******************************************************************************************
USE mistral_legacy;

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

DROP TABLE IF EXISTS version;
