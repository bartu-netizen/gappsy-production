/*
  # Persistent provider cursor state (Discovery scale — Phase 1)

  Fixes the exact limitation documented in discoveryProviderRunner.ts's own
  comment: cursor_out has always been recorded per-run in
  discovery_provider_runs, but nothing threaded it back in as the next
  run's cursorIn — every run started fresh (cursorIn = null), acknowledged
  as a known gap since the Discovery Provider Architecture migration
  (20260712210500). discovery_provider_runs itself is untouched — it
  remains the full per-run cursor history; these are new columns on
  discovery_providers holding only the LATEST successfully-advanced value.
*/

ALTER TABLE discovery_providers
  ADD COLUMN IF NOT EXISTS last_cursor text,
  ADD COLUMN IF NOT EXISTS cursor_updated_at timestamptz,
  ADD COLUMN IF NOT EXISTS cursor_reset_at timestamptz;
