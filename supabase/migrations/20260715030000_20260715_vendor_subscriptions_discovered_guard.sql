-- Mirrors vendor_feature_subscriptions_one_active_per_tool_idx for brand-new
-- products (tool_id is still null at checkout time, discovered_tool_id is
-- the identity key instead) — closes the same duplicate-checkout race for
-- new-product submissions, not just existing-tool matches.
CREATE UNIQUE INDEX IF NOT EXISTS vendor_feature_subscriptions_one_active_per_discovered_idx
  ON vendor_feature_subscriptions (discovered_tool_id)
  WHERE discovered_tool_id IS NOT NULL AND status IN ('pending_payment', 'active', 'past_due', 'pending_verification');
