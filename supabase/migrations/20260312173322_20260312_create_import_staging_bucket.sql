/*
  # Create Import Staging Storage Bucket
  
  1. New Storage Bucket
    - `import-staging` bucket for temporarily storing uploaded import files
    - Files are uploaded here first, then parsed server-side
    - This avoids sending giant file contents in JSON request bodies
  
  2. Security
    - Authenticated users can upload files
    - Service role can read files for server-side parsing
    - Files are cleaned up after processing
*/

INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'import-staging',
  'import-staging',
  false,
  104857600,
  ARRAY['text/csv', 'application/json', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel', 'text/plain', 'application/octet-stream']
)
ON CONFLICT (id) DO UPDATE SET
  file_size_limit = 104857600,
  allowed_mime_types = ARRAY['text/csv', 'application/json', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel', 'text/plain', 'application/octet-stream'];

CREATE POLICY "Authenticated users can upload import files"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'import-staging');

CREATE POLICY "Service role can read import files"
ON storage.objects FOR SELECT
TO service_role
USING (bucket_id = 'import-staging');

CREATE POLICY "Service role can delete import files"
ON storage.objects FOR DELETE
TO service_role
USING (bucket_id = 'import-staging');
