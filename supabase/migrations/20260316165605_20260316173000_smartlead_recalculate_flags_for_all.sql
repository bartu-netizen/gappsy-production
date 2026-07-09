/*
  # Smartlead Email Cleanup Phase 3 - Recalculate all flags

  ## Key insight
  - 600+ valid emails are on bucket agencies with no website
  - These emails are REAL business emails from real companies
  - They should NOT be marked as contaminated just because agency has no website
  - domain_match_status = 'no_website' is NEUTRAL, not exclusionary

  ## Changes
  1. Recalculate domain_match_status for ALL NJ emails
  2. is_identity_contaminated should ONLY be true when:
     - Agency HAS a website AND
     - Email domain is DIFFERENT from agency website AND
     - Email is NOT from a free provider
*/

-- Step 1: Recalculate domain_match_status for ALL NJ emails
UPDATE other_agency_emails e
SET domain_match_status = 
  CASE 
    WHEN a.website_domain_normalized IS NULL THEN 'no_website'
    WHEN e.email_domain IS NULL THEN 'no_website'
    WHEN e.email_domain = a.website_domain_normalized THEN 'exact_match'
    WHEN e.email_domain IN ('gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'aol.com', 
                            'icloud.com', 'mail.com', 'protonmail.com', 'zoho.com', 'msn.com',
                            'live.com', 'comcast.net', 'verizon.net', 'att.net', 'sbcglobal.net',
                            'optonline.net', 'me.com', 'ymail.com', 'rocketmail.com') THEN 'free_email_provider'
    WHEN a.website_domain_normalized IS NOT NULL 
         AND e.email_domain IS NOT NULL
         AND (
           POSITION(SPLIT_PART(a.website_domain_normalized, '.', 1) IN e.email_domain) > 0 
           OR POSITION(SPLIT_PART(e.email_domain, '.', 1) IN a.website_domain_normalized) > 0
         ) THEN 'brand_match'
    ELSE 'different_business_domain'
  END,
  updated_at = NOW()
FROM other_agencies a
WHERE e.agency_id = a.id
  AND a.state_slug = 'new-jersey';

-- Step 2: Recalculate is_identity_contaminated
-- ONLY contaminated if agency has website AND email domain is clearly different business
UPDATE other_agency_emails e
SET is_identity_contaminated = 
  CASE 
    -- No website = NOT contaminated (we can't verify, so give benefit of doubt)
    WHEN e.domain_match_status = 'no_website' THEN false
    -- Exact/brand match = definitely NOT contaminated  
    WHEN e.domain_match_status IN ('exact_match', 'brand_match') THEN false
    -- Free email = NOT contaminated (common for small businesses)
    WHEN e.domain_match_status = 'free_email_provider' THEN false
    -- Different business domain with confirmed agency website = contaminated
    WHEN e.domain_match_status = 'different_business_domain' THEN true
    -- Default to not contaminated
    ELSE false
  END,
  updated_at = NOW()
FROM other_agencies a
WHERE e.agency_id = a.id
  AND a.state_slug = 'new-jersey';