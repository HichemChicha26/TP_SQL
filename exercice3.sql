-- Cette requête permet d’afficher la liste des utilisateurs
-- ayant effectué au moins une réservation.
-- Elle utilise une jointure interne (JOIN) entre les tables Utilisateurs et Reservations,
-- basée sur l'identifiant utilisateur (Id_Utilisateurs).
-- On récupère pour chaque utilisateur : son nom, prénom, ainsi que les dates et identifiants des réservations associées.
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


-- Cette requête permet de récupérer les informations complètes sur les matériels empruntés
-- en combinant les tables Reservations, Utilisateurs et Materiel.
-- On relie :
-- 1. La table Reservations à la table Utilisateurs via Id_Utilisateurs
-- 2. La table Reservations à la table Materiel via Id_Materiel
-- Le résultat donne pour chaque réservation : l'identité de l'utilisateur,
-- le matériel emprunté, la quantité disponible, et les dates de réservation.
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

    