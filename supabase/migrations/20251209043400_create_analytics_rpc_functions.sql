/*
  # Create Analytics RPC Functions

  1. RPC Functions
    - `increment_spotlight_views` - Track spotlight placement views
    - `track_spotlight_click` - Track spotlight CTA clicks
    - `increment_agency_views` - Track other agency views
    - `track_agency_click` - Track other agency clicks

  2. Purpose
    - Enable efficient tracking of user interactions
    - Update view_count and click_count atomically
    - Record timestamps for analytics
*/

-- Track spotlight view
CREATE OR REPLACE FUNCTION increment_spotlight_views(spotlight_id UUID)
RETURNS void AS $$
BEGIN
  UPDATE spotlight_placements 
  SET view_count = view_count + 1
  WHERE id = spotlight_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Track spotlight click
CREATE OR REPLACE FUNCTION track_spotlight_click(spotlight_id UUID)
RETURNS void AS $$
BEGIN
  UPDATE spotlight_placements 
  SET 
    click_count = click_count + 1,
    last_clicked_at = NOW()
  WHERE id = spotlight_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Track agency view
CREATE OR REPLACE FUNCTION increment_agency_views(agency_id UUID, tier TEXT)
RETURNS void AS $$
BEGIN
  IF tier = 'other' THEN
    UPDATE other_agencies 
    SET view_count = view_count + 1
    WHERE id = agency_id;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Track agency click
CREATE OR REPLACE FUNCTION track_agency_click(agency_id UUID, tier TEXT)
RETURNS void AS $$
BEGIN
  IF tier = 'other' THEN
    UPDATE other_agencies 
    SET 
      click_count = click_count + 1,
      last_clicked_at = NOW()
    WHERE id = agency_id;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;