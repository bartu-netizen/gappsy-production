/*
  # Create lead_routing_overrides table

  ## Summary
  Manual admin overrides for smart routing decisions.
  Allows admins to force specific routing behavior for important leads/agencies.

  ## Tables Created
  - `lead_routing_overrides`: Manual override settings per agency+lead

  ## Columns
  - id: Primary key
  - created_at, updated_at: Timestamps
  - agency_id: Target agency (required)
  - lead_key: Target lead (required)
  - override_step: Override destination (nullable = no override)
  - override_reason: Admin note explaining the override
  - created_by_admin_id: Admin who created override
  - expires_at: Optional expiration

  ## Constraints
  - UNIQUE(agency_id, lead_key): One override per agency+lead
  - CHECK: override_step must be one of allowed values

  ## Security
  - RLS enabled
  - Admin-only read/write access

  ## Indexes
  - Primary key on id
  - Unique index on (agency_id, lead_key)
*/

CREATE TABLE IF NOT EXISTS lead_routing_overrides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  -- Target
  agency_id text NOT NULL,
  lead_key text NOT NULL,

  -- Override settings
  override_step text,
  override_reason text,
  created_by_admin_id uuid,
  expires_at timestamptz,

  -- Constraints
  CONSTRAINT lead_routing_overrides_step_check CHECK (
    override_step IS NULL OR override_step IN (
      'none',
      'force_your_agency',
      'force_loss_step',
      'force_direct_offer',
      'force_checkout_resume',
      'force_discount_checkout',
      'force_top25_upgrade_offer'
    )
  ),

  -- Unique per agency+lead
  CONSTRAINT lead_routing_overrides_agency_lead_unique UNIQUE (agency_id, lead_key)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_lead_routing_overrides_agency_id
  ON lead_routing_overrides(agency_id);

-- RLS
ALTER TABLE lead_routing_overrides ENABLE ROW LEVEL SECURITY;

-- No public access
-- Admin-only access policies will be added separately via admin session validation
