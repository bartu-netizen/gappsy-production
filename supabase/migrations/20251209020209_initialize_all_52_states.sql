/*
  # Initialize All 52 States with Top 25 Slots

  1. Purpose
    - Create 25 rows for each of the 52 US states
    - Total: 1,300 rows (52 states × 25 ranks)
    - Rank #1 is PAID (Vazagency placeholder) for all states
    - Ranks #2-25 are UNPAID (available for purchase)

  2. Business Logic
    - PAID agencies = Customers who purchased a Top 25 spot
    - PLACEHOLDER agencies = Editorial content from JSON files
    - Database only stores PAID agencies
    - Selling system checks database for availability

  3. Initial State
    - Each state has Vazagency at rank #1 (marked as paid)
    - Ranks #2-25 are empty slots (marked as unpaid)
    - Customers can purchase ranks #2-25
*/

DO $$
DECLARE
  state_list text[] := ARRAY[
    'alabama', 'alaska', 'arizona', 'arkansas', 'california',
    'colorado', 'connecticut', 'delaware', 'florida', 'georgia',
    'hawaii', 'idaho', 'illinois', 'indiana', 'iowa',
    'kansas', 'kentucky', 'louisiana', 'maine', 'maryland',
    'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri',
    'montana', 'nebraska', 'nevada', 'new-hampshire', 'new-jersey',
    'new-mexico', 'new-york', 'north-carolina', 'north-dakota', 'ohio',
    'oklahoma', 'oregon', 'pennsylvania', 'rhode-island', 'south-carolina',
    'south-dakota', 'tennessee', 'texas', 'utah', 'vermont',
    'virginia', 'washington', 'west-virginia', 'wisconsin', 'wyoming',
    'district-of-columbia', 'puerto-rico'
  ];
  current_state text;
  current_rank integer;
BEGIN
  FOREACH current_state IN ARRAY state_list
  LOOP
    FOR current_rank IN 1..25
    LOOP
      IF NOT EXISTS (
        SELECT 1 FROM top25_slots
        WHERE state_slug = current_state AND rank = current_rank
      ) THEN
        INSERT INTO top25_slots (
          state_slug,
          rank,
          is_paid,
          claimed_at,
          agency_name,
          website,
          logo_url,
          description,
          services
        ) VALUES (
          current_state,
          current_rank,
          CASE WHEN current_rank = 1 THEN true ELSE false END,
          CASE WHEN current_rank = 1 THEN NOW() ELSE NULL END,
          CASE WHEN current_rank = 1 THEN 'Vazagency' ELSE NULL END,
          CASE WHEN current_rank = 1 THEN 'https://vazagency.com' ELSE NULL END,
          CASE WHEN current_rank = 1 THEN 'https://www.gappsy.com/wp-content/uploads/2024/03/Vazagency-Logo-Black-Transparent.png' ELSE NULL END,
          CASE WHEN current_rank = 1 THEN 'Vazagency stands at the forefront of digital marketing innovation, offering comprehensive services including SEO, web development, content creation, design, and social media marketing.' ELSE NULL END,
          CASE WHEN current_rank = 1 THEN ARRAY['SEO', 'Web Development', 'Content Creation', 'Design', 'Social Media Marketing'] ELSE NULL END
        );
      END IF;
    END LOOP;
  END LOOP;
END $$;
