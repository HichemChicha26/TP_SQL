-- Cette requête supprime une réservation précise identifiée par son identifiant (id_reservation = 2).
-- Utile pour annuler une réservation manuellement (par exemple, si l'utilisateur se désiste).
DELETE FROM reservations
WHERE id_reservation = 2;

-- Cette requête supprime toutes les réservations terminées, c’est-à-dire
-- celles dont la date de fin est antérieure à la date actuelle.
-- Cela permet de nettoyer régulièrement la table des réservations expirées si elles ne sont plus utiles.
DELETE FROM reservations
WHERE date_fin < CURRENT_DATE;

