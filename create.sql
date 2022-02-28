-- Crear base de datos
CREATE DATABASE biblioteca;

-- Crear tablas y sus relaciones
CREATE TABLE libro(
	isbn varchar(15) not null primary key,
	titulo varchar(50) not null,
	paginas int not null
);

CREATE TABLE socio(
	rut varchar(10) not null primary key,
	nombre varchar(15) not null,
	apellido varchar(15) not null,
    direccion varchar(50),
    telefono varchar(9) not null
);

CREATE TABLE autor(
    codigo int not null primary key,
    nombre varchar(15) not null,
    apellido varchar(15) not null,
    nacimiento int,
    muerte int
);

CREATE TABLE prestamo(
    id int not null primary key,
    fecha_inicio date not null,
    fecha_devolucion date not null,
    isbn_prestamo varchar(15) not null,
    rut_prestamo varchar(10) not null,
    foreign key (isbn_prestamo) references libro(isbn),
    foreign key (rut_prestamo) references socio(rut)
);

CREATE TABLE autoria(
    id int not null primary key,
    isbn_libro varchar(15) not null,
    codigo_autor int not null,
    foreign key (isbn_libro) references libro(isbn),
    foreign key (codigo_autor) references autor(codigo)
);

CREATE TABLE coautoria(
    id int not null primary key,
    isbn_libro varchar(15) not null,
    codigo_autor int not null,
    foreign key (isbn_libro) references libro(isbn),
    foreign key (codigo_autor) references autor(codigo)
);

-- Cargar datos tabla libro
INSERT INTO libro(isbn, titulo, paginas) VALUES ('111-1111111-111', 'CUENTOS DE TERROR', 344);
INSERT INTO libro(isbn, titulo, paginas) VALUES ('222-2222222-222', 'POESÍAS CONTEMPORANEAS', 167);
INSERT INTO libro(isbn, titulo, paginas) VALUES ('333-3333333-333', 'HISTORIA DE ASIA', 511);
INSERT INTO libro(isbn, titulo, paginas) VALUES ('444-4444444-444', 'MANUAL DE MECÁNICA', 298);

-- Cargar datos de tabla socio
INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES ('2222222-2', 'ANA', 'PEREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');

-- Cargar datos de tabla autor
INSERT INTO autor(codigo, nombre, apellido, nacimiento) VALUES (1, 'ANDRES', 'ULLOA', 1982);
INSERT INTO autor(codigo, nombre, apellido, nacimiento, muerte) VALUES (2, 'SERGIO', 'MARDONES', 1950, 2012);
INSERT INTO autor(codigo, nombre, apellido, nacimiento, muerte) VALUES (3, 'JOSE', 'SALGADO', 1968, 2020);
INSERT INTO autor(codigo, nombre, apellido, nacimiento) VALUES (4, 'ANA', 'SALGADO', 1972);
INSERT INTO autor(codigo, nombre, apellido, nacimiento) VALUES (5, 'MARTIN', 'PORTA', 1976);

-- Cargar datos de la tabla prestamo
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (1, '2020-01-20', '2020-01-27', '111-1111111-111', '1111111-1');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (2, '2020-01-20', '2020-01-30', '222-2222222-222', '5555555-5');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (3, '2020-01-22', '2020-01-30', '333-3333333-333', '3333333-3');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (4, '2020-01-23', '2020-01-30', '444-4444444-444', '4444444-4');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (5, '2020-01-27', '2020-02-04', '111-1111111-111', '2222222-2');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (6, '2020-01-31', '2020-02-12', '444-4444444-444', '1111111-1');
INSERT INTO prestamo(id, fecha_inicio, fecha_devolucion, isbn_prestamo, rut_prestamo) VALUES (7, '2020-01-31', '2020-02-12', '222-2222222-222', '3333333-3');

-- Cargar datos de la tabla autoria
INSERT INTO autoria(id, isbn_libro, codigo_autor) VALUES (1, '111-1111111-111', 3);
INSERT INTO autoria(id, isbn_libro, codigo_autor) VALUES (2, '222-2222222-222', 1);
INSERT INTO autoria(id, isbn_libro, codigo_autor) VALUES (3, '333-3333333-333', 2);
INSERT INTO autoria(id, isbn_libro, codigo_autor) VALUES (4, '444-4444444-444', 5);

-- Cargar datos de la tabla coautoria
INSERT INTO coautoria(id, isbn_libro, codigo_autor) VALUES (1, '111-1111111-111', 4);