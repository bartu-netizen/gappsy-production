/*
  # Expand other_agency_emails outreach_status allowed values

  1. Changes
    - Add 'synced_to_smartlead' and 'blocked' to outreach_status CHECK constraint
    - These values are used by Smartlead sync/webhook processing
    - Maintain backward compatibility with existing data

  2. Safety
    - Existing rows with 'not_sent', 'sent', 'replied', 'bounced', 'opted_out' continue to work
    - New sync operations can write 'synced_to_smartlead' status
    - Webhook handlers can update status to 'blocked'

  3. Migration approach
    - Drop existing CHECK constraint
    - Add new expanded CHECK constraint
    - No data migrations needed (existing values remain valid)
*/

DO $$
BEGIN
  IF EXISTS (
    SELECT constraint_name
    FROM information_schema.table_constraints
    WHERE table_name = 'other_agency_emails'
      AND constraint_name LIKE '%outreach_status%'
      AND constraint_type = 'CHECK'
  ) THEN
    ALTER TABLE other_agency_emails
    DROP CONSTRAINT IF EXISTS other_agency_emails_outreach_status_check;
  END IF;
END $$;

ALTER TABLE other_agency_emails
ADD CONSTRAINT other_agency_emails_outreach_status_check
CHECK (outreach_status IN (
  'not_sent',
  'sent',
  'synced_to_smartlead',
  'replied',
  'bounced',
  'opted_out',
  'blocked'
));
