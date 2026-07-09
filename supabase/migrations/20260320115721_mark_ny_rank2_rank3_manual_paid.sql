/*
  # Mark New York Rank 2 and Rank 3 as Manually Paid

  ## Summary
  Two specific top-25 slots in New York were paid for manually (one-time payments)
  but were never marked as sold in the database. This migration sets them to the
  correct sold/locked state using existing fields only.

  ## Records Updated (ONLY these 2)
  1. New York Rank #2 — Calta Marketing   (id: 89b91678-b7ae-4adf-9247-e5f16341d9f7)
  2. New York Rank #3 — Daniel James Consulting (id: be1e6868-a29e-465e-84c9-e2d2b1bbfe2a)

  ## Fields Changed
  - is_paid: false → true
  - is_available: true → false
  - slot_status: 'available' → 'sold'
  - sale_source: null → 'manual'
  - locked_by_admin: false → true
  - locked_reason: null → 'Manually paid - pre-existing client'
  - claimed_at: null → now()
  - purchased_at: null → now()

  ## Safety
  - Scoped strictly by UUID — no other records can be affected
  - No schema changes, no new columns
  - No other states or ranks are touched
*/

UPDATE top25_slots
SET
  is_paid         = true,
  is_available    = false,
  slot_status     = 'sold',
  sale_source     = 'manual',
  locked_by_admin = true,
  locked_reason   = 'Manually paid - pre-existing client',
  claimed_at      = COALESCE(claimed_at, now()),
  purchased_at    = COALESCE(purchased_at, now()),
  updated_at      = now()
WHERE id IN (
  '89b91678-b7ae-4adf-9247-e5f16341d9f7',
  'be1e6868-a29e-465e-84c9-e2d2b1bbfe2a'
);
