/*
  # Create Other Agency Phones Table

  1. New Table
    - `other_agency_phones` — Store multiple phone numbers per agency
    - Mirrors structure of `other_agency_emails` for consistency
    - Future-ready for SMS verification and SMS portal

  2. Columns
    - `id` uuid primary key
    - `agency_id` uuid references other_agencies
    - `phone_raw` text — Original phone number as imported
    - `phone_normalized` text — Standardized format (e.g., +1XXXXXXXXXX)
    - `is_primary` boolean — First/main phone for agency
    - `source` text — Where the phone came from (import, manual)
    - `sms_opt_out` boolean — Future SMS flag
    - `sms_verification_status` text — Future SMS verification
    - `sms_verification_reason` text — Future SMS verification details
    - `line_type` text — Future (mobile/landline/voip)
    - `country_code` text — Future international support
    - Timestamps for tracking

  3. Indexes
    - On agency_id for lookups
    - On phone_normalized for deduping
    - Unique composite on (agency_id, phone_normalized) to prevent duplicates

  4. Security
    - RLS enabled (admin backend access, no public exposure)
    - Cascade delete with agencies

  5. Future-Ready
    - SMS opt-out tracking
    - SMS verification status
    - Line type detection (mobile/landline/voip)
    - Country code support
*/

DO $$
BEGIN
  -- Create other_agency_phones table if not exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_name = 'other_agency_phones'
  ) THEN
    CREATE TABLE other_agency_phones (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      agency_id uuid NOT NULL REFERENCES other_agencies(id) ON DELETE CASCADE,
      phone_raw text NOT NULL,
      phone_normalized text NULL,
      is_primary boolean NOT NULL DEFAULT false,
      source text NULL DEFAULT 'import',
      sms_opt_out boolean NOT NULL DEFAULT false,
      sms_verification_status text NULL,
      sms_verification_reason text NULL,
      line_type text NULL,
      country_code text NULL DEFAULT 'US',
      created_at timestamptz NOT NULL DEFAULT now(),
      updated_at timestamptz NOT NULL DEFAULT now()
    );

    -- Create indexes for performance and uniqueness
    CREATE INDEX idx_other_agency_phones_agency_id
    ON other_agency_phones(agency_id);

    CREATE INDEX idx_other_agency_phones_normalized
    ON other_agency_phones(phone_normalized);

    CREATE UNIQUE INDEX idx_other_agency_phones_unique_normalized
    ON other_agency_phones(agency_id, phone_normalized)
    WHERE phone_normalized IS NOT NULL;

    -- Enable RLS
    ALTER TABLE other_agency_phones ENABLE ROW LEVEL SECURITY;

    -- Admin backend can read all via service role (no policies needed for service role)
    -- RLS will be restrictive by default for authenticated users
    -- Admin endpoints use service role key so they bypass RLS

  END IF;
END $$;
