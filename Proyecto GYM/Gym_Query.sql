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