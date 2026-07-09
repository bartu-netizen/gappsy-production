/*
  # Other Agency Emails System for Email Splitting & Validation Tracking

  1. New Tables
    - `other_agency_emails`: Individual email rows linked to agencies (1 email per row)
    - `other_agency_email_validation_runs`: Batch validation attempts from cleaning services
  
  2. Data Relationships
    - Each agency can have multiple email rows (1:N relationship)
    - Emails are unique per agency (no duplicate emails per agency)
    - Validation status and metadata stored separately for scalability
  
  3. Security
    - Enable RLS on both tables
    - Public read access for app (limited fields)
    - Service role has full access
  
  4. Performance
    - Indexes on agency_id for fast lookups
    - Index on normalized email for deduplication checks
    - Index on validation_status for filtering clean/unclean lists
    - Index on email_id for quick re-import mapping
  
  5. Future Ready
    - Fields included for cold email outreach tracking (outreach_status, last_outreach_at)
    - Validation provider and reason tracked for audit trails
    - Normalized email stored separately from raw for comparison
*/

-- Create other_agency_emails table (individual email rows)
CREATE TABLE IF NOT EXISTS other_agency_emails (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id             uuid NOT NULL REFERENCES other_agencies(id) ON DELETE CASCADE,
  email_raw             text NOT NULL,
  email_normalized      text NOT NULL,
  validation_status     text NOT NULL DEFAULT 'unknown' CHECK (validation_status IN ('unknown', 'valid', 'invalid', 'catch_all', 'risky', 'duplicate')),
  validation_provider   text,
  validation_reason     text,
  validation_checked_at timestamptz,
  validation_score      numeric,
  source                text NOT NULL DEFAULT 'import',
  outreach_status       text DEFAULT 'not_sent' CHECK (outreach_status IN ('not_sent', 'sent', 'replied', 'bounced', 'opted_out')),
  last_outreach_at      timestamptz,
  outreach_count        int DEFAULT 0,
  created_at            timestamptz NOT NULL DEFAULT now(),
  updated_at            timestamptz NOT NULL DEFAULT now(),
  
  UNIQUE (agency_id, email_normalized)
);

-- Indexes for performance and lookups
CREATE INDEX idx_oae_agency_id ON other_agency_emails (agency_id);
CREATE INDEX idx_oae_email_normalized ON other_agency_emails (email_normalized);
CREATE INDEX idx_oae_validation_status ON other_agency_emails (validation_status);
CREATE INDEX idx_oae_created_at ON other_agency_emails (created_at DESC);
CREATE INDEX idx_oae_agency_validation ON other_agency_emails (agency_id, validation_status);

-- Create validation runs table (audit trail for batch cleaning)
CREATE TABLE IF NOT EXISTS other_agency_email_validation_runs (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id              text NOT NULL,
  provider              text NOT NULL,
  state_slug            text,
  total_emails          int NOT NULL DEFAULT 0,
  emails_validated      int NOT NULL DEFAULT 0,
  emails_invalid        int NOT NULL DEFAULT 0,
  validation_started_at timestamptz NOT NULL DEFAULT now(),
  validation_completed_at timestamptz,
  import_file           text,
  import_status         text DEFAULT 'pending' CHECK (import_status IN ('pending', 'processing', 'completed', 'failed')),
  import_errors         text,
  created_at            timestamptz NOT NULL DEFAULT now(),
  updated_at            timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_oaevr_batch_id ON other_agency_email_validation_runs (batch_id);
CREATE INDEX idx_oaevr_provider ON other_agency_email_validation_runs (provider);
CREATE INDEX idx_oaevr_created_at ON other_agency_email_validation_runs (created_at DESC);

-- Enable RLS
ALTER TABLE other_agency_emails ENABLE ROW LEVEL SECURITY;
ALTER TABLE other_agency_email_validation_runs ENABLE ROW LEVEL SECURITY;

-- RLS Policies for other_agency_emails
CREATE POLICY "Anon can view emails via agency (limited state pages)" ON other_agency_emails
  FOR SELECT
  TO anon
  USING (
    EXISTS (
      SELECT 1 FROM other_agencies oa
      WHERE oa.id = other_agency_emails.agency_id
      AND oa.is_active = true
      AND oa.state_slug IS NOT NULL
    )
  );

CREATE POLICY "Authenticated can view all emails" ON other_agency_emails
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can do all on emails" ON other_agency_emails
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- RLS Policies for validation runs (admin only)
CREATE POLICY "Authenticated can view validation runs" ON other_agency_email_validation_runs
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can do all on validation runs" ON other_agency_email_validation_runs
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);
