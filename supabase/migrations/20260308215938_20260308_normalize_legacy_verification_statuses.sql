/*
  # Normalize legacy verification statuses to canonical values

  1. Changes
    - Convert legacy 'unknown_retry' status to canonical 'retry'
    - Convert legacy 'unknown_final' status to canonical 'failed'
    - Convert legacy 'unknown' status to canonical 'retry' (pending re-verification)
    
  2. Purpose
    - Ensure all verification statuses use canonical values
    - Simplify codebase by eliminating legacy status handling
    - Enable consistent reporting across all dashboards
*/

UPDATE other_agency_emails
SET validation_status = 'retry',
    updated_at = now()
WHERE validation_status = 'unknown_retry';

UPDATE other_agency_emails
SET validation_status = 'failed',
    updated_at = now()
WHERE validation_status = 'unknown_final';

UPDATE other_agency_emails
SET validation_status = 'retry',
    updated_at = now()
WHERE validation_status = 'unknown';
