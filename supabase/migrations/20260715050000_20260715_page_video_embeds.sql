/*
  Video embeds (YouTube / YouTube Shorts) placed on specific pages by path,
  managed from /wp-admin — additive only.

  `page_video_embeds` already existed in the linked database (id, page_path,
  youtube_video_id, hero_mode, title, is_active, created_at, updated_at) but
  had zero rows, no code referencing it anywhere in this repo, and no
  migration file tracking it — apparently scaffolded once and abandoned.
  Its write RLS policies also target Supabase Auth's `authenticated` role,
  which isn't how admin writes work anywhere else in this app (the
  /wp-admin session system is a custom shared-secret + opaque token, not
  Supabase Auth — every other admin-moderated table in this repo is written
  via a service-role edge function gated by requireAdminSession). Rather
  than a second, inconsistent table, this migration extends the existing
  one additively and leaves those old policies in place (harmless — they
  grant nothing to anon, and the admin-video-embeds edge function uses the
  service role, which bypasses RLS regardless).

  Moderation model mirrors tool_user_reviews: public reads go straight
  through RLS restricted to active rows (same convention as
  tool_screenshots); every admin write goes through the edge function.
  View counting is the one write anon needs, scoped to exactly that via a
  SECURITY DEFINER function rather than a broad UPDATE grant.
*/

ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS youtube_url text;
ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS is_short boolean NOT NULL DEFAULT false;
ALTER TABLE page_video_embeds ADD COLUMN IF NOT EXISTS view_count integer NOT NULL DEFAULT 0;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'page_video_embeds_page_path_key'
  ) THEN
    ALTER TABLE page_video_embeds ADD CONSTRAINT page_video_embeds_page_path_key UNIQUE (page_path);
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_page_video_embeds_path ON page_video_embeds (page_path) WHERE is_active = true;

DROP POLICY IF EXISTS "page_video_embeds_public_select" ON page_video_embeds;
CREATE POLICY "page_video_embeds_public_select"
  ON page_video_embeds FOR SELECT
  TO anon, authenticated
  USING (is_active = true);

CREATE OR REPLACE FUNCTION increment_video_embed_view(p_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  UPDATE page_video_embeds SET view_count = view_count + 1 WHERE id = p_id AND is_active = true;
$$;

GRANT EXECUTE ON FUNCTION increment_video_embed_view(uuid) TO anon, authenticated;
