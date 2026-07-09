/*
  # Add Paid Agency Fields to top25_slots Table

  1. New Columns
    - agency_name (text): Name of the agency that purchased the spot
    - website (text): Agency website URL
    - logo_url (text): URL to agency logo
    - description (text): Agency description
    - services (text[]): Array of services offered

  2. Purpose
    - Store paid agency data directly in database
    - Database becomes single source of truth for paid spots
    - Placeholder agencies remain in JSON files only

  3. Security
    - These columns are only populated when is_paid = true
    - NULL for unpaid spots (available for purchase)
*/

ALTER TABLE top25_slots
  ADD COLUMN IF NOT EXISTS agency_name text,
  ADD COLUMN IF NOT EXISTS website text,
  ADD COLUMN IF NOT EXISTS logo_url text,
  ADD COLUMN IF NOT EXISTS description text,
  ADD COLUMN IF NOT EXISTS services text[];
