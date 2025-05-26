SELECT DISTINCT 
    u.Id_Utilisateurs,
    u.Nom,
    u.Prenom
FROM 
    Utilisateurs u
JOIN 
    Reservations r ON u.Id_Utilisateurs = r.Id_Utilisateurs;

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