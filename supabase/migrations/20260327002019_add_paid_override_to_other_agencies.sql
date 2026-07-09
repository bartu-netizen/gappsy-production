/*
  # Add Paid Override Fields to other_agencies

  ## Purpose
  Adds explicit admin override fields so admins can manually flag an agency's
  paid status without touching the Stripe-derived `is_paid_listing` field.

  ## New Columns on other_agencies
  - `paid_override_active` (boolean, default false) - whether the admin override is currently active
  - `paid_override_value` (boolean, nullable) - the override value: true=paid, false=free
  - `paid_override_reason` (text, nullable) - admin-provided reason for the override
  - `paid_override_updated_at` (timestamptz, nullable) - when the override was last changed
  - `paid_override_updated_by` (text, nullable) - admin identity who set the override

  ## Key Safety Notes
  1. `is_paid_listing` is NOT changed - it remains the Stripe source of truth
  2. These are purely additive nullable/defaulted columns - zero impact on existing queries
  3. Public pages still read `is_paid_listing` directly - they are unaffected
  4. Override is computed by admin UI only: effective_paid = paid_override_active ? paid_override_value : is_paid_listing
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'paid_override_active'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_override_active BOOLEAN NOT NULL DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'paid_override_value'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_override_value BOOLEAN;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'paid_override_reason'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_override_reason TEXT;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'paid_override_updated_at'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_override_updated_at TIMESTAMPTZ;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'paid_override_updated_by'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_override_updated_by TEXT;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_other_agencies_paid_override_active
  ON other_agencies (paid_override_active)
  WHERE paid_override_active = true;
