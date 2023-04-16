CREATE DATABASE renta_video 
ON 
(NAME = 'Renta',
FILENAME = 'C:\Users\drago\Desktop\Desafio2\Renta.mdf',
SIZE = 10MB,
MAXSIZE = 20MB,
FILEGROWTH = 10%)
LOG ON 
(NAME = ' Renta_log' ,
FILENAME = 'C:\Users\drago\Desktop\Desafio2\Renta_Log.ldf' ,
SIZE = 9MB,
MAXSIZE = 15MB,
FILEGROWTH = 5MB );
 GO

  use renta_video
 go 

 
-- creacion de las tablas
create table clientes
( Nombres varchar(25) not null,
  Apellidos varchar(25) not null,
  DUI varchar(25) not null,
  Fecha_Afiliacion datetime not null,
  Edad int not null
)
go

create table rentas
( CodR varchar(25) not null,
  CodP varchar(25) not null,
  DUI varchar(25) not null,
  Fecha_Ingreso datetime not null,
  Fecha_Devolucion datetime not null,
  Cobro float not null,
  Mora float not null 
)
go 

create table peliculas 
( CodP varchar(25) not null,
  Nombre varchar(50) not null,
  CodT varchar(25) not null,
  CodC varchar(25) not null,
  Fecha_Ingreso datetime not null,
  Disponible int not null
)
go

create table tipos
( CodT varchar(25) not null,
  Nombre_Tipo varchar(25) not null

)

go
create table categorias
(CodC varchar(25) not null,
Categorias varchar(50) not null
)
go


-- creando las restricciones
-- llave primaria tabla clientes
alter table clientes
add constraint PK_DUI
primary key (DUI)
GO

--llave primaria tabla rentas 
alter table rentas
add constraint PK_CodR
primary key (CodR)
GO

--llave primaria tabla tipos
alter table tipos
add constraint PK_CodT
primary key (CodT)
GO

--llave primaria tabla peliculas
alter table peliculas
add constraint PK_CodP
primary key (CodP)
GO


--llave primaria tabla categorias
alter table categorias
add constraint PK_CodC
primary key (CodC)
GO


--llave foranea tabla rentas
alter table rentas
add constraint fK_DUI
foreign key (DUI)
references clientes(DUI)
GO

--llave foranea tabla rentas
alter table rentas
add constraint fK_CodP
foreign key (CodP)
references peliculas(CodP)
GO





--llave foranea tabla peliculas
alter table peliculas
add constraint fK_CodT
foreign key (CodT)
references tipos(CodT)
GO


--llave foranea tabla peliculas
alter table peliculas
add constraint fK_CodC
foreign key (CodC)
references categorias(CodC)
GO


--consulta para los 3 datos del campo nombre_tipo de la tabla tipos 
alter table tipos
add constraint Ck_Nombre_Tipo
check (Nombre_Tipo in ('DVD', 'VHS', 'CASSETTE'));
GO

--Insertar los datos de la tabla clientes
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Miguel Armando', 'Cardoza Sosa', '00224432-3', '2008-04-21', 17)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('María Elena', 'Sánchez Campos', '00278283-2', '2008-04-24', 24)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Carlos', 'Alfaro', '00455594-0', '2022-11-05', 30)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Jorge Ernesto', 'Manzanero Vázquez', '00900082-9', '2008-08-06', 28)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('José Antonio', 'Juárez Blanco', '00901133-2', '2008-04-08', 19)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Herson', 'Serrano', '01433949-8', '2007-06-14', 29)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Raúl Ernesto', 'Barraza Sorto', '01503949-2', '2008-06-14', 29)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Juan José', 'Recinos Ayala', '01850173-9', '2008-03-14', 28)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Pedro Arias', 'Rivas Cisneros', '01900683-1', '2008-05-22', 26)
insert into clientes(Nombres, Apellidos, DUI, Fecha_Afiliacion, Edad) values ('Ana Epifanía', 'López Durango', '02829380-9', '2008-07-15', 24)

go

select * from clientes


--Insertar los datos de la tabla categorias
insert into categorias(CodC, Categorias) values ('C001', 'Comedia')
insert into categorias(CodC, Categorias) values ('C002', 'Infantiles')
insert into categorias(CodC, Categorias) values ('C003', 'Suspenso')
insert into categorias(CodC, Categorias) values ('C004', 'Drama')
insert into categorias(CodC, Categorias) values ('C005', 'Acción')
insert into categorias(CodC, Categorias) values ('C006', 'Juegos')
insert into categorias(CodC, Categorias) values ('C007', 'Sonidos')
insert into categorias(CodC, Categorias) values ('C008', 'Romance')
insert into categorias(CodC, Categorias) values ('C009', 'Terror')
insert into categorias(CodC, Categorias) values ('C010', 'Anime')
go

select * from categorias

--insertar los datos de la tabla tipos
insert into tipos(CodT, Nombre_Tipo) values ('T001', 'DVD' )
insert into tipos(CodT, Nombre_Tipo) values ('T002', 'VHS' )
insert into tipos(CodT, Nombre_Tipo) values ('T003', 'CASSETTE' )
GO

select * from tipos


--insertar los datos de la tabla peliculas 
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P001', 'Ace Ventura','T001', 'C001', '2003-02-12', 3)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P002', 'El Mundo de los Quien','T001', 'C002', '2006-10-01', 4)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P003', 'El Ultimo Guerrero','T002', 'C005', '2005-12-11', 5)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P004', 'Aguas Turbias','T001', 'C003', '2005-11-21', 6)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P005', 'Terminator III','T003', 'C006', '2003-12-26', 5)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P006', 'La Sociedad de los Poetas','T002', 'C004', '2004-09-12', 4)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P007', 'Final Fantasy III','T003', 'C006', '2006-08-23', 5)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P008', 'Little Frog','T001', 'C002', '2007-01-18', 6)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P009', 'Halo 2','T001', 'C006', '2007-07-07', 7)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P010', 'Ace Ventura 2 ','T001', 'C001', '2006-06-14', 4)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P011', 'Oraciones y alabanzas','T003', 'C007', '2006-12-12', 3)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P012', 'Donde hay llanto hay risa','T003', 'C007', '2007-03-11', 3)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P013', 'Rambo III','T001', 'C006', '2004-08-27', 5)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P014', 'Terminator I','T003', 'C006', '2003-04-22', 3)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P015', 'Como agua para chocolate','T001', 'C008', '2002-05-18', 2)
insert into peliculas(CodP, Nombre, CodT, CodC, Fecha_Ingreso, Disponible) values ('P016', 'Black Adam','T001', 'C005', '2022-11-05', 2)
go


select * from peliculas


--insertar los datos de la tabla rentas
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R001','P003', '00900082-9', '2003-02-12 00:00:00.000', '2003-02-16 00:00:00.000', 1.50, 0.50)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R002','P006', '00224432-3', '2006-10-01 00:00:00.000', '2006-10-08 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R003','P001', '00901133-2', '2005-12-11 00:00:00.000', '2005-12-14 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R004','P007', '02829380-9', '2005-11-21 00:00:00.000', '2005-11-29 00:00:00.000', 1.50, 0.50)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R005','P008', '00278283-2', '2003-12-26 00:00:00.000', '2003-12-28 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R006','P004', '00224432-3', '2004-09-12 00:00:00.000', '2004-09-20 00:00:00.000', 1.50, 0.50)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R007','P003', '00900082-9', '2006-08-23 00:00:00.000', '2006-08-26 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R008','P002', '01503949-2', '2007-01-18 00:00:00.000', '2007-01-21 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R009','P007', '00901133-2', '2007-07-07 00:00:00.000', '2007-01-21 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R010','P006', '01900683-1', '2006-06-14 00:00:00.000', '2006-06-24 00:00:00.000', 1.50, 0.50)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R011','P010', '01850173-9', '2006-12-12 00:00:00.000', '2006-12-21 00:00:00.000', 1.50, 0.50)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R012','P005', '00900082-9', '2007-03-11 00:00:00.000', '2007-03-13 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R013','P014', '01900683-1', '2004-08-27 00:00:00.000', '2004-08-29 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R014','P007', '01850173-9', '2003-04-22 00:00:00.000', '2004-04-24 00:00:00.000', 1.50, 0.00)
insert into rentas(CodR, CodP, DUI, Fecha_Ingreso, Fecha_Devolucion, Cobro, Mora) values ('R015','P015', '00224432-3', '2002-05-18 00:00:00.000', '2002-05-28 00:00:00.000', 1.50, 0.50)
go

select * from rentas


-- Mostrar el nombre de los clientes que tengan más de 25 años, ordenar descendente según la edad

SELECT Nombres,Edad FROM clientes
WHERE edad > 25
order by Edad desc

-- Mostrar el nombre de los clientes que tengan entre 18 y 26 años.

SELECT Nombres,Edad FROM clientes
WHERE Edad BETWEEN 18 AND 26

-- Muestre todas las categorías de la tabla categoría, pero no debe mostrar Suspenso ni Drama

SELECT Categorias FROM categorias
WHERE Categorias!='Suspenso' AND Categorias!='Drama'

-- Mostrar los clientes que tienen mora

SELECT DUI,Mora FROM rentas
WHERE Mora > 0 

select * from clientes

--- Mostrar los clientes y las fechas en que se han afiliado entre abril y junio del año 2008

SELECT Nombres,Fecha_Afiliacion FROM clientes
WHERE Fecha_Afiliacion BETWEEN  '2008-04-01' AND  '2008-06-30'
order by Fecha_Afiliacion asc

--- Mostrar el top 3 de películas que tienen mas existencias disponibles en el renta video

SELECT TOP 3 Nombre,Disponible
FROM peliculas 
ORDER BY Disponible DESC

-- Modifique la categoría Juegos por Games
Update categorias set Categorias= 'Games'
where CodC='C006'

Select * from categorias

-- Modifique la fecha de ingreso a 13 de abril 2022 y la cantidad disponible a 10 de la película de ACE Ventura(en una sola consulta)

Update peliculas set Fecha_Ingreso= '2022-04-13', Disponible='10'
where CodP= 'P010'

Select * from peliculas

-- Muestre los nombres de las películas que comiencen con la letra A

SELECT Nombre FROM peliculas
WHERE Nombre LIKE 'A%'

select * from peliculas

--- Elimine las rentas que realizó Pedro Arias Rivas Cisneros}

select * from clientes

delete from rentas where DUI='01900683-1'

select * from rentas

-- Muestre la categoría y el nombre de la película

select Categorias,Nombre from categorias T1
inner join peliculas T2
on T1.CodC=T2.CodC

-- Muestre la categoría, el tipo y el nombre de la película

select Categorias,Nombre,Nombre_Tipo from peliculas T1
inner join categorias T2 on T1.CodC=T2.CodC
inner join tipos T3 on T1.CodT=T3.CodT