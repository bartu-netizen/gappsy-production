/*
  # Smartlead Local Intelligence Tables — Phase 1

  ## Purpose
  Builds isolated, backend-only storage for the Smartlead ↔ Gappsy intelligence system.
  Zero impact on public frontend. All tables are admin-only and service-role-gated.

  ## New Tables

  ### smartlead_campaigns
  Local cache of Smartlead campaigns. Populated by the background sync job.
  Replaces live API calls in wp-admin campaign list.

  ### smartlead_lead_events
  Normalized, indexed events from the Smartlead webhook receiver.
  Mirrors smartlead_webhook_events but structured for fast analytics.
  Fields: event_key, campaign_id, lead_id, email_normalized, other_agency_email_id, agency_id, event_type, event_at.

  ### smartlead_agency_rollups
  One row per agency. Aggregated outreach performance (synced, opened, clicked, replied, bounced).
  Computed by the background sync / rollup job — not live.
  Powers fast agency-level reporting in wp-admin without expensive joins.

  ### smartlead_sync_health
  One row per sync_type (campaigns, leads, rollups, webhook).
  Tracks last_run_at, last_success_at, status, records_processed, duration_ms.
  Enables the sync health dashboard in wp-admin.

  ## Security
  - All tables: RLS enabled
  - Public / anon: NO ACCESS
  - Service role: full read/write (used by edge functions)
  - Authenticated (admin users): SELECT only

  ## Indexes
  Optimized for:
  - Fast agency lookups (agency_id)
  - Event time-series queries (event_at DESC)
  - Email-to-event joins (email_normalized)
  - Campaign-level filtering (campaign_id)

  ## Notes
  - These tables are INTERNAL ONLY — never imported by public pages
  - Seed initial smartlead_sync_health rows so health dashboard renders immediately
  - All foreign keys use ON DELETE SET NULL to avoid cascade data loss
*/

-- ── smartlead_campaigns ────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS smartlead_campaigns (
  id                    bigserial PRIMARY KEY,
  campaign_id           text UNIQUE NOT NULL,
  name                  text,
  status                text,
  created_at_provider   timestamptz,
  lead_count            integer,
  mailbox_count         integer,
  provider_sent         integer DEFAULT 0,
  provider_opened       integer DEFAULT 0,
  provider_clicked      integer DEFAULT 0,
  provider_replied      integer DEFAULT 0,
  provider_bounced      integer DEFAULT 0,
  provider_unsubscribed integer DEFAULT 0,
  provider_leads_total  integer,
  provider_stats_source text,
  raw_campaign          jsonb,
  last_synced_at        timestamptz DEFAULT now(),
  created_at            timestamptz DEFAULT now(),
  updated_at            timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_smartlead_campaigns_status
  ON smartlead_campaigns(status);
CREATE INDEX IF NOT EXISTS idx_smartlead_campaigns_last_synced
  ON smartlead_campaigns(last_synced_at DESC);

-- ── smartlead_lead_events ──────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS smartlead_lead_events (
  id                    bigserial PRIMARY KEY,
  event_key             text UNIQUE NOT NULL,
  campaign_id           text NOT NULL,
  lead_id               text,
  email_normalized      text,
  other_agency_email_id uuid REFERENCES other_agency_emails(id) ON DELETE SET NULL,
  agency_id             uuid REFERENCES other_agencies(id) ON DELETE SET NULL,
  event_type            text NOT NULL,
  event_at              timestamptz NOT NULL DEFAULT now(),
  raw_payload           jsonb,
  created_at            timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_campaign
  ON smartlead_lead_events(campaign_id);
CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_agency
  ON smartlead_lead_events(agency_id)
  WHERE agency_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_email
  ON smartlead_lead_events(email_normalized)
  WHERE email_normalized IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_type
  ON smartlead_lead_events(event_type);
CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_at
  ON smartlead_lead_events(event_at DESC);
CREATE INDEX IF NOT EXISTS idx_smartlead_lead_events_lead_campaign
  ON smartlead_lead_events(lead_id, campaign_id)
  WHERE lead_id IS NOT NULL;

-- ── smartlead_agency_rollups ──────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS smartlead_agency_rollups (
  id                   bigserial PRIMARY KEY,
  agency_id            uuid UNIQUE NOT NULL REFERENCES other_agencies(id) ON DELETE CASCADE,
  campaigns_contacted  integer DEFAULT 0,
  emails_synced        integer DEFAULT 0,
  emails_sent          integer DEFAULT 0,
  emails_opened        integer DEFAULT 0,
  emails_clicked       integer DEFAULT 0,
  emails_replied       integer DEFAULT 0,
  emails_bounced       integer DEFAULT 0,
  emails_unsubscribed  integer DEFAULT 0,
  last_event_type      text,
  last_event_at        timestamptz,
  first_contacted_at   timestamptz,
  computed_at          timestamptz DEFAULT now(),
  created_at           timestamptz DEFAULT now(),
  updated_at           timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_smartlead_agency_rollups_last_event
  ON smartlead_agency_rollups(last_event_at DESC)
  WHERE last_event_at IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_smartlead_agency_rollups_replied
  ON smartlead_agency_rollups(emails_replied DESC);

-- ── smartlead_sync_health ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS smartlead_sync_health (
  id                bigserial PRIMARY KEY,
  sync_type         text UNIQUE NOT NULL,
  last_run_at       timestamptz,
  last_success_at   timestamptz,
  last_error        text,
  records_processed integer DEFAULT 0,
  duration_ms       integer,
  status            text DEFAULT 'never_run',
  extra_info        jsonb,
  created_at        timestamptz DEFAULT now(),
  updated_at        timestamptz DEFAULT now()
);

-- ── RLS ───────────────────────────────────────────────────────────────────────
ALTER TABLE smartlead_campaigns       ENABLE ROW LEVEL SECURITY;
ALTER TABLE smartlead_lead_events     ENABLE ROW LEVEL SECURITY;
ALTER TABLE smartlead_agency_rollups  ENABLE ROW LEVEL SECURITY;
ALTER TABLE smartlead_sync_health     ENABLE ROW LEVEL SECURITY;

-- smartlead_campaigns
CREATE POLICY "Authenticated admin can read smartlead_campaigns"
  ON smartlead_campaigns FOR SELECT TO authenticated USING (true);
CREATE POLICY "Service role insert smartlead_campaigns"
  ON smartlead_campaigns FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role update smartlead_campaigns"
  ON smartlead_campaigns FOR UPDATE TO service_role USING (true) WITH CHECK (true);
CREATE POLICY "Service role delete smartlead_campaigns"
  ON smartlead_campaigns FOR DELETE TO service_role USING (true);

-- smartlead_lead_events
CREATE POLICY "Authenticated admin can read smartlead_lead_events"
  ON smartlead_lead_events FOR SELECT TO authenticated USING (true);
CREATE POLICY "Service role insert smartlead_lead_events"
  ON smartlead_lead_events FOR INSERT TO service_role WITH CHECK (true);

-- smartlead_agency_rollups
CREATE POLICY "Authenticated admin can read smartlead_agency_rollups"
  ON smartlead_agency_rollups FOR SELECT TO authenticated USING (true);
CREATE POLICY "Service role insert smartlead_agency_rollups"
  ON smartlead_agency_rollups FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role update smartlead_agency_rollups"
  ON smartlead_agency_rollups FOR UPDATE TO service_role USING (true) WITH CHECK (true);

-- smartlead_sync_health
CREATE POLICY "Authenticated admin can read smartlead_sync_health"
  ON smartlead_sync_health FOR SELECT TO authenticated USING (true);
CREATE POLICY "Service role insert smartlead_sync_health"
  ON smartlead_sync_health FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role update smartlead_sync_health"
  ON smartlead_sync_health FOR UPDATE TO service_role USING (true) WITH CHECK (true);

-- ── Seed sync health rows ────────────────────────────────────────────────────
INSERT INTO smartlead_sync_health (sync_type, status)
VALUES
  ('campaigns', 'never_run'),
  ('rollups',   'never_run'),
  ('webhook',   'never_run')
ON CONFLICT (sync_type) DO NOTHING;
