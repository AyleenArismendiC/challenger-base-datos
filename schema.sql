DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;


create table clientes (
id_cliente bigserial not null primary key,
nombre varchar(50),
edad int,
correo varchar(150)
);

CREATE TABLE productos (
    id_producto BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL CHECK (precio > 0)
);

CREATE TABLE ventas (
id_venta BIGSERIAL PRIMARY KEY,
fecha DATE DEFAULT CURRENT_DATE,
 id_cliente BIGINT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE RESTRICT
        ON UPDATE CASCADE
);

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