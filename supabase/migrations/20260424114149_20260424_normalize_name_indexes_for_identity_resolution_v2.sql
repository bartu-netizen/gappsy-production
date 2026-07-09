/*
  # Add strict name normalizer + stored column + indexes for identity resolution
  - New function `normalize_agency_name_strict(p_name text)` (IMMUTABLE) strips corp suffixes.
  - Stored generated column `other_agencies.name_norm` uses the strict normalizer.
  - Btree and pg_trgm GIN indexes for exact and fuzzy lookups.
*/

CREATE OR REPLACE FUNCTION public.normalize_agency_name_strict(p_name text)
RETURNS text
LANGUAGE sql
IMMUTABLE
PARALLEL SAFE
SET search_path TO 'public', 'extensions', 'pg_temp'
AS $$
  SELECT NULLIF(
    regexp_replace(
      regexp_replace(
        lower(trim(COALESCE(p_name, ''))),
        '\s+(llc|l\.l\.c\.|inc|inc\.|ltd|ltd\.|corp|corp\.|co|co\.|pllc|pc|p\.c\.|gmbh|ag|sa|nv|bv)\b', '', 'g'
      ),
      '[^a-z0-9 ]+', '', 'g'
    ),
    ''
  );
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'other_agencies' AND column_name = 'name_norm'
  ) THEN
    ALTER TABLE public.other_agencies
      ADD COLUMN name_norm text GENERATED ALWAYS AS (public.normalize_agency_name_strict(name)) STORED;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_other_agencies_name_norm
  ON public.other_agencies (name_norm)
  WHERE name_norm IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_other_agencies_name_norm_state
  ON public.other_agencies (name_norm, state_slug)
  WHERE name_norm IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_other_agencies_name_norm_trgm
  ON public.other_agencies
  USING gin (name_norm extensions.gin_trgm_ops)
  WHERE name_norm IS NOT NULL;
