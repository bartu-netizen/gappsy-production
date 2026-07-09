/*
  # Seed default setting for stripe_checkout_opened notification

  1. What this does
    - Inserts a default row into email_notification_settings for the
      stripe_checkout_opened notification type
    - Sets bartu@gappsy.com as the default recipient
    - Leaves subject_template and body_html empty so the hardcoded rich
      template inside top25-checkout is used until customised via the UI
    - is_enabled = true so it fires immediately after deploy

  2. Notes
    - Uses INSERT ... ON CONFLICT DO NOTHING so re-running is safe
    - Does not override any existing admin customisation
*/

INSERT INTO email_notification_settings
  (notification_type, is_enabled, recipient_emails, subject_template, body_html, body_text, updated_at)
VALUES
  (
    'stripe_checkout_opened',
    true,
    'bartu@gappsy.com',
    '',
    '',
    NULL,
    now()
  )
ON CONFLICT (notification_type) DO NOTHING;
