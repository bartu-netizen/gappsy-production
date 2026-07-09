/*
  # Smartlead Identity Integrity System

  ## Summary
  This migration creates the infrastructure needed to detect and exclude
  email-to-agency attachments where the email domain does NOT match the
  agency's canonical website domain. This is critical for ensuring that
  Smartlead exports send emails under the CORRECT company identity.

  ## Problem Being Solved
  The importer was using loose `.ilike('%domain%')` matching, which caused:
  - `metrombs.com` emails to be attached to `marketingmbs.com` agency
  - Wrong company name/URL appearing in outreach emails
  - Identity confusion in one_per_agency deduplication

  ## Changes
  1. Backfill `website_domain_normalized` on `other_agencies`
  2. Backfill `email_domain` on `other_agency_emails`
  3. Compute and store `domain_match_status` on emails
  4. Create `is_identity_verified` computed field on emails

  ## Domain Match Status Values
  - `exact_match`: email domain = website domain (highest confidence)
  - `brand_match`: email domain contains/is contained by website domain root
  - `free_email_provider`: gmail.com, hotmail.com, etc. (acceptable for small biz)
  - `different_business_domain`: email is from a completely different company
  - `no_website`: agency has no website URL (cannot verify)
  - `pending`: not yet computed

  ## Security
  - No RLS changes needed
  - Existing policies remain intact
*/

-- Step 1: Backfill website_domain_normalized on other_agencies
UPDATE other_agencies
SET website_domain_normalized = LOWER(REGEXP_REPLACE(
  REGEXP_REPLACE(
    REGEXP_REPLACE(website_url, '^https?://(www\.)?', '', 'i'),
    '/.*$', ''
  ),
  '\?.*$', ''
))
WHERE website_url IS NOT NULL 
  AND website_url != ''
  AND (website_domain_normalized IS NULL OR website_domain_normalized = '');

-- Step 2: Backfill email_domain on other_agency_emails
UPDATE other_agency_emails
SET email_domain = LOWER(SPLIT_PART(email_normalized, '@', 2))
WHERE email_domain IS NULL OR email_domain = '';

-- Step 3: Create helper function to compute domain match status
CREATE OR REPLACE FUNCTION compute_email_domain_match_status(
  p_email_domain text,
  p_website_domain text
) RETURNS text
LANGUAGE plpgsql
IMMUTABLE
SET search_path = public, pg_temp
AS $$
DECLARE
  free_providers text[] := ARRAY[
    'gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'aol.com',
    'icloud.com', 'live.com', 'msn.com', 'me.com', 'protonmail.com',
    'ymail.com', 'mail.com', 'zoho.com', 'fastmail.com', 'gmx.com',
    'comcast.net', 'verizon.net', 'att.net', 'sbcglobal.net', 'cox.net',
    'earthlink.net', 'charter.net', 'optonline.net', 'frontier.com'
  ];
  email_root text;
  website_root text;
BEGIN
  -- Null/empty checks
  IF p_email_domain IS NULL OR p_email_domain = '' THEN
    RETURN 'pending';
  END IF;
  
  IF p_website_domain IS NULL OR p_website_domain = '' THEN
    RETURN 'no_website';
  END IF;
  
  -- Free email provider check
  IF p_email_domain = ANY(free_providers) THEN
    RETURN 'free_email_provider';
  END IF;
  
  -- Exact match
  IF p_email_domain = p_website_domain THEN
    RETURN 'exact_match';
  END IF;
  
  -- Extract root domains (drop subdomains and TLD for comparison)
  email_root := SPLIT_PART(p_email_domain, '.', 1);
  website_root := SPLIT_PART(p_website_domain, '.', 1);
  
  -- Brand match: root names are similar
  IF email_root = website_root THEN
    RETURN 'brand_match';
  END IF;
  
  -- Check if one contains the other (for brand variations)
  IF position(email_root in website_root) > 0 
     OR position(website_root in email_root) > 0 THEN
    RETURN 'brand_match';
  END IF;
  
  -- Different business domain - potential identity corruption
  RETURN 'different_business_domain';
END;
$$;

-- Step 4: Backfill domain_match_status on all existing emails
UPDATE other_agency_emails oae
SET domain_match_status = compute_email_domain_match_status(
  oae.email_domain,
  oa.website_domain_normalized
)
FROM other_agencies oa
WHERE oae.agency_id = oa.id
  AND (oae.domain_match_status IS NULL OR oae.domain_match_status = '' OR oae.domain_match_status = 'pending');

-- Step 5: Mark identity contamination for different_business_domain emails
UPDATE other_agency_emails
SET is_identity_contaminated = true
WHERE domain_match_status = 'different_business_domain';

-- Step 6: Create index for fast filtering of clean emails
CREATE INDEX IF NOT EXISTS idx_oae_domain_match_status 
ON other_agency_emails (domain_match_status);

CREATE INDEX IF NOT EXISTS idx_oae_identity_contaminated 
ON other_agency_emails (is_identity_contaminated) 
WHERE is_identity_contaminated = true;

-- Step 7: Create view for Smartlead-eligible emails (excludes contaminated)
CREATE OR REPLACE VIEW smartlead_eligible_emails AS
SELECT 
  oae.id,
  oae.agency_id,
  oae.email_normalized,
  oae.email_domain,
  oae.validation_status,
  oae.outreach_status,
  oae.is_primary,
  oae.validation_checked_at,
  oae.created_at,
  oae.domain_match_status,
  oae.is_identity_contaminated,
  oa.name AS agency_name,
  oa.slug AS agency_slug,
  oa.state_slug,
  oa.website_url,
  oa.website_domain_normalized,
  oa.global_identity_key,
  oa.agency_dedupe_key
FROM other_agency_emails oae
JOIN other_agencies oa ON oae.agency_id = oa.id
WHERE oa.is_active = true
  AND oae.validation_status IN ('valid', 'catch_all', 'risky')
  AND (oae.outreach_status IS NULL OR oae.outreach_status NOT IN ('opted_out', 'blocked'))
  AND (oae.is_identity_contaminated IS NULL OR oae.is_identity_contaminated = false);
