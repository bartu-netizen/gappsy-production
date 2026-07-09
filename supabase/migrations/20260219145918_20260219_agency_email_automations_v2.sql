/*
  # Agency Email Automations Foundation v2

  ## Summary
  Creates tables for agency email preferences, listings, and event logging.
  Extends availability requests with routing and email status fields.
  All agency-facing emails disabled by default.

  ## New Tables
  - agency_listings: paid status lookup per state
  - agency_email_preferences: opt-out settings
  - agency_email_events: audit log

  ## Modified Tables
  - agency_availability_requests: add routing/email fields (carefully)
  - notification_settings: add global toggles

  ## Security
  RLS enabled on all. Service role has full access.
*/

-- ============================================================
-- AGENCY LISTINGS (paid status lookup)
-- ============================================================
CREATE TABLE IF NOT EXISTS agency_listings (
  agency_id text NOT NULL,
  state_slug text NOT NULL,
  listing_tier text NOT NULL DEFAULT 'free',
  paid_active boolean DEFAULT false,
  updated_at timestamptz DEFAULT now() NOT NULL,
  PRIMARY KEY (agency_id, state_slug)
);

CREATE INDEX IF NOT EXISTS idx_agency_listings_state ON agency_listings(state_slug);
CREATE INDEX IF NOT EXISTS idx_agency_listings_tier ON agency_listings(listing_tier);

ALTER TABLE agency_listings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on agency_listings"
  ON agency_listings FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- AGENCY EMAIL PREFERENCES (opt-out tracking)
-- ============================================================
CREATE TABLE IF NOT EXISTS agency_email_preferences (
  agency_id text PRIMARY KEY,
  email text NOT NULL DEFAULT '',
  allow_lead_emails boolean DEFAULT true,
  allow_marketing_emails boolean DEFAULT true,
  unsub_token text UNIQUE NOT NULL DEFAULT gen_random_uuid()::text,
  updated_at timestamptz DEFAULT now() NOT NULL,
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_agency_email_preferences_email ON agency_email_preferences(email);
CREATE INDEX IF NOT EXISTS idx_agency_email_preferences_unsub_token ON agency_email_preferences(unsub_token);

ALTER TABLE agency_email_preferences ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on agency_email_preferences"
  ON agency_email_preferences FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- AGENCY EMAIL EVENTS (audit log)
-- ============================================================
CREATE TABLE IF NOT EXISTS agency_email_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now() NOT NULL,
  agency_id text NOT NULL,
  request_id uuid,
  event_type text NOT NULL,
  to_email text NOT NULL DEFAULT '',
  subject text NOT NULL DEFAULT '',
  status text NOT NULL DEFAULT 'sent',
  provider text DEFAULT 'smtp',
  provider_message_id text,
  error text,
  metadata jsonb DEFAULT '{}'
);

CREATE INDEX IF NOT EXISTS idx_agency_email_events_agency_id ON agency_email_events(agency_id);
CREATE INDEX IF NOT EXISTS idx_agency_email_events_request_id ON agency_email_events(request_id);
CREATE INDEX IF NOT EXISTS idx_agency_email_events_event_type ON agency_email_events(event_type);
CREATE INDEX IF NOT EXISTS idx_agency_email_events_created_at ON agency_email_events(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_agency_email_events_status ON agency_email_events(status);

ALTER TABLE agency_email_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on agency_email_events"
  ON agency_email_events FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- SAFELY EXTEND agency_availability_requests
-- ============================================================
DO $$
BEGIN
  -- Add only columns that don't exist yet
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'requester_name') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_name text DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'requester_email') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_email text DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'requester_phone') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_phone text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'requester_company') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_company text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'target_agency_id') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN target_agency_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'target_agency_email') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN target_agency_email text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'routing_decision') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN routing_decision text DEFAULT 'unknown';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'paid_status_at_time') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN paid_status_at_time text DEFAULT 'unknown';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'lead_visibility') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN lead_visibility text DEFAULT 'withheld';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'agency_availability_requests' AND column_name = 'agency_email_status') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN agency_email_status text DEFAULT 'disabled';
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_availability_requests_routing_decision
  ON agency_availability_requests(routing_decision);
CREATE INDEX IF NOT EXISTS idx_availability_requests_email_status
  ON agency_availability_requests(agency_email_status);
CREATE INDEX IF NOT EXISTS idx_availability_requests_target_agency
  ON agency_availability_requests(target_agency_id);

-- ============================================================
-- HELPER FUNCTION: Check if agency is paid in state
-- ============================================================
CREATE OR REPLACE FUNCTION is_agency_paid_in_state(
  p_agency_id text,
  p_state_slug text
) RETURNS boolean AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM agency_listings
    WHERE agency_id = p_agency_id
    AND state_slug = p_state_slug
    AND paid_active = true
    AND listing_tier IN ('standard', 'spotlight', 'top25')
  );
END;
$$ LANGUAGE plpgsql STABLE;
