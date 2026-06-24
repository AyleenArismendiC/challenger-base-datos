
INSERT INTO clientes (nombre, edad, correo)
VALUES
('luis',56,'luis@gmail.com'),
('maria',45,'maria@mail.com'),
('ayleen',27,'ayleen@mail.com'),
('benjamin',15,'benja@gmail.com');

INSERT INTO productos (nombre, precio)
VALUES
('Notebook Lenovo', 450000),
('Mouse Logitech', 15000),
('Teclado Redragon', 35000),
('Monitor Samsung', 180000),
('Impresora HP', 120000);

insert into ventas (fecha, id_cliente) values
('2025-06-14', 1),
('2026-04-02',1),
('2024-04-22', 3),
('2022-05-22', 2);

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 4, 1),
(3, 5, 2);
