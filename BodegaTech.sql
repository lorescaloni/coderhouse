-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Lorena Scaloni
-- Fecha: 25/07/2026
-- ══════════════════════════════════════════

-- ── SECCIÓN DDL ──────────────────────────

-- Paso 1: Eliminar la tabla si existe para permitir re-ejecución del script
DROP TABLE IF EXISTS inventario;

-- Paso 2: Crear la estructura de la tabla con tipos de datos e id_producto como PK
CREATE TABLE inventario (
    id_producto     INT PRIMARY KEY,              -- INT: Números enteros, ideal para IDs secuenciales y como Primary Key.
    nombre_producto VARCHAR(100) NOT NULL,        -- VARCHAR(100): Cadena de texto de longitud variable hasta 100 caracteres, ahorra espacio.
    categoria       VARCHAR(50) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,       -- DECIMAL(10,2): Exactitud matemática estricta para moneda/dinero, evitando errores de redondeo de FLOAT.
    stock_actual    INT NOT NULL,
    stock_minimo    INT NOT NULL,
    fecha_ingreso   DATE NOT NULL,                -- DATE: Almacena únicamente fechas (Año-Mes-Día), perfecto para trazabilidad de ingresos.
    activo          bit                           -- bit BOOLEAN: Representa estados binarios (1 para activo, 0 para inactivo).
);


-- ── SECCIÓN DML ──────────────────────────

-- Paso 3: Carga inicial de productos
INSERT INTO inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
    (1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
    (2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
    (3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
    (4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
    (5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
    (6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
    (7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
    (8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
    (9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
    (10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- Paso 4: Registro de ventas del día (descuento de stock)
-- Venta de 3 unidades de Laptop Pro 15 (id 1): 15 - 3 = 12
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Venta de 12 unidades de Mouse Inalámbrico (id 2): 80 - 12 = 68
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Venta de 5 unidades de Auriculares BT Pro (id 6): 35 - 5 = 30
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- Paso 5: Descontinuar la Webcam HD 1080p (id 8)
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- Paso 6: Consulta para validar el estado final de los datos
SELECT * FROM inventario;
