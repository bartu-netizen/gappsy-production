/*
  # Ensure critical notification settings exist with hardened defaults

  1. Purpose
    - Guarantee that critical internal admin notifications can NEVER silently break
    - Ensure email_notification_settings rows exist for:
      - your_agency_profile_click
      - availability_check
    - Set safe defaults so admin notifications always reach bartu@gappsy.com

  2. Changes
    - Insert email_notification_settings rows if missing
    - Update existing rows with blank/null recipient_emails to use bartu@gappsy.com
    - Enable both notification types by default

  3. Security
    - No schema changes
    - Data-only updates
    - Ensures admin notifications can never be silently dropped
*/

-- Ensure your_agency_profile_click notification settings exist
INSERT INTO email_notification_settings (
  notification_type,
  is_enabled,
  recipient_emails,
  subject_template,
  body_html,
  body_text
)
VALUES (
  'your_agency_profile_click',
  true,
  'bartu@gappsy.com',
  '/your-agency profile clicked: {{agency}}',
  '',
  NULL
)
ON CONFLICT (notification_type) 
DO UPDATE SET
  recipient_emails = CASE 
    WHEN email_notification_settings.recipient_emails IS NULL 
      OR email_notification_settings.recipient_emails = '' 
    THEN 'bartu@gappsy.com'
    ELSE email_notification_settings.recipient_emails
  END,
  is_enabled = COALESCE(email_notification_settings.is_enabled, true);

-- Ensure availability_check notification settings exist
INSERT INTO email_notification_settings (
  notification_type,
  is_enabled,
  recipient_emails,
  subject_template,
  body_html,
  body_text
)
VALUES (
  'availability_check',
  true,
  'bartu@gappsy.com',
  'New Availability Check: {{agency}}',
  '',
  NULL
)
ON CONFLICT (notification_type) 
DO UPDATE SET
  recipient_emails = CASE 
    WHEN email_notification_settings.recipient_emails IS NULL 
      OR email_notification_settings.recipient_emails = '' 
    THEN 'bartu@gappsy.com'
    ELSE email_notification_settings.recipient_emails
  END,
  is_enabled = COALESCE(email_notification_settings.is_enabled, true);
