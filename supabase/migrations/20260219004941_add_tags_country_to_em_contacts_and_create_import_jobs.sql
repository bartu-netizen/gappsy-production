/*
  # Add tags + country to em_contacts, create email_import_jobs

  1. Modifications to em_contacts
    - `tags` (text[]) — array of string tags for contacts
    - `country` (text) — country field for contacts

  2. New Table: email_import_jobs
    - `id` (uuid, primary key)
    - `filename` (text)
    - `status` (text) — 'preview' | 'imported' | 'failed'
    - `total_rows` (int)
    - `inserted_count` (int)
    - `updated_count` (int)
    - `skipped_count` (int)
    - `errors` (jsonb) — array of {row, reason} objects
    - `created_at` (timestamptz)

  3. Security
    - RLS enabled on email_import_jobs
    - Service role only access (admin use)
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_contacts' AND column_name = 'tags'
  ) THEN
    ALTER TABLE em_contacts ADD COLUMN tags text[] DEFAULT '{}';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_contacts' AND column_name = 'country'
  ) THEN
    ALTER TABLE em_contacts ADD COLUMN country text;
  END IF;
END $$;

CREATE TABLE IF NOT EXISTS email_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  filename text NOT NULL DEFAULT '',
  status text NOT NULL DEFAULT 'preview',
  total_rows integer NOT NULL DEFAULT 0,
  inserted_count integer NOT NULL DEFAULT 0,
  updated_count integer NOT NULL DEFAULT 0,
  skipped_count integer NOT NULL DEFAULT 0,
  errors jsonb NOT NULL DEFAULT '[]'::jsonb,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE email_import_jobs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role can manage import jobs"
  ON email_import_jobs
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role can insert import jobs"
  ON email_import_jobs
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role can update import jobs"
  ON email_import_jobs
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_email_import_jobs_created_at ON email_import_jobs (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_contacts_tags ON em_contacts USING gin (tags);
