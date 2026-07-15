-- =====================================================================
-- EJERCICIO TIENDA ONLINE
-- =====================================================================
USE TiendaOnline;
 -- =====================================================================
-- PASO 0: Limpieza inicial
-- Antes de insertar los datos de prueba, se vacían las 4 tablas por si ya contenían datos de una ejecución anterior de este script.
-- =====================================================================
 SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE DetallePedidos;
TRUNCATE TABLE Pedidos;
TRUNCATE TABLE Productos;
TRUNCATE TABLE Clientes;
SET FOREIGN_KEY_CHECKS = 1;
 -- =====================================================================
-- PASO 1: Insertar 20 clientes de prueba (id_cliente 1 a 20)
-- =====================================================================
INSERT INTO Clientes (nombre, email, fecha_registro) VALUES
('Sofía Martín',    'cliente1.ejercicio@test.com',  CURDATE()),
('Diego Ramos',     'cliente2.ejercicio@test.com',  CURDATE()),
('Elena Torres',    'cliente3.ejercicio@test.com',  CURDATE()),
('Javier Ruiz',     'cliente4.ejercicio@test.com',  CURDATE()),
('Carmen Díaz',     'cliente5.ejercicio@test.com',  CURDATE()),
('Pablo Vega',      'cliente6.ejercicio@test.com',  CURDATE()),
('Lucía Ortiz',     'cliente7.ejercicio@test.com',  CURDATE()),
('Marcos Serrano',  'cliente8.ejercicio@test.com',  CURDATE()),
('Isabel Cano',     'cliente9.ejercicio@test.com',  CURDATE()),
('Raúl Molina',     'cliente10.ejercicio@test.com', CURDATE()),
('Nuria Iglesias',  'cliente11.ejercicio@test.com', CURDATE()),
('Álvaro Prieto',   'cliente12.ejercicio@test.com', CURDATE()),
('Beatriz Soto',    'cliente13.ejercicio@test.com', CURDATE()),
('Hugo Castro',     'cliente14.ejercicio@test.com', CURDATE()),
('Marta Herrera',   'cliente15.ejercicio@test.com', CURDATE()),
('Sergio Navarro',  'cliente16.ejercicio@test.com', CURDATE()),
('Cristina Rey',    'cliente17.ejercicio@test.com', CURDATE()),
('Adrián Flores',   'cliente18.ejercicio@test.com', CURDATE()),
('Paula Gil',       'cliente19.ejercicio@test.com', CURDATE()),
('Iván Domínguez',  'cliente20.ejercicio@test.com', CURDATE());
 
 -- =====================================================================
-- PASO 2: Insertar los productos "base" para poder demostrar las consultas de categorías
-- =====================================================================
INSERT INTO Productos (nombre_producto, categoria, precio, stock) VALUES
('Auriculares Bluetooth', 'Electrónica', 29.99, 50),   -- id 1
('Teclado Mecánico',      'Electrónica', 55.00, 40),   -- id 2
('Zapatillas Running',    'Deporte',     65.00, 60),   -- id 3
('Balón de Fútbol',       'Deporte',     20.00, 100),  -- id 4
('Lámpara LED',           'Hogar',       15.00, 80),   -- id 5
('Cafetera',              'Hogar',       40.00, 25);   -- id 6
 
 
-- =====================================================================
-- PASO 3: Insertar 12 pedidos por cada uno de los primeros 12 clientes
-- =====================================================================
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 50.0   FROM Clientes WHERE email = 'cliente1.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 63.37  FROM Clientes WHERE email = 'cliente2.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 76.74  FROM Clientes WHERE email = 'cliente3.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 90.11  FROM Clientes WHERE email = 'cliente4.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 103.48 FROM Clientes WHERE email = 'cliente5.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 116.85 FROM Clientes WHERE email = 'cliente6.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 130.22 FROM Clientes WHERE email = 'cliente7.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 143.59 FROM Clientes WHERE email = 'cliente8.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 156.96 FROM Clientes WHERE email = 'cliente9.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 170.33 FROM Clientes WHERE email = 'cliente10.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 183.7  FROM Clientes WHERE email = 'cliente11.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 197.07 FROM Clientes WHERE email = 'cliente12.ejercicio@test.com';
 
-- 3 pedidos extra para cliente1 (necesario para la consulta 2.4)
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 25.00 FROM Clientes WHERE email = 'cliente1.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 40.00 FROM Clientes WHERE email = 'cliente1.ejercicio@test.com';
INSERT INTO Pedidos (id_cliente, fecha_pedido, total)
SELECT id_cliente, CURDATE(), 15.00 FROM Clientes WHERE email = 'cliente1.ejercicio@test.com';
 
 
-- =====================================================================
-- PASO 4: Detalle de cada pedido
-- =====================================================================
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 4, 5, 100.00 FROM Pedidos WHERE total = 50.0;    -- 5 balones [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 2, 1, 55.00 FROM Pedidos WHERE total = 63.37;    -- 1 teclado [Electrónica]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 3, 3, 195.00 FROM Pedidos WHERE total = 76.74;   -- 3 zapatillas [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 1, 3, 89.97 FROM Pedidos WHERE total = 90.11;    -- 3 auriculares [Electrónica]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 4, 40, 800.00 FROM Pedidos WHERE total = 103.48; -- 40 balones [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 5, 2, 30.00 FROM Pedidos WHERE total = 116.85;   -- 2 lámparas [Hogar]
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 6, 2, 80.00 FROM Pedidos WHERE total = 116.85;   -- 2 cafeteras [Hogar]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 4, 30, 600.00 FROM Pedidos WHERE total = 130.22; -- 30 balones [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 3, 2, 130.00 FROM Pedidos WHERE total = 143.59;  -- 2 zapatillas [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 4, 20, 400.00 FROM Pedidos WHERE total = 156.96; -- 20 balones [Deporte]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 5, 3, 45.00 FROM Pedidos WHERE total = 170.33;   -- 3 lámparas [Hogar]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 1, 2, 59.98 FROM Pedidos WHERE total = 183.7;    -- 2 auriculares [Electrónica]
 
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 3, 2, 130.00 FROM Pedidos WHERE total = 197.07;  -- 2 zapatillas [Deporte]
 
-- Detalle de los 3 pedidos extra de cliente1
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 4, 1, 20.00 FROM Pedidos WHERE total = 25.00;    -- 1 balón [Deporte]
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 6, 1, 40.00 FROM Pedidos WHERE total = 40.00;    -- 1 cafetera [Hogar]
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, subtotal)
SELECT id_pedido, 1, 1, 29.99 FROM Pedidos WHERE total = 15.00;    -- 1 auricular [Electrónica]
 
 
-- =====================================================================
-- 1. CONSULTAS BÁSICAS (SELECT, INSERT, UPDATE, DELETE)
-- =====================================================================
 
-- 1.1 Insertar tres clientes nuevos
INSERT INTO Clientes (nombre, email, fecha_registro) VALUES
('Ana García', 'ana.garcia@email.com', CURDATE()),
('Luis Pérez', 'luis.perez@email.com', CURDATE()),
('Marta Ruiz', 'marta.ruiz@email.com', CURDATE());
 
-- 1.2 Insertar dos productos nuevos
INSERT INTO Productos (nombre_producto, categoria, precio, stock) VALUES
('Ratón Inalámbrico', 'Electrónica', 18.50, 70),
('Toalla de Playa',   'Accesorios',  12.00, 45);
 
-- 1.3 Actualizar el email del cliente con id_cliente = 3
UPDATE Clientes
SET email = 'nuevoemail@email.com'
WHERE id_cliente = 3;
 
-- 1.4 Eliminar el producto con id_producto = 2 (agotado)

DELETE FROM Productos
WHERE id_producto = 2;
 
-- 1.5 Seleccionar todos los pedidos del último mes
SELECT *
FROM Pedidos
WHERE fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
 
 
-- =====================================================================
-- 2. USO DE GROUP BY, WHERE Y HAVING
-- =====================================================================
 
-- 2.1 Número total de pedidos por cliente (de mayor a menor)
SELECT c.id_cliente, c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_pedidos DESC;
 
-- 2.2 Cantidad total de productos vendidos por categoría
SELECT pr.categoria, SUM(dp.cantidad) AS total_vendido
FROM DetallePedidos dp
JOIN Productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.categoria;
 
-- 2.3 Categorías que hayan vendido más de 100 productos
SELECT pr.categoria, SUM(dp.cantidad) AS total_vendido
FROM DetallePedidos dp
JOIN Productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.categoria
HAVING SUM(dp.cantidad) > 100;
 
-- 2.4 Clientes que hayan realizado más de 3 pedidos
SELECT c.id_cliente, c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(p.id_pedido) > 3;
 
 
-- =====================================================================
-- 3. USO DE JOINS Y UNIÓN DE TABLAS
-- =====================================================================
 
-- 3.1 Nombre de cada cliente y los productos que ha comprado
SELECT DISTINCT c.nombre AS cliente, pr.nombre_producto AS producto
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
JOIN DetallePedidos dp ON p.id_pedido = dp.id_pedido
JOIN Productos pr ON dp.id_producto = pr.id_producto
ORDER BY c.nombre;
 
-- 3.2 Clientes que no han realizado pedidos (LEFT JOIN)
SELECT c.id_cliente, c.nombre
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;
 
-- 3.3 Total gastado por cada cliente
SELECT c.id_cliente, c.nombre, SUM(p.total) AS total_gastado
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre;
 
-- 3.4 Lista de todos los clientes y productos (UNION ALL)
SELECT nombre AS nombre_general, 'Cliente' AS tipo
FROM Clientes
UNION ALL
SELECT nombre_producto AS nombre_general, 'Producto' AS tipo
FROM Productos;
 
-- 3.5 Clientes que han comprado y clientes que no han comprado (UNION)
SELECT DISTINCT c.id_cliente, c.nombre, 'Ha comprado' AS estado
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
 
UNION
 
SELECT c.id_cliente, c.nombre, 'No ha comprado' AS estado
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;