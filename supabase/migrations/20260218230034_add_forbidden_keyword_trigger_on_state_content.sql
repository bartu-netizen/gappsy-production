/*
  # Add forbidden keyword trigger on state_content

  ## Purpose
  Last-line-of-defense database trigger that prevents casino/gambling/SEO-spam
  keywords from being stored in state_content intro fields, even if an edge
  function is misconfigured or bypassed.

  ## Changes
  - Creates `check_forbidden_keywords()` PL/pgSQL function
  - Creates `trg_state_content_forbidden_keywords` trigger on state_content
    for both INSERT and UPDATE operations

  ## Forbidden Keywords Checked
  casino, gambling, slots, free spins, slot machine, online casino,
  casino zonder, betspins, betway, 888casino, jackpot, pokies, wagering

  ## Columns Protected
  hero_intro, hero_intro_short, state_intro_short, state_intro_full, state_description_full

  ## Behavior
  - If any forbidden keyword found (case-insensitive): RAISE EXCEPTION with code P0001
  - Exception message includes which column and keyword triggered the block
  - Applied BEFORE INSERT OR UPDATE so no partial writes occur

  ## Notes
  - Uses lower() for case-insensitive matching
  - Checked on both INSERT and UPDATE to catch all write paths
  - The service_role key can still be blocked by this trigger (triggers fire regardless of role)
*/

CREATE OR REPLACE FUNCTION check_forbidden_keywords()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  forbidden_words text[] := ARRAY[
    'casino', 'gambling', 'slots', 'free spins', 'slot machine',
    'online casino', 'casino zonder', 'betspins', 'betway',
    '888casino', 'jackpot', 'pokies', 'wagering'
  ];
  col_name text;
  col_val text;
  word text;
BEGIN
  FOREACH col_name IN ARRAY ARRAY['hero_intro', 'hero_intro_short', 'state_intro_short', 'state_intro_full', 'state_description_full']
  LOOP
    EXECUTE format('SELECT $1.%I', col_name) INTO col_val USING NEW;

    IF col_val IS NOT NULL THEN
      FOREACH word IN ARRAY forbidden_words
      LOOP
        IF lower(col_val) LIKE '%' || word || '%' THEN
          RAISE EXCEPTION
            'CONTENT_SAFETY_VIOLATION: forbidden keyword "%" found in column "%" for state "%"',
            word, col_name, NEW.state_slug
            USING ERRCODE = 'P0001';
        END IF;
      END LOOP;
    END IF;
  END LOOP;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_state_content_forbidden_keywords ON state_content;

CREATE TRIGGER trg_state_content_forbidden_keywords
  BEFORE INSERT OR UPDATE
  ON state_content
  FOR EACH ROW
  EXECUTE FUNCTION check_forbidden_keywords();
