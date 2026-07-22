/*
  Two additive extensions to page_video_embeds (20260715050000):

  1. Multi-target embedding: one video can now be shown on several pages at
     once (e.g. a 3-tool comparison video also embedded on all 3 individual
     tool pages) instead of exactly one page_path per video. The existing
     page_path column on page_video_embeds stays as the video's PRIMARY
     path (nothing about existing rows changes), and a new join table lists
     every page it should render on — including that same primary path, so
     every lookup goes through one place.

  2. Real funnel analytics: impressions (video shown), clicks (user pressed
     play), views (existing view_count/increment_video_embed_view, kept
     exactly as-is), and cumulative seconds watched.
*/

CREATE TABLE IF NOT EXISTS page_video_embed_targets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  video_embed_id uuid NOT NULL REFERENCES page_video_embeds(id) ON DELETE CASCADE,
  page_path text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_page_video_embed_targets_path ON page_video_embed_targets (page_path);
CREATE INDEX IF NOT EXISTS idx_page_video_embed_targets_video_id ON page_video_embed_targets (video_embed_id);

-- Every existing video's own page_path becomes its first (primary) target,
-- so VideoEmbedSection can look up through this table alone from now on
-- without any change in behavior for what's already live today.
INSERT INTO page_video_embed_targets (video_embed_id, page_path)
SELECT id, page_path FROM page_video_embeds
ON CONFLICT (page_path) DO NOTHING;

ALTER TABLE page_video_embed_targets ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "page_video_embed_targets_public_select" ON page_video_embed_targets;
CREATE POLICY "page_video_embed_targets_public_select"
  ON page_video_embed_targets FOR SELECT
  TO anon, authenticated
  USING (true);

ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS impression_count integer NOT NULL DEFAULT 0;
ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS click_count integer NOT NULL DEFAULT 0;
ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS seconds_watched_total numeric NOT NULL DEFAULT 0;

CREATE OR REPLACE FUNCTION increment_video_embed_impression(p_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  UPDATE page_video_embeds SET impression_count = impression_count + 1 WHERE id = p_id AND is_active = true;
$$;

CREATE OR REPLACE FUNCTION increment_video_embed_click(p_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  UPDATE page_video_embeds SET click_count = click_count + 1 WHERE id = p_id AND is_active = true;
$$;

-- Incremental, not deduped (unlike impression/click/view) — every second
-- actually watched should add up, including repeat plays in the same or a
-- later session. p_seconds is bounded to a sane single-ping ceiling so a
-- stray client bug can't inflate the total in one call.
CREATE OR REPLACE FUNCTION add_video_embed_watch_seconds(p_id uuid, p_seconds numeric)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  UPDATE page_video_embeds
  SET seconds_watched_total = seconds_watched_total + LEAST(GREATEST(p_seconds, 0), 30)
  WHERE id = p_id AND is_active = true;
$$;

GRANT EXECUTE ON FUNCTION increment_video_embed_impression(uuid) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION increment_video_embed_click(uuid) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION add_video_embed_watch_seconds(uuid, numeric) TO anon, authenticated;
