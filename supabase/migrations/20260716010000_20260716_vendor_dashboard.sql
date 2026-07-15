/*
  Vendor Dashboard — links a paying customer's real Supabase Auth account to
  the tool they own, so they can self-serve edit their listing after
  purchase. Fully additive.

  Linking mechanism: tools.owner_user_id is set exactly once, by the new
  vendor-claim-account edge function, and ONLY when the caller presents a
  vendor_ownership_tokens row that is already verified=true (i.e. they've
  already paid via Stripe AND already proved domain ownership through the
  existing /feature-my-product/verify flow). This is deliberately the only
  path that can ever populate the column — there is no self-signup that
  bypasses payment+ownership proof.

  No RLS policy grants authenticated users direct read/write access to
  `tools` or its child tables (tool_features/tool_pros/tool_cons/tool_faqs/
  tool_user_reviews) — every vendor read/write goes through the
  vendor-dashboard edge function (service role + JWT ownership check),
  exactly like the existing admin-* edge functions. This keeps column-level
  restrictions (a vendor must never touch slug/status/featured/rating/...)
  enforceable in one place instead of split across RLS + client code.
*/

ALTER TABLE tools ADD COLUMN IF NOT EXISTS owner_user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_tools_owner_user_id ON tools (owner_user_id) WHERE owner_user_id IS NOT NULL;

-- A given auth user can own at most one tool for now (keeps the dashboard's
-- "single listing" UX simple; revisit with a join table if multi-tool
-- vendors become real).
CREATE UNIQUE INDEX IF NOT EXISTS idx_tools_owner_user_id_unique ON tools (owner_user_id) WHERE owner_user_id IS NOT NULL;

-- Public reply from the vendor, shown under their own review — a
-- constructive alternative to unilateral deletion (see vendor-dashboard
-- edge function: vendors can also soft-remove a review from their public
-- page by flipping status to 'rejected', which keeps it visible to admin's
-- existing moderation view rather than destroying it outright).
ALTER TABLE tool_user_reviews ADD COLUMN IF NOT EXISTS vendor_response text;
ALTER TABLE tool_user_reviews ADD COLUMN IF NOT EXISTS vendor_response_at timestamptz;

-- Public read surface must include the vendor's reply once the base table
-- has one — recreate the view to add the two columns (still approved-only,
-- still no reviewer_email).
CREATE OR REPLACE VIEW tool_user_reviews_public AS
SELECT id, tool_id, reviewer_name, rating, title, body, created_at, vendor_response, vendor_response_at
FROM tool_user_reviews
WHERE status = 'approved';

GRANT SELECT ON tool_user_reviews_public TO anon, authenticated;
