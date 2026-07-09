/*
  # Smartlead Email Cleanup Phase 2a - Delete intra-bucket duplicates

  ## Problem
  Same email exists on multiple bucket agencies
  When we try to re-link, multiple rows try to move to same target
  
  ## Strategy
  First, deduplicate within bucket agencies - keep only one copy per email
*/

-- Delete duplicate emails WITHIN bucket agencies (keep the oldest one)
WITH bucket_agency_ids AS (
  SELECT id FROM other_agencies 
  WHERE state_slug = 'new-jersey'
    AND is_active = false
    AND website_domain_normalized IS NULL
),
ranked_bucket_emails AS (
  SELECT 
    e.id,
    e.email_normalized,
    ROW_NUMBER() OVER (PARTITION BY e.email_normalized ORDER BY e.created_at ASC, e.id ASC) as rn
  FROM other_agency_emails e
  WHERE e.agency_id IN (SELECT id FROM bucket_agency_ids)
),
duplicates_to_delete AS (
  SELECT id FROM ranked_bucket_emails WHERE rn > 1
)
DELETE FROM other_agency_emails
WHERE id IN (SELECT id FROM duplicates_to_delete);