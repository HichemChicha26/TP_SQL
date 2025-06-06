-- Insertion de 10 lignes dans la table Materiel.
-- Chaque matériel est identifié par un Id_Materiel unique (ex. 'M001').
-- On précise également le nom du matériel et la quantité disponible.
INSERT INTO Materiel (Id_Materiel, nom_materiel, Quantite) VALUES
('M001', 'Projecteur HD', '3'),
('M002', 'Ordinateur portable', '5'),
('M003', 'Tablette iPad', '4'),
('M004', 'Câble HDMI', '10'),
('M005', 'Souris sans fil', '8'),
('M006', 'Clavier mécanique', '6'),
('M007', 'Appareil photo', '2'),
('M008', 'Microphone Blue Yeti', '4'),
('M009', 'Casque audio', '3'),
('M010', 'Imprimante 3D', '1');


-- Insertion de 5 réservations effectuées par différents utilisateurs.
-- Chaque réservation comporte : un identifiant, une date de début, une date de fin,
-- un identifiant utilisateur et un identifiant du matériel réservé.
INSERT INTO Reservations (Id_Reservation, date_début, date_fin, Id_Utilisateurs, Id_Materiel) VALUES
(1, '2025-05-01', '2025-05-05', 1, 'M002'),
(2, '2025-05-03', '2025-05-04', 2, 'M001'),
(3, '2025-05-06', '2025-05-10', 3, 'M003'),
(4, '2025-05-04', '2025-05-06', 4, 'M004'),
(5, '2025-05-02', '2025-05-07', 5, 'M005');


-- Insertion de 10 utilisateurs dans la table Utilisateurs.
-- Chaque utilisateur est identifié par un Id_Utilisateurs unique.
-- Les champs insérés sont : nom, prénom et adresse email.
INSERT INTO Utilisateurs (Id_Utilisateurs, Nom, Prenom, email) VALUES
(1, 'Durand', 'Alice', 'alice.durand@example.com'),
(2, 'Martin', 'Bob', 'bob.martin@example.com'),
(3, 'Lemoine', 'Carla', 'carla.lemoine@example.com'),
(4, 'Nguyen', 'David', 'david.nguyen@example.com'),
(5, 'Petit', 'Eva', 'eva.petit@example.com'),
(6, 'Dupont', 'Franck', 'franck.dupont@example.com'),
(7, 'Moreau', 'Gina', 'gina.moreau@example.com'),
(8, 'Garcia', 'Hugo', 'hugo.garcia@example.com'),
(9, 'Roux', 'Ismaël', 'ismael.roux@example.com'),
(10, 'Leclerc', 'Julie', 'julie.leclerc@example.com');


-- Vérification de l’insertion des utilisateurs
SELECT * FROM Utilisateurs;

-- Vérification de l’insertion du matériel
SELECT * FROM Materiel;

-- Vérification de l’insertion des réservations
SELECT * FROM Reservations;
