-- Cette requête met à jour la quantité disponible d’un matériel spécifique.
-- Ici, on remplace directement la quantité du matériel ayant l’identifiant 2 par 15.
-- Ce type d’instruction peut être utilisé par un administrateur pour corriger une erreur manuelle ou enregistrer une nouvelle livraison.
UPDATE materiel
SET quantite_disponible = 15
WHERE id_materiel = 2;

-- Cette requête met à jour la quantité disponible pour tous les matériels actuellement empruntés
-- dont la date de retour est prévue dans plus de 2 jours à partir d'aujourd’hui.
-- On décrémente la quantité disponible de 1 pour chaque matériel concerné.
-- La clause FROM avec jointure permet de croiser les informations entre materiel et reservations.
-- Ce traitement peut servir à simuler une réservation en cours en ajustant automatiquement le stock.
UPDATE materiel
SET quantite_disponible = quantite_disponible - 1
FROM reservations
WHERE materiel.id_materiel = reservations.id_materiel
AND CURRENT_DATE >= reservations.date_debut
AND CURRENT_DATE <= reservations.date_fin
AND reservations.date_fin > CURRENT_DATE + INTERVAL '2 days';
