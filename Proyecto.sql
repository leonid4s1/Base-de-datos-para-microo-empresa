create database proyecto2;
use proyecto2;
create table empresas(
rfc varchar(13) primary key not null unique,
razon_social varchar(100) not null,
direccion varchar(100) not null,
telefono varchar(10) not null,
codigo_interno varchar(20) not null
);
create table proyectos(
id_proyecto int(10) primary key not null unique,
fecha_inicio date not null,
fecha_fin date not null,
presupuesto_estimado float(10) not null,
id_empresa varchar(13),
foreign key (id_empresa) references empresas(rfc)
);
create table rubros(
id_rubro int(10) primary key not null unique,
descripcion_rubro varchar(100) not null
);
create table bitacora(
id_mov int(10) primary key not null unique,
tipo_mov varchar(50) not null,
fecha_hora_mov datetime not null,
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto)
);
create table entrega_externa(
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto),
fecha_entrega date not null,
costo_total float(10) not null
);
create table proyecto_rubros(
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto),
id_rubro int(10),
foreign key (id_rubro) references rubros(id_rubro)
);
create table trabajadores(
id_trabajador int(10) primary key not null unique,
rfc varchar(13) not null unique,
nombre varchar(50) not null,
ap_paterno varchar(50) not null,
ap_materno varchar(50) not null,
domicilio varchar(100) not null,
telefono varchar(10) not null unique,
email varchar(50) not null
);
create table roles(
id_rol int(10) primary key not null unique,
rol varchar(50) not null
);
create table pagos(
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto),
fecha_pago date not null,
monto_pago float(10) not null
);
create table proyecto_trabajadores(
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto),
id_trabajador int(10),
foreign key (id_trabajador) references trabajadores(id_trabajador),
id_rol int(10),
foreign key (id_rol) references roles(id_rol),
horas_trabajadas int(10)
);
insert into trabajadores (id_trabajador, rfc, nombre, ap_paterno, ap_materno, domicilio, telefono, email)
VALUES
(1,1234567891123,'Juan','Perez','Gomez','Calle 123', 5534960576,'juan@gmail.com'),
(2,9876543210123, 'María', 'López', 'García', 'Avenida', 5576543212, 'maria@gmail.com'),
(3,1234567890223, 'Pedro', 'Hernández', 'Martínez', 'Calle ABC', 5567890143, 'pedro@gmail.com'),
(4,1233456789012, 'Laura', 'Torres', 'Vargas', 'Calle 789', 5556789012, 'laura@gmail.com'),
(5,1237891123456, 'Carlos', 'Sánchez', 'González', 'Avenida QWERTY', 5590173456, 'carlos@gmail.com'),
(6,1235678901234, 'Sofía', 'Romero', 'Castillo', 'Calle 5678', 5578901234, 'sofia@gmail.com'),
(7,1239806543210, 'Alejandro', 'Hernández', 'Pérez', 'Calle 567', 5576043210, 'alejandro.hernandez@gmail.com'),
(8,1234567890123, 'Ana', 'García', 'Sánchez', 'Boulevard 123', 5567890123, 'ana.garcia@gmail.com'),
(9,1237890023456, 'Diego', 'Martínez', 'Rodríguez', 'Callejón 890', 5590103456, 'diego.martinez@gmail.com'),
(10,1232305678901, 'Luisa', 'Torres', 'López', 'Avenida 345', 5545608901, 'luisa.torres@gmail.com'),
(11,1239876543210, 'Carlos', 'Pérez', 'Hernández', 'Calle 789', 5576543210, 'carlos.perez@gmail.com'),
(12,1236543210987, 'María', 'García', 'López', 'Avenida 123', 5543210987, 'maria.garcia@gmail.com'),
(13,1237890123456, 'Javier', 'Martínez', 'Fernández', 'Boulevard 567', 5590123456, 'javier.martinez@gmail.com'),
(14,1232345678901, 'Laura', 'Rodríguez', 'Sánchez', 'Callejón 890', 5545678901, 'laura.rodriguez@gmail.com'),
(15,1231098765432, 'Fernando', 'López', 'Pérez', 'Avenida 456', 5598765432, 'fernando.lopez@gmail.com'),
(16,1234321098765, 'Isabella', 'Gutiérrez', 'Hernández', 'Calle 789', 5521098765, 'isabella.gutierrez@gmail.com'),
(17,1232109876543, 'Gabriel', 'Fernández', 'Gómez', 'Boulevard 234', 5509876543, 'gabriel.fernandez@gmail.com'),
(18,1235675901234, 'Valentina', 'Gómez', 'López', 'Avenida 567', 5578501234, 'valentina.gomez@gmail.com'),
(19,1237654321098, 'Eduardo', 'Hernández', 'Martínez', 'Callejón 890', 5554321098, 'eduardo.hernandez@gmail.com'),
(20,1238901234567, 'Mariana', 'Martínez', 'García', 'Calle 123', 5501234567, 'mariana.martinez@gmail.com');
INSERT INTO empresas (rfc, razon_social, direccion, telefono, codigo_interno)
VALUES
('XYZ789012345', 'Bimbo', 'Filberto 64', '5523456789', 'CI-004'),
('JKL543210987', 'Cocacola', 'Zapato 123', '5532109876', 'CI-005'),
('MNO456789012', 'Sabritas', 'Malboro 34', '5567890123', 'CI-006'),
('PQR321098765', 'Benoto', 'Doctor cruz 12', '5510987654', 'CI-007'),
('STU654321098', 'Scribe', 'Bicicleta 54', '5543210987', 'CI-008'),
('VWX987654321', 'NBA', 'Operacion 65', '5576543210', 'CI-009'),
('123456789ABC', 'Bictlan', 'La bamba 78', '5594561230', 'CI-010'),
('456789012DEF', 'Amarillo', 'XXX 64', '5523456789', 'CI-011'),
('789012345GHI', 'Intel', 'Dinosaurio 43', '5567890123', 'CI-012'),
('321098765JKL', 'Santa Cruz', 'Maqueen 62', '5590123456', 'CI-013');
INSERT INTO proyectos (id_proyecto, fecha_inicio, fecha_fin, presupuesto_estimado, id_empresa)
VALUES
(1, '2023-01-01', '2023-03-31', 50000.00, 'XYZ789012345'),
(2, '2023-02-15', '2023-05-15', 75000.00, 'JKL543210987'),
(3, '2023-03-01', '2023-06-30', 100000.00, 'MNO456789012'),
(4, '2023-04-10', '2023-06-30', 90000.00, 'PQR321098765'),
(5, '2023-05-01', '2023-08-31', 120000.00, 'STU654321098'),
(6, '2023-06-15', '2023-09-30', 80000.00, 'VWX987654321'),
(7, '2023-07-01', '2023-10-15', 60000.00, '123456789ABC'),
(8, '2023-08-15', '2023-11-30', 110000.00, '456789012DEF'),
(9, '2023-09-01', '2023-12-31', 150000.00, '789012345GHI'),
(10, '2023-10-10', '2024-01-31', 95000.00, '321098765JKL'),
(11, '2023-11-01', '2024-02-28', 78000.00, 'STU654321098'),
(12, '2023-12-15', '2024-03-15', 85000.00, 'PQR321098765'),
(13, '2024-01-01', '2024-04-30', 125000.00, 'MNO456789012'),
(14, '2024-02-10', '2024-05-31', 105000.00, 'JKL543210987'),
(15, '2024-03-01', '2024-06-15', 70000.00, 'XYZ789012345');
INSERT INTO rubros (id_rubro, descripcion_rubro)
VALUES
(1, 'Manejo de software'),
(2, 'Desarrollo mobil'),
(3, 'Desarrollo web'),
(4, 'Gestion de base'),
(5, 'Regulacion');
INSERT INTO bitacora (id_mov, tipo_mov, fecha_hora_mov, id_proyecto)
VALUES
(14, 'inserccion', '2024-02-10 09:30:00', 2),
(15, 'eliminacion', '2024-03-01 14:45:00', 1),
(16, 'actualizacion', '2024-04-15 10:00:00', 3),
(17, 'inserccion', '2024-05-01 12:15:00', 6),
(18, 'eliminacion', '2024-06-10 16:30:00', 7),
(19, 'actualizacion', '2024-07-15 11:45:00', 7),
(20, 'inserccion', '2024-08-01 09:00:00', 8),
(21, 'eliminacion', '2024-09-10 14:15:00', 9),
(22, 'actualizacion', '2024-10-15 10:30:00', 12),
(23, 'inserccion', '2024-11-01 12:45:00', 13),
(24, 'eliminacion', '2024-12-10 16:00:00', 15),
(25, 'actualizacion', '2025-01-15 11:15:00', 14),
(26, 'inserccion', '2025-02-01 09:30:00', 9),
(27, 'eliminacion', '2025-03-10 14:45:00', 10),
(28, 'actualizacion', '2025-04-15 10:00:00', 11);
INSERT INTO entrega_externa (id_proyecto, fecha_entrega, costo_total)
VALUES
(1, '2023-06-10', 1500.00),
(2, '2023-07-20', 2800.00),
(3, '2023-08-05', 1950.00),
(4, '2023-09-15', 2300.00),
(5, '2023-10-25', 3100.00),
(6, '2023-11-12', 1750.00),
(7, '2023-12-03', 2100.00),
(8, '2024-01-15', 2900.00),
(9, '2024-02-28', 2250.00),
(10, '2024-03-08', 2650.00),
(11, '2024-04-18', 3300.00),
(12, '2024-05-29', 2400.00),
(13, '2024-06-06', 2850.00),
(14, '2024-07-17', 3700.00),
(15, '2024-08-28', 2550.00);
INSERT INTO proyecto_rubros (id_proyecto, id_rubro)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5);
INSERT INTO roles (id_rol, rol)
VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Analista'),
(4, 'Desarrollador'),
(5, 'Gerente'),
(6, 'Programador junior'),
(7, 'Becario');
INSERT INTO pagos (id_proyecto, fecha_pago, monto_pago)
VALUES
(1, '2023-06-10', 1500.00),
(2, '2023-07-20', 2800.00),
(3, '2023-08-05', 1950.00),
(4, '2023-09-15', 2300.00),
(5, '2023-10-25', 3100.00),
(6, '2023-11-12', 1750.00),
(7, '2023-12-03', 2100.00),
(8, '2024-01-15', 2900.00),
(9, '2024-02-28', 2250.00),
(10, '2024-03-08', 2650.00),
(11, '2024-04-18', 3300.00),
(12, '2024-05-29', 2400.00),
(13, '2024-06-06', 2850.00),
(14, '2024-07-17', 3700.00),
(15, '2024-08-28', 2550.00);
INSERT INTO proyecto_trabajadores (id_proyecto, id_trabajador, id_rol, horas_trabajadas)
VALUES
(1, 1, 1, 40), (2, 2, 2, 30), (3, 3, 3, 45), (4, 4, 4, 35), (5, 5, 5, 50), (6, 6, 1, 35), (7, 7, 2, 35),
(8, 14, 4, 35), (9, 13, 3, 35), (10, 12, 2, 35), (11, 11, 1, 35), (12, 10, 5, 35), (13, 9, 4, 35), (14, 8, 3, 35),
(5, 15, 5, 35), (4, 16, 1, 35), (3, 17, 2, 35), (2, 18, 3, 35), (1, 19, 4, 35), (15, 20, 5, 35);
