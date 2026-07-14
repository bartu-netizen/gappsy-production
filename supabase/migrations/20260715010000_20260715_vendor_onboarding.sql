/*
  # Vendor Onboarding — Feature My Product checkout funnel

  Fully additive. No existing table is altered except two new nullable
  columns on `tools` (featured_until, vendor_subscription_id).

  Tables:
  1. vendor_onboarding_sessions — one row per visitor funnel attempt, from
     URL submission through checkout. Not a Supabase Auth user — identified
     by an opaque session id the frontend persists in localStorage, mirroring
     the existing agency_claim_tokens "the token itself is the credential"
     pattern rather than forcing account creation mid-funnel.
  2. vendor_feature_subscriptions — the paid record. May exist before a real
     `tools` row does (brand-new products pay before the crawl/draft pipeline
     produces a tool), hence tool_id/discovered_tool_id are both nullable and
     backfilled once known.
  3. vendor_ownership_tokens — secure link for post-checkout ownership
     verification, modeled on agency_claim_tokens but WITH an expiry (that
     table intentionally never expires; ownership-verification links should).
  4. vendor_funnel_events — first-party funnel analytics only.

  RLS: all four tables are service-role only (no policies), same pattern as
  discovered_tools/tool_import_history — every read/write goes through an
  edge function, never a direct anon/authenticated client query.
*/

-- 1. vendor_onboarding_sessions ---------------------------------------------

CREATE TABLE IF NOT EXISTS vendor_onboarding_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  status text NOT NULL DEFAULT 'started' CHECK (status IN (
    'started', 'url_submitted', 'matched_existing', 'matched_new',
    'contact_collected', 'checkout_pending', 'checkout_completed',
    'verified', 'abandoned'
  )),

  submitted_url text,
  normalized_hostname text,
  normalized_url text,

  matched_tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,
  matched_discovered_tool_id uuid REFERENCES discovered_tools(id) ON DELETE SET NULL,
  match_confidence text CHECK (match_confidence IS NULL OR match_confidence IN (
    'exact_host', 'exact_host_path', 'redirect', 'alias', 'manual_review', 'none'
  )),
  is_new_product boolean,

  product_name_input text,
  website_input text,

  contact_email text,
  contact_name text,
  ownership_confirmed boolean NOT NULL DEFAULT false,
  -- Heuristic only, never treated as proof — see vendor_ownership_tokens for
  -- the real verification methods.
  email_domain_matches_website boolean,

  utm_source text,
  utm_medium text,
  utm_campaign text,
  referrer text,
  landing_page text,

  stripe_checkout_session_id text UNIQUE,
  stripe_subscription_id text,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS vendor_onboarding_sessions_status_idx ON vendor_onboarding_sessions (status);
CREATE INDEX IF NOT EXISTS vendor_onboarding_sessions_matched_tool_idx ON vendor_onboarding_sessions (matched_tool_id);
CREATE INDEX IF NOT EXISTS vendor_onboarding_sessions_hostname_idx ON vendor_onboarding_sessions (normalized_hostname);
CREATE INDEX IF NOT EXISTS vendor_onboarding_sessions_created_at_idx ON vendor_onboarding_sessions (created_at);

-- 2. vendor_feature_subscriptions --------------------------------------------

CREATE TABLE IF NOT EXISTS vendor_feature_subscriptions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  onboarding_session_id uuid REFERENCES vendor_onboarding_sessions(id) ON DELETE SET NULL,
  tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,
  discovered_tool_id uuid REFERENCES discovered_tools(id) ON DELETE SET NULL,

  status text NOT NULL DEFAULT 'pending_payment' CHECK (status IN (
    'pending_payment', 'active', 'past_due', 'canceled', 'pending_verification'
  )),

  contact_email text NOT NULL,

  stripe_checkout_session_id text UNIQUE,
  stripe_subscription_id text,
  stripe_customer_id text,
  stripe_price_id text,

  current_period_end timestamptz,
  featured_until timestamptz,
  canceled_at timestamptz,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS vendor_feature_subscriptions_tool_idx ON vendor_feature_subscriptions (tool_id);
CREATE INDEX IF NOT EXISTS vendor_feature_subscriptions_status_idx ON vendor_feature_subscriptions (status);
CREATE INDEX IF NOT EXISTS vendor_feature_subscriptions_stripe_sub_idx ON vendor_feature_subscriptions (stripe_subscription_id);

-- A tool can have at most one non-terminal (pending/active/past_due/
-- pending_verification) subscription at a time — the DB-level duplicate-
-- subscription guard. Canceled rows are excluded so a re-subscribe after
-- cancellation is allowed.
CREATE UNIQUE INDEX IF NOT EXISTS vendor_feature_subscriptions_one_active_per_tool_idx
  ON vendor_feature_subscriptions (tool_id)
  WHERE tool_id IS NOT NULL AND status IN ('pending_payment', 'active', 'past_due', 'pending_verification');

-- 3. vendor_ownership_tokens --------------------------------------------------

CREATE TABLE IF NOT EXISTS vendor_ownership_tokens (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  token text UNIQUE NOT NULL,

  onboarding_session_id uuid REFERENCES vendor_onboarding_sessions(id) ON DELETE SET NULL,
  vendor_subscription_id uuid REFERENCES vendor_feature_subscriptions(id) ON DELETE CASCADE,
  tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,

  contact_email text NOT NULL,

  verification_method text CHECK (verification_method IS NULL OR verification_method IN (
    'domain_email', 'html_meta_tag', 'dns_txt', 'html_file', 'manual'
  )),
  verification_target text, -- the expected token/value the vendor must publish
  verified boolean NOT NULL DEFAULT false,
  verified_at timestamptz,
  verified_by text, -- admin email when verification_method = 'manual'

  expires_at timestamptz NOT NULL DEFAULT (now() + interval '30 days'),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS vendor_ownership_tokens_subscription_idx ON vendor_ownership_tokens (vendor_subscription_id);

-- 4. vendor_funnel_events -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vendor_funnel_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  onboarding_session_id uuid REFERENCES vendor_onboarding_sessions(id) ON DELETE CASCADE,

  event_name text NOT NULL CHECK (event_name IN (
    'funnel_started', 'website_submitted', 'product_match_found', 'product_not_found',
    'product_confirmed', 'email_submitted', 'plan_viewed', 'checkout_started',
    'checkout_completed', 'checkout_abandoned', 'verification_started', 'verification_completed'
  )),
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,

  utm_source text,
  utm_medium text,
  utm_campaign text,
  referrer text,
  landing_page text,

  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS vendor_funnel_events_session_idx ON vendor_funnel_events (onboarding_session_id);
CREATE INDEX IF NOT EXISTS vendor_funnel_events_name_idx ON vendor_funnel_events (event_name);
CREATE INDEX IF NOT EXISTS vendor_funnel_events_created_at_idx ON vendor_funnel_events (created_at);

-- 5. tools: additive columns for the paid feature ----------------------------

ALTER TABLE tools ADD COLUMN IF NOT EXISTS featured_until timestamptz;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS vendor_subscription_id uuid REFERENCES vendor_feature_subscriptions(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_tools_featured_until ON tools (featured_until) WHERE featured_until IS NOT NULL;

-- 6. RLS ----------------------------------------------------------------------

ALTER TABLE vendor_onboarding_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE vendor_feature_subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE vendor_ownership_tokens ENABLE ROW LEVEL SECURITY;
ALTER TABLE vendor_funnel_events ENABLE ROW LEVEL SECURITY;
-- No policies on any of the four — service-role (edge functions) only,
-- exactly like discovered_tools/discovery_import_batches. The public-facing
-- onboarding wizard never talks to Postgres directly, only through
-- vendor-onboarding / vendor-ownership-verify, both service-role.

-- 7. discovery_providers seed row for vendor-submitted URLs ------------------

INSERT INTO discovery_providers (key, name, type, enabled, config)
VALUES ('vendor_submission', 'Vendor Self-Submission (Feature My Product)', 'manual', true, '{}'::jsonb)
ON CONFLICT (key) DO NOTHING;
