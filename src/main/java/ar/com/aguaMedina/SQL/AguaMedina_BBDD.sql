drop database if exists BaseDeDatos;
create database BaseDeDatos;
use BaseDeDatos;

/*RECORRIDOS*/
create table recorridos(
    id int auto_increment primary key,
    nombreZona varchar(25) not null,
    dia enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabados'),
    responsable varchar(25) not null,
    asistente varchar(25),
    detalles varchar(100)
    
);

SELECT * FROM recorridos;


/*CLIENTES PERSONA*/
create table clientesPersona(
    id int auto_increment primary key,
    nombre varchar(50) not null,
    direccion varchar(50),
    localidad varchar(50),
    contacto varchar(50),
    tipo_servicio varchar(50),
    bidones int,
    maquinas int,
    precio int,
    idRecorrido int,
    mail varchar(50),
    fecha_alta varchar(50),
    detalles varchar(100)
);

SELECT * FROM clientesPersona;


/*CLIENTES EMPRESA*/
create table clientesEmpresa(
    id int auto_increment primary key,
    razon_social varchar(50) not null,
    cuit varchar(50),
    direccion varchar(50),
    localidad varchar(50),
    contacto varchar(50),
    tipo_servicio varchar(50),
    bidones int,
    maquinas int,
    precio int,
    idRecorrido int,
    mail varchar(50),
    fecha_alta varchar(50),
    detalles varchar(100)
);

SELECT * FROM clientesEmpresa;





