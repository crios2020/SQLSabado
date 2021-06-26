show databases;
use negocio;

-- Laboratorio

-- 1 - Ingrese a la base de datos negocio.

-- 2 - Ingrese 5 registros aleatorios en cada tabla.

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.
select * from articulos;
describe articulos;

insert into articulos (nombre,precio,stock) values ('Amoladora',12000,20);

-- a-	artículos con precio mayor a 100
select * from articulos where precio>100;

-- b-	artículos con precio entre 20 y 40 (usar < y >)
select * from articulos where precio >=20 and precio <= 40;

-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
select * from articulos where precio between 40 and 60;

-- d-	artículos con precio = 20 y stock mayor a 30
select * from articulos where precio=20 and stock>30;
insert into articulos (nombre,precio,stock) values ('Alfajor',20,50);

-- e-	artículos con precio (12,20,30) no usar IN
select * from articulos where precio=12 or precio=20 or precio=30;

-- f-	artículos con precio (12,20,30) usar el IN
select * from articulos where precio in (12,20,30);

-- g-	artículos que su precio no sea (12,20,30)
select * from articulos where precio not in (12,20,30);

-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
select * from articulos where precio*1.21>100;
insert into articulos (nombre,precio,stock) values
('Lampara 3w',65,5),
('Lampara 5w',75,5),
('Lampara 6w',85,5),
('Lampara 8w',95,5),
('Lampara 9w',100,5);

-- i-   listar nombre o descripción de los artículos que no cuesten $100
select nombre, '' descripcion from articulos where precio<>100;

-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
select * from articulos where nombre like '%lampara%';

-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'
select * from articulos where precio<200 and nombre not like '%a%';
insert into articulos (nombre,precio,stock) values ('oso peluche',150,20);

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados 
--     por nombre.
select * from articulos order by precio desc, nombre;

-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva
--     del producto.
select codigo, nombre, precio,round(precio*1.21,2) precio_con_IVA, stock from articulos;

-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', 
--     la cantidad es fija y es 3, el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select codigo, nombre ,precio, 3 cantidad_de_cuotas, round(precio/3*1.05,2) valor_de_cuota, stock from articulos;

-- Comando DML Insert (ANSI)
describe articulos;
-- Modo normal con defición de campos
insert into articulos (nombre,precio) values ('Estufa Electrica',6700);
insert into articulos (precio,nombre) values (9000,'Estufa Electrica');

-- Modo Abreviado sin definición de campos (ANSI)
insert into articulos values (null,'Estufa a Gas',9000,90);

-- Insert SET (MariaDB y MySQL)  (NO ANSI)
insert articulos set nombre='Ventilador', precio=2600;

-- Insert Masivo (ANSI)
insert into articulos (nombre,precio) values
	('Llave Inglesa 10mm',20),
    ('Llave Inglesa 11mm',22),
    ('Llave Inglesa 12mm',24),
    ('Llave Inglesa 13mm',26),
    ('Llave Inglesa 14mm',28),
    ('Llave Inglesa 15mm',30);

-- insert no masivo
insert into articulos (nombre,precio) values ('Llave Inglesa 10mm',20);
insert into articulos (nombre,precio) values ('Llave Inglesa 11mm',22);
insert into articulos (nombre,precio) values ('Llave Inglesa 12mm',24);
insert into articulos (nombre,precio) values ('Llave Inglesa 13mm',26);
insert into articulos (nombre,precio) values ('Llave Inglesa 14mm',28);
insert into articulos (nombre,precio) values ('Llave Inglesa 15mm',30);

select * from articulos; 


-- comando DML delete ANSI
-- delete from articulos where codigo=120;
-- delete from articulos; -- delete masivo
-- delete from articulos where codigo>120;

-- desactivo la protección safe safe
set sql_safe_updates=0;			-- =1 activa
select * from articulos;

-- comando DML update ANSI
update articulos set precio=35 where codigo=185;

-- aumentar el precio de todos los articulos un 10%
update articulos set precio=round(precio*1.1,2);		-- update masivo

update articulos set stock=0 where stock is null;

-- cargar stock de 10 unidades a todas las llaves inglesas
update articulos set stock=stock+10 where nombre like '%Llave Inglesa%';

describe clientes;

-- Comando DDL Alter table add
-- Agregar un campo a la tabla clientes (edad)
alter table clientes add edad int;
alter table clientes add nacionalidad varchar(25) after apellido;

select * from clientes;
update clientes set nacionalidad='Argentina' ,edad=1114 where codigo=1;
update clientes set nacionalidad='Argentina' ,edad=445 where codigo=2;
update clientes set nacionalidad='Uruguaya' ,edad=825 where codigo=3;

-- Comando DDL Alter table modify
alter table clientes modify edad tinyint unsigned;

-- Comando DDL Alter table drop
alter table clientes drop edad;

select version();

-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
-- 3-	Actualizar el nombre del cliente 1 a Jose.
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
-- 5-	Actualizar todos los comentarios NULL  a ''.
-- 6-	Eliminar los clientes con apellido Perez.
-- 7-	Eliminar los clientes con CUIT Terminan en 0.

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
-- 	11- Eliminar los artículos con stock menor a 0.

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.


-- Funciones de agrupamiento

-- función max(arg) num, texto, fecha hora
select max(monto) from facturas;
select max(monto) monto_máximo from facturas;
select max(nombre) nombre_máximo from clientes;
select max(fecha) ultima_fecha from facturas;

-- función min(arg) num, texto, fecha hora
select min(monto) monto_mínimo from facturas;
select min(nombre) nombre_mínimo from clientes;
select min(fecha) primer_fecha from facturas;









