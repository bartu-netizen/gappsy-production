/*
  # Seed top25_upgrade_selected notification setting

  1. Changes
    - Inserts a new notification type `top25_upgrade_selected` into `email_notification_settings`
    - Enabled by default so admin receives email when an agency selects a Top-25 upgrade position
  2. Security
    - No schema changes, just a data insert
*/

INSERT INTO email_notification_settings (notification_type, is_enabled, subject_template, recipient_emails)
VALUES (
  'top25_upgrade_selected',
  true,
  'Agency selected Top-25 upgrade position: {{agency_name}}',
  'bartu@gappsy.com'
)
ON CONFLICT (notification_type) DO NOTHING;
