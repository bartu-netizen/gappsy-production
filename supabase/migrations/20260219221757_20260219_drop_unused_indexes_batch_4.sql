/*
  # Drop Unused Indexes - Batch 4

  Remove final unused indexes
*/

DROP INDEX IF EXISTS public.idx_stripe_sub_items_subscription_id;
DROP INDEX IF EXISTS public.idx_stripe_sub_items_price_id;
DROP INDEX IF EXISTS public.idx_top25_slots_available_lookup;
DROP INDEX IF EXISTS public.idx_owner_demo_events_not_deleted;
