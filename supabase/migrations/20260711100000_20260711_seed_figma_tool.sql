/*
  # Seed the Figma tool listing

  Populates the second real row in `tools` (Figma), plus its category/tag
  links, pricing plans, and integrations — using only facts that are
  broadly-documented and publicly known about the real product. Idempotent:
  ON CONFLICT (slug) DO NOTHING for the tools row, ON CONFLICT (tool_id,
  category_id) / (tool_id, tag_id) DO NOTHING for the junction tables, and
  NOT EXISTS guards for tool_pricing_plans / tool_integrations (no unique
  constraint on those tables to key an ON CONFLICT off) — same pattern as
  20260710160000_20260710_seed_canva_tool.sql.

  Intentionally left empty for now (no real asset/data available):
  - logo, affiliate_link on the tools row (no verified logo asset or
    affiliate program URL to link to).
  - tool_screenshots (no real screenshot assets to host).
  - tool_updates (no dated changelog facts confident enough to state).
  - youtube_url (no single official Figma video verifiable as authoritative).

  review_count is left at 0 (Gappsy has not collected any reviews yet);
  `rating` is a defensible editorial estimate, not a fabricated review
  count — the UI only shows "(N reviews)" when review_count > 0.
*/

-- ─────────────────────────────────────────────
-- tools
-- ─────────────────────────────────────────────
INSERT INTO tools (
  slug, name, logo, website, affiliate_link, short_description, long_description,
  pricing_model, starting_price, youtube_url, verified, featured, rating, review_count, status
) VALUES (
  'figma',
  'Figma',
  NULL,
  'https://www.figma.com',
  NULL,
  'A browser-based, real-time collaborative interface design tool for designing, prototyping, and shipping digital products.',
  'Figma is a browser-based interface design tool built around real-time, multiplayer editing — multiple people can work in the same file at the same time, similar to how Google Docs changed collaborative writing. Founded in 2012 and launched publicly in 2016, it became the default tool for product design teams by getting designers, product managers, and engineers looking at the same file, live, without exporting or emailing anything.

What started as a UI design tool has expanded into a broader product-design platform: FigJam for whiteboarding, Dev Mode for developer handoff, Figma Slides for presentations, Figma Sites for publishing simple websites, and Figma Make for generating working prototypes from a text prompt. In late 2023, Adobe''s roughly $20 billion agreement to acquire Figma was called off after regulatory opposition in the UK and EU, and Figma went on to complete an IPO on the New York Stock Exchange in 2025 as an independent public company.

Figma is best suited to product and UI/UX designers and the cross-functional teams around them. It is not a general-purpose graphic design or print tool — someone who mainly needs social posts, flyers, or printed materials is better served by a template-first tool like Canva.

Pricing follows a freemium, per-seat model: a free Starter plan, a Professional plan for a single team workspace, an Organization plan with design-system analytics and branching, and custom Enterprise pricing with SSO and advanced admin controls.',
  'Freemium',
  '$0',
  NULL,
  true,
  true,
  4.7,
  0,
  'published'
)
ON CONFLICT (slug) DO NOTHING;

-- ─────────────────────────────────────────────
-- tool_category_links (primary: Design; secondary: Graphic Design,
-- Collaboration — no dedicated UI/UX or prototyping category exists in the
-- current taxonomy, so Design is the correct primary fit)
-- ─────────────────────────────────────────────
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT t.id, c.id, (c.slug = 'design')
FROM tools t
JOIN tool_categories c ON c.slug IN ('design', 'graphic-design', 'collaboration')
WHERE t.slug = 'figma'
ON CONFLICT (tool_id, category_id) DO NOTHING;

-- ─────────────────────────────────────────────
-- tool_tag_links
-- ─────────────────────────────────────────────
INSERT INTO tool_tag_links (tool_id, tag_id)
SELECT t.id, g.id
FROM tools t
JOIN tool_tags g ON g.slug IN (
  'ai', 'generative-ai', 'no-code',
  'freemium', 'free-plan', 'free-trial', 'subscription',
  'cloud', 'saas', 'browser-based', 'web-app', 'mobile-app', 'desktop-app',
  'ios', 'android', 'mac', 'windows',
  'real-time-collaboration', 'team-management', 'templates', 'content-creation',
  'enterprise', 'smb', 'startup', 'agencies', 'freelancers',
  'integrations', 'api', 'soc-2-compliant'
)
WHERE t.slug = 'figma'
ON CONFLICT (tool_id, tag_id) DO NOTHING;

-- ─────────────────────────────────────────────
-- tool_pricing_plans
-- ─────────────────────────────────────────────
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Starter', '$0', 'forever', 'For individuals and small teams just getting started.',
  '["3 Figma design files + 3 FigJam boards", "Unlimited personal files", "Core design & prototyping tools", "Up to 2 editors per file"]'::jsonb, 0
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Starter');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Professional', 'From $12', '/editor/month', 'Unlimited files and version history for a single team workspace.',
  '["Unlimited files and projects", "Unlimited version history", "Team libraries", "Audio and video conversations"]'::jsonb, 1
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Professional');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Organization', 'From $45', '/editor/month', 'Design-system analytics, branching, and org-wide governance.',
  '["Everything in Professional", "Design system analytics", "Branching & merging", "Private plugins & widgets", "Advanced permissions"]'::jsonb, 2
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Organization');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Enterprise', 'Custom', 'Contact sales', 'Advanced security, admin, and compliance controls for large organizations.',
  '["Everything in Organization", "SSO / SAML", "EU data residency options", "Dedicated support"]'::jsonb, 3
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Enterprise');

-- ─────────────────────────────────────────────
-- tool_integrations (real, well-known official Figma integrations only)
-- ─────────────────────────────────────────────
INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Slack', 'slack', NULL, 'Get file update and comment notifications directly in Slack.'
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Slack');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Jira', 'jira', NULL, 'Link Figma files and frames directly to Jira issues.'
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Jira');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Notion', 'notion', NULL, 'Embed live Figma files directly inside Notion pages.'
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Notion');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Storybook', 'storybook', NULL, 'Connect Figma components to their corresponding Storybook stories.'
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Storybook');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Zoom', 'zoom', NULL, 'Share and co-edit Figma files directly inside a Zoom meeting.'
FROM tools t WHERE t.slug = 'figma'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Zoom');
