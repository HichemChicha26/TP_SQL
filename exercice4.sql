SELECT 
    COUNT(*) AS total_reservations
FROM 
    Reservations
WHERE 
    date_début >= '2025-05-01' 
    AND date_fin <= '2025-05-05';

-- 🔹 Requête 2 : Nombre d'utilisateurs ayant emprunté du matériel
-- On utilise COUNT DISTINCT pour éviter de compter plusieurs fois le même utilisateur

SELECT 
    COUNT(DISTINCT Id_Utilisateurs) AS nombre_utilisateurs_ayant_emprunté
FROM 
    Reservations;