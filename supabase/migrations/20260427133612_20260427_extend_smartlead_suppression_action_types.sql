/*
  # Extend smartlead_suppression_actions action_type values

  Adds new action types used by hardened smartlead-suppression-runner:

  1. New action_type values
    - `global_unsubscribe` (preferred; alias for legacy `unsubscribe`)
    - `fetch_campaigns` (lookup leads/{id}/campaigns)

  2. Compatibility
    - Existing `unsubscribe` and `campaign_delete` values remain valid

  3. Security
    - No RLS changes; existing service-role-only policy preserved
*/

DO $$
BEGIN
  IF to_regclass('public.smartlead_suppression_actions') IS NULL THEN
    RETURN;
  END IF;

  IF EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE table_schema = 'public'
      AND table_name = 'smartlead_suppression_actions'
      AND constraint_name = 'smartlead_suppression_actions_action_type_check'
  ) THEN
    ALTER TABLE public.smartlead_suppression_actions
      DROP CONSTRAINT smartlead_suppression_actions_action_type_check;
  END IF;

  ALTER TABLE public.smartlead_suppression_actions
    ADD CONSTRAINT smartlead_suppression_actions_action_type_check
    CHECK (action_type IN (
      'fetch_lead',
      'unsubscribe',
      'global_unsubscribe',
      'fetch_campaigns',
      'campaign_delete'
    ));
END $$;
