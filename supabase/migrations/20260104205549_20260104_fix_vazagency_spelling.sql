/*
  # Fix Vazagency spelling in trigger

  1. Changes
    - Update enforce_rank1_vazagency() function to accept "Vazagency" (lowercase) instead of "VazAgency" (capital A)
    - This allows rank 1 to use the correct agency name spelling
*/

CREATE OR REPLACE FUNCTION enforce_rank1_vazagency()
RETURNS TRIGGER AS $$
BEGIN
  -- Ensure Vazagency always has rank 1 on every state
  IF NEW.agency_name = 'Vazagency' AND NEW.rank != 1 THEN
    RAISE EXCEPTION 'Vazagency must always have rank 1';
  END IF;

  -- Prevent any other agency from taking rank 1
  IF NEW.rank = 1 AND NEW.agency_name != 'Vazagency' THEN
    RAISE EXCEPTION 'Rank 1 is reserved for Vazagency';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
