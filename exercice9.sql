CREATE TABLE RetourMateriel (
    id_retour SERIAL PRIMARY KEY,
    id_reservation INT REFERENCES Reservations(Id_Reservation) ON DELETE CASCADE,
    date_retour DATE NOT NULL,
    retard BOOLEAN
);
