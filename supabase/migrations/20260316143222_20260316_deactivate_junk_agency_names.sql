/*
  # Deactivate agencies with high-confidence junk names

  1. Problem
    - 5 active other_agencies rows have names that are clearly not real agency names
    - Examples: coordinate numbers like "-2.4389648", scraped attribute labels,
      Google Maps URL fragments, "By owner..." prefixed junk strings

  2. Changes
    - Sets is_active = false on rows matching high-confidence junk patterns
    - Only affects rows where name is clearly not a real agency name
    - Does NOT touch any plausible or merely unusual agency names

  3. Patterns matched (conservative, high-confidence only)
    - Coordinate-like decimal numbers (e.g. "-2.4389648", "-171.1784699")
    - "Identifies as ..." attribute labels
    - Generic placeholders ("Agency", "Business", etc.) as the entire name
    - URL-only strings
    - Google Maps fragments
    - "By owner" prefixed scrape artifacts
    - "Street View & 360" scrape artifacts
    - Purely numeric strings under 20 chars

  4. Safety
    - Only sets is_active = false (no data deletion)
    - These rows can be manually reviewed and reactivated if needed
*/

UPDATE other_agencies
SET is_active = false,
    updated_at = now()
WHERE is_active = true
AND (
  name ~ '^-?\d+\.\d{3,}$'
  OR name ~* '^identifies as '
  OR LOWER(TRIM(name)) IN ('agency', 'business', 'company', 'n/a', 'na', 'none', 'unknown', 'test', 'null', 'undefined', 'placeholder')
  OR name ~* '^(women-owned|veteran-owned|black-owned|lgbtq\+ owned|asian-owned|latino-owned|minority-owned|wheelchair accessible|open 24 hours|temporarily closed|permanently closed|online appointments|in-store shopping|onsite services|lgbtq\+ friendly)$'
  OR (name ~ '^https?://' AND name NOT LIKE '% %')
  OR name ~* 'google\.com/maps|maps\.google'
  OR (name ~ '^[\d\s.,()+\-/]+$' AND LENGTH(name) < 20)
  OR name ~* '^by owner[,"]'
  OR name ~* '^Street View & 360'
);
