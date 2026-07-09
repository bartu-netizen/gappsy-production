/*
  # Create admin_sessions table

  ## Purpose
  Stores short-lived admin session tokens used by the /wp-admin login system.
  The admin-login edge function inserts a row here after validating ADMIN_IMPORT_SECRET.
  The admin-auth-check edge function reads from here to validate each protected request.

  ## New Table: admin_sessions
  - id           uuid        primary key, auto-generated
  - token        text        unique, the opaque hex session token
  - expires_at   timestamptz when this session expires (24h from creation)
  - created_at   timestamptz auto-set on insert

  ## Indexes
  - Unique index on token (fast lookup during auth-check)
  - Index on expires_at (for future cleanup of expired rows)

  ## Security
  - RLS enabled; all access goes through the service role key inside edge functions.
    No client-side access is permitted.

  ## Notes
  - Expired rows can be pruned later with:
      DELETE FROM admin_sessions WHERE expires_at < now();
  - No authenticated user policies are needed — only the service-role key used
    inside edge functions reads/writes this table.
*/

CREATE TABLE IF NOT EXISTS admin_sessions (
  id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  token       text        NOT NULL UNIQUE,
  expires_at  timestamptz NOT NULL,
  created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS admin_sessions_token_idx  ON admin_sessions (token);
CREATE        INDEX IF NOT EXISTS admin_sessions_expires_idx ON admin_sessions (expires_at);

ALTER TABLE admin_sessions ENABLE ROW LEVEL SECURITY;
