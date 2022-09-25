SELECT 
	*
FROM 
	`Cliente`;


SELECT 
	*
FROM 
	`Cliente`
WHERE
	`idCliente Tipo`='1';


SELECT 
	*
FROM 
	Cliente, 
	`Cliente Endereço` 
WHERE 
	`idCliente Endereço`=idCliente;

SELECT 
	* 
FROM 
	Cliente,
	`Cliente Endereço` 
WHERE 
	`idCliente Endereço`=idCliente 
ORDER BY 
	Nome 
DESC;

SELECT 
	COUNT(*) AS total, 
	`idCliente Tipo` 
FROM 
	`Cliente` 
GROUP BY 
	`idCliente Tipo` 
HAVING 
	total > 1;

SELECT 
	a.Nome,
	c.Tipo,
	b.CEP,
	b.Número,
	d.Tipo AS "Tipo Endereço"
FROM 
	Cliente AS a
INNER JOIN
	`Cliente Endereço` AS b
ON
	b.`idCliente Endereço`=a.idCliente 
INNER JOIN
	`Cliente Tipo` AS c
ON
	c.`idCliente Tipo`=a.`idCliente Tipo`
LEFT JOIN
	`Tipo Endereço` AS d
ON
	d.`idTipo Endereço`=b.`idCliente Endereço`
ORDER BY 
	a.Nome 
DESC;