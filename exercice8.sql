CREATE TABLE Disponibilite (
    id_disponibilite SERIAL PRIMARY KEY,
    id_materiel VARCHAR(10) REFERENCES Materiel(Id_Materiel) ON DELETE CASCADE,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);
ALTER TABLE Reservations
ADD COLUMN id_disponibilite INT REFERENCES Disponibilite(id_disponibilite);


SELECT 
    CASE 
        WHEN '2025-06-10' >= d.date_debut 
             AND '2025-06-15' <= d.date_fin 
        THEN 'Disponible'
        ELSE 'Indisponible'
    END AS statut_disponibilite
FROM Disponibilite d
WHERE id_materiel = 'M002';

INSERT INTO Disponibilite (id_materiel, date_debut, date_fin)
VALUES ('M002', '2025-06-01', '2025-06-30');

UPDATE Disponibilite
SET date_fin = '2025-07-05'
WHERE id_disponibilite = 1;
