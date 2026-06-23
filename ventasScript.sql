CREATE DATABASE tienda_tecnologia;
create table clientes (
id_cliente bigserial not null primary key,
nombre varchar(50),
edad int,
correo varchar(150)
);

INSERT INTO clientes (nombre, edad, correo)
VALUES
('luis',56,'luis@gmail.com'),
('maria',45,'maria@mail.com'),
('ayleen',27,'ayleen@mail.com'),
('benjamin',15,'benja@gmail.com');

CREATE TABLE productos (
    id_producto BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL CHECK (precio > 0)
);
INSERT INTO productos (nombre, precio)
VALUES
('Notebook Lenovo', 450000),
('Mouse Logitech', 15000),
('Teclado Redragon', 35000),
('Monitor Samsung', 180000),
('Impresora HP', 120000);

CREATE TABLE ventas (
    id_venta BIGSERIAL PRIMARY KEY,
    fecha DATE DEFAULT CURRENT_DATE,
    id_cliente BIGINT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

insert into ventas (fecha, id_cliente) values
('2025-06-14', 1),
('2026-04-02',1),
('2024-04-22', 3),
('2022-05-22', 2);



CREATE TABLE detalle_ventas (
    id_detalle BIGSERIAL PRIMARY KEY,
    id_venta BIGINT NOT NULL,
    id_producto BIGINT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
    INSERT INTO detalle_ventas (id_venta, id_producto, cantidad)
VALUES (2, 1, 1);
);

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 4, 1),
(3, 5, 2);

-- 1. Mostrar todos los clientes registrados
SELECT * FROM clientes;

-- 2. Mostrar todos los productos disponibles
SELECT * FROM productos;

-- 3. Mostrar todas las ventas realizadas
SELECT * FROM ventas;

-- 4. Mostrar solo nombre y email de clientes
SELECT nombre,correo FROM clientes;

-- 5. Mostrar solo nombre y precio de productos
SELECT nombre, precio FROM productos;

-- 6. Productos con precio mayor a 50000
SELECT * FROM productos WHERE precio > 50000;

-- 7. Ventas realizadas el 2026-04-02 con nombre del cliente
SELECT v.id_venta,c.nombre AS cliente, v.fecha
FROM ventas v JOIN clientes c
  ON v.id_cliente = c.id_cliente  WHERE v.fecha = '2026-04-02';

	-- 8. Productos ordenados de mayor a menor precio
SELECT * FROM productos ORDER BY precio DESC;

-- 9. Clientes ordenados por nombre
select * from clientes order by nombre;

-- 10. Detalles de venta con cantidad >= 2
SELECT * FROM detalle_ventas WHERE cantidad >= 2;

-- 11. Total de clientes
SELECT COUNT(*) AS total_clientes FROM clientes;

-- 12. Total de productos
SELECT COUNT(*) AS total_productos FROM productos;

-- 13. Total de ventas
SELECT COUNT(*) AS total_ventas FROM ventas;

-- 14. Precio promedio de productos
SELECT AVG(precio) AS precio_promedio FROM productos;

-- 15. Suma total de precios de productos
SELECT SUM(precio) AS suma_total_precios FROM productos;

-- 16. Mostrar venta + nombre del cliente + fecha
SELECT v.id_venta,  c.nombre, v.fecha FROM ventas v JOIN clientes c
    ON v.id_cliente = c.id_cliente;

-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad
SELECT  dv.id_venta, p.nombre AS nombre_producto,  dv.cantidad
FROM detalle_ventas dv JOIN productos p ON dv.id_producto = p.id_producto;

-- 18. Mostrar nombre del cliente + id de venta + fecha
SELECT c.nombre AS nombre_cliente,  v.id_venta,
  v.fecha FROM ventas v JOIN clientes c ON v.id_cliente = c.id_cliente;

-- 19. Mostrar nombre del producto + cantidad vendida + id de venta
SELECT p.nombre AS nombre_producto,
  dv.cantidad, dv.id_venta FROM detalle_ventas dv JOIN productos p ON dv.id_producto = p.id_producto;

-- 20. Mostrar cuántas ventas ha realizado cada cliente
select c.nombre,COUNT(v.id_venta) AS total_ventas
FROM clientes c JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;

-- 21. Mostrar solo los clientes con más de una venta
SELECT c.id_cliente, c.nombre, COUNT(v.id_venta) AS total_ventas
FROM clientes c JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre HAVING COUNT(v.id_venta) > 1;

-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta
SELECT  p.id_producto, p.nombre,COUNT(dv.id_producto) AS veces_aparece
FROM productos p JOIN detalle_ventas dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre;

-- 23. Mostrar solo los productos que aparecen más de una vez
SELECT  p.id_producto, p.nombre, COUNT(dv.id_producto) AS veces_aparece
FROM productos p JOIN detalle_ventas dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre HAVING COUNT(dv.id_producto) > 1;

-- 24. Mostrar las ventas que tienen más de un producto asociado
SELECT dv.id_venta, COUNT(dv.id_producto) AS total_productos
FROM detalle_ventas dv GROUP BY dv.id_venta HAVING COUNT(dv.id_producto) > 1;

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2
SELECT   c.id_cliente,   c.nombre,   SUM(dv.cantidad) AS total_unidades
FROM clientes c JOIN ventas v ON c.id_cliente = v.id_cliente
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta GROUP BY c.id_cliente, c.nombre
HAVING SUM(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
-- Explicar por qué el resultado vacío es correcto
SELECT *FROM clientes
WHERE edad > 150; --no devuelve resultados ya que  estoy filtrando cliente por una edad que dentro
--de las tablas creadas no existe 
'