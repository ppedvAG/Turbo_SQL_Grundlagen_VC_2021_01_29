-- ***************************** SELECT STATEMENTS ***************************************
-- immer überprüfen, welche Datenbank verwendet wird!

USE Northwind;
GO


-- Datenbankdiagramm für Übersicht über Tabellen
-- Object Explorer -> Databases -> DB Name -> Database Diagrams--



-- Wildcard * (alles auswählen)
-- * sollte in der Realität NICHT verwendet werden. Auch, wenn die gesamte Tabelle ausgegeben werden soll, sollten stattdessen die Spaltennamen angegeben werden.


-- wählt alle Spalten aus (für Übungen oder um schnell etwas zu testen - ansonsten Spalten angeben!)
SELECT *
FROM Customers


-- wählt die Spalte "CompanyName" aus der Customers Tabelle aus
SELECT CompanyName
FROM Customers


-- wählt mehrere Spalten aus:
SELECT	  CompanyName
		, ContactName
		, Phone
FROM Customers


-- wegen Leserlichkeit besser nicht alles nebeneinander schreiben:
SELECT	  CustomerID, CompanyName, ContactName, Phone 
FROM Customers

-- besser so:
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone 
FROM Customers



-- ************************************** ALIAS vergeben **************************************
SELECT	  CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers

-- AS darf weggelassen werden, empfiehlt sich aber zwecks besserer Lesbarkeit



-- **************************** SIMPLE SELECT *************************************************

-- Zahlen ausgeben:
SELECT 100

-- Text ausgeben:
SELECT 'Testtext'

-- Berechnungen möglich:
SELECT 100*3

-- ALIAS für Dinge, die berechnet werden, weil diese keine eigene Spaltenüberschrift haben:
SELECT Freight*3 AS dreifacheFrachtkosten
FROM Orders

-- keine Leerzeichen in Namen! (Egal ob Spalten-, Tabellenname oder Spaltenüberschrift bei der Textausgabe)
-- CamelCase oder Unterstrich verwenden
SELECT Freight*3 AS dreifache_Frachtkosten
FROM Orders

-- wenn unbedingt Leerzeichen vorkommen soll, dann in eckige Klammern schreiben:
SELECT Freight*3 AS [dreifache Frachtkosten]
FROM Orders


-- MwSt Bsp.:
SELECT Freight*0.19 AS Bruttofrachtkosten
FROM Orders


-- FORMAT?
SELECT 100, 
		'Testtext', 
		'mehr Text', -- in der letzten Zeile darf kein Komma stehen; Problem, wenn auskommentiert wird:
		--'Info'


-- Fehlermeldung, wegen Kommas oben:
SELECT    100
		, 'Testtext'
		, 'mehr Text'
		--, 'Info'
-- bisschen schöner so, dann kann alles auskommentiert werden und funktioniert trotzdem.

