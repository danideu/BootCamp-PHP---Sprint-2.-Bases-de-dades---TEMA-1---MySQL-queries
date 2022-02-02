/*
Base de datos

PRODUCTO
  - codigo
  - nombre
  - precio
  - codigo_fabricante

FABRICANTE
  - codigo
  - nombre
*/

-- 1 Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;

-- 2 Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;

-- 3 Llista totes les columnes de la taula producto.
SELECT * FROM producto;

-- 4 Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, precio, (precio*1.3) FROM producto;

-- 5 Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans.
--Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans.
SELECT nombre AS 'Nom de producto', precio AS 'euros', (precio*1.3) AS 'dòlars nord-americans' FROM producto;

-- 6 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;

-- 7 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;

-- 8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;

-- 9 Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio,2) FROM producto;

-- 10 Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio,0) FROM producto;

-- 11 Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante
FROM producto


-- 12 Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante
FROM producto


-- 13 Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14 Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15 Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16 Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3,2;

-- 18 Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;


-- 19 Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20 Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.codigo = 2;

-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;


-- 22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
--Ordeni el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;


-- 23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;

-- 24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 26 Retorna una llista de tots els productes del fabricant Lenovo.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';


-- 29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');


-- 30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.nombre, p.precio
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');


-- 31 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';


-- 32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€.
--Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT p.nombre, p.precio, f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;


-- 33 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT f.codigo, f.nombre
FROM fabricante as f
INNER JOIN producto as p
ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells.
--El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT f.nombre, p.nombre
FROM fabricante as f
LEFT JOIN producto as p
ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre,p.nombre;

-- 35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT f.nombre, p.nombre
FROM fabricante as f
LEFT JOIN producto as p
ON f.codigo = p.codigo_fabricante
WHERE p.nombre is NULL
GROUP BY f.nombre, p.nombre;

-- 36 Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT *
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT *
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto
					  WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));


-- 38 Llista el nom del producte més car del fabricant Lenovo.
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1;

-- 39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Hewlett-Packard'
ORDER BY p.precio
LIMIT 1;

-- 40 Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante
WHERE p.precio >= (SELECT MAX(precio) FROM producto
					  WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41 Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT *
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Asus'
   AND p.precio > (SELECT AVG(precio) FROM producto
					  WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));
