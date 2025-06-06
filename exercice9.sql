-- Création d'une table permettant de suivre les retours de matériel associés à chaque réservation.
-- Chaque retour est identifié par un id unique (id_retour).
-- La clé étrangère `id_reservation` fait le lien avec la réservation concernée.
-- La colonne `retard` permet d’indiquer si le retour a été effectué en retard.
CREATE TABLE RetourMateriel (
    id_retour SERIAL PRIMARY KEY,
    id_reservation INT REFERENCES Reservations(Id_Reservation) ON DELETE CASCADE,
    date_retour DATE NOT NULL,
    retard BOOLEAN
);


-- Mise à jour de la colonne `date_retour_effectif` dans la table Reservations
-- en récupérant la `date_retour` de la table RetourMateriel pour chaque réservation correspondante.
-- Cela permet de synchroniser les données entre les deux tables.
UPDATE Reservations r
SET date_retour_effectif = rm.date_retour
FROM RetourMateriel rm
WHERE r.Id_Reservation = rm.id_reservation;

-- Ajout d'une colonne pour stocker le montant des pénalités en cas de retour tardif.
-- Le type NUMERIC(6,2) permet d’avoir des montants précis jusqu’à 9999.99 euros.
ALTER TABLE RetourMateriel
ADD COLUMN penalite NUMERIC(6,2); 

-- Cette requête calcule la pénalité financière pour chaque retour.
-- La pénalité est fixée à 2€ par jour de retard.
-- On utilise la fonction GREATEST pour éviter les valeurs négatives si le retour est à l’heure.
UPDATE RetourMateriel rm
SET penalite = GREATEST(0, rm.date_retour - r.date_fin) * 2
FROM Reservations r
WHERE rm.id_reservation = r.Id_Reservation;

