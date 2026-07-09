/*
  # Fix Security and Performance Issues

  ## Performance Improvements
  
  ### Add Missing Foreign Key Indexes
  1. **agency_availability_requests**
     - Add index on `agency_id` column for foreign key lookups
  
  2. **agency_views**
     - Add index on `agency_id` column for foreign key lookups
  
  3. **spotlight_applications**
     - Add index on `reviewed_by` column for foreign key lookups
  
  4. **top25_applications**
     - Add index on `reviewed_by` column for foreign key lookups
  
  ### Remove Unused Indexes
  - Drop unused indexes on `top25_applications`, `contact_messages`, `matched_leads`, 
    `spotlight_applications`, and `other_listing_applications` tables
  - These indexes consume storage and slow down writes without providing query benefits

  ## Security Improvements
  
  ### Fix Security Definer Views
  - Recreate summary views with SECURITY INVOKER instead of SECURITY DEFINER
  - SECURITY INVOKER is safer as it uses caller's permissions, not view owner's
  - Views affected: `other_listing_applications_summary`, `matched_leads_summary`, 
    `spotlight_applications_summary`, `top25_applications_summary`
*/

-- Add missing indexes for foreign keys
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_agency_id 
  ON agency_availability_requests(agency_id);

CREATE INDEX IF NOT EXISTS idx_agency_views_agency_id 
  ON agency_views(agency_id);

CREATE INDEX IF NOT EXISTS idx_spotlight_applications_reviewed_by 
  ON spotlight_applications(reviewed_by);

CREATE INDEX IF NOT EXISTS idx_top25_applications_reviewed_by 
  ON top25_applications(reviewed_by);

-- Drop unused indexes
DROP INDEX IF EXISTS idx_top25_applications_state_slug;
DROP INDEX IF EXISTS idx_top25_applications_created_at;
DROP INDEX IF EXISTS idx_top25_applications_contact_email;
DROP INDEX IF EXISTS idx_top25_applications_status;

DROP INDEX IF EXISTS idx_contact_messages_created_at;
DROP INDEX IF EXISTS idx_contact_messages_email;
DROP INDEX IF EXISTS idx_contact_messages_handled;

DROP INDEX IF EXISTS idx_matched_leads_created_at;
DROP INDEX IF EXISTS idx_matched_leads_state_slug;
DROP INDEX IF EXISTS idx_matched_leads_client_email;
DROP INDEX IF EXISTS idx_matched_leads_status;

DROP INDEX IF EXISTS idx_spotlight_applications_state_slug;
DROP INDEX IF EXISTS idx_spotlight_applications_created_at;
DROP INDEX IF EXISTS idx_spotlight_applications_contact_email;

DROP INDEX IF EXISTS idx_other_listing_applications_created_at;
DROP INDEX IF EXISTS idx_other_listing_applications_state_slug;
DROP INDEX IF EXISTS idx_other_listing_applications_agency_id;
DROP INDEX IF EXISTS idx_other_listing_applications_contact_email;

-- Fix Security Definer Views by recreating with SECURITY INVOKER
-- First, drop existing views
DROP VIEW IF EXISTS other_listing_applications_summary;
DROP VIEW IF EXISTS matched_leads_summary;
DROP VIEW IF EXISTS spotlight_applications_summary;
DROP VIEW IF EXISTS top25_applications_summary;

-- Recreate views with SECURITY INVOKER
CREATE OR REPLACE VIEW other_listing_applications_summary 
WITH (security_invoker = true) AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) AS total_submissions,
  COUNT(DISTINCT agency_id) AS unique_agencies,
  MAX(created_at) AS last_submission_at
FROM other_listing_applications
GROUP BY state_name, state_slug
ORDER BY MAX(created_at) DESC;

CREATE OR REPLACE VIEW matched_leads_summary 
WITH (security_invoker = true) AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) AS total_leads,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_count,
  COUNT(CASE WHEN matched_agency_id IS NOT NULL THEN 1 END) AS matched_count,
  MAX(created_at) AS last_lead_at
FROM matched_leads
WHERE state_slug IS NOT NULL
GROUP BY state_name, state_slug
ORDER BY MAX(created_at) DESC;

CREATE OR REPLACE VIEW spotlight_applications_summary 
WITH (security_invoker = true) AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) AS total_submissions,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_count,
  COUNT(CASE WHEN status = 'approved' THEN 1 END) AS approved_count,
  MAX(created_at) AS last_submission_at
FROM spotlight_applications
GROUP BY state_name, state_slug
ORDER BY MAX(created_at) DESC;

CREATE OR REPLACE VIEW top25_applications_summary 
WITH (security_invoker = true) AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) AS total_submissions,
  COUNT(CASE WHEN claimed_rank_number IS NOT NULL THEN 1 END) AS claimed_count,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_count,
  MAX(created_at) AS last_submission_at
FROM top25_applications
GROUP BY state_name, state_slug
ORDER BY MAX(created_at) DESC;
