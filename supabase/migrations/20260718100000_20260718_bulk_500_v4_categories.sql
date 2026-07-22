-- Bulk import v4 (500 more preselected software targets, batch 4, heavy
-- open-source/self-hosted mix) — 3 genuinely new tool_categories rows for
-- clusters with no existing equivalent (dedicated time-tracking apps,
-- self-hosted media/audio/streaming servers, and the AI infrastructure /
-- MLOps / observability tooling cluster), each with enough real tools in
-- this manifest (11, 23, 34 respectively) to justify a dedicated category.
-- Category descriptions match the style/length of existing category rows
-- (see the follow-up description migration below, mirroring the pattern
-- from the first bulk-500 batch that required this for the prerender build).

INSERT INTO tool_categories (id, slug, name, status) VALUES ('2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', $q$time-tracking$q$, $q$Time Tracking$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('486a4d0b-3e98-4c9a-b3f9-f35581438a1b', $q$media-tools$q$, $q$Media & Audio/Video Tools$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('929b2e83-272f-462b-9290-df5152725e29', $q$ai-infrastructure$q$, $q$AI Infrastructure & MLOps$q$, 'published') ON CONFLICT (slug) DO NOTHING;
