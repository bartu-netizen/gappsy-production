/*
  # Fix Funnel Step Order: activation_upsell_viewed (110) before upgrade_positions_page_viewed (120)

  ## Summary
  The funnel step numbers for two events were inverted. The "Activate listing" upsell dashboard
  appears BEFORE the "Upgrade positions" (Top-25 slots) page in the real UI flow. This migration
  corrects stored step_numbers in both funnel_events and recomputes funnel_sessions rollups.

  ## Changes

  ### funnel_events table
  - Events named "upgrade_positions_page_viewed" → set step_number = 120 (was 110)
  - Events named "activation_upsell_viewed" → set step_number = 110 (was 120)

  ### funnel_sessions table
  - Recompute last_step_number and last_event_name for any session that contains
    either of the two affected event names, so Funnel Stage drop-off is accurate.

  ## Correct order after migration
  - step 110: activation_upsell_viewed   (Missed opportunity / Activate listing dashboard)
  - step 120: upgrade_positions_page_viewed  (Two Top-25 upgrade options)
*/

UPDATE funnel_events
SET step_number = 120
WHERE event_name = 'upgrade_positions_page_viewed'
  AND step_number = 110;

UPDATE funnel_events
SET step_number = 110
WHERE event_name = 'activation_upsell_viewed'
  AND step_number = 120;

DO $$
DECLARE
  affected_fsid TEXT;
BEGIN
  FOR affected_fsid IN
    SELECT DISTINCT fsid
    FROM funnel_events
    WHERE event_name IN ('upgrade_positions_page_viewed', 'activation_upsell_viewed')
      AND fsid IS NOT NULL
  LOOP
    UPDATE funnel_sessions fs
    SET
      step_number = sub.max_step,
      last_event_name = sub.last_event
    FROM (
      SELECT
        MAX(fe.step_number) AS max_step,
        (
          SELECT fe2.event_name
          FROM funnel_events fe2
          WHERE fe2.fsid = affected_fsid
          ORDER BY fe2.step_number DESC, fe2.created_at DESC
          LIMIT 1
        ) AS last_event
      FROM funnel_events fe
      WHERE fe.fsid = affected_fsid
    ) sub
    WHERE fs.fsid = affected_fsid;
  END LOOP;
END $$;
