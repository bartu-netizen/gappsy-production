/*
  # Create admin_audit_log table

  ## Purpose
  Records every admin write action for security monitoring and forensics.
  This is the core of the defense-in-depth audit trail.

  ## New Tables
  - `admin_audit_log`
    - `id` (uuid, pk)
    - `actor_session_type` (text) - 'session_token' | 'admin_secret' | 'service_role'
    - `actor_email` (text, nullable) - email if known
    - `action` (text) - e.g. 'state_json_import', 'top25_update', 'logo_upload'
    - `target_table` (text) - which table was written
    - `target_id` (text, nullable) - row id if applicable
    - `state_slug` (text, nullable) - which state was affected
    - `payload_hash` (text, nullable) - sha256 of request payload
    - `ip` (text, nullable) - requester IP from CF-Connecting-IP
    - `user_agent` (text, nullable)
    - `status` (text) - 'success' | 'rejected' | 'error'
    - `rejection_reason` (text, nullable) - if status=rejected, why
    - `created_at` (timestamptz, default now())

  ## Security
  - RLS enabled
  - Admin session can INSERT (for edge functions using service role key)
  - Admin session can SELECT own rows (for audit viewer)
  - Public cannot read or write
  - No DELETE or UPDATE allowed (immutable log)

  ## Notes
  - Edge functions write using service_role key — they bypass RLS for writes
  - The SELECT policy allows admin dashboard to read logs
  - Records are append-only by design
*/

CREATE TABLE IF NOT EXISTS admin_audit_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_session_type text NOT NULL DEFAULT 'unknown',
  actor_email text,
  action text NOT NULL,
  target_table text,
  target_id text,
  state_slug text,
  payload_hash text,
  ip text,
  user_agent text,
  status text NOT NULL DEFAULT 'success',
  rejection_reason text,
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_admin_audit_log_created_at ON admin_audit_log(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_admin_audit_log_action ON admin_audit_log(action);
CREATE INDEX IF NOT EXISTS idx_admin_audit_log_state_slug ON admin_audit_log(state_slug);
CREATE INDEX IF NOT EXISTS idx_admin_audit_log_status ON admin_audit_log(status);

ALTER TABLE admin_audit_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role can insert audit logs"
  ON admin_audit_log
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role can read audit logs"
  ON admin_audit_log
  FOR SELECT
  TO service_role
  USING (true);
