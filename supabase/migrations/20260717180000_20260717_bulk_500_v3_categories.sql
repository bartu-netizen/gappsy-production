-- Bulk import v3 (500 more preselected software targets, batch 3) —
-- 5 genuinely new tool_categories rows for labels with no existing
-- equivalent (ERP suites, procurement/spend management, reputation
-- management, community forum platforms, podcast hosting), each with
-- enough real tools in this manifest to justify a dedicated category.
-- Category descriptions match the style/length of existing category rows
-- (see the follow-up description migration below, mirroring the pattern
-- from the first bulk-500 batch that required this for the prerender build).

INSERT INTO tool_categories (id, slug, name, status) VALUES ('00f06335-a253-4204-b2ee-d67b6ff99ecd', $q$erp$q$, $q$ERP & Business Management$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('4cae9914-301b-46ed-8ed5-f254e1406452', $q$procurement$q$, $q$Procurement & Spend Management$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('8528fb60-d454-4bd7-badc-5d06c8a47095', $q$reputation-management$q$, $q$Reputation Management$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('30f9f187-2974-430d-9da4-d1ca25a9d417', $q$community$q$, $q$Community Platforms$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('c0f1759c-8d45-4053-8629-f6f132784fb7', $q$podcast-hosting$q$, $q$Podcast Hosting$q$, 'published') ON CONFLICT (slug) DO NOTHING;
