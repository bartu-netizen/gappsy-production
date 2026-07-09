/*
  # Create admin_secrets table for centralized secret management

  1. New Tables
    - `admin_secrets`
      - `key` (text, primary key) - Secret identifier (e.g., 'ADMIN_IMPORT_SECRET')
      - `value` (text) - The actual secret value
      - `created_at` (timestamptz) - When secret was created
      - `updated_at` (timestamptz) - When secret was last updated
      - `created_by` (text) - Who created the secret (optional)

  2. Security
    - Enable RLS on `admin_secrets` table
    - Policy: Service role can read/write (for edge functions)
    - Policy: No public access (secrets are sensitive)

  3. Purpose
    - Single source of truth for ADMIN_IMPORT_SECRET
    - No manual Supabase env configuration needed
    - Admin Settings UI can directly update database
    - Both logo-upload and state-json-import read from same source
*/

-- Create admin_secrets table
CREATE TABLE IF NOT EXISTS admin_secrets (
  key text PRIMARY KEY,
  value text NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  created_by text DEFAULT 'system'
);

-- Enable RLS
ALTER TABLE admin_secrets ENABLE ROW LEVEL SECURITY;

-- Policy: Service role (edge functions) can read all secrets
CREATE POLICY "Service role can read all secrets"
  ON admin_secrets
  FOR SELECT
  TO service_role
  USING (true);

-- Policy: Service role can insert/update secrets
CREATE POLICY "Service role can manage secrets"
  ON admin_secrets
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Insert default ADMIN_IMPORT_SECRET if not exists
-- This allows immediate use without manual setup
INSERT INTO admin_secrets (key, value, created_by)
VALUES ('ADMIN_IMPORT_SECRET', 'temp-secret-please-regenerate-in-settings', 'system')
ON CONFLICT (key) DO NOTHING;

-- Create index for fast lookup
CREATE INDEX IF NOT EXISTS idx_admin_secrets_key ON admin_secrets(key);

COMMENT ON TABLE admin_secrets IS 'Stores admin secrets for edge functions. Single source of truth for authentication.';
COMMENT ON COLUMN admin_secrets.key IS 'Secret identifier (e.g., ADMIN_IMPORT_SECRET)';
COMMENT ON COLUMN admin_secrets.value IS 'The actual secret value - SENSITIVE DATA';
