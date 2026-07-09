/*
  # Smart Link Routing: max_step + smartlink_logs

  ## Summary
  Two surgical changes to make the /continue smartlink routing system 100% deterministic.

  ## 1. Add max_step to lead_funnel_state
  Adds a `max_step integer DEFAULT 0` column that stores the highest canonical
  funnel step number (10–160) reached by this lead for this agency.
  The smart-next-resolver refreshes this on every /continue hit by querying
  funnel_sessions and taking MAX(state.max_step, sessions_max_step).
  The column acts as a monotonic floor — the value NEVER goes down.

  All routing decisions for /continue are now made exclusively from this column.

  ## 2. Create smartlink_logs table
  Audit table that records every /continue resolution:
  - agency_id, lead_id (= lead_key), token (= compact ?c= token or NULL for legacy)
  - max_step used for the routing decision
  - destination_url resolved
  - created_at timestamp

  Security: RLS enabled, no public policies — service-role only.

  ## Changes
  - `lead_funnel_state`: ADD COLUMN `max_step integer DEFAULT 0`
  - NEW TABLE: `smartlink_logs`
*/

-- ─── 1. Add max_step to lead_funnel_state ──────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'lead_funnel_state' AND column_name = 'max_step'
  ) THEN
    ALTER TABLE lead_funnel_state ADD COLUMN max_step integer DEFAULT 0;
  END IF;
END $$;

-- ─── 2. Create smartlink_logs ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS smartlink_logs (
  id             uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id      text,
  lead_id        text,
  token          text,
  max_step       integer     DEFAULT 0,
  destination_url text       NOT NULL,
  created_at     timestamptz DEFAULT now()
);

ALTER TABLE smartlink_logs ENABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_smartlink_logs_agency_id  ON smartlink_logs(agency_id);
CREATE INDEX IF NOT EXISTS idx_smartlink_logs_lead_id    ON smartlink_logs(lead_id);
CREATE INDEX IF NOT EXISTS idx_smartlink_logs_created_at ON smartlink_logs(created_at DESC);
