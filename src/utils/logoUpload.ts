export interface UploadLogoOptions {
  file: File;
  stateSlug: string;
  rank: number;
  adminSecret?: string;
}

export interface UploadLogoResult {
  success: boolean;
  logoUrl?: string;
  error?: string;
}

const MAX_FILE_SIZE = 5 * 1024 * 1024;
const ALLOWED_TYPES = ['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/svg+xml'];

function getSessionToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

export async function uploadAgencyLogo({
  file,
  stateSlug,
  rank,
  adminSecret
}: UploadLogoOptions): Promise<UploadLogoResult> {
  try {
    if (file.size > MAX_FILE_SIZE) {
      return {
        success: false,
        error: 'File too large (max 5MB)'
      };
    }

    if (!ALLOWED_TYPES.includes(file.type)) {
      return {
        success: false,
        error: 'Invalid file type. Please upload PNG, JPG, WEBP, or SVG'
      };
    }

    const extension = file.name.split('.').pop()?.toLowerCase() || 'jpg';
    const normalizedExtension = extension === 'jpeg' ? 'jpg' : extension;
    const filename = `rank-${rank}-${Date.now()}.${normalizedExtension}`;

    const base64Data = await new Promise<string>((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        const result = reader.result as string;
        resolve(result.split(',')[1]);
      };
      reader.onerror = () => reject(new Error('Failed to read file'));
      reader.readAsDataURL(file);
    });

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const endpoint = `${supabaseUrl}/functions/v1/logo-upload`;

    const uploadData = [
      {
        filename,
        base64Data,
        state: stateSlug,
        agencyRank: rank,
      }
    ];

    const token = getSessionToken();
    const response = await fetch(endpoint, {
      method: 'POST',
      headers: {
        ...(token ? { 'x-admin-token': token } : {}),
        ...(adminSecret ? { 'x-admin-secret': adminSecret } : {}),
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(uploadData),
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      return {
        success: false,
        error: errorData.error || `Upload failed: ${response.status}`
      };
    }

    const result = await response.json();

    if (!result.success || !result.results || result.results.length === 0) {
      return {
        success: false,
        error: result.error || 'Upload failed'
      };
    }

    const uploadResult = result.results[0];

    if (!uploadResult.success) {
      return {
        success: false,
        error: uploadResult.error || 'Upload failed'
      };
    }

    return {
      success: true,
      logoUrl: uploadResult.logoUrl
    };
  } catch (error) {
    console.error('Logo upload error:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Upload failed'
    };
  }
}
