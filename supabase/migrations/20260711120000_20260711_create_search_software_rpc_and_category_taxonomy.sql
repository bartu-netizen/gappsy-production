/*
  # Global software search RPC + trigram indexes

  ## Overview
  Fully additive, search-only. Adds:
  1. Trigram GIN indexes on `tools.name`, `tool_categories.name`, `tool_tags.name` for
     fast partial-match search at scale (mirrors the existing
     `idx_pasm_name_trgm` pattern used by `public_agency_search_mv`).
  2. `search_software(query_text, max_results)` — a single RPC that ranks tools,
     categories, and tags together for the header command-palette search. Mirrors the
     existing `search_agencies_robust` shape: `SECURITY DEFINER`,
     `SET search_path = public, extensions`, tiered exact/prefix/contains scoring,
     explicit `status = 'published'` filtering in the function body (not RLS-reliant).

  No existing table, column, row, policy, or function is modified, dropped, or repaired.
  Nothing outside search (no tool_categories schema changes) is included here.

  Uses `#variable_conflict use_column` because `RETURNS TABLE` column names
  (slug, name, result_type, score, ...) are otherwise also visible as PL/pgSQL
  variables inside the function body, which collides with same-named query
  columns referenced bare in subqueries/ORDER BY (e.g. `NOT IN (SELECT slug
  FROM tool_exact)`). `search_agencies_robust` avoids this by prefixing every
  OUT column `out_*`; this pragma is the equivalent fix without renaming.
*/

-- ─────────────────────────────────────────────
-- 1. Trigram indexes for partial/fuzzy name search
-- ─────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_tools_name_trgm ON tools USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_tool_categories_name_trgm ON tool_categories USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_tool_tags_name_trgm ON tool_tags USING gin (name gin_trgm_ops);

-- ─────────────────────────────────────────────
-- 2. search_software RPC
-- ─────────────────────────────────────────────
DROP FUNCTION IF EXISTS public.search_software(TEXT, INT);

CREATE OR REPLACE FUNCTION public.search_software(
  query_text TEXT,
  max_results INT DEFAULT 6
)
RETURNS TABLE (
  result_type            TEXT,
  slug                   TEXT,
  name                   TEXT,
  subtitle               TEXT,
  logo                   TEXT,
  primary_category_name  TEXT,
  pricing_model          TEXT,
  starting_price         TEXT,
  rating                 NUMERIC,
  review_count           INTEGER,
  verified               BOOLEAN,
  featured               BOOLEAN,
  match_type             TEXT,
  score                  NUMERIC
) LANGUAGE plpgsql SECURITY DEFINER
SET search_path = public, extensions
AS $$
#variable_conflict use_column
DECLARE
  q TEXT;
BEGIN
  q := LOWER(TRIM(REGEXP_REPLACE(query_text, '\s+', ' ', 'g')));

  IF LENGTH(q) < 2 THEN
    RETURN;
  END IF;

  RETURN QUERY
  WITH
  tool_exact AS (
    SELECT t.id, t.slug, t.name, t.short_description AS subtitle, t.logo, t.pricing_model,
           t.starting_price, t.rating, t.review_count, t.verified, t.featured,
           'exact' AS mtype, 100.0 AS mscore
    FROM tools t
    WHERE t.status = 'published' AND (LOWER(t.name) = q OR t.slug = q)
  ),
  tool_prefix AS (
    SELECT t.id, t.slug, t.name, t.short_description AS subtitle, t.logo, t.pricing_model,
           t.starting_price, t.rating, t.review_count, t.verified, t.featured,
           'prefix' AS mtype, 90.0 - LEAST((LENGTH(t.name) - LENGTH(q))::NUMERIC * 0.1, 20.0) AS mscore
    FROM tools t
    WHERE t.status = 'published' AND LOWER(t.name) LIKE q || '%'
      AND t.slug NOT IN (SELECT slug FROM tool_exact)
  ),
  tool_contains AS (
    SELECT t.id, t.slug, t.name, t.short_description AS subtitle, t.logo, t.pricing_model,
           t.starting_price, t.rating, t.review_count, t.verified, t.featured,
           'contains' AS mtype, 75.0 AS mscore
    FROM tools t
    WHERE t.status = 'published' AND LOWER(t.name) LIKE '%' || q || '%'
      AND t.slug NOT IN (SELECT slug FROM tool_exact)
      AND t.slug NOT IN (SELECT slug FROM tool_prefix)
  ),
  tool_keyword AS (
    SELECT t.id, t.slug, t.name, t.short_description AS subtitle, t.logo, t.pricing_model,
           t.starting_price, t.rating, t.review_count, t.verified, t.featured,
           'keyword' AS mtype, 55.0 AS mscore
    FROM tools t
    WHERE t.status = 'published' AND t.short_description IS NOT NULL
      AND LOWER(t.short_description) LIKE '%' || q || '%'
      AND t.slug NOT IN (SELECT slug FROM tool_exact)
      AND t.slug NOT IN (SELECT slug FROM tool_prefix)
      AND t.slug NOT IN (SELECT slug FROM tool_contains)
  ),
  tool_matches AS (
    SELECT * FROM tool_exact
    UNION ALL SELECT * FROM tool_prefix
    UNION ALL SELECT * FROM tool_contains
    UNION ALL SELECT * FROM tool_keyword
    ORDER BY mscore DESC
    LIMIT max_results
  ),
  tool_final AS (
    SELECT
      tm.slug, tm.name, tm.subtitle, tm.logo,
      (
        SELECT c.name FROM tool_category_links l
        JOIN tool_categories c ON c.id = l.category_id AND c.status = 'published'
        WHERE l.tool_id = tm.id AND l.primary_category = true
        LIMIT 1
      ) AS primary_category_name,
      tm.pricing_model, tm.starting_price, tm.rating, tm.review_count, tm.verified,
      tm.featured, tm.mtype, tm.mscore
    FROM tool_matches tm
  ),
  category_exact AS (
    SELECT c.slug, c.name, c.description AS subtitle, 'exact' AS mtype, 100.0 AS mscore
    FROM tool_categories c
    WHERE c.status = 'published' AND (LOWER(c.name) = q OR c.slug = q)
  ),
  category_prefix AS (
    SELECT c.slug, c.name, c.description AS subtitle, 'prefix' AS mtype,
           90.0 - LEAST((LENGTH(c.name) - LENGTH(q))::NUMERIC * 0.1, 20.0) AS mscore
    FROM tool_categories c
    WHERE c.status = 'published' AND LOWER(c.name) LIKE q || '%'
      AND c.slug NOT IN (SELECT slug FROM category_exact)
  ),
  category_contains AS (
    SELECT c.slug, c.name, c.description AS subtitle, 'contains' AS mtype, 75.0 AS mscore
    FROM tool_categories c
    WHERE c.status = 'published' AND LOWER(c.name) LIKE '%' || q || '%'
      AND c.slug NOT IN (SELECT slug FROM category_exact)
      AND c.slug NOT IN (SELECT slug FROM category_prefix)
  ),
  category_final AS (
    SELECT * FROM category_exact
    UNION ALL SELECT * FROM category_prefix
    UNION ALL SELECT * FROM category_contains
    ORDER BY mscore DESC
    LIMIT max_results
  ),
  tag_exact AS (
    SELECT g.slug, g.name, g.description AS subtitle, 'exact' AS mtype, 100.0 AS mscore
    FROM tool_tags g
    WHERE LOWER(g.name) = q OR g.slug = q
  ),
  tag_prefix AS (
    SELECT g.slug, g.name, g.description AS subtitle, 'prefix' AS mtype,
           90.0 - LEAST((LENGTH(g.name) - LENGTH(q))::NUMERIC * 0.1, 20.0) AS mscore
    FROM tool_tags g
    WHERE LOWER(g.name) LIKE q || '%'
      AND g.slug NOT IN (SELECT slug FROM tag_exact)
  ),
  tag_contains AS (
    SELECT g.slug, g.name, g.description AS subtitle, 'contains' AS mtype, 75.0 AS mscore
    FROM tool_tags g
    WHERE LOWER(g.name) LIKE '%' || q || '%'
      AND g.slug NOT IN (SELECT slug FROM tag_exact)
      AND g.slug NOT IN (SELECT slug FROM tag_prefix)
  ),
  tag_final AS (
    SELECT * FROM tag_exact
    UNION ALL SELECT * FROM tag_prefix
    UNION ALL SELECT * FROM tag_contains
    ORDER BY mscore DESC
    LIMIT max_results
  ),
  combined AS (
    SELECT 'tool'::text AS result_type, tf.slug, tf.name, tf.subtitle, tf.logo, tf.primary_category_name,
           tf.pricing_model, tf.starting_price, tf.rating, tf.review_count, tf.verified,
           tf.featured, tf.mtype AS match_type, tf.mscore AS score
    FROM tool_final tf
    UNION ALL
    SELECT 'category', cf.slug, cf.name, cf.subtitle, NULL, NULL,
           NULL, NULL, NULL, NULL, NULL,
           NULL::boolean, cf.mtype, cf.mscore
    FROM category_final cf
    UNION ALL
    SELECT 'tag', gf.slug, gf.name, gf.subtitle, NULL, NULL,
           NULL, NULL, NULL, NULL, NULL,
           NULL::boolean, gf.mtype, gf.mscore
    FROM tag_final gf
  )
  SELECT * FROM combined
  ORDER BY CASE result_type WHEN 'tool' THEN 0 WHEN 'category' THEN 1 ELSE 2 END, score DESC;
END $$;

GRANT EXECUTE ON FUNCTION public.search_software TO anon, authenticated;
