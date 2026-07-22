-- Replace the fake external "ad" sidebar cards (Chargeback.io, WaitforIt,
-- Mediaboost, Newsletters.ai, Guidejar) with real, in-depth Gappsy tool
-- pages, linked internally instead of out to third-party sites. Leaves the
-- Gappsy Appbuilder/Proof/Analytics and Vazagency rows untouched, and fixes
-- "Get Featured Here" to point at /feature-my-product instead of /about.
-- Purely a data update (sidebar_ads is already an editable table via the
-- /wp-admin sidebar-ads-update flow) — no schema change.

UPDATE sidebar_ads SET
  logo_url = 'https://www.google.com/s2/favicons?domain=miro.com&sz=256',
  title = 'Miro',
  subtitle = 'Visual whiteboard for team collaboration',
  target_url = '/tools/miro',
  updated_at = NOW()
WHERE id = 'left-4';

UPDATE sidebar_ads SET
  logo_url = 'https://www.google.com/s2/favicons?domain=www.notion.com&sz=256',
  title = 'Notion',
  subtitle = 'One workspace for notes, docs & projects',
  target_url = '/tools/notion',
  updated_at = NOW()
WHERE id = 'left-5';

UPDATE sidebar_ads SET
  logo_url = 'https://www.google.com/s2/favicons?domain=webflow.com&sz=256',
  title = 'Webflow',
  subtitle = 'Design and launch sites without code',
  target_url = '/tools/webflow',
  updated_at = NOW()
WHERE id = 'right-2';

UPDATE sidebar_ads SET
  logo_url = 'https://www.google.com/s2/favicons?domain=www.figma.com&sz=256',
  title = 'Figma',
  subtitle = 'Design and prototype together in real time',
  target_url = '/tools/figma',
  updated_at = NOW()
WHERE id = 'right-3';

UPDATE sidebar_ads SET
  logo_url = 'https://www.google.com/s2/favicons?domain=www.adobe.com&sz=256',
  title = 'Adobe Photoshop',
  subtitle = 'The industry standard for photo editing',
  target_url = '/tools/photoshop',
  updated_at = NOW()
WHERE id = 'right-4';

UPDATE sidebar_ads SET
  target_url = '/feature-my-product',
  updated_at = NOW()
WHERE id = 'right-5';
