/*
  # Smartlead Email Cleanup Phase 2b - Re-link orphans to active agencies

  ## Now that duplicates within buckets are removed, we can safely re-link
*/

-- Re-link orphaned emails to matching active agencies
WITH bucket_agency_ids AS (
  SELECT id FROM other_agencies 
  WHERE state_slug = 'new-jersey'
    AND is_active = false
    AND website_domain_normalized IS NULL
),
relink_mapping AS (
  SELECT 
    e.id as email_id,
    e.email_normalized,
    ta.id as new_agency_id
  FROM other_agency_emails e
  JOIN other_agencies ta ON e.email_domain = ta.website_domain_normalized
  WHERE e.agency_id IN (SELECT id FROM bucket_agency_ids)
    AND e.email_domain IS NOT NULL
    AND ta.state_slug = 'new-jersey'
    AND ta.is_active = true
    -- No existing copy on target
    AND NOT EXISTS (
      SELECT 1 FROM other_agency_emails ex
      WHERE ex.agency_id = ta.id
        AND ex.email_normalized = e.email_normalized
    )
)
UPDATE other_agency_emails e
SET 
  agency_id = rm.new_agency_id,
  domain_match_status = 'exact_match',
  is_identity_contaminated = false,
  updated_at = NOW()
FROM relink_mapping rm
WHERE e.id = rm.email_id;