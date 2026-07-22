-- Bulk import of 500 preselected software targets (monetization-first list:
-- 50 Traffic Anchors, 300 Monetization Targets, 150 Emerging Opportunities).
-- Fully additive: 4 new tool_categories rows for labels with no existing
-- equivalent, plus a new tool_strategic_metadata table to record each
-- tool's strategic segment and traffic/SEO/paid-listing scores from this
-- list without touching any existing tools column.

INSERT INTO tool_categories (id, slug, name, status) VALUES ('6d8c748b-f4fc-42af-a356-70648169e699', $q$documents-esignature$q$, $q$Documents & E-signature$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('4414d2af-4c22-4dc9-9ebd-90255b64cdb0', $q$healthcare$q$, $q$Healthcare & Wellness$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('40ca42a7-3ae4-46bd-a008-ded14a786c8f', $q$field-service$q$, $q$Real Estate, Construction & Field Service$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('287e93c4-ff45-4015-a442-e900e992f070', $q$retail-pos$q$, $q$Retail, Restaurant & POS$q$, 'published') ON CONFLICT (slug) DO NOTHING;

-- One row per tool that appeared on the 500-target list — for genuinely
-- new tools, tool_id points at the new draft/needs_review row created in
-- the companion seed migration; for names that matched an EXISTING tool
-- (see the duplicate report), tool_id points at that existing tool instead,
-- so the strategic signal isn't just discarded. Admin-only: no public SELECT
-- policy, matching the tool_import_history convention for internal-only data.
CREATE TABLE IF NOT EXISTS tool_strategic_metadata (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id             uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE UNIQUE,
  strategic_segment   text NOT NULL CHECK (strategic_segment IN ('traffic_anchor', 'monetization_target', 'emerging_opportunity')),
  traffic_score       smallint NOT NULL CHECK (traffic_score BETWEEN 0 AND 10),
  seo_score           smallint NOT NULL CHECK (seo_score BETWEEN 0 AND 10),
  paid_listing_score  smallint NOT NULL CHECK (paid_listing_score BETWEEN 0 AND 10),
  source_category_label text,
  list_rank           integer,
  import_batch        text NOT NULL DEFAULT 'gappsy-500-2026-07',
  created_at          timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_strategic_metadata_segment ON tool_strategic_metadata (strategic_segment);

ALTER TABLE tool_strategic_metadata ENABLE ROW LEVEL SECURITY;
-- Deliberately no policies: admin/service-role only, same convention as
-- tool_import_history.
