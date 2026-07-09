/*
  Add missing states to state_pages table

  This SQL adds all the states that have JSON files/logo folders
  but haven't been imported via the JSON importer yet.

  States added:
  - Rhode Island
  - South Carolina
  - South Dakota
  - Tennessee
  - Utah
  - Vermont
  - Washington
  - West Virginia
  - Wyoming

  After running this SQL, all these states will immediately appear
  in the /admin/logo-upload dropdown.
*/

-- Rhode Island
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'rhode-island',
  'Rhode Island',
  '/marketing-agencies-in-rhode-island-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-rhode-island-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- South Carolina
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'south-carolina',
  'South Carolina',
  '/marketing-agencies-in-south-carolina-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-south-carolina-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- South Dakota
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'south-dakota',
  'South Dakota',
  '/marketing-agencies-in-south-dakota-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-south-dakota-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Tennessee
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'tennessee',
  'Tennessee',
  '/marketing-agencies-in-tennessee-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-tennessee-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Utah
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'utah',
  'Utah',
  '/marketing-agencies-in-utah-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-utah-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Vermont
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'vermont',
  'Vermont',
  '/marketing-agencies-in-vermont-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-vermont-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Washington
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'washington',
  'Washington',
  '/marketing-agencies-in-washington-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-washington-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- West Virginia
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'west-virginia',
  'West Virginia',
  '/marketing-agencies-in-west-virginia-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-west-virginia-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Wyoming
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
VALUES (
  'wyoming',
  'Wyoming',
  '/marketing-agencies-in-wyoming-united-states/',
  'https://www.gappsy.com/marketing-agencies-in-wyoming-united-states/',
  true
) ON CONFLICT (state_slug) DO UPDATE SET
  is_active = true,
  updated_at = now();

-- Verify what we just added
SELECT
  state_slug,
  state_name,
  is_active,
  created_at,
  updated_at
FROM state_pages
WHERE state_slug IN (
  'rhode-island',
  'south-carolina',
  'south-dakota',
  'tennessee',
  'utah',
  'vermont',
  'washington',
  'west-virginia',
  'wyoming'
)
ORDER BY state_name;
