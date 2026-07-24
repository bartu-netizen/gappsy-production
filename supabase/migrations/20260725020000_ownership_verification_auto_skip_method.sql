-- Widens vendor_ownership_tokens.verification_method to allow
-- 'auto_skip_temporary' — used when SKIP_OWNERSHIP_VERIFICATION is on in
-- vendorFeatureActivation.ts, so tokens created while the real
-- meta-tag/DNS/file check is temporarily disabled are honestly labeled in
-- the audit trail rather than reusing 'manual' (which means an admin
-- actually clicked to verify). Purely additive — existing values unchanged.
ALTER TABLE vendor_ownership_tokens DROP CONSTRAINT vendor_ownership_tokens_verification_method_check;
ALTER TABLE vendor_ownership_tokens ADD CONSTRAINT vendor_ownership_tokens_verification_method_check
  CHECK (verification_method IS NULL OR verification_method = ANY (ARRAY['domain_email', 'html_meta_tag', 'dns_txt', 'html_file', 'manual', 'auto_skip_temporary']::text[]));
