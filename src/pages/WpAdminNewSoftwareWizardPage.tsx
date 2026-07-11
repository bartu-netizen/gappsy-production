import { useEffect, useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import {
  ArrowLeft, ArrowRight, Check, X, Loader2, AlertTriangle, ExternalLink,
  Building2, DollarSign, Sparkles, Plug, Image as ImageIcon, HelpCircle,
  FileText, ThumbsUp, ThumbsDown, Target, Search, Save,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import type { CompletenessResult } from '../utils/toolCompleteness';

const STEPS = ['Website', 'Basic Info', 'Extraction Preview', 'Editorial', 'Review'] as const;

interface CategoryOption { id: string; slug: string; name: string; }
interface CategoriesListResponse { ok: boolean; data: CategoryOption[]; }

interface UrlCheckResult { valid: boolean; https: boolean; reachable: boolean; status?: number; error?: string; }
interface UrlCheckResponse { ok: boolean; data?: UrlCheckResult; error?: string; }

interface DuplicateCheckResult { exists: boolean; tool: { id: string; name: string; slug: string; website: string | null; status: string } | null; }
interface DuplicateCheckResponse { ok: boolean; data?: DuplicateCheckResult; error?: string; }

interface CreatedTool {
  id: string; slug: string; name: string; website: string | null; status: string;
  completeness: CompletenessResult;
}
interface ToolDetailResponse { ok: boolean; data?: CreatedTool; error?: string; }

function slugify(value: string): string {
  return value.toLowerCase().trim().replace(/[^\w\s-]/g, '').replace(/\s+/g, '-').replace(/-+/g, '-').replace(/^-+|-+$/g, '');
}

function normalizeUrl(value: string): string {
  const trimmed = value.trim();
  if (!trimmed) return trimmed;
  return /^https?:\/\//i.test(trimmed) ? trimmed : `https://${trimmed}`;
}

const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500';
const labelCls = 'block text-sm font-medium text-gray-700 mb-1';

function StepIndicator({ current }: { current: number }) {
  return (
    <div className="flex items-center gap-1.5 sm:gap-2 overflow-x-auto pb-1">
      {STEPS.map((label, index) => {
        const stepNum = index + 1;
        const isDone = stepNum < current;
        const isActive = stepNum === current;
        return (
          <div key={label} className="flex items-center gap-1.5 sm:gap-2 shrink-0">
            <div
              className={`flex items-center gap-1.5 px-2.5 py-1.5 rounded-full text-xs font-medium ${
                isActive ? 'bg-gray-900 text-white' : isDone ? 'bg-emerald-50 text-emerald-700' : 'bg-gray-100 text-gray-400'
              }`}
            >
              {isDone ? <Check className="w-3 h-3" /> : <span>{stepNum}</span>}
              <span className="hidden sm:inline">{label}</span>
            </div>
            {stepNum < STEPS.length && <div className={`w-4 sm:w-8 h-px ${isDone ? 'bg-emerald-300' : 'bg-gray-200'}`} />}
          </div>
        );
      })}
    </div>
  );
}

function PlaceholderCard({ icon: Icon, title, note }: { icon: typeof Building2; title: string; note: string }) {
  return (
    <div className="border border-dashed border-gray-300 rounded-lg p-4 bg-gray-50/60">
      <div className="flex items-center gap-2 mb-1.5">
        <div className="w-7 h-7 rounded-lg bg-white border border-gray-200 flex items-center justify-center shrink-0">
          <Icon className="w-3.5 h-3.5 text-gray-400" />
        </div>
        <p className="font-medium text-gray-700 text-sm">{title}</p>
      </div>
      <p className="text-xs text-gray-400">{note}</p>
    </div>
  );
}

export default function WpAdminNewSoftwareWizardPage() {
  const navigate = useNavigate();
  const [step, setStep] = useState(1);

  // Step 1
  const [url, setUrl] = useState('');
  const [urlChecked, setUrlChecked] = useState(false);
  const [checking, setChecking] = useState(false);
  const [urlCheck, setUrlCheck] = useState<UrlCheckResult | null>(null);
  const [duplicateCheck, setDuplicateCheck] = useState<DuplicateCheckResult | null>(null);
  const [ignoreUnreachable, setIgnoreUnreachable] = useState(false);

  // Step 2
  const [name, setName] = useState('');
  const [slug, setSlug] = useState('');
  const [autoSlug, setAutoSlug] = useState(true);
  const [categoryId, setCategoryId] = useState('');
  const [website, setWebsite] = useState('');
  const [toolId, setToolId] = useState<string | null>(null);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const { data: categoriesData } = useAdminFetch<CategoriesListResponse>('admin-tool-categories');
  const categories = categoriesData?.data || [];

  const { mutate: checkUrl } = useAdminMutation<UrlCheckResponse, { url: string }>('admin-tool-url-check', 'POST');
  const { mutate: checkDuplicate } = useAdminMutation<DuplicateCheckResponse, { action: string; website?: string; slug?: string }>('admin-tools', 'POST');
  const { mutate: createTool } = useAdminMutation<{ ok: boolean; data: { id: string } }, Record<string, unknown>>('admin-tools', 'POST');
  const { mutate: updateTool } = useAdminMutation<{ ok: boolean }, Record<string, unknown>>(`admin-tools?id=${toolId}`, 'PUT');

  const { data: reviewData, refetch: refetchReview } = useAdminFetch<ToolDetailResponse>(
    () => (step === 5 && toolId ? `admin-tools?id=${toolId}` : null)
  );

  useEffect(() => {
    document.title = 'New Software | Admin';
  }, []);

  useEffect(() => {
    if (autoSlug && name) setSlug(slugify(name));
  }, [name, autoSlug]);

  async function handleCheckUrl() {
    const normalized = normalizeUrl(url);
    if (!normalized) return;
    setChecking(true);
    setUrlCheck(null);
    setDuplicateCheck(null);
    setIgnoreUnreachable(false);

    const [reachResult, dupResult] = await Promise.all([
      checkUrl({ url: normalized }),
      checkDuplicate({ action: 'check-duplicate', website: normalized }),
    ]);
    setChecking(false);
    setUrlChecked(true);
    if (reachResult.ok && reachResult.data?.data) setUrlCheck(reachResult.data.data);
    if (dupResult.ok && dupResult.data?.data) setDuplicateCheck(dupResult.data.data);
  }

  const httpsOk = urlCheck?.https === true;
  const noDuplicate = duplicateCheck ? !duplicateCheck.exists : false;
  const reachableOk = urlCheck?.reachable === true || ignoreUnreachable;
  const canContinueStep1 = urlChecked && httpsOk && noDuplicate && reachableOk;

  function goToStep2() {
    setWebsite(normalizeUrl(url));
    setStep(2);
  }

  async function handleSaveBasicInfo() {
    setSaveError(null);
    if (!name.trim() || !slug.trim()) {
      setSaveError('Name and slug are required.');
      return;
    }
    setSaving(true);
    const payload = {
      slug, name, website: website || null, status: 'draft',
      source: 'wizard', source_url: normalizeUrl(url) || null,
      category_ids: categoryId ? [categoryId] : [],
      primary_category_id: categoryId || null,
    };

    if (toolId) {
      const result = await updateTool(payload);
      setSaving(false);
      if (!result.ok) {
        setSaveError(result.error?.message || 'Failed to save');
        return;
      }
      setStep(3);
      return;
    }

    const result = await createTool(payload);
    setSaving(false);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to create tool');
      return;
    }
    if (result.data) {
      setToolId(result.data.data.id);
      setStep(3);
    }
  }

  const review = reviewData?.data;
  const completeness: CompletenessResult | undefined = review?.completeness;

  async function handlePublish() {
    if (!toolId) return;
    setSaveError(null);
    setSaving(true);
    const result = await updateTool({ status: 'published' });
    setSaving(false);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to publish');
      return;
    }
    refetchReview();
  }

  return (
    <WpAdminLayout title="New Software" subtitle="Publishing wizard">
      <div className="max-w-3xl mx-auto">
        <Link to="/wp-admin/publishing/queue" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Publishing Queue
        </Link>

        <div className="mb-6">
          <StepIndicator current={step} />
        </div>

        {saveError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700 flex items-start gap-2">
            <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
            {saveError}
          </div>
        )}

        <div className="bg-white border border-gray-200 rounded-lg p-6">
          {step === 1 && (
            <div className="space-y-4">
              <div>
                <h2 className="text-lg font-bold text-gray-900 mb-1">Website URL</h2>
                <p className="text-sm text-gray-500">Start with the tool's official website. We'll check it before you continue.</p>
              </div>

              <div className="flex gap-2">
                <input
                  type="text"
                  value={url}
                  onChange={(e) => { setUrl(e.target.value); setUrlChecked(false); }}
                  placeholder="https://example.com"
                  className={`${inputCls} flex-1`}
                />
                <button
                  onClick={handleCheckUrl}
                  disabled={!url.trim() || checking}
                  className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-medium hover:bg-gray-800 disabled:opacity-50 transition text-sm shrink-0"
                >
                  {checking ? <Loader2 className="w-4 h-4 animate-spin" /> : <Search className="w-4 h-4" />}
                  Check
                </button>
              </div>

              {urlChecked && (
                <div className="space-y-2 border border-gray-100 rounded-lg p-3 bg-gray-50">
                  <div className="flex items-center gap-2 text-sm">
                    {httpsOk ? <Check className="w-4 h-4 text-emerald-500" /> : <X className="w-4 h-4 text-rose-500" />}
                    <span className={httpsOk ? 'text-gray-700' : 'text-rose-600 font-medium'}>Uses HTTPS</span>
                  </div>
                  <div className="flex items-center gap-2 text-sm">
                    {noDuplicate ? <Check className="w-4 h-4 text-emerald-500" /> : <X className="w-4 h-4 text-rose-500" />}
                    <span className={noDuplicate ? 'text-gray-700' : 'text-rose-600 font-medium'}>
                      {duplicateCheck?.exists ? (
                        <>
                          Already in the directory —{' '}
                          <Link to={`/wp-admin/tools/${duplicateCheck.tool?.id}/edit`} className="underline">
                            edit {duplicateCheck.tool?.name}
                          </Link>{' '}
                          instead
                        </>
                      ) : (
                        'No duplicate found'
                      )}
                    </span>
                  </div>
                  <div className="flex items-center gap-2 text-sm">
                    {urlCheck?.reachable ? <Check className="w-4 h-4 text-emerald-500" /> : <AlertTriangle className="w-4 h-4 text-amber-500" />}
                    <span className={urlCheck?.reachable ? 'text-gray-700' : 'text-amber-600'}>
                      {urlCheck?.reachable ? `Reachable (${urlCheck.status})` : `Could not confirm reachability${urlCheck?.error ? ` — ${urlCheck.error}` : ''}`}
                    </span>
                  </div>
                  {!urlCheck?.reachable && urlCheck?.valid && (
                    <label className="flex items-center gap-2 text-xs text-gray-500 pt-1">
                      <input type="checkbox" checked={ignoreUnreachable} onChange={(e) => setIgnoreUnreachable(e.target.checked)} />
                      Continue anyway — some sites block automated checks even though they're live.
                    </label>
                  )}
                </div>
              )}

              <div className="flex justify-end pt-2">
                <button
                  onClick={goToStep2}
                  disabled={!canContinueStep1}
                  className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-300 disabled:cursor-not-allowed transition text-sm"
                >
                  Continue
                  <ArrowRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          )}

          {step === 2 && (
            <div className="space-y-4">
              <div>
                <h2 className="text-lg font-bold text-gray-900 mb-1">Basic Information</h2>
                <p className="text-sm text-gray-500">This creates the tool as a draft — nothing goes live yet.</p>
              </div>

              <div>
                <label className={labelCls}>Name</label>
                <input type="text" value={name} onChange={(e) => setName(e.target.value)} className={inputCls} placeholder="e.g. Notion AI" />
              </div>
              <div>
                <div className="flex items-center justify-between mb-1">
                  <label className={labelCls}>Slug</label>
                  <label className="flex items-center gap-1.5 text-xs text-gray-500">
                    <input type="checkbox" checked={autoSlug} onChange={(e) => setAutoSlug(e.target.checked)} />
                    Auto-generate
                  </label>
                </div>
                <input
                  type="text"
                  value={slug}
                  onChange={(e) => { setAutoSlug(false); setSlug(slugify(e.target.value)); }}
                  className={`${inputCls} font-mono`}
                />
                <p className="text-xs text-gray-400 mt-1">/tools/{slug || '...'}</p>
              </div>
              <div>
                <label className={labelCls}>Category</label>
                <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className={inputCls}>
                  <option value="">Select a category…</option>
                  {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
                </select>
              </div>
              <div>
                <label className={labelCls}>Website</label>
                <input type="text" value={website} onChange={(e) => setWebsite(e.target.value)} className={inputCls} />
              </div>

              <div className="flex justify-between pt-2">
                <button onClick={() => setStep(1)} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700 px-3 py-2">
                  <ArrowLeft className="w-4 h-4" /> Back
                </button>
                <button
                  onClick={handleSaveBasicInfo}
                  disabled={saving || !name.trim() || !slug.trim()}
                  className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:opacity-50 transition text-sm"
                >
                  {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <ArrowRight className="w-4 h-4" />}
                  Continue
                </button>
              </div>
            </div>
          )}

          {step === 3 && (
            <div className="space-y-4">
              <div>
                <h2 className="text-lg font-bold text-gray-900 mb-1">Extraction Preview</h2>
                <p className="text-sm text-gray-500">
                  This is where a future extraction engine will pull structured facts from{' '}
                  <span className="font-medium text-gray-700">{website}</span>. Nothing is fetched from the site today.
                </p>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <PlaceholderCard icon={Building2} title="Company" note="Ready for future extraction." />
                <PlaceholderCard icon={DollarSign} title="Pricing" note="Ready for future extraction." />
                <PlaceholderCard icon={Sparkles} title="Features" note="Ready for future extraction." />
                <PlaceholderCard icon={Plug} title="Integrations" note="Ready for future extraction." />
                <PlaceholderCard icon={ImageIcon} title="Screenshots" note="Ready for future extraction." />
                <PlaceholderCard icon={HelpCircle} title="FAQ" note="Ready for future extraction." />
              </div>
              <div className="flex justify-between pt-2">
                <button onClick={() => setStep(2)} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700 px-3 py-2">
                  <ArrowLeft className="w-4 h-4" /> Back
                </button>
                <button onClick={() => setStep(4)} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm">
                  Continue <ArrowRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          )}

          {step === 4 && (
            <div className="space-y-4">
              <div>
                <h2 className="text-lg font-bold text-gray-900 mb-1">Editorial</h2>
                <p className="text-sm text-gray-500">This is where a future AI enrichment pass will draft editorial content for review. No AI is called today.</p>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <PlaceholderCard icon={FileText} title="Overview" note="Ready for future AI enrichment." />
                <PlaceholderCard icon={ThumbsUp} title="Pros" note="Ready for future AI enrichment." />
                <PlaceholderCard icon={ThumbsDown} title="Cons" note="Ready for future AI enrichment." />
                <PlaceholderCard icon={Target} title="Use Cases" note="Ready for future AI enrichment." />
                <PlaceholderCard icon={HelpCircle} title="FAQ" note="Ready for future AI enrichment." />
                <PlaceholderCard icon={Search} title="SEO" note="Ready for future AI enrichment." />
              </div>
              <p className="text-xs text-gray-400">
                Every one of these can already be filled in by hand in the full tool editor — this step is just showing where automation will plug in later.
              </p>
              <div className="flex justify-between pt-2">
                <button onClick={() => setStep(3)} className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700 px-3 py-2">
                  <ArrowLeft className="w-4 h-4" /> Back
                </button>
                <button onClick={() => setStep(5)} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm">
                  Continue <ArrowRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          )}

          {step === 5 && (
            <div className="space-y-5">
              <div>
                <h2 className="text-lg font-bold text-gray-900 mb-1">Review</h2>
                <p className="text-sm text-gray-500">Real completeness, computed from what's actually been saved — nothing fabricated.</p>
              </div>

              {review ? (
                <>
                  <div className="border border-gray-200 rounded-lg p-4">
                    <div className="flex items-center justify-between mb-3">
                      <div>
                        <p className="font-semibold text-gray-900">{review.name}</p>
                        <p className="text-xs text-gray-400">/tools/{review.slug}</p>
                      </div>
                      <span className="text-xs font-medium px-2 py-0.5 rounded bg-gray-100 text-gray-600">{review.status}</span>
                    </div>
                    {review.website && (
                      <a href={review.website} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline">
                        {review.website} <ExternalLink className="w-3 h-3" />
                      </a>
                    )}
                  </div>

                  {completeness && (
                    <div>
                      <div className="flex items-center justify-between mb-2">
                        <p className={labelCls}>Completeness</p>
                        <span className="text-sm font-semibold text-gray-700">{completeness.percent}%</span>
                      </div>
                      <div className="h-1.5 bg-gray-100 rounded-full overflow-hidden mb-3">
                        <div
                          className={`h-full ${completeness.percent >= 80 ? 'bg-emerald-500' : completeness.percent >= 50 ? 'bg-amber-500' : 'bg-rose-400'}`}
                          style={{ width: `${completeness.percent}%` }}
                        />
                      </div>
                      {!completeness.requiredMet && (
                        <p className="text-xs text-amber-600 mb-3">
                          Still missing: {completeness.missingRequired.join(', ')} — finish these in the full editor before publishing.
                        </p>
                      )}
                    </div>
                  )}

                  <div className="flex flex-wrap justify-end gap-2 pt-2 border-t border-gray-100">
                    <Link
                      to={`/wp-admin/tools/${toolId}/edit`}
                      className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2.5 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
                    >
                      Finish in full editor
                    </Link>
                    <button
                      onClick={() => navigate('/wp-admin/publishing/queue')}
                      className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2.5 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
                    >
                      <Save className="w-4 h-4" />
                      Save Draft &amp; Exit
                    </button>
                    <button
                      onClick={handlePublish}
                      disabled={saving || review.status === 'published'}
                      title={completeness && !completeness.requiredMet ? `Missing: ${completeness.missingRequired.join(', ')}` : undefined}
                      className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-400 transition text-sm"
                    >
                      {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : review.status === 'published' ? <Check className="w-4 h-4" /> : null}
                      {review.status === 'published' ? 'Published' : 'Publish'}
                    </button>
                  </div>
                </>
              ) : (
                <div className="text-sm text-gray-400">Loading…</div>
              )}
            </div>
          )}
        </div>
      </div>
    </WpAdminLayout>
  );
}
