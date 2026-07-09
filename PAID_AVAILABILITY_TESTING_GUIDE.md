# Paid Agency Availability - Testing Guide

This guide explains how to test the new paid agency Check Availability flow.

## Overview

The Check Availability feature now has two different behaviors:

1. **Paid Agency**: Shows the agency itself as available and redirects to their website
2. **Unpaid Agency**: Shows a "best match" fallback agency and redirects there

## Database Setup

### 1. Required Tables

The following tables were created/updated by the migration:

- `other_agencies` - Now includes monetization fields
- `state_lead_routing` - Maps states to default fallback agencies
- `agency_availability_requests` - Now tracks `routed_to_agency_id`

### 2. Monetization Fields in `other_agencies`

| Field | Type | Description |
|-------|------|-------------|
| `is_paid_listing` | boolean | True if agency has an active paid listing |
| `paid_listing_type` | text | Type: 'top25', 'spotlight', 'other' |
| `paid_listing_rank` | integer | Rank for Top-25 (null for Spotlight) |
| `has_card_visual_upgrade` | boolean | True if Card Visual Upgrade purchased |
| `has_lead_matching_upgrade` | boolean | True if Lead Matching upsell purchased |
| `availability_redirect_enabled` | boolean | True to enable direct redirect |
| `availability_redirect_url` | text | URL for Check Availability redirect |

## Testing Scenarios

### Scenario 1: Paid Agency (Direct Redirect)

**Setup:**
```sql
-- Mark an agency as paid
UPDATE other_agencies
SET
  is_paid_listing = true,
  paid_listing_type = 'top25',
  paid_listing_rank = 2,
  availability_redirect_enabled = true,
  availability_redirect_url = 'https://example-agency.com'
WHERE id = 'YOUR_AGENCY_ID';
```

**Expected Behavior:**
1. User clicks "Check Availability" on this agency
2. Fills out the form (service, budget, timeline, email)
3. Animation plays for ~11 seconds
4. Modal shows:
   - **Headline**: "Good news — based on your project details, {agency_name} is available and ready to connect."
   - **Card**: Shows the same agency they clicked on
   - **CTA**: "Visit Website →" button linking to their site
   - **Auto-redirect**: "We'll automatically redirect you to {agency_name} in 4 seconds... Cancel"
5. After 4 seconds, opens the agency's website in a new tab

**Verification:**
- Check `agency_availability_requests` table:
  - `agency_id` = the clicked agency
  - `routed_to_agency_id` = same as `agency_id` (not fallback)

### Scenario 2: Unpaid Agency (Fallback Redirect)

**Setup:**
```sql
-- Ensure agency is NOT paid
UPDATE other_agencies
SET
  is_paid_listing = false,
  availability_redirect_enabled = false
WHERE id = 'YOUR_AGENCY_ID';

-- Verify state_lead_routing is set up (should be auto-seeded for new-jersey)
SELECT * FROM state_lead_routing WHERE state_slug = 'new-jersey';
```

**Expected Behavior:**
1. User clicks "Check Availability" on this unpaid agency
2. Fills out the form
3. Animation plays
4. Modal shows:
   - **Headline**: "This New Jersey Agency is a better fit for your project."
   - **Card**: Shows the fallback agency (Vazagency or configured default)
   - **CTA**: "Visit Website →" to fallback agency
   - **Auto-redirect**: "We'll automatically redirect you to Vazagency in 4 seconds... Cancel"
5. After 4 seconds, opens the fallback agency's website

**Verification:**
- Check `agency_availability_requests` table:
  - `agency_id` = the clicked agency (original)
  - `routed_to_agency_id` = fallback agency ID (different from `agency_id`)

### Scenario 3: Stripe Integration (Automated)

When a paid listing is purchased via Stripe:

**Setup:**
1. Complete a Top-25 or Spotlight checkout with metadata:
   - `agencyId`
   - `listingType` ('top25' or 'spotlight')
   - `rank` (for Top-25)
   - `upsellCardVisual` ('true'/'false')
   - `upsellGetMatched` ('true'/'false')

**Expected Behavior:**
- Stripe webhook (`checkout.session.completed`) automatically:
  1. Sets `is_paid_listing = true`
  2. Sets `paid_listing_type` from metadata
  3. Sets `paid_listing_rank` from metadata (if applicable)
  4. Sets `availability_redirect_enabled = true`
  5. Sets `availability_redirect_url` to `website_url`
  6. Updates upsell flags if purchased

**Verification:**
```sql
-- Check that agency was properly updated after Stripe checkout
SELECT
  name,
  is_paid_listing,
  paid_listing_type,
  paid_listing_rank,
  availability_redirect_enabled,
  availability_redirect_url,
  has_card_visual_upgrade,
  has_lead_matching_upgrade
FROM other_agencies
WHERE id = 'AGENCY_ID_FROM_CHECKOUT';
```

## UI/UX Requirements Met

### ✅ Same Visual Styling
- Headline uses exact same CSS classes (`text-base md:text-lg font-semibold text-slate-900 leading-snug`)
- No changes to font size, weight, margins, or padding
- Only the text content changes based on paid/unpaid status

### ✅ 4-Second Countdown
- Changed from 10 seconds to 4 seconds for all scenarios
- Progress bar updates correctly

### ✅ Mobile Responsive
- Modal maintains same layout and sizing on mobile
- Text wraps naturally without breaking design

### ✅ Dynamic Routing
- Uses `state_lead_routing` table for per-state fallback configuration
- Falls back to Vazagency if no routing configured
- Easily scalable to support multiple states

## SQL Queries for Testing

### View all paid agencies:
```sql
SELECT
  name,
  state,
  paid_listing_type,
  paid_listing_rank,
  availability_redirect_enabled
FROM other_agencies
WHERE is_paid_listing = true
ORDER BY state, paid_listing_rank;
```

### View availability requests with routing:
```sql
SELECT
  ar.created_at,
  ar.state_slug,
  ar.service,
  ar.budget,
  ar.client_email,
  source_agency.name as clicked_agency,
  routed_agency.name as routed_to_agency
FROM agency_availability_requests ar
LEFT JOIN other_agencies source_agency ON ar.agency_id = source_agency.id
LEFT JOIN other_agencies routed_agency ON ar.routed_to_agency_id = routed_agency.id
ORDER BY ar.created_at DESC
LIMIT 50;
```

### View state routing configuration:
```sql
SELECT
  slr.state_slug,
  avail_agency.name as availability_fallback,
  matched_agency.name as get_matched_default
FROM state_lead_routing slr
LEFT JOIN other_agencies avail_agency ON slr.default_availability_agency_id = avail_agency.id
LEFT JOIN other_agencies matched_agency ON slr.default_get_matched_agency_id = matched_agency.id;
```

## Troubleshooting

### Issue: Paid agency not showing as available

**Check:**
1. `is_paid_listing = true`
2. `availability_redirect_enabled = true`
3. `availability_redirect_url` is not null

### Issue: Wrong fallback agency showing

**Check:**
1. `state_lead_routing` table has correct mapping for the state
2. Fallback agency exists in `other_agencies` table
3. Falls back to Vazagency if no routing configured

### Issue: redirect_to_agency_id not being saved

**Check:**
1. Agency data loaded correctly (check browser console for errors)
2. `routedAgency` state is set in modal
3. Database permissions allow insert to `agency_availability_requests`

## Next Steps

Once testing is complete:

1. Configure state routing for additional states
2. Set up paid agencies for Top-25 and Spotlight listings
3. Monitor `agency_availability_requests` to analyze lead distribution
4. Use `routed_to_agency_id` data for revenue attribution
