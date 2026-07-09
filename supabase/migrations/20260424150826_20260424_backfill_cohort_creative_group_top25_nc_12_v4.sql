/*
  # Backfill Cohort Creative Group Top25 NC #12 sale (v4)

  Uses admin_audit_log correct columns: action/status/actor_session_type/state_slug/target_table/target_id/payload_hash.
*/

DO $$
DECLARE
  v_session_id text := 'cs_live_b1VjktqWTUXYYUL912KgnA6sLLMgEfIgesmm2Z2htKAngVpkQMivTNxnBY';
  v_agency_id uuid := '20c75c96-4ec7-40e1-96eb-1cc23f612639';
BEGIN
  INSERT INTO public.stripe_orders (
    checkout_session_id, agency_id, agency_name, state_slug, top25_rank,
    amount_total, amount_subtotal, currency, payment_status, status,
    reporting_category, customer_email, customer_name, product_summary,
    paid_at, created_at
  )
  VALUES (
    v_session_id, v_agency_id, 'Cohort Creative Group', 'north-carolina', 12,
    23400, 23400, 'usd', 'paid', 'completed',
    'core_listing_revenue', 'beverly@roseman.com', 'Beverly Roseman',
    'Top 25 North Carolina #12', now(), now()
  )
  ON CONFLICT (checkout_session_id) DO UPDATE SET
    agency_id = EXCLUDED.agency_id,
    agency_name = EXCLUDED.agency_name,
    state_slug = EXCLUDED.state_slug,
    top25_rank = EXCLUDED.top25_rank,
    payment_status = EXCLUDED.payment_status,
    status = EXCLUDED.status,
    reporting_category = EXCLUDED.reporting_category,
    paid_at = COALESCE(public.stripe_orders.paid_at, EXCLUDED.paid_at);

  UPDATE public.top25_slots
  SET
    is_available = false,
    is_paid = true,
    billing_status = 'paid',
    agency_id = v_agency_id,
    agency_name = 'Cohort Creative Group',
    content_status = 'needs_listing_content',
    is_content_locked = true,
    content_locked_at = now(),
    content_locked_reason = 'Paid sale awaiting owner-submitted listing content',
    content_locked_by_session_id = v_session_id,
    description = NULL,
    short_description = NULL,
    services = NULL,
    website = NULL,
    logo_url = NULL,
    stripe_checkout_session_id = v_session_id,
    purchased_at = now(),
    updated_at = now()
  WHERE state_slug = 'north-carolina' AND rank = 12;

  UPDATE public.other_agencies
  SET is_paid_listing = true, updated_at = now()
  WHERE id = v_agency_id;

  INSERT INTO public.admin_audit_log (
    actor_session_type, actor_email, action, target_table, target_id,
    state_slug, status, created_at
  )
  VALUES
    ('system', 'backfill@system', 'PAID_ORDER_PERSISTED', 'stripe_orders',
     v_session_id, 'north-carolina', 'success', now()),
    ('system', 'backfill@system', 'PAID_TOP25_MISSING_LISTING_DATA', 'top25_slots',
     v_session_id, 'north-carolina', 'success', now());
END $$;
