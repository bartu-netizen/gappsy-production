/*
  # Fix matched_leads schema and add missing columns

  ## Summary
  The matched_leads table was created with column names matching the `get-matched-lead`
  edge function (service_needed, budget_range, client_email, client_name) but the
  `submit-and-notify` edge function was trying to insert into different column names
  (service, budget, email, first_name, last_name). This caused silent insert failures
  leaving rows with no email/contact data.

  ## Changes
  1. Add missing columns to matched_leads:
     - service (text) — alias for service_needed used by submit-and-notify
     - budget (text) — alias for budget_range used by submit-and-notify
     - email (text) — alias for client_email used by submit-and-notify
     - first_name (text) — from submit-and-notify
     - last_name (text) — from submit-and-notify
     - company_name (text) — from submit-and-notify
     - phone (text)
     - message (text)
     - status (text) default 'new'
     - utm_source, utm_medium, utm_campaign (text) — from sharedFields
     - payload (jsonb) — raw snapshot for future-proofing
     - meta (jsonb) — utm/misc metadata
     - deleted_at, deleted_by — soft delete support
  2. Backfill: copy service_needed→service, budget_range→budget, client_email→email,
     client_name→first_name for existing rows
  3. Add indexes

  ## Security
  - RLS remains as-is (service role can INSERT, authenticated can SELECT/UPDATE)
*/

-- Add columns that submit-and-notify writes (if not already present)
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='service') THEN
    ALTER TABLE matched_leads ADD COLUMN service TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='budget') THEN
    ALTER TABLE matched_leads ADD COLUMN budget TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='email') THEN
    ALTER TABLE matched_leads ADD COLUMN email TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='first_name') THEN
    ALTER TABLE matched_leads ADD COLUMN first_name TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='last_name') THEN
    ALTER TABLE matched_leads ADD COLUMN last_name TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='company_name') THEN
    ALTER TABLE matched_leads ADD COLUMN company_name TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='phone') THEN
    ALTER TABLE matched_leads ADD COLUMN phone TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='message') THEN
    ALTER TABLE matched_leads ADD COLUMN message TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='status') THEN
    ALTER TABLE matched_leads ADD COLUMN status TEXT DEFAULT 'new';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='utm_source') THEN
    ALTER TABLE matched_leads ADD COLUMN utm_source TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='utm_medium') THEN
    ALTER TABLE matched_leads ADD COLUMN utm_medium TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='utm_campaign') THEN
    ALTER TABLE matched_leads ADD COLUMN utm_campaign TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='payload') THEN
    ALTER TABLE matched_leads ADD COLUMN payload JSONB;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='meta') THEN
    ALTER TABLE matched_leads ADD COLUMN meta JSONB;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='deleted_at') THEN
    ALTER TABLE matched_leads ADD COLUMN deleted_at TIMESTAMPTZ;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='matched_leads' AND column_name='deleted_by') THEN
    ALTER TABLE matched_leads ADD COLUMN deleted_by TEXT;
  END IF;
END $$;

-- Backfill new columns from old column values for existing rows
UPDATE matched_leads
SET
  service = COALESCE(service, service_needed),
  budget = COALESCE(budget, budget_range),
  email = COALESCE(email, client_email),
  first_name = COALESCE(first_name, client_name),
  status = COALESCE(status, 'new')
WHERE service IS NULL OR email IS NULL;

-- Add indexes for the new columns
CREATE INDEX IF NOT EXISTS idx_matched_leads_email ON matched_leads(email);
CREATE INDEX IF NOT EXISTS idx_matched_leads_deleted_at ON matched_leads(deleted_at) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_matched_leads_state_created ON matched_leads(state_slug, created_at DESC);
