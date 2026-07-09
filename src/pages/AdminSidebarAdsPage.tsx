import { useState, useEffect } from 'react';
import { Save, AlertCircle, CheckCircle2 } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

interface SidebarAd {
  id: string;
  position: string;
  display_order: number;
  logo_url: string;
  title: string;
  subtitle: string;
  target_url: string;
  bg_color: string;
  is_active: boolean;
}

function getSessionToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

export default function AdminSidebarAdsPage() {
  const [ads, setAds] = useState<SidebarAd[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [uploadingLogoId, setUploadingLogoId] = useState<string | null>(null);

  const token = getSessionToken();

  useEffect(() => {
    document.title = 'Admin - Sidebar Ads Manager | Gappsy';
    if (token) {
      loadAds();
    }
  }, []);

  const loadAds = async () => {
    setLoading(true);
    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-fetch`;
      const response = await fetch(apiUrl);
      const data = await response.json();

      if (data.ads) {
        setAds(data.ads.sort((a: SidebarAd, b: SidebarAd) => {
          if (a.position !== b.position) {
            return a.position === 'left' ? -1 : 1;
          }
          return a.display_order - b.display_order;
        }));
      }
    } catch {
      setError('Failed to load ads');
    }
    setLoading(false);
  };

  const handleSave = async () => {
    setError('');
    setSuccess('');
    setLoading(true);

    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-update`;
      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-admin-token': token,
        },
        body: JSON.stringify({ ads }),
      });

      const data = await response.json();

      if (response.ok) {
        setSuccess('All changes saved successfully!');
        setTimeout(() => setSuccess(''), 3000);
      } else {
        setError(data.error || 'Failed to save changes');
      }
    } catch {
      setError('Failed to save changes');
    }
    setLoading(false);
  };

  const updateAd = (id: string, field: keyof SidebarAd, value: string) => {
    setAds(ads.map(ad => ad.id === id ? { ...ad, [field]: value } : ad));
  };

  const handleLogoUpload = async (adId: string, file: File) => {
    setError('');
    setSuccess('');

    if (!file.type.startsWith('image/')) {
      setError('Please select an image file');
      return;
    }

    const maxSize = 2 * 1024 * 1024;
    if (file.size > maxSize) {
      setError('File too large (max 2MB)');
      return;
    }

    const formData = new FormData();
    formData.append('file', file);

    setUploadingLogoId(adId);

    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-logo-upload`;

      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'x-admin-token': token,
        },
        body: formData,
      });

      let data;
      try {
        data = await response.json();
      } catch {
        throw new Error(`Upload failed: Invalid server response (${response.status})`);
      }

      if (!response.ok) {
        throw new Error(data.error || data.message || `Upload failed (${response.status})`);
      }

      if (!data.url) {
        throw new Error('Upload succeeded but no URL returned');
      }

      setAds(ads.map(ad => ad.id === adId ? { ...ad, logo_url: data.url } : ad));
      setSuccess('Logo uploaded successfully!');
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err?.message || 'Logo upload failed. Please try again.');
      setTimeout(() => setError(''), 5000);
    } finally {
      setUploadingLogoId(null);
    }
  };

  return (
    <WpAdminLayout title="Homepage Ads" subtitle="Edit sidebar advertisement placements on the homepage">
      <div className="space-y-6">
        {!token && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4">
            <p className="text-sm font-semibold text-red-900">Authentication required</p>
          </div>
        )}

        {error && (
          <div className="mb-6 p-4 bg-red-50 text-red-700 rounded-lg flex items-center gap-2">
            <AlertCircle className="w-5 h-5" />
            {error}
          </div>
        )}

        {success && (
          <div className="mb-6 p-4 bg-green-50 text-green-700 rounded-lg flex items-center gap-2">
            <CheckCircle2 className="w-5 h-5" />
            {success}
          </div>
        )}

        {loading && ads.length === 0 ? (
          <div className="text-center py-12">Loading ads...</div>
        ) : (
          <div className="grid md:grid-cols-2 gap-6 mb-6">
            {ads.map((ad) => (
              <div key={ad.id} className="bg-white rounded-lg shadow p-6">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="font-bold text-lg">
                    {ad.position === 'left' ? 'Left' : 'Right'} Sidebar - Position {ad.display_order}
                  </h3>
                  <span className="text-xs text-gray-500 font-mono">{ad.id}</span>
                </div>

                <div className="space-y-4">
                  {ad.logo_url && (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">Current Logo</label>
                      <div
                        className="flex items-center justify-center p-4 bg-gray-50 rounded-lg border border-gray-200"
                        style={{ height: 'var(--sidebarAdLogoMaxH)' }}
                      >
                        <img
                          src={ad.logo_url}
                          alt={ad.title || 'Logo'}
                          data-sidebar-ad-logo="true"
                          className="object-contain"
                        />
                      </div>
                    </div>
                  )}

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Logo URL</label>
                    <input
                      type="text"
                      value={ad.logo_url}
                      onChange={(e) => updateAd(ad.id, 'logo_url', e.target.value)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
                      placeholder="/logos/example.png"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Upload Logo <span className="text-gray-500 font-normal">(max 2MB)</span>
                    </label>
                    <div className="flex items-center gap-2">
                      <input
                        type="file"
                        accept="image/*"
                        onChange={(e) => {
                          const file = e.target.files?.[0];
                          if (file) {
                            handleLogoUpload(ad.id, file);
                            e.target.value = '';
                          }
                        }}
                        disabled={uploadingLogoId === ad.id}
                        className="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-blue-50 file:text-blue-600 hover:file:bg-blue-100 disabled:opacity-50"
                      />
                    </div>
                    {uploadingLogoId === ad.id && (
                      <p className="text-xs text-blue-600 mt-1 flex items-center gap-1">
                        <svg className="animate-spin h-3 w-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        Uploading...
                      </p>
                    )}
                    <p className="text-xs text-gray-500 mt-1">
                      Upload will replace the current logo URL. Images are stored in Supabase Storage.
                    </p>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Title <span className="text-gray-500">({ad.title.length}/18 chars)</span>
                    </label>
                    <input
                      type="text"
                      value={ad.title}
                      onChange={(e) => {
                        if (e.target.value.length <= 18) updateAd(ad.id, 'title', e.target.value);
                      }}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
                      maxLength={18}
                      placeholder="Ad Title"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Subtitle <span className="text-gray-500">({ad.subtitle.length}/52 chars)</span>
                    </label>
                    <textarea
                      value={ad.subtitle}
                      onChange={(e) => {
                        if (e.target.value.length <= 52) updateAd(ad.id, 'subtitle', e.target.value);
                      }}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
                      rows={2}
                      maxLength={52}
                      placeholder="Short description (2 lines max)"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Target URL <span className="text-gray-500">(leave empty for non-clickable)</span>
                    </label>
                    <input
                      type="text"
                      value={ad.target_url}
                      onChange={(e) => updateAd(ad.id, 'target_url', e.target.value)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
                      placeholder="/page or https://example.com"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Background Color <span className="text-gray-500">(optional, leave empty for auto)</span>
                    </label>
                    <div className="flex gap-2">
                      <input
                        type="text"
                        value={ad.bg_color}
                        onChange={(e) => updateAd(ad.id, 'bg_color', e.target.value)}
                        className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
                        placeholder="#E0F2FE"
                      />
                      {ad.bg_color && (
                        <div
                          className="w-12 h-10 rounded-lg border border-gray-300"
                          style={{ backgroundColor: ad.bg_color }}
                        />
                      )}
                    </div>
                  </div>

                  <div className="pt-2 border-t border-gray-200">
                    <div className="text-sm text-gray-600">
                      <div>Position: <span className="font-medium">{ad.position}</span> (fixed)</div>
                      <div>Order: <span className="font-medium">{ad.display_order}</span> (fixed)</div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        <div className="bg-white rounded-lg shadow-lg p-6">
          <button
            onClick={handleSave}
            disabled={loading}
            className="w-full bg-slate-900 text-white py-4 rounded-lg hover:bg-slate-800 transition-colors font-medium text-lg flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <Save className="w-5 h-5" />
            {loading ? 'Saving...' : 'Save All Changes'}
          </button>
          <p className="text-center text-sm text-gray-600 mt-3">
            Changes will be reflected immediately on the homepage
          </p>
        </div>
      </div>
    </WpAdminLayout>
  );
}
