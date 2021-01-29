-- Informationen aus mehreren Tabellen abfragen: JOINS

-- INNER JOIN

-- LEFT JOIN
				-- OUTER JOINS
-- RIGHT JOIN



/*
Syntax für das Joinen von mehreren Tabellen

SELECT Spalte, Spalte,...
FROM
	tab1 INNER JOIN tab2 ON tab1.spalteX = tab2.spalteX
		 INNER JOIN tab3 ON tab3.spalteY = tab2.spalteY (oder tab1.spalteY - womit verkn?pft werden soll)
		 ...
		 ...
WHERE Bedingung
ORDER BY Spalte

*/

USE Northwind;

-- INNER JOIN 

SELECT *
FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID


-- wenn ein Spaltenname in mehreren Tabellen vorkommt, muss man festlegen, welchen genau man will:
SELECT	  OrderID
		, Customers.CustomerID -- in diesem Fall egal, es könnte auch Orders.CustomerID hier stehen
		, CompanyName
		, ShippedDate
FROM Orders INNER JOIN Customers
	ON Orders.CustomerID = Customers.CustomerID


-- bisschen kürzere Schreibweise:
SELECT	  o.OrderID AS Bestellnr
		, o.CustomerID
		, c.CompanyName
		, c.ContactName
		, c.Phone
FROM Orders AS o INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID


-- noch ein bisschen kürzer (ohne AS):
SELECT	  o.OrderID AS Bestellnr
		, o.CustomerID
		, c.CompanyName
		, c.ContactName
		, c.Phone
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID




-- auch hier können wir natürlich mit WHERE einschränken
SELECT	  OrderID
		, Customers.CustomerID
		, CompanyName
		, Freight
		, ShipCountry
FROM Orders INNER JOIN Customers
		ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'UK'

-- kürzere Schreibweise:
SELECT	  OrderID
		, c.CustomerID
		, CompanyName
		, Freight
		, ShipCountry
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
WHERE Country = 'UK'


-- ich DARF, muss aber nicht, bei allen angeben, aus welcher Tabelle sie kommen
-- wenn Name in mehreren Tabellen vorkommt, also nicht eindeutig ist, MUSS ich Tabelle angeben

SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
WHERE c.Country = 'UK'


-- alle Kunden, die noch nichts bestellt haben?
-- mit RIGHT JOIN:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o RIGHT JOIN Customers c
		ON o.CustomerID = c.CustomerID 
WHERE OrderID IS NULL

-- oder LEFT JOIN:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Customers c LEFT JOIN Orders o
		ON c.CustomerID = o.CustomerID 
WHERE OrderID IS NULL


-- INNER JOIN: da stehen nur die Kunden drin, die auch etwas bestellt haben
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
-- WHERE OrderID IS NULL -- würden wir hier IS NULL abfragen, bekommen wir keine Treffer
ORDER BY c.CustomerID


-- LEFT JOIN 
-- nur die, die auch etwas bestellt haben (Reihenfolge! Was steht beim Join links, was rechts?)
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o LEFT JOIN Customers c
		ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID


-- RIGHT JOIN (hier: auch die, die noch nichts bestellt haben)
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o RIGHT JOIN Customers c
		ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID




-- alle Kunden aus den USA und aus den UK und ihre Frachtkosten
-- CustomerID, CompanyName, Country, Freight
-- geordnet nach Land

SELECT	  c.CustomerID
		, CompanyName
		, Country
		, Freight
FROM Customers c INNER JOIN Orders o
		ON c.CustomerID = o.CustomerID
WHERE Country = 'UK' OR Country = 'USA'
ORDER BY Country, c.CustomerID -- mehrere möglich; aufsteigend/absteigend unterschiedlich möglich



-- Bestellnummer, Employee Name, CompanyName
SELECT	  OrderID
		, LastName
		, c.CustomerID
		, CompanyName
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
			  INNER JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE e.EmployeeID IN(3, 4, 7)



-- die Kunden, die noch nichts bestellt haben:
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
		, c.ContactName
		, c.Phone
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.CustomerID



/*
	Reihenfolge, in der wir schreiben:

	SELECT
	FROM
	WHERE
	GROUP BY
	ORDER BY

	Ausgeführt wird in einer anderen Reihenfolge:
	FROM > WHERE > GROUP BY > SELECT > ORDER BY

*/



-- JOINS mit mehr als 2 Tabellen:
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
		, c.ContactName
		, c.Phone
		, od.Quantity
		, od.ProductID
		, p.ProductName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
					INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
						INNER JOIN Products p ON od.ProductID = p.ProductID

