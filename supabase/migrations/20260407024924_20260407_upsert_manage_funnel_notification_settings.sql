/*
  # Upsert email_notification_settings for manage funnel event types

  ## Summary
  Ensures the four manage listing funnel event types have rows in
  email_notification_settings so they are enabled by default and route
  notifications to bartu@gappsy.com.

  ## Changes

  ### Modified Tables
  - `email_notification_settings`
    - Upserts rows for `manage_funnel_opened`, `manage_remove_started`,
      `manage_recovered`, and `manage_remove_confirmed`
    - Sets `is_enabled = true` and `recipient_emails = 'bartu@gappsy.com'`
    - Uses ON CONFLICT DO NOTHING so existing custom settings are preserved

  ## Notes
  - Safe to run multiple times (idempotent)
  - Does not overwrite any row that already exists
*/

INSERT INTO email_notification_settings (notification_type, is_enabled, recipient_emails, subject_template, body_html)
VALUES
  ('manage_funnel_opened',    true, 'bartu@gappsy.com', 'Manage funnel opened — {{agency_name}}',        ''),
  ('manage_remove_started',   true, 'bartu@gappsy.com', 'Removal intent detected — {{agency_name}}',    ''),
  ('manage_recovered',        true, 'bartu@gappsy.com', 'Recovered from removal funnel — {{agency_name}}', ''),
  ('manage_remove_confirmed', true, 'bartu@gappsy.com', 'Listing removed — {{agency_name}}',             '')
ON CONFLICT (notification_type) DO NOTHING;
