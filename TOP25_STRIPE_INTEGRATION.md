# Top 25 Stripe Integration - Complete Guide

## Overview

The Top 25 funnel is now fully integrated with Stripe for subscription-based listing purchases with optional upsells. The system is designed to be **future-proof** and **state-agnostic**, allowing easy expansion to all 50 US states without duplicating code.

---

## Architecture

### Key Components

1. **Stripe Configuration** (`src/config/stripe.ts`)
   - Single source of truth for all Stripe products
   - Real price IDs for listings and add-ons
   - Safe getter functions that handle missing products gracefully

2. **Upsell Configuration** (`src/config/top25Upsells.ts`)
   - Central configuration for all upsells
   - Adding a new upsell here makes it available across all states
   - Defines visual styling (color, icon) and copy

3. **Checkout Context** (`src/contexts/Top25CheckoutContext.tsx`)
   - Manages checkout state across the funnel
   - Tracks selected upsells
   - Stores agency details and selected rank

4. **Confirm Page** (`src/pages/Top25ConfirmPage.tsx`)
   - Renders upsells dynamically from config
   - Builds line items for Stripe
   - Handles checkout flow

5. **Edge Function** (`supabase/functions/top25-checkout/index.ts`)
   - Creates Stripe Checkout Session
   - Includes all metadata for webhook processing
   - Returns checkout URL for redirect

---

## Stripe Products

### Listing Tiers (6-month subscriptions)

| Tier | Ranks | Price | Price ID |
|------|-------|-------|----------|
| **Premium** | 1-8 | $297 | `price_1SZKecIoPJm5BB2Xf1ZNcRmt` |
| **Priority** | 9-16 | $247 | `price_1SZKW7IoPJm5BB2Xom28TCYo` |
| **Standard** | 17-25 | $197 | `price_1SZGKxIoPJm5BB2X1My3vHBJ` |

### Add-ons (6-month subscriptions)

| Add-on | Price | Price ID | Status |
|--------|-------|----------|--------|
| **Card Visual Upgrade** | $37 | `price_1SZPw3IoPJm5BB2Xh8ji6xPt` | ✅ Active |
| **Get Matched** | $97 | `price_1SZPzfIoPJm5BB2XKJYYwTlM` | ✅ Active |
| **Spotlight Placement** | $997 | `price_1SZQ3qIoPJm5BB2XVzBy9qRD` | 🚧 Ready (commented out) |

---

## How It Works

### User Flow

1. **Submit Agency Form** → User fills in agency details
2. **Select Spot** → Shows available ranks with pricing
3. **Confirm & Upsell** → User selects upsells, sees total
4. **Checkout** → Redirects to Stripe Checkout
5. **Success** → Returns to success page after payment

### Data Flow

```
SubmitAgencyModal
  ↓ (sets checkout data)
Top25CheckoutContext
  ↓ (navigates to confirm)
Top25ConfirmPage
  ↓ (user selects upsells)
  ↓ (clicks checkout button)
  ↓ (builds line items)
top25-checkout Edge Function
  ↓ (creates Stripe session)
Stripe Checkout
  ↓ (user completes payment)
Success Page
```

### Metadata Tracking

Every Stripe session includes:

```typescript
metadata: {
  funnel: 'top25',
  stateSlug: 'new-jersey',
  stateName: 'New Jersey',
  rank: '12',
  agencyName: 'Acme Marketing',
  agencyWebsite: 'https://acme.com',
  listingTier: 'priority',
  upsellCardVisual: 'true',
  upsellGetMatched: 'false',
  upsellSpotlight: 'false',
}
```

This metadata is used by webhooks to update the database after payment.

---

## Adding a New Upsell (All States)

To add a new upsell that appears across all US states:

### Step 1: Create Stripe Product

1. Go to Stripe Dashboard → Products
2. Create new product (e.g., "Premium Badge Upgrade")
3. Set recurring billing: every 6 months
4. Set price (e.g., $47)
5. Copy the price ID (e.g., `price_1ABC...`)

### Step 2: Update Stripe Config

Open `src/config/stripe.ts` and add to `PRICE_IDS`:

```typescript
export const PRICE_IDS = {
  // ... existing IDs ...
  addonPremiumBadge: 'price_1ABC...', // ← Add new ID
} as const;
```

Add to `PRODUCT_CONFIGS`:

```typescript
[PRICE_IDS.addonPremiumBadge]: {
  priceId: PRICE_IDS.addonPremiumBadge,
  name: 'Premium Badge Upgrade (6-Month Add-On)',
  description: 'Adds an exclusive premium badge to your listing.',
  amount: 47,
  type: 'addon',
  addonType: 'premiumBadge',
  duration: '6-month',
},
```

Update the `AddonType` type:

```typescript
export type AddonType = 'cardVisual' | 'getMatched' | 'spotlight' | 'premiumBadge';
```

### Step 3: Update Upsell Config

Open `src/config/top25Upsells.ts` and update:

```typescript
export type Top25UpsellKey = 'cardVisual' | 'getMatched' | 'spotlight' | 'premiumBadge';
```

Add to `TOP25_UPSELLS` array:

```typescript
{
  key: 'premiumBadge',
  title: () => 'Add Premium Badge Upgrade',
  description: 'Display an exclusive premium badge on your listing card for enhanced credibility and visibility.',
  addonType: 'premiumBadge',
  color: 'purple', // or 'orange', 'blue'
  icon: 'badge', // visual indicator type
},
```

### Step 4: Update Context

Open `src/contexts/Top25CheckoutContext.tsx` and update:

```typescript
export interface Top25UpsellState {
  cardVisual: boolean;
  getMatched: boolean;
  spotlight: boolean;
  premiumBadge: boolean; // ← Add new field
}
```

Update `initialUpsellState`:

```typescript
const initialUpsellState: Top25UpsellState = {
  cardVisual: false,
  getMatched: false,
  spotlight: false,
  premiumBadge: false, // ← Add default value
};
```

### Step 5: Done!

That's it! The new upsell will now:

- ✅ Appear on all Top 25 confirm pages
- ✅ Use correct pricing from Stripe
- ✅ Be included in line items when selected
- ✅ Show up in Stripe metadata
- ✅ Work for all US states automatically

**No per-state code changes needed!**

---

## Expanding to New States

To add the Top 25 funnel for a new state (e.g., California):

### Option 1: Create State-Specific Route

1. Create `CaliforniaAgencyGrid.tsx` (copy from `NewJerseyAgencyGrid.tsx`)
2. Update agency data for California
3. Add route in `main.tsx`:

```typescript
<Route
  path="/marketing-agencies-in-california-united-states/"
  element={<CaliforniaApp />}
/>
```

4. The existing `SubmitAgencyModal`, `SubmitAgencyOfferPage`, and `Top25ConfirmPage` work automatically by accepting `stateSlug` and `stateName` props.

### Option 2: Dynamic State Routing (Recommended)

Create a single `StateMarketingPage.tsx` component:

```typescript
function StateMarketingPage() {
  const { stateSlug } = useParams();
  // Load agencies for this state from database
  // Everything else is the same
  return (
    <div>
      <AgencyGrid stateSlug={stateSlug} />
      <SubmitAgencyModal stateSlug={stateSlug} stateName={stateData.name} />
    </div>
  );
}
```

Route in `main.tsx`:

```typescript
<Route
  path="/marketing-agencies-in-:stateSlug-united-states/"
  element={<StateMarketingPage />}
/>
```

**All upsells, pricing, and checkout logic work automatically!**

---

## Stripe Checkout Flow

### Creating a Session

When user clicks "Continue to secure your spot":

1. **Build line items** from selected products:
   ```typescript
   const lineItems = [
     { price: 'price_...listing...', quantity: 1 },
     { price: 'price_...addon1...', quantity: 1 }, // if selected
     { price: 'price_...addon2...', quantity: 1 }, // if selected
   ];
   ```

2. **Call edge function**:
   ```typescript
   const response = await fetch('/functions/v1/top25-checkout', {
     method: 'POST',
     headers: {
       'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
       'Content-Type': 'application/json',
     },
     body: JSON.stringify({
       stateSlug, stateName, rank, agencyName, lineItems, upsells
     }),
   });
   ```

3. **Redirect to Stripe**:
   ```typescript
   const { url } = await response.json();
   window.location.href = url;
   ```

### After Payment

**Success**: User redirected to `/success?session_id={CHECKOUT_SESSION_ID}`

**Cancel**: User returned to `/top-25/confirm?canceled=true`

**Webhook**: `stripe-webhook` edge function processes `checkout.session.completed` event and:
- Marks slot as claimed in database
- Sends confirmation email
- Activates subscription

---

## Environment Variables

Required in Supabase environment:

```bash
STRIPE_SECRET_KEY=sk_live_...   # or sk_test_... for testing
STRIPE_WEBHOOK_SECRET=whsec_... # for webhook verification
```

Required in frontend `.env`:

```bash
VITE_SUPABASE_URL=https://...supabase.co
VITE_SUPABASE_ANON_KEY=eyJ...
```

---

## Testing the Integration

### Test Checklist

1. **Submit Agency Form**
   - ✅ Fill in all fields
   - ✅ Navigate to spot selection

2. **Select Spot**
   - ✅ See available ranks (2 slots shown)
   - ✅ Click "Claim this spot"
   - ✅ Navigate to confirm page

3. **Confirm Page**
   - ✅ See agency name in title
   - ✅ See correct rank and tier
   - ✅ See correct base price
   - ✅ See all active upsells
   - ✅ Toggle upsells ON/OFF
   - ✅ Total updates correctly

4. **Checkout**
   - ✅ Click "Continue to secure your spot"
   - ✅ Button shows "Redirecting..."
   - ✅ Redirect to Stripe Checkout
   - ✅ See correct line items
   - ✅ See correct total
   - ✅ Complete test payment
   - ✅ Redirect to success page

5. **Webhooks**
   - ✅ `checkout.session.completed` received
   - ✅ Subscription metadata correct
   - ✅ Database updated
   - ✅ Confirmation email sent

### Test with Stripe Test Mode

Use test cards:
- Success: `4242 4242 4242 4242`
- Decline: `4000 0000 0000 0002`
- 3D Secure: `4000 0025 0000 3155`

---

## Error Handling

### Graceful Degradation

The system handles missing products gracefully:

1. **Missing listing product** → Show error screen with "Return Home" button
2. **Missing upsell product** → Hide that upsell (others still show)
3. **Checkout failure** → Show error message, keep user on confirm page
4. **Network error** → Show error banner, allow retry

### User-Facing Errors

```typescript
// Example error states:
'Product Configuration Error' // → Listing product not found
'Unable to start secure checkout' // → API/network error
'Failed to create checkout session' // → Stripe API error
```

All errors include:
- ✅ Clear, non-technical message
- ✅ Action button (retry or return home)
- ✅ Error logged to console (DEV mode)

---

## Future Enhancements

### Ready to Implement

1. **Spotlight Upsell** ($997)
   - Already configured in Stripe
   - Uncomment in `top25Upsells.ts`
   - Add to context initial state

2. **Quantity Upsells**
   - Allow multiple months of add-ons
   - Update line items to include quantity > 1

3. **Promo Codes**
   - Add coupon field to checkout
   - Pass to Stripe session

4. **Annual Billing**
   - Create 12-month products
   - Add toggle on confirm page

### Future Ideas

- **A/B Testing** different upsell copy
- **Dynamic Pricing** based on demand
- **Bundle Discounts** (e.g., save $20 when buying all 3)
- **Referral Credits** for agencies who refer others

---

## File Structure

```
src/
├── config/
│   ├── stripe.ts              # Single source of truth for products
│   └── top25Upsells.ts        # Central upsell configuration
├── contexts/
│   └── Top25CheckoutContext.tsx # Checkout state management
├── pages/
│   ├── SubmitAgencyOfferPage.tsx # Spot selection
│   ├── Top25ConfirmPage.tsx   # Upsell & checkout
│   └── Success.tsx            # Post-payment success
└── ...

supabase/functions/
├── top25-checkout/
│   └── index.ts               # Creates Stripe sessions
└── stripe-webhook/
    └── index.ts               # Processes payment events
```

---

## Key Benefits

### For Development

- ✅ **Single config** for all states
- ✅ **Type-safe** with TypeScript
- ✅ **No code duplication** across states
- ✅ **Easy to test** with Stripe test mode
- ✅ **Graceful errors** never crash the app

### For Business

- ✅ **Fast expansion** to new states
- ✅ **Easy upsell management** from one file
- ✅ **A/B test ready** (swap upsell configs)
- ✅ **Subscription recurring revenue**
- ✅ **Stripe handles billing & invoicing**

### For Users

- ✅ **Clear pricing** with no surprises
- ✅ **Secure checkout** via Stripe
- ✅ **Transparent billing** (6-month recurring)
- ✅ **Easy to cancel** via Stripe portal
- ✅ **Professional experience** with loading states

---

## Support & Troubleshooting

### Common Issues

**Q: Upsells not showing up**
A: Check that product exists in `stripe.ts` and `getAddonProduct()` returns non-null

**Q: Wrong price displayed**
A: Verify `amount` in `PRODUCT_CONFIGS` matches Stripe Dashboard

**Q: Checkout button not working**
A: Check browser console for errors, verify VITE_SUPABASE_URL is set

**Q: Redirect fails after payment**
A: Check success_url and cancel_url in edge function match deployed domain

**Q: Webhook not firing**
A: Verify STRIPE_WEBHOOK_SECRET is set and webhook endpoint is configured in Stripe Dashboard

### Debug Mode

Set in DEV environment:

```typescript
if (import.meta.env.DEV) {
  console.log('[Top25 Checkout] Line items:', lineItems);
  console.log('[Top25 Checkout] Upsells:', upsells);
}
```

---

## Summary

The Top 25 Stripe integration is:

- ✅ **Complete** - All features implemented
- ✅ **Future-proof** - Easy to add upsells
- ✅ **State-agnostic** - Works for all US states
- ✅ **Type-safe** - Full TypeScript coverage
- ✅ **Production-ready** - Error handling & loading states
- ✅ **Well-documented** - This guide + inline comments

**Adding a new upsell**: 4 steps, affects all states
**Adding a new state**: 1 component, all pricing automatic
**Changing prices**: Update in Stripe, sync to `stripe.ts`

---

**Last Updated**: 2025-12-01
**Version**: 1.0.0
**Status**: ✅ Production Ready
