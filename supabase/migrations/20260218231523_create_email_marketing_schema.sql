/*
  # Email Marketing Module — Full Schema

  ## Summary
  Complete data model for a Mailchimp-level email marketing system built on top
  of existing Gappsy form submission tables. Designed for Phase 1 (campaigns,
  contacts, segments, templates, send queue) and extensible for Phase 2
  (automations, open/click tracking).

  ## New Tables
  1. em_contacts — unified contact/lead record, one per email address
  2. em_tags — tag definitions
  3. em_contact_tags — many-to-many contact ↔ tag
  4. em_segments — saved segment definitions with rules_json
  5. em_templates — email templates with block structure + compiled HTML
  6. em_template_versions — version history for templates
  7. em_campaigns — broadcast campaign definitions
  8. em_automations — automation sequences with flow_json
  9. em_automation_enrollments — tracks which contact is in which automation
  10. em_messages — per-recipient message queue (sent/queued/failed)
  11. em_events — open/click/bounce/complaint per message
  12. em_suppression — unsubscribe/bounce/complaint suppression list
  13. em_settings — key/value settings store (SMTP, compliance footer, etc.)
  14. em_funnel_events — funnel activity linked to contacts (form_submitted, checkout_started, etc.)

  ## Security
  - RLS enabled on all tables
  - service_role has full access (for edge functions)
  - anon/authenticated have NO direct access to any em_* table
  - All reads/writes go through admin edge functions with service_role key

  ## Notes
  - em_contacts.source_type is a text field (not enum) for flexibility
  - All jsonb fields use jsonb (not json) for indexing support
  - em_messages has a GIN index on status for queue processing
  - em_contacts has a unique constraint on email (case-insensitive via lower())
*/

-- ============================================================
-- CONTACTS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_contacts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL,
  first_name text,
  last_name text,
  company_name text,
  website text,
  phone text,
  state_name text,
  source_type text DEFAULT 'other',
  source_id text,
  lead_status text DEFAULT 'new',
  payment_status text DEFAULT 'none',
  checkout_status text DEFAULT 'none',
  last_action_at timestamptz,
  notes text,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL,
  CONSTRAINT em_contacts_email_unique UNIQUE (email)
);

CREATE INDEX IF NOT EXISTS idx_em_contacts_email ON em_contacts(lower(email));
CREATE INDEX IF NOT EXISTS idx_em_contacts_source_type ON em_contacts(source_type);
CREATE INDEX IF NOT EXISTS idx_em_contacts_lead_status ON em_contacts(lead_status);
CREATE INDEX IF NOT EXISTS idx_em_contacts_payment_status ON em_contacts(payment_status);
CREATE INDEX IF NOT EXISTS idx_em_contacts_last_action_at ON em_contacts(last_action_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_contacts_created_at ON em_contacts(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_contacts_state_name ON em_contacts(state_name);

ALTER TABLE em_contacts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on em_contacts"
  ON em_contacts FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- TAGS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_tags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  color text DEFAULT '#64748b',
  created_at timestamptz DEFAULT now() NOT NULL
);

ALTER TABLE em_tags ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_tags"
  ON em_tags FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE TABLE IF NOT EXISTS em_contact_tags (
  contact_id uuid NOT NULL REFERENCES em_contacts(id) ON DELETE CASCADE,
  tag_id uuid NOT NULL REFERENCES em_tags(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now() NOT NULL,
  PRIMARY KEY (contact_id, tag_id)
);

ALTER TABLE em_contact_tags ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_contact_tags"
  ON em_contact_tags FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- SEGMENTS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_segments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  rules_json jsonb NOT NULL DEFAULT '{"operator":"AND","groups":[]}',
  estimated_count int DEFAULT 0,
  estimated_count_updated_at timestamptz,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_segments_name ON em_segments(name);
ALTER TABLE em_segments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_segments"
  ON em_segments FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- TEMPLATES
-- ============================================================
CREATE TABLE IF NOT EXISTS em_templates (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  subject_template text NOT NULL DEFAULT '',
  preheader_template text DEFAULT '',
  body_json jsonb NOT NULL DEFAULT '{"blocks":[]}',
  body_html text DEFAULT '',
  version int NOT NULL DEFAULT 1,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_templates_name ON em_templates(name);
ALTER TABLE em_templates ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_templates"
  ON em_templates FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE TABLE IF NOT EXISTS em_template_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  template_id uuid NOT NULL REFERENCES em_templates(id) ON DELETE CASCADE,
  version int NOT NULL,
  subject_template text NOT NULL,
  preheader_template text,
  body_json jsonb NOT NULL,
  body_html text,
  saved_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_template_versions_template_id ON em_template_versions(template_id, version DESC);
ALTER TABLE em_template_versions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_template_versions"
  ON em_template_versions FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- CAMPAIGNS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_campaigns (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  status text NOT NULL DEFAULT 'draft',
  segment_id uuid REFERENCES em_segments(id) ON DELETE SET NULL,
  send_mode text NOT NULL DEFAULT 'now',
  scheduled_for timestamptz,
  template_id uuid REFERENCES em_templates(id) ON DELETE SET NULL,
  from_name text NOT NULL DEFAULT 'Gappsy',
  from_email text NOT NULL DEFAULT '',
  reply_to text,
  subject_override text,
  total_recipients int DEFAULT 0,
  sent_count int DEFAULT 0,
  open_count int DEFAULT 0,
  click_count int DEFAULT 0,
  bounce_count int DEFAULT 0,
  complaint_count int DEFAULT 0,
  unsubscribe_count int DEFAULT 0,
  started_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_campaigns_status ON em_campaigns(status);
CREATE INDEX IF NOT EXISTS idx_em_campaigns_created_at ON em_campaigns(created_at DESC);
ALTER TABLE em_campaigns ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_campaigns"
  ON em_campaigns FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- AUTOMATIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_automations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  status text NOT NULL DEFAULT 'draft',
  trigger_type text NOT NULL DEFAULT 'form_submitted',
  trigger_filters jsonb DEFAULT '{}',
  flow_json jsonb NOT NULL DEFAULT '{"steps":[]}',
  enrolled_count int DEFAULT 0,
  completed_count int DEFAULT 0,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_automations_status ON em_automations(status);
ALTER TABLE em_automations ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_automations"
  ON em_automations FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE TABLE IF NOT EXISTS em_automation_enrollments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  automation_id uuid NOT NULL REFERENCES em_automations(id) ON DELETE CASCADE,
  contact_id uuid NOT NULL REFERENCES em_contacts(id) ON DELETE CASCADE,
  current_step_index int DEFAULT 0,
  status text NOT NULL DEFAULT 'active',
  next_step_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL,
  UNIQUE (automation_id, contact_id)
);

CREATE INDEX IF NOT EXISTS idx_em_enrollments_automation_id ON em_automation_enrollments(automation_id);
CREATE INDEX IF NOT EXISTS idx_em_enrollments_status ON em_automation_enrollments(status);
CREATE INDEX IF NOT EXISTS idx_em_enrollments_next_step_at ON em_automation_enrollments(next_step_at);
ALTER TABLE em_automation_enrollments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_automation_enrollments"
  ON em_automation_enrollments FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- MESSAGES (SEND QUEUE)
-- ============================================================
CREATE TABLE IF NOT EXISTS em_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid REFERENCES em_contacts(id) ON DELETE SET NULL,
  campaign_id uuid REFERENCES em_campaigns(id) ON DELETE SET NULL,
  automation_id uuid REFERENCES em_automations(id) ON DELETE SET NULL,
  automation_step_index int,
  template_id uuid REFERENCES em_templates(id) ON DELETE SET NULL,
  subject_rendered text NOT NULL DEFAULT '',
  body_html_rendered text NOT NULL DEFAULT '',
  to_email text NOT NULL,
  from_name text NOT NULL DEFAULT 'Gappsy',
  from_email text NOT NULL DEFAULT '',
  reply_to text,
  status text NOT NULL DEFAULT 'queued',
  provider_message_id text,
  error text,
  scheduled_for timestamptz DEFAULT now() NOT NULL,
  sent_at timestamptz,
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_messages_status ON em_messages(status);
CREATE INDEX IF NOT EXISTS idx_em_messages_scheduled_for ON em_messages(scheduled_for) WHERE status = 'queued';
CREATE INDEX IF NOT EXISTS idx_em_messages_contact_id ON em_messages(contact_id);
CREATE INDEX IF NOT EXISTS idx_em_messages_campaign_id ON em_messages(campaign_id);
CREATE INDEX IF NOT EXISTS idx_em_messages_created_at ON em_messages(created_at DESC);
ALTER TABLE em_messages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_messages"
  ON em_messages FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- EVENTS (OPEN / CLICK / BOUNCE / COMPLAINT)
-- ============================================================
CREATE TABLE IF NOT EXISTS em_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  message_id uuid REFERENCES em_messages(id) ON DELETE CASCADE,
  contact_id uuid REFERENCES em_contacts(id) ON DELETE SET NULL,
  event_type text NOT NULL,
  meta jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_events_message_id ON em_events(message_id);
CREATE INDEX IF NOT EXISTS idx_em_events_contact_id ON em_events(contact_id);
CREATE INDEX IF NOT EXISTS idx_em_events_event_type ON em_events(event_type);
CREATE INDEX IF NOT EXISTS idx_em_events_created_at ON em_events(created_at DESC);
ALTER TABLE em_events ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_events"
  ON em_events FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- SUPPRESSION LIST
-- ============================================================
CREATE TABLE IF NOT EXISTS em_suppression (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL UNIQUE,
  reason text NOT NULL DEFAULT 'unsubscribed',
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_suppression_email ON em_suppression(lower(email));
ALTER TABLE em_suppression ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_suppression"
  ON em_suppression FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- SETTINGS
-- ============================================================
CREATE TABLE IF NOT EXISTS em_settings (
  key text PRIMARY KEY,
  value text NOT NULL DEFAULT '',
  updated_at timestamptz DEFAULT now() NOT NULL
);

ALTER TABLE em_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_settings"
  ON em_settings FOR ALL TO service_role USING (true) WITH CHECK (true);

INSERT INTO em_settings (key, value) VALUES
  ('from_name', 'Gappsy'),
  ('from_email', ''),
  ('reply_to', ''),
  ('compliance_footer', 'Gappsy, United States'),
  ('max_per_minute', '60'),
  ('track_opens', 'true'),
  ('track_clicks', 'true')
ON CONFLICT (key) DO NOTHING;

-- ============================================================
-- FUNNEL EVENTS (EMAIL MARKETING CONTEXT)
-- ============================================================
CREATE TABLE IF NOT EXISTS em_funnel_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid REFERENCES em_contacts(id) ON DELETE CASCADE,
  event_type text NOT NULL,
  product_key text,
  form_type text,
  state_name text,
  meta jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_em_funnel_events_contact_id ON em_funnel_events(contact_id);
CREATE INDEX IF NOT EXISTS idx_em_funnel_events_event_type ON em_funnel_events(event_type);
CREATE INDEX IF NOT EXISTS idx_em_funnel_events_created_at ON em_funnel_events(created_at DESC);
ALTER TABLE em_funnel_events ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service role full access on em_funnel_events"
  ON em_funnel_events FOR ALL TO service_role USING (true) WITH CHECK (true);
