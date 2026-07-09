/*
  # Backfill website_url from website_domain_normalized

  ## Summary
  Many other_agencies rows have a Google Maps URL stored in website_url because
  the scraper CSV used the Maps listing URL as the "website" field. The import
  worker correctly extracted the real domain into website_domain_normalized, but
  website_url was never reconstructed from it.

  ## Changes
  1. For all active agencies where:
     - website_url is NULL or empty, OR website_url contains a Google Maps URL
     - AND website_domain_normalized is a valid domain (not null, not empty, contains a dot)
  2. Set website_url = 'https://' || website_domain_normalized
  3. Move the old Google Maps URL to maps_url if maps_url is currently NULL

  ## Scope
  All states (not just NJ) — this is a global data quality fix.

  ## Safety
  - Only touches rows where the domain is clearly a real domain (contains ".", length >= 4)
  - Never overwrites a good website_url with anything
  - Does not touch rows that already have a real website_url
  - Does not invent domains — only uses what was already stored in website_domain_normalized
*/

-- Step 1: Where website_url is a Google Maps URL and we have a real domain,
-- save the Maps URL to maps_url (if maps_url is currently empty) then
-- reconstruct website_url from website_domain_normalized.
UPDATE other_agencies
SET
  maps_url = CASE
    WHEN maps_url IS NULL OR maps_url = ''
    THEN website_url
    ELSE maps_url
  END,
  website_url = 'https://' || website_domain_normalized,
  updated_at = now()
WHERE
  is_active = true
  AND (website_url LIKE '%google.com/maps%' OR website_url LIKE '%maps.google%')
  AND website_domain_normalized IS NOT NULL
  AND website_domain_normalized != ''
  AND length(website_domain_normalized) >= 4
  AND website_domain_normalized LIKE '%.%'
  AND website_domain_normalized NOT LIKE '%google%';

-- Step 2: Where website_url is NULL/empty but website_domain_normalized exists,
-- reconstruct website_url from the domain.
UPDATE other_agencies
SET
  website_url = 'https://' || website_domain_normalized,
  updated_at = now()
WHERE
  is_active = true
  AND (website_url IS NULL OR website_url = '')
  AND website_domain_normalized IS NOT NULL
  AND website_domain_normalized != ''
  AND length(website_domain_normalized) >= 4
  AND website_domain_normalized LIKE '%.%'
  AND website_domain_normalized NOT LIKE '%google%';
