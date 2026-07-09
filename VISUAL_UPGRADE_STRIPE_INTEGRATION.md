# Visual Upgrade Badge - Stripe Integration Guide

## Current Status: ✅ Ready for Stripe Integration

The premium highlight badge (yellow lightning ribbon) is **fully implemented** and working for Vazagency. This document explains how to wire it to Stripe payments.

---

## 1. Data Model - Already Implemented ✅

### Agency Interface
```typescript
interface Agency {
  // ... other fields
  hasCardVisualUpgrade?: boolean;  // true = show yellow lightning badge
}
```

### Current State
- **Vazagency only**: `hasCardVisualUpgrade: true`
- **All other agencies**: `undefined` or `false`

---

## 2. Stripe Product Configuration - Already Set Up ✅

### Price ID (from `src/config/stripeProducts.ts`)
```typescript
const PRICE_IDS = {
  visualUpgrade: 'price_1SZPw3IoPJm5BB2Xh8ji6xPt',  // $37 / 6 months
  // ...
};
```

### Product Details
- **Name**: "Card Visual Upgrade (6-Month Add-On)"
- **Price**: $37
- **Type**: Recurring add-on (6-month subscription)
- **Description**: "Adds a premium highlight badge to your Listing card for increased visibility"

### Accessing the Product
```typescript
import { getAddonProduct } from './config/stripeProducts';

const visualUpgrade = getAddonProduct('visual');
// Returns: { id: 'price_1SZ...', label: '...', amount: 37 }
```

---

## 3. Stripe Checkout Integration

### When Creating Checkout Session

```typescript
// Example: When agency clicks "Add Visual Upgrade"
import { getAddonProduct } from './config/stripeProducts';

const visualUpgrade = getAddonProduct('visual');

if (!visualUpgrade) {
  console.error('Visual upgrade product not configured');
  return;
}

// Create Stripe Checkout Session
const checkoutData = {
  priceId: visualUpgrade.id,  // 'price_1SZPw3IoPJm5BB2Xh8ji6xPt'
  metadata: {
    agencyId: agency.id,           // Required: agency database ID
    productType: 'visualUpgrade',  // Helps identify in webhook
    agencySlug: agency.slug,       // Optional: for easy lookup
  }
};

// POST to your Stripe checkout edge function
const response = await fetch('/functions/v1/stripe-checkout', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${supabaseAnonKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify(checkoutData)
});
```

---

## 4. Database Schema (Supabase)

### Option A: Add Column to Existing Agencies Table
```sql
ALTER TABLE agencies
ADD COLUMN has_card_visual_upgrade BOOLEAN DEFAULT false,
ADD COLUMN visual_upgrade_purchased_at TIMESTAMPTZ,
ADD COLUMN visual_upgrade_expires_at TIMESTAMPTZ;

-- Index for quick filtering
CREATE INDEX idx_agencies_visual_upgrade
ON agencies(has_card_visual_upgrade)
WHERE has_card_visual_upgrade = true;
```

### Option B: Separate Subscription Tracking Table (Recommended)
```sql
-- Track all agency subscriptions/upgrades
CREATE TABLE agency_subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id UUID REFERENCES agencies(id) ON DELETE CASCADE,
  stripe_subscription_id TEXT UNIQUE,
  stripe_price_id TEXT NOT NULL,
  product_type TEXT NOT NULL,  -- 'visualUpgrade', 'listing', etc.
  status TEXT NOT NULL,         -- 'active', 'cancelled', 'past_due'
  current_period_start TIMESTAMPTZ,
  current_period_end TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Index for lookups
CREATE INDEX idx_agency_subscriptions_agency
ON agency_subscriptions(agency_id);

CREATE INDEX idx_agency_subscriptions_stripe
ON agency_subscriptions(stripe_subscription_id);

-- Enable RLS
ALTER TABLE agency_subscriptions ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own subscriptions
CREATE POLICY "Users can view own subscriptions"
ON agency_subscriptions FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM agencies
    WHERE agencies.id = agency_subscriptions.agency_id
    AND agencies.user_id = auth.uid()
  )
);
```

---

## 5. Webhook Handler (Supabase Edge Function)

### File: `supabase/functions/stripe-webhook/index.ts`

```typescript
import Stripe from 'npm:stripe@14.21.0';
import { createClient } from 'npm:@supabase/supabase-js@2';

const VISUAL_UPGRADE_PRICE_ID = 'price_1SZPw3IoPJm5BB2Xh8ji6xPt';

Deno.serve(async (req: Request) => {
  const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, {
    apiVersion: '2023-10-16',
  });

  // Verify webhook signature
  const signature = req.headers.get('stripe-signature');
  const webhookSecret = Deno.env.get('STRIPE_WEBHOOK_SECRET');

  let event: Stripe.Event;

  try {
    const body = await req.text();
    event = stripe.webhooks.constructEvent(body, signature!, webhookSecret!);
  } catch (err) {
    console.error('Webhook signature verification failed:', err.message);
    return new Response('Webhook Error', { status: 400 });
  }

  const supabase = createClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  );

  // Handle different event types
  switch (event.type) {
    case 'checkout.session.completed': {
      const session = event.data.object as Stripe.Checkout.Session;
      await handleCheckoutCompleted(session, supabase);
      break;
    }

    case 'invoice.paid': {
      const invoice = event.data.object as Stripe.Invoice;
      await handleInvoicePaid(invoice, supabase);
      break;
    }

    case 'customer.subscription.deleted': {
      const subscription = event.data.object as Stripe.Subscription;
      await handleSubscriptionDeleted(subscription, supabase);
      break;
    }

    case 'charge.refunded': {
      const charge = event.data.object as Stripe.Charge;
      await handleChargeRefunded(charge, supabase);
      break;
    }
  }

  return new Response(JSON.stringify({ received: true }), {
    headers: { 'Content-Type': 'application/json' },
  });
});

async function handleCheckoutCompleted(
  session: Stripe.Checkout.Session,
  supabase: any
) {
  const agencyId = session.metadata?.agencyId;
  const lineItems = session.line_items?.data || [];

  if (!agencyId) {
    console.error('No agencyId in session metadata');
    return;
  }

  // Check if visual upgrade was purchased
  const hasVisualUpgrade = lineItems.some(
    item => item.price?.id === VISUAL_UPGRADE_PRICE_ID
  );

  if (hasVisualUpgrade) {
    // Update agency record
    const { error } = await supabase
      .from('agencies')
      .update({
        has_card_visual_upgrade: true,
        visual_upgrade_purchased_at: new Date().toISOString(),
      })
      .eq('id', agencyId);

    if (error) {
      console.error('Failed to update agency:', error);
    } else {
      console.log(`Visual upgrade enabled for agency ${agencyId}`);
    }

    // Track subscription if using separate table
    if (session.subscription) {
      await supabase.from('agency_subscriptions').insert({
        agency_id: agencyId,
        stripe_subscription_id: session.subscription,
        stripe_price_id: VISUAL_UPGRADE_PRICE_ID,
        product_type: 'visualUpgrade',
        status: 'active',
        current_period_start: new Date().toISOString(),
      });
    }
  }
}

async function handleInvoicePaid(invoice: Stripe.Invoice, supabase: any) {
  // Handle recurring subscription renewals
  if (!invoice.subscription) return;

  const subscription = invoice.lines.data.find(
    line => line.price?.id === VISUAL_UPGRADE_PRICE_ID
  );

  if (subscription) {
    // Find agency by subscription ID
    const { data: sub } = await supabase
      .from('agency_subscriptions')
      .select('agency_id')
      .eq('stripe_subscription_id', invoice.subscription)
      .single();

    if (sub) {
      // Ensure upgrade is still active
      await supabase
        .from('agencies')
        .update({ has_card_visual_upgrade: true })
        .eq('id', sub.agency_id);
    }
  }
}

async function handleSubscriptionDeleted(
  subscription: Stripe.Subscription,
  supabase: any
) {
  // Remove visual upgrade when subscription is cancelled
  const { data: sub } = await supabase
    .from('agency_subscriptions')
    .select('agency_id, product_type')
    .eq('stripe_subscription_id', subscription.id)
    .single();

  if (sub && sub.product_type === 'visualUpgrade') {
    await supabase
      .from('agencies')
      .update({ has_card_visual_upgrade: false })
      .eq('id', sub.agency_id);

    await supabase
      .from('agency_subscriptions')
      .update({ status: 'cancelled' })
      .eq('stripe_subscription_id', subscription.id);
  }
}

async function handleChargeRefunded(charge: Stripe.Charge, supabase: any) {
  // Optional: Remove upgrade on refund
  // You may want to check if it's a full refund and if it's recent enough
  if (charge.amount_refunded === charge.amount) {
    // Handle full refund - similar to subscription deletion
  }
}
```

---

## 6. Frontend Implementation - Already Done ✅

### Badge Component
Location: `src/components/LightningBadge.tsx`

```tsx
export default function LightningBadge() {
  return (
    <div className="group absolute top-3 right-3 z-20">
      <img
        src="/featured-agency-badge.svg"
        alt="Featured Agency"
        className="w-[22px] h-[32px] drop-shadow-md"
      />
      <div className="pointer-events-none absolute -bottom-10 left-1/2 -translate-x-1/2 whitespace-nowrap rounded-md bg-black px-3 py-1.5 text-xs font-medium text-white opacity-0 transition-opacity duration-200 group-hover:opacity-100">
        Featured Agency
      </div>
    </div>
  );
}
```

### Card Integration
```tsx
<div className="agency-card relative">
  {agency.hasCardVisualUpgrade && <LightningBadge />}
  {/* rest of card content */}
</div>
```

### Where Badge Appears
- ✅ Top 25 listing cards (`NewJerseyAgencyGrid`)
- ✅ Other Agencies cards (`OtherAgencyCard`)
- ✅ Any future component using the agency interface

---

## 7. Testing Checklist

### Before Going Live
- [ ] Create test Stripe product/price for visual upgrade
- [ ] Test checkout flow with test credit card
- [ ] Verify webhook receives `checkout.session.completed`
- [ ] Verify `hasCardVisualUpgrade` is set to `true` in database
- [ ] Verify badge appears on agency's card immediately after purchase
- [ ] Test subscription renewal (invoice.paid)
- [ ] Test subscription cancellation
- [ ] Test refund scenario

### Stripe Dashboard Setup
1. Create webhook endpoint: `https://your-domain.com/functions/v1/stripe-webhook`
2. Select events to listen for:
   - `checkout.session.completed`
   - `invoice.paid`
   - `customer.subscription.deleted`
   - `charge.refunded` (optional)
3. Copy webhook signing secret to `STRIPE_WEBHOOK_SECRET` env var

---

## 8. Current Status Summary

### ✅ Already Implemented
- Data model (`hasCardVisualUpgrade` field)
- Badge component (`LightningBadge.tsx`)
- Card integration (Top 25 + Other Agencies)
- Stripe product configuration
- Tooltip on hover

### 🔧 Ready to Wire Up
- Database migration (add columns/tables)
- Webhook handler for Stripe events
- Checkout flow metadata
- Subscription tracking

### 🎯 Next Steps to Go Live
1. Add database columns/tables for tracking
2. Deploy webhook handler edge function
3. Configure Stripe webhook endpoint
4. Test end-to-end flow
5. Update any existing agencies who purchased this upsell

---

## 9. Example: Full Purchase Flow

```
User Journey:
1. Agency clicks "Add Visual Upgrade" ($37/6mo)
   → Frontend: POST to /stripe-checkout with agencyId in metadata

2. Stripe Checkout opens
   → User enters payment info
   → Stripe processes payment

3. Stripe sends webhook: checkout.session.completed
   → Webhook handler verifies signature
   → Extracts agencyId from metadata
   → Updates database: hasCardVisualUpgrade = true

4. Frontend fetches agency data
   → agency.hasCardVisualUpgrade === true
   → LightningBadge renders on all their cards
   → Yellow lightning ribbon appears! ⚡
```

---

## Notes

- The badge system is **completely frontend-driven** by the `hasCardVisualUpgrade` flag
- No code changes needed after Stripe integration - just set the database flag
- Badge appears/disappears based on subscription status
- Idempotent: Multiple webhook calls won't cause issues
- Graceful: Missing data fails silently (no crashes)
