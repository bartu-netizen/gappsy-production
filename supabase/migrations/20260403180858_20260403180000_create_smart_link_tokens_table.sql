/*
  # Create smart_link_tokens table

  ## Purpose
  Maps compact short tokens (16 hex chars) to the full signed smart-link payload
  that was previously encoded as visible query params (?aid=...&lid=...&ts=...&sig=...).

  This powers the new clean URL format:
    /continue/<agency-slug>?c=<token>

  instead of the old long URL format:
    /continue/<agency-slug>?aid=...&lid=...&ts=...&sig=...

  ## New Tables
  - `smart_link_tokens`
    - `token` (text, primary key) — 16 random hex chars generated at export time
    - `agency_id` (uuid, not null) — the target agency
    - `lead_key` (text, not null) — HMAC-derived lead identifier (same as `lid` param)
    - `ts` (bigint, not null) — Unix timestamp in milliseconds at token creation
    - `sig` (text, not null) — HMAC-SHA256 signature (first 16 hex chars, same as `sig` param)
    - `campaign_id` (text, nullable) — optional campaign attribution
    - `campaign_name` (text, nullable) — optional human-readable campaign name
    - `sequence_name` (text, nullable) — optional sequence name
    - `email_step` (text, nullable) — optional email step identifier
    - `created_at` (timestamptz) — when the token was generated

  ## Security
  - RLS enabled on `smart_link_tokens`
  - No public policies — table is only accessible via the service role key from
    edge functions. Service role bypasses RLS so edge functions work correctly.
  - Tokens are 64-bit random values; hard to guess.
  - Token validity still enforced by the existing 30-day signature check on `ts`.

  ## Important Notes
  1. Backward compatibility: old-style ?aid/lid/ts/sig links remain fully supported.
     The resolver checks for ?c= first; if absent, it falls back to legacy params.
  2. This table is append-only from the export side. Tokens are never mutated.
  3. An index on `token` (the PK) is implicit and sufficient for the lookup pattern.
*/

CREATE TABLE IF NOT EXISTS smart_link_tokens (
  token       TEXT        PRIMARY KEY,
  agency_id   UUID        NOT NULL,
  lead_key    TEXT        NOT NULL,
  ts          BIGINT      NOT NULL,
  sig         TEXT        NOT NULL,
  campaign_id   TEXT,
  campaign_name TEXT,
  sequence_name TEXT,
  email_step    TEXT,
  created_at  TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE smart_link_tokens ENABLE ROW LEVEL SECURITY;

-- No permissive public policies.
-- Edge functions use SUPABASE_SERVICE_ROLE_KEY which bypasses RLS.
-- No anon or authenticated user should ever directly query this table.
