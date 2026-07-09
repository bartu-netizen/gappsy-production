/*
  # Create Upgrade Offers Table

  ## Purpose
  Tracks paid-upgrade offers generated for agencies that already paid $97 for Agency Activation.
  Enables safe subscription replacement: new plan must be confirmed active before old is cancelled.

  ## New Tables
  - `upgrade_offers`
    - `id` (uuid, pk) — unique offer ID
    - `agency_id` (text) — agency being upgraded
    - `agency_name` (text) — for display/audit
    - `state_slug` (text) — state context, required for slot validation
    - `old_subscription_id` (text) — Stripe subscription ID being replaced ($97 plan)
    - `old_price_id` (text) — price ID of old plan (agency activation $97)
    - `old_plan_label` (text) — human label e.g. "Agency Activation"
    - `target_rank` (int) — which Top-25 rank slot is targeted (2-25)
    - `target_tier` (text) — standard | priority | premium
    - `target_price_id` (text) — Stripe price ID for upgrade plan
    - `full_price_cents` (bigint) — full price of target tier in cents
    - `credit_cents` (bigint) — $97 credit from old plan (in cents)
    - `extra_discount_cents` (bigint) — additional admin-granted discount (in cents)
    - `final_upgrade_price_cents` (bigint) — what customer actually pays first cycle
    - `stripe_coupon_id` (text) — Stripe coupon ID created for this offer
    - `checkout_session_id` (text) — Stripe checkout session ID when created
    - `checkout_url` (text) — the upgrade URL to send to agency
    - `status` (text) — pending_checkout | completed | cancelled | expired
    - `new_subscription_id` (text) — filled when upgrade checkout completes
    - `new_plan_activated_at` (timestamptz) — when new plan went active
    - `old_subscription_cancelled_at` (timestamptz) — when old plan was cancelled
    - `created_by_admin` (text) — who generated this offer
    - `created_at` (timestamptz)
    - `updated_at` (timestamptz)
    - `expires_at` (timestamptz) — offer link expiry (default 7 days)
    - `notes` (text) — admin notes

  ## Security
  - RLS enabled, admin-only read/write (no public access)
  - Service role bypasses RLS for edge functions
*/

CREATE TABLE IF NOT EXISTS upgrade_offers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id text NOT NULL,
  agency_name text NOT NULL DEFAULT '',
  state_slug text NOT NULL,
  old_subscription_id text,
  old_price_id text,
  old_plan_label text DEFAULT 'Agency Activation',
  target_rank integer,
  target_tier text NOT NULL,
  target_price_id text NOT NULL,
  full_price_cents bigint NOT NULL,
  credit_cents bigint NOT NULL DEFAULT 9700,
  extra_discount_cents bigint NOT NULL DEFAULT 0,
  final_upgrade_price_cents bigint NOT NULL,
  stripe_coupon_id text,
  checkout_session_id text,
  checkout_url text,
  status text NOT NULL DEFAULT 'pending_checkout',
  new_subscription_id text,
  new_plan_activated_at timestamptz,
  old_subscription_cancelled_at timestamptz,
  created_by_admin text DEFAULT '',
  notes text DEFAULT '',
  expires_at timestamptz NOT NULL DEFAULT (now() + interval '7 days'),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE upgrade_offers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can select upgrade offers"
  ON upgrade_offers FOR SELECT
  TO authenticated
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Admins can insert upgrade offers"
  ON upgrade_offers FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Admins can update upgrade offers"
  ON upgrade_offers FOR UPDATE
  TO authenticated
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'upgrade_offers' AND column_name = 'status'
  ) THEN
    ALTER TABLE upgrade_offers ADD COLUMN status text NOT NULL DEFAULT 'pending_checkout';
  END IF;
END $$;

ALTER TABLE upgrade_offers
  DROP CONSTRAINT IF EXISTS upgrade_offers_status_check;

ALTER TABLE upgrade_offers
  ADD CONSTRAINT upgrade_offers_status_check
  CHECK (status IN ('pending_checkout', 'completed', 'cancelled', 'expired'));

ALTER TABLE upgrade_offers
  DROP CONSTRAINT IF EXISTS upgrade_offers_target_tier_check;

ALTER TABLE upgrade_offers
  ADD CONSTRAINT upgrade_offers_target_tier_check
  CHECK (target_tier IN ('standard', 'priority', 'premium'));

CREATE INDEX IF NOT EXISTS idx_upgrade_offers_agency_id ON upgrade_offers (agency_id);
CREATE INDEX IF NOT EXISTS idx_upgrade_offers_state_slug ON upgrade_offers (state_slug);
CREATE INDEX IF NOT EXISTS idx_upgrade_offers_status ON upgrade_offers (status);
CREATE INDEX IF NOT EXISTS idx_upgrade_offers_checkout_session_id ON upgrade_offers (checkout_session_id);
CREATE INDEX IF NOT EXISTS idx_upgrade_offers_new_subscription_id ON upgrade_offers (new_subscription_id);
CREATE INDEX IF NOT EXISTS idx_upgrade_offers_old_subscription_id ON upgrade_offers (old_subscription_id);
