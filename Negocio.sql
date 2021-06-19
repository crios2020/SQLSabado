drop database if exists negocio;
create database negocio;
use negocio;

create table if not exists clientes (
codigo integer auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);

create table facturas(
letra char(1),
numero integer,
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

