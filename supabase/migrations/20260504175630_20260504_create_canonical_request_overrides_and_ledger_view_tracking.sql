/*
  # Canonical Request Overrides + Agency Ledger View Tracking

  ## Purpose
  Supports the admin "Add New Request" tool in /wp-admin/email/agency-lookup.

  ## New Tables

  ### 1. canonical_request_overrides
  Append-only store of admin-injected canonical ledger entries.
  These merge with deterministic generated entries in all public funnels.
  - id, agency_id, state_slug, service, budget, timeline, location, masked_ip, device
  - request_at: the authoritative timestamp (stored, never "hours ago" text)
  - created_by: admin identifier for audit trail
  - NEVER deleted, NEVER overwritten

  ### 2. agency_last_seen_replay_state
  Tracks when an agency owner last viewed their canonical ledger/replay.
  Used exclusively as the safety guard for admin request injection:
  - most_recent_request_at_seen: the anchor timestamp at the moment of view
  - Prevents admin from injecting a request older than what agency already saw
  - Server-side computed; client value is validated before storage

  ## Security
  - RLS enabled on both tables
  - No public policies — accessible only via service role in edge functions
*/

-- ── canonical_request_overrides ──────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS canonical_request_overrides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid NOT NULL,
  state_slug text NOT NULL DEFAULT '',
  service text,
  budget text,
  timeline text,
  location text,
  masked_ip text,
  device text,
  request_at timestamptz NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text
);

ALTER TABLE canonical_request_overrides ENABLE ROW LEVEL SECURITY;

-- Index for fast "most recent overrides for an agency/state" query
CREATE INDEX IF NOT EXISTS idx_canonical_request_overrides_agency_state
  ON canonical_request_overrides (agency_id, state_slug, request_at DESC);

-- ── agency_last_seen_replay_state ─────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS agency_last_seen_replay_state (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid NOT NULL,
  state_slug text NOT NULL DEFAULT '',
  viewed_at timestamptz NOT NULL DEFAULT now(),
  most_recent_request_at_seen timestamptz NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE agency_last_seen_replay_state ENABLE ROW LEVEL SECURITY;

-- Unique constraint so we can UPSERT per agency/state pair
CREATE UNIQUE INDEX IF NOT EXISTS ux_agency_last_seen_replay_state_agency_state
  ON agency_last_seen_replay_state (agency_id, state_slug);

CREATE INDEX IF NOT EXISTS idx_agency_last_seen_replay_state_agency_id
  ON agency_last_seen_replay_state (agency_id);
