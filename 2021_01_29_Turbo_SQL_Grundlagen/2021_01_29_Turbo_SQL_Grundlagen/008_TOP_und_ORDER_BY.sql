-- TOP Abfragen
-- ORDER BY zwingend notwendig!


-- SYNTAX:
-- SELECT TOP # [percent] * | [Spaltenname, Spaltenname,...] FROM Tabelle [WHERE Bedingung] ORDER BY Spalte

USE Northwind;

SELECT *
FROM Customers

-- nur die erste Zeile ausgeben
SELECT TOP 1 *
FROM Customers
-- ... aber was genau ist die erste Zeile? Daher immer mit ORDER BY arbeiten, wenn man TOP verwendet!
SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID

-- was in der ersten Zeile/den ersten Zeilen steht, bestimmt ORDER BY:
SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID
-- ALFKI

-- anderes Ergebnis, weil nach anderen Kriterien geordnet:
SELECT TOP 1 *
FROM Customers
ORDER BY Country
-- CACTU

SELECT TOP 1 *
FROM Customers
ORDER BY City
-- DRACD

SELECT TOP 1 *
FROM Customers
ORDER BY Address -- möglich, macht aber keinen Sinn
-- LAMAI

-- nicht alle Spalten, sondern nur bestimmte:
SELECT TOP 1	  CustomerID
				, CompanyName
				, ContactName
				, Phone
FROM Customers
ORDER BY Country



-- mehrere ZEILEN (TOP 10):
SELECT TOP 10	  CustomerID
				, CompanyName
				, ContactName
				, Phone
FROM Customers
ORDER BY Country




-- man kann auch die TOP % abfragen:
-- PERCENT ausschreiben!
SELECT TOP 10 PERCENT *
FROM Customers
ORDER BY CustomerID


SELECT TOP 5 PERCENT 
		  CustomerID
		  , CompanyName
		  , ContactName
		  , Phone
FROM Customers
ORDER BY City


SELECT TOP 10 PERCENT *
FROM Orders
ORDER BY Freight



SELECT TOP 5 PERCENT	  CustomerID
						, CompanyName
						, Phone
FROM Customers
ORDER BY CustomerID -- ASC-- ascending (in aufsteigender Reihenfolge, vom kleinsten zum größten Wert geordnet) (default)


-- die letzten 3:
SELECT TOP 3	  CustomerID
				, CompanyName
				, Phone
FROM Customers
ORDER BY CustomerID DESC -- descending (in absteigender Reihenfolge, vom größten zum kleinsten Wert geordnet)


-- eine Möglichkeit, den niedrigsten Frachtkostenwert zu ermitteln, wäre mit TOP-Befehl:
SELECT TOP 1 Freight
FROM Orders
ORDER BY Freight
-- 0.02



-- höchster Frachtkostenwert:
SELECT TOP 1 Freight
FROM Orders
ORDER BY Freight DESC
-- 1007,64

