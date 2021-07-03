
-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes set nombre='Jose' where codigo=1;

-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
update clientes set nombre='Pablo', apellido='Fuentes', cuit='20-21053119-0' where codigo=3;

-- 5-	Actualizar todos los comentarios NULL  a ''.
update clientes set comentarios='' where comentarios is null; 

-- 6-	Eliminar los clientes con apellido Perez.
delete from clientes where apellido='Perez';

-- 7-	Eliminar los clientes con CUIT Terminan en 0.
delete from clientes where CUIT like '%0';

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
select * from articulos;
update articulos set precio=round(precio*1.20,2) where precio<=50;

-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
update articulos set precio=round(precio*1.15,2) where precio>50;

-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
update articulos set precio=round(precio*.95,2) where precio>200;

-- 	11- Eliminar los artículos con stock menor a 0.
delete from articulos where stock <0;

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
alter table articulos add stockMinimo int;
alter table articulos add stockMaximo int;

--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
select * from articulos;
update articulos set stockMinimo=20, stockMaximo=40;

--  14- Listar los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
select codigo,nombre,precio,stock,stockMinimo,stockMaximo, stockMaximo-stock reponer 
	from articulos where stock<stockMinimo;

--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
select precio*stock valor from articulos;
select round(sum(precio*stock),2) valor_total from articulos;

--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
select round(sum(precio*1.21*stock),2) valor_total from articulos;

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

-- función sum(arg) num
select sum(monto) total from facturas;

-- función avg(arg) num
select avg(monto) promedio from facturas;

-- función count()
select count(*) cantidad from clientes;
select count(direccion) cantidad from clientes;

-- Agrupamiento con group by 

-- Cuanto se facturo por cada tipo de factura
select sum(monto) total_A from facturas where letra='a';
select sum(monto) total_B from facturas where letra='b';
select sum(monto) total_C from facturas where letra='c';

/*
	Letra		Total
		A		4890
		B 		1000
        C 		 300
*/

select letra, sum(monto) total from facturas group by letra;

-- cuanto se factura en cada dia
select fecha,sum(monto) total, count(*) cantidad from facturas group by fecha;

-- cuanto se factura en cada mes
select concat(year(fecha),'/',month(fecha)) mes,sum(monto) total, count(*) cantidad 
	from facturas group by concat(year(fecha),'/',month(fecha));

-- uso del having
select letra, sum(monto) total, round(sum(monto*1.21),2) total_iva 
	from facturas group by letra having total_iva>=1000;

-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE

--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 127 en la tabla ASCII.

-- 2- Agregar el campo patente despues del campo modelo.

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
-- 	b. obtener el precio mínimo.
-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
-- 	d. obtener el precio promedio.
-- 	e. obtener el precio promedio del año 2016.
-- 	f. obtener la cantidad de autos.
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
-- 	h. obtener la cantidad de autos que hay en cada año.
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
-- 	j. obtener la suma de precios y el promedio de precios según marca.
--  k. informar los autos con el menor precio.
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
--  n. contar cuantos autos hay de cada marca.
--  o. borrar los autos del siglo pasado.


-- Declarar Clave Foranea

alter table facturas add idCliente int;
describe facturas;
select * from facturas;
select * from clientes;

-- declara la restricción de clave foranea.
alter table facturas
	add constraint fk_facturas_idCliente2
    foreign key(idCliente)
    references clientes(codigo);
    
update facturas set idCliente=2 where numero=1;
update facturas set idCliente=4 where numero=2;
update facturas set idCliente=4 where numero=3;
update facturas set idCliente=4 where numero=4;
update facturas set idCliente=5 where numero=5;
update facturas set idCliente=5 where numero=6;
update facturas set idCliente=6 where numero=7;
update facturas set idCliente=7 where numero=8;
update facturas set idCliente=8 where numero>=9;


-- Consulta de producto cartesiano
select * from clientes,facturas;
select count(*) cantidad from clientes;				--  15
select count(*) cantidad from facturas;				--  11
select count(*) cantidad from clientes,facturas;	-- 165
select 15*11;										-- 165

-- Consulta de producto relacionado
select * from clientes,facturas where clientes.codigo=facturas.idCliente;

-- aleas de tablas
select * from clientes c, facturas f where c.codigo=f.idCliente;

-- uso del join
select * from clientes c join facturas f on c.codigo=f.idCliente; 

-- left join
select * from clientes c left join facturas f on c.codigo=f.idCliente; 
insert into facturas (letra,numero,fecha,monto) values ('a',2002,curdate(),8000);

-- right join
select * from clientes c right join facturas f on c.codigo=f.idCliente; 
delete from facturas where letra='a' and numero=2002;
alter table facturas modify idCliente int not null;

-- Quienes (nombre,apellido) han comprado el dia '2021/06/26'?
select distinct nombre, apellido from clientes c join facturas f on c.codigo=f.idCliente
	where fecha='2021/06/26';

-- Cuales son las facturas de Mario Lopez?
select letra,numero,fecha,monto from clientes c join facturas f on c.codigo=f.idCliente
	where nombre='mario' and apellido='lopez';

-- Cuanto es lo facturado a Mario Lopez en el año 2021?
select sum(monto) total from clientes c join facturas f on c.codigo=f.idCliente
	where nombre='mario' and apellido='lopez' and year(fecha)=2021;










