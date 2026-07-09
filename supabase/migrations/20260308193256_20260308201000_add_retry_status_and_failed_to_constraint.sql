/*
  # Add retry and failed to validation_status constraint

  ## Summary
  Updates the validation_status constraint to include 'retry' and 'failed' statuses
  for clearer status tracking.

  ## Status Model (Final)
  - `pending` - Initial state, awaiting first verification
  - `valid` - Verified as deliverable
  - `invalid` - Verified as undeliverable  
  - `retry` - Unknown result, scheduled for automatic retry (< 6 attempts)
  - `failed` - Permanently failed after max attempts
  - `unknown` - Legacy status (deprecated, use retry/failed)
  - `unknown_retry` - Legacy status (deprecated, use retry)
  - `unknown_final` - Legacy status (deprecated, use failed)
  - `catch_all` - Catch-all server (treated as valid for outreach)
  - `risky` - High risk email address
  - `blocked` - Email is blocked
  - `opted_out` - User opted out
  - `error` - System error during verification

  ## Notes
  - This ensures UI labels and backend statuses are consistent
  - New imports use 'pending' -> 'valid'/'invalid'/'retry'/'failed'
*/

-- Drop existing constraint and add updated one
ALTER TABLE other_agency_emails
DROP CONSTRAINT IF EXISTS valid_statuses_including_pending;

ALTER TABLE other_agency_emails
ADD CONSTRAINT valid_statuses_including_pending
CHECK (validation_status IS NULL OR validation_status IN (
  'pending',
  'valid',
  'invalid',
  'retry',
  'failed',
  'unknown',
  'unknown_retry',
  'unknown_final',
  'catch_all',
  'risky',
  'blocked',
  'opted_out',
  'error'
));

-- Migrate legacy statuses to new standardized ones
-- unknown_retry -> retry
UPDATE other_agency_emails
SET validation_status = 'retry'
WHERE validation_status = 'unknown_retry';

-- unknown_final -> failed
UPDATE other_agency_emails
SET validation_status = 'failed'
WHERE validation_status = 'unknown_final';

-- unknown with finalized_at -> failed
UPDATE other_agency_emails
SET validation_status = 'failed'
WHERE validation_status = 'unknown'
AND verification_finalized_at IS NOT NULL;

-- unknown without finalized_at but with retry -> retry
UPDATE other_agency_emails
SET validation_status = 'retry'
WHERE validation_status = 'unknown'
AND verification_finalized_at IS NULL
AND verification_next_retry_at IS NOT NULL;
