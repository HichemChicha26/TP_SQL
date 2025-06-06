-- Cette requête permet de compter le nombre total de réservations
-- effectuées entre le 1er mai 2025 et le 5 mai 2025 inclus.
-- On utilise la fonction d’agrégation COUNT(*) combinée à une clause WHERE avec deux bornes temporelles.
SELECT 
    COUNT(*) AS total_reservations
FROM 
    Reservations
WHERE 
    date_début >= '2025-05-01' 
    AND date_fin <= '2025-05-05';


-- Cette requête permet de connaître le nombre d'utilisateurs différents
-- ayant effectué au moins une réservation de matériel.
-- La fonction COUNT DISTINCT est utilisée pour éviter de compter plusieurs fois
-- un même utilisateur s’il a fait plusieurs réservations.
SELECT 
    COUNT(DISTINCT Id_Utilisateurs) AS nombre_utilisateurs_ayant_emprunté
FROM 
    Reservations;
