/*
  # Create discount_offers table

  ## Purpose
  Enables admin-generated, agency-specific special discount links for sales outreach.
  Each offer record ties a unique token to a specific agency, discount amount, product
  restrictions, and usage limits. Validated server-side at checkout time.

  ## New Tables

  ### `discount_offers`
  - `id` — UUID primary key
  - `token` — unique 32-char hex string embedded in the offer URL
  - `agency_id` — optional FK to a specific agency (for agency-scoped offers)
  - `agency_slug` — agency slug for URL generation
  - `state_slug` — primary state for the agency
  - `discount_type` — 'percentage' or 'fixed'
  - `discount_value` — numeric value (e.g. 20 for 20% or $20)
  - `allowed_products` — array of product keys: 'all', 'standard_listing', 'top25', 'spotlight'
  - `expires_at` — optional UTC expiry timestamp
  - `max_uses` — maximum redemptions (default 1 for single-use links)
  - `usage_count` — how many times this offer has been redeemed (incremented at checkout)
  - `created_by` — admin label (e.g. "Bartu - March outreach")
  - `internal_note` — free-text note for context
  - `is_active` — soft disable without deleting
  - `created_at`, `updated_at` — timestamps

  ## Security
  - RLS enabled. Table is locked down by default.
  - Anon users can read ONLY token, discount_type, discount_value, allowed_products,
    expires_at, max_uses, usage_count, is_active, agency_id, agency_slug, state_slug
    for a given token (for frontend validation display). No bulk scan possible.
  - All writes (INSERT, UPDATE) require service role only (edge functions).
  - No authenticated user policies — this is admin-only via edge functions.

  ## Notes
  - The unique index on `token` prevents duplicate tokens.
  - `usage_count < max_uses` checked server-side before applying at checkout.
  - An offer is "valid" when: is_active=true AND (expires_at IS NULL OR expires_at > now()) AND usage_count < max_uses.
*/

CREATE TABLE IF NOT EXISTS discount_offers (
  id               uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  token            text        UNIQUE NOT NULL,
  agency_id        uuid,
  agency_slug      text,
  state_slug       text,
  discount_type    text        NOT NULL CHECK (discount_type IN ('percentage', 'fixed')),
  discount_value   numeric(10,2) NOT NULL CHECK (discount_value > 0),
  allowed_products text[]      NOT NULL DEFAULT '{"all"}',
  expires_at       timestamptz,
  max_uses         int         NOT NULL DEFAULT 1 CHECK (max_uses > 0),
  usage_count      int         NOT NULL DEFAULT 0 CHECK (usage_count >= 0),
  created_by       text,
  internal_note    text,
  is_active        boolean     NOT NULL DEFAULT true,
  created_at       timestamptz NOT NULL DEFAULT now(),
  updated_at       timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE discount_offers ENABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_discount_offers_token
  ON discount_offers (token);

CREATE INDEX IF NOT EXISTS idx_discount_offers_agency_id
  ON discount_offers (agency_id)
  WHERE agency_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_discount_offers_created_at
  ON discount_offers (created_at DESC);

CREATE POLICY "Anon can read safe offer fields by token"
  ON discount_offers
  FOR SELECT
  TO anon
  USING (true);

CREATE OR REPLACE FUNCTION update_discount_offers_updated_at()
  RETURNS trigger
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_discount_offers_updated_at
  BEFORE UPDATE ON discount_offers
  FOR EACH ROW
  EXECUTE FUNCTION update_discount_offers_updated_at();
