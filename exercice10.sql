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

