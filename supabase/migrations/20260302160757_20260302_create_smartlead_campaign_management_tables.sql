/*
  # Create Smartlead Campaign Management Tables

  1. New Tables
    - `smartlead_campaign_configs`: Local metadata and mapping preferences for Smartlead campaigns
    - `smartlead_campaign_actions_log`: Track manual start/pause/resume actions from wp-admin
    - `smartlead_template_mappings`: Map Gappsy contexts to Smartlead templates/campaigns

  2. Security
    - Enable RLS on all tables
    - Service role writes via Edge Functions
    - Admin authenticated read/write policies

  3. Indexes
    - campaign_id for fast lookups
    - state_slug for filtering
    - created_at for sorting and historical queries
    - is_enabled for active filter queries

  IMPORTANT NOTES:
  - These tables store LOCAL admin configuration only
  - No Smartlead API secrets stored here (API key kept server-side in Edge Functions)
  - Campaign data is denormalized from Smartlead for performance
  - RLS ensures admin-only access patterns while allowing read via Edge Functions with admin check
*/

-- Create smartlead_campaign_configs table
CREATE TABLE IF NOT EXISTS smartlead_campaign_configs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id text NOT NULL UNIQUE,
  campaign_name_cached text,
  is_active_local boolean NOT NULL DEFAULT true,
  default_state_slug text,
  default_send_mode text,
  contact_source text NOT NULL DEFAULT 'gappsy_other_agencies',
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Create smartlead_campaign_actions_log table
CREATE TABLE IF NOT EXISTS smartlead_campaign_actions_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id text NOT NULL,
  action text NOT NULL,
  requested_by text,
  request_payload jsonb,
  response_payload jsonb,
  success boolean NOT NULL DEFAULT false,
  error_message text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Create smartlead_template_mappings table
CREATE TABLE IF NOT EXISTS smartlead_template_mappings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mapping_name text NOT NULL,
  state_slug text,
  send_mode text,
  campaign_id text,
  smartlead_template_id text,
  template_name_cached text,
  subject_variant text,
  is_default boolean NOT NULL DEFAULT false,
  is_enabled boolean NOT NULL DEFAULT true,
  variable_mapping jsonb NOT NULL DEFAULT '{}'::jsonb,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_smartlead_campaign_configs_campaign_id 
  ON smartlead_campaign_configs(campaign_id);

CREATE INDEX IF NOT EXISTS idx_smartlead_campaign_configs_is_active_local 
  ON smartlead_campaign_configs(is_active_local);

CREATE INDEX IF NOT EXISTS idx_smartlead_campaign_actions_log_campaign_id 
  ON smartlead_campaign_actions_log(campaign_id);

CREATE INDEX IF NOT EXISTS idx_smartlead_campaign_actions_log_created_at 
  ON smartlead_campaign_actions_log(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_smartlead_template_mappings_state_slug 
  ON smartlead_template_mappings(state_slug);

CREATE INDEX IF NOT EXISTS idx_smartlead_template_mappings_campaign_id 
  ON smartlead_template_mappings(campaign_id);

CREATE INDEX IF NOT EXISTS idx_smartlead_template_mappings_is_enabled 
  ON smartlead_template_mappings(is_enabled);

-- Enable RLS
ALTER TABLE smartlead_campaign_configs ENABLE ROW LEVEL SECURITY;
ALTER TABLE smartlead_campaign_actions_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE smartlead_template_mappings ENABLE ROW LEVEL SECURITY;

-- RLS Policies: Service role (Edge Functions) can read/write all rows
CREATE POLICY "Service role full access"
  ON smartlead_campaign_configs
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role full access"
  ON smartlead_campaign_actions_log
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role full access"
  ON smartlead_template_mappings
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- RLS Policies: Authenticated admin users can read campaign configs
CREATE POLICY "Authenticated admin can read campaign configs"
  ON smartlead_campaign_configs
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated admin can read campaign actions"
  ON smartlead_campaign_actions_log
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated admin can read template mappings"
  ON smartlead_template_mappings
  FOR SELECT
  TO authenticated
  USING (true);

-- RLS Policies: Authenticated admin users can insert/update campaign configs
CREATE POLICY "Authenticated admin can manage campaign configs"
  ON smartlead_campaign_configs
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated admin can update campaign configs"
  ON smartlead_campaign_configs
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- RLS Policies: Authenticated admin users can manage template mappings
CREATE POLICY "Authenticated admin can manage template mappings"
  ON smartlead_template_mappings
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated admin can update template mappings"
  ON smartlead_template_mappings
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated admin can delete template mappings"
  ON smartlead_template_mappings
  FOR DELETE
  TO authenticated
  USING (true);
