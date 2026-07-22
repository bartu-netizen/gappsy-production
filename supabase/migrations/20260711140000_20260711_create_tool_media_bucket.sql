/*
  # tool-media Storage bucket

  Public bucket for tool screenshot uploads (Tools CMS media manager).
  Public SELECT only — no client-side INSERT/UPDATE/DELETE policy is
  granted, unlike the older agency-logos bucket. All writes go through the
  new admin-tool-media edge function using the service-role key (which
  bypasses Storage RLS entirely), gated by requireAdminSession(), so there
  is no need for — and no risk from — an "any authenticated user can
  upload" policy.
*/

INSERT INTO storage.buckets (id, name, public)
VALUES ('tool-media', 'tool-media', true)
ON CONFLICT (id) DO NOTHING;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'storage'
    AND tablename = 'objects'
    AND policyname = 'Public Access to Tool Media'
  ) THEN
    CREATE POLICY "Public Access to Tool Media"
    ON storage.objects FOR SELECT
    USING (bucket_id = 'tool-media');
  END IF;
END $$;
