/*
  # Fix: Remove Conflicting validation_status CHECK Constraint

  1. Problem
    - Two CHECK constraints exist on other_agency_emails.validation_status:
      (a) other_agency_emails_validation_status_check: ['unknown', 'valid', 'invalid', 'catch_all', 'risky', 'duplicate'] (OLD, no 'pending')
      (b) valid_statuses_including_pending: ['pending', 'valid', 'invalid', 'unknown', 'risky', 'catch_all', 'blocked', 'opted_out'] (NEW, has 'pending')
    - Inserts with validation_status='pending' fail the old constraint
    - This breaks email imports that use validation_status='pending'

  2. Solution
    - Drop the old restrictive constraint
    - Keep the new comprehensive constraint
    - Email inserts with 'pending' status will now succeed

  3. Impact
    - Fixes email insert failures in other-agencies-import-v2
    - Allows validation_status='pending' for newly imported emails
    - No data migration needed (no existing rows use 'pending' status)
    - Backward compatible with existing rows

  4. Allowed validation_status values after this fix
    - pending (new imports, not yet verified)
    - valid (passed validation, send-ready)
    - invalid (failed validation, do not send)
    - unknown (ListClean returned unknown, treat as invalid for send)
    - risky (ListClean flagged as risky, do not send)
    - catch_all (catch-all address, treat as invalid for send)
    - blocked (explicitly blocked, do not send)
    - opted_out (user opted out, do not send)
*/

-- Drop the old restrictive CHECK constraint
ALTER TABLE other_agency_emails
DROP CONSTRAINT other_agency_emails_validation_status_check;
