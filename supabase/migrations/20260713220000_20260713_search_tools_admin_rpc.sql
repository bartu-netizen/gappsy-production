/*
  # search_tools_admin — editor-facing search across every status

  search_software (20260711120000) is public-facing and hardcodes
  `WHERE status = 'published'` in every branch — exactly right for the
  public search box, wrong for an editor who needs to find a draft,
  needs_review, or ready_to_publish tool just as easily as a published
  one. This mirrors its tiered exact/prefix/contains scoring (minus the
  richer public-display fields the storefront needs) without the status
  filter, so editors get the same fast, ranked search over name/slug/
  short_description regardless of where a tool sits in the pipeline.
*/

CREATE OR REPLACE FUNCTION public.search_tools_admin(
  query_text TEXT,
  max_results INT DEFAULT 20
)
RETURNS TABLE (
  id                   UUID,
  slug                 TEXT,
  name                 TEXT,
  status               TEXT,
  short_description    TEXT,
  completeness_percent INTEGER,
  quality_score        INTEGER,
  updated_at           TIMESTAMPTZ,
  match_type           TEXT,
  score                NUMERIC
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
  t_exact AS (
    SELECT t.id, t.slug, t.name, t.status, t.short_description, t.completeness_percent, t.quality_score, t.updated_at,
           'exact' AS mtype, 100.0 AS mscore
    FROM tools t
    WHERE LOWER(t.name) = q OR t.slug = q
  ),
  t_prefix AS (
    SELECT t.id, t.slug, t.name, t.status, t.short_description, t.completeness_percent, t.quality_score, t.updated_at,
           'prefix' AS mtype, 90.0 - LEAST((LENGTH(t.name) - LENGTH(q))::NUMERIC * 0.1, 20.0) AS mscore
    FROM tools t
    WHERE LOWER(t.name) LIKE q || '%' AND t.id NOT IN (SELECT id FROM t_exact)
  ),
  t_contains AS (
    SELECT t.id, t.slug, t.name, t.status, t.short_description, t.completeness_percent, t.quality_score, t.updated_at,
           'contains' AS mtype, 75.0 AS mscore
    FROM tools t
    WHERE LOWER(t.name) LIKE '%' || q || '%'
      AND t.id NOT IN (SELECT id FROM t_exact) AND t.id NOT IN (SELECT id FROM t_prefix)
  ),
  t_keyword AS (
    SELECT t.id, t.slug, t.name, t.status, t.short_description, t.completeness_percent, t.quality_score, t.updated_at,
           'keyword' AS mtype, 55.0 AS mscore
    FROM tools t
    WHERE t.short_description IS NOT NULL AND LOWER(t.short_description) LIKE '%' || q || '%'
      AND t.id NOT IN (SELECT id FROM t_exact) AND t.id NOT IN (SELECT id FROM t_prefix) AND t.id NOT IN (SELECT id FROM t_contains)
  )
  SELECT m.id, m.slug, m.name, m.status, m.short_description, m.completeness_percent, m.quality_score, m.updated_at, m.mtype, m.mscore
  FROM (
    SELECT * FROM t_exact
    UNION ALL SELECT * FROM t_prefix
    UNION ALL SELECT * FROM t_contains
    UNION ALL SELECT * FROM t_keyword
  ) m
  ORDER BY m.mscore DESC, m.name ASC
  LIMIT max_results;
END;
$$;
