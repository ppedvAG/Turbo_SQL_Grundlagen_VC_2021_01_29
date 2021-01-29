-- INSERT, UPDATE, DELETE


CREATE DATABASE Turbo

USE Turbo


CREATE TABLE Produkte
					(
						ProduktID int identity(1, 1), -- default (1, 1); macht auch NOT NULL und UNIQUE
						ProduktName nvarchar(50), 
						Preis money
						-- ....
					)


-- DROP TABLE Produkte
-- VORSICHT: DROP löscht die ganze Tabelle inklusive Inhalt!!!


-- nicht so schön:
INSERT INTO Produkte
VALUES (1, 'Spaghetti', 1.99)


-- Fehlermeldung:
INSERT INTO Produkte
VALUES (1.99, 'Spaghetti')


-- besser:
INSERT INTO Produkte (ProduktID, ProduktName, Preis)
VALUES (1, 'Spaghetti', 1.99)


-- wenn wir eine ID automatisch generieren lassen (hier mit IDENTITY), lassen wir die Spalte beim Einfügen aus:
INSERT INTO Produkte (Preis, ProduktName)
VALUES (1.99, 'Spaghetti')



-- mehrere Datensätze auf einmal übergeben:
INSERT INTO Produkte (Preis, ProduktName)
VALUES	  (1.99, 'Spaghetti')
		, (4.99, 'Profiterols')
		, (5.99, 'Tiramisu')
		, (5.89, 'Pizza Margherita')
		, (6.99, 'Pizza Tonno')
		, (3.99, 'Limoncello')



-- Werte verändern mit UPDATE
-- IMMER mit WHERE einschränken
-- sonst gilt der Preis für alle Produkte!
UPDATE Produkte
SET Preis = 5.79
WHERE ProduktID = 6


-- DROP löscht komplette Tabelle

-- DELETE FROM ... Einträge rauslöschen
-- wieder mit WHERE einschränken!
-- sonst ist zwar die Tabelle noch da, aber der komplette Inhalt ist weg

DELETE FROM Produkte
WHERE ProduktID = 3



DELETE FROM Produkte
WHERE ProduktID IN(4, 5)


SELECT *
FROM Produkte

