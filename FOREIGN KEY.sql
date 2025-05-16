-- Crear base de datos y se dropea si ya existe una con el mismo nombre
drop database  Proyecto_Final_II_Unidad;
CREATE DATABASE IF NOT EXISTS Proyecto_Final_II_Unidad;
USE Proyecto_Final_II_Unidad;

CREATE TABLE Puestos (
    id_puesto INT PRIMARY KEY,
    nombre_puesto VARCHAR(50),
    salario DECIMAL(10,2),
    nivel INT
);

CREATE TABLE Empresas (
    id_empresa INT PRIMARY KEY,
    nombre_empresa VARCHAR(100),
    contacto_empresa VARCHAR(20),
    direccion_empresa VARCHAR(150),
    correo_empresa VARCHAR(100)
);

CREATE TABLE EstadosSeguridad (
    id_estado INT PRIMARY KEY,
    estado VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    telefono_proveedor VARCHAR(20),
    correo_proveedor VARCHAR(100),
    direccion_proveedor VARCHAR(150)
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    direccion_empleado VARCHAR(150),
    telefono_empleado VARCHAR(20),
    correo_empleado VARCHAR(100),
    id_puesto INT,
    id_empresa INT,
    FOREIGN KEY (id_puesto) REFERENCES Puestos(id_puesto),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    usuario VARCHAR(50),
    contraseña VARCHAR(100),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE Articulos (
    id_articulo INT PRIMARY KEY,
    nombre_articulo VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Compras (
    id_compra INT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10,2),
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Facturas (
    id_factura INT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10,2),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE Proyectos (
    id_proyecto INT PRIMARY KEY,
    nombre_proyecto VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_estado INT,
    id_empresa INT,
    FOREIGN KEY (id_estado) REFERENCES EstadosSeguridad(id_estado),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

INSERT INTO Puestos (id_puesto,nombre_puesto,salario,nivel)
VALUES
(1010, 'Administrador', 8500.00, 1),
(2020, 'Recursos Humanos', 7500.00, 2),
(3030, 'Programador Junior', 6000.00, 3),
(4040, 'Programador Senior', 9500.00, 1),
(5050, 'Soporte Técnico', 5000.00, 4);

INSERT INTO Empresas (id_empresa,nombre_empresa,contacto_empresa,direccion_empresa,correo_empresa)
VALUES
(50001, 'SeguriTech', '50211112222', 'Zona 9, Guatemala', 'contacto@seguritech.com'),
(50002, 'SafeData', '50233334444', 'Zona 10, Guatemala', 'info@safedata.com'),
(50003, 'RedProtect', '50255556666', 'Zona 1, Guatemala', 'admin@redprotect.com');

INSERT INTO EstadosSeguridad (id_estado,estado,descripcion)
VALUES
(9001, 'Segura', 'Sin amenazas detectadas'),
(9002, 'Vulnerable', 'Se detectaron vulnerabilidades'),
(9003, 'Comprometida', 'Sistema hackeado'),
(9004, 'Amenazada', 'Intentos de ataque detectados'),
(9005, 'Recuperada', 'Sistema restaurado');

INSERT INTO Proveedores (id_proveedor,nombre_proveedor,telefono_proveedor,correo_proveedor,direccion_proveedor)
VALUES
(80001, 'TechSupply', '50211223344', 'ventas@techsupply.com', 'Zona 4 '),
(80002, 'ProtecNet', '50222334455', 'contacto@prote.net', 'Zona 6'),
(80003, 'MegaSoft', '50233445566', 'info@megasoft.com', 'Zona 8');

INSERT INTO Empleados (id_empleado,nombre_empleado,direccion_empleado,telefono_empleado,correo_empleado,id_puesto,id_empresa)
VALUES
(10001, 'Carlos Gómez', 'Zona 5', '50244556677', 'cgomez@gmail.com', 1010, 50001),
(10002, 'María López', 'Zona 11', '50255667788', 'mlopez@gmail.com', 2020, 50002),
(10003, 'José Pérez', 'Zona 12', '50266778899', 'jperez@gmail.com', 3030, 50001),
(10004, 'Lucía Martínez', 'Zona 13', '50277889900', 'lmartinez@gmail.com', 4040, 50003),
(10005, 'Pedro Ramírez', 'Zona 14', '50288990011', 'pramirez@gmail.com', 5050, 50002);

INSERT INTO Usuarios (id_usuario,usuario,contraseña,id_empleado)
VALUES
(1, 'admin', '123456', 10001),
(2, 'mlopez', 'abcdef', 10002),
(3, 'jperez', 'qwerty', 10003);

INSERT INTO Articulos (id_articulo,nombre_articulo,descripcion,precio,stock,id_proveedor)
VALUES
(1, 'Cámara de Seguridad', 'Cámara HD exterior', 1200.00, 10, 80001),
(2, 'Router WiFi', 'Router dual band', 650.00, 20, 80002),
(3, 'Servidor Rack', 'Servidor Dell PowerEdge', 18000.00, 2, 80003);

INSERT INTO Compras (id_compra,fecha,total,id_proveedor)
VALUES
(1, '2025-05-14', 5000.00, 80001),
(2, '2025-05-14', 3500.00, 80002);

INSERT INTO Facturas (id_factura,fecha,total,id_empresa)
VALUES
(1, '2025-05-14', 8500.00, 50001),
(2, '2025-05-14', 9200.00, 50002);

INSERT INTO Proyectos (id_proyecto,nombre_proyecto,fecha_inicio,fecha_fin,id_estado,id_empresa)
VALUES
(1, 'Instalación CCTV', '2025-05-01', '2025-05-20', 9001, 50001),
(2, 'Protección de Red', '2025-06-01', '2025-06-30', 9002, 50002);




SELECT e.id_empleado, e.nombre_empleado, p.nombre_puesto, em.nombre_empresa
FROM Empleados e
INNER JOIN Puestos p ON e.id_puesto = p.id_puesto
INNER JOIN Empresas em ON e.id_empresa = em.id_empresa;

SELECT pr.id_proyecto, pr.nombre_proyecto, es.estado, em.nombre_empresa
FROM Proyectos pr
INNER JOIN EstadosSeguridad es ON pr.id_estado = es.id_estado
INNER JOIN Empresas em ON pr.id_empresa = em.id_empresa;

SELECT c.id_compra, c.fecha, c.total, p.nombre_proveedor
FROM Compras c
INNER JOIN Proveedores p ON c.id_proveedor = p.id_proveedor;


SELECT f.id_factura, f.fecha, f.total, e.nombre_empresa
FROM Facturas f
INNER JOIN Empresas e ON f.id_empresa = e.id_empresa;

SELECT u.id_usuario, u.usuario, e.nombre_empleado, p.nombre_puesto
FROM Usuarios u
INNER JOIN Empleados e ON u.id_empleado = e.id_empleado
INNER JOIN Puestos p ON e.id_puesto = p.id_puesto;

SELECT a.id_articulo, a.nombre_articulo, a.precio, p.nombre_proveedor
FROM Articulos a
INNER JOIN Proveedores p ON a.id_proveedor = p.id_proveedor;






