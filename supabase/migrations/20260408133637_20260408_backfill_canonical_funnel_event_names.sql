/*
  # Backfill Canonical Funnel Event Names

  ## Summary
  Renames all historical funnel events from old naming conventions to the new
  canonical `<context>_<object>_<action>` format established in the event
  refactoring sprint. Also corrects step numbers for checkout events that
  shifted when a new offer-page step (140) was inserted between activate (130)
  and checkout (previously 140, now 150).

  ## Changes

  ### Old → New Event Name Mapping
  | Old Name | New Name | Step Change |
  |---|---|---|
  | your_agency_landing_viewed | your_agency_landing_page_viewed | none (step 10) |
  | your_agency_overview_viewed | your_agency_profile_page_viewed | none (step 30) |
  | your_agency_see_listing_clicked | your_agency_start_receiving_cta_clicked | none (step 40) |
  | owner_preview_step2_started | owner_preview_check_availability_opened | none (step 70) |
  | demo_availability_modal_opened | owner_preview_check_availability_modal_opened | none (step 80) |
  | demo_availability_submitted | owner_preview_check_availability_submitted | none (step 90) |
  | demo_post_availability_result_viewed | owner_preview_check_availability_result_page_viewed | none (step 100) |
  | activation_upsell_viewed | owner_preview_missed_clients_cta_clicked | none (step 110) |
  | upgrade_positions_page_viewed | owner_preview_missed_clients_page_viewed | none (step 120) |
  | activate_listing_clicked | owner_preview_activate_listing_cta_clicked | none (step 130) |
  | stripe_checkout_opened | checkout_page_viewed | 140 → 150 |
  | stripe_checkout_completed | checkout_completed | 150 → 160 |

  ### Tables Updated
  - `funnel_events` — event_name and step_number columns
  - `funnel_sessions` — last_event_name, drop_off_event, drop_off_step_number, and step_number columns

  ## Notes
  1. All updates use safe WHERE-clause filtering so no unrelated rows are touched.
  2. Step number corrections are applied ONLY to the two events whose steps shifted.
  3. The funnel_sessions.stage column is NOT modified — stage values (checkout_started, paid)
     are string labels that did not change in this refactor.
*/

-- ============================================================
-- PART 1: Backfill funnel_events table
-- ============================================================

UPDATE funnel_events SET event_name = 'your_agency_landing_page_viewed'
  WHERE event_name = 'your_agency_landing_viewed';

UPDATE funnel_events SET event_name = 'your_agency_profile_page_viewed'
  WHERE event_name = 'your_agency_overview_viewed';

UPDATE funnel_events SET event_name = 'your_agency_start_receiving_cta_clicked'
  WHERE event_name = 'your_agency_see_listing_clicked';

UPDATE funnel_events SET event_name = 'owner_preview_check_availability_opened'
  WHERE event_name = 'owner_preview_step2_started';

UPDATE funnel_events SET event_name = 'owner_preview_check_availability_modal_opened'
  WHERE event_name = 'demo_availability_modal_opened';

UPDATE funnel_events SET event_name = 'owner_preview_check_availability_submitted'
  WHERE event_name = 'demo_availability_submitted';

UPDATE funnel_events SET event_name = 'owner_preview_check_availability_result_page_viewed'
  WHERE event_name = 'demo_post_availability_result_viewed';

UPDATE funnel_events SET event_name = 'owner_preview_missed_clients_cta_clicked'
  WHERE event_name = 'activation_upsell_viewed';

UPDATE funnel_events SET event_name = 'owner_preview_missed_clients_page_viewed'
  WHERE event_name = 'upgrade_positions_page_viewed';

UPDATE funnel_events SET event_name = 'owner_preview_activate_listing_cta_clicked'
  WHERE event_name = 'activate_listing_clicked';

UPDATE funnel_events
  SET event_name = 'checkout_page_viewed', step_number = 150
  WHERE event_name = 'stripe_checkout_opened';

UPDATE funnel_events
  SET event_name = 'checkout_completed', step_number = 160
  WHERE event_name = 'stripe_checkout_completed';

-- ============================================================
-- PART 2: Backfill funnel_sessions — last_event_name
-- ============================================================

UPDATE funnel_sessions SET last_event_name = 'your_agency_landing_page_viewed'
  WHERE last_event_name = 'your_agency_landing_viewed';

UPDATE funnel_sessions SET last_event_name = 'your_agency_profile_page_viewed'
  WHERE last_event_name = 'your_agency_overview_viewed';

UPDATE funnel_sessions SET last_event_name = 'your_agency_start_receiving_cta_clicked'
  WHERE last_event_name = 'your_agency_see_listing_clicked';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_check_availability_opened'
  WHERE last_event_name = 'owner_preview_step2_started';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_check_availability_modal_opened'
  WHERE last_event_name = 'demo_availability_modal_opened';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_check_availability_submitted'
  WHERE last_event_name = 'demo_availability_submitted';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_check_availability_result_page_viewed'
  WHERE last_event_name = 'demo_post_availability_result_viewed';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_missed_clients_cta_clicked'
  WHERE last_event_name = 'activation_upsell_viewed';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_missed_clients_page_viewed'
  WHERE last_event_name = 'upgrade_positions_page_viewed';

UPDATE funnel_sessions SET last_event_name = 'owner_preview_activate_listing_cta_clicked'
  WHERE last_event_name = 'activate_listing_clicked';

UPDATE funnel_sessions
  SET last_event_name = 'checkout_page_viewed', step_number = 150
  WHERE last_event_name = 'stripe_checkout_opened';

UPDATE funnel_sessions
  SET last_event_name = 'checkout_completed', step_number = 160
  WHERE last_event_name = 'stripe_checkout_completed';

-- ============================================================
-- PART 3: Backfill funnel_sessions — drop_off_event
-- ============================================================

UPDATE funnel_sessions SET drop_off_event = 'your_agency_landing_page_viewed'
  WHERE drop_off_event = 'your_agency_landing_viewed';

UPDATE funnel_sessions SET drop_off_event = 'your_agency_profile_page_viewed'
  WHERE drop_off_event = 'your_agency_overview_viewed';

UPDATE funnel_sessions SET drop_off_event = 'your_agency_start_receiving_cta_clicked'
  WHERE drop_off_event = 'your_agency_see_listing_clicked';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_check_availability_opened'
  WHERE drop_off_event = 'owner_preview_step2_started';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_check_availability_modal_opened'
  WHERE drop_off_event = 'demo_availability_modal_opened';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_check_availability_submitted'
  WHERE drop_off_event = 'demo_availability_submitted';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_check_availability_result_page_viewed'
  WHERE drop_off_event = 'demo_post_availability_result_viewed';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_missed_clients_cta_clicked'
  WHERE drop_off_event = 'activation_upsell_viewed';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_missed_clients_page_viewed'
  WHERE drop_off_event = 'upgrade_positions_page_viewed';

UPDATE funnel_sessions SET drop_off_event = 'owner_preview_activate_listing_cta_clicked'
  WHERE drop_off_event = 'activate_listing_clicked';

UPDATE funnel_sessions
  SET drop_off_event = 'checkout_page_viewed', drop_off_step_number = 150
  WHERE drop_off_event = 'stripe_checkout_opened';

UPDATE funnel_sessions
  SET drop_off_event = 'checkout_completed', drop_off_step_number = 160
  WHERE drop_off_event = 'stripe_checkout_completed';
