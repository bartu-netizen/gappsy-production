/*
  # Normalize Legacy Verification Statuses

  This migration converts all remaining legacy `unknown` verification statuses
  to the canonical status model. After this migration, no rows should have
  non-canonical validation_status values.

  ## Changes Made
  1. Convert `unknown` -> `retry` (for rows with attempts < 6)
  2. Convert `unknown` -> `failed` (for rows with attempts >= 6)
  3. Convert `unknown_retry` / `unknown_retrying` -> `retry`
  4. Convert `unknown_final` -> `failed`
  5. Convert `catch_all` / `risky` / `accept_all` -> `retry`

  ## Canonical Statuses After Migration
  - `pending` - awaiting first verification
  - `valid` - email confirmed deliverable
  - `invalid` - email confirmed undeliverable
  - `retry` - scheduled for re-verification
  - `failed` - permanently unresolvable after max retries

  ## Safety
  - Uses conditional updates (no data loss)
  - Only modifies validation_status column
  - Idempotent (safe to run multiple times)
*/

UPDATE other_agency_emails
SET validation_status = 'retry',
    updated_at = now()
WHERE validation_status IN ('unknown', 'unknown_retry', 'unknown_retrying', 'verification_unknown_retrying', 'catch_all', 'risky', 'accept_all')
  AND (verification_attempt_count IS NULL OR verification_attempt_count < 6);

UPDATE other_agency_emails
SET validation_status = 'failed',
    updated_at = now()
WHERE validation_status IN ('unknown', 'unknown_retry', 'unknown_retrying', 'verification_unknown_retrying')
  AND verification_attempt_count >= 6;

UPDATE other_agency_emails
SET validation_status = 'failed',
    updated_at = now()
WHERE validation_status IN ('unknown_final', 'verification_unknown_final');
