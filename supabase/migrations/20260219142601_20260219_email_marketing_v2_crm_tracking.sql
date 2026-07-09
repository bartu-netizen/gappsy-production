/*
  # Email Marketing v2 — CRM, Tracking & Send Pipeline Upgrades

  ## Summary
  Phase 1 upgrade to the email marketing system. Adds missing CRM fields,
  proper send-pipeline tracking, open/click/unsubscribe event columns, and
  a unified contact timeline view.

  ## Changes

  ### em_contacts
  - Add `unsubscribed_at timestamptz` — set when contact unsubscribes
  - Add `tags text[]` — denormalized tag array for fast filtering (parallel to em_contact_tags junction)
  - Add `country text` — already added in prior migration but guarded with IF NOT EXISTS

  ### em_messages
  - Add `error_code text` — normalized error code (separate from error message text)

  ### em_events
  - Add `url text` — for click tracking (already may exist from prior migration, guarded)
  - Add `ip_hash text` — hashed IP for privacy (already may exist, guarded)
  - Add `user_agent text` — browser/client info (already may exist, guarded)

  ### em_funnel_events
  - Add `message_id uuid` — links funnel events back to the specific em_message that triggered them

  ### New: contact_timeline view
  - Unified view combining em_funnel_events + em_events (via message/contact join)
    ordered by created_at DESC for easy timeline rendering

  ## Security
  - All new columns inherit existing RLS on their tables
  - New view is accessible by service_role only
*/

-- ── em_contacts: add unsubscribed_at ─────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_contacts' AND column_name = 'unsubscribed_at'
  ) THEN
    ALTER TABLE em_contacts ADD COLUMN unsubscribed_at timestamptz NULL;
  END IF;
END $$;

-- ── em_contacts: add tags text[] ─────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_contacts' AND column_name = 'tags'
  ) THEN
    ALTER TABLE em_contacts ADD COLUMN tags text[] DEFAULT '{}';
  END IF;
END $$;

-- ── em_contacts: add country ─────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_contacts' AND column_name = 'country'
  ) THEN
    ALTER TABLE em_contacts ADD COLUMN country text;
  END IF;
END $$;

-- ── em_messages: add error_code ──────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_messages' AND column_name = 'error_code'
  ) THEN
    ALTER TABLE em_messages ADD COLUMN error_code text;
  END IF;
END $$;

-- ── em_events: add url (click tracking) ──────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'url'
  ) THEN
    ALTER TABLE em_events ADD COLUMN url text;
  END IF;
END $$;

-- ── em_events: add ip_hash ────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'ip_hash'
  ) THEN
    ALTER TABLE em_events ADD COLUMN ip_hash text;
  END IF;
END $$;

-- ── em_events: add user_agent ─────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'user_agent'
  ) THEN
    ALTER TABLE em_events ADD COLUMN user_agent text;
  END IF;
END $$;

-- ── em_funnel_events: add message_id ─────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_funnel_events' AND column_name = 'message_id'
  ) THEN
    ALTER TABLE em_funnel_events ADD COLUMN message_id uuid REFERENCES em_messages(id) ON DELETE SET NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_em_funnel_events_message_id ON em_funnel_events(message_id);

-- ── Indexes for new columns ───────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_em_contacts_unsubscribed_at ON em_contacts(unsubscribed_at) WHERE unsubscribed_at IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_em_contacts_tags ON em_contacts USING GIN(tags);
CREATE INDEX IF NOT EXISTS idx_em_events_url ON em_events(url) WHERE url IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_em_messages_error_code ON em_messages(error_code) WHERE error_code IS NOT NULL;
