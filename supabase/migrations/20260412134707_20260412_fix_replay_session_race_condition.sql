/*
  # Fix replay_opened race condition — duplicate sessions, events, and admin emails

  ## Root Cause
  Two simultaneous `replay_opened` POST requests (browser retries, React
  StrictMode double-invoke, network duplicate delivery) both execute:

    SELECT id FROM funnel_sessions WHERE fsid = $replay_session_id

  Both return NULL (no row yet). Both then INSERT a new funnel_sessions row.
  Because fsid had no uniqueness constraint, both inserts succeed and produce
  TWO sessions with different `id` values but the same `fsid`.

  The session-scoped idempotency guard (step 2.5) then checks:
    SELECT FROM funnel_events WHERE session_id = $sessionId AND event_name = 'replay_opened'

  Each request holds a DIFFERENT session_id, so neither sees the other's event.
  Both insert a replay_opened event and send an admin email → 2 emails, double
  analytics count.

  ## Fix 1 — DB-level session uniqueness
  Partial UNIQUE INDEX on funnel_sessions(fsid) scoped to request_replay funnel.
  Now only ONE session per replay_session_id can exist. The second concurrent
  INSERT gets a 23505 unique violation and falls back to looking up the winner.

  ## Fix 2 — Expression index for metadata-level replay_session_id dedupe
  Adds an expression index on funnel_events((metadata->>'replay_session_id'))
  scoped to request_replay events so the belt-and-suspenders dedupe check
  (which queries JSONB metadata) runs in O(log n) not O(n).

  ## Tables modified
  - funnel_sessions: new partial unique index on (fsid) WHERE NOT NULL AND request_replay
  - funnel_events: new partial expression index on metadata replay_session_id

  ## Notes
  - Both indexes are PARTIAL — zero impact on other funnel types
  - The edge function is also updated (separately) to use INSERT-first + graceful
    23505 handling, replacing the race-prone SELECT-then-INSERT pattern
*/

-- Fix 1: guarantee at most one funnel_sessions row per replay_session_id
CREATE UNIQUE INDEX IF NOT EXISTS funnel_sessions_replay_fsid_unique_idx
  ON funnel_sessions (fsid)
  WHERE fsid IS NOT NULL AND funnel_name = 'request_replay';

-- Fix 2: fast JSONB lookup for belt-and-suspenders dedupe by replay_session_id
CREATE INDEX IF NOT EXISTS funnel_events_replay_session_id_expr_idx
  ON funnel_events ((metadata->>'replay_session_id'), event_name)
  WHERE funnel_name = 'request_replay'
    AND event_name IN ('replay_opened', 'replay_completed');
