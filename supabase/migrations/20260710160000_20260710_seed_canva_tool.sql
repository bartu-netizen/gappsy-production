/*
  # Seed the Canva flagship tool listing

  Populates the first real row in `tools` (Canva), plus its category/tag
  links, pricing plans, and integrations — using only facts that are
  broadly-documented and publicly known about the real product. Idempotent:
  ON CONFLICT (slug) DO NOTHING for the tools row, ON CONFLICT (tool_id,
  category_id) / (tool_id, tag_id) DO NOTHING for the junction tables, and
  NOT EXISTS guards for tool_pricing_plans / tool_integrations (no unique
  constraint on those tables to key an ON CONFLICT off).

  Intentionally left empty for now (no real asset/data available — see the
  "Recommended Database Improvements" note that accompanies this feature):
  - logo, affiliate_link on the tools row (no verified logo asset or
    affiliate program URL to link to; the existing fallback-avatar UI
    already handles a missing logo).
  - tool_screenshots (no real screenshot assets to host).
  - tool_updates (no dated changelog facts confident enough to state).
  - youtube_url (no single official Canva video I could verify with
    confidence as authoritative).

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
  'canva',
  'Canva',
  NULL,
  'https://www.canva.com',
  NULL,
  'The all-in-one design platform for creating social posts, presentations, videos, and printed materials — no design experience required.',
  'Canva is a browser-based design platform that lets anyone create social media graphics, presentations, videos, documents, and printed products without traditional design software or training. Since launching in 2013, it has grown from a simple template editor into a full visual content platform, anchored by a massive template library, a Brand Kit for team consistency, and Magic Studio, Canva''s suite of AI-assisted design, writing, and image/video tools.

Canva is best suited to small businesses, marketers, educators, and non-design teams who need to produce professional-looking content quickly. Professional designers doing detailed vector work or complex print production typically still rely on dedicated tools like Adobe Illustrator or Affinity Designer (which Canva itself acquired in 2024) alongside it.

Pricing follows a freemium model: a genuinely usable Free plan, a Pro plan for individuals, a Teams plan with brand governance for organizations, and custom Enterprise pricing with SSO and advanced admin controls.',
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
-- tool_category_links (primary: Design; secondary: Graphic Design, Video
-- Editing, Website Builders, Photo Editing)
-- ─────────────────────────────────────────────
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT t.id, c.id, (c.slug = 'design')
FROM tools t
JOIN tool_categories c ON c.slug IN ('design', 'graphic-design', 'video-editing', 'website-builders', 'photo-editing')
WHERE t.slug = 'canva'
ON CONFLICT (tool_id, category_id) DO NOTHING;

-- ─────────────────────────────────────────────
-- tool_tag_links
-- ─────────────────────────────────────────────
INSERT INTO tool_tag_links (tool_id, tag_id)
SELECT t.id, g.id
FROM tools t
JOIN tool_tags g ON g.slug IN (
  'ai', 'generative-ai', 'image-generation', 'video-generation', 'no-code',
  'freemium', 'free-plan', 'free-trial', 'subscription',
  'cloud', 'saas', 'browser-based', 'web-app', 'mobile-app', 'desktop-app',
  'ios', 'android', 'mac', 'windows', 'chrome-extension',
  'real-time-collaboration', 'team-management', 'templates', 'content-creation', 'copywriting',
  'enterprise', 'smb', 'startup', 'agencies',
  'integrations', 'api', 'multilingual'
)
WHERE t.slug = 'canva'
ON CONFLICT (tool_id, tag_id) DO NOTHING;

-- ─────────────────────────────────────────────
-- tool_pricing_plans
-- ─────────────────────────────────────────────
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Free', '$0', 'forever', 'For individuals just getting started with design.',
  '["250,000+ free templates", "5GB cloud storage", "Basic Magic Studio AI credits", "1 user"]'::jsonb, 0
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Free');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Pro', '$12.99', '/month', 'Full template and stock library with AI-powered design tools, for individuals.',
  '["Full template & premium element library", "Brand Kit", "Background Remover", "Expanded Magic Studio AI credits", "100GB cloud storage"]'::jsonb, 1
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Pro');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Teams', 'From $10', '/month per person', 'Everything in Pro, plus brand governance for growing teams.',
  '["Everything in Pro", "Brand template locking", "Approval workflows", "Centralized billing & admin", "Unlimited cloud storage"]'::jsonb, 2
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Teams');

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order)
SELECT t.id, 'Enterprise', 'Custom', 'Contact sales', 'Advanced security and admin controls for large organizations.',
  '["Everything in Teams", "SSO / SAML", "Advanced admin & security controls", "Dedicated support"]'::jsonb, 3
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_pricing_plans p WHERE p.tool_id = t.id AND p.plan_name = 'Enterprise');

-- ─────────────────────────────────────────────
-- tool_integrations (real, well-known official Canva integrations only)
-- ─────────────────────────────────────────────
INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Google Drive', 'google-drive', NULL, 'Import and save designs directly from Google Drive.'
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Google Drive');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Dropbox', 'dropbox', NULL, 'Import files from Dropbox straight into the Canva editor.'
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Dropbox');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Slack', 'slack', NULL, 'Share and receive feedback on designs directly in Slack.'
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Slack');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'HubSpot', 'hubspot', NULL, 'Publish Canva designs directly into HubSpot marketing campaigns.'
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'HubSpot');

INSERT INTO tool_integrations (tool_id, integration_name, integration_slug, integration_logo, description)
SELECT t.id, 'Mailchimp', 'mailchimp', NULL, 'Send Canva-designed graphics straight into Mailchimp email campaigns.'
FROM tools t WHERE t.slug = 'canva'
AND NOT EXISTS (SELECT 1 FROM tool_integrations i WHERE i.tool_id = t.id AND i.integration_name = 'Mailchimp');
