/* 
Min övning över databas SQL, bygger en databas för en klädbutik
*/

CREATE DATABASE Kladbutik; -- Skapar en databas
USE Kladbutik; 

-- Kundtabell
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Registreringsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Produkttabell
CREATE TABLE Produkter (
	ProduktID INT AUTO_INCREMENT PRIMARY KEY,
	Namn VARCHAR(100) NOT NULL,
	Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0),
	Kategori VARCHAR(100) NOT NULL
);

-- Skapa Beställningar-tabellen
CREATE TABLE Bestallningar (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
    );
    
    -- Skapa Orderrader-tabellen
CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProduktID INT NOT NULL,
    Antal INT NOT NULL CHECK (Antal > 0),
    Pris DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Bestallningar(OrderID),
    FOREIGN KEY (ProduktID) REFERENCES Produkter(ProduktID)
);

-- Testa och kolla undertiden som vi bygger
SHOW TABLES;
DESCRIBE Kunder;
DESCRIBE Produkter;
DESCRIBE Bestallningar;
DESCRIBE Orderrader;

-- Inforga lite data i Kunder
INSERT INTO kunder (Namn, Email) VALUES
	('Anna Andersson', 'anna@email.com'),
	('Erik Svensson', 'erik@email.com'),
	('Lisa Berg', 'lisa@email.com');
    
SELECT * FROM Kunder;
SELECT Namn, Email FROM Kunder;

INSERT INTO Produkter (Namn, Pris, Kategori) VALUES
	('T-shirt', 199.99, 'Kläder'),
	('Jeans', 499.99, 'Kläder'),
	('Sneakers', 899.99, 'Skor');

SELECT * FROM Produkter;

SELECT * FROM Kunder WHERE Namn = 'Anna Andersson';
SELECT * FROM Produkter WHERE Pris >= 500;

SELECT * FROM Produkter ORDER BY Pris ASC;

-- uppdatera data
DESCRIBE Kunder;
SELECT * FROM Kunder ORDER BY Registreringsdatum DESC;

SELECT * FROM Kunder;
UPDATE Kunder SET Email = 'Anna.new@mail.com' WHERE KundID = '1';

UPDATE Kunder SET Email = 'Anna.new@mail.com' WHERE Namn = 'Anna Andersson';

SET SQL_SAFE_UPDATES = 1;

-- Tar bort kund id 2
DELETE FROM kunder WHERE KundID = 2;

START TRANSACTION; -- Start av transaktion

UPDATE kunder SET Email = 'anna.ny@mail.com' WHERE kundID = 1;
SELECT * FROM kunder WHERE kundID = 1;

COMMIT;