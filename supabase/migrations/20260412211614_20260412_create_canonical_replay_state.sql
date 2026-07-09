/*
  # Create canonical_replay_state table

  ## Purpose
  Stores a single shared canonical replay anchor per agency slug.
  This replaces per-device localStorage as the authoritative source of
  `mostRecentRequestMs` for the /request-replay page.

  Before this table existed, each device called Date.now() independently
  when creating the first local seed, causing the same agency link to show
  different timing data on desktop vs iPhone.

  With this table:
  - The server creates the anchor ONCE per agency slug (using server-side Date.now())
  - All subsequent client visits fetch the same stored anchor
  - "X hours ago" advances naturally from that single shared point on every device

  ## New Tables
  - `canonical_replay_state`
    - `agency_slug` (text, primary key) — stable URL slug
    - `state_slug` (text) — for location display (e.g. 'new-york')
    - `most_recent_request_ms` (bigint) — shared anchor in epoch ms
    - `missed_requests_last_30_days` (integer) — stored fallback count
    - `created_at` (timestamptz)
    - `updated_at` (timestamptz)

  ## Security
  - RLS enabled
  - No anon policies — table is ONLY accessed via edge functions
    using SUPABASE_SERVICE_ROLE_KEY, which bypasses RLS
  - This prevents any direct anon read/write of replay timing

  ## Notes
  - The edge function uses UPSERT with ON CONFLICT DO NOTHING to guarantee
    that the anchor is created exactly once even under concurrent first visits
  - This table does NOT store generated entries (those are rebuilt
    deterministically client-side from the shared anchor)
*/

CREATE TABLE IF NOT EXISTS canonical_replay_state (
  agency_slug text PRIMARY KEY,
  state_slug text NOT NULL DEFAULT 'new-york',
  most_recent_request_ms bigint NOT NULL,
  missed_requests_last_30_days integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE canonical_replay_state ENABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_canonical_replay_state_agency_slug
  ON canonical_replay_state (agency_slug);
