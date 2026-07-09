/*
  # Create Owner Demo Events Tracking Table

  ## Purpose
  Track agency owner demo funnel usage without storing any personal data (PII).
  This allows us to analyze how owners interact with the demo without collecting
  actual client information.

  ## New Tables
  - `owner_demo_events`: Tracks demo funnel events (opened, submitted, completed)

  ## Columns
  - `id`: Primary key
  - `created_at`: Event timestamp
  - `event_name`: Type of event (demo_opened, demo_submitted, demo_completed)
  - `agency_id`: Optional agency UUID (if available)
  - `state_slug`: State identifier
  - `agency_name`: Agency name for easier debugging
  - `source_page`: Page pathname where event occurred
  - `owner_user_id`: Optional authenticated user ID
  - `metadata`: Non-PII metadata (service, budget, timeline, mode)

  ## Security
  - Enable RLS on owner_demo_events
  - Allow INSERT for authenticated users only (owners are authenticated)
  - Allow SELECT for authenticated users (for analytics)

  ## Important
  - NO PII stored: No email, name, message, or free-text fields
  - Only dropdown values and system data are captured
  - Logging failures must be silent and not break demo experience

  ## Indexes
  - Index on (agency_id, created_at DESC) for agency-specific analytics
  - Index on (owner_user_id, created_at DESC) for user-specific analytics
  - Index on (event_name, created_at DESC) for event-type analytics
*/

-- Create owner_demo_events table
CREATE TABLE IF NOT EXISTS public.owner_demo_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  event_name text NOT NULL,
  agency_id uuid REFERENCES public.other_agencies(id) ON DELETE CASCADE,
  state_slug text,
  agency_name text,
  source_page text,
  owner_user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  metadata jsonb
);

-- Create indexes for efficient querying
CREATE INDEX IF NOT EXISTS idx_owner_demo_events_agency_id 
  ON public.owner_demo_events(agency_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_owner_demo_events_user_id 
  ON public.owner_demo_events(owner_user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_owner_demo_events_event_name 
  ON public.owner_demo_events(event_name, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_owner_demo_events_created_at 
  ON public.owner_demo_events(created_at DESC);

-- Enable Row Level Security
ALTER TABLE public.owner_demo_events ENABLE ROW LEVEL SECURITY;

-- Policy: Allow authenticated users to insert demo events
CREATE POLICY "Authenticated users can log demo events"
  ON public.owner_demo_events
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Policy: Allow authenticated users to view demo events
CREATE POLICY "Authenticated users can view demo events"
  ON public.owner_demo_events
  FOR SELECT
  TO authenticated
  USING (true);
