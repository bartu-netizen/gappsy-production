# Stripe Integration Guide for Top 25 Listings

This guide explains how to complete the Stripe integration for the Top 25 listing checkout flow.

## Current Implementation

The checkout funnel is fully built and functional:

1. ✅ Submit Agency conclusion page with two dynamic ranking spots
2. ✅ "Continue with this spot" buttons that navigate to confirmation page
3. ✅ Confirmation page with listing summary and upsell checkbox
4. ✅ State management for checkout flow (React Context)
5. ✅ Pricing configuration in `src/config/stripeProducts.ts`

## What's Missing

The actual Stripe checkout session creation needs to be implemented. Currently, it shows a placeholder alert.

## Steps to Complete Integration

### 1. Update Stripe Product IDs

Open `src/config/stripeProducts.ts` and replace the placeholder product IDs with your actual Stripe price IDs:

```typescript
export const LISTING_PRODUCTS = {
  standard: {
    id: '<FILL_ME_STANDARD_PRICE_ID>', // ← Replace with actual Stripe price ID
    label: 'Top 25 Standard Listing (6 months)',
    amount: 197,
  },
  priority: {
    id: '<FILL_ME_PRIORITY_PRICE_ID>', // ← Replace with actual Stripe price ID
    label: 'Top 25 Priority Listing (6 months)',
    amount: 247,
  },
  premium: {
    id: '<FILL_ME_PREMIUM_PRICE_ID>', // ← Replace with actual Stripe price ID
    label: 'Top 25 Premium Placement — Highest Rank (6 months)',
    amount: 297,
  },
} as const;

export const UPSELL_PRODUCTS = {
  spotlightBoost: {
    id: '<FILL_ME_UPSELL_PRICE_ID>', // ← Replace with actual Stripe price ID
    label: 'Top 25 Spotlight Boost',
    amount: 97,
  },
} as const;
```

### 2. Create a Stripe Checkout Edge Function

Create a new Supabase Edge Function to handle checkout session creation:

```bash
# File: supabase/functions/create-checkout/index.ts
```

```typescript
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@14.10.0";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2023-10-16",
});

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const { lineItems, metadata } = await req.json();

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      line_items: lineItems.map((item: any) => ({
        price: item.product,
        quantity: item.quantity || 1,
      })),
      mode: "payment",
      success_url: `${req.headers.get("origin")}/top-25/success?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${req.headers.get("origin")}/top-25/confirm`,
      metadata: metadata || {},
    });

    return new Response(
      JSON.stringify({ url: session.url }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Stripe error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 500,
      }
    );
  }
});
```

### 3. Update Top25ConfirmPage to Call the Edge Function

In `src/pages/Top25ConfirmPage.tsx`, replace the `handleCheckout` function:

```typescript
const handleCheckout = async () => {
  setIsProcessing(true);

  try {
    const lineItems = [
      {
        product: listingProduct.id,
        name: listingProduct.name,
        price: listingProduct.price,
        quantity: 1
      }
    ];

    if (upsellSelected) {
      lineItems.push({
        product: UPSELL_PRODUCT.id,
        name: UPSELL_PRODUCT.name,
        price: UPSELL_PRODUCT.price,
        quantity: 1
      });
    }

    const response = await fetch(
      `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/create-checkout`,
      {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          lineItems,
          metadata: {
            stateSlug: checkoutData.stateSlug,
            selectedRank: checkoutData.selectedRank,
            agencyName: checkoutData.agencyName,
            includesUpsell: upsellSelected
          }
        })
      }
    );

    const { url, error } = await response.json();

    if (error) {
      throw new Error(error);
    }

    // Redirect to Stripe Checkout
    window.location.href = url;
  } catch (error) {
    console.error('Checkout error:', error);
    alert('Failed to create checkout session. Please try again.');
    setIsProcessing(false);
  }
};
```

### 4. Create a Success Page

Create `src/pages/Top25SuccessPage.tsx` to handle successful payments:

```typescript
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Top25SuccessPage() {
  const navigate = useNavigate();

  useEffect(() => {
    // TODO: Verify payment and update top25_slots table
    // Mark the purchased slot as is_paid = true
  }, []);

  return (
    <div style={{ /* success page styling */ }}>
      <h1>Thank you for your purchase!</h1>
      <p>Your Top 25 listing is being processed...</p>
    </div>
  );
}
```

Add route in `src/main.tsx`:
```typescript
<Route path="/top-25/success" element={<Top25SuccessPage />} />
```

### 5. Handle Post-Payment Slot Update

Create a webhook handler to update the `top25_slots` table when payment succeeds:

```typescript
// supabase/functions/stripe-webhook/index.ts
// Listen for checkout.session.completed events
// Update top25_slots: SET is_paid = true, claimed_at = now()
// WHERE state_slug = metadata.stateSlug AND rank = metadata.selectedRank
```

## Testing

1. Test with Stripe test mode first
2. Use test card: `4242 4242 4242 4242`
3. Verify checkout flow works end-to-end
4. Check that `top25_slots` table updates correctly

## Current Flow Summary

1. User submits agency → sees two available ranking spots (#2 & #12 for New Jersey)
2. User clicks "Continue with this spot" → navigates to `/top-25/confirm`
3. Confirmation page shows listing details + optional $97 upsell
4. User clicks "Continue to secure your spot" → creates Stripe checkout session
5. User completes payment on Stripe → redirects to success page
6. Webhook updates database → slot marked as paid
7. Next user sees different available slots

## Pricing Tiers

Listing tiers are assigned based on which slot the user selects:

- **Premium**: $297 / 6 months (Higher/better rank slot)
- **Priority**: $247 / 6 months (Lower rank slot when gap < 10)
- **Standard**: $197 / 6 months (Lower rank slot when gap ≥ 10)

The upsell (Spotlight Boost) is always $97.

The first available slot gets the gold/premium styling, the second gets blue/standard styling.
