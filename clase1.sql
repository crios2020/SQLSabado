/*
	Curso: Introducción a las bases y sql	12 hs
	Días: Sábados 15:00 a 18:00 hs
	Profe: Carlos Ríos 		carlos.rios@educacionit.com

	Materiales: alumni.educacionit.com
				user: email
				pass: dni

	github: https://github.com/crios2020/SQLSabado


	IDE: Integrated Development Enviroment (Entorno de desarrollo integrado)

	Software:		Server	MySQL Community Server - MariaDB

					Client 	MySQL Workbench
					
					
					Paquete XAMPP
					
					X		Linux/Windows/Mac
					A		Apache Web Server
					M		MySQL / MariaDB
					P		PHP
					P		Perl
					
					Paquetes WAMP, LAMP, MAMP, appsrv

*/

/* 
	Bloque 
    de
    comentarios
*/

-- Linea de comentarios

show databases;				-- muestra las bds del server.
							-- crtol enter para ejecutar
                            -- ; es el terminador de sentencias
                            
SHOW DATABASES;				-- El lenguaje no es case sensitive

create database cursoMySQL;		-- crear una base de datos
use cursoMySQL;					-- entrar a la base de datos cursoMySQL

show tables;					-- muestra las tablas de la BD

create table clientes( 
	id 			int 		auto_increment primary key, 
    nombre 		varchar(25) not null, 
    apellido 	varchar(25) not null,
    cuit 		char(11), 
    direccion 	varchar(50), 
    comentarios varchar(140) 
);

describe clientes;		-- describe una tabla

select * from clientes;	-- listar los registros

insert into clientes (nombre,apellido,cuit,direccion) 
	values ('Andrea','Moretti','26233830','Laprida');








