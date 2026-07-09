/*
  # Seed activation_option_selected notification setting

  1. New Notification Setting
    - `activation_option_selected` notification type
    - Enabled by default
    - Recipient: bartu@gappsy.com (admin-only, never sent to agency owners)
    - Subject template uses agency name and selected option label
    - Body HTML left empty (uses auto-generated rich email from edge function)

  2. Notes
    - This notification fires when an agency owner selects an activation option
      on the /activation/upgrade page, before they reach Stripe checkout
    - 30-minute server-side dedup keyed on agency_id + selected_option
    - Admin-only — no agency/client copy is ever sent
*/

INSERT INTO email_notification_settings (
  notification_type,
  is_enabled,
  recipient_emails,
  subject_template,
  body_html,
  body_text
)
VALUES (
  'activation_option_selected',
  true,
  'bartu@gappsy.com',
  '🟡 {{agency_name}} chose: {{selected_option}}',
  '',
  ''
)
ON CONFLICT (notification_type) DO NOTHING;
