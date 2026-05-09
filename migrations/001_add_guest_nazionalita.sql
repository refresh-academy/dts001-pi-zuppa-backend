SET search_path TO piuzuppa;

ALTER TABLE guests
ADD COLUMN IF NOT EXISTS nazionalita VARCHAR(100);

UPDATE guests
SET nazionalita = 'Non specificata'
WHERE nazionalita IS NULL OR trim(nazionalita) = '';

ALTER TABLE guests
ALTER COLUMN nazionalita SET NOT NULL;
