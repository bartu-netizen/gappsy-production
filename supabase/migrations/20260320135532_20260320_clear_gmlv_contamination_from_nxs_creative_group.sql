/*
  # Clear GMLV data contamination from NXS Creative Group records

  ## Summary
  During the New Jersey bulk agency import, GMLV LLC's logo and description
  were incorrectly attached to NXS Creative Group's `other_agencies` record.
  A subsequent admin `top25_admin_update` run on 2026-03-20 10:23 UTC then
  propagated that contaminated data into the `top25_slots` record for NJ rank 3.

  NXS Creative Group (david@nxscreativegroup.com) paid for Top 25 NJ Rank #3
  on 2026-03-19 (sub_1TCq2HIoPJm5BB2XTKaFVc6X, $334.00). They never submitted
  their own logo or description through any post-payment flow.

  ## What this migration does
  1. Clears GMLV's logo_url, description, and short_description from
     top25_slots for NJ rank 3 (slot id: f8081c78-140b-437f-8933-f96c5a3b1683)
  2. Clears GMLV's logo_url and short_description from other_agencies for
     NXS Creative Group (id: 5aeafe6b-d72f-48db-b62b-ed04faea8a4f)

  ## Tables modified
  - top25_slots: logo_url, description, short_description → NULL
  - other_agencies: logo_url, short_description → NULL

  ## What is preserved
  - agency_name: "NXS Creative Group"
  - website: "https://www.nxscreativegroup.com/..."
  - services: ["Digital Marketing", "Marketing Strategy", "Brand Development"]
  - is_paid: true
  - slot_status: "sold"
  - stripe_subscription_id, purchased_at, and all billing fields
  - rank: 3, state_slug: "new-jersey"

  ## Root cause
  Bulk import data error — GMLV's logo/description row was matched to NXS's
  record during import. Not a post-payment submission issue. NXS never submitted
  their own branding assets.
*/

-- 1. Clear contaminated GMLV data from top25_slots for NXS Creative Group (NJ #3)
UPDATE top25_slots
SET
  logo_url          = NULL,
  description       = NULL,
  short_description = NULL,
  updated_at        = now()
WHERE id = 'f8081c78-140b-437f-8933-f96c5a3b1683'
  AND agency_name = 'NXS Creative Group'
  AND state_slug  = 'new-jersey'
  AND rank        = 3;

-- 2. Clear contaminated GMLV data from other_agencies for NXS Creative Group
UPDATE other_agencies
SET
  logo_url          = NULL,
  short_description = NULL,
  updated_at        = now()
WHERE id   = '5aeafe6b-d72f-48db-b62b-ed04faea8a4f'
  AND name = 'NXS Creative Group';
