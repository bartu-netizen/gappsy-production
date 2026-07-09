/*
  # Fix Agency Reviews Manual Editor Schema

  1. Schema Extensions
    - Add all missing columns required by the manual editor at /wp-admin/agency-reviews/new
    - Ensure compatibility with agency-reviews-admin Edge Function
    - Maintain backward compatibility with existing rows
    
  2. Scalar Text Fields
    - city: Agency location city
    - website_url: Agency website
    - team_size_range: Team size category
    - evaluation_status: Editorial evaluation status
    - about_description: Agency about/bio text
    - case_studies_status: Case studies availability
    - pricing_transparency: Pricing clarity assessment
    - team_information: Team info availability
    - independent_recognition: Third-party awards/recognition
    - local_presence: Local market presence assessment
    - last_updated: Human-readable last update date (YYYY-MM-DD format)
    
  3. Array Fields (text[])
    - services_offered: List of services provided
    - target_clients: Target client types
    - geographic_reach: Geographic coverage areas
    - strengths: Agency strengths/advantages
    - concerns: Potential concerns or limitations
    - risk_factors: Risk considerations
    - fit_for: Best fit for these types of clients
    - entity_signals: Entity validation signals
    
  4. Other Fields
    - is_top_25_ranked: Whether agency is in state's top 25
    - review_type: Review sentiment (positive/negative)
    - is_published: Publication status
    - uniqueness_score: Editorial uniqueness score
    - created_at: Row creation timestamp
    - updated_at: Row update timestamp
    - change_log: Audit trail of changes (JSONB array)
    
  5. Constraints
    - Add CHECK constraint for review_type values
    - Preserve existing unique constraint on agency_slug
    
  6. Security
    - No RLS changes needed (existing policies apply)
    - Compatible with existing public read and admin write policies
*/

-- Add scalar text fields
ALTER TABLE public.agency_reviews
  ADD COLUMN IF NOT EXISTS city text,
  ADD COLUMN IF NOT EXISTS website_url text,
  ADD COLUMN IF NOT EXISTS team_size_range text,
  ADD COLUMN IF NOT EXISTS evaluation_status text,
  ADD COLUMN IF NOT EXISTS about_description text,
  ADD COLUMN IF NOT EXISTS case_studies_status text,
  ADD COLUMN IF NOT EXISTS pricing_transparency text,
  ADD COLUMN IF NOT EXISTS team_information text,
  ADD COLUMN IF NOT EXISTS independent_recognition text,
  ADD COLUMN IF NOT EXISTS local_presence text,
  ADD COLUMN IF NOT EXISTS last_updated text;

-- Add array fields with safe defaults
ALTER TABLE public.agency_reviews
  ADD COLUMN IF NOT EXISTS services_offered text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS target_clients text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS geographic_reach text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS strengths text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS concerns text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS risk_factors text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS fit_for text[] NOT NULL DEFAULT '{}'::text[],
  ADD COLUMN IF NOT EXISTS entity_signals text[] NOT NULL DEFAULT '{}'::text[];

-- Add other editorial fields
ALTER TABLE public.agency_reviews
  ADD COLUMN IF NOT EXISTS is_top_25_ranked boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS review_type text,
  ADD COLUMN IF NOT EXISTS is_published boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS uniqueness_score integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS created_at timestamptz NOT NULL DEFAULT now(),
  ADD COLUMN IF NOT EXISTS updated_at timestamptz NOT NULL DEFAULT now(),
  ADD COLUMN IF NOT EXISTS change_log jsonb NOT NULL DEFAULT '[]'::jsonb;

-- Add CHECK constraint for review_type (only if not exists)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'agency_reviews_review_type_check'
      AND conrelid = 'public.agency_reviews'::regclass
  ) THEN
    ALTER TABLE public.agency_reviews
      ADD CONSTRAINT agency_reviews_review_type_check
      CHECK (review_type IN ('positive', 'negative'));
  END IF;
END $$;

-- Create index for published reviews (if not exists)
CREATE INDEX IF NOT EXISTS idx_agency_reviews_published 
  ON public.agency_reviews(is_published) 
  WHERE is_published = true;

-- Create index for state filtering (if not exists)
CREATE INDEX IF NOT EXISTS idx_agency_reviews_state_slug_published 
  ON public.agency_reviews(state_slug, is_published) 
  WHERE is_published = true;

-- Create index for top 25 filtering (if not exists)
CREATE INDEX IF NOT EXISTS idx_agency_reviews_top25_published 
  ON public.agency_reviews(state_slug, is_top_25_ranked, is_published) 
  WHERE is_top_25_ranked = true AND is_published = true;