🛒 Ejercicio SQL – Tienda Online

Ejercicio sobre una base de datos de tienda online con 4 tablas relacionadas (Clientes, Productos, Pedidos, DetallePedidos). Resolviendo consultas de complejidad creciente usando SELECT, INSERT, UPDATE, DELETE, GROUP BY, WHERE, HAVING, JOIN, UNION y UNION ALL.

🗂️ Esquema de la base de datos

Clientes (id_cliente, nombre, email, fecha_registro)
Productos (id_producto, nombre_producto, categoria, precio, stock)
Pedidos (id_pedido, id_cliente, fecha_pedido, total) — FK a Clientes
DetallePedidos (id_detalle, id_pedido, id_producto, cantidad, subtotal) — FK a Pedidos y Productos

Las claves foráneas usan ON DELETE CASCADE: al borrar un cliente, producto o pedido, se eliminan también sus registros.

1. Consultas básicas (SELECT, INSERT, UPDATE, DELETE)

Inserción de clientes y productos nuevos.
Actualización de email de un cliente.
Eliminación de un producto agotado.
Selección de pedidos del último mes.

2. GROUP BY, WHERE y HAVING

Número de pedidos por cliente (ordenado de mayor a menor).
Unidades vendidas por categoría de producto.
Categorías con más de 100 unidades vendidas.
Clientes con más de 3 pedidos.

3. Joins y unión de tablas

Productos comprados por cada cliente (INNER JOIN).
Clientes sin pedidos (LEFT JOIN).
Total gastado por cliente.
Listado combinado de clientes y productos (UNION ALL).
Clientes que han comprado vs. no han comprado (UNION).

📌 Conclusión

bd.sql solo crea el esquema de la base de datos (las 4 tablas), pero no incluye ningún dato. Como las consultas de GROUP BY, HAVING y JOIN no se pueden demostrar ni comprobar sobre tablas vacías, al inicio de Examen_2_SQL.sql se insertan de forma manual 20 clientes y 6 productos base (repartidos en las categorías Electrónica, Deporte y Hogar), junto con 15 pedidos y sus detalles asociados, diseñados específicamente para poder ejercitar cada consulta con un resultado significativo (por ejemplo, un cliente con más de 3 pedidos para la consulta 2.4, o una categoría que supere las 100 unidades vendidas para la consulta 2.3).

A partir de esos datos de prueba, todas las consultas del ejercicio (básicas, GROUP BY/WHERE/HAVING, y JOIN/UNION/UNION ALL) se han ejecutado y verificado sobre una base de datos MySQL/MariaDB real, devolviendo resultados correctos y coherentes con los datos insertados. Gracias al TRUNCATE inicial, puede ejecutarse varias veces sin generar duplicados ni errores de claves foráneas.
