/*
  # Backfill NXS Creative Group paid funnel session

  ## Problem
  The funnel session for NXS Creative Group (agency_id: 5aeafe6b-d72f-48db-b62b-ed04faea8a4f)
  was created during a /your-agency demo walkthrough and was marked is_demo = true.

  When the REAL purchase came in via Stripe webhook (sub_1TCq2HIoPJm5BB2XTKaFVc6X,
  payment_intent pi_3TCq2HIoPJm5BB2X0OQx4b23, $334.00 USD), the funnel session was
  never updated to reflect the paid state.

  This means:
  - Analytics filtered it out (is_demo = true)
  - Sale appeared as $0 / 0 paid sessions in the funnel view
  - NXS Creative Group was invisible in the per-agency breakdown

  ## Fix
  Update the existing your_agency funnel session for NXS Creative Group to:
  - stage = 'paid'
  - payment_status = 'paid'
  - payment_source = 'webhook'
  - purchased_amount = 33400 (cents = $334.00)
  - purchased_product = 'Top 25 Rank #3 · New Jersey'
  - payment_intent_id = the real Stripe payment intent
  - is_demo = false (this was a real purchase, not a demo)
  - upsell_taken = true (card visual upsell was taken per order metadata)

  ## Source of truth
  stripe_orders.id = 2
  - subscription_id: sub_1TCq2HIoPJm5BB2XTKaFVc6X
  - payment_intent_id: pi_3TCq2HIoPJm5BB2X0OQx4b23
  - amount_total: 33400
  - paid_at: 2026-03-19 23:31:39
  - metadata: rank=3, stateName=new-jersey, agencyName=NXS Creative Group
*/

UPDATE funnel_sessions
SET
  stage            = 'paid',
  payment_status   = 'paid',
  payment_source   = 'webhook',
  purchased_amount = 33400,
  purchased_product= 'Top 25 Rank #3 · New Jersey',
  payment_intent_id= 'pi_3TCq2HIoPJm5BB2X0OQx4b23',
  is_demo          = false,
  upsell_taken     = true,
  last_event_name  = 'payment_success',
  last_event_at    = '2026-03-19 23:31:39+00',
  updated_at       = now()
WHERE id         = 'a41c0626-fad6-43ed-8824-c29fdb56f219'
  AND agency_id  = '5aeafe6b-d72f-48db-b62b-ed04faea8a4f'
  AND funnel_type= 'your_agency';
