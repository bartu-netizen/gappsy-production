/*
  # Create lead_funnel_state table

  ## Summary
  Single source of truth for each agency+lead combination's current funnel state.
  Used for server-side routing decisions in the smart routing system.

  ## Tables Created
  - `lead_funnel_state`: One row per agency+lead, stores all funnel progression state

  ## Columns
  - id: Primary key
  - created_at, updated_at: Timestamps
  - agency_id: Target agency (required)
  - agency_slug, state_slug: Context
  - lead_email, lead_key: Lead identity (lead_key required for deduplication)
  - campaign context: campaign_id, campaign_name, sequence_name, last_email_step
  - Visit tracking: your_agency_raw_clicks, your_agency_qualified_views_count
  - Funnel flags: has_seen_loss_step, has_seen_offer_page, has_started_checkout, has_completed_payment
  - Payment status: has_standard_paid, is_top25_upgrade_eligible, has_seen_top25_upgrade_offer
  - Active offers: discount and upgrade offer tracking
  - Decision: best_next_step, best_next_reason, intent_score, last_activity_at
  - debug_snapshot: JSON for troubleshooting

  ## Constraints
  - UNIQUE(agency_id, lead_key): One state row per agency+lead
  - CHECK: best_next_step must be one of allowed values

  ## Security
  - RLS enabled
  - Admin-only read/write access

  ## Indexes
  - Primary key on id
  - Unique index on (agency_id, lead_key)
  - Index on best_next_step for filtering
  - Index on last_activity_at for recency queries
  - Index on has_completed_payment for payment filtering
*/

CREATE TABLE IF NOT EXISTS lead_funnel_state (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  -- Core identity
  agency_id text NOT NULL,
  agency_slug text,
  state_slug text,
  lead_email text,
  lead_key text NOT NULL,

  -- Campaign context
  campaign_id text,
  campaign_name text,
  sequence_name text,
  last_email_step text,

  -- Visit tracking
  your_agency_raw_clicks integer NOT NULL DEFAULT 0,
  your_agency_qualified_views_count integer NOT NULL DEFAULT 0,

  -- Funnel progression flags
  has_seen_loss_step boolean NOT NULL DEFAULT false,
  has_seen_offer_page boolean NOT NULL DEFAULT false,
  has_started_checkout boolean NOT NULL DEFAULT false,
  has_completed_payment boolean NOT NULL DEFAULT false,

  -- Payment status
  has_standard_paid boolean NOT NULL DEFAULT false,
  is_top25_upgrade_eligible boolean NOT NULL DEFAULT false,
  has_seen_top25_upgrade_offer boolean NOT NULL DEFAULT false,

  -- Active discount offer
  has_active_discount_link boolean NOT NULL DEFAULT false,
  active_discount_offer_id uuid,
  active_discount_url text,
  last_discount_issued_at timestamptz,

  -- Active upgrade offer
  active_upgrade_offer_id uuid,
  active_upgrade_offer_url text,
  last_upgrade_offer_issued_at timestamptz,

  -- Decision state
  last_activity_at timestamptz,
  intent_score integer NOT NULL DEFAULT 0,
  best_next_step text NOT NULL DEFAULT 'your_agency',
  best_next_reason text,
  debug_snapshot jsonb NOT NULL DEFAULT '{}'::jsonb,

  -- Constraints
  CONSTRAINT lead_funnel_state_best_next_step_check CHECK (
    best_next_step IN (
      'your_agency',
      'loss_step',
      'direct_offer',
      'checkout_resume',
      'discount_checkout',
      'top25_upgrade_offer',
      'paid_no_sales_flow'
    )
  ),

  -- Unique per agency+lead
  CONSTRAINT lead_funnel_state_agency_lead_unique UNIQUE (agency_id, lead_key)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_lead_funnel_state_agency_id
  ON lead_funnel_state(agency_id);

CREATE INDEX IF NOT EXISTS idx_lead_funnel_state_best_next_step
  ON lead_funnel_state(best_next_step);

CREATE INDEX IF NOT EXISTS idx_lead_funnel_state_last_activity_at
  ON lead_funnel_state(last_activity_at DESC);

CREATE INDEX IF NOT EXISTS idx_lead_funnel_state_has_completed_payment
  ON lead_funnel_state(has_completed_payment);

-- Foreign key to discount_offers (if exists)
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'discount_offers') THEN
    ALTER TABLE lead_funnel_state
      ADD CONSTRAINT fk_lead_funnel_state_discount_offer
      FOREIGN KEY (active_discount_offer_id)
      REFERENCES discount_offers(id)
      ON DELETE SET NULL;
  END IF;
END$$;

-- Foreign key to upgrade_offers (if exists)
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'upgrade_offers') THEN
    ALTER TABLE lead_funnel_state
      ADD CONSTRAINT fk_lead_funnel_state_upgrade_offer
      FOREIGN KEY (active_upgrade_offer_id)
      REFERENCES upgrade_offers(id)
      ON DELETE SET NULL;
  END IF;
END$$;

-- RLS
ALTER TABLE lead_funnel_state ENABLE ROW LEVEL SECURITY;

-- No public access
-- Admin-only access policies will be added separately via admin session validation
