# Top-25 Inventory Repair — Admin Guide

## Problem this solves

The Revenue Health page was incorrectly reporting "39 states have fewer than 25 ranks."

**Root cause:** The health page queried `top25_slots` via the Supabase anon client, which has a default 1000-row page limit. With 52 states × 25 ranks = 1300 rows, the last ~300 rows (alphabetically the last ~13 states) were silently truncated — making those states appear to have 0 rows.

The database was always healthy (all 52 states had exactly 25 rows). The display was wrong.

## What was fixed

| Component | Fix |
|---|---|
| `WpAdminRevenueHealthPage.tsx` | Now fetches health data via `top25-revenue-health` edge function (service role, no row limit) instead of direct client query |
| `src/lib/usStateSlugs.ts` | New canonical 52-state slug list derived from `US_STATES` — single source of truth |
| `top25-inventory-repair` edge function | New edge function that runs server-side with service role, idempotent, returns per-state proof |
| Guardrail banner | Now uses `statesWithMissingRanks` from accurate server-side count |

## How to run a repair

1. Go to `/wp-admin/revenue-health`
2. If a red banner appears ("X states have fewer than 25 ranks"), click **Repair Inventory**
3. The function will:
   - Query each of the 52 states using service role (bypasses row limits)
   - Insert only the missing ranks — never overwrites existing agency content
   - Run a verification pass confirming all states have exactly 25 rows
   - Return `{ statesFixed, totalInserted, perState, verification }`

## Idempotency guarantee

Running repair multiple times is safe:
- Uses `INSERT` only for missing ranks
- The `UNIQUE(state_slug, rank)` constraint prevents duplicates
- Second run always returns `totalInserted: 0`

## Verification query (manual)

Run in Supabase SQL editor to confirm all 52 states have 25 rows:

```sql
SELECT state_slug, COUNT(*) as total
FROM top25_slots
GROUP BY state_slug
HAVING COUNT(*) != 25
ORDER BY state_slug;
-- Should return 0 rows when healthy
```

Full count check:
```sql
SELECT COUNT(*) as total_rows, COUNT(DISTINCT state_slug) as state_count
FROM top25_slots;
-- Should show: total_rows=1300, state_count=52
```

## Edge functions involved

| Function | Purpose |
|---|---|
| `top25-revenue-health` | Returns per-state slot counts using service role — used by health page |
| `top25-inventory-repair` | Inserts missing ranks idempotently — called by Repair Inventory button |
| `top25-ensure-all-states` | Legacy repair function — kept for backward compat but superseded by `top25-inventory-repair` |
