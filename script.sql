-- Base de Datos I - Unidad 4 - Ej03: SistemaClinica
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Medicamentos_Prescripciones;
DROP TABLE IF EXISTS Medicamentos;
DROP TABLE IF EXISTS Prescripciones;
DROP TABLE IF EXISTS Turnos;
DROP TABLE IF EXISTS medico_especialidad;
DROP TABLE IF EXISTS Especialidades;
DROP TABLE IF EXISTS Medicos;
DROP TABLE IF EXISTS Pacientes;

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    numero_historia_clinica VARCHAR(50) UNIQUE,
    dni INT UNIQUE,
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    domicilio VARCHAR(100),
    obra_social VARCHAR(100)
);

CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    matricula_profesional VARCHAR(50) UNIQUE,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad_principal VARCHAR(50)
);

CREATE TABLE Especialidades (
    id_especialidad INT PRIMARY KEY,
    codigo_especialidad VARCHAR(50) UNIQUE,
    nombre_especialidad VARCHAR(50),
    descripcion VARCHAR(50)
);

CREATE TABLE medico_especialidad (
    id_medico_especialidad INT PRIMARY KEY,
    id_medico INT,
    id_especialidad INT,
    tipo_especialidad VARCHAR(50),
    certificacion VARCHAR(50),
    fecha_registro DATE,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad),
    UNIQUE (id_medico, id_especialidad)
);

CREATE TABLE Turnos (
    id_turno INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    numero_turno VARCHAR(50),
    fecha DATE,
    hora TIME,
    estado VARCHAR(100),
    diagnostico_observacion VARCHAR(100),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Prescripciones (
    id_prescripcion INT PRIMARY KEY,
    id_turno INT,
    numero_prescripcion VARCHAR(50),
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    duracion_tratamiento INT,
    FOREIGN KEY (id_turno) REFERENCES Turnos(id_turno)
);

CREATE TABLE Medicamentos (
    id_medicamento INT PRIMARY KEY,
    codigo_medicamento VARCHAR(50) UNIQUE,
    nombre_comercial VARCHAR(50),
    monodroga VARCHAR(50),
    laboratorio VARCHAR(50)
);

CREATE TABLE Medicamentos_Prescripciones (
    id_medicamento_prescripcion INT PRIMARY KEY,
    id_prescripcion INT,
    id_medicamento INT,
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    duracion_tratamiento INT,
    FOREIGN KEY (id_prescripcion) REFERENCES Prescripciones(id_prescripcion),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamentos(id_medicamento),
    UNIQUE (id_prescripcion, id_medicamento)
);

-- Datos de Pacientes
INSERT INTO Pacientes (id_paciente, numero_historia_clinica, dni, nombre, fecha_nacimiento) VALUES (1, 'HC-1002', 38222111, 'Tomás Benítez', '1998-11-02');
INSERT INTO Pacientes (id_paciente, numero_historia_clinica, dni, nombre, fecha_nacimiento) VALUES (2, 'HC-1003', 42555666, 'Valentina Cruz', '2003-07-21');
INSERT INTO Pacientes (id_paciente, numero_historia_clinica, dni, nombre, fecha_nacimiento) VALUES (3, 'HC-1004', 36999888, 'Lautaro Díaz', '1995-03-30');
INSERT INTO Pacientes (id_paciente, numero_historia_clinica, dni, nombre, fecha_nacimiento) VALUES (4, 'HC-1005', 44111000, 'Martina Ferreyra', '2005-09-09');

-- Datos de Medicos
INSERT INTO Medicos (id_medico, matricula_profesional, nombre, apellido, especialidad_principal) VALUES (1, 'MP-2002', 'Ana', 'Pereyra', 'Cardiología');
INSERT INTO Medicos (id_medico, matricula_profesional, nombre, apellido, especialidad_principal) VALUES (2, 'MP-2003', 'Jorge', 'Suárez', 'Pediatría');
INSERT INTO Medicos (id_medico, matricula_profesional, nombre, apellido, especialidad_principal) VALUES (3, 'MP-2004', 'Laura', 'Gómez', 'Dermatología');
INSERT INTO Medicos (id_medico, matricula_profesional, nombre, apellido, especialidad_principal) VALUES (4, 'MP-2005', 'Diego', 'Quiroga', 'Traumatología');

-- Datos de Especialidades
INSERT INTO Especialidades (id_especialidad, codigo_especialidad, nombre_especialidad, descripcion) VALUES (1, 'ESP-01', 'Clínica médica', 'Atención primaria del adulto');
INSERT INTO Especialidades (id_especialidad, codigo_especialidad, nombre_especialidad, descripcion) VALUES (2, 'ESP-02', 'Cardiología', 'Enfermedades del corazón');
INSERT INTO Especialidades (id_especialidad, codigo_especialidad, nombre_especialidad, descripcion) VALUES (3, 'ESP-03', 'Pediatría', 'Salud infantil');
INSERT INTO Especialidades (id_especialidad, codigo_especialidad, nombre_especialidad, descripcion) VALUES (4, 'ESP-04', 'Dermatología', 'Enfermedades de la piel');

-- Datos de medico_especialidad
INSERT INTO medico_especialidad (id_medico_especialidad, id_medico, id_especialidad, tipo_especialidad, certificacion) VALUES (1, 1, 2, 'Principal', 'CERT-5502');
INSERT INTO medico_especialidad (id_medico_especialidad, id_medico, id_especialidad, tipo_especialidad, certificacion) VALUES (2, 1, 1, 'Secundaria', 'CERT-5503');
INSERT INTO medico_especialidad (id_medico_especialidad, id_medico, id_especialidad, tipo_especialidad, certificacion) VALUES (3, 2, 3, 'Principal', 'CERT-5504');
INSERT INTO medico_especialidad (id_medico_especialidad, id_medico, id_especialidad, tipo_especialidad, certificacion) VALUES (4, 3, 4, 'Principal', 'CERT-5505');

-- Datos de Turnos
INSERT INTO Turnos (id_turno, id_paciente, id_medico, numero_turno, fecha) VALUES (1, 1, 1, 'T-0002', '2026-10-05');
INSERT INTO Turnos (id_turno, id_paciente, id_medico, numero_turno, fecha) VALUES (2, 2, 2, 'T-0003', '2026-10-06');
INSERT INTO Turnos (id_turno, id_paciente, id_medico, numero_turno, fecha) VALUES (3, 3, 3, 'T-0004', '2026-10-06');
INSERT INTO Turnos (id_turno, id_paciente, id_medico, numero_turno, fecha) VALUES (4, 4, 4, 'T-0005', '2026-10-07');

-- Datos de Prescripciones
INSERT INTO Prescripciones (id_prescripcion, id_turno, numero_prescripcion, dosis, frecuencia) VALUES (1, 1, 'RX-002', '500 mg', 'cada 12 hs');
INSERT INTO Prescripciones (id_prescripcion, id_turno, numero_prescripcion, dosis, frecuencia) VALUES (2, 2, 'RX-003', '50 mg', 'cada 24 hs');
INSERT INTO Prescripciones (id_prescripcion, id_turno, numero_prescripcion, dosis, frecuencia) VALUES (3, 3, 'RX-004', '1 aplicación', 'cada 12 hs');
INSERT INTO Prescripciones (id_prescripcion, id_turno, numero_prescripcion, dosis, frecuencia) VALUES (4, 4, 'RX-005', '100 mg', 'cada 8 hs');

-- Datos de Medicamentos
INSERT INTO Medicamentos (id_medicamento, codigo_medicamento, nombre_comercial, monodroga, laboratorio) VALUES (1, 'MED-02', 'Amoxidal', 'Amoxicilina', 'Roemmers');
INSERT INTO Medicamentos (id_medicamento, codigo_medicamento, nombre_comercial, monodroga, laboratorio) VALUES (2, 'MED-03', 'Losacor', 'Losartán', 'Gador');
INSERT INTO Medicamentos (id_medicamento, codigo_medicamento, nombre_comercial, monodroga, laboratorio) VALUES (3, 'MED-04', 'Dermaglós', 'Betametasona', 'Phoenix');
INSERT INTO Medicamentos (id_medicamento, codigo_medicamento, nombre_comercial, monodroga, laboratorio) VALUES (4, 'MED-05', 'Tafirol', 'Paracetamol', 'Bayer');

-- Datos de Medicamentos_Prescripciones
INSERT INTO Medicamentos_Prescripciones (id_medicamento_prescripcion, id_prescripcion, id_medicamento, dosis, frecuencia) VALUES (1, 1, 1, '500 mg', 'cada 12 hs');
INSERT INTO Medicamentos_Prescripciones (id_medicamento_prescripcion, id_prescripcion, id_medicamento, dosis, frecuencia) VALUES (2, 1, 4, '500 mg', 'cada 8 hs');
INSERT INTO Medicamentos_Prescripciones (id_medicamento_prescripcion, id_prescripcion, id_medicamento, dosis, frecuencia) VALUES (3, 2, 2, '50 mg', 'cada 24 hs');
INSERT INTO Medicamentos_Prescripciones (id_medicamento_prescripcion, id_prescripcion, id_medicamento, dosis, frecuencia) VALUES (4, 3, 3, '1 aplicación', 'cada 12 hs');
