import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface ToolCategoryOption {
  id: string;
  slug: string;
  name: string;
}

interface ToolTagOption {
  id: string;
  slug: string;
  name: string;
}

interface ScreenshotDraft {
  image_url: string;
  caption: string;
}

interface ReviewDraft {
  author_name: string;
  author_title: string;
  rating: number;
  quote: string;
  source: string;
}

interface ToolFormData {
  slug: string;
  name: string;
  logo: string;
  website: string;
  affiliate_link: string;
  short_description: string;
  long_description: string;
  pricing_model: string;
  starting_price: string;
  youtube_url: string;
  verified: boolean;
  featured: boolean;
  rating: number;
  review_count: number;
  status: 'draft' | 'published' | 'archived';
  founded_year: string;
  company_size: string;
  headquarters: string;
  languages: string;
  category_ids: string[];
  primary_category_id: string;
  tag_ids: string[];
  screenshots: ScreenshotDraft[];
  reviews: ReviewDraft[];
}

const EMPTY_FORM: ToolFormData = {
  slug: '',
  name: '',
  logo: '',
  website: '',
  affiliate_link: '',
  short_description: '',
  long_description: '',
  pricing_model: '',
  starting_price: '',
  youtube_url: '',
  verified: false,
  featured: false,
  rating: 0,
  review_count: 0,
  status: 'draft',
  founded_year: '',
  company_size: '',
  headquarters: '',
  languages: '',
  category_ids: [],
  primary_category_id: '',
  tag_ids: [],
  screenshots: [],
  reviews: [],
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

interface CategoriesListResponse { ok: boolean; data: ToolCategoryOption[]; }
interface TagsListResponse { ok: boolean; data: ToolTagOption[]; }
interface ToolDetailResponse {
  ok: boolean;
  data: Omit<
    ToolFormData,
    'category_ids' | 'primary_category_id' | 'tag_ids' | 'screenshots' | 'reviews' | 'founded_year' | 'company_size' | 'headquarters' | 'languages'
  > & {
    id: string;
    founded_year: number | null;
    company_size: string | null;
    headquarters: string | null;
    languages: string[] | null;
    categories: Array<{ id: string; primary_category: boolean }>;
    tags: Array<{ id: string }>;
    screenshots: Array<{ image_url: string; caption: string | null }>;
    reviews: Array<{ author_name: string; author_title: string | null; rating: number; quote: string; source: string | null }>;
  };
}

export default function WpAdminToolEditorPage() {
  const { id } = useParams<{ id?: string }>();
  const navigate = useNavigate();
  const isEditMode = !!id;

  const { data: categoriesData } = useAdminFetch<CategoriesListResponse>('admin-tool-categories');
  const { data: tagsData } = useAdminFetch<TagsListResponse>('admin-tool-tags');
  const { data: toolData, isLoading, isError, error } = useAdminFetch<ToolDetailResponse>(
    () => (isEditMode ? `admin-tools?id=${id}` : null)
  );

  const [formData, setFormData] = useState<ToolFormData>(EMPTY_FORM);
  const [autoSlug, setAutoSlug] = useState(!isEditMode);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const categories = categoriesData?.data || [];
  const tags = tagsData?.data || [];

  const { mutate: createTool } = useAdminMutation<{ ok: boolean; data: { id: string } }, Record<string, unknown>>(
    'admin-tools',
    'POST'
  );
  const { mutate: updateTool } = useAdminMutation<{ ok: boolean }, Record<string, unknown>>(
    `admin-tools?id=${id}`,
    'PUT'
  );

  useEffect(() => {
    document.title = isEditMode ? 'Edit Tool | Admin' : 'New Tool | Admin';
  }, [isEditMode]);

  useEffect(() => {
    if (toolData?.data) {
      const t = toolData.data;
      const primary = t.categories.find((c) => c.primary_category);
      setFormData({
        slug: t.slug,
        name: t.name,
        logo: t.logo || '',
        website: t.website || '',
        affiliate_link: t.affiliate_link || '',
        short_description: t.short_description || '',
        long_description: t.long_description || '',
        pricing_model: t.pricing_model || '',
        starting_price: t.starting_price || '',
        youtube_url: t.youtube_url || '',
        verified: t.verified,
        featured: t.featured,
        rating: t.rating,
        review_count: t.review_count,
        status: t.status,
        founded_year: t.founded_year ? String(t.founded_year) : '',
        company_size: t.company_size || '',
        headquarters: t.headquarters || '',
        languages: (t.languages || []).join(', '),
        category_ids: t.categories.map((c) => c.id),
        primary_category_id: primary?.id || '',
        tag_ids: t.tags.map((tag) => tag.id),
        screenshots: t.screenshots.map((s) => ({ image_url: s.image_url, caption: s.caption || '' })),
        reviews: t.reviews.map((r) => ({
          author_name: r.author_name,
          author_title: r.author_title || '',
          rating: r.rating,
          quote: r.quote,
          source: r.source || '',
        })),
      });
    }
  }, [toolData]);

  useEffect(() => {
    if (autoSlug && formData.name) {
      setFormData((prev) => ({ ...prev, slug: slugify(prev.name) }));
    }
  }, [formData.name, autoSlug]);

  function toggleCategory(categoryId: string) {
    setFormData((prev) => {
      const selected = prev.category_ids.includes(categoryId);
      const category_ids = selected
        ? prev.category_ids.filter((c) => c !== categoryId)
        : [...prev.category_ids, categoryId];
      const primary_category_id = selected && prev.primary_category_id === categoryId ? '' : prev.primary_category_id;
      return { ...prev, category_ids, primary_category_id };
    });
  }

  function toggleTag(tagId: string) {
    setFormData((prev) => ({
      ...prev,
      tag_ids: prev.tag_ids.includes(tagId) ? prev.tag_ids.filter((t) => t !== tagId) : [...prev.tag_ids, tagId],
    }));
  }

  function addScreenshot() {
    setFormData((prev) => ({ ...prev, screenshots: [...prev.screenshots, { image_url: '', caption: '' }] }));
  }

  function updateScreenshot(index: number, field: keyof ScreenshotDraft, value: string) {
    setFormData((prev) => ({
      ...prev,
      screenshots: prev.screenshots.map((s, i) => (i === index ? { ...s, [field]: value } : s)),
    }));
  }

  function removeScreenshot(index: number) {
    setFormData((prev) => ({ ...prev, screenshots: prev.screenshots.filter((_, i) => i !== index) }));
  }

  function addReview() {
    setFormData((prev) => ({
      ...prev,
      reviews: [...prev.reviews, { author_name: '', author_title: '', rating: 5, quote: '', source: '' }],
    }));
  }

  function updateReview(index: number, field: keyof ReviewDraft, value: string | number) {
    setFormData((prev) => ({
      ...prev,
      reviews: prev.reviews.map((r, i) => (i === index ? { ...r, [field]: value } : r)),
    }));
  }

  function removeReview(index: number) {
    setFormData((prev) => ({ ...prev, reviews: prev.reviews.filter((_, i) => i !== index) }));
  }

  async function handleSave(status?: ToolFormData['status']) {
    setSaveError(null);
    if (!formData.slug || !formData.name) {
      setSaveError('Slug and name are required.');
      return;
    }

    const payload = {
      slug: formData.slug,
      name: formData.name,
      logo: formData.logo || null,
      website: formData.website || null,
      affiliate_link: formData.affiliate_link || null,
      short_description: formData.short_description || null,
      long_description: formData.long_description || null,
      pricing_model: formData.pricing_model || null,
      starting_price: formData.starting_price || null,
      youtube_url: formData.youtube_url || null,
      verified: formData.verified,
      featured: formData.featured,
      rating: formData.rating,
      review_count: formData.review_count,
      status: status || formData.status,
      founded_year: formData.founded_year.trim() ? Number(formData.founded_year) : null,
      company_size: formData.company_size || null,
      headquarters: formData.headquarters || null,
      languages: formData.languages
        .split(',')
        .map((l) => l.trim())
        .filter(Boolean),
      category_ids: formData.category_ids,
      primary_category_id: formData.primary_category_id || null,
      tag_ids: formData.tag_ids,
      screenshots: formData.screenshots.filter((s) => s.image_url.trim()),
      reviews: formData.reviews.filter((r) => r.author_name.trim() && r.quote.trim()),
    };

    setSaving(true);
    const result = isEditMode ? await updateTool(payload) : await createTool(payload);
    setSaving(false);

    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to save tool');
      return;
    }
    navigate('/wp-admin/tools');
  }

  if (isEditMode && isLoading) {
    return (
      <WpAdminLayout title="Edit Tool">
        <AdminLoadingState message="Loading tool..." />
      </WpAdminLayout>
    );
  }

  if (isEditMode && isError && error) {
    return (
      <WpAdminLayout title="Edit Tool">
        <AdminErrorBanner error={error} />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title={isEditMode ? 'Edit Tool' : 'New Tool'}>
      <div className="max-w-3xl mx-auto">
        <Link to="/wp-admin/tools" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Tools
        </Link>

        {saveError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700">{saveError}</div>
        )}

        <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-5">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
            <input
              type="text"
              value={formData.name}
              onChange={(e) => setFormData((p) => ({ ...p, name: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="e.g. Notion AI"
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
            <p className="text-xs text-gray-400 mt-1">/tools/{formData.slug || '...'}</p>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Logo URL</label>
              <input
                type="text"
                value={formData.logo}
                onChange={(e) => setFormData((p) => ({ ...p, logo: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Website</label>
              <input
                type="text"
                value={formData.website}
                onChange={(e) => setFormData((p) => ({ ...p, website: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Affiliate Link</label>
              <input
                type="text"
                value={formData.affiliate_link}
                onChange={(e) => setFormData((p) => ({ ...p, affiliate_link: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">YouTube URL</label>
              <input
                type="text"
                value={formData.youtube_url}
                onChange={(e) => setFormData((p) => ({ ...p, youtube_url: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Short Description</label>
            <textarea
              value={formData.short_description}
              onChange={(e) => setFormData((p) => ({ ...p, short_description: e.target.value }))}
              rows={2}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="One-line summary shown in listings"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Long Description</label>
            <textarea
              value={formData.long_description}
              onChange={(e) => setFormData((p) => ({ ...p, long_description: e.target.value }))}
              rows={5}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Pricing Model</label>
              <input
                type="text"
                value={formData.pricing_model}
                onChange={(e) => setFormData((p) => ({ ...p, pricing_model: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Freemium, Subscription"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Starting Price</label>
              <input
                type="text"
                value={formData.starting_price}
                onChange={(e) => setFormData((p) => ({ ...p, starting_price: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. $10/mo"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Founded Year</label>
              <input
                type="number"
                value={formData.founded_year}
                onChange={(e) => setFormData((p) => ({ ...p, founded_year: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. 2013"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Company Size</label>
              <input
                type="text"
                value={formData.company_size}
                onChange={(e) => setFormData((p) => ({ ...p, company_size: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. 11-50 employees"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Headquarters</label>
              <input
                type="text"
                value={formData.headquarters}
                onChange={(e) => setFormData((p) => ({ ...p, headquarters: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Sydney, Australia"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Languages</label>
              <input
                type="text"
                value={formData.languages}
                onChange={(e) => setFormData((p) => ({ ...p, languages: e.target.value }))}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="Comma-separated, e.g. English, Spanish"
              />
            </div>
          </div>

          <div className="grid grid-cols-4 gap-4">
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                checked={formData.verified}
                onChange={(e) => setFormData((p) => ({ ...p, verified: e.target.checked }))}
              />
              Verified
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                checked={formData.featured}
                onChange={(e) => setFormData((p) => ({ ...p, featured: e.target.checked }))}
              />
              Featured
            </label>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Rating</label>
              <input
                type="number"
                step="0.1"
                min="0"
                max="5"
                value={formData.rating}
                onChange={(e) => setFormData((p) => ({ ...p, rating: Number(e.target.value) }))}
                className="w-full px-2 py-1.5 border border-gray-300 rounded-lg text-sm"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Review Count</label>
              <input
                type="number"
                min="0"
                value={formData.review_count}
                onChange={(e) => setFormData((p) => ({ ...p, review_count: Number(e.target.value) }))}
                className="w-full px-2 py-1.5 border border-gray-300 rounded-lg text-sm"
              />
            </div>
          </div>

          <div className="border-t border-gray-100 pt-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">Categories</label>
            {categories.length === 0 && (
              <p className="text-xs text-gray-400">
                No categories yet. <Link to="/wp-admin/tools/categories/new" className="text-blue-600">Create one</Link>.
              </p>
            )}
            <div className="space-y-1.5">
              {categories.map((category) => {
                const checked = formData.category_ids.includes(category.id);
                return (
                  <div key={category.id} className="flex items-center gap-3 text-sm">
                    <label className="flex items-center gap-2 flex-1">
                      <input type="checkbox" checked={checked} onChange={() => toggleCategory(category.id)} />
                      {category.name}
                    </label>
                    {checked && (
                      <label className="flex items-center gap-1.5 text-xs text-gray-500">
                        <input
                          type="radio"
                          name="primary_category"
                          checked={formData.primary_category_id === category.id}
                          onChange={() => setFormData((p) => ({ ...p, primary_category_id: category.id }))}
                        />
                        Primary
                      </label>
                    )}
                  </div>
                );
              })}
            </div>
          </div>

          <div className="border-t border-gray-100 pt-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">Tags</label>
            {tags.length === 0 && (
              <p className="text-xs text-gray-400">
                No tags yet. <Link to="/wp-admin/tools/tags/new" className="text-blue-600">Create one</Link>.
              </p>
            )}
            <div className="flex flex-wrap gap-3">
              {tags.map((tag) => (
                <label key={tag.id} className="flex items-center gap-1.5 text-sm text-gray-700">
                  <input type="checkbox" checked={formData.tag_ids.includes(tag.id)} onChange={() => toggleTag(tag.id)} />
                  {tag.name}
                </label>
              ))}
            </div>
          </div>

          <div className="border-t border-gray-100 pt-4">
            <div className="flex items-center justify-between mb-2">
              <label className="block text-sm font-medium text-gray-700">Screenshots</label>
              <button
                onClick={addScreenshot}
                className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700"
              >
                <Plus className="w-3.5 h-3.5" />
                Add screenshot
              </button>
            </div>
            <div className="space-y-2">
              {formData.screenshots.map((shot, index) => (
                <div key={index} className="flex gap-2 items-start">
                  <input
                    type="text"
                    value={shot.image_url}
                    onChange={(e) => updateScreenshot(index, 'image_url', e.target.value)}
                    placeholder="Image URL"
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm"
                  />
                  <input
                    type="text"
                    value={shot.caption}
                    onChange={(e) => updateScreenshot(index, 'caption', e.target.value)}
                    placeholder="Caption (optional)"
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm"
                  />
                  <button onClick={() => removeScreenshot(index)} className="p-2 text-gray-400 hover:text-red-600">
                    <Trash2 className="w-4 h-4" />
                  </button>
                </div>
              ))}
            </div>
          </div>

          <div className="border-t border-gray-100 pt-4">
            <div className="flex items-center justify-between mb-2">
              <label className="block text-sm font-medium text-gray-700">Reviews</label>
              <button
                onClick={addReview}
                className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700"
              >
                <Plus className="w-3.5 h-3.5" />
                Add review
              </button>
            </div>
            <div className="space-y-3">
              {formData.reviews.map((review, index) => (
                <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                  <div className="grid grid-cols-3 gap-2">
                    <input
                      type="text"
                      value={review.author_name}
                      onChange={(e) => updateReview(index, 'author_name', e.target.value)}
                      placeholder="Author name"
                      className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                    />
                    <input
                      type="text"
                      value={review.author_title}
                      onChange={(e) => updateReview(index, 'author_title', e.target.value)}
                      placeholder="Author title (optional)"
                      className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                    />
                    <input
                      type="number"
                      step="1"
                      min="1"
                      max="5"
                      value={review.rating}
                      onChange={(e) => updateReview(index, 'rating', Number(e.target.value))}
                      placeholder="Rating (1-5)"
                      className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                    />
                  </div>
                  <textarea
                    value={review.quote}
                    onChange={(e) => updateReview(index, 'quote', e.target.value)}
                    rows={2}
                    placeholder="Review quote"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm"
                  />
                  <div className="flex gap-2">
                    <input
                      type="text"
                      value={review.source}
                      onChange={(e) => updateReview(index, 'source', e.target.value)}
                      placeholder="Source (optional, e.g. G2, Editorial)"
                      className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm"
                    />
                    <button onClick={() => removeReview(index)} className="p-2 text-gray-400 hover:text-red-600">
                      <Trash2 className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="flex justify-end gap-2 pt-2 border-t border-gray-100">
            <button
              onClick={() => handleSave('draft')}
              disabled={saving}
              className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2.5 rounded-lg font-medium hover:bg-gray-200 disabled:opacity-50 transition text-sm"
            >
              Save Draft
            </button>
            {formData.status === 'published' && (
              <button
                onClick={() => handleSave('archived')}
                disabled={saving}
                className="inline-flex items-center gap-2 bg-slate-100 text-slate-700 px-4 py-2.5 rounded-lg font-medium hover:bg-slate-200 disabled:opacity-50 transition text-sm"
              >
                Archive
              </button>
            )}
            <button
              onClick={() => handleSave('published')}
              disabled={saving}
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-400 transition text-sm"
            >
              <Save className="w-4 h-4" />
              {saving ? 'Saving...' : 'Publish'}
            </button>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
