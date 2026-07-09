/*
  # Smartlead Email Cleanup Phase 1 - Delete Duplicates

  ## Problem
  Same emails exist on multiple agencies (bucket agencies + real agencies)
  Need to keep only the best copy and delete duplicates

  ## Strategy
  Phase 1: Delete duplicate emails on bucket agencies when a copy exists on a real agency
  (We'll handle re-linking orphans separately)
*/

-- Delete emails from bucket agencies when a better copy exists elsewhere
WITH bucket_agency_ids AS (
  -- The 3 known bucket agencies in NJ with no identity
  SELECT id FROM other_agencies 
  WHERE state_slug = 'new-jersey'
    AND is_active = false
    AND website_domain_normalized IS NULL
    AND name IN ('RevGen', 'Integral Marketing Strategies LLC', 
                 'Create By Influence: Digital Marketing & SEO Agency South Jersey')
),
emails_with_better_copy AS (
  -- Emails on bucket agencies that also exist on a non-bucket agency
  SELECT e.id as email_id
  FROM other_agency_emails e
  WHERE e.agency_id IN (SELECT id FROM bucket_agency_ids)
    AND EXISTS (
      SELECT 1 FROM other_agency_emails e2
      JOIN other_agencies a2 ON e2.agency_id = a2.id
      WHERE e2.email_normalized = e.email_normalized
        AND e2.id != e.id
        AND a2.state_slug = 'new-jersey'
        AND e2.agency_id NOT IN (SELECT id FROM bucket_agency_ids)
    )
)
DELETE FROM other_agency_emails
WHERE id IN (SELECT email_id FROM emails_with_better_copy);