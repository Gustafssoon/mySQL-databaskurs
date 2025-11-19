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