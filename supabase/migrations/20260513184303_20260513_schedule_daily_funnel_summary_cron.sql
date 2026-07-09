/*
  # Schedule Daily Funnel Summary Email via pg_cron

  1. Purpose
    - Triggers the `daily-funnel-summary` edge function every day at 12:00 Europe/Amsterdam time
    - Uses pg_net to make an HTTP POST call to the edge function
    - The edge function handles deduplication internally (won't send twice for the same date)

  2. Schedule
    - Cron expression uses UTC: 10:00 UTC = 12:00 CEST (summer) / 11:00 CET (winter)
    - During winter time (CET, UTC+1), the email arrives at 11:00 Amsterdam — acceptable drift
    - For precise timezone handling, we schedule at 10:00 UTC which covers the majority of the year correctly

  3. Security
    - Uses vault-stored service role key for authentication
    - Edge function is public (verify_jwt=false) but only sends to hardcoded recipient
*/

-- Schedule the daily funnel summary at 10:00 UTC (12:00 Amsterdam CEST)
SELECT cron.schedule(
  'daily-funnel-summary-email',
  '0 10 * * *',
  $$
  SELECT net.http_post(
    url := (SELECT decrypted_secret FROM vault.decrypted_secrets WHERE name = 'supabase_url') || '/functions/v1/daily-funnel-summary',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'Authorization', 'Bearer ' || (SELECT decrypted_secret FROM vault.decrypted_secrets WHERE name = 'supabase_service_role_key')
    ),
    body := '{"source":"pg_cron"}'::jsonb
  );
  $$
);
