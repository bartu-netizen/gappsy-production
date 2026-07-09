/*
  # Move pg_trgm Extension to extensions Schema - V2

  Move pg_trgm from public schema to extensions schema.
*/

-- First, check if extension exists and drop it
DROP EXTENSION IF EXISTS pg_trgm;

-- Create fresh in extensions schema
CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA extensions;
