-- Requête SQL permettant de sélectionner tous les utilisateurs
-- dont le prénom commence par la lettre 'J'.
-- Utilisation de l'opérateur LIKE avec le caractère joker '%' pour faire une recherche par motif.
SELECT *
FROM utilisateurs
WHERE prenom LIKE 'J%';

 
-- Requête SQL permettant de récupérer tous les matériels
-- dont la quantité disponible est inférieure ou égale à 3.
-- Cette requête peut être utile pour détecter les équipements à renouveler.
SELECT *
FROM Materiel
WHERE quantite_disponible <= 3;

 
-- Requête SQL sélectionnant toutes les réservations
-- dont la date de début est postérieure au 5 mai 2025.
-- Permet d'isoler les réservations futures dans le temps.
SELECT *
FROM Reservation
WHERE date_debut > '2025-05-05';

