/*
  # Add tracking proof fields to email_messages

  ## Summary
  Adds fields to email_messages so the admin can verify that the open-tracking pixel
  was actually injected into the outbound email and confirm tracking is active.

  ## New columns on email_messages
  - `final_body_html` (text) — the exact HTML that was sent to the SMTP server,
    after link-rewriting and pixel injection. Allows the admin to visually confirm
    the pixel is present.
  - `tracking_pixel_url` (text) — the full URL of the injected 1×1 tracking pixel.
  - `tracking_enabled` (boolean, default true) — whether tracking was active when
    the message was sent.

  ## Security
  - No new policies needed; existing email_messages RLS policies cover these columns.
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'email_messages' AND column_name = 'final_body_html'
  ) THEN
    ALTER TABLE email_messages ADD COLUMN final_body_html text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'email_messages' AND column_name = 'tracking_pixel_url'
  ) THEN
    ALTER TABLE email_messages ADD COLUMN tracking_pixel_url text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'email_messages' AND column_name = 'tracking_enabled'
  ) THEN
    ALTER TABLE email_messages ADD COLUMN tracking_enabled boolean NOT NULL DEFAULT true;
  END IF;
END $$;
