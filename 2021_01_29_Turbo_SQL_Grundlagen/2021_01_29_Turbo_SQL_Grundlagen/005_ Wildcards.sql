-- WILDCARDS beim LIKE

-- % steht für beliebig viele unbekannte Zeichen (0 - ?)

-- Wertebereiche []
-- steht für genau 1 Zeichen in einem bestimmten Bereich
-- funktioniert auch mit Sonderzeichen
-- funktioniert für 'von-bis' [a-c]


--	_ beim LIKE - genau 1 unbekanntes Zeichen


-- *************************************** % ************************************************
-- alle Kunden, deren KundenID mit 'ALF' beginnt

USE Northwind;

SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALF%'

-- alle Kunden, deren KundenID mit 'MI' endet
SELECT *
FROM Customers
WHERE CustomerID LIKE '%MI'

-- alle Kunden, die IRGENDWO im Namen 'kist' haben
SELECT *
FROM Customers
WHERE CompanyName LIKE '%kist%'


-- alle, deren Firmenname mit D beginnt
SELECT *
FROM Customers
WHERE CompanyName LIKE 'D%'

-- alle, die mit D enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%D'

-- alle, die ein D enthalten
SELECT *
FROM Customers
WHERE CompanyName LIKE '%D%'


-- *************************************** [] ***********************************************
-- alle, die mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'

-- alle, die mit a oder c beginnen
-- entweder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'
	OR CompanyName LIKE 'c%'
-- oder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%'


-- alle Produkte, die mit M, N oder S beginnen?
SELECT *
FROM Products
WHERE ProductName LIKE '[mns]%'

-- order by:
SELECT *
FROM Products
WHERE ProductName LIKE '[mns]%'
ORDER BY ProductName


-- *************************************** _ ************************************************
-- wie bekommt man eine Ausgabe mit einem unbekannten Zeichen:
-- vorletztes Zeichen unbekannt:
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47[0-9]9'
-- oder:
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47_9' -- _ (Unterstrich) steht für genau 1 unbekanntes Zeichen


-- für die Profis:

-- alle Kunden, die mit d, e oder f beginnen, der letzte Buchstabe ist ein l und der drittletzte ein d

SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%d_l'


/*
	mögliche Ergebnisse z.B.

	ddxl
	edel
	fxxxxxxxxxdxl

	Ernst Handel (in Northwind DB Customers)
	E........d.l

*/
