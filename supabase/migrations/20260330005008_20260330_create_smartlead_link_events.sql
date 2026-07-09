/*
  # Create smartlead_link_events table

  ## Summary
  Raw event log for smart routing link clicks and funnel progression events.
  This table captures all interactions with the new smart routing system.

  ## Tables Created
  - `smartlead_link_events`: Event log for smart link opens, qualified views, and progression

  ## Columns
  - id: Primary key
  - created_at: Event timestamp
  - agency_id: Target agency identifier (nullable)
  - agency_slug: Target agency slug (nullable)
  - state_slug: Target state (nullable)
  - lead_email: Lead email (nullable, may be hashed)
  - lead_key: Deterministic lead identifier for deduplication
  - campaign_id, campaign_name, sequence_name, email_step, email_variant: Campaign context
  - smart_link_type: Type of smart link ('continue_url', 'direct_link', etc.)
  - event_type: Event name ('smart_link_opened', 'qualified_view', etc.)
  - session_id: Browser session identifier
  - request_ip, user_agent, referrer: Request metadata
  - is_bot: Bot/crawler detection flag
  - is_duplicate: Duplicate click detection flag
  - metadata: Additional context as JSON

  ## Security
  - RLS enabled
  - Admin-only write access
  - Public read disabled

  ## Indexes
  - Primary key on id
  - Index on agency_id for agency-specific queries
  - Index on lead_key for lead-specific queries
  - Index on created_at for time-based queries
  - Index on event_type for event filtering
  - Composite index on (agency_id, lead_key) for common lookups
*/

CREATE TABLE IF NOT EXISTS smartlead_link_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),

  -- Target context
  agency_id text,
  agency_slug text,
  state_slug text,

  -- Lead identity
  lead_email text,
  lead_key text,

  -- Campaign context
  campaign_id text,
  campaign_name text,
  sequence_name text,
  email_step text,
  email_variant text,

  -- Event metadata
  smart_link_type text NOT NULL,
  event_type text NOT NULL,
  session_id text,
  request_ip text,
  user_agent text,
  referrer text,

  -- Quality flags
  is_bot boolean NOT NULL DEFAULT false,
  is_duplicate boolean NOT NULL DEFAULT false,

  -- Additional context
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_smartlead_link_events_agency_id
  ON smartlead_link_events(agency_id);

CREATE INDEX IF NOT EXISTS idx_smartlead_link_events_lead_key
  ON smartlead_link_events(lead_key);

CREATE INDEX IF NOT EXISTS idx_smartlead_link_events_created_at
  ON smartlead_link_events(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_smartlead_link_events_event_type
  ON smartlead_link_events(event_type);

CREATE INDEX IF NOT EXISTS idx_smartlead_link_events_agency_lead
  ON smartlead_link_events(agency_id, lead_key);

-- RLS
ALTER TABLE smartlead_link_events ENABLE ROW LEVEL SECURITY;

-- No public access
-- Admin-only access policies will be added separately via admin session validation
