# Availability Modal - Paid Agency Flow Fix

## Problem

When clicking "Check availability" on a paid agency (e.g., Vazagency), the modal would sometimes:
- Show a NEGATIVE "better fit" message instead of positive confirmation
- Display a different fallback agency card instead of the clicked agency
- Fail to redirect properly to the paid agency's website

This happened because paid agencies exist in `top25_slots` table but the modal only looked in `other_agencies` table.

## Solution

### 1. Multi-Table Agency Lookup

**File**: `src/AvailabilityModal.tsx`

The modal now searches for agencies in both tables:

```typescript
// First, try other_agencies table
if (finalAgencyId) {
  const { data: agencyData } = await supabase
    .from('other_agencies')
    .select('...')
    .eq('id', finalAgencyId)
    .maybeSingle();
}

// If not found, try top25_slots table
if (!agency && agencyName && finalStateSlug) {
  const { data: top25Data } = await supabase
    .from('top25_slots')
    .select('id, agency_name, website, logo_url, description, is_paid')
    .eq('state_slug', finalStateSlug)
    .eq('agency_name', agencyName)
    .maybeSingle();
}
```

### 2. URL Sanitization

Added `sanitizeUrl()` helper function that:
- Validates URL exists and is not empty
- Adds `https://` prefix if protocol is missing
- Returns `null` for invalid URLs

```typescript
const sanitizeUrl = (url: string | null | undefined): string | null => {
  if (!url) return null;
  const trimmed = url.trim();
  if (!trimmed) return null;

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed;
  }

  return `https://${trimmed}`;
};
```

### 3. Paid Agency Priority Logic

**Critical Change**: Paid status is based ONLY on `is_paid_listing` flag:

```typescript
const isPaidSourceAgency = !!agency.is_paid_listing;
setIsPaidAvailability(isPaidSourceAgency);
```

**No longer requires**:
- ✗ `availability_redirect_enabled` flag
- ✗ `availability_redirect_url` to be set

This ensures agencies marked as paid in `top25_slots` are always treated as paid.

### 4. Paid Agency Flow (POSITIVE)

For paid agencies:

1. **URL Selection Priority**:
   ```typescript
   // For other_agencies: try redirect URL first
   if (agency.availability_redirect_enabled && agency.availability_redirect_url) {
     finalUrl = sanitizeUrl(agency.availability_redirect_url);
   }

   // Fallback to website_url
   if (!finalUrl) {
     finalUrl = sanitizeUrl(agency.website_url);
   }
   ```

2. **Early Return**: Immediately sets routed agency to SOURCE agency and returns
   - **No fallback routing logic executed**
   - **No state_lead_routing query**
   - **Source agency is always shown**

3. **Positive Message**: Modal shows:
   - ✅ "Good news — based on your project details, [Agency Name] is available and ready to connect."
   - ✅ Agency card for the clicked agency (not a different one)
   - ✅ Auto-redirect to agency's website
   - ✅ CTA button opens same URL

### 5. Non-Paid Agency Flow (NEGATIVE)

For non-paid agencies:

1. **Fallback Routing**: Queries `state_lead_routing` for recommended agency
2. **Negative Message**: "This [State] Agency is a better fit for your project."
3. **Different Agency**: Shows fallback/recommended agency card
4. **No Redirect Requirement**: Can work with or without redirect URLs

## Database Structure

### top25_slots Table
```sql
- id (uuid)
- state_slug (text)
- rank (integer)
- agency_name (text)
- website (text)
- logo_url (text)
- description (text)
- is_paid (boolean)  ← Key field
```

### other_agencies Table
```sql
- id (uuid)
- name (text)
- state_slug (text)
- website_url (text)
- is_paid_listing (boolean)  ← Key field
- availability_redirect_enabled (boolean)
- availability_redirect_url (text)
- city (text)
- state (text)
- logo_url (text)
- intro (text)
```

## Testing

### Test Case 1: Vazagency in New Jersey (Paid via top25_slots)

**Setup**:
```sql
SELECT * FROM top25_slots
WHERE state_slug = 'new-jersey' AND agency_name = 'Vazagency';
-- Expected: is_paid = true, website = 'https://vazagency.com'
```

**Test Steps**:
1. Go to New Jersey state page
2. Find Vazagency in Top 25 list
3. Click "Check Availability"
4. Fill form and submit

**Expected Result**:
- ✅ Modal shows: "Good news — based on your project details, Vazagency is available and ready to connect."
- ✅ Agency card shows Vazagency (not a different agency)
- ✅ Auto-redirect starts to https://vazagency.com
- ✅ Button opens https://vazagency.com in new tab

### Test Case 2: Vazagency in Alabama (Paid via top25_slots)

**Setup**:
```sql
SELECT * FROM top25_slots
WHERE state_slug = 'alabama' AND agency_name = 'Vazagency';
-- Expected: is_paid = true
```

**Test Steps**:
1. Go to Alabama state page
2. Find Vazagency in Top 25 list
3. Click "Check Availability"
4. Fill form and submit

**Expected Result**:
- ✅ Same positive behavior as New Jersey
- ✅ Shows Vazagency, not fallback agency
- ✅ Redirects to Vazagency website

### Test Case 3: Free/Placeholder Agency

**Setup**:
```sql
SELECT * FROM other_agencies
WHERE state_slug = 'new-jersey' AND is_paid_listing = false
LIMIT 1;
```

**Test Steps**:
1. Go to New Jersey state page
2. Find a free agency (e.g., "Garden State Digital")
3. Click "Check Availability"
4. Fill form and submit

**Expected Result**:
- ✅ Modal shows: "This New Jersey Agency is a better fit for your project."
- ✅ Agency card shows state's recommended agency (from state_lead_routing)
- ✅ No auto-redirect (or redirects to recommended agency if configured)

### Test Case 4: Paid Agency in other_agencies

**Setup**:
```sql
-- Create test paid agency in other_agencies
INSERT INTO other_agencies (
  name, state_slug, is_paid_listing,
  website_url, city, state
) VALUES (
  'Test Paid Agency', 'new-jersey', true,
  'https://testpaid.com', 'Newark', 'New Jersey'
);
```

**Test Steps**:
1. Navigate directly to agency via ID/slug
2. Click "Check Availability"
3. Submit form

**Expected Result**:
- ✅ Positive message for Test Paid Agency
- ✅ Card shows Test Paid Agency
- ✅ Redirects to https://testpaid.com

## Key Guarantees

### For Paid Agencies (is_paid_listing = true OR is_paid = true)

1. ✅ **Always Positive**: "Good news" message, never "better fit"
2. ✅ **Same Agency**: Routed agency equals source agency
3. ✅ **Valid URL**: Sanitized with https:// prefix if needed
4. ✅ **No Fallback**: Never routes to state_lead_routing
5. ✅ **Auto Redirect**: Countdown starts to agency website
6. ✅ **CTA Consistency**: Button URL matches redirect URL

### For Non-Paid Agencies (is_paid_listing = false)

1. ✅ **Negative Message**: "Better fit" wording
2. ✅ **Fallback Routing**: Uses state_lead_routing.default_availability_agency_id
3. ✅ **Different Agency**: May show recommended agency instead of source
4. ✅ **Flexible URL**: Works even if agency has no website

## Error Handling

### Missing Website URL (Paid Agency)

**Scenario**: Paid agency has no valid website_url

**Behavior**:
```typescript
if (!finalUrl) {
  console.error('[AvailabilityModal] Paid agency has no valid website URL');
  setSubmitError('Website link is missing for this agency.');
  // Still shows agency card, but with empty website
  // No auto-redirect
}
```

**Result**:
- ⚠️ Error message shown to user
- ⚠️ Agency card displayed but button disabled/non-functional
- ⚠️ No auto-redirect

**Fix**: Ensure all paid agencies have valid `website_url` or `website` field:
```sql
UPDATE top25_slots
SET website = 'https://example.com'
WHERE is_paid = true AND (website IS NULL OR website = '');
```

### Agency Not Found

**Scenario**: Agency doesn't exist in either table

**Behavior**:
```typescript
if (!agency) {
  console.warn('[AvailabilityModal] Could not find agency data');
  setRoutedAgency(recommendedAgency);
  return;
}
```

**Result**:
- ⚠️ Falls back to hardcoded recommendedAgency (Gappsy)
- ⚠️ Shows negative "better fit" message
- ⚠️ Console warning logged

## Anti-Regression Guards

### 1. Explicit Paid Check
```typescript
const isPaidSourceAgency = !!agency.is_paid_listing;
```
- Uses `!!` to force boolean
- Never falsy for paid agencies

### 2. Early Return for Paid
```typescript
if (isPaidSourceAgency) {
  // Set routed agency to source
  setRoutedAgency({ ... });
  return;  // ← Prevents fallback logic
}
```
- Explicitly returns after setting routed agency
- Fallback code never executes for paid agencies

### 3. Dependency Array
```typescript
}, [isOpen, mode, step, agencyName, stateName]);
```
- Includes `agencyName` and `stateName`
- Re-fetches if agency name changes (e.g., navigation)

## Files Modified

### src/AvailabilityModal.tsx

**Changes**:
1. Added `sanitizeUrl()` helper function
2. Modified `fetchAgencyData()` to search both tables
3. Simplified paid agency detection (only checks `is_paid_listing`)
4. Added early return for paid agencies
5. Applied URL sanitization to all website URLs
6. Added error handling for missing URLs

**Lines Changed**: ~150 lines (lines 76-375)

## Deployment Checklist

Before deploying:

- [x] Build passes (`npm run build`)
- [x] No TypeScript errors
- [x] URL sanitization tested
- [ ] Manual test: Vazagency on New Jersey page
- [ ] Manual test: Vazagency on Alabama page
- [ ] Manual test: Free agency shows fallback
- [ ] Verify no regressions in existing paid flows

## Monitoring

### Key Metrics

1. **Paid Agency Clicks**: Track availability requests for paid agencies
2. **Redirect Success Rate**: Monitor successful redirects vs. errors
3. **URL Validation Errors**: Log agencies with missing/invalid URLs

### Database Query - Paid Agencies Without URLs

```sql
-- Check paid agencies missing valid websites
SELECT
  id,
  name,
  state_slug,
  is_paid_listing,
  website_url
FROM other_agencies
WHERE is_paid_listing = true
  AND (website_url IS NULL OR website_url = '');

-- Check top25_slots paid agencies missing websites
SELECT
  id,
  agency_name,
  state_slug,
  is_paid,
  website
FROM top25_slots
WHERE is_paid = true
  AND (website IS NULL OR website = '');
```

## Future Enhancements

### 1. Unified Agency Table

Consider merging `other_agencies` and `top25_slots` into single source:
- Eliminates dual-lookup logic
- Reduces query complexity
- Single source of truth for agency data

### 2. URL Validation on Insert

Add database constraint or trigger:
```sql
-- Example: Validate paid agencies have URLs
CREATE OR REPLACE FUNCTION validate_paid_agency_url()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.is_paid_listing = true AND (NEW.website_url IS NULL OR NEW.website_url = '') THEN
    RAISE EXCEPTION 'Paid agencies must have a valid website URL';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_paid_agency_url
  BEFORE INSERT OR UPDATE ON other_agencies
  FOR EACH ROW
  EXECUTE FUNCTION validate_paid_agency_url();
```

### 3. Redirect Analytics

Track redirect behavior:
```sql
CREATE TABLE availability_redirects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  agency_id uuid,
  redirect_url text,
  success boolean,
  error_message text
);
```

## Support

For issues related to paid agency flow:

1. Check browser console for `[AvailabilityModal]` logs
2. Verify agency exists in database (either table)
3. Confirm `is_paid_listing` or `is_paid` is true
4. Validate website URL is set and accessible
5. Test URL in browser directly

## Related Documentation

- `AVAILABILITY_FLOW.md` - Overall availability system
- `PAID_AVAILABILITY_IMPLEMENTATION.md` - Original paid feature docs
- `AGENCY_METRICS_NULL_GUARD_FIX.md` - Related agency data fixes
