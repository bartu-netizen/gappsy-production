import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Save, ArrowLeft } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface CategoryFormData {
  slug: string;
  name: string;
  description: string;
  seo_title: string;
  seo_description: string;
  icon: string;
  status: 'draft' | 'published' | 'archived';
}

const EMPTY_FORM: CategoryFormData = {
  slug: '',
  name: '',
  description: '',
  seo_title: '',
  seo_description: '',
  icon: '',
  status: 'published',
};

function slugify(value: string): string {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '');
}

interface DetailResponse {
  ok: boolean;
  data: CategoryFormData & { id: string };
}

export default function WpAdminToolCategoryEditorPage() {
  const { id } = useParams<{ id?: string }>();
  const navigate = useNavigate();
  const isEditMode = !!id;

  const { data, isLoading, isError, error } = useAdminFetch<DetailResponse>(
    () => (isEditMode ? `admin-tool-categories?id=${id}` : null)
  );

  const [formData, setFormData] = useState<CategoryFormData>(EMPTY_FORM);
  const [autoSlug, setAutoSlug] = useState(!isEditMode);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const { mutate: createCategory } = useAdminMutation<{ ok: boolean; data: { id: string } }, CategoryFormData>(
    'admin-tool-categories',
    'POST'
  );
  const { mutate: updateCategory } = useAdminMutation<{ ok: boolean }, CategoryFormData>(
    `admin-tool-categories?id=${id}`,
    'PUT'
  );

  useEffect(() => {
    document.title = isEditMode ? 'Edit Tool Category | Admin' : 'New Tool Category | Admin';
  }, [isEditMode]);

  useEffect(() => {
    if (data?.data) {
      const c = data.data;
      setFormData({
        slug: c.slug,
        name: c.name,
        description: c.description || '',
        seo_title: c.seo_title || '',
        seo_description: c.seo_description || '',
        icon: c.icon || '',
        status: c.status,
      });
    }
  }, [data]);

  useEffect(() => {
    if (autoSlug && formData.name) {
      setFormData((prev) => ({ ...prev, slug: slugify(prev.name) }));
    }
  }, [formData.name, autoSlug]);

  async function handleSave() {
    setSaveError(null);
    if (!formData.slug || !formData.name) {
      setSaveError('Slug and name are required.');
      return;
    }
    setSaving(true);
    const result = isEditMode ? await updateCategory(formData) : await createCategory(formData);
    setSaving(false);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to save category');
      return;
    }
    navigate('/wp-admin/tools/categories');
  }

  if (isEditMode && isLoading) {
    return (
      <WpAdminLayout title="Edit Tool Category">
        <AdminLoadingState message="Loading category..." />
      </WpAdminLayout>
    );
  }

  if (isEditMode && isError && error) {
    return (
      <WpAdminLayout title="Edit Tool Category">
        <AdminErrorBanner error={error} />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title={isEditMode ? 'Edit Tool Category' : 'New Tool Category'}>
      <div className="max-w-2xl mx-auto">
        <Link to="/wp-admin/tools/categories" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Categories
        </Link>

        {saveError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700">{saveError}</div>
        )}

        <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
            <input
              type="text"
              value={formData.name}
              onChange={(e) => setFormData((p) => ({ ...p, name: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="e.g. AI Writing Tools"
            />
          </div>

          <div>
            <div className="flex items-center justify-between mb-1">
              <label className="block text-sm font-medium text-gray-700">Slug</label>
              <label className="flex items-center gap-1.5 text-xs text-gray-500">
                <input type="checkbox" checked={autoSlug} onChange={(e) => setAutoSlug(e.target.checked)} />
                Auto-generate
              </label>
            </div>
            <input
              type="text"
              value={formData.slug}
              onChange={(e) => { setAutoSlug(false); setFormData((p) => ({ ...p, slug: slugify(e.target.value) })); }}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm font-mono focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
            <p className="text-xs text-gray-400 mt-1">/tool-categories/{formData.slug || '...'}</p>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
            <textarea
              value={formData.description}
              onChange={(e) => setFormData((p) => ({ ...p, description: e.target.value }))}
              rows={3}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">SEO Title</label>
              <input
                type="text"
                value={formData.seo_title}
                onChange={(e) => setFormData((p) => ({ ...p, seo_title: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Icon (lucide name)</label>
              <input
                type="text"
                value={formData.icon}
                onChange={(e) => setFormData((p) => ({ ...p, icon: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Sparkles"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">SEO Description</label>
            <textarea
              value={formData.seo_description}
              onChange={(e) => setFormData((p) => ({ ...p, seo_description: e.target.value }))}
              rows={2}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select
              value={formData.status}
              onChange={(e) => setFormData((p) => ({ ...p, status: e.target.value as CategoryFormData['status'] }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="draft">Draft</option>
              <option value="published">Published</option>
              <option value="archived">Archived</option>
            </select>
          </div>

          <div className="flex justify-end pt-2">
            <button
              onClick={handleSave}
              disabled={saving}
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-400 transition text-sm"
            >
              <Save className="w-4 h-4" />
              {saving ? 'Saving...' : 'Save Category'}
            </button>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
