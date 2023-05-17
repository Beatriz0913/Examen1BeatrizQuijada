CREATE DATABASE Mercadito_Examen

USE Mercadito_Examen

CREATE TABLE Productos (
	Id_prod int identity,
	Descripcion_prod varchar(250),
	Precio_prod decimal(10,0),
	Costo_prod decimal(10,0),
	PRIMARY KEY(Id_prod)
);
select *from Productos



CREATE TABLE Proveedores (
	Id_prov int identity,
	Nombre_prov varchar(150),
	TipoProv_Prov varchar(50),
	PRIMARY KEY(Id_prov),
);

CREATE TABLE Clientes (
	Id_cliente int identity,
	Nombre_cliente varchar(250),
	Direccion_cliente varchar(250),
	Cliente_credito int,
	PRIMARY KEY(Id_cliente),
);

CREATE TABLE Factura (
	Id_factura int identity,
	Id_cliente int,
	Toral_factura decimal(10,0),
	Fecha_factura datetime
	PRIMARY KEY(Id_factura),
	FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente)
);

CREATE TABLE Factura_Detalle (
	Id_facturadetalle int identity,
	Id_factura int,
	Cantidad_factuta int,
	PRIMARY KEY(Id_facturadetalle),
	FOREIGN KEY (Id_factura) REFERENCES Factura(Id_factura)
);

CREATE TABLE Credito_Clientes (
	Id_credito int identity,
	Id_factura int,
	PRIMARY KEY(Id_credito),
	FOREIGN KEY (Id_factura) REFERENCES Factura(Id_factura)
);

CREATE TABLE Gasto_Casa (
	Id_gastocasa int identity,
	Total_gastocasa decimal(10,0),
	PRIMARY KEY(Id_gastocasa)
);

CREATE TABLE Gasto_Casa_Detalle (
	Id_gastocasadetalle int identity,
	Id_gastocasa int,
	Id_prod int,
	Cantidad_gastocasa int,
	PRIMARY KEY(Id_gastocasadetalle),
	FOREIGN KEY (Id_gastocasa) REFERENCES Gasto_Casa(Id_gastocasa),
	FOREIGN KEY (Id_prod)  REFERENCES Productos(Id_prod )
);