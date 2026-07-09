/*
  # Create smartlead_suppression_actions if missing (idempotent)

  ## Summary
  Ensures the `smartlead_suppression_actions` audit table exists with the
  schema, indexes, RLS, and check constraints expected by the
  `smartlead-suppression-runner` edge function. Safe to run multiple times.

  ## What this migration does

  1. **New Table (if not exists)**
     - `public.smartlead_suppression_actions` — per-action audit log written by
       the hardened Smartlead suppression runner.
     - Columns:
       - `id` (uuid, pk, default gen_random_uuid())
       - `run_id` (uuid, not null) — groups actions from a single runner pass
       - `agency_id` (uuid, nullable)
       - `agency_name` (text, nullable)
       - `state_slug` (text, nullable)
       - `email` (text, not null) — the suppressed lead email
       - `smartlead_lead_id` (text, nullable) — Smartlead's lead identifier
       - `campaign_id` (text, nullable) — campaign affected, if any
       - `action_type` (text, not null) — what was attempted
       - `status` (text, not null) — outcome of the attempt
       - `error_message` (text, nullable)
       - `response_json` (jsonb, nullable) — provider response payload
       - `dry_run` (boolean, not null, default true) — simulation vs. live action
       - `created_at` (timestamptz, not null, default now())

  2. **Indexes (if not exists)**
     - `idx_sla_run_id`        on (run_id)
     - `idx_sla_email`         on (email)
     - `idx_sla_agency_id`     on (agency_id)
     - `idx_sla_status`        on (status)
     - `idx_sla_created_at`    on (created_at desc)

  3. **Check constraints (ensured)**
     - `action_type` IN
       ('fetch_lead','global_unsubscribe','fetch_campaigns','campaign_delete')
     - `status` IN
       ('pending','success','failed','skipped','not_found','already_unsubscribed')

  4. **Security**
     - RLS enabled.
     - Policy: only service role may read/write. No anon/authenticated access.
     - The runner uses the service role key — application reads happen via
       admin edge functions, not via the table directly.

  ## Notes
  - This migration NEVER drops the table or its data. If the table already
    exists, only missing indexes / constraints are added.
  - The pre-existing constraint name from the earlier migration is dropped and
    recreated to match the canonical list (no rows currently exist that would
    be invalidated).
*/

CREATE TABLE IF NOT EXISTS public.smartlead_suppression_actions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  run_id uuid NOT NULL,
  agency_id uuid NULL,
  agency_name text NULL,
  state_slug text NULL,
  email text NOT NULL,
  smartlead_lead_id text NULL,
  campaign_id text NULL,
  action_type text NOT NULL,
  status text NOT NULL,
  error_message text NULL,
  response_json jsonb NULL,
  dry_run boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Indexes (idempotent)
CREATE INDEX IF NOT EXISTS idx_sla_run_id      ON public.smartlead_suppression_actions (run_id);
CREATE INDEX IF NOT EXISTS idx_sla_email       ON public.smartlead_suppression_actions (email);
CREATE INDEX IF NOT EXISTS idx_sla_agency_id   ON public.smartlead_suppression_actions (agency_id);
CREATE INDEX IF NOT EXISTS idx_sla_status      ON public.smartlead_suppression_actions (status);
CREATE INDEX IF NOT EXISTS idx_sla_created_at  ON public.smartlead_suppression_actions (created_at DESC);

-- action_type check (drop+recreate to canonical list — no existing rows would be invalidated)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE table_schema = 'public'
      AND table_name = 'smartlead_suppression_actions'
      AND constraint_name = 'smartlead_suppression_actions_action_type_check'
  ) THEN
    ALTER TABLE public.smartlead_suppression_actions
      DROP CONSTRAINT smartlead_suppression_actions_action_type_check;
  END IF;

  ALTER TABLE public.smartlead_suppression_actions
    ADD CONSTRAINT smartlead_suppression_actions_action_type_check
    CHECK (action_type IN (
      'fetch_lead',
      'global_unsubscribe',
      'fetch_campaigns',
      'campaign_delete'
    ));
END $$;

-- status check (idempotent: drop+recreate to canonical list)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE table_schema = 'public'
      AND table_name = 'smartlead_suppression_actions'
      AND constraint_name = 'smartlead_suppression_actions_status_check'
  ) THEN
    ALTER TABLE public.smartlead_suppression_actions
      DROP CONSTRAINT smartlead_suppression_actions_status_check;
  END IF;

  ALTER TABLE public.smartlead_suppression_actions
    ADD CONSTRAINT smartlead_suppression_actions_status_check
    CHECK (status IN (
      'pending',
      'success',
      'failed',
      'skipped',
      'not_found',
      'already_unsubscribed'
    ));
END $$;

-- RLS
ALTER TABLE public.smartlead_suppression_actions ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'smartlead_suppression_actions'
      AND policyname = 'Service role can select suppression actions'
  ) THEN
    CREATE POLICY "Service role can select suppression actions"
      ON public.smartlead_suppression_actions
      FOR SELECT
      TO service_role
      USING (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'smartlead_suppression_actions'
      AND policyname = 'Service role can insert suppression actions'
  ) THEN
    CREATE POLICY "Service role can insert suppression actions"
      ON public.smartlead_suppression_actions
      FOR INSERT
      TO service_role
      WITH CHECK (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'smartlead_suppression_actions'
      AND policyname = 'Service role can update suppression actions'
  ) THEN
    CREATE POLICY "Service role can update suppression actions"
      ON public.smartlead_suppression_actions
      FOR UPDATE
      TO service_role
      USING (true)
      WITH CHECK (true);
  END IF;
END $$;
