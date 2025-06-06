ALTER TABLE Materiel
ADD COLUMN description TEXT;

ALTER TABLE Disponibilite DROP CONSTRAINT IF EXISTS disponibilite_id_materiel_fkey;
ALTER TABLE Reservations DROP CONSTRAINT IF EXISTS reservations_id_utilisateurs_fkey;
ALTER TABLE Reservations DROP CONSTRAINT IF EXISTS reservations_id_materiel_fkey;
ALTER TABLE Reservations DROP CONSTRAINT IF EXISTS reservations_id_disponibilite_fkey;

-- 🔄 Réinitialisation des tables
TRUNCATE TABLE Reservations RESTART IDENTITY CASCADE;
TRUNCATE TABLE Disponibilite RESTART IDENTITY CASCADE;
TRUNCATE TABLE Materiel RESTART IDENTITY CASCADE;
TRUNCATE TABLE Utilisateurs RESTART IDENTITY CASCADE;

-- 🧪 Générer 100 000 utilisateurs
DO $$
DECLARE i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO Utilisateurs (Id_Utilisateurs, Nom, Prenom, email)
        VALUES (
            i,
            'nom_' || i,
            'prenom_' || i,
            'user_' || i || '@example.com'
        );
    END LOOP;
END $$;

-- 🧪 Générer 100 000 matériels
DO $$
DECLARE i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO Materiel (Id_Materiel, nom_materiel, description, Quantite)
        VALUES (
            'M' || LPAD(i::TEXT, 6, '0'),
            'materiel_' || i,
            'description_' || i,
            (random() * 20)::INT + 1
        );
    END LOOP;
END $$;

-- 🧪 Générer 200 000 disponibilités
DO $$
DECLARE i INT;
        start_date DATE;
        end_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        start_date := DATE '2025-01-01' + (random() * 365)::INT;
        end_date := start_date + (random() * 30)::INT;

        INSERT INTO Disponibilite (id_disponibilite, id_materiel, date_debut, date_fin)
        VALUES (
            i,
            'M' || LPAD(((random() * 99999)::INT + 1)::TEXT, 6, '0'),
            start_date,
            end_date
        );
    END LOOP;
END $$;

-- 🧪 Générer 200 000 réservations
DO $$
DECLARE 
    i INT;
    res_date DATE;
    ret_date DATE;
    eff_ret_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        res_date := DATE '2025-01-01' + (random() * 365)::INT;
        ret_date := res_date + (random() * 15)::INT;
        eff_ret_date := res_date + (random() * 15)::INT;

        INSERT INTO Reservations (Id_Reservation, date_début, date_fin, Id_Utilisateurs, Id_Materiel, date_retour_effectif)
        VALUES (
            i,
            res_date,
            ret_date,
            (random() * 99999)::INT + 1,
            'M' || LPAD(((random() * 99999)::INT + 1)::TEXT, 6, '0'),
            eff_ret_date
        );
    END LOOP;
END $$;


-- Requête pour afficher les réservations à venir à partir du 1er juin 2025
-- Jointure entre 4 tables pour restituer toutes les informations utiles
SELECT
    r.id_reservation,
    u.nom,
    u.prenom,
    m.nom_materiel,
    d.date_debut AS date_disponibilite,
    d.date_fin AS fin_disponibilite,
    r.date_debut AS date_reservation,
    r.date_fin AS fin_reservation
FROM reservations r
JOIN utilisateurs u ON u.id_etudiant = r.id_etudiant
JOIN materiel m ON m.id_materiel = r.id_materiel
JOIN disponibilites d ON d.id_disponibilite = r.id_disponibilite
WHERE r.date_debut >= '2025-06-01'
ORDER BY r.date_debut;


-- Analyse du plan pour détecter les scans séquentiels ou les problèmes de performance
EXPLAIN ANALYZE
SELECT
    r.id_reservation,
    u.nom,
    u.prenom,
    m.nom_materiel,
    d.date_debut AS date_disponibilite,
    d.date_fin AS fin_disponibilite,
    r.date_debut AS date_reservation,
    r.date_fin AS fin_reservation
FROM reservations r
JOIN utilisateurs u ON u.id_etudiant = r.id_etudiant
JOIN materiel m ON m.id_materiel = r.id_materiel
JOIN disponibilites d ON d.id_disponibilite = r.id_disponibilite
WHERE r.date_debut >= '2025-06-01'
ORDER BY r.date_debut;


-- Création d’index classiques pour accélérer les jointures
CREATE INDEX idx_reservations_id_etudiant ON reservations(id_etudiant);
CREATE INDEX idx_reservations_id_materiel ON reservations(id_materiel);
CREATE INDEX idx_reservations_id_disponibilite ON reservations(id_disponibilite);
CREATE INDEX idx_disponibilites_id_materiel ON disponibilites(id_materiel);


-- Création d’un index trigram (extension pg_trgm) pour optimiser les recherches textuelles
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX idx_utilisateurs_nom_trgm
ON utilisateurs USING gin (nom gin_trgm_ops);

-- Test de recherche floue optimisée
EXPLAIN ANALYZE
SELECT *
FROM utilisateurs
WHERE nom LIKE '%nt%';


