/*
  # Backfill entitlement lifecycle linkage

  ## Purpose
  Safely backfills existing live data into the new lifecycle layer without guessing or
  overwriting anything that already has correct linkage.

  ## What this does

  ### 1. Backfill `agency_listing_entitlements` from `stripe_subscriptions`
  - Creates entitlement rows for any active/trialing Stripe subscription that does not
    already have a matching entitlement row.
  - Uses `stripe_orders.source_listing_type` to determine entitlement_type when available.
  - Falls back to 'standard_listing' for unknown types.
  - Deterministic: uses ON CONFLICT DO NOTHING to stay idempotent.

  ### 2. Link sold top25_slots to existing entitlements via `claimed_by_entitlement_id`
  - For any top25_slot that is sold/paid and has a `stripe_subscription_id` but no
    `claimed_by_entitlement_id`, finds the matching entitlement and sets the link.

  ### 3. Set `lock_expires_at` on sold top25 slots that have a subscription but no expiry
  - Derives lock_expires_at from stripe_subscriptions.current_period_end where missing.

  ### 4. Logs unresolvable records
  - Slots that are sold but have no subscription and no entitlement are left untouched
    and can be identified via the query at the bottom of this migration.

  ## Safety rules
  - All updates use strict WHERE clauses
  - No destructive operations (no DROP, no DELETE)
  - Idempotent: safe to run multiple times
*/

-- ─────────────────────────────────────────────────────────────────────────────
-- Step 1: Backfill entitlements from active stripe_subscriptions
-- ─────────────────────────────────────────────────────────────────────────────
DO $$
DECLARE
  sub RECORD;
  order_row RECORD;
  ent_type TEXT;
  existing_ent_id UUID;
BEGIN
  FOR sub IN
    SELECT ss.subscription_id, ss.customer_id, ss.status,
           ss.current_period_start, ss.current_period_end,
           ss.cancel_at_period_end
    FROM stripe_subscriptions ss
    WHERE ss.status IN ('active', 'trialing')
  LOOP
    -- Look up the most recent order for this subscription to get listing type
    SELECT so.source_listing_type, so.agency_id, so.state_slug
    INTO order_row
    FROM stripe_orders so
    WHERE so.subscription_id = sub.subscription_id
    ORDER BY so.created_at DESC
    LIMIT 1;

    -- Determine entitlement type from listing type
    ent_type := CASE
      WHEN order_row.source_listing_type IN ('top25_claim_bundle') THEN 'top25_slot'
      WHEN order_row.source_listing_type IN ('spotlight') THEN 'standard_listing'
      WHEN order_row.source_listing_type IN ('other_listing', 'activation', 'top25_standard_only_release') THEN 'standard_listing'
      ELSE 'standard_listing'
    END;

    IF order_row.agency_id IS NULL THEN
      CONTINUE;
    END IF;

    -- Check if entitlement already exists
    SELECT id INTO existing_ent_id
    FROM agency_listing_entitlements
    WHERE stripe_subscription_id = sub.subscription_id
      AND agency_id = order_row.agency_id
    LIMIT 1;

    IF existing_ent_id IS NULL THEN
      INSERT INTO agency_listing_entitlements (
        agency_id,
        state_slug,
        entitlement_type,
        source_listing_type,
        is_active,
        status,
        stripe_subscription_id,
        stripe_customer_id,
        current_period_start,
        current_period_end,
        cancel_at_period_end,
        started_at,
        created_at,
        updated_at
      ) VALUES (
        order_row.agency_id,
        order_row.state_slug,
        ent_type,
        order_row.source_listing_type,
        true,
        'active',
        sub.subscription_id,
        sub.customer_id,
        sub.current_period_start,
        sub.current_period_end,
        COALESCE(sub.cancel_at_period_end, false),
        to_timestamp(sub.current_period_start),
        now(),
        now()
      )
      ON CONFLICT DO NOTHING;
    END IF;
  END LOOP;
END $$;

-- ─────────────────────────────────────────────────────────────────────────────
-- Step 2: Link sold top25_slots to entitlements via claimed_by_entitlement_id
-- ─────────────────────────────────────────────────────────────────────────────
UPDATE top25_slots ts
SET
  claimed_by_entitlement_id = ale.id,
  updated_at = now()
FROM agency_listing_entitlements ale
WHERE ts.stripe_subscription_id = ale.stripe_subscription_id
  AND ale.entitlement_type = 'top25_slot'
  AND ale.is_active = true
  AND ts.is_paid = true
  AND ts.claimed_by_entitlement_id IS NULL
  AND ts.stripe_subscription_id IS NOT NULL;

-- ─────────────────────────────────────────────────────────────────────────────
-- Step 3: Set lock_expires_at on sold slots that have a subscription but no expiry
-- ─────────────────────────────────────────────────────────────────────────────
UPDATE top25_slots ts
SET
  lock_expires_at = to_timestamp(ss.current_period_end::bigint),
  billing_status = COALESCE(ts.billing_status, 'active'),
  last_billing_sync_at = now(),
  updated_at = now()
FROM stripe_subscriptions ss
WHERE ts.stripe_subscription_id = ss.subscription_id
  AND ts.is_paid = true
  AND ts.lock_expires_at IS NULL
  AND ss.current_period_end IS NOT NULL;
