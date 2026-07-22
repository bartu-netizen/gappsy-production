-- Bulk import v6 (500 more preselected software targets, batch 6, heavy
-- Awesome-Selfhosted / open-source mix) — 2 genuinely new tool_categories
-- rows for clusters with no existing equivalent (game engines/servers/admin
-- panels, and IoT/home-automation platforms), each with enough real tools
-- in this manifest (28, 17 respectively) to justify a dedicated category.

INSERT INTO tool_categories (id, slug, name, status) VALUES ('16f06c25-6ff1-4576-840e-5385076b83e0', $q$gaming$q$, $q$Gaming & Game Servers$q$, 'published') ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_categories (id, slug, name, status) VALUES ('08b895d0-d3c9-433c-a055-7a0f640cb485', $q$iot$q$, $q$Internet of Things (IoT) & Home Automation$q$, 'published') ON CONFLICT (slug) DO NOTHING;
