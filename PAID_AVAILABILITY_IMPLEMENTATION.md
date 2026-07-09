# Paid Agency Check Availability - Implementation Summary

## What Was Implemented

The Check Availability flow now intelligently routes users based on whether an agency has a paid listing:

- **Paid agencies** → Users see the agency is available and are redirected to that agency's website
- **Unpaid agencies** → Users see a "best match" fallback agency (currently Vazagency for New Jersey)

## Key Features

### 1. Database Structure

**New `state_lead_routing` table:**
- Maps each state to default fallback agencies
- Enables dynamic routing without code changes
- Seeded with New Jersey → Vazagency mapping

**Enhanced `other_agencies` table:**
- `is_paid_listing` - Tracks paid status
- `paid_listing_type` - Type of listing ('top25', 'spotlight', etc.)
- `paid_listing_rank` - For Top-25 rankings
- `has_card_visual_upgrade` - Card design upsell
- `has_lead_matching_upgrade` - Lead matching upsell
- `availability_redirect_enabled` - Controls redirect behavior
- `availability_redirect_url` - Where to redirect (defaults to website_url)

**Enhanced `agency_availability_requests` table:**
- `routed_to_agency_id` - Tracks which agency received the lead (for analytics)

### 2. Stripe Integration

**Checkout metadata enhanced:**
- Already includes `agencyId`, `listingType`, `rank`, `upsellCardVisual`, `upsellGetMatched`

**Webhook handler updated:**
- Automatically updates agency when checkout completes
- Sets paid listing flags
- Enables availability redirect
- Updates upsell flags

### 3. Frontend Flow

**AvailabilityModal changes:**
- Fetches agency data on modal open
- Checks if agency is paid and redirect-enabled
- For paid: routes to the clicked agency
- For unpaid: queries `state_lead_routing` for fallback
- Saves `routed_to_agency_id` for analytics

**Conditional copy:**
- **Paid**: "Good news — based on your project details, {agency_name} is available and ready to connect."
- **Unpaid**: "This New Jersey Agency is a better fit for your project."

**AutoRedirect updated:**
- Countdown changed from 10 seconds to 4 seconds
- Dynamic agency name in redirect message

## Files Changed

### Database
- `supabase/migrations/[timestamp]_add_monetization_and_lead_routing.sql` - New migration

### Supabase Edge Functions
- `supabase/functions/stripe-webhook/index.ts` - Added `updateAgencyPaidStatus()` function

### Frontend Components
- `src/AvailabilityModal.tsx` - Main logic for paid/unpaid routing
- `src/components/AutoRedirect.tsx` - 4-second countdown

### Documentation
- `PAID_AVAILABILITY_IMPLEMENTATION.md` - This file
- `PAID_AVAILABILITY_TESTING_GUIDE.md` - Testing scenarios and SQL queries

## User Experience

### Paid Agency Flow
1. User clicks "Check Availability" on paid agency card
2. Fills out form (service, budget, timeline, email)
3. Animation runs (~11 seconds)
4. **Result modal shows:**
   - Headline: "Good news — based on your project details, {agency_name} is available and ready to connect."
   - Card showing the same agency
   - "Visit Website →" button
   - Auto-redirect: "We'll automatically redirect you to {agency_name} in 4 seconds... Cancel"
5. After 4 seconds → Opens agency's website

### Unpaid Agency Flow
1. User clicks "Check Availability" on unpaid agency
2. Same form and animation
3. **Result modal shows:**
   - Headline: "This New Jersey Agency is a better fit for your project."
   - Card showing fallback agency (e.g., Vazagency)
   - "Visit Website →" to fallback
   - Auto-redirect: "We'll automatically redirect you to Vazagency in 4 seconds... Cancel"
5. After 4 seconds → Opens fallback agency's website

## Design Compliance

✅ **No visual changes** - Only text content differs
✅ **Same font sizes** - Exact same CSS classes used
✅ **Same margins/padding** - No layout changes
✅ **4-second countdown** - Updated from 10 seconds
✅ **Mobile responsive** - Works identically on mobile

## Data & Analytics

### Lead Attribution
The `routed_to_agency_id` field enables:
- Track which agency received each lead
- Calculate conversion rates per agency
- Measure ROI for paid listings
- Identify best-performing fallback agencies

### Revenue Attribution
Combined with Stripe metadata:
- Link purchases to lead generation
- Calculate LTV per agency type
- Measure effectiveness of upsells

## Scalability

### Multi-State Support
To add a new state:
```sql
INSERT INTO state_lead_routing (
  state_slug,
  default_availability_agency_id,
  default_get_matched_agency_id
)
VALUES (
  'california',
  (SELECT id FROM other_agencies WHERE name = 'Best CA Agency'),
  (SELECT id FROM other_agencies WHERE name = 'Best CA Agency')
);
```

### Rotating Fallbacks
Future enhancement: Add rotation logic to `state_lead_routing`:
- Track lead counts per agency
- Implement round-robin distribution
- Weight by agency capacity/preference

## Testing Checklist

- [ ] Test paid agency shows correct copy
- [ ] Test paid agency redirects to correct URL
- [ ] Test unpaid agency shows fallback
- [ ] Test unpaid agency redirects to fallback URL
- [ ] Test 4-second countdown on both scenarios
- [ ] Test Cancel button works
- [ ] Test mobile layout (both scenarios)
- [ ] Test Stripe checkout sets fields correctly
- [ ] Verify `routed_to_agency_id` is saved correctly
- [ ] Test with missing state_lead_routing (should fallback to Vazagency)

## Monitoring

Key metrics to track:
- Paid vs unpaid availability checks
- Conversion rates (paid vs unpaid)
- Time to redirect cancellation
- State_lead_routing effectiveness

## Future Enhancements

1. **Smart routing** - ML-based matching instead of static fallbacks
2. **Agency capacity** - Factor in current workload
3. **Performance scoring** - Route to highest-rated available agencies
4. **Real-time availability** - Calendar integration
5. **Lead distribution** - Fair rotation among paid agencies in same tier
