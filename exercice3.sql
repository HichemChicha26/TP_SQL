SELECT 
    u.Id_Utilisateurs,
    u.Nom,
    u.Prenom,
    r.Id_Reservation,
    r.date_début,
    r.date_fin
FROM 
    Utilisateurs u
JOIN 
    Reservations r ON u.Id_Utilisateurs = r.Id_Utilisateurs
ORDER BY 
    u.Id_Utilisateurs;

SELECT 
    u.Id_Utilisateurs,
    u.Nom AS nom_utilisateur,
    u.Prenom AS prenom_utilisateur,
    m.Id_Materiel,
    m.nom_materiel,
    m.Quantite,
    r.date_début,
    r.date_fin
FROM 
    Reservations r
JOIN 
    Utilisateurs u ON r.Id_Utilisateurs = u.Id_Utilisateurs
JOIN 
    Materiel m ON r.Id_Materiel = m.Id_Materiel
ORDER BY 
    u.Id_Utilisateurs;    

    