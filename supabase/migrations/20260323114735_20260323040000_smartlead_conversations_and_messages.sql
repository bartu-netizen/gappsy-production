/*
  # Smartlead Conversations & Messages Tables

  ## Summary
  Adds conversation-level and message-level storage to the existing Smartlead
  infrastructure. These tables are NEW — they do not replace any existing tables.

  The existing tables remain untouched:
    - smartlead_webhook_events (raw inbound webhook storage)
    - smartlead_lead_events    (normalized event log per lead/campaign)
    - smartlead_campaign_email_sync (email→campaign→agency mapping)
    - smartlead_agency_rollups (agency-level engagement aggregates)

  ## New Tables

  ### smartlead_conversations
  One row per (email × campaign_id) combination. Tracks the current state of the
  outreach thread with a single agency contact. Populated/updated by the webhook
  via fire-and-forget, and also by the smartlead-crm-inbox background sync.

  Columns:
  - id                  — UUID PK
  - campaign_id         — Smartlead campaign ID (text)
  - smartlead_lead_id   — Smartlead lead ID (text, nullable until first event)
  - email_normalized    — Lower-trimmed email address
  - agency_id           — FK to other_agencies if matched
  - other_agency_email_id — FK to other_agency_emails if matched
  - latest_event_type   — Most recent event (sent/opened/replied/etc.)
  - latest_event_at     — When the latest event occurred
  - latest_subject      — Email subject
  - unread_reply_count  — Count of inbound replies not yet reviewed
  - status              — new / contacted / engaged / replied / bounced / opted_out
  - assigned_to         — Future: admin who owns this conversation
  - internal_notes      — Admin-only notes
  - messages_synced_at  — Last time full message history was fetched from API
  - created_at / updated_at

  ### smartlead_messages
  Individual messages within a conversation (inbound replies + outbound sends
  when body is available). Used for full thread display in the CRM inbox.

  Columns:
  - id              — UUID PK
  - conversation_id — FK to smartlead_conversations
  - campaign_id     — Smartlead campaign ID
  - lead_id         — Smartlead lead ID
  - email_normalized — Sender/recipient email
  - direction       — outbound | inbound
  - subject         — Email subject
  - body_text       — Plain-text body
  - body_html       — HTML body (if available)
  - from_email      — Sender address
  - to_email        — Recipient address
  - event_at        — When this message was sent/received
  - smartlead_message_id — Smartlead's own message ID (for dedup)
  - sequence_number — Which step in the sequence (for outbound)
  - raw_json        — Original payload from Smartlead API or webhook
  - created_at

  ## Security
  - RLS enabled on both tables
  - service_role: full access
  - authenticated: SELECT only

  ## Indexes
  - email_normalized + campaign_id (conversation lookup)
  - latest_event_at DESC (inbox sort)
  - agency_id (agency-level filtering)
  - status (workflow filtering)
*/

-- ─── smartlead_conversations ─────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS smartlead_conversations (
  id                      uuid          PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id             text          NOT NULL,
  smartlead_lead_id       text,
  email_normalized        text          NOT NULL,
  agency_id               uuid          REFERENCES other_agencies(id) ON DELETE SET NULL,
  other_agency_email_id   uuid          REFERENCES other_agency_emails(id) ON DELETE SET NULL,
  latest_event_type       text,
  latest_event_at         timestamptz,
  latest_subject          text,
  unread_reply_count      integer       NOT NULL DEFAULT 0,
  status                  text          NOT NULL DEFAULT 'new',
  assigned_to             text,
  internal_notes          text,
  messages_synced_at      timestamptz,
  created_at              timestamptz   NOT NULL DEFAULT now(),
  updated_at              timestamptz   NOT NULL DEFAULT now(),
  UNIQUE (email_normalized, campaign_id)
);

ALTER TABLE smartlead_conversations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "service_role_full_conversations"
  ON smartlead_conversations FOR ALL
  TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "authenticated_read_conversations"
  ON smartlead_conversations FOR SELECT
  TO authenticated USING (true);

CREATE INDEX IF NOT EXISTS idx_sl_conv_email_campaign
  ON smartlead_conversations (email_normalized, campaign_id);

CREATE INDEX IF NOT EXISTS idx_sl_conv_latest_event_at
  ON smartlead_conversations (latest_event_at DESC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_sl_conv_agency_id
  ON smartlead_conversations (agency_id);

CREATE INDEX IF NOT EXISTS idx_sl_conv_status
  ON smartlead_conversations (status);

CREATE INDEX IF NOT EXISTS idx_sl_conv_lead_id
  ON smartlead_conversations (smartlead_lead_id);

-- ─── smartlead_messages ───────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS smartlead_messages (
  id                      uuid          PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id         uuid          REFERENCES smartlead_conversations(id) ON DELETE CASCADE,
  campaign_id             text          NOT NULL,
  lead_id                 text,
  email_normalized        text          NOT NULL,
  direction               text          NOT NULL DEFAULT 'outbound',
  subject                 text,
  body_text               text,
  body_html               text,
  from_email              text,
  to_email                text,
  event_at                timestamptz   NOT NULL DEFAULT now(),
  smartlead_message_id    text,
  sequence_number         integer,
  raw_json                jsonb,
  created_at              timestamptz   NOT NULL DEFAULT now(),
  UNIQUE (campaign_id, smartlead_message_id)
);

ALTER TABLE smartlead_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "service_role_full_messages"
  ON smartlead_messages FOR ALL
  TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "authenticated_read_messages"
  ON smartlead_messages FOR SELECT
  TO authenticated USING (true);

CREATE INDEX IF NOT EXISTS idx_sl_msg_conversation_id
  ON smartlead_messages (conversation_id);

CREATE INDEX IF NOT EXISTS idx_sl_msg_event_at
  ON smartlead_messages (event_at ASC);

CREATE INDEX IF NOT EXISTS idx_sl_msg_lead_campaign
  ON smartlead_messages (lead_id, campaign_id);

CREATE INDEX IF NOT EXISTS idx_sl_msg_smartlead_id
  ON smartlead_messages (smartlead_message_id);

-- ─── Backfill smartlead_conversations from smartlead_lead_events ──────────────

INSERT INTO smartlead_conversations (
  campaign_id,
  smartlead_lead_id,
  email_normalized,
  agency_id,
  other_agency_email_id,
  latest_event_type,
  latest_event_at,
  status,
  created_at,
  updated_at
)
SELECT DISTINCT ON (le.email_normalized, le.campaign_id)
  le.campaign_id,
  le.lead_id,
  le.email_normalized,
  le.agency_id,
  le.other_agency_email_id,
  le.event_type           AS latest_event_type,
  le.event_at             AS latest_event_at,
  CASE
    WHEN le.event_type = 'replied'       THEN 'replied'
    WHEN le.event_type = 'bounced'       THEN 'bounced'
    WHEN le.event_type = 'unsubscribed'  THEN 'opted_out'
    WHEN le.event_type IN ('opened','clicked') THEN 'engaged'
    ELSE 'contacted'
  END                     AS status,
  MIN(le.event_at) OVER (PARTITION BY le.email_normalized, le.campaign_id) AS created_at,
  le.event_at             AS updated_at
FROM smartlead_lead_events le
WHERE le.email_normalized IS NOT NULL
  AND le.campaign_id IS NOT NULL
ORDER BY le.email_normalized, le.campaign_id, le.event_at DESC
ON CONFLICT (email_normalized, campaign_id) DO NOTHING;

-- ─── Upsert helper function for webhook use ───────────────────────────────────

CREATE OR REPLACE FUNCTION upsert_smartlead_conversation(
  p_campaign_id          text,
  p_lead_id              text,
  p_email_normalized     text,
  p_agency_id            uuid,
  p_other_agency_email_id uuid,
  p_event_type           text,
  p_event_at             timestamptz,
  p_subject              text DEFAULT NULL
)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_id uuid;
  v_status text;
BEGIN
  v_status := CASE
    WHEN p_event_type = 'replied'       THEN 'replied'
    WHEN p_event_type = 'bounced'       THEN 'bounced'
    WHEN p_event_type = 'unsubscribed'  THEN 'opted_out'
    WHEN p_event_type IN ('opened','clicked') THEN 'engaged'
    ELSE 'contacted'
  END;

  INSERT INTO smartlead_conversations (
    campaign_id, smartlead_lead_id, email_normalized,
    agency_id, other_agency_email_id,
    latest_event_type, latest_event_at, latest_subject, status,
    unread_reply_count
  )
  VALUES (
    p_campaign_id, p_lead_id, p_email_normalized,
    p_agency_id, p_other_agency_email_id,
    p_event_type, p_event_at, p_subject, v_status,
    CASE WHEN p_event_type = 'replied' THEN 1 ELSE 0 END
  )
  ON CONFLICT (email_normalized, campaign_id) DO UPDATE SET
    smartlead_lead_id     = COALESCE(EXCLUDED.smartlead_lead_id, smartlead_conversations.smartlead_lead_id),
    agency_id             = COALESCE(EXCLUDED.agency_id, smartlead_conversations.agency_id),
    other_agency_email_id = COALESCE(EXCLUDED.other_agency_email_id, smartlead_conversations.other_agency_email_id),
    latest_event_type     = EXCLUDED.latest_event_type,
    latest_event_at       = EXCLUDED.latest_event_at,
    latest_subject        = COALESCE(EXCLUDED.latest_subject, smartlead_conversations.latest_subject),
    status                = EXCLUDED.status,
    unread_reply_count    = smartlead_conversations.unread_reply_count
                              + CASE WHEN p_event_type = 'replied' THEN 1 ELSE 0 END,
    updated_at            = now()
  RETURNING id INTO v_id;

  RETURN v_id;
END;
$$;
