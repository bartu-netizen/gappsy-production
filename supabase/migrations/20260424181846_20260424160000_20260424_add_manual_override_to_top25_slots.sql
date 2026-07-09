/*
  # Add manual_override to top25_slots

  1. Changes
    - Adds `manual_override boolean default false` column on `top25_slots`.
    - Used by /wp-admin/top25-editor to mark manually-assigned Top25 placements
      so the Check Availability flow treats them like paid listings
      (self-recommend instead of routing to Vazagency).

  2. Safety
    - IF NOT EXISTS guard, no destructive operations.
    - Default false; does not affect seeded placeholders or existing rows.
    - Does not change RLS.
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'manual_override'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN manual_override boolean NOT NULL DEFAULT false;
  END IF;
END $$;
