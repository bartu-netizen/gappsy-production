# ⚠️ ACTIVATION SETUP REQUIRED

The Activate Agency Listing ($97) button is now connected to Stripe, but you need to add your real Stripe price ID.

## Current Status

✅ Activation checkout flow is fully implemented
✅ No blocking alerts or homepage redirects
✅ Edge function has proper error handling
✅ Console logging shows detailed debug info

🔴 The checkout uses a **placeholder price ID** (`price_ACTIVATION_97`) which doesn't exist in your Stripe account.

When users click "Activate Agency Listing — $97 / for 6 months", the checkout will attempt to create a Stripe session but fail with a clear error message

## How to Fix (1 minute)

### Option A: Create Stripe Product (Recommended)

1. **Go to Stripe Dashboard** → [Products](https://dashboard.stripe.com/products)
2. **Click "Add product"**
3. **Fill in**:
   - Name: `Activate Agency Listing (6 months)`
   - Description: `Activate your agency listing to receive availability requests and improve your visibility. This subscription renews every 6 months unless cancelled.`
   - Pricing Model: **Recurring**
   - Price: **$97 USD**
   - Billing period: **Every 6 months**
4. **Save** and copy the price ID (starts with `price_1...`)
5. **Update** `/src/config/stripe.ts`:
   ```typescript
   agencyActivation: 'price_1XXXXXXXXXXXXXXXXXXXXX',  // ← Paste your price ID here
   ```

### Option B: Use Existing Price ID

If you already have a $97/6-month product in Stripe:

1. Find the price ID in your [Stripe Dashboard](https://dashboard.stripe.com/products)
2. Update `/src/config/stripe.ts`:
   ```typescript
   agencyActivation: 'price_1XXXXXXXXXXXXXXXXXXXXX',  // ← Your existing price ID
   ```

That's it! The checkout will work immediately.

## Complete Flow

```
Owner Dashboard/Preview
  ↓
Click "Activate Agency Listing — $97 / for 6 months"
  ↓
Stripe Checkout ($97 for 6 months)
  ↓
Payment Success
  ↓
/activation/upgrade page
  ↓
Shows 2 best available Top-25 spots
  ↓
Can upgrade for extra amount (e.g., $297 - $97 = $200)
  OR
  Skip and continue with standard listing
```

## Troubleshooting

### "Failed to start checkout"

Check browser console for detailed error:
- `[Activation Checkout]` logs show exact issue
- Edge function logs in Supabase show server-side errors

### "No such price"

- Your price ID is incorrect or doesn't exist
- Make sure you copied the full `price_1XXX...` ID from Stripe
- Verify the product exists in your Stripe account

### Still not working?

The edge function at `/supabase/functions/top25-checkout/index.ts` now has detailed logging:
- Check Supabase Edge Function logs
- Look for `[top25-checkout]` messages
- They'll show exactly what's failing

## What's Already Done

✅ Activation button connected to Stripe checkout
✅ Edge function handles activation listing type
✅ Success URL routes to `/activation/upgrade` page
✅ Upgrade page shows Top-25 upsell with differential pricing
✅ All blocking alerts and homepage redirects removed
✅ Comprehensive error handling and detailed logging
✅ Server-side validation of price IDs

🔴 **Only missing**: Your real Stripe price ID in `/src/config/stripe.ts`

## Technical Details

**Frontend Files Updated:**
- `src/pages/AvailabilityOwnerDashboardPage.tsx` - Removed blocking guards
- `src/pages/AvailabilityOwnerPreviewPage.tsx` - Removed blocking guards
- `src/config/stripe.ts` - Added activation product config
- `src/pages/ActivationUpgradePage.tsx` - Upsell page ready

**Backend:**
- `supabase/functions/top25-checkout/index.ts` - Validates price IDs, handles activation type

**Debugging:**
- Check browser console for `[Activation Checkout]` logs
- Check Supabase Edge Function logs for `[top25-checkout]` messages
- All errors show detailed context and next steps
