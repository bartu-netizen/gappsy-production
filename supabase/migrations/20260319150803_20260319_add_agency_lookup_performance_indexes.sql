/*
  # Add performance indexes for agency-lookup-by-email

  1. New Indexes
    - `idx_ali_agency_visible` on `agency_listings_index(agency_id)` filtered by `is_visible = true`
      - Speeds up the listings lookup query that filters by agency_id + is_visible
    - `idx_oa_domain_active` on `other_agencies(website_domain_normalized)` filtered by `is_active = true`
      - Speeds up domain-based fallback lookup for active agencies only

  2. Notes
    - The main bottleneck was an ILIKE scan on website_url (206ms full seq scan)
    - Using website_domain_normalized with exact match uses index (2ms)
    - These indexes support the agency-lookup-by-email edge function
*/

CREATE INDEX IF NOT EXISTS idx_ali_agency_visible
  ON agency_listings_index (agency_id)
  WHERE (is_visible = true);

CREATE INDEX IF NOT EXISTS idx_oa_domain_active
  ON other_agencies (website_domain_normalized)
  WHERE (is_active = true);
