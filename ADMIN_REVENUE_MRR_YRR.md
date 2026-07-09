# Admin Revenue — MRR & YRR

## What is displayed

Two KPI cards appear on the Revenue > Overview tab alongside the existing six cards:

| Card | Value | Icon |
|------|-------|------|
| **MRR** | Monthly Recurring Revenue | Repeat |
| **YRR** | Yearly Recurring Revenue (MRR × 12) | CalendarDays |

Both values are independent of the 7d/30d/90d date range filter — they reflect the current state of active subscriptions.

---

## Data source

The edge function `stripe-admin-recurring-metrics` queries Stripe directly via the API (using `STRIPE_SECRET_KEY`). It lists all subscriptions with status `active` or `trialing`, expands their items and price data, then computes the normalized monthly equivalent for each item.

As a side effect, it upserts into:
- `stripe_prices` — price metadata including interval
- `stripe_subscription_items` — item-to-subscription mapping

---

## Normalization formulas

For each subscription item:

```
item_amount = price.unit_amount_cents × quantity

interval = month  →  monthly = item_amount / interval_count
interval = year   →  monthly = item_amount / (12 × interval_count)
interval = week   →  monthly = round(item_amount × 52 / (12 × interval_count))
interval = day    →  monthly = round(item_amount × 365 / (12 × interval_count))
```

```
MRR = sum of monthly equivalents across all active/trialing subs
YRR = MRR × 12
```

---

## Active subscription statuses included

| Status | Included |
|--------|----------|
| `active` | Yes |
| `trialing` | Yes |
| `past_due` | No |
| `canceled` | No |
| `incomplete` | No |
| `paused` | No |

---

## QA verification

| Scenario | MRR | YRR |
|----------|-----|-----|
| 1 active monthly sub @ $97/mo | $97 | $1,164 |
| 1 active yearly sub @ $970/yr | ~$81 | $970 |
| 1 quarterly sub @ $300 (interval=month, interval_count=3) | $100 | $1,200 |
| 2 qty on $50/mo price | $100 | $1,200 |
| Zero active subs | $0 | $0 |

---

## Files

| File | Purpose |
|------|---------|
| `src/lib/revenue/recurring.ts` | Pure helper: `normalizeToMonthlyCents`, `computeMRRCents`, `formatCentsAsCurrency` |
| `supabase/functions/stripe-admin-recurring-metrics/index.ts` | Edge function — queries Stripe, computes MRR/YRR, upserts price/item data |
| `supabase/migrations/create_stripe_prices_and_subscription_items.sql` | DB schema for stripe_prices and stripe_subscription_items |
| `src/pages/WpAdminStripePage.tsx` | UI — MRR/YRR cards added to Overview tab |
