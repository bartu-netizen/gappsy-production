/*
  # Replay opened dedup — partial unique index

  ## Purpose
  Prevent duplicate `replay_opened` and `replay_completed` events from being
  stored for the same funnel session, even if the client or edge function is
  called multiple times (React StrictMode double-invoke, page refresh, race
  conditions, etc.).

  ## What this does
  1. Adds a partial unique index on `funnel_events(session_id, event_name)`
     scoped only to the two once-per-session replay event types.
  2. Any second INSERT with the same (session_id, event_name) for these event
     types will be rejected at the database level, providing a hard guarantee
     that complements the application-level idempotency guard in the edge
     function.

  ## Tables modified
  - `funnel_events` — new partial unique index added (no columns added/dropped)

  ## Notes
  - `replay_scene_view` is intentionally excluded because multiple scene views
    (different scenes) must be tracked per session.
  - `replay_abandoned` and `replay_cta_click` are excluded because they may
    legitimately recur across browser events.
  - The index is PARTIAL so it has zero impact on other funnel event types.
*/

CREATE UNIQUE INDEX IF NOT EXISTS funnel_events_session_once_per_type_idx
  ON funnel_events (session_id, event_name)
  WHERE event_name IN ('replay_opened', 'replay_completed');
