/*
  # Add intent_score_at_creation to discount_offers

  1. Modified Tables
    - `discount_offers`
      - `intent_score_at_creation` (integer, nullable) — records the agency intent score
        at the moment the discount offer was created, enabling audit trail and analytics

  2. Notes
    - Existing rows remain unchanged (column is nullable, no backfill needed)
    - New offers created via Smartlead export or admin panel will populate this field
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'discount_offers' AND column_name = 'intent_score_at_creation'
  ) THEN
    ALTER TABLE discount_offers ADD COLUMN intent_score_at_creation integer;
  END IF;
END $$;
