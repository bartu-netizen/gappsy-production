-- Additive: request metadata for basic abuse-rate limiting on the public
-- vendor-onboarding edge function (no existing public-submission function in
-- this codebase does per-IP throttling today — see research notes — so this
-- is deliberately minimal: count recent sessions per IP, no external service).
ALTER TABLE vendor_onboarding_sessions ADD COLUMN IF NOT EXISTS ip_address text;
ALTER TABLE vendor_onboarding_sessions ADD COLUMN IF NOT EXISTS user_agent text;

CREATE INDEX IF NOT EXISTS vendor_onboarding_sessions_ip_created_idx ON vendor_onboarding_sessions (ip_address, created_at);
