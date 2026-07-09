/*
  # Create ListClean Monitor State Table

  1. New Tables
    - `listclean_monitor_state`
      - Singleton table (id='default') to persist credits monitoring state
      - Tracks current credits, status transitions, alert history
      - Tracks queue pause/resume state for auto-pause on critical credits
      
  2. Columns
    - `id` (text) - singleton key, always 'default'
    - `last_credits_value` (integer) - last known credit count
    - `last_status` (text) - last known status: ok|warning|critical|error
    - `last_checked_at` (timestamptz) - when credits were last fetched
    - `last_alert_sent_at` (timestamptz) - when last alert was sent
    - `last_alert_type_sent` (text) - what alert was sent: warning|critical|recovered
    - `queue_auto_paused` (boolean) - whether queue is auto-paused due to critical credits
    - `queue_auto_paused_at` (timestamptz) - when auto-pause was triggered
    - `queue_pause_reason` (text) - reason for pause: critical_credits|manual
    - `manual_pause` (boolean) - whether queue is manually paused (future feature)
    - `updated_at` (timestamptz) - last update timestamp
    
  3. Security
    - Backend/service role only (no RLS policies)
    - Admin endpoints will check authentication separately
    
  4. Notes
    - Exactly one row with id='default' is maintained
    - All queries use id='default' as filter
*/

CREATE TABLE IF NOT EXISTS listclean_monitor_state (
  id text PRIMARY KEY,
  last_credits_value integer NULL,
  last_status text NULL,
  last_checked_at timestamptz NULL,
  last_alert_sent_at timestamptz NULL,
  last_alert_type_sent text NULL,
  queue_auto_paused boolean NOT NULL DEFAULT false,
  queue_auto_paused_at timestamptz NULL,
  queue_pause_reason text NULL,
  manual_pause boolean NOT NULL DEFAULT false,
  updated_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO listclean_monitor_state (id, updated_at)
VALUES ('default', now())
ON CONFLICT (id) DO NOTHING;
