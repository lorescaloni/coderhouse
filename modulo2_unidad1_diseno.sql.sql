create database modulo2_unidad1_disenosql;

use modulo2_unidad1_disenosql;

--1. CREACION DE LA TABLA CLIENTES
create table clientes(
--INT: Ideal para identificadores únicos numéricos sin decimal.
id_client int,
--VACHAR(100): Almacena texto de longitud variable hasta 100 caracteres.
nombre varchar(100),
perfil_bio text,
--DATE: Guarda exclusivamente año, mes y día.
fecha_registro date,
)

--2. CREACION DE LA TABLA PRODUCTOS
create table productos(
--INT: identificador único numérico para cada producto
id_productos int,
--VARCHAR (255): texto variable de hasta 255 caracteres.
descripcion varchar(255),
--DECIMAL(10,2): Guarda hasta 10 digitos, de los cuales dos son para los centavos.
precio decimal(10,2),
--BIT: Valores Booleanos 1=activo; 0= inactivo
esta_activo bit 
)

select * from productos
select * from clientes
