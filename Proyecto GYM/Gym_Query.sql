CREATE DATABASE OLYMPUS_GYM;
GO


USE OLYMPUS_GYM;

CREATE TABLE Socios (
    id_socio INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    email NVARCHAR(150) UNIQUE NOT NULL,
    telefono NVARCHAR(20),
    fecha_inscripcion DATE NOT NULL
);


CREATE TABLE Entrenadores (
    id_entrenador INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    especialidad NVARCHAR(100)
);


CREATE TABLE Tipo_Membresia (
    tipo_membresia_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_plan NVARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion INT NOT NULL -- Duración en días
);


CREATE TABLE Pagos (
    pago_id INT PRIMARY KEY IDENTITY(1,1),
    id_socio INT NOT NULL,
    tipo_membresia_id INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto_pagado DECIMAL(10, 2) NOT NULL,
    
    FOREIGN KEY (id_socio) REFERENCES Socios(id_socio),
    FOREIGN KEY (tipo_membresia_id) REFERENCES Tipo_Membresia(tipo_membresia_id)
);


CREATE TABLE Actividades (
    actividad_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_clase NVARCHAR(150) NOT NULL,
    descripcion NVARCHAR(MAX),
    duracion_minutos INT
);


CREATE TABLE Clases_Programadas (
    clase_id INT PRIMARY KEY IDENTITY(1,1),
    actividad_id INT NOT NULL,
    id_entrenador INT NOT NULL,
    fecha_hora_inicio DATETIME NOT NULL,
    cupo_maximo INT NOT NULL,
    sala NVARCHAR(50),
    
    FOREIGN KEY (actividad_id) REFERENCES Actividades(actividad_id),
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);


CREATE TABLE Reservas (
    reserva_id INT PRIMARY KEY IDENTITY(1,1),
    id_socio INT NOT NULL,
    clase_id INT NOT NULL,
    fecha_reserva DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(20) DEFAULT 'Confirmada', 
    
    FOREIGN KEY (id_socio) REFERENCES Socios(id_socio),
    FOREIGN KEY (clase_id) REFERENCES Clases_Programadas(clase_id),
    
    UNIQUE (id_socio, clase_id)
);


--Generando datos------
----Insert a tabla socios-----------------------------------
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Burl', 'Lancashire', 'blancashire0@imageshack.us', '601-446-9750', '2020-01-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gladi', 'Skaid', 'gskaid1@buzzfeed.com', '978-852-6171', '2024-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Augustina', 'Scrannage', 'ascrannage2@mayoclinic.com', '135-672-9817', '2021-07-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harlin', 'Bagshawe', 'hbagshawe3@gmpg.org', '803-919-4819', '2021-01-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Addison', 'Whittier', 'awhittier4@51.la', '698-257-9272', '2021-01-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Romy', 'Hazzard', 'rhazzard5@prlog.org', '873-910-5213', '2023-12-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Buddy', 'Strettle', 'bstrettle6@cbsnews.com', '117-705-3332', '2024-08-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anson', 'Wortley', 'awortley7@oakley.com', '310-543-8929', '2022-03-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Allison', 'Potebury', 'apotebury8@furl.net', '242-816-6070', '2022-02-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Amber', 'Ivasyushkin', 'aivasyushkin9@cnbc.com', '109-423-9370', '2023-06-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mervin', 'Demchen', 'mdemchena@dailymail.co.uk', '670-197-5250', '2024-04-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tasia', 'Iwanowicz', 'tiwanowiczb@sohu.com', '597-143-8924', '2022-05-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leann', 'Hindge', 'lhindgec@stanford.edu', '175-271-9808', '2020-03-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Claudetta', 'Tacey', 'ctaceyd@google.cn', '115-912-6529', '2024-06-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Westbrooke', 'Prewett', 'wprewette@de.vu', '245-518-4105', '2024-04-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lynnette', 'Tippin', 'ltippinf@wordpress.com', '528-992-7804', '2022-02-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaclyn', 'Bunford', 'jbunfordg@businesswire.com', '772-939-2049', '2024-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vidovic', 'Ghelerdini', 'vghelerdinih@mozilla.org', '666-643-7253', '2024-01-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Giraud', 'Cocklin', 'gcocklini@buzzfeed.com', '274-801-0532', '2024-02-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Friederike', 'Cradduck', 'fcradduckj@myspace.com', '915-956-6640', '2021-10-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gorden', 'Kenny', 'gkennyk@jiathis.com', '604-554-8234', '2024-03-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lilia', 'Vase', 'lvasel@gravatar.com', '299-701-0389', '2021-12-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rana', 'Lyddy', 'rlyddym@washington.edu', '339-737-5626', '2022-09-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Consuela', 'Welbelove', 'cwelbeloven@webs.com', '863-369-2147', '2020-02-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cynde', 'Tiffin', 'ctiffino@is.gd', '419-649-9531', '2022-06-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fidole', 'Tomkinson', 'ftomkinsonp@etsy.com', '835-259-5652', '2024-02-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dori', 'Kale', 'dkaleq@nba.com', '411-946-0152', '2023-01-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alfy', 'Whissell', 'awhissellr@fotki.com', '626-814-7259', '2022-11-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ayn', 'Sallan', 'asallans@google.com.hk', '262-577-6436', '2022-08-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pacorro', 'Carlon', 'pcarlont@bravesites.com', '996-901-1574', '2021-08-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elsy', 'Buckleigh', 'ebuckleighu@cbsnews.com', '911-611-0946', '2023-01-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kipp', 'Matei', 'kmateiv@desdev.cn', '857-948-0000', '2022-11-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lisle', 'Pibworth', 'lpibworthw@cbslocal.com', '765-218-5085', '2024-03-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Billie', 'Segrave', 'bsegravex@eventbrite.com', '585-314-6437', '2024-08-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Phillie', 'Haggath', 'phaggathy@delicious.com', '695-703-8816', '2025-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Grazia', 'Delgado', 'gdelgadoz@home.pl', '491-858-8266', '2021-11-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jessika', 'Coldbathe', 'jcoldbathe10@usda.gov', '733-812-2864', '2021-03-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maje', 'Hudless', 'mhudless11@samsung.com', '887-321-1283', '2020-09-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reube', 'Tomney', 'rtomney12@symantec.com', '948-158-1757', '2024-08-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Abigael', 'Mizen', 'amizen13@hatena.ne.jp', '180-129-8309', '2023-10-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vernen', 'Oakden', 'voakden14@icq.com', '127-247-9540', '2025-10-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leyla', 'Whyteman', 'lwhyteman15@istockphoto.com', '698-367-9140', '2020-01-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chrysler', 'Cauthra', 'ccauthra16@icq.com', '800-875-2722', '2025-03-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ninnette', 'Borrott', 'nborrott17@guardian.co.uk', '932-149-2332', '2020-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marillin', 'Brazear', 'mbrazear18@wikispaces.com', '565-613-4583', '2024-02-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Akim', 'Noulton', 'anoulton19@bandcamp.com', '738-650-2392', '2022-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carree', 'Lauga', 'clauga1a@time.com', '117-836-0272', '2023-09-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Orly', 'Haydney', 'ohaydney1b@globo.com', '622-910-7315', '2024-10-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mira', 'Mellonby', 'mmellonby1c@yale.edu', '307-247-6999', '2025-01-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Estelle', 'Pulman', 'epulman1d@shinystat.com', '170-396-5263', '2024-04-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chilton', 'Salling', 'csalling1e@nature.com', '100-880-3724', '2025-06-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Symon', 'Drillingcourt', 'sdrillingcourt1f@sakura.ne.jp', '204-979-5045', '2023-12-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tiena', 'Lints', 'tlints1g@wsj.com', '937-835-9208', '2022-07-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marijo', 'Swalwell', 'mswalwell1h@webnode.com', '927-998-5169', '2021-07-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dori', 'Mathevon', 'dmathevon1i@imgur.com', '992-149-0673', '2021-10-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joby', 'Giuron', 'jgiuron1j@imdb.com', '274-619-8674', '2023-04-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Giovanna', 'Elman', 'gelman1k@globo.com', '960-797-0281', '2023-12-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ilaire', 'Di Baudi', 'idibaudi1l@msn.com', '912-323-9707', '2021-05-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gladys', 'Mansfield', 'gmansfield1m@canalblog.com', '105-272-7366', '2025-05-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marcelle', 'Arendt', 'marendt1n@about.com', '515-530-9028', '2022-06-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darbie', 'Ourtic', 'dourtic1o@mapquest.com', '123-955-0487', '2020-07-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Earl', 'Tine', 'etine1p@ebay.co.uk', '236-204-5454', '2022-09-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rodina', 'Echalier', 'rechalier1q@usnews.com', '221-423-2603', '2024-11-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tiena', 'Bransden', 'tbransden1r@people.com.cn', '186-190-9173', '2024-02-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leroy', 'Poynzer', 'lpoynzer1s@alibaba.com', '539-477-0656', '2021-12-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garner', 'Mackneis', 'gmackneis1t@npr.org', '107-942-0251', '2023-02-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kinsley', 'Dot', 'kdot1u@arizona.edu', '650-343-9327', '2024-05-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Else', 'Goodwill', 'egoodwill1v@ucsd.edu', '412-217-5211', '2021-01-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gaspard', 'Rosendahl', 'grosendahl1w@uiuc.edu', '567-892-8050', '2022-06-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leila', 'Gotts', 'lgotts1x@samsung.com', '887-683-0575', '2024-01-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hagen', 'Mendel', 'hmendel1y@answers.com', '347-410-8322', '2020-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reynold', 'Anderbrugge', 'randerbrugge1z@histats.com', '860-582-2676', '2022-12-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Karoline', 'Lashmar', 'klashmar20@ft.com', '857-479-2872', '2022-12-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sal', 'De Avenell', 'sdeavenell21@google.nl', '593-987-8079', '2022-11-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lilly', 'Stembridge', 'lstembridge22@arizona.edu', '841-558-7493', '2025-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Waylin', 'Ollerenshaw', 'wollerenshaw23@oracle.com', '677-243-5652', '2021-08-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Heindrick', 'Alderton', 'halderton24@ifeng.com', '133-658-4632', '2021-05-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Montague', 'Poltun', 'mpoltun25@umn.edu', '238-984-5013', '2020-08-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corenda', 'de Courcy', 'cdecourcy26@live.com', '131-187-5849', '2024-03-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Abelard', 'Kinghorn', 'akinghorn27@xing.com', '509-676-8024', '2021-08-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dion', 'Neissen', 'dneissen28@dion.ne.jp', '163-995-5836', '2023-04-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Faustine', 'Berthelmot', 'fberthelmot29@hao123.com', '709-174-2542', '2021-09-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carolin', 'Quenby', 'cquenby2a@ca.gov', '361-188-9033', '2025-05-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bernadene', 'Bilham', 'bbilham2b@arstechnica.com', '160-663-1978', '2025-11-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bordy', 'Broyd', 'bbroyd2c@google.com.br', '929-878-0444', '2024-08-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Melli', 'Morison', 'mmorison2d@barnesandnoble.com', '220-859-0894', '2022-01-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Claudelle', 'Jedrzejczyk', 'cjedrzejczyk2e@time.com', '434-693-8924', '2022-02-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kevan', 'Brydone', 'kbrydone2f@etsy.com', '192-895-6447', '2025-07-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Daryl', 'MacFadzean', 'dmacfadzean2g@wunderground.com', '280-148-9445', '2023-04-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Phelia', 'Abella', 'pabella2h@ucoz.ru', '488-607-2468', '2023-11-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garrik', 'Bolmann', 'gbolmann2i@epa.gov', '242-331-4371', '2021-06-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Godfry', 'Celiz', 'gceliz2j@house.gov', '855-460-2836', '2023-02-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jenda', 'Rusbridge', 'jrusbridge2k@vinaora.com', '532-943-7359', '2025-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Winny', 'Brood', 'wbrood2l@buzzfeed.com', '477-684-5352', '2020-07-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Riane', 'Flaunders', 'rflaunders2m@npr.org', '238-103-4885', '2025-08-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marie', 'Trunchion', 'mtrunchion2n@mtv.com', '720-519-4148', '2022-01-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mariana', 'Rickett', 'mrickett2o@bravesites.com', '733-553-1974', '2020-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Winna', 'Rabl', 'wrabl2p@cbsnews.com', '721-298-2939', '2020-05-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gwyn', 'Kay', 'gkay2q@networkadvertising.org', '592-288-2122', '2024-07-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Igor', 'Alexandrescu', 'ialexandrescu2r@foxnews.com', '765-370-2507', '2025-09-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wyn', 'Dackombe', 'wdackombe2s@phoca.cz', '309-900-9018', '2020-08-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Doralin', 'O''Day', 'doday2t@topsy.com', '774-450-0781', '2024-12-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Phylis', 'Moisey', 'pmoisey2u@infoseek.co.jp', '977-790-2200', '2022-08-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hermann', 'Bridat', 'hbridat2v@studiopress.com', '504-889-9677', '2022-11-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stormie', 'Thorsby', 'sthorsby2w@jimdo.com', '676-103-0348', '2023-07-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rollo', 'Greenmon', 'rgreenmon2x@mashable.com', '721-814-4424', '2020-09-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thaine', 'Rameaux', 'trameaux2y@godaddy.com', '674-695-3095', '2021-02-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Farlay', 'Bankes', 'fbankes2z@fema.gov', '280-338-8713', '2022-11-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alanah', 'Glashby', 'aglashby30@qq.com', '705-333-2376', '2024-01-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sawyer', 'Rubke', 'srubke31@godaddy.com', '434-458-8445', '2021-07-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ashton', 'Walklate', 'awalklate32@toplist.cz', '416-363-5772', '2020-03-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Khalil', 'Malden', 'kmalden33@princeton.edu', '578-430-0645', '2025-04-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gaynor', 'Brockley', 'gbrockley34@wired.com', '197-612-7034', '2023-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annadiane', 'Payle', 'apayle35@cbsnews.com', '654-224-1374', '2021-12-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Val', 'Watterson', 'vwatterson36@home.pl', '111-292-5238', '2020-08-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nonie', 'Bartolomeo', 'nbartolomeo37@amazon.de', '304-810-2014', '2020-03-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stanleigh', 'Meenan', 'smeenan38@dyndns.org', '183-914-6024', '2023-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cordy', 'Mountstephen', 'cmountstephen39@wikipedia.org', '478-991-9977', '2025-06-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jammal', 'Rate', 'jrate3a@ezinearticles.com', '954-667-8568', '2020-09-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brandon', 'Hornig', 'bhornig3b@squarespace.com', '262-288-5955', '2020-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lena', 'Owlner', 'lowlner3c@npr.org', '449-763-7330', '2025-01-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Audra', 'Speakman', 'aspeakman3d@pbs.org', '765-856-8030', '2022-01-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dorthy', 'Messer', 'dmesser3e@w3.org', '248-311-4459', '2022-11-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marshall', 'Gribbon', 'mgribbon3f@google.es', '474-641-8564', '2020-05-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaye', 'Shatliffe', 'jshatliffe3g@netvibes.com', '816-884-9153', '2023-12-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aldo', 'Lages', 'alages3h@homestead.com', '463-695-2350', '2022-10-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Amy', 'Couchman', 'acouchman3i@buzzfeed.com', '703-653-1233', '2021-03-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Deborah', 'Entwhistle', 'dentwhistle3j@wordpress.org', '852-403-0713', '2024-12-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Edan', 'Loveman', 'eloveman3k@ucoz.com', '950-706-2713', '2022-11-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rikki', 'Obington', 'robington3l@slate.com', '154-438-3169', '2025-05-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adelaida', 'Dodge', 'adodge3m@pbs.org', '912-140-8765', '2024-11-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hollie', 'Klouz', 'hklouz3n@bing.com', '391-874-4577', '2021-04-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rob', 'Whitwam', 'rwhitwam3o@youtu.be', '511-526-4891', '2024-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Abbe', 'MacRonald', 'amacronald3p@drupal.org', '387-585-0870', '2021-02-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fairfax', 'Treadgall', 'ftreadgall3q@networksolutions.com', '953-674-7259', '2022-04-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ari', 'Sedcole', 'asedcole3r@ibm.com', '640-457-6964', '2025-04-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bartholemy', 'Nisot', 'bnisot3s@angelfire.com', '482-224-8788', '2020-04-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fredrika', 'Atwel', 'fatwel3t@washington.edu', '784-891-8527', '2022-05-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Irene', 'Orrobin', 'iorrobin3u@webeden.co.uk', '632-492-3993', '2023-02-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kurtis', 'Earle', 'kearle3v@networkadvertising.org', '778-570-1878', '2025-03-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ailee', 'Mattingly', 'amattingly3w@state.gov', '322-117-2555', '2021-05-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nikolai', 'Oleszcuk', 'noleszcuk3x@sbwire.com', '287-558-4470', '2025-05-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bordie', 'Birkenshaw', 'bbirkenshaw3y@epa.gov', '827-445-7576', '2024-09-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ivett', 'Lorraway', 'ilorraway3z@moonfruit.com', '267-863-2689', '2024-12-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aubrie', 'Cruft', 'acruft40@google.fr', '816-393-9426', '2023-02-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Denise', 'Snoxell', 'dsnoxell41@jigsy.com', '922-526-8904', '2021-01-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nolie', 'Whiteley', 'nwhiteley42@mtv.com', '753-479-3262', '2024-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Berky', 'Mosdell', 'bmosdell43@auda.org.au', '448-368-6070', '2022-07-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sheree', 'Tegler', 'stegler44@adobe.com', '314-362-5694', '2024-04-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Even', 'Norres', 'enorres45@mediafire.com', '881-589-4628', '2023-02-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gherardo', 'Spincke', 'gspincke46@state.gov', '726-301-2335', '2022-09-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Angie', 'Newcomb', 'anewcomb47@example.com', '621-110-8827', '2023-04-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Margret', 'Kubacki', 'mkubacki48@indiegogo.com', '631-519-0756', '2020-05-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gael', 'Rikard', 'grikard49@loc.gov', '675-840-7554', '2021-07-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Estell', 'Adamsen', 'eadamsen4a@tamu.edu', '480-745-2112', '2025-04-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gretchen', 'Witt', 'gwitt4b@bing.com', '947-700-1487', '2023-05-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kakalina', 'Holsall', 'kholsall4c@freewebs.com', '273-661-5599', '2023-10-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Penni', 'Townby', 'ptownby4d@amazon.com', '133-410-9467', '2022-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harv', 'Venning', 'hvenning4e@bloglovin.com', '725-388-3476', '2024-10-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wallie', 'Krochmann', 'wkrochmann4f@dailymail.co.uk', '722-854-7752', '2025-01-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maire', 'Coneybeer', 'mconeybeer4g@springer.com', '566-308-8055', '2020-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harmonie', 'Gunby', 'hgunby4h@bbb.org', '794-714-0545', '2021-12-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Edsel', 'Espine', 'eespine4i@google.cn', '889-396-4803', '2025-10-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Letty', 'Derkes', 'lderkes4j@mapquest.com', '469-590-0743', '2025-04-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wendall', 'Enrigo', 'wenrigo4k@jugem.jp', '722-643-8379', '2020-04-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dee dee', 'Briztman', 'dbriztman4l@boston.com', '651-404-9468', '2025-04-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alic', 'Simek', 'asimek4m@netvibes.com', '110-112-6596', '2024-09-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maia', 'Bletcher', 'mbletcher4n@shinystat.com', '336-352-3266', '2021-12-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tamarah', 'Ickovits', 'tickovits4o@cbc.ca', '686-672-1034', '2024-08-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jessika', 'Croke', 'jcroke4p@purevolume.com', '813-156-3669', '2024-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kristian', 'Addington', 'kaddington4q@dmoz.org', '872-440-3519', '2021-04-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Saw', 'Marshland', 'smarshland4r@sitemeter.com', '400-264-0727', '2025-08-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maia', 'Foote', 'mfoote4s@loc.gov', '854-832-9012', '2024-08-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Letitia', 'Tester', 'ltester4t@blogs.com', '823-243-4325', '2022-06-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lindsay', 'MacCawley', 'lmaccawley4u@ucla.edu', '839-830-2929', '2023-05-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anabel', 'Ruffle', 'aruffle4v@twitter.com', '292-894-5214', '2021-02-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anatola', 'Fenimore', 'afenimore4w@paginegialle.it', '699-859-2491', '2025-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chanda', 'McIntosh', 'cmcintosh4x@ebay.co.uk', '835-357-4087', '2024-05-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corny', 'Jenson', 'cjenson4y@tumblr.com', '770-558-0115', '2025-05-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kris', 'Tyreman', 'ktyreman4z@apache.org', '383-737-9349', '2022-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Florella', 'Tarbet', 'ftarbet50@macromedia.com', '922-198-7189', '2025-02-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bili', 'Luppitt', 'bluppitt51@jimdo.com', '881-700-8863', '2022-02-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Madelon', 'Iglesias', 'miglesias52@java.com', '280-100-0808', '2023-07-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Slade', 'Oxer', 'soxer53@zimbio.com', '656-160-3203', '2020-08-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lou', 'Dudbridge', 'ldudbridge54@blog.com', '209-632-6779', '2020-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elli', 'Ogles', 'eogles55@unesco.org', '672-863-6775', '2025-05-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lorrayne', 'Wickrath', 'lwickrath56@bbb.org', '902-303-2077', '2020-11-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dehlia', 'Goodsell', 'dgoodsell57@bluehost.com', '880-532-2190', '2020-05-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yettie', 'Febvre', 'yfebvre58@oakley.com', '728-857-9940', '2021-08-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Georg', 'Haithwaite', 'ghaithwaite59@tuttocitta.it', '678-273-1377', '2021-07-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ania', 'Gencke', 'agencke5a@salon.com', '682-474-9987', '2020-01-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shaylynn', 'Winwright', 'swinwright5b@cloudflare.com', '172-674-1531', '2022-10-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gerta', 'Mosten', 'gmosten5c@arstechnica.com', '136-603-0560', '2020-02-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corabel', 'Look', 'clook5d@yale.edu', '704-908-1053', '2024-03-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Siouxie', 'Maddicks', 'smaddicks5e@unc.edu', '277-820-8929', '2021-10-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yancey', 'Vellden', 'yvellden5f@wufoo.com', '188-937-2806', '2024-11-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Merle', 'Conor', 'mconor5g@ftc.gov', '479-402-7315', '2022-06-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Natalie', 'Yannoni', 'nyannoni5h@vistaprint.com', '125-304-8677', '2020-07-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harriett', 'Milberry', 'hmilberry5i@jalbum.net', '327-321-6073', '2024-03-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lynn', 'Lockart', 'llockart5j@vimeo.com', '847-839-6680', '2021-02-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Margarita', 'Topham', 'mtopham5k@hexun.com', '617-625-2228', '2023-03-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Renell', 'Coldbreath', 'rcoldbreath5l@ted.com', '752-505-9475', '2025-03-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reg', 'Cabble', 'rcabble5m@gmpg.org', '853-783-6262', '2021-09-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garrot', 'Billett', 'gbillett5n@epa.gov', '475-551-6094', '2021-09-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ariela', 'Hawney', 'ahawney5o@alibaba.com', '482-176-1495', '2020-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leta', 'Baty', 'lbaty5p@princeton.edu', '517-288-5105', '2023-12-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Saundra', 'Dew', 'sdew5q@smh.com.au', '728-139-9071', '2024-08-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brynna', 'Milbank', 'bmilbank5r@smugmug.com', '899-452-8657', '2020-05-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carlin', 'Patters', 'cpatters5s@google.com.hk', '894-765-0029', '2024-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noah', 'Pickworth', 'npickworth5t@is.gd', '113-144-0581', '2022-11-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Roland', 'Neenan', 'rneenan5u@usda.gov', '448-843-8774', '2020-03-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ursuline', 'Sievewright', 'usievewright5v@chicagotribune.com', '133-539-0342', '2025-10-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carlye', 'Merman', 'cmerman5w@fc2.com', '397-425-6688', '2024-12-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thor', 'Hubner', 'thubner5x@businessweek.com', '249-480-3069', '2022-11-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maximilien', 'Giacomo', 'mgiacomo5y@seesaa.net', '363-767-8204', '2022-05-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alma', 'Brogan', 'abrogan5z@baidu.com', '875-326-1452', '2020-06-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Myrta', 'Scoffham', 'mscoffham60@unicef.org', '653-493-2126', '2020-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lainey', 'Flecknell', 'lflecknell61@ibm.com', '710-451-3693', '2022-10-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emlyn', 'Grogor', 'egrogor62@marriott.com', '889-482-0350', '2022-02-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bab', 'Guitel', 'bguitel63@statcounter.com', '635-517-7691', '2023-07-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Merissa', 'Neild', 'mneild64@cbsnews.com', '249-261-2442', '2023-04-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ivy', 'Goodson', 'igoodson65@devhub.com', '288-747-3390', '2023-07-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jennie', 'Oxbrough', 'joxbrough66@scientificamerican.com', '310-316-2718', '2023-09-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Katine', 'Thrift', 'kthrift67@technorati.com', '650-464-8512', '2025-05-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fraser', 'Scanlon', 'fscanlon68@illinois.edu', '605-865-0302', '2020-02-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jobie', 'Harriott', 'jharriott69@flavors.me', '394-911-5103', '2021-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jere', 'Casillas', 'jcasillas6a@salon.com', '701-588-8500', '2021-03-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Norby', 'Rymell', 'nrymell6b@de.vu', '370-708-6653', '2020-06-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Persis', 'Sponer', 'psponer6c@clickbank.net', '374-291-8094', '2022-09-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nyssa', 'Towler', 'ntowler6d@msu.edu', '579-813-4689', '2025-05-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Audrie', 'Mellodey', 'amellodey6e@dyndns.org', '436-192-6395', '2021-04-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ches', 'Smyth', 'csmyth6f@tinyurl.com', '636-900-4214', '2023-02-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Madella', 'Pawlik', 'mpawlik6g@ameblo.jp', '571-903-9076', '2024-09-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Winifred', 'Willingale', 'wwillingale6h@imgur.com', '614-887-4596', '2021-04-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Scarlet', 'Prynne', 'sprynne6i@berkeley.edu', '122-769-0705', '2021-11-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aurea', 'Pelcheur', 'apelcheur6j@fc2.com', '538-675-0802', '2022-05-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Daryn', 'Longega', 'dlongega6k@prnewswire.com', '976-954-7861', '2020-02-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lindie', 'Parrott', 'lparrott6l@aboutads.info', '512-989-3472', '2022-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leroi', 'Matsell', 'lmatsell6m@scientificamerican.com', '100-958-7604', '2023-08-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Merralee', 'Maffezzoli', 'mmaffezzoli6n@aboutads.info', '946-433-9162', '2022-06-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rutherford', 'Fernandes', 'rfernandes6o@w3.org', '661-171-8832', '2025-04-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Derby', 'Lipscombe', 'dlipscombe6p@php.net', '453-484-8812', '2022-07-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Trev', 'Davidek', 'tdavidek6q@1und1.de', '802-253-5126', '2020-10-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darrel', 'Lightman', 'dlightman6r@independent.co.uk', '565-385-2620', '2025-06-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Abbie', 'Meader', 'ameader6s@baidu.com', '539-223-2926', '2020-09-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Correna', 'Sorrill', 'csorrill6t@ucsd.edu', '547-735-2842', '2021-10-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Myrna', 'Laviste', 'mlaviste6u@tumblr.com', '420-857-4317', '2025-03-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nadine', 'Lanceley', 'nlanceley6v@skype.com', '810-462-4079', '2022-12-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pietra', 'Treacy', 'ptreacy6w@aboutads.info', '632-889-4480', '2023-11-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mil', 'Bailess', 'mbailess6x@bloomberg.com', '650-557-1385', '2024-09-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sidoney', 'Elks', 'selks6y@guardian.co.uk', '243-515-4043', '2021-11-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harmonie', 'Starbucke', 'hstarbucke6z@meetup.com', '362-567-9982', '2022-10-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Caitlin', 'Kubek', 'ckubek70@nature.com', '370-586-0204', '2022-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Phil', 'Lung', 'plung71@discuz.net', '903-903-0197', '2020-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lindi', 'Aslam', 'laslam72@blogger.com', '232-429-2356', '2025-01-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Manfred', 'Ruddiforth', 'mruddiforth73@arstechnica.com', '492-924-0753', '2024-04-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brooks', 'Umbert', 'bumbert74@oakley.com', '735-599-4933', '2021-06-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elihu', 'Goade', 'egoade75@google.com.au', '606-932-4785', '2024-07-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zola', 'St. John', 'zstjohn76@geocities.com', '590-911-0534', '2023-04-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Riane', 'Hallows', 'rhallows77@histats.com', '283-379-8506', '2023-10-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lula', 'Cast', 'lcast78@de.vu', '681-929-3553', '2020-01-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nanon', 'Pendrill', 'npendrill79@ustream.tv', '483-650-5389', '2022-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bud', 'Coule', 'bcoule7a@microsoft.com', '998-435-5252', '2020-10-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Obie', 'Hubbocks', 'ohubbocks7b@fastcompany.com', '610-985-1266', '2024-11-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tades', 'Clute', 'tclute7c@qq.com', '880-718-7700', '2023-08-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lezlie', 'Samarth', 'lsamarth7d@printfriendly.com', '477-233-2721', '2022-03-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Verena', 'Davidson', 'vdavidson7e@state.tx.us', '632-438-5969', '2021-03-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Izabel', 'Viegas', 'iviegas7f@fda.gov', '496-186-0665', '2021-03-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Guthry', 'Eloy', 'geloy7g@mediafire.com', '765-924-2375', '2021-07-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaquelin', 'Baglow', 'jbaglow7h@printfriendly.com', '287-414-2530', '2020-11-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Udall', 'Smitham', 'usmitham7i@twitter.com', '712-214-0065', '2024-09-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Barbabas', 'Bullon', 'bbullon7j@slideshare.net', '666-945-2772', '2023-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Clint', 'Proud', 'cproud7k@ucoz.ru', '989-611-6111', '2023-12-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tersina', 'Brindle', 'tbrindle7l@ow.ly', '619-615-1929', '2022-10-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adi', 'Briat', 'abriat7m@mediafire.com', '629-983-1819', '2023-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reid', 'Pic', 'rpic7n@cbsnews.com', '642-293-7738', '2020-05-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nehemiah', 'McCurtin', 'nmccurtin7o@washington.edu', '888-379-8357', '2021-06-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Augustina', 'Mulford', 'amulford7p@homestead.com', '981-556-8990', '2021-12-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emilio', 'Charrisson', 'echarrisson7q@bizjournals.com', '132-779-8070', '2020-10-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joanie', 'Korneichik', 'jkorneichik7r@jiathis.com', '274-276-8475', '2022-01-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Riley', 'Crippen', 'rcrippen7s@ehow.com', '363-882-5657', '2024-08-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Barb', 'Baraja', 'bbaraja7t@nyu.edu', '916-201-3771', '2024-08-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hart', 'Ephgrave', 'hephgrave7u@comsenz.com', '634-812-3198', '2020-08-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darbee', 'Barabich', 'dbarabich7v@paypal.com', '263-858-4764', '2022-01-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maressa', 'Ambrogelli', 'mambrogelli7w@kickstarter.com', '120-751-5575', '2024-08-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nicki', 'Cowdrey', 'ncowdrey7x@sun.com', '892-983-7109', '2021-04-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maxy', 'Athy', 'mathy7y@instagram.com', '793-359-3824', '2022-08-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tailor', 'Biesty', 'tbiesty7z@macromedia.com', '842-464-2453', '2022-10-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sydney', 'O''Bruen', 'sobruen80@rediff.com', '153-433-5640', '2024-03-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Daphene', 'Clymo', 'dclymo81@prweb.com', '435-600-0070', '2023-05-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gwendolin', 'McNeil', 'gmcneil82@furl.net', '691-652-8943', '2022-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wilden', 'Trevenu', 'wtrevenu83@squarespace.com', '490-962-9959', '2024-04-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cherlyn', 'Maraga', 'cmaraga84@indiatimes.com', '616-405-1251', '2020-10-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ebonee', 'Cowle', 'ecowle85@timesonline.co.uk', '473-783-5132', '2020-08-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Etty', 'Websdale', 'ewebsdale86@dailymotion.com', '587-426-5649', '2022-10-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dulcine', 'Bulger', 'dbulger87@opensource.org', '606-305-9383', '2025-04-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kordula', 'Knok', 'kknok88@merriam-webster.com', '374-848-5970', '2020-12-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nora', 'Swaddle', 'nswaddle89@cpanel.net', '876-977-8685', '2024-07-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leah', 'Corking', 'lcorking8a@flavors.me', '346-980-0675', '2021-06-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bernelle', 'Oland', 'boland8b@example.com', '235-211-4719', '2020-07-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Quint', 'Lobell', 'qlobell8c@hud.gov', '588-578-1612', '2022-07-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maudie', 'Caughey', 'mcaughey8d@ask.com', '671-915-3702', '2021-09-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chandal', 'Kirkbright', 'ckirkbright8e@de.vu', '751-159-7986', '2025-11-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Grover', 'Denson', 'gdenson8f@moonfruit.com', '388-479-7490', '2023-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thor', 'Baise', 'tbaise8g@redcross.org', '237-405-5248', '2022-03-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Xenos', 'Hambright', 'xhambright8h@drupal.org', '583-227-5188', '2022-01-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Frankie', 'Pentecust', 'fpentecust8i@google.es', '350-311-5945', '2022-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jacques', 'Swyer', 'jswyer8j@blogtalkradio.com', '108-533-8825', '2020-01-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rowland', 'Fritchly', 'rfritchly8k@wsj.com', '381-151-3769', '2022-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cissy', 'Woolnough', 'cwoolnough8l@slideshare.net', '717-888-5393', '2021-03-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adler', 'Bremen', 'abremen8m@berkeley.edu', '547-499-1811', '2023-07-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Junia', 'Deniscke', 'jdeniscke8n@tmall.com', '309-369-1127', '2024-05-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Skyler', 'Weems', 'sweems8o@privacy.gov.au', '811-225-2908', '2021-07-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tan', 'Cockland', 'tcockland8p@drupal.org', '952-236-4587', '2025-07-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gary', 'Dobbings', 'gdobbings8q@skyrock.com', '730-396-7719', '2024-12-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alwyn', 'Warrilow', 'awarrilow8r@alexa.com', '957-655-2163', '2020-08-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maia', 'Fealy', 'mfealy8s@ezinearticles.com', '194-573-8682', '2020-11-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lori', 'Gieraths', 'lgieraths8t@google.ru', '981-103-7484', '2025-02-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ricard', 'Rowcliffe', 'rrowcliffe8u@tinyurl.com', '459-478-2676', '2021-01-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sigismundo', 'McHaffy', 'smchaffy8v@arizona.edu', '251-187-0014', '2024-04-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mariska', 'Schimoni', 'mschimoni8w@skyrock.com', '658-675-8691', '2023-09-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Konstantin', 'Ricioppo', 'kricioppo8x@cisco.com', '821-940-7003', '2023-04-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Verna', 'Meaney', 'vmeaney8y@ft.com', '503-636-6079', '2022-03-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Colan', 'De Vaar', 'cdevaar8z@mapquest.com', '529-569-3732', '2023-09-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kattie', 'Winskill', 'kwinskill90@networksolutions.com', '726-777-5395', '2025-02-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Diana', 'Garritley', 'dgarritley91@t.co', '623-860-9720', '2024-10-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carroll', 'Cannicott', 'ccannicott92@soup.io', '873-470-7680', '2020-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Huberto', 'Giraudoux', 'hgiraudoux93@live.com', '415-478-8247', '2021-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brynna', 'Jaquemar', 'bjaquemar94@vk.com', '640-410-1692', '2023-11-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thedrick', 'Gorghetto', 'tgorghetto95@plala.or.jp', '943-115-0966', '2023-06-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bartolomeo', 'Paylor', 'bpaylor96@harvard.edu', '869-292-2809', '2024-11-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zelma', 'Corah', 'zcorah97@example.com', '524-228-6240', '2022-10-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annamaria', 'Aronov', 'aaronov98@behance.net', '607-717-3610', '2024-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alexander', 'Horsley', 'ahorsley99@craigslist.org', '868-993-3521', '2020-10-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dill', 'Dzenisenka', 'ddzenisenka9a@pbs.org', '952-300-7559', '2024-09-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dionisio', 'Cribbott', 'dcribbott9b@nifty.com', '899-774-1854', '2020-04-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Glynda', 'Rolls', 'grolls9c@yandex.ru', '984-996-1987', '2022-09-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lane', 'Shrubsall', 'lshrubsall9d@cocolog-nifty.com', '644-536-7641', '2023-05-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Archambault', 'Blant', 'ablant9e@woothemes.com', '610-378-2251', '2022-06-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Natale', 'Toy', 'ntoy9f@foxnews.com', '722-554-8286', '2023-05-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Niki', 'Titmarsh', 'ntitmarsh9g@clickbank.net', '652-905-1515', '2024-04-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Millie', 'Bentjens', 'mbentjens9h@constantcontact.com', '141-258-2133', '2020-05-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Herc', 'Clausner', 'hclausner9i@ameblo.jp', '616-436-4502', '2022-11-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nissie', 'Georgeot', 'ngeorgeot9j@ucoz.com', '643-466-4424', '2022-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sabine', 'Impey', 'simpey9k@hugedomains.com', '786-887-7692', '2022-06-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Veda', 'Andriesse', 'vandriesse9l@cmu.edu', '555-247-9369', '2021-03-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Artie', 'Seston', 'aseston9m@indiegogo.com', '721-633-2204', '2022-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Issi', 'Melvin', 'imelvin9n@yellowpages.com', '698-431-5176', '2022-02-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wallache', 'Purviss', 'wpurviss9o@cisco.com', '720-100-2453', '2023-11-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hana', 'Payler', 'hpayler9p@woothemes.com', '225-637-9322', '2025-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nanette', 'Gulliford', 'ngulliford9q@foxnews.com', '434-914-7836', '2023-05-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Burty', 'McCaughen', 'bmccaughen9r@epa.gov', '639-227-9743', '2025-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alanson', 'Coulthart', 'acoulthart9s@delicious.com', '573-451-2464', '2020-10-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rose', 'Illingworth', 'rillingworth9t@state.gov', '765-750-9792', '2023-10-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cherilynn', 'Kellog', 'ckellog9u@java.com', '852-337-0041', '2025-04-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rosamond', 'O''Nions', 'ronions9v@vistaprint.com', '453-473-7473', '2022-05-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Briny', 'Goldman', 'bgoldman9w@posterous.com', '695-669-3746', '2025-01-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Glyn', 'Cellier', 'gcellier9x@yale.edu', '615-149-4702', '2020-11-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rodie', 'Corston', 'rcorston9y@amazon.de', '264-592-9995', '2023-09-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jamil', 'Henze', 'jhenze9z@forbes.com', '638-567-2769', '2021-11-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carlin', 'Brafield', 'cbrafielda0@reddit.com', '687-579-3640', '2025-06-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Averil', 'McNish', 'amcnisha1@google.nl', '393-815-7229', '2021-04-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Edmon', 'Dilger', 'edilgera2@howstuffworks.com', '737-643-4685', '2020-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kleon', 'Loche', 'klochea3@discovery.com', '209-319-0985', '2025-07-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Barbey', 'Cockren', 'bcockrena4@japanpost.jp', '651-220-0677', '2020-06-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thornton', 'Kornacki', 'tkornackia5@goo.gl', '572-503-0537', '2020-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jannel', 'Dawdary', 'jdawdarya6@bbb.org', '533-802-4962', '2020-08-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Linnea', 'Llywarch', 'lllywarcha7@pbs.org', '293-471-8028', '2024-01-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Riobard', 'Flemyng', 'rflemynga8@mac.com', '685-672-6258', '2021-09-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Valentine', 'Gubbins', 'vgubbinsa9@nih.gov', '278-202-7021', '2020-09-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emilio', 'Gabbatt', 'egabbattaa@pbs.org', '535-264-1702', '2020-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gordon', 'Crummey', 'gcrummeyab@g.co', '418-219-2986', '2021-12-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Giustino', 'Andrejevic', 'gandrejevicac@youku.com', '907-328-5287', '2021-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ogdan', 'de Clercq', 'odeclercqad@acquirethisname.com', '888-159-0782', '2021-02-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ronica', 'Hayley', 'rhayleyae@vimeo.com', '602-920-8959', '2020-03-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jabez', 'Harbottle', 'jharbottleaf@biglobe.ne.jp', '326-349-5474', '2022-02-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Taddeusz', 'Lightwing', 'tlightwingag@reference.com', '570-468-3868', '2021-02-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Candi', 'Dimsdale', 'cdimsdaleah@miitbeian.gov.cn', '120-458-3293', '2025-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ethelred', 'Pollicatt', 'epollicattai@google.it', '853-475-8799', '2025-04-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nevile', 'Gulland', 'ngullandaj@is.gd', '860-721-5516', '2024-09-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Casey', 'Goodred', 'cgoodredak@addtoany.com', '936-312-6551', '2023-05-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Calv', 'Beevors', 'cbeevorsal@sfgate.com', '429-553-8383', '2021-01-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fiann', 'Pannett', 'fpannettam@illinois.edu', '563-661-5983', '2023-10-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shepard', 'Durrell', 'sdurrellan@bandcamp.com', '548-693-6929', '2024-08-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maddy', 'McKibbin', 'mmckibbinao@nba.com', '600-720-0893', '2025-04-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mickie', 'Eccleston', 'mecclestonap@cocolog-nifty.com', '341-759-9123', '2022-08-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kendre', 'Creane', 'kcreaneaq@tripadvisor.com', '145-138-5084', '2025-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nana', 'Collingham', 'ncollinghamar@gravatar.com', '307-776-7496', '2021-05-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Witty', 'Foukx', 'wfoukxas@sina.com.cn', '654-846-5152', '2023-05-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Minetta', 'Moscrop', 'mmoscropat@unicef.org', '617-600-9710', '2020-05-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carly', 'Lownds', 'clowndsau@w3.org', '102-452-4594', '2024-09-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Micah', 'Shafto', 'mshaftoav@edublogs.org', '390-672-7575', '2022-05-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Romona', 'Boribal', 'rboribalaw@ning.com', '349-365-6575', '2021-03-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nicolle', 'MacCosto', 'nmaccostoax@census.gov', '637-618-7433', '2020-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tabbatha', 'Mayoh', 'tmayohay@angelfire.com', '608-195-0363', '2020-08-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Skylar', 'Danelutti', 'sdaneluttiaz@t.co', '356-162-4099', '2023-10-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Regan', 'Riddler', 'rriddlerb0@google.ca', '469-582-2768', '2023-01-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darcey', 'Smogur', 'dsmogurb1@amazon.de', '312-244-1350', '2024-03-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sherm', 'Rudman', 'srudmanb2@trellian.com', '794-531-1456', '2021-03-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Linea', 'MacDonough', 'lmacdonoughb3@indiatimes.com', '559-878-6952', '2020-03-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Onofredo', 'Wheal', 'owhealb4@meetup.com', '532-345-1165', '2020-11-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rory', 'MacDaid', 'rmacdaidb5@artisteer.com', '318-849-2113', '2025-02-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rabbi', 'Purselow', 'rpurselowb6@desdev.cn', '440-627-0398', '2025-08-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marcile', 'Pavlata', 'mpavlatab7@cornell.edu', '328-550-2631', '2024-04-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aylmer', 'Lambarton', 'alambartonb8@is.gd', '551-592-4645', '2020-10-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Austin', 'Stoyell', 'astoyellb9@sohu.com', '344-485-9434', '2025-11-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nicoli', 'Daniau', 'ndaniauba@infoseek.co.jp', '981-233-1810', '2025-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elnore', 'Yurinov', 'eyurinovbb@xing.com', '667-113-9788', '2023-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Baird', 'Leatham', 'bleathambc@geocities.jp', '260-180-1050', '2025-10-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Addy', 'Meddings', 'ameddingsbd@cdc.gov', '387-940-3600', '2021-05-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cortie', 'Felix', 'cfelixbe@yahoo.com', '230-787-0470', '2023-04-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chere', 'Tilbrook', 'ctilbrookbf@timesonline.co.uk', '955-539-2676', '2020-11-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dalton', 'Cake', 'dcakebg@ehow.com', '435-942-6503', '2024-09-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ardeen', 'Piechnik', 'apiechnikbh@sfgate.com', '583-433-3160', '2020-09-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Theodor', 'Caves', 'tcavesbi@ebay.com', '755-502-1780', '2025-10-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cyrille', 'Breadmore', 'cbreadmorebj@edublogs.org', '586-693-4580', '2025-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nil', 'Wrathall', 'nwrathallbk@harvard.edu', '565-146-8498', '2022-12-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wanids', 'Judson', 'wjudsonbl@wix.com', '175-208-7010', '2020-11-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rosmunda', 'McAlpine', 'rmcalpinebm@businesswire.com', '842-897-7970', '2022-06-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nels', 'Coote', 'ncootebn@nationalgeographic.com', '395-638-1087', '2023-06-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cornie', 'Lukas', 'clukasbo@behance.net', '431-652-6598', '2023-04-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tana', 'Streetfield', 'tstreetfieldbp@mashable.com', '282-451-8920', '2022-02-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cloris', 'Fost', 'cfostbq@naver.com', '347-799-0814', '2023-12-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aldus', 'Gemeau', 'agemeaubr@illinois.edu', '438-505-9127', '2021-08-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dwayne', 'Pankhurst.', 'dpankhurstbs@elegantthemes.com', '848-657-4540', '2023-11-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lavinie', 'Kix', 'lkixbt@i2i.jp', '971-613-0264', '2024-06-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ebeneser', 'Janeczek', 'ejaneczekbu@samsung.com', '238-493-6172', '2020-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marj', 'Alger', 'malgerbv@ebay.com', '713-803-2561', '2025-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ellissa', 'Vennart', 'evennartbw@shareasale.com', '408-651-6458', '2022-12-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rustie', 'Touson', 'rtousonbx@about.com', '385-570-0828', '2021-07-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darla', 'Pougher', 'dpougherby@blinklist.com', '812-635-5415', '2021-10-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Charmain', 'Biggadike', 'cbiggadikebz@sourceforge.net', '829-160-5283', '2020-06-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harriette', 'Jamrowicz', 'hjamrowiczc0@tamu.edu', '865-452-2280', '2024-05-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jeno', 'Raddan', 'jraddanc1@ifeng.com', '565-482-0549', '2023-09-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lothaire', 'Hannum', 'lhannumc2@cloudflare.com', '449-122-9370', '2020-02-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joachim', 'Hanington', 'jhaningtonc3@mozilla.com', '654-763-4320', '2021-03-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Othello', 'Pernell', 'opernellc4@dmoz.org', '280-816-3520', '2020-06-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Millicent', 'Huckstepp', 'mhucksteppc5@ucoz.ru', '876-175-7973', '2023-05-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elyse', 'Kingswold', 'ekingswoldc6@arizona.edu', '202-703-7256', '2025-10-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mia', 'Ablitt', 'mablittc7@webeden.co.uk', '508-175-1893', '2021-09-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ingram', 'O''Keaveny', 'iokeavenyc8@canalblog.com', '867-876-7268', '2020-07-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Violet', 'Brimson', 'vbrimsonc9@mapy.cz', '394-715-7528', '2021-04-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Xylia', 'Crotty', 'xcrottyca@seattletimes.com', '805-346-0891', '2024-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cherice', 'Stutely', 'cstutelycb@apple.com', '484-877-6885', '2021-01-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marjy', 'Kinnard', 'mkinnardcc@theguardian.com', '127-421-0816', '2023-09-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noak', 'Lehrmann', 'nlehrmanncd@joomla.org', '162-940-9186', '2020-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aline', 'Spellard', 'aspellardce@moonfruit.com', '178-458-1251', '2020-03-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lexi', 'Cranage', 'lcranagecf@ucla.edu', '618-140-0513', '2022-06-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shem', 'Donoher', 'sdonohercg@wufoo.com', '319-766-0951', '2025-09-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kirby', 'McDowall', 'kmcdowallch@digg.com', '627-500-8273', '2024-11-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Saba', 'Burnell', 'sburnellci@nsw.gov.au', '823-871-9391', '2022-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Son', 'Ringwood', 'sringwoodcj@networksolutions.com', '827-821-1543', '2023-09-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bonita', 'Bodycote', 'bbodycoteck@nih.gov', '815-710-2051', '2021-01-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Saleem', 'Densun', 'sdensuncl@zdnet.com', '655-865-8478', '2022-09-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Berget', 'Cloney', 'bcloneycm@mac.com', '942-330-2700', '2021-03-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Con', 'Woodruffe', 'cwoodruffecn@nsw.gov.au', '831-666-8709', '2020-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vanna', 'Georges', 'vgeorgesco@list-manage.com', '941-714-3080', '2022-07-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maynard', 'Berriball', 'mberriballcp@1688.com', '544-633-8980', '2025-08-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jany', 'Aulsford', 'jaulsfordcq@ifeng.com', '855-910-5909', '2025-04-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaquelin', 'Kingdon', 'jkingdoncr@comcast.net', '163-994-3160', '2024-07-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Austine', 'Naldrett', 'analdrettcs@gizmodo.com', '116-249-5729', '2024-08-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Staffard', 'Brightey', 'sbrighteyct@economist.com', '109-123-7572', '2024-04-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Andy', 'Schukraft', 'aschukraftcu@forbes.com', '380-115-4271', '2023-09-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Roxane', 'Dakhov', 'rdakhovcv@ibm.com', '601-711-5149', '2021-11-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Daisie', 'Baysting', 'dbaystingcw@arizona.edu', '951-766-3505', '2020-12-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Krishna', 'Gissop', 'kgissopcx@wsj.com', '269-998-8541', '2023-12-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gwenni', 'Roxbee', 'groxbeecy@comsenz.com', '781-589-7979', '2021-06-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Casper', 'Aspinal', 'caspinalcz@newyorker.com', '472-859-8216', '2021-10-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Keriann', 'Longmate', 'klongmated0@feedburner.com', '435-717-7709', '2023-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bordy', 'Esterbrook', 'besterbrookd1@icio.us', '541-101-8980', '2021-11-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('West', 'Counihan', 'wcounihand2@dailymail.co.uk', '998-978-4121', '2023-05-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Constantine', 'Brimmacombe', 'cbrimmacombed3@posterous.com', '208-808-3484', '2020-01-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sandie', 'Croux', 'scrouxd4@geocities.com', '417-398-2875', '2022-07-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Claribel', 'Scarsbrick', 'cscarsbrickd5@ucsd.edu', '304-895-1131', '2024-09-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gayleen', 'Hibling', 'ghiblingd6@sourceforge.net', '619-772-4944', '2025-05-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jeth', 'Proschek', 'jproschekd7@dot.gov', '407-161-6446', '2022-02-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harlene', 'Cottrill', 'hcottrilld8@slideshare.net', '105-370-5756', '2023-01-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nola', 'Walenta', 'nwalentad9@globo.com', '700-165-8694', '2020-03-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cthrine', 'Oxley', 'coxleyda@google.de', '535-391-9615', '2022-04-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shina', 'Bortolozzi', 'sbortolozzidb@mtv.com', '233-489-5313', '2020-12-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Johanna', 'Deyes', 'jdeyesdc@yale.edu', '372-843-8349', '2021-06-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Callie', 'Boyan', 'cboyandd@desdev.cn', '125-117-7075', '2021-02-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Colline', 'Triplow', 'ctriplowde@example.com', '360-826-7672', '2020-10-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gasper', 'Byng', 'gbyngdf@berkeley.edu', '940-425-2174', '2020-04-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reinhard', 'Flamank', 'rflamankdg@archive.org', '990-525-7127', '2024-09-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chrissie', 'Ducker', 'cduckerdh@phoca.cz', '509-657-4992', '2021-10-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lin', 'Dallimore', 'ldallimoredi@ezinearticles.com', '446-334-6694', '2024-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Martyn', 'Beams', 'mbeamsdj@phpbb.com', '925-686-3311', '2020-10-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Logan', 'Calcut', 'lcalcutdk@google.co.uk', '393-356-6698', '2024-10-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Isabelita', 'Kelinge', 'ikelingedl@e-recht24.de', '692-698-0481', '2024-01-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mella', 'Castelot', 'mcastelotdm@github.io', '985-982-1149', '2024-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alvira', 'Yardley', 'ayardleydn@exblog.jp', '660-799-4569', '2021-05-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garnet', 'Dengel', 'gdengeldo@yandex.ru', '361-395-2301', '2024-04-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ulrica', 'Cramp', 'ucrampdp@msn.com', '699-506-1684', '2020-05-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Clarine', 'Challener', 'cchallenerdq@nature.com', '649-930-5956', '2022-03-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nollie', 'Basnett', 'nbasnettdr@hp.com', '900-174-5891', '2025-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chet', 'Rossi', 'crossids@craigslist.org', '432-250-2080', '2022-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tabbitha', 'Stickells', 'tstickellsdt@jigsy.com', '846-384-5182', '2020-02-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ursola', 'Iannazzi', 'uiannazzidu@spiegel.de', '537-215-6495', '2024-10-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Caldwell', 'Beggio', 'cbeggiodv@google.cn', '409-232-3827', '2023-06-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Urbain', 'Buchan', 'ubuchandw@zimbio.com', '347-325-0115', '2024-02-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yoshiko', 'Connolly', 'yconnollydx@nps.gov', '797-245-4410', '2023-04-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Olympe', 'Gallo', 'ogallody@canalblog.com', '409-244-5932', '2024-01-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hermy', 'Sargant', 'hsargantdz@drupal.org', '468-816-2645', '2025-03-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gaynor', 'Peetermann', 'gpeetermanne0@artisteer.com', '623-618-2077', '2025-09-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reinaldo', 'Burvill', 'rburville1@w3.org', '429-858-0873', '2024-01-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Federica', 'Insko', 'finskoe2@tumblr.com', '592-977-7262', '2020-02-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rab', 'Olekhov', 'rolekhove3@github.io', '913-144-5013', '2024-11-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alix', 'Northcott', 'anorthcotte4@cbc.ca', '847-464-0347', '2020-12-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Morty', 'Dearness', 'mdearnesse5@gmpg.org', '824-753-0742', '2020-11-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Virgil', 'Muston', 'vmustone6@berkeley.edu', '779-673-1576', '2025-08-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Peri', 'Stellino', 'pstellinoe7@theatlantic.com', '984-915-9567', '2023-07-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tonye', 'Omand', 'tomande8@sourceforge.net', '743-277-2819', '2023-03-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Belvia', 'Tenbrug', 'btenbruge9@prlog.org', '868-563-7709', '2023-02-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bendix', 'Burland', 'bburlandea@ftc.gov', '680-807-0637', '2021-11-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Valerye', 'Kendred', 'vkendredeb@cocolog-nifty.com', '324-339-4053', '2020-06-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Delcina', 'Presslie', 'dpresslieec@discovery.com', '110-901-0249', '2020-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Luis', 'Aleksahkin', 'laleksahkined@google.fr', '401-674-1198', '2022-11-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Persis', 'Phlippi', 'pphlippiee@ycombinator.com', '706-970-4866', '2023-09-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Enrica', 'Futcher', 'efutcheref@i2i.jp', '490-828-8583', '2021-05-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hilliard', 'Erridge', 'herridgeeg@networksolutions.com', '690-989-5263', '2024-11-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lou', 'Quinnette', 'lquinnetteeh@indiatimes.com', '414-621-1019', '2024-04-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ester', 'Guilliatt', 'eguilliattei@marketwatch.com', '570-711-9580', '2024-03-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jed', 'Malling', 'jmallingej@ovh.net', '422-109-1888', '2025-06-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Consolata', 'Tonbye', 'ctonbyeek@list-manage.com', '556-676-6194', '2025-02-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lenard', 'Rainy', 'lrainyel@twitter.com', '700-924-0235', '2024-02-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darbee', 'Bellringer', 'dbellringerem@acquirethisname.com', '176-270-6838', '2021-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ashbey', 'Cluff', 'acluffen@unesco.org', '704-250-0181', '2021-04-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corena', 'Archanbault', 'carchanbaulteo@w3.org', '703-637-5047', '2024-11-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chuck', 'Jones', 'cjonesep@alexa.com', '450-866-8157', '2022-04-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Katha', 'Faldoe', 'kfaldoeeq@bloomberg.com', '707-693-3801', '2025-09-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jasun', 'Cantle', 'jcantleer@discuz.net', '581-689-7311', '2021-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Constance', 'Matonin', 'cmatonines@cyberchimps.com', '476-245-5795', '2024-01-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Daphne', 'Kenwood', 'dkenwoodet@tiny.cc', '819-602-9122', '2024-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wilmer', 'Long', 'wlongeu@amazon.co.uk', '628-362-3905', '2023-05-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Davie', 'Heliot', 'dheliotev@bloomberg.com', '106-598-9719', '2022-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wittie', 'Levermore', 'wlevermoreew@weather.com', '684-279-4357', '2024-10-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Avie', 'O''Keefe', 'aokeefeex@digg.com', '507-585-6301', '2024-10-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anetta', 'Drescher', 'adrescherey@jugem.jp', '212-197-3765', '2023-06-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aveline', 'Smy', 'asmyez@chicagotribune.com', '703-228-8706', '2025-07-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nicoli', 'Plessing', 'nplessingf0@cnet.com', '981-860-9343', '2021-05-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mariam', 'Fairnie', 'mfairnief1@theglobeandmail.com', '243-312-0967', '2025-06-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Suzette', 'Glasgow', 'sglasgowf2@goodreads.com', '451-754-5356', '2025-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kirstyn', 'Daunay', 'kdaunayf3@dagondesign.com', '806-706-9070', '2021-05-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joey', 'Dickenson', 'jdickensonf4@1688.com', '328-501-7288', '2025-04-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dorri', 'Kettlestringe', 'dkettlestringef5@sfgate.com', '702-199-6771', '2020-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Polly', 'Gommey', 'pgommeyf6@uol.com.br', '460-535-1729', '2025-10-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Codee', 'Broseman', 'cbrosemanf7@geocities.com', '948-860-2920', '2024-07-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Horten', 'Bahike', 'hbahikef8@oracle.com', '988-962-9344', '2023-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Erica', 'Riddeough', 'eriddeoughf9@pcworld.com', '257-563-2463', '2020-05-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brinna', 'Borkett', 'bborkettfa@who.int', '996-195-1441', '2024-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lesli', 'Aylmore', 'laylmorefb@alibaba.com', '570-721-1051', '2021-01-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cristie', 'Costall', 'ccostallfc@storify.com', '242-188-3822', '2023-06-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stillmann', 'Kleanthous', 'skleanthousfd@mozilla.com', '284-852-4858', '2023-07-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Renate', 'Skedge', 'rskedgefe@indiegogo.com', '938-907-8825', '2021-12-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Blakelee', 'Leeson', 'bleesonff@prnewswire.com', '538-499-6718', '2020-08-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Erl', 'Suscens', 'esuscensfg@mlb.com', '583-559-0152', '2022-12-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tabbi', 'Dryburgh', 'tdryburghfh@ihg.com', '831-958-4101', '2023-11-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Artur', 'Critoph', 'acritophfi@miibeian.gov.cn', '107-529-5555', '2025-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elmer', 'Martugin', 'emartuginfj@ocn.ne.jp', '131-522-3905', '2024-01-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rosalyn', 'Mountcastle', 'rmountcastlefk@bizjournals.com', '225-451-8312', '2020-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Falkner', 'Whife', 'fwhifefl@yelp.com', '433-376-7464', '2024-09-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carin', 'Cavee', 'ccaveefm@adobe.com', '784-291-1686', '2022-03-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Der', 'Plail', 'dplailfn@tumblr.com', '466-964-8976', '2020-08-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Maurise', 'Collis', 'mcollisfo@oakley.com', '962-486-9921', '2020-03-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fritz', 'Furzey', 'ffurzeyfp@whitehouse.gov', '836-314-3184', '2024-10-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('George', 'Moorton', 'gmoortonfq@uol.com.br', '312-494-6850', '2023-11-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Candace', 'Buttwell', 'cbuttwellfr@samsung.com', '897-100-8354', '2022-01-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nigel', 'Scranney', 'nscranneyfs@samsung.com', '730-804-9619', '2024-12-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alistair', 'Goligly', 'agoliglyft@ox.ac.uk', '863-568-2230', '2021-04-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hinda', 'Leaves', 'hleavesfu@china.com.cn', '324-134-7709', '2021-03-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lyndel', 'Kingman', 'lkingmanfv@wix.com', '943-195-0689', '2024-12-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Octavius', 'Ropkes', 'oropkesfw@ustream.tv', '777-103-1833', '2022-02-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nadiya', 'Whatley', 'nwhatleyfx@quantcast.com', '791-310-9395', '2025-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nealy', 'Duddin', 'nduddinfy@sogou.com', '750-711-3630', '2021-03-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Michel', 'Molohan', 'mmolohanfz@elpais.com', '543-580-8363', '2023-02-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emmalynn', 'Pittson', 'epittsong0@cafepress.com', '795-109-2001', '2021-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mathian', 'Triebner', 'mtriebnerg1@fc2.com', '381-733-4610', '2025-02-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kara', 'Lowbridge', 'klowbridgeg2@google.co.jp', '828-652-2699', '2025-10-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lory', 'Jennens', 'ljennensg3@smh.com.au', '531-485-3619', '2021-08-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reagen', 'Goldsack', 'rgoldsackg4@japanpost.jp', '397-133-6633', '2023-03-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carolin', 'Kubalek', 'ckubalekg5@npr.org', '835-321-0937', '2021-11-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dannye', 'Shapland', 'dshaplandg6@angelfire.com', '600-562-0903', '2022-07-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Boote', 'Callam', 'bcallamg7@cyberchimps.com', '120-709-0913', '2021-06-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cherice', 'Littell', 'clittellg8@hatena.ne.jp', '788-216-3006', '2020-08-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pascale', 'Fernandes', 'pfernandesg9@engadget.com', '787-481-0278', '2023-08-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garry', 'Teodorski', 'gteodorskiga@zimbio.com', '771-108-9565', '2024-11-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kellen', 'Erb', 'kerbgb@deliciousdays.com', '255-496-0147', '2022-05-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Benoite', 'Dufall', 'bdufallgc@diigo.com', '949-261-8277', '2022-09-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Claybourne', 'Trippack', 'ctrippackgd@msn.com', '538-381-3181', '2021-01-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emmaline', 'Stockau', 'estockauge@walmart.com', '868-146-5990', '2020-04-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annabell', 'Peakman', 'apeakmangf@google.de', '712-176-9373', '2021-01-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Starr', 'O''Hern', 'soherngg@spiegel.de', '380-452-9041', '2021-10-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Linette', 'Soro', 'lsorogh@va.gov', '238-496-8063', '2025-01-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Connie', 'Le Hucquet', 'clehucquetgi@sciencedaily.com', '867-894-3037', '2022-07-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rayner', 'Domone', 'rdomonegj@imgur.com', '408-778-4491', '2023-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Prentice', 'Parkins', 'pparkinsgk@ezinearticles.com', '824-373-8065', '2022-12-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vonny', 'McLane', 'vmclanegl@ucsd.edu', '597-924-9431', '2025-01-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wade', 'Pietrzyk', 'wpietrzykgm@ebay.co.uk', '289-892-9902', '2024-02-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chance', 'Vesty', 'cvestygn@thetimes.co.uk', '103-795-6632', '2021-09-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dionysus', 'Kamenar', 'dkamenargo@nydailynews.com', '241-384-2839', '2022-12-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cob', 'St Pierre', 'cstpierregp@europa.eu', '328-792-7009', '2024-04-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Benjy', 'Trazzi', 'btrazzigq@hugedomains.com', '946-772-6359', '2024-09-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Waverly', 'Ogger', 'woggergr@istockphoto.com', '375-963-9907', '2020-02-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Danya', 'Dahler', 'ddahlergs@ibm.com', '195-438-7687', '2020-12-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alexi', 'Lomasny', 'alomasnygt@loc.gov', '760-799-2950', '2022-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fernando', 'Collumbine', 'fcollumbinegu@cnbc.com', '258-627-7989', '2022-01-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tamqrah', 'Houlaghan', 'thoulaghangv@lycos.com', '400-647-5007', '2020-11-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kalie', 'Ventam', 'kventamgw@blogtalkradio.com', '571-383-5804', '2021-12-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Olenka', 'Grantham', 'ogranthamgx@t-online.de', '801-562-0781', '2023-06-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hakeem', 'Pashley', 'hpashleygy@ustream.tv', '912-377-5052', '2023-01-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bron', 'Elmer', 'belmergz@hao123.com', '963-197-0746', '2022-05-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Renelle', 'Foulds', 'rfouldsh0@amazon.de', '407-607-3380', '2021-12-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kati', 'Muggach', 'kmuggachh1@globo.com', '171-167-9482', '2024-02-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Merridie', 'Jouen', 'mjouenh2@abc.net.au', '816-347-0820', '2021-06-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tremain', 'Watling', 'twatlingh3@yellowbook.com', '923-577-1375', '2020-07-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brena', 'Fosher', 'bfosherh4@ustream.tv', '874-793-8076', '2022-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Prudence', 'Fredson', 'pfredsonh5@ibm.com', '476-184-3354', '2023-08-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rici', 'Jutson', 'rjutsonh6@google.fr', '509-932-7068', '2023-12-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Candida', 'Sphinxe', 'csphinxeh7@upenn.edu', '152-913-4624', '2024-11-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Oona', 'Weagener', 'oweagenerh8@google.fr', '486-908-8204', '2024-11-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adria', 'Hayden', 'ahaydenh9@miitbeian.gov.cn', '856-849-8435', '2023-10-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elmore', 'Ruffell', 'eruffellha@japanpost.jp', '151-901-0109', '2022-06-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emelen', 'McPeice', 'emcpeicehb@macromedia.com', '698-142-1815', '2022-07-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Roxine', 'Dun', 'rdunhc@mtv.com', '186-194-7769', '2024-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stanislaus', 'Harrill', 'sharrillhd@hc360.com', '991-973-0863', '2025-06-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lenette', 'Semour', 'lsemourhe@cisco.com', '750-594-7440', '2025-04-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bartholomeus', 'Bever', 'bbeverhf@timesonline.co.uk', '244-255-6582', '2022-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corbett', 'Pagen', 'cpagenhg@meetup.com', '422-455-3603', '2021-08-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Morganne', 'Nerne', 'mnernehh@ihg.com', '469-228-1410', '2025-06-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Georg', 'Hambribe', 'ghambribehi@usda.gov', '787-369-6894', '2022-05-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Frazier', 'Cruess', 'fcruesshj@cloudflare.com', '685-153-1889', '2023-08-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nataniel', 'Dundin', 'ndundinhk@engadget.com', '995-648-8980', '2021-09-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Loni', 'Kmicicki', 'lkmicickihl@feedburner.com', '547-590-3479', '2022-04-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emlen', 'Brand', 'ebrandhm@tiny.cc', '321-274-4987', '2020-01-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noam', 'Tolmie', 'ntolmiehn@furl.net', '594-171-0582', '2023-06-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lorens', 'D''Onisi', 'ldonisiho@goo.ne.jp', '696-999-1012', '2021-06-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corabelle', 'Paunsford', 'cpaunsfordhp@scientificamerican.com', '646-129-9055', '2022-01-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leontine', 'Treat', 'ltreathq@tinypic.com', '587-770-3569', '2024-05-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Britney', 'Olivera', 'boliverahr@topsy.com', '843-703-0801', '2023-05-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Erik', 'Le Gassick', 'elegassickhs@businesswire.com', '965-199-5776', '2023-09-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jami', 'Scrimshire', 'jscrimshireht@tiny.cc', '990-582-9835', '2025-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shermie', 'Viner', 'svinerhu@cpanel.net', '924-312-0001', '2021-04-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ariela', 'Currin', 'acurrinhv@dedecms.com', '145-958-3483', '2022-12-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Granthem', 'Borgars', 'gborgarshw@amazon.de', '679-737-0284', '2024-03-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Delilah', 'Jiggen', 'djiggenhx@va.gov', '747-891-8744', '2022-03-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garrot', 'Salsberg', 'gsalsberghy@quantcast.com', '185-549-0591', '2022-02-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lyn', 'Brownsea', 'lbrownseahz@elegantthemes.com', '381-535-7547', '2025-03-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Eldredge', 'Ratter', 'eratteri0@123-reg.co.uk', '137-524-2037', '2025-05-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jenni', 'MacConnechie', 'jmacconnechiei1@patch.com', '874-337-2948', '2021-10-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Winna', 'Smillie', 'wsmilliei2@army.mil', '408-306-5080', '2025-11-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Verena', 'Ramelet', 'vrameleti3@scribd.com', '620-846-7957', '2020-02-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cammy', 'Wodham', 'cwodhami4@1688.com', '890-433-1541', '2020-12-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Town', 'Lovstrom', 'tlovstromi5@cam.ac.uk', '946-496-0039', '2024-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Patton', 'Deegin', 'pdeegini6@google.ca', '756-340-9953', '2021-09-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anet', 'Rigney', 'arigneyi7@cnn.com', '182-621-4882', '2023-05-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nita', 'M''cowis', 'nmcowisi8@unesco.org', '409-707-2417', '2025-03-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Randie', 'Fewless', 'rfewlessi9@yahoo.com', '508-832-1038', '2023-11-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marji', 'Tollett', 'mtollettia@sogou.com', '715-568-2647', '2025-06-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Skelly', 'Caulton', 'scaultonib@symantec.com', '670-691-3538', '2022-07-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Thomasa', 'Blowfelde', 'tblowfeldeic@harvard.edu', '264-796-7154', '2024-06-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kent', 'Anetts', 'kanettsid@merriam-webster.com', '419-586-4843', '2024-11-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ardith', 'Dunnet', 'adunnetie@slideshare.net', '343-204-6033', '2021-10-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Todd', 'Anglin', 'tanglinif@marriott.com', '793-553-1355', '2025-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corine', 'Wolfer', 'cwolferig@1688.com', '512-557-9265', '2024-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bucky', 'Flux', 'bfluxih@youku.com', '531-968-7599', '2021-05-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Anna-maria', 'Plackstone', 'aplackstoneii@youtube.com', '622-856-0077', '2024-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Granthem', 'Beastall', 'gbeastallij@weebly.com', '527-853-7299', '2025-01-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Innis', 'Letchford', 'iletchfordik@answers.com', '880-703-7957', '2024-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Albrecht', 'McClinton', 'amcclintonil@wisc.edu', '882-279-9236', '2020-07-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Valencia', 'Pabel', 'vpabelim@telegraph.co.uk', '322-477-9895', '2020-02-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cristina', 'Marson', 'cmarsonin@mozilla.com', '210-981-5996', '2021-03-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mufi', 'Harkess', 'mharkessio@fda.gov', '546-762-8613', '2024-04-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Karrie', 'Nealey', 'knealeyip@dmoz.org', '142-383-5633', '2025-06-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Karlen', 'Fullager', 'kfullageriq@tinyurl.com', '613-475-0034', '2020-05-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cassy', 'Rusted', 'crustedir@delicious.com', '769-652-0781', '2021-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Angie', 'Greatland', 'agreatlandis@chronoengine.com', '993-843-2429', '2024-11-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Filip', 'Cosstick', 'fcosstickit@sphinn.com', '706-567-0976', '2020-12-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hendrick', 'Hampshire', 'hhampshireiu@ameblo.jp', '820-532-1090', '2024-08-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sybyl', 'Thurborn', 'sthurborniv@wunderground.com', '452-124-4250', '2024-01-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Madeleine', 'Justham', 'mjusthamiw@cdc.gov', '187-782-9614', '2025-08-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Christoffer', 'Beart', 'cbeartix@wunderground.com', '935-326-0130', '2024-05-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Birk', 'Kirstein', 'bkirsteiniy@apache.org', '611-801-3416', '2025-10-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Silvan', 'Kinsman', 'skinsmaniz@sun.com', '136-362-1399', '2020-03-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emmey', 'Duckitt', 'educkittj0@indiegogo.com', '109-214-4219', '2024-01-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Garrek', 'Enevold', 'genevoldj1@instagram.com', '924-379-2291', '2021-10-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joya', 'Roberto', 'jrobertoj2@printfriendly.com', '811-245-4200', '2024-06-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Betti', 'McLaren', 'bmclarenj3@altervista.org', '740-570-4446', '2020-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Madelaine', 'Wincott', 'mwincottj4@marketwatch.com', '871-736-0067', '2020-01-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sascha', 'Giral', 'sgiralj5@wsj.com', '544-130-6182', '2021-02-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carlina', 'Leehane', 'cleehanej6@cbslocal.com', '606-537-3237', '2024-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Farah', 'Hembrow', 'fhembrowj7@ocn.ne.jp', '815-591-5699', '2020-12-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Fulvia', 'Durrand', 'fdurrandj8@4shared.com', '715-371-2715', '2021-05-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ricki', 'Drowsfield', 'rdrowsfieldj9@nih.gov', '901-938-8835', '2021-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emmaline', 'Goodram', 'egoodramja@posterous.com', '481-735-2402', '2021-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wynnie', 'Aubery', 'wauberyjb@flickr.com', '624-288-3656', '2024-02-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Griff', 'Corton', 'gcortonjc@netlog.com', '930-482-7941', '2025-04-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Darcey', 'Szymonowicz', 'dszymonowiczjd@state.tx.us', '668-535-2916', '2023-07-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Horace', 'Timmens', 'htimmensje@hao123.com', '198-833-1203', '2020-08-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('George', 'Marklin', 'gmarklinjf@usatoday.com', '715-738-2781', '2024-03-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Melitta', 'Wolver', 'mwolverjg@state.gov', '780-412-6784', '2022-10-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vivienne', 'Lovstrom', 'vlovstromjh@altervista.org', '671-697-0241', '2025-05-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Charlot', 'Cyseley', 'ccyseleyji@technorati.com', '920-343-8058', '2023-02-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sloan', 'Leve', 'slevejj@unesco.org', '683-683-1829', '2021-01-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bryn', 'McNeish', 'bmcneishjk@blogger.com', '992-698-0010', '2023-10-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noak', 'McAvaddy', 'nmcavaddyjl@weibo.com', '386-394-5567', '2023-06-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ginni', 'Graddell', 'ggraddelljm@netvibes.com', '433-664-2753', '2020-12-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bobbi', 'Surman-Wells', 'bsurmanwellsjn@plala.or.jp', '166-858-8081', '2021-10-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Debor', 'Cathel', 'dcatheljo@clickbank.net', '621-814-4110', '2021-06-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dione', 'Beardsell', 'dbeardselljp@epa.gov', '136-574-5335', '2023-10-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yule', 'Kelmere', 'ykelmerejq@delicious.com', '717-412-3800', '2020-02-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kariotta', 'Geipel', 'kgeipeljr@gov.uk', '297-616-6819', '2021-01-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stefania', 'Matskevich', 'smatskevichjs@mail.ru', '251-473-0321', '2021-06-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noel', 'O''Deegan', 'nodeeganjt@businessweek.com', '673-320-2933', '2021-09-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nealy', 'Thompkins', 'nthompkinsju@forbes.com', '202-186-8075', '2025-10-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Niles', 'Halt', 'nhaltjv@aboutads.info', '645-636-2700', '2024-11-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Danella', 'Kilgrove', 'dkilgrovejw@ft.com', '462-660-7099', '2022-03-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Virginie', 'Landal', 'vlandaljx@storify.com', '514-270-3016', '2022-09-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bryan', 'Lowry', 'blowryjy@soundcloud.com', '249-204-0245', '2020-12-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lynett', 'McDuffy', 'lmcduffyjz@reddit.com', '290-924-4142', '2022-08-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cornelia', 'Poundesford', 'cpoundesfordk0@yandex.ru', '304-604-3593', '2021-10-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nikolai', 'Curdell', 'ncurdellk1@fastcompany.com', '598-258-0634', '2023-04-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bernette', 'Van Merwe', 'bvanmerwek2@cdc.gov', '542-420-2474', '2025-11-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Oran', 'Rasmus', 'orasmusk3@skyrock.com', '118-871-9027', '2022-03-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alessandra', 'Upcott', 'aupcottk4@soup.io', '611-742-0187', '2023-10-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aurilia', 'Boom', 'aboomk5@google.it', '387-799-2721', '2021-07-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Irma', 'Algy', 'ialgyk6@go.com', '178-165-7445', '2022-04-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Beverley', 'Statton', 'bstattonk7@dyndns.org', '520-378-8403', '2021-11-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Golda', 'Allebone', 'gallebonek8@google.pl', '824-561-3660', '2023-02-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ferd', 'Coalburn', 'fcoalburnk9@over-blog.com', '537-609-2192', '2021-01-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cassandry', 'Lampe', 'clampeka@ifeng.com', '118-138-9219', '2020-06-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mathilda', 'Bashford', 'mbashfordkb@etsy.com', '196-979-8118', '2024-01-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aldo', 'Quillinane', 'aquillinanekc@themeforest.net', '572-447-5218', '2024-01-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dannel', 'Bridel', 'dbridelkd@nytimes.com', '365-876-1908', '2021-12-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hilly', 'Detloff', 'hdetloffke@meetup.com', '326-265-2295', '2022-05-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Obed', 'Tunn', 'otunnkf@delicious.com', '480-564-2367', '2025-10-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yankee', 'Wandless', 'ywandlesskg@samsung.com', '661-903-6932', '2025-02-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rudolph', 'Godehard.sf', 'rgodehardsfkh@ted.com', '120-579-2149', '2023-09-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cammy', 'Brookes', 'cbrookeski@printfriendly.com', '815-750-7032', '2024-09-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Avie', 'Mahmood', 'amahmoodkj@earthlink.net', '807-117-8920', '2022-06-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Norine', 'Garrow', 'ngarrowkk@auda.org.au', '127-846-4147', '2023-07-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lamar', 'Oda', 'lodakl@japanpost.jp', '605-959-0378', '2022-02-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yalonda', 'Fellowes', 'yfelloweskm@aboutads.info', '372-745-2954', '2023-07-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Juditha', 'Wavell', 'jwavellkn@360.cn', '770-648-8755', '2024-01-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Octavius', 'Golthorpp', 'ogolthorppko@tinyurl.com', '617-215-6473', '2024-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rorke', 'Beveredge', 'rbeveredgekp@state.tx.us', '198-769-0466', '2020-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Milo', 'Beininck', 'mbeininckkq@i2i.jp', '756-679-9599', '2023-10-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pansie', 'Salvador', 'psalvadorkr@dropbox.com', '610-792-5525', '2020-10-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wye', 'Lacheze', 'wlachezeks@imageshack.us', '792-557-8975', '2020-06-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lark', 'Magarrell', 'lmagarrellkt@youku.com', '764-326-6590', '2020-08-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tamra', 'Hugonin', 'thugoninku@xing.com', '953-788-0287', '2024-06-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Georgeanne', 'Reddlesden', 'greddlesdenkv@google.ca', '403-932-0587', '2025-10-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kane', 'Scarce', 'kscarcekw@tamu.edu', '123-415-4598', '2020-06-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jonah', 'Brumbye', 'jbrumbyekx@blinklist.com', '894-392-0766', '2022-04-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Teressa', 'Smees', 'tsmeesky@wix.com', '240-426-0139', '2022-09-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Madison', 'Antos', 'mantoskz@oracle.com', '991-314-0523', '2023-10-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Phyllys', 'Kollasch', 'pkollaschl0@globo.com', '446-417-3586', '2020-05-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zulema', 'Haggerwood', 'zhaggerwoodl1@skype.com', '832-844-3718', '2023-10-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Damara', 'Varfolomeev', 'dvarfolomeevl2@dyndns.org', '366-293-0474', '2023-08-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Renata', 'Guidelli', 'rguidellil3@desdev.cn', '158-300-6323', '2024-11-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wandis', 'Shimman', 'wshimmanl4@theguardian.com', '888-387-0386', '2024-12-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Isaac', 'Gerbl', 'igerbll5@t.co', '677-216-7393', '2024-01-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jannel', 'Wilkerson', 'jwilkersonl6@nymag.com', '390-910-4042', '2025-09-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Donna', 'Slyde', 'dslydel7@mac.com', '712-600-9157', '2025-06-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Doria', 'Laherty', 'dlahertyl8@bigcartel.com', '570-815-3758', '2025-09-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Derry', 'Celle', 'dcellel9@hud.gov', '968-531-9012', '2021-08-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hewett', 'Drysdell', 'hdrysdellla@imdb.com', '927-628-0941', '2023-05-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cindelyn', 'Jeannel', 'cjeannellb@bloglines.com', '687-339-9586', '2025-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Faun', 'Jon', 'fjonlc@trellian.com', '647-166-5082', '2024-03-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rozina', 'Sirett', 'rsirettld@yelp.com', '472-776-8553', '2023-04-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Milton', 'Sebright', 'msebrightle@youtu.be', '904-420-1763', '2024-07-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marnie', 'Elwell', 'melwelllf@google.co.uk', '781-172-5376', '2022-03-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Geri', 'Gouldstraw', 'ggouldstrawlg@mlb.com', '148-873-0881', '2024-07-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elsworth', 'Garfoot', 'egarfootlh@tumblr.com', '229-525-8310', '2021-05-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Novelia', 'Huddy', 'nhuddyli@blogspot.com', '771-657-7607', '2021-10-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shani', 'Josey', 'sjoseylj@princeton.edu', '792-833-8973', '2021-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Benton', 'Loveless', 'blovelesslk@github.io', '704-352-6847', '2022-01-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sofie', 'Stribling', 'sstriblingll@shutterfly.com', '926-989-8681', '2023-04-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Giffy', 'Grevatt', 'ggrevattlm@is.gd', '875-119-8898', '2023-11-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Beaufort', 'Eddie', 'beddieln@ebay.com', '941-999-2385', '2020-10-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nora', 'Oganesian', 'noganesianlo@google.ru', '963-279-6120', '2020-05-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Myer', 'Slowey', 'msloweylp@cnet.com', '990-872-1418', '2024-08-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ambros', 'Minichillo', 'aminichillolq@bloglines.com', '775-311-8853', '2020-06-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hale', 'Shillitoe', 'hshillitoelr@utexas.edu', '168-937-8081', '2022-07-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Erich', 'Winckle', 'ewincklels@upenn.edu', '668-607-6017', '2022-10-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hazel', 'Fittes', 'hfitteslt@wired.com', '732-218-3008', '2022-07-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hertha', 'Hillitt', 'hhillittlu@alibaba.com', '391-640-8825', '2024-07-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adelina', 'Owenson', 'aowensonlv@sogou.com', '378-589-4219', '2023-02-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Normy', 'Wyper', 'nwyperlw@canalblog.com', '277-856-7446', '2023-05-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Melba', 'Ashard', 'mashardlx@eventbrite.com', '755-868-8004', '2025-01-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Roger', 'Wooland', 'rwoolandly@parallels.com', '560-886-6605', '2024-08-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Britt', 'Nicholson', 'bnicholsonlz@earthlink.net', '247-261-7629', '2022-12-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gonzalo', 'Kleiner', 'gkleinerm0@dagondesign.com', '368-332-8560', '2024-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nadeen', 'Caswill', 'ncaswillm1@comsenz.com', '338-112-1804', '2025-08-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Filip', 'Ricciardiello', 'fricciardiellom2@liveinternet.ru', '852-602-1464', '2024-02-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nerty', 'Annice', 'nannicem3@yahoo.com', '240-429-2167', '2021-12-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sheena', 'Abrahams', 'sabrahamsm4@bandcamp.com', '563-773-2367', '2020-04-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brett', 'Cowely', 'bcowelym5@fotki.com', '313-596-1703', '2023-05-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Humphrey', 'Colpus', 'hcolpusm6@google.fr', '448-527-2906', '2024-12-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ludvig', 'Fourcade', 'lfourcadem7@prweb.com', '376-250-1959', '2024-03-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Allyn', 'Prattington', 'aprattingtonm8@aboutads.info', '840-267-8368', '2024-10-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yevette', 'Grain', 'ygrainm9@discovery.com', '708-429-8444', '2022-06-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Regina', 'Lambertazzi', 'rlambertazzima@umn.edu', '266-765-9919', '2021-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jillie', 'Axten', 'jaxtenmb@ebay.co.uk', '202-951-0114', '2024-05-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Berk', 'Slight', 'bslightmc@slideshare.net', '400-636-8311', '2020-05-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Iolanthe', 'Schiefersten', 'ischieferstenmd@usnews.com', '608-216-9438', '2021-03-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Deeanne', 'Dunklee', 'ddunkleeme@desdev.cn', '912-887-9397', '2022-09-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tresa', 'Clewes', 'tclewesmf@engadget.com', '591-131-8320', '2023-04-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kati', 'Quemby', 'kquembymg@wikimedia.org', '210-530-9665', '2020-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dacie', 'Gorwood', 'dgorwoodmh@forbes.com', '653-212-4151', '2020-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Karlis', 'Clardge', 'kclardgemi@google.it', '353-674-7588', '2022-10-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kristina', 'Botwood', 'kbotwoodmj@cbsnews.com', '148-684-1713', '2021-06-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Keeley', 'De-Ville', 'kdevillemk@arizona.edu', '967-493-6773', '2025-07-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Mina', 'Tavernor', 'mtavernorml@typepad.com', '599-932-0213', '2023-05-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zechariah', 'Kilgour', 'zkilgourmm@mozilla.org', '790-164-6412', '2025-06-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annie', 'Stebbins', 'astebbinsmn@ehow.com', '514-456-3704', '2021-06-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gayel', 'Claypoole', 'gclaypoolemo@weebly.com', '433-549-4419', '2021-05-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Eal', 'Wakeford', 'ewakefordmp@theglobeandmail.com', '141-462-4957', '2021-02-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Patsy', 'Summerson', 'psummersonmq@baidu.com', '478-947-6452', '2022-03-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaquenetta', 'Haucke', 'jhauckemr@dagondesign.com', '227-933-2231', '2023-08-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jessalin', 'Fairrie', 'jfairriems@stanford.edu', '613-695-2608', '2023-03-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Evvy', 'Loveridge', 'eloveridgemt@tinypic.com', '727-908-5287', '2023-01-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leyla', 'Leak', 'lleakmu@xrea.com', '519-964-4071', '2023-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Blair', 'Shimoni', 'bshimonimv@pinterest.com', '105-737-3444', '2023-02-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tony', 'Pauncefoot', 'tpauncefootmw@unc.edu', '304-807-5150', '2021-07-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zachariah', 'Breeton', 'zbreetonmx@hubpages.com', '158-553-9703', '2021-08-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Andrew', 'Hazeley', 'ahazeleymy@merriam-webster.com', '832-177-1615', '2025-05-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Reinaldos', 'Radcliffe', 'rradcliffemz@boston.com', '629-279-5289', '2023-09-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Franchot', 'Litterick', 'flitterickn0@ustream.tv', '540-386-7378', '2020-04-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Murray', 'Broscombe', 'mbroscomben1@opera.com', '278-904-3753', '2022-01-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dido', 'Cardenoza', 'dcardenozan2@ucsd.edu', '165-829-0598', '2023-10-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Licha', 'Pullan', 'lpullann3@privacy.gov.au', '547-876-4505', '2020-09-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Friedrick', 'Ahrenius', 'fahreniusn4@dyndns.org', '185-224-4824', '2024-10-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Konstance', 'Webland', 'kweblandn5@lycos.com', '461-473-7189', '2020-03-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Valeria', 'McInally', 'vmcinallyn6@github.io', '663-215-2004', '2022-07-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Willa', 'Ousby', 'wousbyn7@woothemes.com', '870-306-6594', '2020-04-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Harwell', 'Akess', 'hakessn8@spotify.com', '732-471-0422', '2022-12-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sharyl', 'Planks', 'splanksn9@noaa.gov', '666-873-7110', '2020-11-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Eulalie', 'Valerius', 'evaleriusna@blinklist.com', '411-548-5255', '2024-05-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brittan', 'Nail', 'bnailnb@cam.ac.uk', '335-198-3382', '2020-08-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Shadow', 'Pearse', 'spearsenc@webmd.com', '788-372-6223', '2020-08-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bell', 'Jarlmann', 'bjarlmannnd@alibaba.com', '956-798-7111', '2021-07-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stephi', 'Dooly', 'sdoolyne@smugmug.com', '996-895-1763', '2024-08-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Laurianne', 'Sherbrook', 'lsherbrooknf@ebay.com', '543-570-6432', '2021-08-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carley', 'Bradwell', 'cbradwellng@japanpost.jp', '767-815-1382', '2020-08-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alistair', 'McTrustrie', 'amctrustrienh@icq.com', '628-695-6418', '2021-05-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Deena', 'Phelipeaux', 'dphelipeauxni@facebook.com', '666-818-4223', '2024-08-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rubia', 'Cheek', 'rcheeknj@buzzfeed.com', '660-785-5509', '2025-02-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zachery', 'Espadater', 'zespadaternk@creativecommons.org', '793-751-9871', '2024-07-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Staffard', 'Hurll', 'shurllnl@sakura.ne.jp', '716-226-7547', '2022-09-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Perrine', 'Osbaldstone', 'posbaldstonenm@google.nl', '626-117-6926', '2024-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cindie', 'Faustin', 'cfaustinnn@unicef.org', '280-853-8235', '2023-12-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Issie', 'Argo', 'iargono@sbwire.com', '714-300-1506', '2022-05-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bettine', 'Brosio', 'bbrosionp@tinyurl.com', '683-989-0387', '2023-12-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brinna', 'Bussy', 'bbussynq@live.com', '289-867-5502', '2022-10-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Carlyle', 'Kabos', 'ckabosnr@ebay.co.uk', '995-402-8439', '2021-06-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gert', 'Splevin', 'gsplevinns@wisc.edu', '560-164-8329', '2024-07-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Laina', 'Pren', 'lprennt@geocities.com', '380-854-7053', '2023-11-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pancho', 'Tiddy', 'ptiddynu@oakley.com', '129-862-7020', '2022-12-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Irvine', 'Twelftree', 'itwelftreenv@tuttocitta.it', '118-703-1715', '2024-08-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Redford', 'Carrol', 'rcarrolnw@youtube.com', '624-811-3094', '2020-01-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stephannie', 'Parker', 'sparkernx@gov.uk', '832-223-7962', '2020-04-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Karlan', 'Kears', 'kkearsny@disqus.com', '451-336-3883', '2025-10-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Derick', 'Barnfield', 'dbarnfieldnz@chronoengine.com', '256-430-4771', '2025-07-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Balduin', 'Amey', 'bameyo0@barnesandnoble.com', '257-536-0413', '2022-03-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Duffy', 'Poncet', 'dponceto1@intel.com', '952-958-9241', '2023-06-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Arie', 'Burmingham', 'aburminghamo2@sciencedaily.com', '148-612-1298', '2021-10-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wilbert', 'Townson', 'wtownsono3@upenn.edu', '418-401-3138', '2024-01-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bat', 'McTerrelly', 'bmcterrellyo4@pbs.org', '872-359-2891', '2021-01-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bryan', 'Dick', 'bdicko5@psu.edu', '771-513-6953', '2021-04-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rustie', 'Simyson', 'rsimysono6@npr.org', '374-800-4647', '2025-06-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Philippine', 'McNalley', 'pmcnalleyo7@ucoz.com', '348-658-3693', '2024-08-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Paolo', 'Garman', 'pgarmano8@odnoklassniki.ru', '757-403-3234', '2023-12-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Blinny', 'Foster', 'bfostero9@springer.com', '823-634-3641', '2022-12-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Raviv', 'Caunce', 'rcaunceoa@toplist.cz', '768-329-4734', '2022-12-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gardner', 'O''Longain', 'golongainob@technorati.com', '999-585-9187', '2021-12-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dewain', 'Younger', 'dyoungeroc@reddit.com', '994-103-8977', '2023-01-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Danyette', 'Valentin', 'dvalentinod@storify.com', '901-592-0215', '2022-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Candie', 'Spick', 'cspickoe@washington.edu', '708-183-6158', '2025-10-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Zita', 'Lindblom', 'zlindblomof@storify.com', '565-183-5319', '2022-08-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bella', 'McCoish', 'bmccoishog@toplist.cz', '621-626-9848', '2021-06-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cherianne', 'Preddy', 'cpreddyoh@xrea.com', '118-267-2164', '2021-06-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stacey', 'Reaman', 'sreamanoi@guardian.co.uk', '845-970-7961', '2021-01-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Amity', 'Felce', 'afelceoj@facebook.com', '614-998-1602', '2020-05-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brendin', 'Vedekhov', 'bvedekhovok@wikispaces.com', '533-901-9034', '2023-07-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kissee', 'Southard', 'ksouthardol@constantcontact.com', '257-902-8484', '2021-05-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Celene', 'Toplin', 'ctoplinom@sbwire.com', '498-681-6871', '2021-08-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lisa', 'Flippen', 'lflippenon@marketwatch.com', '342-504-6073', '2021-08-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Galvan', 'Tong', 'gtongoo@w3.org', '272-761-6721', '2023-02-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Margaretha', 'Giamo', 'mgiamoop@symantec.com', '926-137-7043', '2025-05-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alejandra', 'Stevenson', 'astevensonoq@merriam-webster.com', '227-659-2227', '2024-07-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Edin', 'Gregoli', 'egregolior@census.gov', '847-215-4429', '2024-04-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pennie', 'Romanin', 'promaninos@eepurl.com', '642-794-6133', '2020-08-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Auguste', 'La Wille', 'alawilleot@census.gov', '537-140-8885', '2023-04-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ricky', 'de Clerk', 'rdeclerkou@slideshare.net', '505-722-3257', '2024-12-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Prudence', 'Stiling', 'pstilingov@spotify.com', '847-832-8380', '2025-01-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kelly', 'Poundford', 'kpoundfordow@howstuffworks.com', '420-789-8196', '2023-06-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Quintilla', 'Stonehouse', 'qstonehouseox@unblog.fr', '697-278-9587', '2024-04-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Linus', 'Stilliard', 'lstilliardoy@nasa.gov', '552-255-3746', '2023-10-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Massimiliano', 'Osichev', 'mosichevoz@blogtalkradio.com', '199-157-1756', '2025-04-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alix', 'Lorentz', 'alorentzp0@arstechnica.com', '403-992-6012', '2024-07-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jerome', 'Aldersley', 'jaldersleyp1@oakley.com', '264-521-0796', '2022-07-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gavra', 'Danis', 'gdanisp2@histats.com', '799-692-8844', '2021-11-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lorena', 'Hazelhurst', 'lhazelhurstp3@tiny.cc', '172-660-6378', '2022-03-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ronny', 'Meedendorpe', 'rmeedendorpep4@delicious.com', '563-535-0986', '2021-08-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nerissa', 'Suddell', 'nsuddellp5@mac.com', '528-797-1441', '2021-10-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Andris', 'Wenden', 'awendenp6@cocolog-nifty.com', '382-557-1168', '2023-06-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sylvester', 'Troake', 'stroakep7@hc360.com', '947-368-2143', '2021-01-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Griffy', 'Thiem', 'gthiemp8@pcworld.com', '249-361-3064', '2023-07-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Isac', 'Guilleton', 'iguilletonp9@mail.ru', '754-759-8256', '2025-10-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Cam', 'Thomasset', 'cthomassetpa@joomla.org', '647-128-6258', '2022-08-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Friedrich', 'Lunge', 'flungepb@sciencedirect.com', '801-798-9943', '2020-08-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hallie', 'Hartill', 'hhartillpc@shop-pro.jp', '509-938-7348', '2020-05-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jaquith', 'O'' Borne', 'jobornepd@ebay.com', '983-960-1846', '2025-11-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Paulette', 'Hessentaler', 'phessentalerpe@paypal.com', '249-560-2741', '2022-11-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ricardo', 'Boseley', 'rboseleypf@whitehouse.gov', '201-120-5666', '2025-01-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tanhya', 'Baily', 'tbailypg@ehow.com', '884-175-7232', '2023-06-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dilan', 'Grigorkin', 'dgrigorkinph@eventbrite.com', '369-848-9129', '2023-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Chase', 'Wintour', 'cwintourpi@gov.uk', '376-515-7967', '2023-02-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Romain', 'Camidge', 'rcamidgepj@technorati.com', '854-526-6677', '2024-10-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Luke', 'Brannigan', 'lbranniganpk@nasa.gov', '849-831-0565', '2024-03-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Leonore', 'Pabelik', 'lpabelikpl@alexa.com', '158-831-7870', '2020-03-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dunstan', 'Latta', 'dlattapm@g.co', '585-991-9215', '2022-02-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alfonse', 'Ironside', 'aironsidepn@dyndns.org', '684-976-5761', '2023-12-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Liliane', 'Attle', 'lattlepo@jigsy.com', '540-606-1599', '2023-11-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Martin', 'Lambirth', 'mlambirthpp@comcast.net', '310-719-0589', '2023-10-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Blaine', 'Rickell', 'brickellpq@networksolutions.com', '437-615-9058', '2020-01-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ly', 'Florentine', 'lflorentinepr@liveinternet.ru', '472-321-6466', '2022-03-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hy', 'Goning', 'hgoningps@guardian.co.uk', '518-339-4979', '2020-11-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Alberto', 'Dirand', 'adirandpt@blogger.com', '746-164-1656', '2020-09-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Haily', 'Gommey', 'hgommeypu@xrea.com', '418-374-7923', '2024-04-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bamby', 'Morgans', 'bmorganspv@jimdo.com', '396-802-9931', '2024-09-18');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marlee', 'Benterman', 'mbentermanpw@multiply.com', '427-156-0811', '2025-11-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sammie', 'Brear', 'sbrearpx@unesco.org', '376-531-4014', '2023-05-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tabina', 'Coldbath', 'tcoldbathpy@ihg.com', '701-461-6063', '2024-02-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Salli', 'Elliss', 'sellisspz@ucoz.ru', '486-982-7188', '2022-12-08');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Brigitta', 'Stilgoe', 'bstilgoeq0@bizjournals.com', '687-598-6455', '2022-01-04');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annabell', 'Statter', 'astatterq1@soundcloud.com', '491-839-3392', '2025-01-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Abbie', 'Lamprecht', 'alamprechtq2@comcast.net', '623-987-8808', '2025-09-23');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Nanon', 'Harbar', 'nharbarq3@example.com', '354-429-3054', '2025-09-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pennie', 'Merwede', 'pmerwedeq4@meetup.com', '475-131-4896', '2023-03-19');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gray', 'MacRory', 'gmacroryq5@pen.io', '301-263-3650', '2020-12-05');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Kassey', 'De Ambrosi', 'kdeambrosiq6@si.edu', '414-740-2483', '2024-09-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ikey', 'Fennell', 'ifennellq7@wufoo.com', '295-902-2392', '2024-11-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elizabeth', 'Fitzharris', 'efitzharrisq8@wired.com', '358-536-8748', '2024-03-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Francene', 'Tomlins', 'ftomlinsq9@yolasite.com', '619-579-0834', '2023-09-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Wernher', 'Tuma', 'wtumaqa@posterous.com', '615-598-7752', '2021-11-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bobbie', 'Muscott', 'bmuscottqb@hp.com', '539-898-9222', '2024-10-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hunt', 'Peniello', 'hpenielloqc@printfriendly.com', '846-724-1082', '2024-03-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Faith', 'Lea', 'fleaqd@a8.net', '442-434-2723', '2024-11-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hailey', 'Sebright', 'hsebrightqe@google.ca', '490-700-6688', '2022-05-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Midge', 'Brik', 'mbrikqf@blog.com', '873-139-2288', '2020-07-25');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Barri', 'Tweedell', 'btweedellqg@omniture.com', '759-841-9517', '2024-12-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Robena', 'Thonger', 'rthongerqh@reference.com', '325-764-5011', '2024-04-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Aigneis', 'Cobbald', 'acobbaldqi@fastcompany.com', '676-218-2373', '2024-02-01');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Joane', 'Ferries', 'jferriesqj@elegantthemes.com', '475-857-7866', '2022-07-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Millicent', 'de la Tremoille', 'mdelatremoilleqk@prnewswire.com', '352-610-3443', '2024-08-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rayshell', 'Myers', 'rmyersql@youtube.com', '433-952-6026', '2024-09-20');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Corine', 'Philipsson', 'cphilipssonqm@artisteer.com', '352-440-1804', '2024-08-07');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Stinky', 'Harcarse', 'sharcarseqn@parallels.com', '891-381-5098', '2024-02-12');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lynnet', 'Southerill', 'lsoutherillqo@amazon.co.uk', '597-475-0643', '2024-07-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Obadias', 'Merriman', 'omerrimanqp@craigslist.org', '171-658-0302', '2022-11-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Gunther', 'Laraway', 'glarawayqq@geocities.com', '853-572-6262', '2025-02-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Hugues', 'Peddie', 'hpeddieqr@ehow.com', '783-404-1693', '2021-04-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Augustine', 'Fernihough', 'afernihoughqs@t.co', '475-397-9296', '2025-10-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Templeton', 'Cartmill', 'tcartmillqt@sina.com.cn', '344-141-8991', '2021-02-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ignacio', 'Tofano', 'itofanoqu@umn.edu', '590-757-1549', '2024-03-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lorin', 'Mobbs', 'lmobbsqv@pcworld.com', '260-821-4077', '2024-08-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Lynn', 'Beckitt', 'lbeckittqw@e-recht24.de', '983-939-2278', '2020-01-14');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Clare', 'Blease', 'cbleaseqx@un.org', '955-826-3630', '2023-04-21');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Annaliese', 'Vondrak', 'avondrakqy@ocn.ne.jp', '849-851-4705', '2023-07-22');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Trevar', 'Grist', 'tgristqz@cnn.com', '190-146-1825', '2023-09-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Emmaline', 'McBrearty', 'emcbreartyr0@technorati.com', '625-351-9441', '2021-07-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Elissa', 'Pele', 'epeler1@cnet.com', '217-161-1686', '2021-11-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sander', 'Blaisdell', 'sblaisdellr2@illinois.edu', '587-768-5284', '2023-05-03');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Yalonda', 'Sleep', 'ysleepr3@typepad.com', '679-452-0718', '2020-07-31');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Noak', 'Syversen', 'nsyversenr4@facebook.com', '144-356-3936', '2020-10-09');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Bidget', 'Carette', 'bcaretter5@senate.gov', '491-773-2401', '2023-08-28');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Marie-jeanne', 'Guidini', 'mguidinir6@dell.com', '759-986-6942', '2025-10-02');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Benedetto', 'Harnor', 'bharnorr7@engadget.com', '553-497-0381', '2021-11-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Pavia', 'Bachelar', 'pbachelarr8@123-reg.co.uk', '890-426-7732', '2021-01-15');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Allina', 'Amps', 'aampsr9@nih.gov', '626-319-4075', '2024-09-24');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Vergil', 'Midden', 'vmiddenra@angelfire.com', '110-190-4339', '2023-09-30');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ferdinanda', 'Tisor', 'ftisorrb@springer.com', '906-470-0065', '2021-03-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Tiebold', 'McGahey', 'tmcgaheyrc@is.gd', '727-187-2491', '2020-08-06');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ambrosi', 'Gravy', 'agravyrd@smugmug.com', '141-735-9293', '2024-11-29');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ashton', 'Taylerson', 'ataylersonre@house.gov', '388-898-8505', '2021-09-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Jordanna', 'Catling', 'jcatlingrf@globo.com', '324-514-2426', '2020-04-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Rey', 'Fussell', 'rfussellrg@java.com', '845-203-3625', '2022-10-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Eldredge', 'Bursnall', 'ebursnallrh@elegantthemes.com', '267-341-9251', '2022-07-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Eadmund', 'Wace', 'ewaceri@ocn.ne.jp', '388-681-0833', '2023-10-27');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Dinah', 'Petru', 'dpetrurj@oracle.com', '737-276-0364', '2022-03-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Esdras', 'Scriver', 'escriverrk@domainmarket.com', '212-868-3536', '2021-06-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Sheena', 'Janic', 'sjanicrl@tmall.com', '983-403-3205', '2024-04-13');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Adan', 'De L''Isle', 'adelislerm@marriott.com', '405-733-1574', '2023-08-17');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Waiter', 'Blunkett', 'wblunkettrn@cyberchimps.com', '513-696-9811', '2025-08-11');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Currey', 'Watton', 'cwattonro@princeton.edu', '893-909-7955', '2021-04-10');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Ashia', 'Apted', 'aaptedrp@chron.com', '891-270-4461', '2020-11-26');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Florri', 'Habbal', 'fhabbalrq@mozilla.org', '309-265-6199', '2021-06-16');
insert into Socios  (nombre , apellido, email, telefono , fecha_inscripcion) values ('Raquela', 'Piner', 'rpinerrr@naver.com', '966-967-5653', '2020-12-26');

SELECT COUNT(*) AS TotalSocios FROM Socios;
SELECT TOP (10) * FROM Socios; --Haciendo pruba de datos ------

----Insert into a tabla Entrnadores-----

insert into Entrenadores (nombre , apellido, Especialidad ) values ('Kania', 'Garcia', 'Yoga');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Leoline', 'Cool', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Helyn', 'Casaro', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Lara', 'Shufflebotham', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Jarid', 'Chorley', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Cody', 'Kleyn', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Kliment', 'Panther', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Myrtie', 'Stepney', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Filberte', 'Feavyour', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Alejandrina', 'Barnsdall', 'Crossfit');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Efren', 'Jaggs', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Alica', 'Leebeter', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Gunter', 'Vasyukov', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Alyse', 'Shortland', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Jennie', 'Tudbald', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Zack', 'Durrand', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Augustina', 'Skillett', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Samson', 'Pickard', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Dasi', 'MacConnechie', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Shirley', 'M''cowis', 'Crossfit');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Clayton', 'Colten', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Parker', 'McKay', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Lin', 'Eldin', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Arline', 'Mingard', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Noach', 'Deerr', 'Crossfit');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Engracia', 'Houdhury', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Leticia', 'Hanson', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Aymer', 'Kobpal', 'Yoga');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Sawyer', 'Keizman', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Anabel', 'Van Ross', 'Yoga');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Grant', 'Medling', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Brook', 'Azemar', 'Yoga');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Elfreda', 'Averies', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Fania', 'McGinly', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Marlo', 'Howchin', 'Crossfit');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Levey', 'Skittle', 'Crossfit');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Tracey', 'Justham', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Richart', 'Sponer', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Winnifred', 'Boxell', 'Pesas');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Amory', 'Siemens', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Marcelo', 'Hutchence', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Cherri', 'Piegrome', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Codee', 'Kolin', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Jayme', 'Houlden', 'Pilates');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Nataniel', 'Layhe', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Fallon', 'Heustace', 'PowerLifting');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Heinrick', 'Bernhardi', 'Cardio');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Jayson', 'Sawers', 'HIIT');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Silvio', 'Westmorland', 'Yoga');
insert into Entrenadores (nombre , apellido, Especialidad ) values ('Earlie', 'Regina', 'Cardio');

SELECT COUNT(*) AS TotalEntrenadores FROM Entrenadores;
SELECT TOP (10) * FROM Entrenadores; ---Haciendo pruebas de datos-----

----Insert de datos en tabla tipo_Membresia----

INSERT INTO Tipo_Membresia (nombre_plan, precio, duracion) VALUES
('Mensual Básico',      25.00, 30),
('Mensual Plus',        35.00, 30),
('Trimestral',          90.00, 90),
('Semestral',          160.00, 180),
('Anual',              280.00, 365),
('Anual Premium',      350.00, 365);

SELECT COUNT(*) AS TotalTipoMembresia FROM Tipo_Membresia;
SELECT * FROM Tipo_Membresia; ----Haciendo pruebas de datos----

---Haciendo insert tabla actividades----

INSERT INTO Actividades (nombre_clase, descripcion, duracion_minutos) VALUES
('Spinning', 'Clase cardiovascular intensa en bicicleta estacionaria.', 45),
('Crossfit', 'Entrenamiento funcional de alta intensidad.', 60),
('Yoga Vinyasa', 'Secuencia fluida de posturas y respiración.', 60),
('Zumba', 'Clase de baile fitness con ritmos latinos.', 50),
('Pilates', 'Ejercicios de fortalecimiento del core y flexibilidad.', 55),
('HIIT', 'Entrenamiento interválico de alta intensidad.', 30),
('Body Pump', 'Entrenamiento con barra y pesas para todo el cuerpo.', 60),
('Stretching', 'Clase enfocada en estiramientos y movilidad.', 45),
('Boxeo Fitness', 'Ejercicios de boxeo sin contacto para mejorar el cardio.', 50),
('Funcional', 'Circuitos funcionales con peso corporal y accesorios.', 45),
('Gap', 'Glúteos, abdomen y piernas con énfasis en tonificación.', 50),
('Step', 'Coreografías sobre el step para mejorar resistencia.', 45),
('TRX', 'Entrenamiento en suspensión usando el propio peso corporal.', 45),
('Ciclismo Indoor', 'Simulación de rutas en bicicleta bajo techo.', 50),
('Bootcamp', 'Entrenamiento militarizado al aire libre o en sala.', 60),
('Yoga Restaurativo', 'Posturas suaves y relajantes para recuperación.', 60),
('Cardio Dance', 'Baile libre enfocado en quema calórica.', 45),
('Power Abs', 'Sesión corta focalizada en abdomen.', 30),
('Running Club', 'Entrenamiento dirigido de carrera en grupo.', 60),
('Full Body', 'Rutina general de cuerpo completo con pesas y máquinas.', 55),
('PowerLifting', 'Entreno de fuerza a maxima capacidad. ', 60); 

SELECT COUNT(*) AS TotalActividades FROM Actividades;
SELECT TOP (10) * FROM Actividades;

---Insert en tabla clases-programadas-----
---Lo haremos con tsql 
;WITH N AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM N
    WHERE n < 1000         -- cantidad de clases programadas
)
INSERT INTO Clases_Programadas (actividad_id, id_entrenador, fecha_hora_inicio, cupo_maximo, sala)
SELECT
    (ABS(CHECKSUM(NEWID())) % (SELECT COUNT(*) FROM Actividades)) + 1 AS actividad_id,
    (ABS(CHECKSUM(NEWID())) % (SELECT COUNT(*) FROM Entrenadores)) + 1 AS id_entrenador,
    DATEADD(
        HOUR,
        ABS(CHECKSUM(NEWID())) % (24 * 120),   -- hasta 120 días hacia adelante
        CAST('2024-01-01' AS DATETIME)
    ) AS fecha_hora_inicio,
    (ABS(CHECKSUM(NEWID())) % 21) + 10 AS cupo_maximo, -- cupos entre 10 y 30
    CONCAT('Sala ', (ABS(CHECKSUM(NEWID())) % 5) + 1) AS sala
FROM N
OPTION (MAXRECURSION 0);

-- Verificar
SELECT COUNT(*) AS TotalClases FROM Clases_Programadas;
SELECT TOP (10) * FROM Clases_Programadas;


---Insert en tabla Pagos----

;WITH N AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM N
    WHERE n < 4000       -- cantidad de pagos
)
INSERT INTO Pagos (id_socio, tipo_membresia_id, fecha_pago, monto_pagado)
SELECT
    s.id_socio,
    t.tipo_membresia_id,
    DATEADD(
        DAY,
        ABS(CHECKSUM(NEWID())) % 730,   -- 2 años de rango
        CAST('2023-01-01' AS DATE)
    ) AS fecha_pago,
    t.precio
FROM N
CROSS APPLY (
    SELECT TOP 1 id_socio
    FROM Socios
    ORDER BY NEWID()
) AS s
CROSS APPLY (
    SELECT TOP 1 tipo_membresia_id, precio
    FROM Tipo_Membresia
    ORDER BY NEWID()
) AS t
OPTION (MAXRECURSION 0);

-- Verificar
SELECT COUNT(*) AS TotalPagos FROM Pagos;
SELECT TOP (10) * FROM Pagos;



---Insert en tabla reservas---



INSERT INTO Reservas (id_socio, clase_id, fecha_reserva, estado)
SELECT TOP (5000)   -- cantidad de reservas
    s.id_socio,
    c.clase_id,
    DATEADD(
        DAY,
        ABS(CHECKSUM(NEWID())) % 90,
        CAST('2024-01-01' AS DATETIME)
    ) AS fecha_reserva,
    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 10 < 8 THEN 'Confirmada'
        ELSE 'Cancelada'
    END AS estado
FROM Socios s
CROSS JOIN Clases_Programadas c
ORDER BY NEWID();

-- Verificar
SELECT COUNT(*) AS TotalReservas FROM Reservas;
SELECT TOP (10) * FROM Reservas;


------Verficacion de numero de datos----


SELECT 
    (SELECT COUNT(*) FROM Socios)              AS Socios,
    (SELECT COUNT(*) FROM Entrenadores)        AS Entrenadores,
    (SELECT COUNT(*) FROM Tipo_Membresia)      AS Tipo_Membresia,
    (SELECT COUNT(*) FROM Actividades)         AS Actividades,
    (SELECT COUNT(*) FROM Clases_Programadas)  AS Clases_Programadas,
    (SELECT COUNT(*) FROM Pagos)               AS Pagos,
    (SELECT COUNT(*) FROM Reservas)            AS Reservas;




    --------------------------Seguridad de la base de datos------------------------------

    ----------------------Creacion de logins---------------------------
  USE [master]
  GO
  -- Login administrador del gimnasio
  CREATE LOGIN [admin_gym] 
  WITH PASSWORD = 'admin_gym123', 
  CHECK_POLICY = ON,         
  CHECK_EXPIRATION = OFF;  

  -- Login de recepción (quien atiende socios, cobra, etc.)

  CREATE LOGIN [recepcion_gym] 
  WITH PASSWORD = 'recepcion_gym123',
  CHECK_EXPIRATION = OFF, 
  CHECK_POLICY = ON;

  -- Login de entrenador (solo consulta info necesaria)
  CREATE LOGIN [entrenador_gym] 
  WITH PASSWORD = 'entrenador_gym123',
  CHECK_EXPIRATION = OFF, 
  CHECK_POLICY = ON;

  ---------------------Creacion de usuarios------------------------------------
  USE OLYMPUS_GYM
  GO 

    CREATE USER [admin_gym] FOR LOGIN [admin_gym];
    CREATE USER [recepcion_gym] FOR LOGIN [recepcion_gym];
    CREATE USER [entrenador_gym] FOR LOGIN [entrenador_gym];

-----------------------Creacion de roles----------------------------------------
USE OLYMPUS_GYM
GO

  CREATE ROLE rol_admin_gym;
  CREATE ROLE rol_recepcion_gym;
  CREATE ROLE rol_entrenador_gym;

  -----Agregamos los usuarios a cada rol-------------------
   
ALTER ROLE rol_admin_gym       ADD MEMBER admin_gym;
ALTER ROLE rol_recepcion_gym   ADD MEMBER recepcion_gym;
ALTER ROLE rol_entrenador_gym  ADD MEMBER entrenador_gym;


----------Asignacion de permisos a cada rol----------------------------------------------------

-- El rol admin_gym puede hacer de todo en la BD sera nuestro dba
GRANT CONTROL ON DATABASE::OLYMPUS_GYM TO rol_admin_gym; 

---Permisos para rol recepcion-------------

-- Socios: ver, crear, actualizar
GRANT SELECT, INSERT, UPDATE ON dbo.Socios TO rol_recepcion_gym;

-- Pagos: ver y registrar pagos
GRANT SELECT, INSERT ON dbo.Pagos TO rol_recepcion_gym;

-- Reservas: ver, actualizar registrar reservas 
GRANT SELECT, INSERT, UPDATE ON dbo.Reservas TO rol_recepcion_gym;

-- Catálogos: solo lectura
GRANT SELECT ON dbo.Tipo_Membresia      TO rol_recepcion_gym;
GRANT SELECT ON dbo.Actividades         TO rol_recepcion_gym;
GRANT SELECT ON dbo.Clases_Programadas  TO rol_recepcion_gym;

---Denegando permisos para borrar--
DENY DELETE ON dbo.Socios   TO rol_recepcion_gym;
DENY DELETE ON dbo.Pagos    TO rol_recepcion_gym;
DENY DELETE ON dbo.Reservas TO rol_recepcion_gym;


-----Delegando permisos para rol entrenador----------------------

-- Solo lectura (Para que el entrenador se guie) solo puede leer ---
GRANT SELECT ON dbo.Socios             TO rol_entrenador_gym;
GRANT SELECT ON dbo.Actividades        TO rol_entrenador_gym;
GRANT SELECT ON dbo.Clases_Programadas TO rol_entrenador_gym;
GRANT SELECT ON dbo.Reservas           TO rol_entrenador_gym;




------Comprobacion que quedo bien-----------------
-- Ver usuarios de la base
SELECT name AS Usuario, type_desc
FROM sys.database_principals
WHERE type IN ('S','U','G')
  AND name NOT LIKE 'dbo' AND name NOT LIKE 'guest';

-- Ver roles definidos por el usuario
SELECT name AS Rol
FROM sys.database_principals
WHERE type = 'R';

-- Ver miembros de cada rol
SELECT 
    r.name AS Rol,
    m.name AS Miembro
FROM sys.database_role_members drm
JOIN sys.database_principals r ON drm.role_principal_id = r.principal_id
JOIN sys.database_principals m ON drm.member_principal_id = m.principal_id
ORDER BY r.name, m.name;






