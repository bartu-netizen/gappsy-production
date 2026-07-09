/*
  # Add deduplication support to ListClean export lineage

  ## Summary
  Adds fields to support deduped ListClean exports where one unique email in the CSV
  maps to multiple source rows in the database. This prevents wasting ListClean
  credits on exact duplicate email addresses.

  ## Changes

  ### Modified Table: `other_agency_cleaning_export_rows`
  - `is_dedup_anchor` (boolean, default false) — marks the single "representative" row
    for a given normalized email within an export job. Only anchor rows produce one CSV
    line. Non-anchor rows are tracked for lineage but not exported.
  - `dedup_anchor_id` (uuid, nullable) — for non-anchor rows, references the anchor row
    within the same export job for the same email. NULL for anchor rows themselves.

  ### Modified Table: `other_agency_cleaning_exports`
  - `unique_emails_exported` (integer) — count of unique normalized emails in the CSV
  - `duplicate_rows_skipped` (integer) — count of source rows that were deduped away

  ## Indexes
  - Index on (export_job_id, email_normalized, is_dedup_anchor) for fast anchor lookups
  - Index on dedup_anchor_id for fast reverse lookup

  ## Notes
  - Anchor selection: the row with the smallest `id` (UUID sort) for a given email
    within an export job is chosen as the anchor — deterministic and reproducible.
  - Existing exports are backfilled: all existing rows get is_dedup_anchor = true
    (no dedup was done previously, so all rows were effectively anchors).
  - Import logic uses is_dedup_anchor OR dedup_anchor_id to find all source rows
    that map to a single returned email result from ListClean.
*/

-- Add dedup tracking columns to export rows table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_cleaning_export_rows'
      AND column_name = 'is_dedup_anchor'
  ) THEN
    ALTER TABLE other_agency_cleaning_export_rows
      ADD COLUMN is_dedup_anchor boolean NOT NULL DEFAULT true;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_cleaning_export_rows'
      AND column_name = 'dedup_anchor_id'
  ) THEN
    ALTER TABLE other_agency_cleaning_export_rows
      ADD COLUMN dedup_anchor_id uuid REFERENCES other_agency_cleaning_export_rows(id) ON DELETE SET NULL;
  END IF;
END $$;

-- Add summary stats columns to export jobs table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_cleaning_exports'
      AND column_name = 'unique_emails_exported'
  ) THEN
    ALTER TABLE other_agency_cleaning_exports
      ADD COLUMN unique_emails_exported integer;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_cleaning_exports'
      AND column_name = 'duplicate_rows_skipped'
  ) THEN
    ALTER TABLE other_agency_cleaning_exports
      ADD COLUMN duplicate_rows_skipped integer;
  END IF;
END $$;

-- Index for fast anchor lookups within an export job
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_job_email_anchor
  ON other_agency_cleaning_export_rows(export_job_id, email_normalized, is_dedup_anchor);

-- Index for fast reverse lookup: all rows tied to an anchor
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_dedup_anchor_id
  ON other_agency_cleaning_export_rows(dedup_anchor_id)
  WHERE dedup_anchor_id IS NOT NULL;
