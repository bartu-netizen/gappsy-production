/*
  # Repair: 8grape Top-25 Slot Activation (New York, Rank #12)

  ## Problem
  A paid Top-25 upgrade checkout for agency 8grape (New York, rank #12, $150)
  completed successfully and is recorded in stripe_orders (id=18), but the
  corresponding top25_slots row (id=431e9d94-2f5c-4001-987e-699da961a9b8) was
  never updated. The slot still shows agency_name="SEM Nexus", is_paid=false,
  is_available=true, slot_status="reserved".

  ## Root Cause
  The stripe-webhook's isTop25 guard only matched "top25" and "top25_rank" —
  not "top25_upgrade". Because metadata.upgrade_offer was not "true", the
  handleUpgradeCompletion path was also skipped. The webhook ran but neither
  activation code path fired.

  ## Fix
  This migration directly activates the slot using data already present in
  stripe_orders row id=18:
  - agency_id: d57e1745-15f0-416e-b4d1-6b542ac8d12d  (8grape)
  - checkout_session_id: cs_live_a1F5JXIBo...  (from stripe_orders)
  - subscription_id: sub_1TXiLmIoPJm5BB2XHEhCBqNK
  - top25_slot_id: 431e9d94-2f5c-4001-987e-699da961a9b8

  ## Safety
  - Updates ONLY slot id=431e9d94 where is_paid IS FALSE (idempotent guard)
  - Also updates other_agencies is_paid_listing=true for 8grape
  - Does not touch any other slot or agency row

  ## Tables Modified
  - top25_slots: slot 431e9d94 → is_paid=true, is_available=false, slot_status="sold"
  - other_agencies: agency d57e1745 → is_paid_listing=true
*/

DO $$
DECLARE
  v_slot_id uuid := '431e9d94-2f5c-4001-987e-699da961a9b8';
  v_agency_id uuid := 'd57e1745-15f0-416e-b4d1-6b542ac8d12d';
  v_checkout_session_id text := 'cs_live_a1F5JXIBo1k0VXJfMNMzgmJiZMFxaMCa0c8MLWJEPMvvRfnXZFoECJk0tSdRFdBuR1y9Uh';
  v_subscription_id text := 'sub_1TXiLmIoPJm5BB2XHEhCBqNK';
  v_now timestamptz := now();
  v_rows_updated int;
BEGIN
  -- 1. Activate the top25_slots row (only if not already paid — idempotent)
  UPDATE top25_slots
  SET
    agency_id                = v_agency_id,
    is_paid                  = true,
    is_available             = false,
    slot_status              = 'sold',
    billing_status           = 'paid',
    status_updated_at        = v_now,
    status_reason            = 'stripe_payment',
    status_updated_by        = 'manual_repair_migration',
    purchased_at             = v_now,
    stripe_checkout_session_id = v_checkout_session_id,
    stripe_subscription_id   = v_subscription_id,
    updated_at               = v_now
  WHERE id = v_slot_id
    AND is_paid = false;

  GET DIAGNOSTICS v_rows_updated = ROW_COUNT;

  IF v_rows_updated = 0 THEN
    RAISE NOTICE 'top25_slots row % was already paid or not found — no update applied', v_slot_id;
  ELSE
    RAISE NOTICE 'top25_slots row % activated for agency %', v_slot_id, v_agency_id;
  END IF;

  -- 2. Ensure other_agencies.is_paid_listing=true for 8grape (idempotent)
  UPDATE other_agencies
  SET
    is_paid_listing = true,
    updated_at      = v_now
  WHERE id = v_agency_id
    AND is_paid_listing = false;

  GET DIAGNOSTICS v_rows_updated = ROW_COUNT;

  IF v_rows_updated = 0 THEN
    RAISE NOTICE 'other_agencies row % was already paid or not found — no update applied', v_agency_id;
  ELSE
    RAISE NOTICE 'other_agencies row % marked is_paid_listing=true', v_agency_id;
  END IF;
END $$;
