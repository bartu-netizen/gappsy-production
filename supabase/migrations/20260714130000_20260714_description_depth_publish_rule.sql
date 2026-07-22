-- Adds a configurable "description_depth" first-publish rule so tools can no
-- longer clear the publish gate with just a one-line short_description and
-- an empty long_description (see 92f7b1f, which caught 14 tools published
-- this way after the fact — the base gate only checks presence, not depth).
-- Enforcement lives in validateFirstPublishStrict (supabase/functions/_shared/
-- toolCompleteness.ts); this row is what makes the check active by default
-- while staying toggleable from the Publishing Rules admin page.

INSERT INTO publishing_rules (field_key, label, tier, required, enabled) VALUES
  ('description_depth', 'Expanded description (min. 300 characters combined)', 'first_publish', true, true)
ON CONFLICT (field_key) DO NOTHING;
