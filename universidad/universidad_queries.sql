/* 1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1, apellido2, nombre
  FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1 ASC , apellido2 ASC , nombre ASC;

/* 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT nombre, apellido1, apellido2
  FROM persona
WHERE tipo = 'alumno'
  AND telefono is NULL;

/* 3 Retorna el llistat dels alumnes que van néixer en 1999.*/
SELECT * FROM persona
WHERE tipo = 'alumno'
  AND YEAR(fecha_nacimiento) = 1999;

/* 4 Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.*/
SELECT * FROM persona
 WHERE tipo = 'profesor' AND telefono IS NULL AND nif like '%K';

/* 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre,
en el tercer curs del grau que té l'identificador 7.*/
SELECT nombre
  FROM asignatura
 WHERE cuatrimestre = 1 AND
       curso = 3 AND
       id_grado = 7;

/* 6 Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
SELECT pe.nombre, pe.apellido1, pe.apellido2, d.nombre
  FROM profesor AS pr
INNER JOIN departamento as d
    ON pr.id_departamento = d.id
INNER JOIN persona as pe
    ON pe.id = pr.id_profesor
ORDER BY pe.apellido1, pe.apellido2, pe.nombre


/* 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.*/
SELECT p.id, a.nombre, c.anyo_inicio, c.anyo_fin
  FROM persona as p
  INNER JOIN alumno_se_matricula_asignatura as al
    ON p.id = al.id_alumno
  INNER JOIN curso_escolar as c
    ON al.id_curso_escolar = c.id
  INNER JOIN asignatura as a
    ON al.id_asignatura = a.id
 WHERE p.nif = '26902806M'


/* 8 Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
SELECT d.nombre
 FROM departamento as d
 INNER JOIN profesor as p
   ON d.id = p.id_departamento
 INNER JOIN asignatura as a
   ON a.id_profesor = p.id_profesor
 INNER JOIN grado as g
   ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY d.nombre;

/* 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona as p
INNER JOIN alumno_se_matricula_asignatura as a
  ON p.id = a.id_alumno
INNER JOIN curso_escolar as c
  ON c.id = a.id_curso_escolar
WHERE p.tipo = 'alumno' AND c.anyo_inicio = 2018 AND c.anyo_fin = 2019
GROUP BY p.nombre, p.apellido1, p.apellido2


/* 10 Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
  FROM persona AS pe
  LEFT JOIN profesor AS pr
  ON pe.id = pr.id_profesor
  LEFT JOIN departamento AS de
  ON de.id = pr.id_departamento
 ORDER BY de.nombre, pe.apellido1, pe.apellido2, pe.nombre ASC

/* 11 Retorna un llistat amb els professors que no estan associats a un departament.*/
SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
  FROM persona AS pe
  LEFT JOIN profesor AS pr
  ON pe.id = pr.id_profesor
  LEFT JOIN departamento AS de
  ON de.id = pr.id_departamento
  WHERE de.nombre is NULL

/* 12 Retorna un llistat amb els departaments que no tenen professors associats.*/
SELECT * FROM departamento as d
LEFT JOIN profesor as p
ON p.id_departamento = d.id
WHERE p.id_profesor is NULL

/* 13 Retorna un llistat amb els professors que no imparteixen cap assignatura.*/
SELECT per.id, per.nombre, per.apellido1, per.apellido2
FROM profesor as p
LEFT JOIN asignatura as a
ON a.id_profesor = p.id_profesor
LEFT JOIN persona as per
ON per.id = p.id_profesor
WHERE a.id_profesor is NULL

/* 14 Retorna un llistat amb les assignatures que no tenen un professor assignat.*/
SELECT * FROM asignatura
WHERE id_profesor is NULL

/* 15 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
SELECT d.nombre, p.id_departamento, a.nombre, al.id_curso_escolar, c.anyo_inicio, c.anyo_fin
FROM departamento as d
LEFT JOIN profesor as p
ON p.id_profesor = d.id
LEFT JOIN asignatura as a
ON a.id_profesor = p.id_profesor
LEFT JOIN alumno_se_matricula_asignatura as al
ON al.id_asignatura = a.id
LEFT JOIN curso_escolar as c
ON c.id = al.id_curso_escolar
WHERE c.id IS NULL
