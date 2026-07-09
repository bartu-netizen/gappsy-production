/*
  # Seed Activation Page Viewed Notification Setting

  1. Changes
    - Inserts a row in `email_notification_settings` for `activation_page_viewed`
    - Default recipient: bartu@gappsy.com
    - Default subject template: "Activation Page Viewed: {{agency_name}}"
    - is_enabled = true
    - body_html set to empty string so edge function falls back to canonical template

  2. Notes
    - ON CONFLICT DO NOTHING — safe to re-run; existing settings are preserved.
*/

INSERT INTO email_notification_settings (
  notification_type,
  is_enabled,
  recipient_emails,
  subject_template,
  body_html,
  body_text
) VALUES (
  'activation_page_viewed',
  true,
  'bartu@gappsy.com',
  'Activation Page Viewed: {{agency_name}}',
  '',
  ''
)
ON CONFLICT (notification_type) DO NOTHING;
