import { useEffect, useMemo, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import {
  Save, ArrowLeft, Plus, Trash2, ArrowUp, ArrowDown, Eye, ExternalLink,
  CheckCircle2, XCircle, Circle, Upload, Loader2, AlertTriangle,
  Video, Link2, Repeat, Lock, Sparkles,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { uploadToolMedia } from '../lib/adminMediaUpload';
import { computeCompleteness, type ToolCompletenessInput, type CompletenessResult } from '../utils/toolCompleteness';
import { TOOL_STATUSES, toolStatusLabel, type ToolStatus } from '../utils/toolStatus';
import { buildToolJsonLd } from '../utils/toolJsonLd';

interface ToolCategoryOption { id: string; slug: string; name: string; }
interface ToolTagOption { id: string; slug: string; name: string; }

interface ScreenshotDraft { image_url: string; caption: string; alt_text: string; is_featured: boolean; }
interface ReviewDraft { author_name: string; author_title: string; rating: number; quote: string; source: string; }
interface PricingPlanDraft { plan_name: string; price: string; billing_cycle: string; description: string; features: string; is_recommended: boolean; }
interface IntegrationDraft { integration_name: string; integration_slug: string; integration_logo: string; description: string; }
interface FeatureDraft { group_name: string; title: string; description: string; }
interface UseCaseDraft { title: string; description: string; audience: string; }
interface FaqDraft { question: string; answer: string; status: 'draft' | 'published'; }
interface VideoDraft { title: string; video_url: string; thumbnail_url: string; }
interface InternalLinkDraft { label: string; url: string; }
interface AlternativeDraft { alternative_tool_id: string; alternative_name: string; alternative_url: string; alternative_logo: string; note: string; }

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
  is_editors_pick: boolean;
  rating: number;
  review_count: number;
  status: ToolStatus;
  founded_year: string;
  company_size: string;
  headquarters: string;
  languages: string;
  category_ids: string[];
  primary_category_id: string;
  tag_ids: string[];
  screenshots: ScreenshotDraft[];
  reviews: ReviewDraft[];
  pricing_plans: PricingPlanDraft[];
  integrations: IntegrationDraft[];
  features: FeatureDraft[];
  pros: string[];
  cons: string[];
  use_cases: UseCaseDraft[];
  faqs: FaqDraft[];
  videos: VideoDraft[];
  internal_links: InternalLinkDraft[];
  alternatives: AlternativeDraft[];
  seo_title: string;
  seo_meta_description: string;
  og_title: string;
  og_description: string;
  og_image: string;
  noindex: boolean;
  sitemap_eligible: boolean;
  canonical_url: string;
  scheduled_publish_at: string;
}

const EMPTY_FORM: ToolFormData = {
  slug: '', name: '', logo: '', website: '', affiliate_link: '', short_description: '', long_description: '',
  pricing_model: '', starting_price: '', youtube_url: '', verified: false, featured: false, is_editors_pick: false,
  rating: 0, review_count: 0, status: 'draft', founded_year: '', company_size: '', headquarters: '', languages: '',
  category_ids: [], primary_category_id: '', tag_ids: [],
  screenshots: [], reviews: [], pricing_plans: [], integrations: [], features: [], pros: [], cons: [], use_cases: [], faqs: [],
  videos: [], internal_links: [], alternatives: [],
  seo_title: '', seo_meta_description: '', og_title: '', og_description: '', og_image: '', noindex: false, sitemap_eligible: true,
  canonical_url: '', scheduled_publish_at: '',
};

const TABS = [
  'Overview', 'Classification', 'Company', 'Pricing', 'Features', 'Pros & Cons',
  'Use Cases', 'Screenshots', 'Integrations', 'Videos', 'Alternatives', 'Internal Links',
  'FAQ', 'Reviews', 'SEO', 'Publishing',
] as const;
type Tab = typeof TABS[number];

function slugify(value: string): string {
  return value.toLowerCase().trim().replace(/[^\w\s-]/g, '').replace(/\s+/g, '-').replace(/-+/g, '-').replace(/^-+|-+$/g, '');
}

// datetime-local inputs use local time with no timezone/seconds; convert to/from ISO for the API.
function isoToLocalInput(iso: string | null | undefined): string {
  if (!iso) return '';
  const d = new Date(iso);
  if (Number.isNaN(d.getTime())) return '';
  const pad = (n: number) => String(n).padStart(2, '0');
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`;
}

function localInputToIso(value: string): string | null {
  if (!value.trim()) return null;
  const d = new Date(value);
  if (Number.isNaN(d.getTime())) return null;
  return d.toISOString();
}

function move<T>(arr: T[], index: number, dir: -1 | 1): T[] {
  const next = [...arr];
  const target = index + dir;
  if (target < 0 || target >= next.length) return arr;
  [next[index], next[target]] = [next[target], next[index]];
  return next;
}

interface CategoriesListResponse { ok: boolean; data: ToolCategoryOption[]; }
interface TagsListResponse { ok: boolean; data: ToolTagOption[]; }

interface ToolDetailResponse {
  ok: boolean;
  data: {
    id: string;
    slug: string; name: string; logo: string | null; website: string | null; affiliate_link: string | null;
    short_description: string | null; long_description: string | null; pricing_model: string | null;
    starting_price: string | null; youtube_url: string | null; verified: boolean; featured: boolean;
    is_editors_pick: boolean; rating: number; review_count: number; status: ToolFormData['status'];
    founded_year: number | null; company_size: string | null; headquarters: string | null; languages: string[] | null;
    seo_title: string | null; seo_meta_description: string | null; og_title: string | null; og_description: string | null;
    og_image: string | null; noindex: boolean; sitemap_eligible: boolean;
    canonical_url: string | null; scheduled_publish_at: string | null;
    first_publish_missing?: string[];
    categories: Array<{ id: string; primary_category: boolean }>;
    tags: Array<{ id: string }>;
    screenshots: Array<{ image_url: string; caption: string | null; alt_text: string | null; is_featured: boolean }>;
    reviews: Array<{ author_name: string; author_title: string | null; rating: number; quote: string; source: string | null }>;
    pricing_plans: Array<{ plan_name: string | null; price: string | null; billing_cycle: string | null; description: string | null; features: string[]; is_recommended: boolean }>;
    integrations: Array<{ integration_name: string; integration_slug: string | null; integration_logo: string | null; description: string | null }>;
    features: Array<{ group_name: string | null; title: string; description: string | null }>;
    pros: string[];
    cons: string[];
    use_cases: Array<{ title: string; description: string | null; audience: string | null }>;
    faqs: Array<{ question: string; answer: string; status: 'draft' | 'published' }>;
    videos: Array<{ title: string | null; video_url: string; thumbnail_url: string | null; sort_order: number }>;
    internal_links: Array<{ label: string; url: string; sort_order: number }>;
    alternatives: Array<{ alternative_tool_id: string | null; alternative_name: string | null; alternative_url: string | null; alternative_logo: string | null; note: string | null; sort_order: number }>;
  };
}

const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500';
const labelCls = 'block text-sm font-medium text-gray-700 mb-1';

function Field({ label, children, hint }: { label: string; children: React.ReactNode; hint?: string }) {
  return (
    <div>
      <label className={labelCls}>{label}</label>
      {children}
      {hint && <p className="text-xs text-gray-400 mt-1">{hint}</p>}
    </div>
  );
}

function RowActions({ index, count, onUp, onDown, onRemove }: { index: number; count: number; onUp: () => void; onDown: () => void; onRemove: () => void }) {
  return (
    <div className="flex items-center gap-1 shrink-0">
      <button type="button" onClick={onUp} disabled={index === 0} className="p-1.5 text-gray-400 hover:text-gray-700 disabled:opacity-30 disabled:cursor-not-allowed">
        <ArrowUp className="w-3.5 h-3.5" />
      </button>
      <button type="button" onClick={onDown} disabled={index === count - 1} className="p-1.5 text-gray-400 hover:text-gray-700 disabled:opacity-30 disabled:cursor-not-allowed">
        <ArrowDown className="w-3.5 h-3.5" />
      </button>
      <button type="button" onClick={onRemove} className="p-1.5 text-gray-400 hover:text-red-600">
        <Trash2 className="w-3.5 h-3.5" />
      </button>
    </div>
  );
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
  const [savedSnapshot, setSavedSnapshot] = useState<string>(JSON.stringify(EMPTY_FORM));
  const [autoSlug, setAutoSlug] = useState(!isEditMode);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState<'draft' | 'publish' | 'archive' | null>(null);
  const [activeTab, setActiveTab] = useState<Tab>('Overview');
  const [uploadingLogo, setUploadingLogo] = useState(false);
  const [uploadingScreenshotIndex, setUploadingScreenshotIndex] = useState<number | null>(null);
  const [forcePublish, setForcePublish] = useState(false);

  const categories = categoriesData?.data || [];
  const tags = tagsData?.data || [];

  const { mutate: createTool } = useAdminMutation<{ ok: boolean; data: { id: string } }, Record<string, unknown>>('admin-tools', 'POST');
  const { mutate: updateTool } = useAdminMutation<{ ok: boolean }, Record<string, unknown>>(`admin-tools?id=${id}`, 'PUT');

  useEffect(() => {
    document.title = isEditMode ? 'Edit Tool | Admin' : 'New Tool | Admin';
  }, [isEditMode]);

  useEffect(() => {
    if (toolData?.data) {
      const t = toolData.data;
      const primary = t.categories.find((c) => c.primary_category);
      const next: ToolFormData = {
        slug: t.slug, name: t.name, logo: t.logo || '', website: t.website || '', affiliate_link: t.affiliate_link || '',
        short_description: t.short_description || '', long_description: t.long_description || '',
        pricing_model: t.pricing_model || '', starting_price: t.starting_price || '', youtube_url: t.youtube_url || '',
        verified: t.verified, featured: t.featured, is_editors_pick: t.is_editors_pick, rating: t.rating, review_count: t.review_count,
        status: t.status, founded_year: t.founded_year ? String(t.founded_year) : '', company_size: t.company_size || '',
        headquarters: t.headquarters || '', languages: (t.languages || []).join(', '),
        category_ids: t.categories.map((c) => c.id), primary_category_id: primary?.id || '', tag_ids: t.tags.map((tag) => tag.id),
        screenshots: t.screenshots.map((s) => ({ image_url: s.image_url, caption: s.caption || '', alt_text: s.alt_text || '', is_featured: s.is_featured })),
        reviews: t.reviews.map((r) => ({ author_name: r.author_name, author_title: r.author_title || '', rating: r.rating, quote: r.quote, source: r.source || '' })),
        pricing_plans: t.pricing_plans.map((p) => ({ plan_name: p.plan_name || '', price: p.price || '', billing_cycle: p.billing_cycle || '', description: p.description || '', features: (p.features || []).join('\n'), is_recommended: p.is_recommended })),
        integrations: t.integrations.map((i) => ({ integration_name: i.integration_name, integration_slug: i.integration_slug || '', integration_logo: i.integration_logo || '', description: i.description || '' })),
        features: t.features.map((f) => ({ group_name: f.group_name || '', title: f.title, description: f.description || '' })),
        pros: t.pros || [],
        cons: t.cons || [],
        use_cases: t.use_cases.map((u) => ({ title: u.title, description: u.description || '', audience: u.audience || '' })),
        faqs: t.faqs.map((f) => ({ question: f.question, answer: f.answer, status: f.status })),
        videos: t.videos.map((v) => ({ title: v.title || '', video_url: v.video_url, thumbnail_url: v.thumbnail_url || '' })),
        internal_links: t.internal_links.map((l) => ({ label: l.label, url: l.url })),
        alternatives: t.alternatives.map((a) => ({
          alternative_tool_id: a.alternative_tool_id || '', alternative_name: a.alternative_name || '',
          alternative_url: a.alternative_url || '', alternative_logo: a.alternative_logo || '', note: a.note || '',
        })),
        seo_title: t.seo_title || '', seo_meta_description: t.seo_meta_description || '', og_title: t.og_title || '',
        og_description: t.og_description || '', og_image: t.og_image || '', noindex: t.noindex, sitemap_eligible: t.sitemap_eligible,
        canonical_url: t.canonical_url || '', scheduled_publish_at: isoToLocalInput(t.scheduled_publish_at),
      };
      setFormData(next);
      setSavedSnapshot(JSON.stringify(next));
    }
  }, [toolData]);

  useEffect(() => {
    if (autoSlug && formData.name) {
      setFormData((prev) => ({ ...prev, slug: slugify(prev.name) }));
    }
  }, [formData.name, autoSlug]);

  const isDirty = JSON.stringify(formData) !== savedSnapshot;

  const completeness: CompletenessResult = useMemo(() => {
    const input: ToolCompletenessInput = {
      name: formData.name,
      slug: formData.slug,
      website: formData.website,
      short_description: formData.short_description,
      long_description: formData.long_description,
      seo_meta_description: formData.seo_meta_description,
      seo_title: formData.seo_title,
      pricing_model: formData.pricing_model,
      status: formData.status,
      categoryCount: formData.category_ids.length,
      tagCount: formData.tag_ids.length,
      logoPresent: Boolean(formData.logo && formData.logo.trim()),
      sitemapEligible: formData.sitemap_eligible,
      screenshotCount: formData.screenshots.length,
      faqCount: formData.faqs.length,
      prosCount: formData.pros.length,
      consCount: formData.cons.length,
      useCaseCount: formData.use_cases.length,
      pricingPlanCount: formData.pricing_plans.length,
      featureCount: formData.features.length,
      integrationCount: formData.integrations.length,
    };
    return computeCompleteness(input);
  }, [formData]);

  function toggleCategory(categoryId: string) {
    setFormData((prev) => {
      const selected = prev.category_ids.includes(categoryId);
      const category_ids = selected ? prev.category_ids.filter((c) => c !== categoryId) : [...prev.category_ids, categoryId];
      const primary_category_id = selected && prev.primary_category_id === categoryId ? '' : prev.primary_category_id;
      return { ...prev, category_ids, primary_category_id };
    });
  }

  function toggleTag(tagId: string) {
    setFormData((prev) => ({ ...prev, tag_ids: prev.tag_ids.includes(tagId) ? prev.tag_ids.filter((t) => t !== tagId) : [...prev.tag_ids, tagId] }));
  }

  async function handleLogoUpload(file: File) {
    if (!id) {
      alert('Save the tool as a draft first, then upload a logo.');
      return;
    }
    setUploadingLogo(true);
    const result = await uploadToolMedia(file, id, 'logo');
    setUploadingLogo(false);
    if (!result.ok) {
      alert(result.error || 'Logo upload failed');
      return;
    }
    setFormData((p) => ({ ...p, logo: result.url || p.logo }));
  }

  async function handleScreenshotUpload(index: number, file: File) {
    if (!id) {
      alert('Save the tool as a draft first, then upload screenshots.');
      return;
    }
    setUploadingScreenshotIndex(index);
    const result = await uploadToolMedia(file, id, 'screenshot');
    setUploadingScreenshotIndex(null);
    if (!result.ok) {
      alert(result.error || 'Screenshot upload failed');
      return;
    }
    setFormData((p) => ({ ...p, screenshots: p.screenshots.map((s, i) => (i === index ? { ...s, image_url: result.url || s.image_url } : s)) }));
  }

  function buildPayload(status: ToolFormData['status'], force = false) {
    return {
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
      is_editors_pick: formData.is_editors_pick,
      rating: formData.rating,
      review_count: formData.review_count,
      status,
      founded_year: formData.founded_year.trim() ? Number(formData.founded_year) : null,
      company_size: formData.company_size || null,
      headquarters: formData.headquarters || null,
      languages: formData.languages.split(',').map((l) => l.trim()).filter(Boolean),
      category_ids: formData.category_ids,
      primary_category_id: formData.primary_category_id || null,
      tag_ids: formData.tag_ids,
      screenshots: formData.screenshots.filter((s) => s.image_url.trim()).map((s) => ({ image_url: s.image_url, caption: s.caption || null, alt_text: s.alt_text || null, is_featured: s.is_featured })),
      reviews: formData.reviews.filter((r) => r.author_name.trim() && r.quote.trim()),
      pricing_plans: formData.pricing_plans
        .filter((p) => p.plan_name.trim() || p.price.trim())
        .map((p) => ({ plan_name: p.plan_name || null, price: p.price || null, billing_cycle: p.billing_cycle || null, description: p.description || null, features: p.features.split('\n').map((f) => f.trim()).filter(Boolean), is_recommended: p.is_recommended })),
      integrations: formData.integrations.filter((i) => i.integration_name.trim()),
      features: formData.features.filter((f) => f.title.trim()).map((f) => ({ group_name: f.group_name || null, title: f.title, description: f.description || null })),
      pros: formData.pros.filter((p) => p.trim()),
      cons: formData.cons.filter((c) => c.trim()),
      use_cases: formData.use_cases.filter((u) => u.title.trim()).map((u) => ({ title: u.title, description: u.description || null, audience: u.audience || null })),
      faqs: formData.faqs.filter((f) => f.question.trim() && f.answer.trim()),
      videos: formData.videos
        .filter((v) => v.video_url.trim())
        .map((v, i) => ({ title: v.title || null, video_url: v.video_url, thumbnail_url: v.thumbnail_url || null, sort_order: i })),
      internal_links: formData.internal_links
        .filter((l) => l.label.trim() && l.url.trim())
        .map((l, i) => ({ label: l.label, url: l.url, sort_order: i })),
      alternatives: formData.alternatives
        .filter((a) => a.alternative_name.trim() || a.alternative_tool_id.trim())
        .map((a, i) => ({
          alternative_tool_id: a.alternative_tool_id || null,
          alternative_name: a.alternative_name || null,
          alternative_url: a.alternative_url || null,
          alternative_logo: a.alternative_logo || null,
          note: a.note || null,
          sort_order: i,
        })),
      seo_title: formData.seo_title || null,
      seo_meta_description: formData.seo_meta_description || null,
      og_title: formData.og_title || null,
      og_description: formData.og_description || null,
      og_image: formData.og_image || null,
      noindex: formData.noindex,
      sitemap_eligible: formData.sitemap_eligible,
      canonical_url: formData.canonical_url || null,
      scheduled_publish_at: localInputToIso(formData.scheduled_publish_at),
      ...(force ? { force: true } : {}),
    };
  }

  async function handleSave(status: ToolFormData['status'], force = false) {
    setSaveError(null);
    if (!formData.slug || !formData.name) {
      setSaveError('Slug and name are required.');
      setActiveTab('Overview');
      return;
    }

    const kind = status === 'published' ? 'publish' : status === 'archived' ? 'archive' : 'draft';
    setSaving(kind);
    const payload = buildPayload(status, force);

    if (isEditMode) {
      const result = await updateTool(payload);
      setSaving(null);
      if (!result.ok) {
        setSaveError(result.error?.message || 'Failed to save tool');
        if (result.error?.message?.toLowerCase().includes('missing required')) setActiveTab('Publishing');
        return;
      }
      setSavedSnapshot(JSON.stringify(formData));
      setFormData((p) => ({ ...p, status }));
      return;
    }

    const result = await createTool(payload);
    setSaving(null);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to save tool');
      if (result.error?.message?.toLowerCase().includes('missing required')) setActiveTab('Publishing');
      return;
    }
    if (result.data) navigate(`/wp-admin/tools/${result.data.data.id}/edit`);
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
    <WpAdminLayout title={isEditMode ? 'Edit Tool' : 'New Tool'} fullHeight>
      <div className="flex flex-col h-full min-h-0">
        {/* Sticky editor header */}
        <div className="shrink-0 bg-white border-b border-gray-200 px-4 sm:px-6 py-3 flex flex-wrap items-center gap-3">
          <Link to="/wp-admin/tools" className="p-1.5 text-gray-400 hover:text-gray-700 shrink-0">
            <ArrowLeft className="w-4 h-4" />
          </Link>
          <div className="min-w-0 flex-1">
            <p className="font-semibold text-gray-900 text-sm truncate">{formData.name || 'New Tool'}</p>
            <p className="text-xs text-gray-400 truncate">
              {isDirty ? 'Unsaved changes' : 'All changes saved'} &middot; {completeness.percent}% complete
              {!completeness.requiredMet && <span className="text-amber-600"> &middot; missing required fields</span>}
            </p>
          </div>
          <div className="hidden sm:flex items-center gap-2 shrink-0 w-32">
            <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
              <div
                className={`h-full ${completeness.percent >= 80 ? 'bg-emerald-500' : completeness.percent >= 50 ? 'bg-amber-500' : 'bg-rose-400'}`}
                style={{ width: `${completeness.percent}%` }}
              />
            </div>
            <span className="text-xs text-gray-500 tabular-nums">{completeness.percent}%</span>
          </div>
          {isEditMode && (
            <Link
              to={`/wp-admin/tools/${id}/preview`}
              target="_blank"
              className="inline-flex items-center gap-1.5 px-3 py-2 text-sm text-gray-600 hover:bg-gray-100 rounded-lg transition shrink-0"
            >
              <Eye className="w-4 h-4" />
              <span className="hidden md:inline">Preview</span>
            </Link>
          )}
          {formData.status === 'published' && (
            <Link
              to={`/tools/${formData.slug}`}
              target="_blank"
              className="inline-flex items-center gap-1.5 px-3 py-2 text-sm text-gray-600 hover:bg-gray-100 rounded-lg transition shrink-0"
            >
              <ExternalLink className="w-4 h-4" />
              <span className="hidden md:inline">Live</span>
            </Link>
          )}
          <button
            onClick={() => handleSave(formData.status === 'published' || formData.status === 'archived' ? 'draft' : formData.status)}
            disabled={saving !== null}
            className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 disabled:opacity-50 transition text-sm shrink-0"
          >
            {saving === 'draft' ? (
              <Loader2 className="w-4 h-4 animate-spin" />
            ) : formData.status === 'published' || formData.status === 'archived' ? (
              'Save as Draft'
            ) : (
              `Save (${toolStatusLabel(formData.status)})`
            )}
          </button>
          {formData.status === 'published' && (
            <button
              onClick={() => handleSave('archived')}
              disabled={saving !== null}
              className="inline-flex items-center gap-2 bg-slate-100 text-slate-700 px-4 py-2 rounded-lg font-medium hover:bg-slate-200 disabled:opacity-50 transition text-sm shrink-0"
            >
              {saving === 'archive' ? <Loader2 className="w-4 h-4 animate-spin" /> : 'Archive'}
            </button>
          )}
          {formData.status === 'draft' && (
            <label className="hidden sm:flex items-center gap-1.5 text-xs text-gray-500 shrink-0" title="Publishing directly from Draft requires confirmation.">
              <input type="checkbox" checked={forcePublish} onChange={(e) => setForcePublish(e.target.checked)} />
              Force publish from Draft
            </label>
          )}
          <button
            onClick={() => handleSave('published', formData.status === 'draft' ? forcePublish : false)}
            disabled={saving !== null || (formData.status === 'draft' && !forcePublish)}
            title={!completeness.requiredMet ? `Missing: ${completeness.missingRequired.join(', ')}` : formData.status === 'draft' && !forcePublish ? 'Check "Force publish from Draft" to publish directly from Draft.' : undefined}
            className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-400 transition text-sm shrink-0"
          >
            <Save className="w-4 h-4" />
            {saving === 'publish' ? 'Publishing...' : 'Publish'}
          </button>
        </div>

        {saveError && (
          <div className="shrink-0 mx-4 sm:mx-6 mt-3 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700 flex items-start gap-2">
            <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
            {saveError}
          </div>
        )}

        <div className="flex-1 min-h-0 flex overflow-hidden">
          {/* Section tabs */}
          <nav className="hidden md:flex flex-col w-48 shrink-0 border-r border-gray-200 bg-white overflow-y-auto py-3 px-2">
            {TABS.map((tab) => (
              <button
                key={tab}
                onClick={() => setActiveTab(tab)}
                className={`text-left px-3 py-2 rounded-lg text-sm font-medium transition mb-0.5 ${
                  activeTab === tab ? 'bg-blue-50 text-blue-700' : 'text-gray-600 hover:bg-gray-50'
                }`}
              >
                {tab}
              </button>
            ))}
          </nav>

          {/* Mobile tab select */}
          <div className="md:hidden shrink-0 border-b border-gray-200 bg-white px-4 py-2">
            <select value={activeTab} onChange={(e) => setActiveTab(e.target.value as Tab)} className={inputCls}>
              {TABS.map((tab) => <option key={tab} value={tab}>{tab}</option>)}
            </select>
          </div>

          <div className="flex-1 min-w-0 overflow-y-auto px-4 sm:px-6 py-6">
            <div className="max-w-3xl mx-auto bg-white border border-gray-200 rounded-lg p-6 space-y-5">

              {activeTab === 'Overview' && (
                <>
                  <Field label="Name">
                    <input type="text" value={formData.name} onChange={(e) => setFormData((p) => ({ ...p, name: e.target.value }))} className={inputCls} placeholder="e.g. Notion AI" />
                  </Field>
                  <Field label="Slug" hint={`/tools/${formData.slug || '...'}`}>
                    <div className="flex items-center justify-between mb-1">
                      <label className="flex items-center gap-1.5 text-xs text-gray-500">
                        <input type="checkbox" checked={autoSlug} onChange={(e) => setAutoSlug(e.target.checked)} />
                        Auto-generate
                      </label>
                    </div>
                    <input
                      type="text"
                      value={formData.slug}
                      onChange={(e) => { setAutoSlug(false); setFormData((p) => ({ ...p, slug: slugify(e.target.value) })); }}
                      className={`${inputCls} font-mono`}
                    />
                  </Field>

                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Logo">
                      <div className="flex items-center gap-2">
                        {formData.logo && <img src={formData.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-gray-200" />}
                        <input type="text" value={formData.logo} onChange={(e) => setFormData((p) => ({ ...p, logo: e.target.value }))} className={inputCls} placeholder="Logo URL" />
                        <label className={`inline-flex items-center justify-center p-2 rounded-lg border border-gray-300 cursor-pointer shrink-0 ${!isEditMode ? 'opacity-40 cursor-not-allowed' : 'hover:bg-gray-50'}`}>
                          {uploadingLogo ? <Loader2 className="w-4 h-4 animate-spin" /> : <Upload className="w-4 h-4 text-gray-500" />}
                          <input type="file" accept="image/*" disabled={!isEditMode || uploadingLogo} className="hidden" onChange={(e) => { const f = e.target.files?.[0]; if (f) handleLogoUpload(f); e.target.value = ''; }} />
                        </label>
                      </div>
                      {!isEditMode && <p className="text-xs text-amber-600 mt-1">Save as draft first to enable upload.</p>}
                    </Field>
                    <Field label="Website">
                      <input type="text" value={formData.website} onChange={(e) => setFormData((p) => ({ ...p, website: e.target.value }))} className={inputCls} placeholder="https://..." />
                    </Field>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Affiliate Link">
                      <input type="text" value={formData.affiliate_link} onChange={(e) => setFormData((p) => ({ ...p, affiliate_link: e.target.value }))} className={inputCls} />
                    </Field>
                    <Field label="YouTube URL">
                      <input type="text" value={formData.youtube_url} onChange={(e) => setFormData((p) => ({ ...p, youtube_url: e.target.value }))} className={inputCls} />
                    </Field>
                  </div>

                  <Field label="Short Description" hint="One-line summary shown in listings">
                    <textarea value={formData.short_description} onChange={(e) => setFormData((p) => ({ ...p, short_description: e.target.value }))} rows={2} className={inputCls} />
                  </Field>
                  <Field label="Long Description">
                    <textarea value={formData.long_description} onChange={(e) => setFormData((p) => ({ ...p, long_description: e.target.value }))} rows={6} className={inputCls} />
                  </Field>
                </>
              )}

              {activeTab === 'Classification' && (
                <>
                  <div>
                    <label className={labelCls}>Categories</label>
                    {categories.length === 0 && (
                      <p className="text-xs text-gray-400">No categories yet. <Link to="/wp-admin/tools/categories/new" className="text-blue-600">Create one</Link>.</p>
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
                                <input type="radio" name="primary_category" checked={formData.primary_category_id === category.id} onChange={() => setFormData((p) => ({ ...p, primary_category_id: category.id }))} />
                                Primary
                              </label>
                            )}
                          </div>
                        );
                      })}
                    </div>
                  </div>

                  <div className="border-t border-gray-100 pt-4">
                    <label className={labelCls}>Tags</label>
                    {tags.length === 0 && (
                      <p className="text-xs text-gray-400">No tags yet. <Link to="/wp-admin/tools/tags/new" className="text-blue-600">Create one</Link>.</p>
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

                  <div className="border-t border-gray-100 pt-4 grid grid-cols-3 gap-3">
                    <label className="flex items-center gap-2 text-sm text-gray-700">
                      <input type="checkbox" checked={formData.verified} onChange={(e) => setFormData((p) => ({ ...p, verified: e.target.checked }))} />
                      Verified
                    </label>
                    <label className="flex items-center gap-2 text-sm text-gray-700">
                      <input type="checkbox" checked={formData.featured} onChange={(e) => setFormData((p) => ({ ...p, featured: e.target.checked }))} />
                      Featured
                    </label>
                    <label className="flex items-center gap-2 text-sm text-gray-700">
                      <input type="checkbox" checked={formData.is_editors_pick} onChange={(e) => setFormData((p) => ({ ...p, is_editors_pick: e.target.checked }))} />
                      Editor's Pick
                    </label>
                  </div>
                </>
              )}

              {activeTab === 'Company' && (
                <>
                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Founded Year">
                      <input type="number" value={formData.founded_year} onChange={(e) => setFormData((p) => ({ ...p, founded_year: e.target.value }))} className={inputCls} placeholder="e.g. 2013" />
                    </Field>
                    <Field label="Company Size">
                      <input type="text" value={formData.company_size} onChange={(e) => setFormData((p) => ({ ...p, company_size: e.target.value }))} className={inputCls} placeholder="e.g. 11-50 employees" />
                    </Field>
                  </div>
                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Headquarters">
                      <input type="text" value={formData.headquarters} onChange={(e) => setFormData((p) => ({ ...p, headquarters: e.target.value }))} className={inputCls} placeholder="e.g. Sydney, Australia" />
                    </Field>
                    <Field label="Languages" hint="Comma-separated">
                      <input type="text" value={formData.languages} onChange={(e) => setFormData((p) => ({ ...p, languages: e.target.value }))} className={inputCls} placeholder="English, Spanish" />
                    </Field>
                  </div>
                </>
              )}

              {activeTab === 'Pricing' && (
                <>
                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Pricing Model">
                      <input type="text" value={formData.pricing_model} onChange={(e) => setFormData((p) => ({ ...p, pricing_model: e.target.value }))} className={inputCls} placeholder="e.g. Freemium" />
                    </Field>
                    <Field label="Starting Price">
                      <input type="text" value={formData.starting_price} onChange={(e) => setFormData((p) => ({ ...p, starting_price: e.target.value }))} className={inputCls} placeholder="e.g. $10/mo" />
                    </Field>
                  </div>

                  <div className="border-t border-gray-100 pt-4">
                    <div className="flex items-center justify-between mb-2">
                      <label className={labelCls}>Pricing Plans</label>
                      <button
                        onClick={() => setFormData((p) => ({ ...p, pricing_plans: [...p.pricing_plans, { plan_name: '', price: '', billing_cycle: '', description: '', features: '', is_recommended: false }] }))}
                        className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700"
                      >
                        <Plus className="w-3.5 h-3.5" /> Add plan
                      </button>
                    </div>
                    <div className="space-y-3">
                      {formData.pricing_plans.map((plan, index) => (
                        <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                          <div className="flex items-start gap-2">
                            <div className="grid grid-cols-3 gap-2 flex-1">
                              <input type="text" value={plan.plan_name} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, plan_name: e.target.value } : x) }))} placeholder="Plan name" className={inputCls} />
                              <input type="text" value={plan.price} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, price: e.target.value } : x) }))} placeholder="Price" className={inputCls} />
                              <input type="text" value={plan.billing_cycle} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, billing_cycle: e.target.value } : x) }))} placeholder="Billing cycle" className={inputCls} />
                            </div>
                            <RowActions
                              index={index} count={formData.pricing_plans.length}
                              onUp={() => setFormData((p) => ({ ...p, pricing_plans: move(p.pricing_plans, index, -1) }))}
                              onDown={() => setFormData((p) => ({ ...p, pricing_plans: move(p.pricing_plans, index, 1) }))}
                              onRemove={() => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.filter((_, i) => i !== index) }))}
                            />
                          </div>
                          <input type="text" value={plan.description} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, description: e.target.value } : x) }))} placeholder="Description" className={inputCls} />
                          <textarea value={plan.features} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, features: e.target.value } : x) }))} placeholder="Features (one per line)" rows={3} className={inputCls} />
                          <label className="flex items-center gap-2 text-sm text-gray-700">
                            <input type="checkbox" checked={plan.is_recommended} onChange={(e) => setFormData((p) => ({ ...p, pricing_plans: p.pricing_plans.map((x, i) => i === index ? { ...x, is_recommended: e.target.checked } : x) }))} />
                            Recommended plan
                          </label>
                        </div>
                      ))}
                    </div>
                  </div>
                </>
              )}

              {activeTab === 'Features' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Features</label>
                    <button
                      onClick={() => setFormData((p) => ({ ...p, features: [...p.features, { group_name: '', title: '', description: '' }] }))}
                      className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700"
                    >
                      <Plus className="w-3.5 h-3.5" /> Add feature
                    </button>
                  </div>
                  <div className="space-y-2">
                    {formData.features.map((feature, index) => (
                      <div key={index} className="flex items-start gap-2">
                        <div className="grid grid-cols-3 gap-2 flex-1">
                          <input type="text" value={feature.group_name} onChange={(e) => setFormData((p) => ({ ...p, features: p.features.map((x, i) => i === index ? { ...x, group_name: e.target.value } : x) }))} placeholder="Group (optional)" className={inputCls} />
                          <input type="text" value={feature.title} onChange={(e) => setFormData((p) => ({ ...p, features: p.features.map((x, i) => i === index ? { ...x, title: e.target.value } : x) }))} placeholder="Feature title" className={inputCls} />
                          <input type="text" value={feature.description} onChange={(e) => setFormData((p) => ({ ...p, features: p.features.map((x, i) => i === index ? { ...x, description: e.target.value } : x) }))} placeholder="Description" className={inputCls} />
                        </div>
                        <RowActions
                          index={index} count={formData.features.length}
                          onUp={() => setFormData((p) => ({ ...p, features: move(p.features, index, -1) }))}
                          onDown={() => setFormData((p) => ({ ...p, features: move(p.features, index, 1) }))}
                          onRemove={() => setFormData((p) => ({ ...p, features: p.features.filter((_, i) => i !== index) }))}
                        />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Pros & Cons' && (
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                  <div>
                    <div className="flex items-center justify-between mb-2">
                      <label className={labelCls}>Pros</label>
                      <button onClick={() => setFormData((p) => ({ ...p, pros: [...p.pros, ''] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                        <Plus className="w-3.5 h-3.5" /> Add
                      </button>
                    </div>
                    <div className="space-y-1.5">
                      {formData.pros.map((pro, index) => (
                        <div key={index} className="flex items-center gap-2">
                          <input type="text" value={pro} onChange={(e) => setFormData((p) => ({ ...p, pros: p.pros.map((x, i) => i === index ? e.target.value : x) }))} className={inputCls} />
                          <RowActions
                            index={index} count={formData.pros.length}
                            onUp={() => setFormData((p) => ({ ...p, pros: move(p.pros, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, pros: move(p.pros, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, pros: p.pros.filter((_, i) => i !== index) }))}
                          />
                        </div>
                      ))}
                    </div>
                  </div>
                  <div>
                    <div className="flex items-center justify-between mb-2">
                      <label className={labelCls}>Cons</label>
                      <button onClick={() => setFormData((p) => ({ ...p, cons: [...p.cons, ''] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                        <Plus className="w-3.5 h-3.5" /> Add
                      </button>
                    </div>
                    <div className="space-y-1.5">
                      {formData.cons.map((con, index) => (
                        <div key={index} className="flex items-center gap-2">
                          <input type="text" value={con} onChange={(e) => setFormData((p) => ({ ...p, cons: p.cons.map((x, i) => i === index ? e.target.value : x) }))} className={inputCls} />
                          <RowActions
                            index={index} count={formData.cons.length}
                            onUp={() => setFormData((p) => ({ ...p, cons: move(p.cons, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, cons: move(p.cons, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, cons: p.cons.filter((_, i) => i !== index) }))}
                          />
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'Use Cases' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Use Cases</label>
                    <button onClick={() => setFormData((p) => ({ ...p, use_cases: [...p.use_cases, { title: '', description: '', audience: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add use case
                    </button>
                  </div>
                  <div className="space-y-2">
                    {formData.use_cases.map((useCase, index) => (
                      <div key={index} className="flex items-start gap-2">
                        <div className="grid grid-cols-3 gap-2 flex-1">
                          <input type="text" value={useCase.title} onChange={(e) => setFormData((p) => ({ ...p, use_cases: p.use_cases.map((x, i) => i === index ? { ...x, title: e.target.value } : x) }))} placeholder="Title" className={inputCls} />
                          <input type="text" value={useCase.description} onChange={(e) => setFormData((p) => ({ ...p, use_cases: p.use_cases.map((x, i) => i === index ? { ...x, description: e.target.value } : x) }))} placeholder="Description" className={inputCls} />
                          <input type="text" value={useCase.audience} onChange={(e) => setFormData((p) => ({ ...p, use_cases: p.use_cases.map((x, i) => i === index ? { ...x, audience: e.target.value } : x) }))} placeholder="Audience" className={inputCls} />
                        </div>
                        <RowActions
                          index={index} count={formData.use_cases.length}
                          onUp={() => setFormData((p) => ({ ...p, use_cases: move(p.use_cases, index, -1) }))}
                          onDown={() => setFormData((p) => ({ ...p, use_cases: move(p.use_cases, index, 1) }))}
                          onRemove={() => setFormData((p) => ({ ...p, use_cases: p.use_cases.filter((_, i) => i !== index) }))}
                        />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Screenshots' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Screenshots</label>
                    <button onClick={() => setFormData((p) => ({ ...p, screenshots: [...p.screenshots, { image_url: '', caption: '', alt_text: '', is_featured: false }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add screenshot
                    </button>
                  </div>
                  {!isEditMode && <p className="text-xs text-amber-600 mb-2">Save as draft first to enable upload.</p>}
                  <div className="space-y-3">
                    {formData.screenshots.map((shot, index) => (
                      <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                        <div className="flex items-start gap-2">
                          {shot.image_url && <img src={shot.image_url} alt="" className="w-16 h-10 object-cover rounded border border-gray-200 shrink-0" />}
                          <input type="text" value={shot.image_url} onChange={(e) => setFormData((p) => ({ ...p, screenshots: p.screenshots.map((x, i) => i === index ? { ...x, image_url: e.target.value } : x) }))} placeholder="Image URL" className={`${inputCls} flex-1`} />
                          <label className={`inline-flex items-center justify-center p-2 rounded-lg border border-gray-300 cursor-pointer shrink-0 ${!isEditMode ? 'opacity-40 cursor-not-allowed' : 'hover:bg-gray-50'}`}>
                            {uploadingScreenshotIndex === index ? <Loader2 className="w-4 h-4 animate-spin" /> : <Upload className="w-4 h-4 text-gray-500" />}
                            <input type="file" accept="image/*" disabled={!isEditMode || uploadingScreenshotIndex !== null} className="hidden" onChange={(e) => { const f = e.target.files?.[0]; if (f) handleScreenshotUpload(index, f); e.target.value = ''; }} />
                          </label>
                          <RowActions
                            index={index} count={formData.screenshots.length}
                            onUp={() => setFormData((p) => ({ ...p, screenshots: move(p.screenshots, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, screenshots: move(p.screenshots, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, screenshots: p.screenshots.filter((_, i) => i !== index) }))}
                          />
                        </div>
                        <div className="grid grid-cols-2 gap-2">
                          <input type="text" value={shot.caption} onChange={(e) => setFormData((p) => ({ ...p, screenshots: p.screenshots.map((x, i) => i === index ? { ...x, caption: e.target.value } : x) }))} placeholder="Caption (optional)" className={inputCls} />
                          <input type="text" value={shot.alt_text} onChange={(e) => setFormData((p) => ({ ...p, screenshots: p.screenshots.map((x, i) => i === index ? { ...x, alt_text: e.target.value } : x) }))} placeholder="Alt text (accessibility)" className={inputCls} />
                        </div>
                        <label className="flex items-center gap-2 text-sm text-gray-700">
                          <input type="checkbox" checked={shot.is_featured} onChange={(e) => setFormData((p) => ({ ...p, screenshots: p.screenshots.map((x, i) => i === index ? { ...x, is_featured: e.target.checked } : x) }))} />
                          Featured screenshot
                        </label>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Integrations' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Integrations</label>
                    <button onClick={() => setFormData((p) => ({ ...p, integrations: [...p.integrations, { integration_name: '', integration_slug: '', integration_logo: '', description: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add integration
                    </button>
                  </div>
                  <div className="space-y-2">
                    {formData.integrations.map((integration, index) => (
                      <div key={index} className="flex items-start gap-2">
                        <div className="grid grid-cols-2 gap-2 flex-1">
                          <input type="text" value={integration.integration_name} onChange={(e) => setFormData((p) => ({ ...p, integrations: p.integrations.map((x, i) => i === index ? { ...x, integration_name: e.target.value } : x) }))} placeholder="Integration name" className={inputCls} />
                          <input type="text" value={integration.description} onChange={(e) => setFormData((p) => ({ ...p, integrations: p.integrations.map((x, i) => i === index ? { ...x, description: e.target.value } : x) }))} placeholder="Description" className={inputCls} />
                        </div>
                        <button onClick={() => setFormData((p) => ({ ...p, integrations: p.integrations.filter((_, i) => i !== index) }))} className="p-2 text-gray-400 hover:text-red-600 shrink-0">
                          <Trash2 className="w-4 h-4" />
                        </button>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Videos' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Videos</label>
                    <button onClick={() => setFormData((p) => ({ ...p, videos: [...p.videos, { title: '', video_url: '', thumbnail_url: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add video
                    </button>
                  </div>
                  {formData.videos.length === 0 && (
                    <p className="text-xs text-gray-400 flex items-center gap-1.5"><Video className="w-3.5 h-3.5" /> No videos yet.</p>
                  )}
                  <div className="space-y-3">
                    {formData.videos.map((video, index) => (
                      <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                        <div className="flex items-start gap-2">
                          <div className="grid grid-cols-2 gap-2 flex-1">
                            <input type="text" value={video.title} onChange={(e) => setFormData((p) => ({ ...p, videos: p.videos.map((x, i) => i === index ? { ...x, title: e.target.value } : x) }))} placeholder="Title (optional)" className={inputCls} />
                            <input type="text" value={video.video_url} onChange={(e) => setFormData((p) => ({ ...p, videos: p.videos.map((x, i) => i === index ? { ...x, video_url: e.target.value } : x) }))} placeholder="Video URL (required)" className={inputCls} />
                          </div>
                          <RowActions
                            index={index} count={formData.videos.length}
                            onUp={() => setFormData((p) => ({ ...p, videos: move(p.videos, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, videos: move(p.videos, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, videos: p.videos.filter((_, i) => i !== index) }))}
                          />
                        </div>
                        <input type="text" value={video.thumbnail_url} onChange={(e) => setFormData((p) => ({ ...p, videos: p.videos.map((x, i) => i === index ? { ...x, thumbnail_url: e.target.value } : x) }))} placeholder="Thumbnail URL (optional)" className={inputCls} />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Alternatives' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Alternatives</label>
                    <button onClick={() => setFormData((p) => ({ ...p, alternatives: [...p.alternatives, { alternative_tool_id: '', alternative_name: '', alternative_url: '', alternative_logo: '', note: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add alternative
                    </button>
                  </div>
                  {formData.alternatives.length === 0 && (
                    <p className="text-xs text-gray-400 flex items-center gap-1.5"><Repeat className="w-3.5 h-3.5" /> No alternatives yet.</p>
                  )}
                  <p className="text-xs text-gray-400 mb-2">Provide either an alternative tool ID (advanced, for linking to an existing tool record) or a free-text name/URL.</p>
                  <div className="space-y-3">
                    {formData.alternatives.map((alt, index) => (
                      <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                        <div className="flex items-start gap-2">
                          <div className="grid grid-cols-2 gap-2 flex-1">
                            <input type="text" value={alt.alternative_name} onChange={(e) => setFormData((p) => ({ ...p, alternatives: p.alternatives.map((x, i) => i === index ? { ...x, alternative_name: e.target.value } : x) }))} placeholder="Alternative name" className={inputCls} />
                            <input type="text" value={alt.alternative_url} onChange={(e) => setFormData((p) => ({ ...p, alternatives: p.alternatives.map((x, i) => i === index ? { ...x, alternative_url: e.target.value } : x) }))} placeholder="URL (optional)" className={inputCls} />
                          </div>
                          <RowActions
                            index={index} count={formData.alternatives.length}
                            onUp={() => setFormData((p) => ({ ...p, alternatives: move(p.alternatives, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, alternatives: move(p.alternatives, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, alternatives: p.alternatives.filter((_, i) => i !== index) }))}
                          />
                        </div>
                        <div className="grid grid-cols-2 gap-2">
                          <input type="text" value={alt.alternative_logo} onChange={(e) => setFormData((p) => ({ ...p, alternatives: p.alternatives.map((x, i) => i === index ? { ...x, alternative_logo: e.target.value } : x) }))} placeholder="Logo URL (optional)" className={inputCls} />
                          <input type="text" value={alt.alternative_tool_id} onChange={(e) => setFormData((p) => ({ ...p, alternatives: p.alternatives.map((x, i) => i === index ? { ...x, alternative_tool_id: e.target.value } : x) }))} placeholder="Alternative tool ID (advanced, optional)" className={`${inputCls} font-mono`} />
                        </div>
                        <input type="text" value={alt.note} onChange={(e) => setFormData((p) => ({ ...p, alternatives: p.alternatives.map((x, i) => i === index ? { ...x, note: e.target.value } : x) }))} placeholder="Note (optional)" className={inputCls} />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Internal Links' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Internal Links</label>
                    <button onClick={() => setFormData((p) => ({ ...p, internal_links: [...p.internal_links, { label: '', url: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add link
                    </button>
                  </div>
                  {formData.internal_links.length === 0 && (
                    <p className="text-xs text-gray-400 flex items-center gap-1.5"><Link2 className="w-3.5 h-3.5" /> No internal links yet.</p>
                  )}
                  <div className="space-y-2">
                    {formData.internal_links.map((link, index) => (
                      <div key={index} className="flex items-start gap-2">
                        <div className="grid grid-cols-2 gap-2 flex-1">
                          <input type="text" value={link.label} onChange={(e) => setFormData((p) => ({ ...p, internal_links: p.internal_links.map((x, i) => i === index ? { ...x, label: e.target.value } : x) }))} placeholder="Label" className={inputCls} />
                          <input type="text" value={link.url} onChange={(e) => setFormData((p) => ({ ...p, internal_links: p.internal_links.map((x, i) => i === index ? { ...x, url: e.target.value } : x) }))} placeholder="URL" className={inputCls} />
                        </div>
                        <RowActions
                          index={index} count={formData.internal_links.length}
                          onUp={() => setFormData((p) => ({ ...p, internal_links: move(p.internal_links, index, -1) }))}
                          onDown={() => setFormData((p) => ({ ...p, internal_links: move(p.internal_links, index, 1) }))}
                          onRemove={() => setFormData((p) => ({ ...p, internal_links: p.internal_links.filter((_, i) => i !== index) }))}
                        />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'FAQ' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>FAQ</label>
                    <button onClick={() => setFormData((p) => ({ ...p, faqs: [...p.faqs, { question: '', answer: '', status: 'published' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add FAQ
                    </button>
                  </div>
                  <div className="space-y-3">
                    {formData.faqs.map((faq, index) => (
                      <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                        <div className="flex items-start gap-2">
                          <input type="text" value={faq.question} onChange={(e) => setFormData((p) => ({ ...p, faqs: p.faqs.map((x, i) => i === index ? { ...x, question: e.target.value } : x) }))} placeholder="Question" className={`${inputCls} flex-1`} />
                          <RowActions
                            index={index} count={formData.faqs.length}
                            onUp={() => setFormData((p) => ({ ...p, faqs: move(p.faqs, index, -1) }))}
                            onDown={() => setFormData((p) => ({ ...p, faqs: move(p.faqs, index, 1) }))}
                            onRemove={() => setFormData((p) => ({ ...p, faqs: p.faqs.filter((_, i) => i !== index) }))}
                          />
                        </div>
                        <textarea value={faq.answer} onChange={(e) => setFormData((p) => ({ ...p, faqs: p.faqs.map((x, i) => i === index ? { ...x, answer: e.target.value } : x) }))} placeholder="Answer" rows={2} className={inputCls} />
                        <label className="flex items-center gap-2 text-xs text-gray-600">
                          <input type="checkbox" checked={faq.status === 'published'} onChange={(e) => setFormData((p) => ({ ...p, faqs: p.faqs.map((x, i) => i === index ? { ...x, status: e.target.checked ? 'published' : 'draft' } : x) }))} />
                          Published (visible on the public page)
                        </label>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'Reviews' && (
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <label className={labelCls}>Reviews</label>
                    <button onClick={() => setFormData((p) => ({ ...p, reviews: [...p.reviews, { author_name: '', author_title: '', rating: 5, quote: '', source: '' }] }))} className="inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
                      <Plus className="w-3.5 h-3.5" /> Add review
                    </button>
                  </div>
                  <div className="space-y-3">
                    {formData.reviews.map((review, index) => (
                      <div key={index} className="border border-gray-200 rounded-lg p-3 space-y-2">
                        <div className="grid grid-cols-3 gap-2">
                          <input type="text" value={review.author_name} onChange={(e) => setFormData((p) => ({ ...p, reviews: p.reviews.map((x, i) => i === index ? { ...x, author_name: e.target.value } : x) }))} placeholder="Author name" className={inputCls} />
                          <input type="text" value={review.author_title} onChange={(e) => setFormData((p) => ({ ...p, reviews: p.reviews.map((x, i) => i === index ? { ...x, author_title: e.target.value } : x) }))} placeholder="Author title (optional)" className={inputCls} />
                          <input type="number" step="1" min="1" max="5" value={review.rating} onChange={(e) => setFormData((p) => ({ ...p, reviews: p.reviews.map((x, i) => i === index ? { ...x, rating: Number(e.target.value) } : x) }))} placeholder="Rating (1-5)" className={inputCls} />
                        </div>
                        <textarea value={review.quote} onChange={(e) => setFormData((p) => ({ ...p, reviews: p.reviews.map((x, i) => i === index ? { ...x, quote: e.target.value } : x) }))} rows={2} placeholder="Review quote" className={inputCls} />
                        <div className="flex gap-2">
                          <input type="text" value={review.source} onChange={(e) => setFormData((p) => ({ ...p, reviews: p.reviews.map((x, i) => i === index ? { ...x, source: e.target.value } : x) }))} placeholder="Source (optional)" className={`${inputCls} flex-1`} />
                          <button onClick={() => setFormData((p) => ({ ...p, reviews: p.reviews.filter((_, i) => i !== index) }))} className="p-2 text-gray-400 hover:text-red-600">
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'SEO' && (
                <>
                  <Field label="SEO Title" hint="Falls back to the default title pattern when empty">
                    <input type="text" value={formData.seo_title} onChange={(e) => setFormData((p) => ({ ...p, seo_title: e.target.value }))} className={inputCls} placeholder={`${formData.name || 'Tool'} Review, Pricing, Features & Alternatives | Gappsy`} />
                  </Field>
                  <Field label="SEO Meta Description" hint="Falls back to Short Description when empty">
                    <textarea value={formData.seo_meta_description} onChange={(e) => setFormData((p) => ({ ...p, seo_meta_description: e.target.value }))} rows={2} className={inputCls} placeholder={formData.short_description || 'Meta description...'} />
                  </Field>
                  <Field label="Canonical URL" hint="Defaults to the auto-generated canonical from the slug when empty">
                    <input type="text" value={formData.canonical_url} onChange={(e) => setFormData((p) => ({ ...p, canonical_url: e.target.value }))} className={inputCls} placeholder={`https://www.gappsy.com/tools/${formData.slug || '...'}`} />
                  </Field>

                  <div className="border border-gray-200 rounded-lg p-3 bg-gray-50">
                    <p className="text-xs text-gray-400 mb-1">Search preview</p>
                    <p className="text-blue-700 text-base truncate">{formData.seo_title || `${formData.name || 'Tool'} Review, Pricing, Features & Alternatives | Gappsy`}</p>
                    <p className="text-emerald-700 text-xs">gappsy.com/tools/{formData.slug || '...'}</p>
                    <p className="text-gray-600 text-sm line-clamp-2">{formData.seo_meta_description || formData.short_description || 'No description set.'}</p>
                  </div>

                  <div className="grid grid-cols-2 gap-4 border-t border-gray-100 pt-4">
                    <Field label="OG Title"><input type="text" value={formData.og_title} onChange={(e) => setFormData((p) => ({ ...p, og_title: e.target.value }))} className={inputCls} /></Field>
                    <Field label="OG Image URL"><input type="text" value={formData.og_image} onChange={(e) => setFormData((p) => ({ ...p, og_image: e.target.value }))} className={inputCls} /></Field>
                  </div>
                  <Field label="OG Description">
                    <textarea value={formData.og_description} onChange={(e) => setFormData((p) => ({ ...p, og_description: e.target.value }))} rows={2} className={inputCls} />
                  </Field>

                  <div className="border-t border-gray-100 pt-4 grid grid-cols-2 gap-4">
                    <label className="flex items-center gap-2 text-sm text-gray-700">
                      <input type="checkbox" checked={formData.noindex} onChange={(e) => setFormData((p) => ({ ...p, noindex: e.target.checked }))} />
                      Noindex (hide from search engines)
                    </label>
                    <label className="flex items-center gap-2 text-sm text-gray-700">
                      <input type="checkbox" checked={formData.sitemap_eligible} onChange={(e) => setFormData((p) => ({ ...p, sitemap_eligible: e.target.checked }))} />
                      Eligible for sitemap
                    </label>
                  </div>
                </>
              )}

              {activeTab === 'Publishing' && (() => {
                const requiredItems = completeness.items.filter((item) => item.required);
                const recommendedItems = completeness.items.filter((item) => !item.required);
                const requiredMetCount = requiredItems.filter((item) => item.met).length;
                const recommendedMetCount = recommendedItems.filter((item) => item.met).length;
                const firstPublishMissing = toolData?.data.first_publish_missing || [];
                const showFirstPublishBanner = isEditMode && formData.status !== 'published' && firstPublishMissing.length > 0;
                const jsonLd = buildToolJsonLd({
                  slug: formData.slug,
                  name: formData.name,
                  shortDescription: formData.short_description || null,
                  longDescription: formData.long_description || null,
                  logo: formData.logo || null,
                  websiteUrl: formData.website || null,
                  primaryCategoryName: categories.find((c) => c.id === formData.primary_category_id)?.name,
                  rating: formData.rating,
                  reviewCount: formData.review_count,
                  pricingPlans: formData.pricing_plans.map((p) => ({ plan_name: p.plan_name || null, price: p.price || null })),
                  reviews: formData.reviews.map((r) => ({ author_name: r.author_name, rating: r.rating, quote: r.quote, created_at: null })),
                  faqs: formData.faqs.filter((f) => f.status === 'published').map((f) => ({ question: f.question, answer: f.answer })),
                });

                return (
                  <>
                    {showFirstPublishBanner && (
                      <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 text-sm text-amber-800 flex items-start gap-2">
                        <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
                        <span>Before this can be published for the first time: {firstPublishMissing.join(', ')}.</span>
                      </div>
                    )}

                    <div className="grid grid-cols-3 gap-4">
                      <Field label="Status">
                        <select value={formData.status} onChange={(e) => setFormData((p) => ({ ...p, status: e.target.value as ToolFormData['status'] }))} className={inputCls}>
                          {TOOL_STATUSES.map((s) => <option key={s.value} value={s.value}>{s.label}</option>)}
                        </select>
                      </Field>
                      <Field label="Rating">
                        <input type="number" step="0.1" min="0" max="5" value={formData.rating} onChange={(e) => setFormData((p) => ({ ...p, rating: Number(e.target.value) }))} className={inputCls} />
                      </Field>
                      <Field label="Review Count">
                        <input type="number" min="0" value={formData.review_count} onChange={(e) => setFormData((p) => ({ ...p, review_count: Number(e.target.value) }))} className={inputCls} />
                      </Field>
                    </div>

                    <Field label="Scheduled Publish At" hint="Optional. Leave empty for no schedule.">
                      <input type="datetime-local" value={formData.scheduled_publish_at} onChange={(e) => setFormData((p) => ({ ...p, scheduled_publish_at: e.target.value }))} className={inputCls} />
                    </Field>

                    {formData.status === 'draft' && (
                      <label className="flex items-center gap-2 text-sm text-gray-700 border border-gray-200 rounded-lg p-3 bg-gray-50">
                        <input type="checkbox" checked={forcePublish} onChange={(e) => setForcePublish(e.target.checked)} />
                        Force publish directly from Draft (bypasses the "Ready to Publish" step)
                      </label>
                    )}

                    <div className="border-t border-gray-100 pt-4">
                      <div className="flex items-center justify-between mb-1">
                        <p className={labelCls}>Publish readiness</p>
                      </div>
                      <p className="text-xs text-gray-400 mb-3">
                        {requiredMetCount} of {requiredItems.length} required complete, {recommendedMetCount} of {recommendedItems.length} recommended
                      </p>

                      <div className="mb-4">
                        <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">Required</p>
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-1.5">
                          {requiredItems.map((item) => (
                            <div key={item.key} className="flex items-center gap-2 text-sm">
                              {item.met ? <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0" /> : <XCircle className="w-4 h-4 text-rose-400 shrink-0" />}
                              <span className={item.met ? 'text-gray-600' : 'text-rose-600 font-medium'}>{item.label}</span>
                            </div>
                          ))}
                        </div>
                      </div>

                      <div>
                        <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">Recommended</p>
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-1.5">
                          {recommendedItems.map((item) => (
                            <div key={item.key} className="flex items-center gap-2 text-sm">
                              {item.met ? <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0" /> : <Circle className="w-4 h-4 text-amber-400 shrink-0" />}
                              <span className={item.met ? 'text-gray-600' : 'text-gray-400'}>{item.label}</span>
                            </div>
                          ))}
                        </div>
                      </div>
                    </div>

                    <div className="border-t border-gray-100 pt-4 opacity-60">
                      <div className="border border-dashed border-gray-300 rounded-lg p-3 flex items-start gap-3 bg-gray-50">
                        <div className="shrink-0 flex items-center justify-center w-8 h-8 rounded-full bg-gray-200">
                          <Lock className="w-4 h-4 text-gray-400" />
                        </div>
                        <div>
                          <p className="text-sm font-medium text-gray-500 flex items-center gap-1.5">
                            <Sparkles className="w-3.5 h-3.5" /> AI Content Score
                          </p>
                          <p className="text-xs text-gray-400 mt-0.5">
                            AI-assisted quality scoring is coming in a future phase — not yet active. The completeness percentage above (shown in the header) is the only real score on this page today.
                          </p>
                        </div>
                      </div>
                    </div>

                    <div className="border-t border-gray-100 pt-4">
                      <details>
                        <summary className={`${labelCls} cursor-pointer select-none`}>JSON-LD preview</summary>
                        <p className="text-xs text-gray-400 mt-1 mb-2">Read-only preview generated from the current form state. Not saved anywhere.</p>
                        <pre className="text-xs bg-gray-50 border border-gray-200 rounded-lg p-3 overflow-x-auto">{JSON.stringify(jsonLd, null, 2)}</pre>
                      </details>
                    </div>
                  </>
                );
              })()}

            </div>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
