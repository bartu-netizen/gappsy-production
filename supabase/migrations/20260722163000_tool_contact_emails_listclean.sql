-- Same ListClean verification vocabulary already used for marketing
-- agencies (other_agency_emails.validation_status: valid/invalid/retry/
-- failed, via mapListCleanStatusToInternal) applied to tool_contact_emails
-- so software-tool vendor emails go through the identical clean/dirty
-- pipeline before ever reaching Smartlead.
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_status text;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_list_id bigint;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_external_status text;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_attempt_count integer NOT NULL DEFAULT 0;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_submitted_at timestamptz;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS listclean_checked_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_tool_contact_emails_listclean_pending
  ON tool_contact_emails (id)
  WHERE listclean_status IS NULL OR listclean_status = 'retry';

CREATE INDEX IF NOT EXISTS idx_tool_contact_emails_listclean_list_id
  ON tool_contact_emails (listclean_list_id)
  WHERE listclean_status = 'submitted';

-- Tracks which tool emails have already been pushed into a Smartlead
-- campaign, and which campaign — so a re-run of the sync action never
-- double-adds the same lead, and so it's visible which emails are still
-- clean-and-unsynced.
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS smartlead_campaign_id text;
ALTER TABLE tool_contact_emails ADD COLUMN IF NOT EXISTS smartlead_synced_at timestamptz;
