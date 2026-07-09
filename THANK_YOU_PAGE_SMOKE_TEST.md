# Live Activation Smoke Test for Thank-you Page

## Overview

The **Live Activation Smoke Test** is an admin-only tool that verifies the real thank-you page activation flow works without requiring a real Stripe payment. It validates the production-equivalent backend path and provides detailed field-level error reporting.

This solves the critical gap: the previous dry-run mode could not prove that the REAL live activation flow works.

---

## Why This Matters

**The Problem:**
- The previous `/wp-admin/thank-you-page` preview showed "Mode: Dry-run"
- Dry-run validation does not call the same DB write path as real activation
- Admins had no way to verify the live activation flow works without Stripe payment

**The Solution:**
- Smoke test uses the SAME activation validators as production
- Smoke test calls the real DB write path (top25_slots, spotlight_placements, or other_agencies)
- Smoke test does NOT require Stripe payment (admin-only bypass)
- Smoke test creates test records marked with `source = 'admin_smoke_test'`
- Returns structured, field-level validation errors (not generic "failed" messages)

---

## Architecture

### Edge Function: `listing-smoke-test`

**Location:** `supabase/functions/listing-smoke-test/index.ts`

**Responsibility:**
- Accepts test payload (intro, services, websiteUrl, listingType)
- Runs the SAME validation rules as `listing-save-and-activate`
- Skips Stripe payment verification (admin-only bypass)
- Writes test record to database with `source = 'admin_smoke_test'`
- Returns structured result with field-level errors

**Reused Validators:**
- `validateIntroText()` - checks for forbidden words, URLs
- `validateWebsiteUrl()` - validates URL format
- `validateServices()` - ensures at least one service selected

**No Stripe Check:**
- Real `listing-save-and-activate` checks `order.payment_status === 'paid'`
- Smoke test bypasses this check entirely
- Safe because: admin-only, test records marked, DB shows source

---

## UI Components

### 1. ThankYouPageTestControls
**File:** `src/components/admin/ThankYouPageTestControls.tsx`

**New Button:**
```
🧪 Run Live Activation Smoke Test
```

**Styling:**
- Green-bordered button (indicates testing/experimental)
- Disabled when no services selected (required field)
- Shows loading state: "⏳ Running Smoke Test..."

**Props:**
- `onRunSmokeTest?: () => void` - handler to execute test
- `isSmokeTestRunning?: boolean` - loading state

### 2. SmokeTestResults Component
**File:** `src/components/admin/SmokeTestResults.tsx`

**Shows:**
- ✓ **Pass state**: Green card with success indicator
- ✗ **Fail state**: Red card with error indicator
- Loading state: Spinner while test runs (2-5 seconds)

**Result Panel Content:**
- **Test ID**: Unique identifier for test record (e.g., `smoke-test-1740772332000-abc123`)
- **Timestamp**: When test ran (ISO format)
- **Validation**: Pass/Fail status
- **Database Write**: Success/Failure status
- **Listing ID**: The test record ID created in DB

**Error Display:**
- Shows field-level validation errors (not just "failed")
- Examples:
  - `intro`: "Your intro contains restricted words. Please update the text and try again."
  - `website_url`: "Please enter a valid website URL (e.g., example.com or https://example.com)."
  - `services`: "At least one service must be selected."
  - `database`: "Failed to write test record: [specific error]"

**Pass Explanation:**
> "The activation validator, database write path, and slot logic all work correctly. The real thank-you page activation flow is production-ready."

---

## Integration Points

### WpAdminThankYouPagePage
**File:** `src/pages/WpAdminThankYouPagePage.tsx`

**New State:**
```typescript
const [isSmokeTestRunning, setIsSmokeTestRunning] = useState(false);
const [smokeTestResult, setSmokeTestResult] = useState<SmokeTestResult | null>(null);
const [showSmokeTestResult, setShowSmokeTestResult] = useState(false);
```

**New Handler:**
```typescript
const handleRunSmokeTest = async () => {
  // Calls listing-smoke-test endpoint
  // Passes current form data (intro, services, websiteUrl, listingType)
  // Shows results in SmokeTestResults component
};
```

**Flow:**
1. Admin loads `/wp-admin/thank-you-page`
2. Enters/selects: intro text, services, website URL, listing type
3. Clicks "🧪 Run Live Activation Smoke Test"
4. Endpoint called with current form values
5. Results displayed inline (pass/fail + errors)

---

## Test Payload Format

### Request Body
```json
{
  "intro": "We are a leading digital marketing agency specializing in SEO and PPC.",
  "services": ["SEO", "PPC", "Social Media"],
  "websiteUrl": "https://example-agency.com",
  "listingType": "top25_rank"
}
```

### Response (Pass)
```json
{
  "success": true,
  "passed": true,
  "testResults": {
    "validationPassed": true,
    "dbWriteResult": "Success",
    "listingId": "smoke-test-1740772332000-abc123",
    "timestamp": "2025-02-28T22:15:00.000Z",
    "testAgencyId": "smoke-test-1740772332000-abc123"
  }
}
```

### Response (Fail)
```json
{
  "success": false,
  "passed": false,
  "errors": {
    "intro": "Your intro contains restricted words. Please update the text and try again.",
    "website_url": "Please enter a valid website URL (e.g., example.com or https://example.com)."
  }
}
```

---

## Validation Rules (Same as Production)

### Intro Text
- **Required:** Yes
- **Max length:** 600 characters
- **Forbidden words:** gok, gokautomaat, gambling, porn, pornography, sex
- **No URLs:** Blocks http://, www., and domain patterns

### Website URL
- **Required:** No (optional field)
- **Format:** Must be valid domain with TLD
- **Examples:**
  - ✓ `example.com`
  - ✓ `https://example.com`
  - ✓ `www.example-agency.com`
  - ✗ `example` (no TLD)
  - ✗ `http://` (incomplete)

### Services
- **Required:** Yes (minimum 1)
- **Type:** Array of service names
- **Example:** `["SEO", "PPC", "Social Media"]`

### Listing Type
- **Required:** No (defaults to `other_listing`)
- **Valid values:** `top25_rank`, `spotlight`, `other_listing`
- **Effect:** Determines which table record is written to

---

## Database Safety

### Test Record Marking
Test records are safely isolated with:

```sql
source = 'admin_smoke_test'
```

This allows:
- Clear identification of admin test data vs. customer records
- Easy cleanup: `DELETE FROM other_agencies WHERE source = 'admin_smoke_test'`
- Audit trail: shows when tests were run
- Risk mitigation: test records clearly marked for removal

### Tables Written To
Depending on `listingType`:

| Type | Table | Fields |
|------|-------|--------|
| `top25_rank` | `top25_slots` | id, agency_id, intro, services, website_url, is_active, source |
| `spotlight` | `spotlight_placements` | id, agency_id, description, services, website_url, is_active, source |
| `other_listing` | `other_agencies` | id, intro, services, website_url, source |

### No Transaction Rollback
- Test creates permanent test record (marked as test source)
- Admins should periodically clean up old smoke test records
- Or ignore them (clearly marked as admin_smoke_test)

---

## Usage Examples

### Scenario 1: Valid Payload (Pass)
1. Select "Valid Top 25 (Paid)" preset
2. Verify intro shows (no forbidden words, no URLs)
3. Verify 3+ services are selected
4. Click "🧪 Run Live Activation Smoke Test"
5. Result: ✓ PASS
6. Confirms: Real activation flow works for this data

### Scenario 2: Invalid Intro (Fail)
1. Load preset "Intro with Gambling (Blocked)"
2. Intro text contains "gambling" keyword
3. Click smoke test button
4. Result: ✗ FAIL
5. Error shown: `intro: "Your intro contains restricted words..."`
6. Confirms: Validator correctly rejects blocked keywords

### Scenario 3: Invalid Website URL (Fail)
1. Load preset "Invalid Website URL"
2. Website URL is malformed
3. Click smoke test button
4. Result: ✗ FAIL
5. Error shown: `website_url: "Please enter a valid website URL..."`
6. Confirms: Validator correctly rejects bad URLs

### Scenario 4: No Services Selected (Fail)
1. Create custom payload with no services
2. Click smoke test button
3. Button is **disabled** (requires minimum 1 service)
4. Message: "Run Live Activation Smoke Test" button disabled
5. Forces admin to select services before testing

---

## QA Acceptance Criteria

### Smoke Test Button
- [ ] Button appears in `/wp-admin/thank-you-page`
- [ ] Button labeled "🧪 Run Live Activation Smoke Test"
- [ ] Button disabled when services array is empty
- [ ] Button shows loading state during test (⏳ Running...)
- [ ] Button re-enables after test completes

### Pass Path
- [ ] Valid test payload returns success: `passed: true`
- [ ] Test ID shown (format: `smoke-test-[timestamp]-[random]`)
- [ ] Timestamp shown in readable format
- [ ] Message confirms production-ready: "The activation validator..."
- [ ] DB record created with `source = 'admin_smoke_test'`

### Fail Path
- [ ] Invalid payload returns failure: `passed: false`
- [ ] Field-level errors shown (not generic message)
- [ ] Multiple errors displayed (e.g., intro + URL both wrong)
- [ ] Error messages are same as production validators
- [ ] No DB record created on validation failure

### Parity Verification
- [ ] Same intro validation rules as `listing-save-and-activate`
- [ ] Same URL validation rules
- [ ] Same services validation
- [ ] DB write uses same upsert logic
- [ ] Confirmed by code review of both functions

### Admin-Only Access
- [ ] Smoke test only accessible at `/wp-admin/thank-you-page`
- [ ] Protected by `AdminRoute` component
- [ ] Test records marked with `source = 'admin_smoke_test'`
- [ ] Cannot create real customer records via smoke test

### Error Handling
- [ ] Network error handled gracefully
- [ ] Timeout handled gracefully
- [ ] DB write error shown to admin
- [ ] Unhandled errors don't crash page

---

## What This Proves

✓ **Validators work:** Same rules as production, catches all validation errors
✓ **DB write path works:** Records successfully written to correct table
✓ **Slot logic works:** Activation marks listing as active (for top25, spotlight)
✓ **No Stripe required:** Test proves flow without payment provider
✓ **Field-level errors:** Structured error response, not vague messages
✓ **Production-ready:** If smoke test passes, live flow should work

---

## What This Does NOT Prove

✗ Real Stripe integration (separate from this test)
✗ Email notifications (not tested here)
✗ Post-payment redirects (tested in real checkout flow)
✗ Full end-to-end flow with payment provider

---

## Limitations & Notes

### Test Records Stay in DB
- Test records are permanent (not auto-cleaned)
- Marked with `source = 'admin_smoke_test'` for identification
- Manual cleanup: `DELETE FROM [table] WHERE source = 'admin_smoke_test'`

### No Real Stripe Order
- Smoke test does not create Stripe order
- Does not interact with Stripe API
- Admin-only bypass (not exposed to customers)

### Shared Validators
- Smoke test uses exact same validation functions as production
- If production validators change, smoke test automatically uses new rules
- No drift between test and production validation

---

## Files Modified

| File | Change |
|------|--------|
| `supabase/functions/listing-smoke-test/index.ts` | NEW - Smoke test edge function |
| `src/components/admin/ThankYouPageTestControls.tsx` | Added smoke test button + handlers |
| `src/components/admin/SmokeTestResults.tsx` | NEW - Results display component |
| `src/pages/WpAdminThankYouPagePage.tsx` | Added smoke test state + handler + results panel |

---

## Deployment Status

✅ Edge function deployed: `listing-smoke-test`
✅ Components created and integrated
✅ Build successful (ID: n3w89sp9)
✅ Ready for production

---

## Future Improvements

1. **Bulk test mode:** Test multiple payloads at once
2. **Test history:** View past smoke test results
3. **Auto-cleanup:** Scheduled job to remove old test records
4. **Parity report:** Side-by-side dry-run vs. smoke test results
5. **Export results:** Save smoke test results for audit trail

---

## Support

For issues or questions about the smoke test:
1. Check error message for field-level details
2. Review validation rules in this guide
3. Verify payload format matches examples
4. Check network tab for API errors

