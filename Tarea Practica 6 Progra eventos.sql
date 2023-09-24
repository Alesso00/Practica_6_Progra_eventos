--Tarea de practica 6

--TAREA DE BASE DE DATOS PARA UNA CL�NICA DE
--ANIMALES EN SQL SERVER
--Objetivo: Dise�ar una base de datos en SQL Server para una cl�nica de animales, incluyendo tablas con relaciones, y crear las
--cuatro sentencias b�sicas para cada tabla.
--Instrucciones:
--� Dise�o de Tablas: Crear tablas que representen elementos clave de la cl�nica (p. ej., pacientes, propietarios, citas,
--tratamientos) con relaciones adecuadas.
--� Inclusi�n de Relaciones: Establecer relaciones entre las tablas utilizando claves primarias y for�neas.
--� Sentencias B�sicas: Generar las cuatro sentencias b�sicas de SQL (SELECT , INSERT{3}, UPDATE{3}, DELETE{1}) para cada
--tabla.

create database Clinica_Animales
use Clinica_Animales

--Creacion De Tablas 
-- Tabla Propietarios
create table Propietarios (
    Propietario_Id int primary key identity,
    Nombre varchar(50),
    Apellido varchar(50),
    Direccion varchar(100),
    Telefono varchar(15)
);

-- Tabla Pacientes
create table Pacientes (
    Paciente_Id int primary key identity,
    Nombre varchar(50),
    Especie varchar(50),
    Raza varchar(50),
    Fecha_Nacimiento date,
    Propietario_Id int
);

-- Tabla Citas
create table Citas (
    Cita_Id int  primary key identity,
    Paciente_Id int,
    Propietario_Id int,
    Fecha datetime,
    Motivo varchar(100)
);

-- Tabla Tratamientos
create table Tratamientos (
    Tratamiento_Id int primary key identity,
    Paciente_Id int,
    Veterinario_Id int,
    Fecha_Inicio date,
    Fecha_Fin date,
    Descripcion varchar(200)
);

-- Tabla Veterinarios
create table Veterinarios (
    Veterinario_Id int primary key identity,
    Nombre varchar(50),
    Apellido varchar(50),
    Especialidad varchar(50)
);

-- Agregar Claves For�neas
alter table Pacientes add foreign key (Propietario_Id) References Propietarios(Propietario_Id);

alter table Citas add foreign key (Paciente_Id) References Pacientes(Paciente_Id);

alter table Citas add foreign key (Propietario_Id) references Propietarios(Propietario_Id);

alter table Tratamientos add foreign key (Paciente_Id) references Pacientes(Paciente_Id);

alter table Tratamientos add foreign key (Veterinario_Id) references Veterinarios(Veterinario_Id);

--Agregar Datos A Las Tablas 

insert into Propietarios (Nombre, Apellido, Direccion, Telefono)
values
    ('Juan', 'Perez', 'Calle A, No. 123', '2121-2828'),
    ('Mar�a', 'Gonz�lez', 'Avenida B, No. 456', '7888-2658'),
    ('Pedro', 'L�pez', 'Calle C, No. 789', '755-9012'),
    ('Ana', 'Rodriguez', 'Avenida D, No. 1011', '655-3456'),
    ('Luis', 'Mart�nez', 'Calle E, No. 1213', '765-7890');


insert into Pacientes (Nombre, Especie, Raza, Fecha_Nacimiento, Propietario_Id)
values
    ('Bruno', 'Perro', 'Mestizo', '2020-05-15', 1),
    ('Luna', 'Gato', 'Siames', '2019-08-22', 2),
    ('Buddy', 'Perro', 'Golden Retriever', '2018-04-10', 3),
    ('Miau', 'Gato', 'Persa', '2021-02-03', 4),
    ('Rocky', 'Perro', 'Bulldog', '2017-11-20', 5);



insert into Citas (Paciente_Id, Propietario_Id, Fecha, Motivo)
values
  (1, 1, '25-09-23', 'Vacunaci�n'), 
    (2, 2, '26-09-23', 'Consulta De Rutina'),
    (3, 3, '27-09-23', 'Tratamiento Dental'),
    (4, 4, '28-09-23', 'Vacunaci�n Anual'),
    (5, 5, '28-09-23', 'Control De Peso');

	insert into Veterinarios (Nombre, Apellido, Especialidad)
values
    ('Dr. Mart�n', 'G�mez', 'Medicina General'),
    ('Dra. Laura', 'Fern�ndez', 'Cirug�a Veterinaria'),
    ('Dr. Carlos', 'D�az', 'Odontolog�a Animal'),
    ('Dra. Isabel', 'L�pez', 'Medicina Interna'),
    ('Dr. Juan', 'Ram�rez', 'Nutrici�n Animal');

insert into Tratamientos (Paciente_Id, Veterinario_Id, Fecha_Inicio, Fecha_Fin, Descripcion)
values
    (1, 1, '25-09-23', '26-10-23', 'Vacunaci�n Y Desparasitaci�n'),
    (2, 2, '26-09-23', '27-10-23', 'Evaluaci�n De Salud General'),
    (3, 3, '27-09-23', '25-10-23', 'Limpieza Dental'),
    (4, 4, '28-09-23', '28-10-23', 'Vacunaci�n Y Control De Pulgas'),
    (5, 5, '28-09-23', '27-10-23', 'Dieta Y Ejercicio Recomendados');





select * from Propietarios
select * from Pacientes
select * from Citas
select * from Tratamientos
select * from Veterinarios


-- Actualizaciones (UPDATE)

Update Propietarios
Set Telefono = '777-4321'
Where Propietario_Id = 1;

Update Pacientes
Set Especie = 'Perro', Raza = 'D�lmata'
Where Paciente_Id = 2;

Update Citas
Set Motivo = 'Examen De Sangre'
Where Cita_Id = 1;

Update Tratamientos
Set Descripcion = 'Vacunaci�n Y Control De Pulgas Mensual'
Where Tratamiento_Id = 4;

Update Veterinarios
Set Apellido = 'Garc�a'
Where Veterinario_Id = 5;

-- Seleccionar datos actualizados
select * from Propietarios;
select * from Pacientes;
select * from Citas;
select * from Tratamientos;
select * from Veterinarios;

-- Eliminaciones (DELETE)


delete from Citas
where Cita_Id = 2;

delete from Tratamientos
where Tratamiento_Id = 1;



-- Seleccionar datos actualizados
select * from Propietarios;
select * from Pacientes;
select * from Citas;
select * from Tratamientos;
select * from Veterinarios;