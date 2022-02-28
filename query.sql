-- a. Mostrar todos los libros que posean menos de 300 páginas.
SELECT titulo, paginas FROM libro WHERE paginas < 300;

-- b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
SELECT nombre, apellido FROM autor WHERE nacimiento > 1970;

-- c. ¿Cuál es el libro más solicitado? (Como hay un empate no se ocupo LIMIT 1)
SELECT libro.titulo, COUNT(prestamo.isbn_prestamo) AS cantidad FROM prestamo INNER JOIN libro ON libro.isbn = prestamo.isbn_prestamo GROUP BY libro.titulo ORDER BY cantidad DESC;

-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- debería pagar cada usuario que entregue el préstamo después de 7 días.
SELECT socio.nombre, socio.apellido, ((fecha_devolucion - fecha_inicio) - 7) AS atraso, (((fecha_devolucion - fecha_inicio) - 7) * 100) AS multa FROM prestamo INNER JOIN socio ON socio.rut = prestamo.rut_prestamo WHERE ((fecha_devolucion - fecha_inicio) - 7) > 0 ORDER BY multa DESC;