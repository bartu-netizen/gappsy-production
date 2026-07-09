/*
  # Create Smartlead integration tables

  1. New Tables
    - `smartlead_campaign_email_sync` - Tracks email/campaign sync dedupe and mapping
    - `smartlead_sync_runs` - Audit log for each sync execution
    - `smartlead_webhook_events` - Inbound webhook events from Smartlead
  2. Security
    - Enable RLS on all tables
    - Service role has full access
  3. Performance
    - Add indexes for common queries
*/

-- Table: smartlead_campaign_email_sync
CREATE TABLE IF NOT EXISTS smartlead_campaign_email_sync (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id text NOT NULL,
  smartlead_lead_id text,
  agency_id uuid NOT NULL,
  other_agency_email_id uuid NOT NULL,
  email_normalized text NOT NULL,
  send_mode text NOT NULL DEFAULT 'all_clean_emails',
  state_slug text,
  sync_status text NOT NULL DEFAULT 'synced',
  sync_run_id uuid,
  last_synced_at timestamptz NOT NULL DEFAULT now(),
  last_error text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT unique_campaign_email UNIQUE (campaign_id, email_normalized),
  CONSTRAINT fk_agency FOREIGN KEY (agency_id) REFERENCES other_agencies(id) ON DELETE CASCADE,
  CONSTRAINT fk_email FOREIGN KEY (other_agency_email_id) REFERENCES other_agency_emails(id) ON DELETE CASCADE
);

CREATE INDEX idx_smartlead_campaign_email_sync_campaign_id ON smartlead_campaign_email_sync(campaign_id);
CREATE INDEX idx_smartlead_campaign_email_sync_agency_id ON smartlead_campaign_email_sync(agency_id);
CREATE INDEX idx_smartlead_campaign_email_sync_email_id ON smartlead_campaign_email_sync(other_agency_email_id);
CREATE INDEX idx_smartlead_campaign_email_sync_state_slug ON smartlead_campaign_email_sync(state_slug);
CREATE INDEX idx_smartlead_campaign_email_sync_run_id ON smartlead_campaign_email_sync(sync_run_id);
CREATE INDEX idx_smartlead_campaign_email_sync_last_synced ON smartlead_campaign_email_sync(last_synced_at DESC);

ALTER TABLE smartlead_campaign_email_sync ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access"
  ON smartlead_campaign_email_sync
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Table: smartlead_sync_runs
CREATE TABLE IF NOT EXISTS smartlead_sync_runs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id text NOT NULL,
  state_slug text,
  send_mode text NOT NULL,
  dry_run boolean NOT NULL DEFAULT false,
  requested_limit integer,
  selected_email_rows integer NOT NULL DEFAULT 0,
  selected_unique_agencies integer NOT NULL DEFAULT 0,
  attempted_to_sync integer NOT NULL DEFAULT 0,
  synced_success integer NOT NULL DEFAULT 0,
  skipped_duplicates integer NOT NULL DEFAULT 0,
  failed integer NOT NULL DEFAULT 0,
  requested_by text,
  notes text,
  result_json jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_smartlead_sync_runs_campaign_id ON smartlead_sync_runs(campaign_id);
CREATE INDEX idx_smartlead_sync_runs_state_slug ON smartlead_sync_runs(state_slug);
CREATE INDEX idx_smartlead_sync_runs_created_at ON smartlead_sync_runs(created_at DESC);

ALTER TABLE smartlead_sync_runs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access"
  ON smartlead_sync_runs
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Table: smartlead_webhook_events
CREATE TABLE IF NOT EXISTS smartlead_webhook_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_key text UNIQUE,
  event_type text,
  campaign_id text,
  smartlead_lead_id text,
  email_normalized text,
  payload jsonb NOT NULL,
  received_at timestamptz NOT NULL DEFAULT now(),
  processed_at timestamptz,
  processing_status text NOT NULL DEFAULT 'received',
  processing_error text
);

CREATE INDEX idx_smartlead_webhook_events_campaign_id ON smartlead_webhook_events(campaign_id);
CREATE INDEX idx_smartlead_webhook_events_lead_id ON smartlead_webhook_events(smartlead_lead_id);
CREATE INDEX idx_smartlead_webhook_events_email ON smartlead_webhook_events(email_normalized);
CREATE INDEX idx_smartlead_webhook_events_event_type ON smartlead_webhook_events(event_type);
CREATE INDEX idx_smartlead_webhook_events_received_at ON smartlead_webhook_events(received_at DESC);

ALTER TABLE smartlead_webhook_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access"
  ON smartlead_webhook_events
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);
