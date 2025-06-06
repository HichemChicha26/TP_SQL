-- Création de la table Disponibilite, avec une clé primaire unique auto-incrémentée (SERIAL).
-- La colonne id_materiel est une clé étrangère qui fait référence à la table Materiel.
-- L’option ON DELETE CASCADE permet de supprimer automatiquement les disponibilités associées
-- si un matériel est supprimé.
CREATE TABLE Disponibilite (
    id_disponibilite SERIAL PRIMARY KEY,
    id_materiel VARCHAR(10) REFERENCES Materiel(Id_Materiel) ON DELETE CASCADE,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

-- On ajoute une clé étrangère à la table Reservations pour lier chaque réservation à une disponibilité précise.
ALTER TABLE Reservations
ADD COLUMN id_disponibilite INT REFERENCES Disponibilite(id_disponibilite);


-- Cette requête retourne "Disponible" si l’intervalle de date spécifié (10 au 15 juin)
-- est entièrement inclus dans une plage de disponibilité existante pour le matériel M002.
-- Sinon, elle renvoie "Indisponible".
SELECT 
    CASE 
        WHEN '2025-06-10' >= d.date_debut 
             AND '2025-06-15' <= d.date_fin 
        THEN 'Disponible'
        ELSE 'Indisponible'
    END AS statut_disponibilite
FROM Disponibilite d
WHERE id_materiel = 'M002';

-- Ajout d'une disponibilité pour le matériel M002 sur tout le mois de juin 2025.
INSERT INTO Disponibilite (id_materiel, date_debut, date_fin)
VALUES ('M002', '2025-06-01', '2025-06-30');


-- On étend la plage de disponibilité de l’enregistrement ayant l’id 1 jusqu’au 5 juillet 2025.
UPDATE Disponibilite
SET date_fin = '2025-07-05'
WHERE id_disponibilite = 1;

