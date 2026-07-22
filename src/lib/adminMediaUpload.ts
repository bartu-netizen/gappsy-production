// Multipart upload helper for the Tools CMS media manager. Separate from
// adminApiFetch because that wrapper always JSON.stringifies the body and
// forces Content-Type: application/json — incompatible with FormData
// uploads. Reuses the same token storage (gappsy_admin_token) so it stays
// in sync with the rest of the admin session system.

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export interface UploadToolMediaResult {
  ok: boolean;
  url?: string;
  error?: string;
}

export async function uploadToolMedia(file: File, toolId: string, kind: 'logo' | 'screenshot'): Promise<UploadToolMediaResult> {
  const token = localStorage.getItem('gappsy_admin_token');
  if (!token) return { ok: false, error: 'No admin session found. Please log in.' };

  const formData = new FormData();
  formData.append('file', file);
  formData.append('toolId', toolId);
  formData.append('kind', kind);

  try {
    const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-tool-media`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        apikey: SUPABASE_ANON_KEY,
        'x-admin-token': token,
      },
      body: formData,
    });
    const data = await res.json();
    if (!res.ok || !data.ok) {
      return { ok: false, error: data.error || `Upload failed (${res.status})` };
    }
    return { ok: true, url: data.url };
  } catch (err) {
    return { ok: false, error: err instanceof Error ? err.message : 'Upload failed' };
  }
}
