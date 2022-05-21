-- *******************************************************************************************
-- **  File:  sqlite-legacy-data-1.sql
-- **  Description: Populates the preferred database
-- **  Created: 08-03-2020
-- **
-- **  History:
-- **  08-08-2020: Initial version
-- **
-- *******************************************************************************************

INSERT INTO genre (ID, name) VALUES(1, 'rock');
INSERT INTO genre (ID, name) VALUES(2, 'jazz');
INSERT INTO genre (ID, name) VALUES(3, 'metal');
INSERT INTO genre (ID, name) VALUES(4, 'alternative & punk');
INSERT INTO genre (ID, name) VALUES(5, 'rock and roll');
INSERT INTO genre (ID, name) VALUES(6, 'blues');
INSERT INTO genre (ID, name) VALUES(7, 'latin');
INSERT INTO genre (ID, name) VALUES(8, 'reggae');
INSERT INTO genre (ID, name) VALUES(9, 'pop');
INSERT INTO genre (ID, name) VALUES(10, 'soundtrack');
INSERT INTO genre (ID, name) VALUES(11, 'bossa nova');
INSERT INTO genre (ID, name) VALUES(12, 'easy listening');
INSERT INTO genre (ID, name) VALUES(13, 'heavy metal');
INSERT INTO genre (ID, name) VALUES(14, 'r&b/soul');
INSERT INTO genre (ID, name) VALUES(15, 'electronica/dance');
INSERT INTO genre (ID, name) VALUES(16, 'world');
INSERT INTO genre (ID, name) VALUES(17, 'hip hop/rap');
INSERT INTO genre (ID, name) VALUES(18, 'science fiction');
INSERT INTO genre (ID, name) VALUES(19, 'tv shows');
INSERT INTO genre (ID, name) VALUES(20, 'sci fi & fantasy');
INSERT INTO genre (ID, name) VALUES(21, 'drama');
INSERT INTO genre (ID, name) VALUES(22, 'comedy');
INSERT INTO genre (ID, name) VALUES(23, 'alternative');
INSERT INTO genre (ID, name) VALUES(24, 'classical');
INSERT INTO genre (ID, name) VALUES(25, 'opera');

INSERT INTO media_type(ID, name) VALUES(1, 'MPEG audio file');
INSERT INTO media_type(ID, name) VALUES(2, 'Protected AAC audio file');
INSERT INTO media_type(ID, name) VALUES(3, 'Protected MPEG-4 video file');
INSERT INTO media_type(ID, name) VALUES(4, 'Purchased AAC audio file');
INSERT INTO media_type(ID, name) VALUES(5, 'AAC audio file');

INSERT INTO employee (ID, last_name, first_name, title, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (1, 'Adams', 'Andrew', 'General Manager', '1962-02-18 00:00:00', '2002-08-14 00:00:00', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (2, 'Edwards', 'Nancy', 'Sales Manager', 1, '1958-12-08 00:00:00', '2002-05-01 00:00:00', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (3, 'Peacock', 'Jane', 'Sales Support Agent', 2, '1973-08-29 00:00:00', '2002-04-01 00:00:00', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (4, 'Park', 'Margaret', 'Sales Support Agent', 2, '1947-09-19 00:00:00', '2003-05-03 00:00:00', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (5, 'Johnson', 'Steve', 'Sales Support Agent', 2, '1965-03-03 00:00:00', '2003-10-17 00:00:00', '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '1 (780) 836-9987', '1 (780) 836-9543', 'steve@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (6, 'Mitchell', 'Michael', 'IT Manager', 1, '1973-07-01 00:00:00', '2003-10-17 00:00:00', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (7, 'King', 'Robert', 'IT Staff', 6, '1970-05-29 00:00:00', '2004-01-02 00:00:00', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com');
INSERT INTO employee (ID, last_name, first_name, title, manager_id, date_of_birth, hire_date, address, city, state, country, post_code, phone, fax, email) VALUES (8, 'Callahan', 'Laura', 'IT Staff', 6, '1968-01-09 00:00:00', '2004-03-04 00:00:00', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com');

INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (2, 'Leonie', 'Köhler', 'Theodor-Heuss-Straße 34', 'Stuttgart', 'Germany', '70174', '+49 0711 2842222', 'leonekohler@surfeu.de', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (3, 'François', 'Tremblay', '1498 rue Bélanger', 'Montréal', 'QC', 'Canada', 'H2G 1A7', '+1 (514) 721-4711', 'ftremblay@gmail.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (4, 'Bjørn', 'Hansen', 'Ullevålsveien 14', 'Oslo', 'Norway', '0171', '+47 22 44 22 22', 'bjorn.hansen@yahoo.no', 4);
INSERT INTO customer (ID, first_name, last_name, company, address, city, country, post_code, phone, fax, email, support_rep_id) VALUES (5, 'František', 'Wichterlová', 'JetBrains s.r.o.', 'Klanova 9/506', 'Prague', 'Czech Republic', '14700', '+420 2 4172 5555', '+420 2 4172 5555', 'frantisekw@jetbrains.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (6, 'Helena', 'Holý', 'Rilská 3174/6', 'Prague', 'Czech Republic', '14300', '+420 2 4177 0449', 'hholy@gmail.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (7, 'Astrid', 'Gruber', 'Rotenturmstraße 4, 1010 Innere Stadt', 'Vienne', 'Austria', '1010', '+43 01 5134505', 'astrid.gruber@apple.at', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (8, 'Daan', 'Peeters', 'Grétrystraat 63', 'Brussels', 'Belgium', '1000', '+32 02 219 03 03', 'daan_peeters@apple.be', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (9, 'Kara', 'Nielsen', 'Sønder Boulevard 51', 'Copenhagen', 'Denmark', '1720', '+453 3331 9991', 'kara.nielsen@jubii.dk', 4);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (10, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (11, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (12, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (13, 'Fernanda', 'Ramos', 'Qe 7 Bloco G', 'Brasília', 'DF', 'Brazil', '71020-677', '+55 (61) 3363-5547', '+55 (61) 3363-7855', 'fernadaramos4@uol.com.br', 4);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (14, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (15, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (16, 'Frank', 'Harris', 'Google Inc.', '1600 Amphitheatre Parkway', 'Mountain View', 'CA', 'USA', '94043-1351', '+1 (650) 253-0000', '+1 (650) 253-0000', 'fharris@google.com', 4);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (17, 'Jack', 'Smith', 'Microsoft Corporation', '1 Microsoft Way', 'Redmond', 'WA', 'USA', '98052-8300', '+1 (425) 882-8080', '+1 (425) 882-8081', 'jacksmith@microsoft.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (18, 'Michelle', 'Brooks', '627 Broadway', 'New York', 'NY', 'USA', '10012-2612', '+1 (212) 221-3546', '+1 (212) 221-4679', 'michelleb@aol.com', 3);
INSERT INTO customer (ID, first_name, last_name, company, address, city, state, country, post_code, phone, fax, email, support_rep_id) VALUES (19, 'Tim', 'Goyer', 'Apple Inc.', '1 Infinite Loop', 'Cupertino', 'CA', 'USA', '95014', '+1 (408) 996-1010', '+1 (408) 996-1011', 'tgoyer@apple.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (20, 'Dan', 'Miller', '541 Del Medio Avenue', 'Mountain View', 'CA', 'USA', '94040-111', '+1 (650) 644-3358', 'dmiller@comcast.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (21, 'Kathy', 'Chase', '801 W 4th Street', 'Reno', 'NV', 'USA', '89503', '+1 (775) 223-7665', 'kachase@hotmail.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (22, 'Heather', 'Leacock', '120 S Orange Ave', 'Orlando', 'FL', 'USA', '32801', '+1 (407) 999-7788', 'hleacock@gmail.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (23, 'John', 'Gordon', '69 Salem Street', 'Boston', 'MA', 'USA', '2113', '+1 (617) 522-1333', 'johngordon22@yahoo.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (24, 'Frank', 'Ralston', '162 E Superior Street', 'Chicago', 'IL', 'USA', '60611', '+1 (312) 332-3232', 'fralston@gmail.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (25, 'Victor', 'Stevens', '319 N. Frances Street', 'Madison', 'WI', 'USA', '53703', '+1 (608) 257-0597', 'vstevens@yahoo.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (26, 'Richard', 'Cunningham', '2211 W Berry Street', 'Fort Worth', 'TX', 'USA', '76110', '+1 (817) 924-7272', 'ricunningham@hotmail.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (27, 'Patrick', 'Gray', '1033 N Park Ave', 'Tucson', 'AZ', 'USA', '85719', '+1 (520) 622-4200', 'patrick.gray@aol.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (28, 'Julia', 'Barnett', '302 S 700 E', 'Salt Lake city', 'UT', 'USA', '84102', '+1 (801) 531-7272', 'jubarnett@gmail.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (29, 'Robert', 'Brown', '796 Dundas Street West', 'Toronto', 'ON', 'Canada', 'M6J 1V1', '+1 (416) 363-8888', 'robbrown@shaw.ca', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (30, 'Edward', 'Francis', '230 Elgin Street', 'Ottawa', 'ON', 'Canada', 'K2P 1L7', '+1 (613) 234-3322', 'edfrancis@yachoo.ca', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (31, 'Martha', 'Silk', '194A Chain Lake Drive', 'Halifax', 'NS', 'Canada', 'B3S 1C5', '+1 (902) 450-0450', 'marthasilk@gmail.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (32, 'Aaron', 'Mitchell', '696 Osborne Street', 'Winnipeg', 'MB', 'Canada', 'R3L 2B9', '+1 (204) 452-6452', 'aaronmitchell@yahoo.ca', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (33, 'Ellie', 'Sullivan', '5112 48 Street', 'Yellowknife', 'NT', 'Canada', 'X1A 1N6', '+1 (867) 920-2233', 'ellie.sullivan@shaw.ca', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (34, 'João', 'Fernandes', 'Rua da Assunção 53', 'Lisbon', 'Portugal', '+351 (213) 466-111', 'jfernandes@yahoo.pt', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (35, 'Madalena', 'Sampaio', 'Rua dos Campeões Europeus de Viena, 4350', 'Porto', 'Portugal', '+351 (225) 022-448', 'masampaio@sapo.pt', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (36, 'Hannah', 'Schneider', 'Tauentzienstraße 8', 'Berlin', 'Germany', '10789', '+49 030 26550280', 'hannah.schneider@yahoo.de', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (37, 'Fynn', 'Zimmermann', 'Berger Straße 10', 'Frankfurt', 'Germany', '60316', '+49 069 40598889', 'fzimmermann@yahoo.de', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (38, 'Niklas', 'Schröder', 'Barbarossastraße 19', 'Berlin', 'Germany', '10779', '+49 030 2141444', 'nschroder@surfeu.de', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (39, 'Camille', 'Bernard', '4, Rue Milton', 'Paris', 'France', '75009', '+33 01 49 70 65 65', 'camille.bernard@yahoo.fr', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (40, 'Dominique', 'Lefebvre', '8, Rue Hanovre', 'Paris', 'France', '75002', '+33 01 47 42 71 71', 'dominiquelefebvre@gmail.com', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (41, 'Marc', 'Dubois', '11, Place Bellecour', 'Lyon', 'France', '69002', '+33 04 78 30 30 30', 'marc.dubois@hotmail.com', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (42, 'Wyatt', 'Girard', '9, Place Louis Barthou', 'Bordeaux', 'France', '33000', '+33 05 56 96 96 96', 'wyatt.girard@yahoo.fr', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (43, 'Isabelle', 'Mercier', '68, Rue Jouvence', 'Dijon', 'France', '21000', '+33 03 80 73 66 99', 'isabelle_mercier@apple.fr', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (44, 'Terhi', 'Hämäläinen', 'Porthaninkatu 9', 'Helsinki', 'Finland', '00530', '+358 09 870 2000', 'terhi.hamalainen@apple.fi', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, email, support_rep_id) VALUES (45, 'Ladislav', 'Kovács', 'Erzsébet krt. 58.', 'Budapest', 'Hungary', 'H-1073', 'ladislav_kovacs@apple.hu', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, phone, email, support_rep_id) VALUES (46, 'Hugh', 'O''Reilly', '3 Chatham Street', 'Dublin', 'Dublin', 'Ireland', '+353 01 6792424', 'hughoreilly@apple.ie', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (47, 'Lucas', 'Mancini', 'Via Degli Scipioni, 43', 'Rome', 'RM', 'Italy', '00192', '+39 06 39733434', 'lucas.mancini@yahoo.it', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (48, 'Johannes', 'Van der Berg', 'Lijnbaansgracht 120bg', 'Amsterdam', 'VV', 'Netherlands', '1016', '+31 020 6223130', 'johavanderberg@yahoo.nl', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (49, 'Stanisław', 'Wójcik', 'Ordynacka 10', 'Warsaw', 'Poland', '00-358', '+48 22 828 37 39', 'stanisław.wójcik@wp.pl', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (50, 'Enrique', 'Muñoz', 'C/ San Bernardo 85', 'Madrid', 'Spain', '28015', '+34 914 454 454', 'enrique_munoz@yahoo.es', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (51, 'Joakim', 'Johansson', 'Celsiusg. 9', 'Stockholm', 'Sweden', '11230', '+46 08-651 52 52', 'joakim.johansson@yahoo.se', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (52, 'Emma', 'Jones', '202 Hoxton Street', 'London', 'United Kingdom', 'N1 5LH', '+44 020 7707 0707', 'emma_jones@hotmail.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (53, 'Phil', 'Hughes', '113 Lupus St', 'London', 'United Kingdom', 'SW1V 3EN', '+44 020 7976 5722', 'phil.hughes@gmail.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (54, 'Steve', 'Murray', '110 Raeburn Pl', 'Edinburgh ', 'United Kingdom', 'EH4 1HH', '+44 0131 315 3300', 'steve.murray@yahoo.uk', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, state, country, post_code, phone, email, support_rep_id) VALUES (55, 'Mark', 'Taylor', '421 Bourke Street', 'Sidney', 'NSW', 'Australia', '2010', '+61 (02) 9332 3633', 'mark.taylor@yahoo.au', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (56, 'Diego', 'Gutiérrez', '307 Macacha Güemes', 'Buenos Aires', 'Argentina', '1106', '+54 (0)11 4311 4333', 'diego.gutierrez@yahoo.ar', 4);
INSERT INTO customer (ID, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (57, 'Luis', 'Rojas', 'Calle Lira, 198', 'Santiago', 'Chile', '+56 (0)2 635 4444', 'luisrojas@yahoo.cl', 5);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (58, 'Manoj', 'Pareek', '12,Community Centre', 'Delhi', 'India', '110017', '+91 0124 39883988', 'manoj.pareek@rediff.com', 3);
INSERT INTO customer (ID, first_name, last_name, address, city, country, post_code, phone, email, support_rep_id) VALUES (59, 'Puja', 'Srivastava', '3,Raj Bhavan Road', 'Bangalore', 'India', '560001', '+91 080 22289999', 'puja_srivastava@yahoo.in', 3);
