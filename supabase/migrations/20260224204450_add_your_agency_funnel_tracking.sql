/*
  # Your Agency Funnel Tracking

  ## Purpose
  Adds dedicated tracking for the /your-agency + owner preview conversion funnel.
  Supports fsid (funnel session ID) propagation across all steps, with step_number
  and funnel_name fields for precise drop-off segmentation.

  ## Changes to funnel_sessions
  - Add `fsid` text UNIQUE — client-generated stable session ID from localStorage
  - Add `step_number` int — highest step reached
  - Add `funnel_name` text — 'your_agency' to distinguish from other funnels
  - Add `is_demo` boolean — whether any event in this session was a demo event
  - Add `last_step_number` int — alias for step_number, used in rollup display
  - Add `drop_off_event` text — last event_name before conversion

  ## Changes to funnel_events
  - Add `fsid` text — links event to session by client ID
  - Add `step_number` int — step number of this event (10/20/30...150)
  - Add `funnel_name` text — 'your_agency'
  - Add `is_demo` boolean — whether this event happened in demo context

  ## Indexes
  - idx_funnel_sessions_fsid on funnel_sessions(fsid)
  - idx_funnel_events_fsid on funnel_events(fsid)
  - idx_funnel_events_funnel_name on funnel_events(funnel_name, step_number)
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'fsid'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN fsid text UNIQUE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'step_number'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN step_number int DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'funnel_name'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN funnel_name text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'is_demo'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN is_demo boolean DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'drop_off_event'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN drop_off_event text;
  END IF;
END $$;

-- funnel_events additions

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'fsid'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN fsid text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'step_number'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN step_number int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'funnel_name'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN funnel_name text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'is_demo'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN is_demo boolean DEFAULT false;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_fsid ON funnel_sessions (fsid);
CREATE INDEX IF NOT EXISTS idx_funnel_events_fsid ON funnel_events (fsid);
CREATE INDEX IF NOT EXISTS idx_funnel_events_funnel_name ON funnel_events (funnel_name, step_number);
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_funnel_name ON funnel_sessions (funnel_name, step_number DESC);
