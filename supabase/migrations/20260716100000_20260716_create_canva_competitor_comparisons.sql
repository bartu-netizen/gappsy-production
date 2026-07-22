-- Creates the 4 remaining Canva head-to-head comparison pages, matching
-- the canonical slug convention the admin-tool-comparisons edge function
-- already enforces (resolveCanonicalPair: alphabetically-smaller-slug +
-- "-vs-" + alphabetically-larger-slug). Published immediately — the tools
-- involved (see 20260716090000) already meet first-publish content depth.
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status) VALUES
  ('7e8227b7-0e90-46d7-92df-86b14a774f8a', '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', 'canva-vs-photoshop', 'published'),
  ('4c800b98-87da-4392-80f8-cc8ac66f95be', '7e8227b7-0e90-46d7-92df-86b14a774f8a', 'adobe-express-vs-canva', 'published'),
  ('7e8227b7-0e90-46d7-92df-86b14a774f8a', '51700cc4-8231-4396-a091-85f93678ab53', 'canva-vs-vistacreate', 'published'),
  ('7e8227b7-0e90-46d7-92df-86b14a774f8a', '3f7e295f-cbc2-49fa-af99-9d4aa080d1b3', 'canva-vs-microsoft-designer', 'published')
ON CONFLICT (slug) DO NOTHING;
