/*
  # top25_slots content lock + content_status

  1. Changes
    - Adds `content_status` text (default 'complete') — values: 'complete' | 'needs_listing_content'.
    - Adds `is_content_locked` boolean (default false) and `content_locked_at` timestamptz.
    - Adds `content_locked_reason` text (default NULL) e.g. 'paid_sale'.
    - Adds `content_locked_by_session_id` text linking back to stripe checkout session.

  2. Purpose
    - Protect paid Top25 slots from being overwritten by imports / placeholder
      refreshes / scraping / unpaid slot regeneration.
    - Surface "Needs listing content" state in admin for paid sales where the
      description/services/website/logo have not been provided yet.

  3. Security
    - No RLS changes. Table already RLS-enabled. New columns inherit policies.
*/

ALTER TABLE public.top25_slots
  ADD COLUMN IF NOT EXISTS content_status text NOT NULL DEFAULT 'complete',
  ADD COLUMN IF NOT EXISTS is_content_locked boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS content_locked_at timestamptz,
  ADD COLUMN IF NOT EXISTS content_locked_reason text,
  ADD COLUMN IF NOT EXISTS content_locked_by_session_id text;

DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints
                 WHERE constraint_name='top25_slots_content_status_chk') THEN
    ALTER TABLE public.top25_slots
      ADD CONSTRAINT top25_slots_content_status_chk
      CHECK (content_status IN ('complete','needs_listing_content'));
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_top25_slots_content_lock
  ON public.top25_slots (state_slug, rank)
  WHERE is_content_locked = true;
