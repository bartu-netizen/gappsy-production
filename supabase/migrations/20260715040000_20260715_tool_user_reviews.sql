/*
  Real, publicly-submitted tool reviews (Trustpilot-style) — additive only.

  This is deliberately a NEW table, not an extension of `tool_reviews`:
  `tool_reviews` is editorial/curated CMS content (author_title, source,
  admin-authored quotes — see 20260710160000) with zero anon write access
  and zero rows in production. This table is the opposite shape: anyone can
  submit one, nothing is public until an admin approves it.

  Moderation model:
    - Anyone (anon) can INSERT a review, but only ever as status='pending' —
      the CHECK constraint on the WITH CHECK clause forces this, so a
      submitter can never self-publish.
    - Nobody (anon or authenticated) can SELECT the base table directly —
      `reviewer_email` exists for anti-spam/moderation contact only and must
      never be publicly queryable, and RLS is row-level (not column-level),
      so the only safe way to expose approved reviews publicly is a VIEW
      that omits the email column entirely and hard-filters to approved.
    - Only the admin-tool-reviews edge function (service-role key, gated by
      requireAdminSession) can read pending/rejected rows or change status —
      mirrors the existing admin-enrichment-review / agency-reviews-admin
      edge-function pattern used throughout this repo.
*/

CREATE TABLE IF NOT EXISTS tool_user_reviews (
  id             uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id        uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  reviewer_name  text NOT NULL,
  reviewer_email text,
  rating         smallint NOT NULL CHECK (rating >= 1 AND rating <= 5),
  title          text,
  body           text NOT NULL,
  status         text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_by    text,
  reviewed_at    timestamptz,
  created_at     timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_user_reviews_tool_id ON tool_user_reviews (tool_id, status);
CREATE INDEX IF NOT EXISTS idx_tool_user_reviews_status ON tool_user_reviews (status, created_at);

ALTER TABLE tool_user_reviews ENABLE ROW LEVEL SECURITY;

-- Public submission — forced to 'pending', and only against a real,
-- published tool (same guard pattern as tool_reviews_public_select).
DROP POLICY IF EXISTS "tool_user_reviews_public_insert" ON tool_user_reviews;
CREATE POLICY "tool_user_reviews_public_insert"
  ON tool_user_reviews FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    status = 'pending'
    AND reviewed_by IS NULL
    AND reviewed_at IS NULL
    AND EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_user_reviews.tool_id AND t.status = 'published')
  );

-- No SELECT/UPDATE/DELETE policy for anon/authenticated at all — the base
-- table is only ever read/written by the service-role admin edge function.
-- service_role bypasses RLS entirely, same as every other admin-moderated
-- table in this repo (agency_reviews, enrichment_field_suggestions, ...).

-- Public read surface: approved reviews only, no email column exposed.
-- Deliberately NOT security_invoker — anon has no SELECT policy on the base
-- table at all, so an invoker-rights view would return zero rows for them.
-- This runs as the view owner instead, which can see all rows, and the
-- WHERE clause below is the actual security boundary: it's baked into the
-- view definition, not re-evaluated per caller, so anon can only ever get
-- approved rows through this view no matter what they query it with.
CREATE OR REPLACE VIEW tool_user_reviews_public AS
SELECT id, tool_id, reviewer_name, rating, title, body, created_at
FROM tool_user_reviews
WHERE status = 'approved';

GRANT SELECT ON tool_user_reviews_public TO anon, authenticated;
