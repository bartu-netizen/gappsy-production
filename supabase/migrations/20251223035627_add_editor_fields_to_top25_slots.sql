/*
  # Add Editor Fields to top25_slots Table

  1. New Columns
    - short_description (text): Brief intro text shown on agency cards
    - show_lightning (boolean): Toggle for displaying the ⚡ lightning badge

  2. Purpose
    - Enable manual editing of Top-25 agency display content via admin editor
    - Add lightning badge toggle for highlighting featured agencies
    - Keep existing fields intact for compatibility with current funnel system

  3. Notes
    - `description` field (existing) is used for long description (Read more expansion)
    - `short_description` is the brief intro text
    - `show_lightning` defaults to false (no lightning badge unless manually enabled)
    - All changes are non-breaking and additive only
*/

-- Add short_description field for brief intro text
ALTER TABLE top25_slots
  ADD COLUMN IF NOT EXISTS short_description text;

-- Add show_lightning field for ⚡ badge toggle
ALTER TABLE top25_slots
  ADD COLUMN IF NOT EXISTS show_lightning boolean DEFAULT false;

-- Add comment to clarify field usage
COMMENT ON COLUMN top25_slots.short_description IS 'Brief intro text shown on agency cards';
COMMENT ON COLUMN top25_slots.show_lightning IS 'Toggle for displaying the ⚡ lightning badge';
COMMENT ON COLUMN top25_slots.description IS 'Long description shown in Read more expansion';
