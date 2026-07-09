/*
  # Fix canonical_replay_state.state_slug default

  Removes the hardcoded DEFAULT 'new-york' on state_slug.
  The column now defaults to '' (empty string).
  The resolve-agency-context edge function always supplies the real
  state_slug derived from the agency's actual listings, so no row
  should ever need to rely on this default.
*/

ALTER TABLE canonical_replay_state
  ALTER COLUMN state_slug SET DEFAULT '';
