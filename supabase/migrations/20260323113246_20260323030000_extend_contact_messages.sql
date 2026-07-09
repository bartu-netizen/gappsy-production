/*
  # Extend contact_messages for full inbox workflow

  ## Summary
  Adds rich submission tracking, inbox workflow fields, and email normalization
  to the existing contact_messages table. This powers the new WP-admin Contact
  Inbox feature without breaking any existing data or submissions.

  ## New Columns Added

  ### Request / UTM context
  - `page_url`       — full URL of the page the form was submitted from
  - `page_path`      — pathname only (e.g. /contact)
  - `referrer_url`   — HTTP referrer if available
  - `utm_source`     — UTM source parameter
  - `utm_medium`     — UTM medium parameter
  - `utm_campaign`   — UTM campaign parameter
  - `utm_term`       — UTM term parameter
  - `utm_content`    — UTM content parameter

  ### Visitor geo / device context
  - `country_code`   — 2-letter ISO country code from IP lookup
  - `country_name`   — full country name
  - `city`           — city from IP lookup
  - `device_type`    — inferred from user agent (mobile/desktop/tablet)

  ### Inbox workflow
  - `status`             — new | open | replied | closed | spam (default: new)
  - `thread_key`         — groups by sender email for conversation view
  - `message_direction`  — inbound | outbound (default: inbound)
  - `replied_at`         — when first reply was sent
  - `replied_by`         — who sent the reply
  - `outbound_reply_count` — count of sent replies
  - `category`           — support | sales | partnership | other | spam
  - `assigned_to`        — future: who this is assigned to
  - `internal_notes`     — admin-only internal notes

  ### Identity matching
  - `email_normalized`   — lowercase trimmed email for fast lookups

  ## Indexes
  - email_normalized (fast identity matching)
  - status (filter by inbox status)
  - created_at DESC (inbox sort order)
  - thread_key (conversation grouping)

  ## Notes
  1. All new columns are nullable — existing rows will have NULL for new fields
  2. email_normalized is backfilled from existing email column
  3. No existing columns are modified or removed
  4. status defaults to 'new' for existing rows via backfill
*/

ALTER TABLE contact_messages
  ADD COLUMN IF NOT EXISTS page_url text,
  ADD COLUMN IF NOT EXISTS page_path text,
  ADD COLUMN IF NOT EXISTS referrer_url text,
  ADD COLUMN IF NOT EXISTS utm_source text,
  ADD COLUMN IF NOT EXISTS utm_medium text,
  ADD COLUMN IF NOT EXISTS utm_campaign text,
  ADD COLUMN IF NOT EXISTS utm_term text,
  ADD COLUMN IF NOT EXISTS utm_content text,
  ADD COLUMN IF NOT EXISTS country_code text,
  ADD COLUMN IF NOT EXISTS country_name text,
  ADD COLUMN IF NOT EXISTS city text,
  ADD COLUMN IF NOT EXISTS device_type text,
  ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'new',
  ADD COLUMN IF NOT EXISTS thread_key text,
  ADD COLUMN IF NOT EXISTS message_direction text NOT NULL DEFAULT 'inbound',
  ADD COLUMN IF NOT EXISTS replied_at timestamptz,
  ADD COLUMN IF NOT EXISTS replied_by text,
  ADD COLUMN IF NOT EXISTS outbound_reply_count integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS category text,
  ADD COLUMN IF NOT EXISTS assigned_to text,
  ADD COLUMN IF NOT EXISTS internal_notes text,
  ADD COLUMN IF NOT EXISTS email_normalized text;

UPDATE contact_messages
SET
  email_normalized = lower(trim(email)),
  thread_key       = lower(trim(email))
WHERE email_normalized IS NULL;

CREATE INDEX IF NOT EXISTS idx_contact_messages_email_normalized
  ON contact_messages (email_normalized);

CREATE INDEX IF NOT EXISTS idx_contact_messages_status
  ON contact_messages (status);

CREATE INDEX IF NOT EXISTS idx_contact_messages_created_at
  ON contact_messages (created_at DESC);

CREATE INDEX IF NOT EXISTS idx_contact_messages_thread_key
  ON contact_messages (thread_key);
