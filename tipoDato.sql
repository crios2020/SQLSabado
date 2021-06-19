
-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto dedatos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1


-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8		256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		
-- datetime	8
-- time		3
-- year		1
