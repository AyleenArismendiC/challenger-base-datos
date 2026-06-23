
## Sistema de Gestión de Ventas e Inventario

 1. Descripción del proyecto

**Sistema modelado:**  
Se implementó un sistema relacional orientado a la gestión de ventas para una tienda tecnológica. Este sistema permite administrar el catálogo de productos con sus precios, registrar información de clientes y llevar un control detallado de cada compra mediante un historial de ventas con cantidades asociadas.

**Problema que resuelve:**  
Reduce el desorden generado por registros manuales o planillas, evitando errores de duplicidad y pérdida de información. Al centralizar los datos, se mejora la visibilidad del negocio, permitiendo identificar qué productos tienen mayor demanda, la frecuencia de compra de los clientes y el ingreso total generado.

---

## 2. Tecnologías utilizadas

**PostgreSQL:**  
Motor de base de datos relacional utilizado para mantener la integridad de los datos mediante llaves primarias, foráneas y restricciones entre tablas.

**SQL:**  
Lenguaje utilizado para crear la estructura del sistema, insertar datos de prueba y ejecutar consultas para análisis del negocio.

---

## 3. Instrucciones de uso

Para ejecutar este proyecto en un entorno local con PostgreSQL, sigue estos pasos en orden:

🔹 **Paso 1: Ejecutar `schema.sql`**  
Crea la estructura de la base de datos (tablas y relaciones). Debe ejecutarse primero en una base vacía.

```bash
psql -U tu_usuario -d tu_base_datos -f schema.sql

🔹 Paso 2: Ejecutar seed.sql
Carga datos de prueba como clientes, productos y ventas. Se ejecuta después del esquema.

psql -U tu_usuario -d tu_base_datos -f seed.sql

🔹 Paso 3: Ejecutar report.sql
Ejecuta consultas de análisis como joins, agrupaciones y métricas de ventas.

psql -U tu_usuario -d tu_base_datos -f report.sql
🔹 **Paso 1: Ejecutar `schema.sql`**  
Este script crea la estructura de la base de datos y define las relaciones entre las tablas (clientes, productos, ventas y detalle de ventas). Debe ejecutarse sobre una base de datos vacía.

```bash
psql -U tu_usuario -d tu_base_datos -f schema.sql

🔹 Paso 2: Ejecutar seed.sql
Carga datos iniciales de prueba como clientes, productos y registros de ventas. Este paso se realiza únicamente después de haber creado el esquema.

psql -U tu_usuario -d tu_base_datos -f seed.sql

🔹 Paso 3: Ejecutar report.sql
Contiene consultas SQL orientadas al análisis del negocio, como agrupaciones, joins y métricas de ventas. Se ejecuta al final para obtener resultados basados en los datos ya ingresados.

psql -U tu_usuario -d tu_base_datos -f report.sql

4. Diagrama ER en Mermaid
erDiagram
    clientes {
        INT id_cliente PK
        VARCHAR nombre
        VARCHAR email
    }

    productos {
        INT id_producto PK
        VARCHAR nombre
        NUMERIC precio
    }

    ventas {
        INT id_venta PK
        DATE fecha
        INT id_cliente FK
    }

    detalle_venta {
        INT id_detalle PK
        INT id_venta FK
        INT id_producto FK
        INT cantidad
    }

    clientes ||--o{ ventas : "realiza"
    ventas ||--|{ detalle_venta : "contiene"
    productos ||--o{ detalle_venta : "esta_en"
```




