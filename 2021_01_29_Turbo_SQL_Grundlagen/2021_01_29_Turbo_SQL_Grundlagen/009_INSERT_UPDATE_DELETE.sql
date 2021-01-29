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
-- VORSICHT: DROP l�scht die ganze Tabelle inklusive Inhalt!!!


-- nicht so sch�n:
INSERT INTO Produkte
VALUES (1, 'Spaghetti', 1.99)


-- Fehlermeldung:
INSERT INTO Produkte
VALUES (1.99, 'Spaghetti')


-- besser:
INSERT INTO Produkte (ProduktID, ProduktName, Preis)
VALUES (1, 'Spaghetti', 1.99)


-- wenn wir eine ID automatisch generieren lassen (hier mit IDENTITY), lassen wir die Spalte beim Einf�gen aus:
INSERT INTO Produkte (Preis, ProduktName)
VALUES (1.99, 'Spaghetti')



-- mehrere Datens�tze auf einmal �bergeben:
INSERT INTO Produkte (Preis, ProduktName)
VALUES	  (1.99, 'Spaghetti')
		, (4.99, 'Profiterols')
		, (5.99, 'Tiramisu')
		, (5.89, 'Pizza Margherita')
		, (6.99, 'Pizza Tonno')
		, (3.99, 'Limoncello')



-- Werte ver�ndern mit UPDATE
-- IMMER mit WHERE einschr�nken
-- sonst gilt der Preis f�r alle Produkte!
UPDATE Produkte
SET Preis = 5.79
WHERE ProduktID = 6


-- DROP l�scht komplette Tabelle

-- DELETE FROM ... Eintr�ge rausl�schen
-- wieder mit WHERE einschr�nken!
-- sonst ist zwar die Tabelle noch da, aber der komplette Inhalt ist weg

DELETE FROM Produkte
WHERE ProduktID = 3



DELETE FROM Produkte
WHERE ProduktID IN(4, 5)


SELECT *
FROM Produkte

