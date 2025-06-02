CREATE TABLE RetourMateriel (
    id_retour SERIAL PRIMARY KEY,
    id_reservation INT REFERENCES Reservations(Id_Reservation) ON DELETE CASCADE,
    date_retour DATE NOT NULL,
    retard BOOLEAN
);

UPDATE Reservations r
SET date_retour_effectif = rm.date_retour
FROM RetourMateriel rm
WHERE r.Id_Reservation = rm.id_reservation;

ALTER TABLE RetourMateriel
ADD COLUMN penalite NUMERIC(6,2); 


UPDATE RetourMateriel rm
SET penalite = GREATEST(0, rm.date_retour - r.date_fin) * 2
FROM Reservations r
WHERE rm.id_reservation = r.Id_Reservation;
