/*
  # Feature My Product v2 — split into a one-time "Claim & Verify" product
  and a recurring "Growth" product (monthly/yearly), instead of a single
  $37/mo subscription.

  Fully additive:
  - Two new columns on vendor_feature_subscriptions (product, billing_interval)
    with backward-compatible defaults ('growth', 'month') so every existing
    row — all of which are today's single $37/mo tier — stays valid with no
    manual backfill.
  - Two new nullable columns on tools (billing_interval, claim_paid_at).
  - The two existing "one active subscription per tool" partial unique
    indexes are replaced with (tool_id, product) / (discovered_tool_id,
    product) variants — a tool can now hold an active 'claim' row AND an
    active 'growth' row at the same time (that's the point: claim once,
    then optionally layer Growth on top), where before only one row total
    was ever allowed per tool regardless of product.
*/

-- vendor_feature_subscriptions: which product this row is for, and (for
-- growth) its billing cadence. 'one_time' covers claim; 'month'/'year' cover
-- growth. Existing rows default to 'growth' + 'month', matching the only
-- product that existed before this migration.
ALTER TABLE vendor_feature_subscriptions ADD COLUMN IF NOT EXISTS product text NOT NULL DEFAULT 'growth' CHECK (product IN ('claim', 'growth'));
ALTER TABLE vendor_feature_subscriptions ADD COLUMN IF NOT EXISTS billing_interval text NOT NULL DEFAULT 'month' CHECK (billing_interval IN ('one_time', 'month', 'year'));

-- Replace the per-tool uniqueness guard with a per-(tool, product) guard.
DROP INDEX IF EXISTS vendor_feature_subscriptions_one_active_per_tool_idx;
CREATE UNIQUE INDEX IF NOT EXISTS vendor_feature_subscriptions_one_active_per_tool_product_idx
  ON vendor_feature_subscriptions (tool_id, product)
  WHERE tool_id IS NOT NULL AND status IN ('pending_payment', 'active', 'past_due', 'pending_verification');

DROP INDEX IF EXISTS vendor_feature_subscriptions_one_active_per_discovered_idx;
CREATE UNIQUE INDEX IF NOT EXISTS vendor_feature_subscriptions_one_active_per_discovered_product_idx
  ON vendor_feature_subscriptions (discovered_tool_id, product)
  WHERE discovered_tool_id IS NOT NULL AND status IN ('pending_payment', 'active', 'past_due', 'pending_verification');

-- tools: mirrors the active Growth row's billing_interval (null when not on
-- Growth) so the tool detail page can gate the "no competitor ads on your
-- own page" yearly perk without an extra join at render time.
ALTER TABLE tools ADD COLUMN IF NOT EXISTS billing_interval text CHECK (billing_interval IS NULL OR billing_interval IN ('month', 'year'));

-- tools: when the one-time Claim & Verify fee was paid. Gates eligibility to
-- purchase Growth — separate from `verified`, which still requires the
-- existing domain-ownership-proof step regardless of payment.
ALTER TABLE tools ADD COLUMN IF NOT EXISTS claim_paid_at timestamptz;
