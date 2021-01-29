-- DISTINCT

USE Northwind;

-- wie bekomme ich eine Liste aller L�nder, in die geliefert wird?

SELECT Country
FROM Customers

-- L�nder stehen mehrfach da, weil wir alle Kunden herausbekommen und es mehrere Kunden in einem Land gibt
-- 91 Zeilen Ergebnis, 1 Zeile pro Kunde, Germany z.B. kommt mehrfach vor

-- L�sung:
-- DISTINCT: l�sst doppelte Eintr�ge weg
SELECT DISTINCT Country
FROM Customers
-- 21 Zeilen Ergebnis - jedes Land kommt nur mehr einmal vor



SELECT DISTINCT CustomerID, Country
FROM Customers
-- bringt nix, weil dann wieder alle Kunden aus der Kundentabelle ausgegeben werden



SELECT DISTINCT Country, City
FROM Customers
-- so viele Ergebnisse wie St�dte; L�nder kommen �fter vor, weil es mehrere verschiedene St�dte in einem Land geben kann


-- Liste von allen St�dten, in denen wir auch Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen L�ndern, in denen Angestellte wohnen
SELECT DISTINCT Country
FROM Employees -- USA, UK

-- zur Kontrolle:
SELECT *
FROM Employees
-- ja tats�chlich, unsere Angestellten sind nur in den USA und den UK (Northwind DB)


-- Liste von allen Produkten:
SELECT DISTINCT ProductName
FROM Products