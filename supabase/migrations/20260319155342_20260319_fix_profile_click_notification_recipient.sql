/*
  # Fix your_agency_profile_click notification recipient

  1. Changes
    - Set `recipient_emails` to 'bartu@gappsy.com' for `your_agency_profile_click` notification type
    - Previously empty, causing fallback to SMTP_INTERNAL_EMAIL env var which may not be configured

  2. Security
    - No schema changes, data-only update
    - No RLS changes
*/

UPDATE email_notification_settings
SET recipient_emails = 'bartu@gappsy.com'
WHERE notification_type = 'your_agency_profile_click'
  AND (recipient_emails IS NULL OR recipient_emails = '');
