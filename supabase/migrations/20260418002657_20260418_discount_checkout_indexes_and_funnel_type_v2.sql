/*
  # Discount Checkout Indexes and Funnel Type Extension

  1. New Indexes
    - `idx_discount_offers_agency_active_expiry` on discount_offers(agency_id, is_active, expires_at)
      - Fast lookup of active unexpired offers per agency (Smartlead CSV, admin panels)
    - `idx_funnel_events_offer_id` on funnel_events metadata->>'offer_id'
      - Filters discount-related events by offer ID in admin visibility

  2. Schema Changes
    - Extends funnel_sessions.funnel_type check constraint to include 'discount'
    - Preserves all existing valid values including 'request_replay'

  3. Important Notes
    - All operations idempotent
    - No data modified or deleted
*/

CREATE INDEX IF NOT EXISTS idx_discount_offers_agency_active_expiry
  ON discount_offers (agency_id, is_active, expires_at);

CREATE INDEX IF NOT EXISTS idx_funnel_events_offer_id
  ON funnel_events ((metadata->>'offer_id'))
  WHERE metadata->>'offer_id' IS NOT NULL;

ALTER TABLE funnel_sessions DROP CONSTRAINT IF EXISTS funnel_sessions_funnel_type_check;

ALTER TABLE funnel_sessions
  ADD CONSTRAINT funnel_sessions_funnel_type_check
  CHECK (funnel_type IN (
    'top25', 'spotlight', 'demo', 'availability', 'matched',
    'your_agency', 'activation', 'discount', 'manage', 'replay',
    'request_replay'
  ));
