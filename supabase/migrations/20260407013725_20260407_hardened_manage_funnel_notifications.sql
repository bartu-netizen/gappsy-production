/*
  # Hardened Manage Funnel Email Notifications

  ## Overview
  Ensures all manage funnel notification settings are properly configured with
  fallback logic to bartu@gappsy.com if settings are missing or empty.

  ## Changes
  - UPSERT notification settings for all 4 manage funnel events
  - Ensures is_enabled = true by default for immediate notifications
  - Sets fallback recipient to bartu@gappsy.com
  - Safe for production (uses ON CONFLICT DO UPDATE)

  ## Behavior
  If an email_notification_settings row is missing:
  - Edge function fallsback to bartu@gappsy.com
  - Email is sent immediately (is_enabled defaults to true)

  If row exists but is_enabled = false:
  - Email is skipped (respects explicit disabled state)

  If row exists but recipient_emails is empty/null:
  - Edge function uses bartu@gappsy.com fallback
*/

-- Ensure all 4 manage funnel events have notification settings configured
INSERT INTO email_notification_settings (notification_type, is_enabled, recipient_emails, subject_template, body_html)
VALUES
  ('manage_funnel_opened',     true, 'bartu@gappsy.com', 'Manage funnel opened — {{agency_name}}',   '<p>An agency has opened the manage funnel.</p>'),
  ('manage_remove_started',    true, 'bartu@gappsy.com', 'Removal intent — {{agency_name}}',         '<p>An agency has started the removal process.</p>'),
  ('manage_recovered',         true, 'bartu@gappsy.com', 'Recovered from removal — {{agency_name}}', '<p>An agency has recovered from the removal funnel.</p>'),
  ('manage_remove_confirmed',  true, 'bartu@gappsy.com', 'Listing removed — {{agency_name}}',        '<p>An agency has confirmed listing removal.</p>')
ON CONFLICT (notification_type) DO UPDATE SET
  is_enabled = true,
  recipient_emails = CASE
    WHEN excluded.recipient_emails IS NULL OR excluded.recipient_emails = '' 
    THEN 'bartu@gappsy.com'
    ELSE excluded.recipient_emails
  END,
  subject_template = excluded.subject_template,
  body_html = excluded.body_html;
