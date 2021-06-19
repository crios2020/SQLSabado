show databases;
use cursoMySQL;
show tables;
describe clientes;
select * from clientes;

drop database if exists negocio;
create database negocio;
use negocio;

create table if not exists clientes (
codigo int auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);

create table facturas(
letra char(1),
numero int,
fecha date,
monto double,
primary key (letra,numero)
);

create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);

insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');

insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);

insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);

insert into clientes (nombre,apellido,cuit,direccion) values ('maria','fernandez','xxxxx','');
insert into clientes (nombre,apellido,cuit,direccion) values ('gustavo','ramirez','xxxxx',null);


insert into facturas values ('f',0006,curdate(),300);
insert into facturas values ('f',0007,curdate(),400);

insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');

insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);

insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);

insert into clientes (nombre,apellido,direccion) values ('Andrea','Abate','Laprida 648');
insert into clientes (apellido,nombre) values ('Stuart','Jhon');
insert into clientes values(null,'Laura','Georgeff','56565','Berutti 2589','');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values (null,'jose','sanchez','xxxxx','chile 150');
insert into clientes values (null,'marta','martinez','xxxxx','florida 150','');
insert into clientes (nombre,apellido,cuit,direccion) values ('carlos','flores','xxxxx','bolivar 150');
insert into clientes values (20,'Romeo','Lopez','34343434','Anchorena 950','');
insert into clientes (nombre,apellido,cuit,direccion) values ('Florencia','Salinas','82828282','W.Morris 3420');
insert into clientes (apellido,nombre,direccion) values ('Ana','Salone',null);

show databases;
show tables;
describe clientes;
describe facturas;
describe articulos;
select * from clientes;
select * from facturas;
select * from articulos;


-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto de datos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1

/*
		nombre char(20),
		
        |ANA                 |			20 bytes
        |CARLOS              |			20 bytes
        |MAXIMILIANO         | 		 	20 bytes
								Total:	60 bytes
		nombre varchar(20)
        
        |ANA                 |			 3 + 1 = 4 bytes
        |CARLOS              |			 6 + 1 = 7 bytes
        |MAXIMILIANO         | 		 	11 + 1 =12 bytes
										Total:  23 bytes
        
        
*/
-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8			256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 

/*
	id tinyint,   (signed)
    
    |--------|--------|
  -128       0       127
  
	id tinyint unsigned,
    
	|-----------------|
    0                255
    
    precio decimal(7,2)
    
    -----,--
    
    precio float
    
    10/3
    3.333333
    --------
    
    100/3
    33.33333
    --------
    
    precio double
    
    10/3
    3.3333333333333
    ---------------
    
    100/3
    33.333333333333
    ---------------
    
*/


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’	'2021/06/19'	
-- datetime	8
-- time		3
-- year		1

-- comando select
select 'Hola Mundo!!';
select 2 + 2;

-- uso del alias
select 2 + 2 as total;
select 2 + 2 total;

-- función curdate() fecha de server
select curdate() fecha_actual;
select curdate() 'fecha actual';

-- función curtime() hora de server
select curtime() hora_actual;

-- función sysdate() fecha y hora de server
select sysdate() fecha_hora;

select pi() valor_pi;
select round(pi(),2) valor_pi;

-- ------------------------
-- Definiciones importantes
-- ------------------------


-- Significado de SQL
-- Structured Query Language

-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.


-- DDL (DATA DEFINITION LANGUAGE)
-- Create table
-- Alter table
-- Drop table

-- DML (DATA MANIPULATION LANGUAGE)
-- Select
-- Insert
-- Update
-- Delete

-- Comando DML
-- select * from
-- * comodin todos los campos

select * from clientes;
select nombre,apellido from clientes;
select nombre,apellido,nombre,curdate() fecha from clientes;

-- columnas calculadas
select * from facturas;
select letra, numero, fecha, monto, round(monto*.21,2) valor_iva from facturas;
select *, round(monto*.21,2) valor_iva from facturas; -- solo mysql o mariadb

insert into facturas (letra,numero,fecha,monto) values ('A',2334,curdate(),1000);

-- clausula where
-- operadores relaciones = != <> < <= > >=
select * from facturas where monto>1000;
select * from facturas where monto>=1000;
select * from clientes where nombre='Juan';
select * from clientes where nombre!='Juan';
select * from clientes where nombre<>'Juan';

-- Operadores logicos AND OR 
select * from clientes where nombre='Laura' or nombre='Juan';
select * from clientes where nombre='Laura' and apellido='Gomez';

-- facturas con monto entre 300 y 400 $
select * from facturas where monto>=300 and monto<=400;
select * from facturas where monto<300 or monto>400;

-- clausula between
select * from facturas where monto between 300 and 400;
select * from facturas where monto not between 300 and 400;

-- facturas del dia de hoy
select * from facturas where fecha='2021/06/19';

-- facturas del mes de junio de 2021 con importe entre 300 y 400
select * from facturas where month(fecha)=6 and year(fecha)=2021 and monto between 300 and 400;

-- clausula in not in
select * from clientes
	where codigo=2
    or codigo=7
    or codigo=8
    or codigo=13
    or codigo=34
    or codigo=100;

select * from clientes where codigo in(2, 7, 8, 13, 34, 100);
select * from clientes where codigo not in(2, 7, 8, 13, 34, 100);

-- valores null
insert into clientes (nombre,apellido,direccion) values 
	('Ana','Moretti',''),
    ('Cristian','Molina',null);
    
select * from clientes;
select * from clientes where direccion ='';

-- select * from clientes where direccion = null;	-- error
select * from clientes where direccion is null;
select * from clientes where direccion is not null;

insert into clientes (nombre,apellido) values
('Mirta','Perez'),
('Monica','Perez'),
('Armando','Perez'),
('Osmar','Perez'),
('Omar','Perez'),
('Magali','Perez'),
('Macarena','Perez'),
('Mariela','Perez'),
('Miguel','Perez'),
('Mariano','Perez');

-- clausula like not like
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like 'mar%a';
select * from clientes where nombre like '%ar%';
select * from clientes where nombre like '%a';
select * from clientes where nombre like 'm_r%';
select * from clientes where nombre like '___';
select * from clientes where nombre like '____';
select * from clientes where nombre like '_____';
select * from clientes where nombre like '_____%';

-- order by
select * from clientes;
select * from clientes order by apellido asc;
select * from clientes order by apellido desc;
select * from clientes order by apellido,nombre;

select codigo,nombre,apellido,cuit,direccion from clientes order by apellido,nombre;

-- Laboratorio

-- 1 - Ingrese a la base de datos negocio.

-- 2 - Ingrese 5 registros aleatorios en cada tabla.

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.
select * from articulos;

-- a-	artículos con precio mayor a 100
select * from articulos where precio>100;

-- b-	artículos con precio entre 20 y 40 (usar < y >)
-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
-- d-	artículos con precio = 20 y stock mayor a 30
-- e-	artículos con precio (12,20,30) no usar IN
-- f-	artículos con precio (12,20,30) usar el IN
-- g-	artículos que su precio no sea (12,20,30)
-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
-- i-   listar nombre y descripción de los artículos que no cuesten $100
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.









