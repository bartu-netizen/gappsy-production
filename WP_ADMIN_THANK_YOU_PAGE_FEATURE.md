# WP-Admin Thank-You Page Testing Feature

## Overview

A production-ready QA tool inside `/wp-admin` that allows testing and previewing the thank-you page flow **without Stripe**, including post-payment editor testing and future-ready support for multiple thank-you page variants.

**Access:** `/wp-admin/thank-you-page` (internal only, requires admin authentication)

---

## What This Feature Does

### Current Capabilities

✅ **Test thank-you page states** (without Stripe session ID):
- Confirmed/Paid payment state
- Pending payment state (shows spinner)
- Failed payment state (shows error)

✅ **Preview post-payment editor**:
- Website URL field (optional, with validation)
- Intro text field (600 char limit, with validation)
- Services selection (multi-select checkboxes)
- Real validation matching production rules

✅ **Test validation logic**:
- Blocked words: gok, gambling, porn, etc.
- URL detection in intro text
- Website URL format validation
- Service list validation

✅ **Multiple validation modes**:
- **UI-Only:** Client-side validation only
- **Dry-run:** Backend validation without creating listings (recommended)
- **Live:** Full activation (admin confirmation required)

✅ **Thank-you page variants** (foundation):
- Variant selection in test UI
- Support for multiple thank-you page designs
- Future-ready for A/B testing and product-specific variants

✅ **Preset scenarios**:
- Valid Top 25 listing (confirmed payment)
- Valid Spotlight placement (confirmed payment)
- Intro with URL (validation should fail)
- Intro with gambling keywords (validation should fail)
- Invalid website URL (validation should fail)
- Payment pending state
- Payment failed state
- Other listing type
- Existing listing activation

✅ **Debug panel**:
- View test data JSON
- View validation responses
- Inspect payload structure

---

## Architecture Overview

### File Structure

```
src/
├── config/
│   └── thankYouPageVariants.ts          # Variant config & mapping system
├── utils/
│   └── thankYouPageTestData.ts          # Test data generation & presets
├── components/admin/
│   ├── ThankYouPageTestControls.tsx     # Left panel: test controls
│   └── ThankYouPagePreview.tsx          # Right panel: live preview
├── pages/
│   └── WpAdminThankYouPagePage.tsx      # Main page (wp-admin route)
├── components/wpadmin/
│   └── adminTools.ts                    # Admin navigation registry
└── App.tsx                              # Route definitions

supabase/functions/
└── listing-validate-dry-run/            # Edge function for dry-run validation
    └── index.ts

public/data/
└── new-jersey.json                      # Agency data (used for initial preview)
```

### Component Architecture

```
┌─────────────────────────────────────────────────┐
│     WpAdminThankYouPagePage (Main)              │
│  ┌──────────────────┬──────────────────────┐    │
│  │                  │                      │    │
│  │  TEST CONTROLS   │   PREVIEW & INFO     │    │
│  │  (Left Sidebar)  │   (Right Main Area)  │    │
│  │                  │                      │    │
│  │ Basic Settings   │  Thank-you Preview   │    │
│  │ • Payment state  │  • Current state     │    │
│  │ • Product type   │  • Agency card       │    │
│  │ • Agency info    │  • Post-payment form │    │
│  │ • State/location │  • Validation msgs   │    │
│  │ • Content fields │  • Debug panel       │    │
│  │                  │                      │    │
│  │ Content          │  Info Section        │    │
│  │ • Website URL    │  • Feature overview  │    │
│  │ • Intro text     │  • Validation modes  │    │
│  │ • Services       │  • Variant system    │    │
│  │                  │  • Preset guide      │    │
│  │ Variant Selector │                      │    │
│  │ • Version picker │  Preview Modal       │    │
│  │ • Future A/B     │  (Modal when opened) │    │
│  │                  │  • Live thank-you    │    │
│  │ Validation Mode  │  • Full form testing │    │
│  │ • UI-Only        │  • Real components   │    │
│  │ • Dry-run        │  • Dry-run response  │    │
│  │ • Live           │                      │    │
│  │                  │                      │    │
│  │ [Preview Button] │                      │    │
│  └──────────────────┴──────────────────────┘    │
└─────────────────────────────────────────────────┘
```

### Data Flow

```
Test Controls
    ↓
Set testData + variant + validationMode
    ↓
[Open Preview] button clicked
    ↓
IF validationMode === 'dry-run':
    ├→ POST /functions/v1/listing-validate-dry-run
    └→ Get { valid, errors? }
    ↓
Show ThankYouPagePreview modal
    ├→ Render payment state (pending/failed/confirmed)
    ├→ If confirmed: Show OtherAgencyCard + PostPaymentEditor
    └→ Show debug panel with payloads
```

---

## Key Features Explained

### 1. Test State Controls

**Payment State:**
- `Confirmed` - Shows thank-you page + post-payment editor
- `Pending` - Shows spinner with "Confirming your payment..."
- `Failed` - Shows error state

**Product/Listing Type:**
- `Top 25` - Top 25 rank listing
- `Spotlight` - Spotlight placement
- `Other Listing` - Free "Other Agencies" listing
- `Activation` - Existing listing activation

**Agency Details:**
- Agency name, state, website URL
- Intro text (600 char max)
- Services (multi-select)
- Optional card visual upgrade flag

**Presets:**
Quick-load test scenarios for common validation cases.

### 2. Variant System (Future-Ready)

**Current Structure:**
```typescript
type ThankYouVariant =
  | 'default'              // Currently active
  | 'v2'                   // Future: enhanced version
  | 'top25-focused'        // Future: optimized for Top 25
  | 'spotlight-focused'    // Future: optimized for Spotlight
```

**Mapping System:**
Each product type maps to a default variant:
```typescript
{
  productType: 'top25',
  listingType: 'top25_rank',
  defaultVariant: 'default',
  abtestEligible: true
}
```

**A/B Test Foundation:**
```typescript
interface ABTestConfig {
  experimentKey?: string;        // Experiment identifier
  variantOverride?: string;      // Force specific variant
  bucket?: 'control' | 'treatment' | 'test';
}
```

### 3. Validation Modes

**UI-Only Validation:**
- Client-side validation only
- No backend call
- Useful for quick UX testing
- Same validation rules as production

**Dry-run Validation (Recommended):**
- Backend validation without side effects
- Calls `/functions/v1/listing-validate-dry-run`
- Tests the exact validation logic
- Safe for testing blocked content
- No listings created

**Live Validation:**
- Full activation with real Stripe/listing creation
- For admin testing only
- Requires explicit confirmation
- Creates real records

### 4. Post-Payment Editor Integration

Tests the actual `PostPaymentEditor` component with:
- Website URL field (optional)
- Intro text validation (600 chars, forbidden words, no URLs)
- Services selection (multi-select)
- Form submission flow

The preview uses **real shared components**, not mocks.

---

## Validation Rules

### Intro Text Validation

✅ **Allowed:**
- Up to 600 characters
- Standard marketing language
- Business descriptions

❌ **Blocked:**
- URLs in any form (http://, www., domain.ext)
- Forbidden words:
  - gok, gokautomaat
  - gambling
  - porn, pornography, sex
- HTML links

### Website URL Validation

✅ **Allowed:**
- example.com
- https://example.com
- www.example.com
- https://example.com/path

❌ **Blocked:**
- Invalid formats
- Missing domain
- Malformed URLs

### Services Validation

✅ **Allowed list:**
- SEO
- Web Design
- PPC
- Social Media Marketing
- Branding
- Content Marketing
- CRO
- Email Marketing
- Performance Marketing

❌ **Invalid:**
- Services not in allowed list
- Empty selection (warning only)

---

## How to Use

### Accessing the Feature

1. Go to `/wp-admin`
2. Authenticate with admin secret
3. Look for **"Thank-you Page"** in Monetization section
4. Or use command palette: `⌘K` / `Ctrl+K` → "thank-you"

### Basic Testing Flow

1. **Set test state:**
   - Select payment state (Confirmed/Pending/Failed)
   - Choose product type (Top 25/Spotlight/Other/Activation)
   - Fill in agency details

2. **Load a preset (optional):**
   - Select preset from dropdown
   - Auto-populates all fields

3. **Customize content:**
   - Edit website URL
   - Edit intro text
   - Select services

4. **Choose validation mode:**
   - UI-Only: Fast UX testing
   - Dry-run: Backend validation (recommended)
   - Live: Real activation

5. **Open preview:**
   - Click "Open Thank-you Page Preview"
   - View rendered page with actual components
   - Test form interactions

6. **Debug (optional):**
   - Click "+ Debug Panel" at bottom
   - View test data JSON
   - View validation response

### Testing Validation Failures

**Test blocked intro content:**
1. Load preset: "Intro with URL (Blocked)"
2. Select "Dry-run" mode
3. Click preview
4. Should show validation error

**Test invalid website URL:**
1. Load preset: "Invalid Website URL"
2. Select "Dry-run" mode
3. Click preview
4. Should show validation error

**Test pending payment:**
1. Load preset: "Payment Pending"
2. Click preview
3. Should show spinner with "Confirming your payment..."

---

## Future Enhancements

### Phase 1: Multi-Variant Support

When adding new thank-you page designs:
1. Create new variant in `thankYouPageVariants.ts`
2. Set `isActive: true`
3. Implement variant-aware rendering in `ThankYouPagePreview`
4. Use variant selector in wp-admin to test

### Phase 2: A/B Testing

When implementing A/B tests:
1. Use `ABTestConfig` interface
2. Implement assignment logic based on:
   - Product type
   - Campaign/source
   - User segment
3. Store experiment key in database
4. Update variant mapper with A/B logic

### Phase 3: Product-Specific Variants

Create custom thank-you pages for:
- Top 25 → Emphasize ranking, include rank visualization
- Spotlight → Emphasize featured placement
- Other Listing → Simpler flow (no logo upload)
- Activation → Re-engagement messaging

### Phase 4: Advanced Presets

Add presets for:
- Mobile preview
- Different copy variations
- Localization testing
- Accessibility testing

---

## Testing Checklist

### Functionality Tests

- [ ] Can access `/wp-admin/thank-you-page` with admin auth
- [ ] All preset scenarios load correctly
- [ ] Payment states (confirmed/pending/failed) render properly
- [ ] Variant selector works and shows all variants
- [ ] Validation modes switch correctly

### Validation Tests

- [ ] UI-only mode: Shows client-side validation only
- [ ] Dry-run mode: Backend validation works
- [ ] Blocked intro keywords: Fails with correct error
- [ ] URL in intro: Fails with correct error
- [ ] Invalid website URL: Fails with correct error
- [ ] Valid data: Passes validation

### Component Integration

- [ ] PostPaymentEditor renders in confirmed state
- [ ] OtherAgencyCard displays correctly
- [ ] Logo upload section visibility (based on listing type)
- [ ] Form submission flow (UI-only mode)

### Security Tests

- [ ] Public `/order/complete` still requires Stripe session ID
- [ ] No bypass to real order flow through wp-admin
- [ ] Dry-run doesn't create real listings
- [ ] Live mode requires admin confirmation

---

## Database/API Integration

### Edge Function: listing-validate-dry-run

**Endpoint:** `POST /functions/v1/listing-validate-dry-run`

**Request:**
```json
{
  "intro": "Agency description text",
  "websiteUrl": "https://example.com",
  "services": ["SEO", "Web Design"]
}
```

**Response (Valid):**
```json
{
  "valid": true
}
```

**Response (Invalid):**
```json
{
  "valid": false,
  "errors": {
    "intro": "Your intro contains restricted words. Please update the text and try again."
  },
  "warnings": [
    "At least one service should be selected for better visibility."
  ]
}
```

---

## Troubleshooting

### Preview doesn't open
- Check browser console for errors
- Verify dry-run endpoint is deployed
- Check network tab for 500 errors

### Validation errors don't show
- Ensure dry-run mode is selected
- Check that edge function is deployed
- Verify CORS headers are correct

### Page not appearing in admin menu
- Verify route is registered in `/App.tsx`
- Confirm admin session is valid
- Check browser cache (clear if needed)

### Styling issues
- Ensure TailwindCSS is built
- Check for conflicting CSS classes
- Run `npm run build` to regenerate

---

## Implementation Status

### Completed

✅ Variant configuration system (future-ready)
✅ Test data generation with 10+ presets
✅ Test controls UI (3-column expandable sections)
✅ Live preview component with actual shared components
✅ Dry-run validation edge function
✅ Integration into wp-admin navigation
✅ Route registration in App.tsx
✅ Full build/deployment test

### Not Included (By Design)

❌ Public route bypass (security maintained)
❌ Database schema changes (uses existing tables)
❌ Multiple thank-you page design implementations (variant architecture ready, designs separate)
❌ Live A/B testing backend (foundation ready, engine separate)

---

## Security Notes

### What's Protected

✅ Real `/order/complete` remains strictly Stripe-gated
✅ No public bypass to thank-you flow
✅ Dry-run validation doesn't create listings
✅ Live mode requires admin authentication
✅ All test data is ephemeral (not persisted)

### What's Exposed

- Test tool is internal only (requires admin secret)
- Validation logic matches production exactly
- Error messages are user-facing (same as production)
- Debug panel shows structure only (no real data leaks)

---

## Technical Specifications

### Stack
- React 18 with TypeScript
- React Router 7
- Tailwind CSS
- Supabase Edge Functions (Deno)

### Component Props

**ThankYouPageTestControls:**
```typescript
interface ThankYouPageTestControlsProps {
  testData: ThankYouTestData;
  onTestDataChange: (data: ThankYouTestData) => void;
  onPreviewClick: () => void;
  validationMode: 'ui-only' | 'dry-run' | 'live';
  onValidationModeChange: (mode: 'ui-only' | 'dry-run' | 'live') => void;
  selectedVariant: string;
  onVariantChange: (variant: string) => void;
  isValidating?: boolean;
}
```

**ThankYouPagePreview:**
```typescript
interface ThankYouPagePreviewProps {
  testData: ThankYouTestData;
  selectedVariant: string;
  validationMode: 'ui-only' | 'dry-run' | 'live';
  onClose: () => void;
  isValidating?: boolean;
  dryRunResponse?: { valid: boolean; errors?: Record<string, string> };
}
```

### State Management
- React hooks (useState)
- Local component state only
- No global state library needed
- Data passed via props

---

## File References

| File | Lines | Purpose |
|------|-------|---------|
| `src/config/thankYouPageVariants.ts` | ~150 | Variant config & mapping |
| `src/utils/thankYouPageTestData.ts` | ~250 | Test data & presets |
| `src/components/admin/ThankYouPageTestControls.tsx` | ~350 | Test UI form |
| `src/components/admin/ThankYouPagePreview.tsx` | ~200 | Preview modal |
| `src/pages/WpAdminThankYouPagePage.tsx` | ~150 | Main page |
| `src/components/wpadmin/adminTools.ts` | 1 entry | Registration |
| `src/App.tsx` | 2 entries | Route setup |
| `supabase/functions/listing-validate-dry-run/index.ts` | ~150 | Edge function |

---

## Support & Next Steps

### If you need to...

**Add a new thank-you variant:**
1. Add entry to `THANK_YOU_VARIANTS` in `thankYouPageVariants.ts`
2. Update `VARIANT_MAPPINGS` if needed
3. Implement variant-aware rendering in `ThankYouPagePreview.tsx`
4. Test in wp-admin preview

**Add a new preset:**
1. Add entry to `TEST_PRESETS` in `thankYouPageTestData.ts`
2. Include description and test data
3. Preset auto-appears in preset selector

**Change validation rules:**
1. Update `validateIntroText()` in edge function
2. Update same function in client library
3. Update tests with new rules

**Deploy to production:**
1. Merge to main
2. Edge function auto-deploys via Supabase
3. Route auto-activates with code deploy
4. Feature immediately available in wp-admin

---

## Questions?

This feature is fully documented in this file. For implementation questions, refer to the component comments and TypeScript interfaces.
