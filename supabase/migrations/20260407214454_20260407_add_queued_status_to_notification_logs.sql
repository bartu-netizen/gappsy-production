/*
  # Add 'queued' status to notification log tables

  ## Summary
  Extends the status CHECK constraints on `email_notification_logs` and 
  `manage_funnel_notification_log` tables to support a 'queued' status.

  This enables immediate synchronous insertion of log rows BEFORE background 
  email sending, ensuring visibility in /wp-admin/email-notifications even 
  if the background task fails.

  ## Changes

  1. **email_notification_logs** - Add 'queued' to status constraint
     - Old: ('sent', 'failed')
     - New: ('sent', 'failed', 'queued')

  2. **manage_funnel_notification_log** - Add 'queued' to status constraint
     - Old: ('sent', 'failed', 'skipped')
     - New: ('sent', 'failed', 'skipped', 'queued')

  ## Rationale
  The manage funnel notification system was inserting logs only AFTER background
  email sending completed. If the background task crashed or failed, no logs 
  appeared. This fix allows logs to be inserted immediately with status='queued',
  then updated to 'sent' or 'failed' after the email is sent.
*/

-- ── 1. Drop and recreate status constraint on email_notification_logs ──────

ALTER TABLE email_notification_logs
  DROP CONSTRAINT IF EXISTS email_notification_logs_status_check;

ALTER TABLE email_notification_logs
  ADD CONSTRAINT email_notification_logs_status_check
  CHECK (status IN ('sent', 'failed', 'queued'));

-- ── 2. Drop and recreate status constraint on manage_funnel_notification_log ─

ALTER TABLE manage_funnel_notification_log
  DROP CONSTRAINT IF EXISTS manage_funnel_notification_log_status_check;

ALTER TABLE manage_funnel_notification_log
  ADD CONSTRAINT manage_funnel_notification_log_status_check
  CHECK (status IN ('sent', 'failed', 'skipped', 'queued'));
