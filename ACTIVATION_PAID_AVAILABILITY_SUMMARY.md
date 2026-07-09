# Agency Listing Activation - Paid Availability Extension

## What Was Implemented

Extended the paid availability Check Availability flow to include the Agency Listing Activation ($97 / 6-month listing) product. Now all three paid listing types receive the same treatment:

- **Top-25 Listings** (listingType: 'top25') → Paid availability with direct redirect
- **Spotlight Listings** (listingType: 'spotlight') → Paid availability with direct redirect
- **Agency Listing Activation** (listingType: 'other_listing') → Paid availability with direct redirect ✨ NEW

## Changes Made

### 1. Stripe Webhook Updated

**File:** `supabase/functions/stripe-webhook/index.ts`

Extended the `updateAgencyPaidStatus()` function to handle the `'other_listing'` listing type:

```typescript
// Before: Only handled 'top25' and 'spotlight'
if (listingType === 'top25' || listingType === 'spotlight') {
  // set paid listing flags...
}

// After: Now also handles 'other_listing'
if (listingType === 'top25' || listingType === 'spotlight' || listingType === 'other_listing') {
  updateData.is_paid_listing = true;
  updateData.paid_listing_type = listingType;
  updateData.availability_redirect_enabled = true;
  updateData.availability_redirect_url = agency.website_url;
}
```

### 2. Activation Checkout Enhanced

**Files Modified:**
- `src/pages/ActivationUpgradePage.tsx`
- `src/pages/AvailabilityOwnerPreviewPage.tsx`
- `src/pages/AvailabilityOwnerDashboardPage.tsx`

**Changes:**

1. **Navigation now includes agencyId** - When navigating to `/activation/upgrade`, the URL now includes:
   - `agencyId` (required for webhook to update correct agency)
   - `agencyWebsite` (used as redirect URL)
   - `agencyDescription` (for display purposes)

2. **Checkout includes agencyId** - The Stripe checkout session metadata now includes:
   ```typescript
   {
     listingType: 'other_listing', // ✨ This identifies it as a paid listing
     agencyId: agencyId, // ✨ NEW - Required for webhook to update correct agency
     agencyName: '...',
     agencyWebsite: '...', // ✨ Used as availability_redirect_url
     // ... other fields
   }
   ```

### 3. Check Availability Flow (No Changes Needed)

The existing Check Availability flow already works for all paid listing types because it checks:
```typescript
const isPaidAvailability =
  sourceAgency.is_paid_listing &&
  sourceAgency.availability_redirect_enabled &&
  !!sourceAgency.availability_redirect_url;
```

When any of the three listing types (top25, spotlight, activation) are purchased:
- ✅ `is_paid_listing` is set to `true`
- ✅ `availability_redirect_enabled` is set to `true`
- ✅ `availability_redirect_url` is set to the agency's website

## User Experience

### Agency Purchases Activation ($97)

1. Agency completes activation checkout
2. Stripe webhook automatically sets:
   - `is_paid_listing = true`
   - `paid_listing_type = 'other_listing'`
   - `availability_redirect_enabled = true`
   - `availability_redirect_url = [agency website]`

### Client Checks Availability

3. Client clicks "Check Availability" on the agency card
4. Client fills out form (service, budget, timeline, email)
5. Animation plays
6. **Result modal shows:**
   - **Headline:** "Good news — based on your project details, {agency_name} is available and ready to connect."
   - **Card:** Shows the agency they clicked on
   - **CTA:** "Visit Website →" button to agency's website
   - **Auto-redirect:** "We'll automatically redirect you to {agency_name} in 10 seconds... Cancel"
7. After 10 seconds → Opens agency's website

### For Unpaid Agencies

- Flow remains unchanged
- Shows fallback agency (Vazagency or state-based default)
- Uses original "better fit" messaging

## Testing Checklist

To verify the implementation works:

### Test 1: Mark an agency as having purchased activation

```sql
-- Simulate a successful activation purchase
UPDATE other_agencies
SET
  is_paid_listing = true,
  paid_listing_type = 'other_listing',
  availability_redirect_enabled = true,
  availability_redirect_url = 'https://agency-website.com'
WHERE id = 'your-agency-uuid';
```

**Expected:**
- Check Availability shows "Good news..." message
- Redirects to the agency's website
- Uses the same styling as Top-25/Spotlight

### Test 2: Verify unpaid agency still uses fallback

```sql
-- Ensure agency is not paid
UPDATE other_agencies
SET
  is_paid_listing = false,
  availability_redirect_enabled = false
WHERE id = 'your-agency-uuid';
```

**Expected:**
- Shows "This New Jersey Agency is a better fit..." message
- Shows fallback agency (Vazagency)
- Redirects to fallback agency's website

### Test 3: Complete an actual activation purchase

1. Navigate to activation upgrade page
2. Click "Activate Standard Listing for $97"
3. Complete Stripe checkout
4. Wait for webhook to process
5. Check database to verify flags are set

**Expected:**
```sql
SELECT
  name,
  is_paid_listing,
  paid_listing_type,
  availability_redirect_enabled,
  availability_redirect_url
FROM other_agencies
WHERE id = 'your-agency-uuid';

-- Should return:
-- is_paid_listing = true
-- paid_listing_type = 'other_listing'
-- availability_redirect_enabled = true
-- availability_redirect_url = [agency website]
```

## SQL Verification Queries

### View all agencies with paid availability:
```sql
SELECT
  name,
  paid_listing_type,
  paid_listing_rank,
  availability_redirect_enabled,
  availability_redirect_url
FROM other_agencies
WHERE is_paid_listing = true
ORDER BY paid_listing_type, paid_listing_rank;
```

### View recent availability requests with routing:
```sql
SELECT
  ar.created_at,
  ar.state_slug,
  ar.service,
  source_agency.name as clicked_agency,
  source_agency.paid_listing_type as listing_type,
  routed_agency.name as routed_to_agency
FROM agency_availability_requests ar
LEFT JOIN other_agencies source_agency ON ar.agency_id = source_agency.id
LEFT JOIN other_agencies routed_agency ON ar.routed_to_agency_id = routed_agency.id
ORDER BY ar.created_at DESC
LIMIT 20;
```

### Count availability requests by listing type:
```sql
SELECT
  oa.paid_listing_type,
  COUNT(ar.id) as total_requests,
  COUNT(CASE WHEN ar.routed_to_agency_id = ar.agency_id THEN 1 END) as routed_to_self,
  COUNT(CASE WHEN ar.routed_to_agency_id != ar.agency_id THEN 1 END) as routed_to_fallback
FROM agency_availability_requests ar
LEFT JOIN other_agencies oa ON ar.agency_id = oa.id
GROUP BY oa.paid_listing_type
ORDER BY oa.paid_listing_type;
```

## What Happens Automatically

### When Agency Purchases Activation:
1. ✅ Stripe checkout session includes `listingType: 'activation'` and `agencyId`
2. ✅ Stripe webhook receives `checkout.session.completed`
3. ✅ Webhook sets paid listing flags in `other_agencies` table
4. ✅ Agency is immediately treated as "paid" for Check Availability

### When Client Checks Availability:
1. ✅ Modal fetches agency data including paid status
2. ✅ Determines if agency is paid based on flags
3. ✅ Shows appropriate messaging ("Good news..." vs "better fit")
4. ✅ Redirects to correct URL (agency website vs fallback)
5. ✅ Logs `routed_to_agency_id` for analytics

## Key Benefits

### For Agency Owners:
- ✅ Activation purchase immediately enables paid availability
- ✅ No manual configuration needed
- ✅ Consistent experience across all paid listing types

### For Platform:
- ✅ Unified paid listing logic across all products
- ✅ Easy to add new paid listing types in the future
- ✅ Complete analytics on lead routing and conversion

### For Clients:
- ✅ Consistent messaging for all paid agencies
- ✅ Direct connection to available agencies
- ✅ Fallback to alternatives when agency hasn't paid

## Future Enhancements

The system is now ready for:
- **Multi-tier activation** - Different activation prices for different benefits
- **Geographic targeting** - State-specific activation pricing
- **Performance-based activation** - Free activation after X leads/conversions
- **Bundled products** - Activation + Card Visual + Lead Matching packages

## Timer Settings

The auto-redirect timer has been set to **10 seconds** (not 4), matching the original design specifications documented in PERFORMANCE_OPTIMIZATIONS.md and MULTI_STATE_SETUP.md.

**AutoRedirect Component:**
- Initial countdown: 10 seconds
- Progress bar calculation: `((10 - countdown) / 10) * 100`
- Display: "We'll automatically redirect you to {agency_name} in {countdown} seconds..."

## Build Status

✅ Build completed successfully with no errors or warnings
