-- Cette requête extrait les utilisateurs ayant effectué au moins une réservation.
-- On utilise DISTINCT pour ne pas afficher deux fois le même utilisateur s’il a plusieurs réservations.
SELECT DISTINCT 
    u.Id_Utilisateurs,
    u.Nom,
    u.Prenom
FROM 
    Utilisateurs u
JOIN 
    Reservations r ON u.Id_Utilisateurs = r.Id_Utilisateurs;


-- Cette requête utilise LEFT JOIN pour récupérer tous les matériels,
-- même ceux qui n’ont pas de correspondance dans la table des réservations.
-- Le filtre WHERE r.Id_Reservation IS NULL permet de ne garder que ceux
-- qui ne sont associés à aucune réservation.
SELECT 
    m.Id_Materiel,
    m.nom_materiel
FROM 
    Materiel m
LEFT JOIN 
    Reservations r ON m.Id_Materiel = r.Id_Materiel
WHERE 
    r.Id_Reservation IS NULL;

SELECT 
    m.Id_Materiel,
    m.nom_materiel
FROM 
    Materiel m
LEFT JOIN 
    Reservations r ON m.Id_Materiel = r.Id_Materiel
WHERE 
    r.Id_Reservation IS NULL;