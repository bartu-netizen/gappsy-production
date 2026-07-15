import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Loader2, LogOut, ExternalLink, Star, ShieldCheck, CreditCard, Plus, Trash2,
  MessageSquareReply, EyeOff, Eye, Save, LayoutDashboard, FileText, MessageSquare, Wallet,
} from 'lucide-react';
import { useAuth } from '../hooks/useAuth';
import { vendorDashboard } from '../lib/vendorDashboardApi';
import EntitySEOTags from '../components/EntitySEOTags';
import { useNoindex } from '../components/NoindexMeta';

interface ToolRow {
  id: string; slug: string; name: string; logo: string | null; website: string | null;
  short_description: string | null; long_description: string | null; pricing_model: string | null;
  starting_price: string | null; youtube_url: string | null; founded_year: number | null;
  company_size: string | null; headquarters: string | null; languages: string[];
  best_for: string | null; target_audience: string | null; pricing_summary: string | null;
  features_summary: string | null; integrations_summary: string | null; company_summary: string | null;
  rating: number; review_count: number; verified: boolean; featured: boolean;
  featured_until: string | null; status: string; updated_at: string;
}
interface FeatureRow { id: string; title: string; description: string | null; sort_order: number }
interface TextRow { id: string; text: string; sort_order: number }
interface FaqRow { id: string; question: string; answer: string; sort_order: number }
interface ReviewRow {
  id: string; reviewer_name: string; rating: number; title: string | null; body: string;
  status: string; vendor_response: string | null; vendor_response_at: string | null; created_at: string;
}
interface SubscriptionRow { status: string; current_period_end: string | null; featured_until: string | null; stripe_customer_id: string | null; canceled_at: string | null }

type Tab = 'overview' | 'listing' | 'content' | 'reviews' | 'billing';

const TABS: { key: Tab; label: string; icon: typeof LayoutDashboard }[] = [
  { key: 'overview', label: 'Overview', icon: LayoutDashboard },
  { key: 'listing', label: 'Listing', icon: FileText },
  { key: 'content', label: 'Features & FAQs', icon: FileText },
  { key: 'reviews', label: 'Reviews', icon: MessageSquare },
  { key: 'billing', label: 'Billing', icon: Wallet },
];

export default function VendorDashboardPage() {
  useNoindex();
  const { user, loading: authLoading, signOut } = useAuth();
  const [tab, setTab] = useState<Tab>('overview');
  const [loading, setLoading] = useState(true);
  const [loadError, setLoadError] = useState<string | null>(null);

  const [tool, setTool] = useState<ToolRow | null>(null);
  const [features, setFeatures] = useState<FeatureRow[]>([]);
  const [pros, setPros] = useState<TextRow[]>([]);
  const [cons, setCons] = useState<TextRow[]>([]);
  const [faqs, setFaqs] = useState<FaqRow[]>([]);
  const [reviews, setReviews] = useState<ReviewRow[]>([]);
  const [subscription, setSubscription] = useState<SubscriptionRow | null>(null);

  useEffect(() => {
    if (authLoading || !user) return;
    vendorDashboard.fetchAll().then((res) => {
      if (!res.ok) {
        setLoadError(res.error || 'Failed to load your dashboard');
        setLoading(false);
        return;
      }
      setTool(res.tool);
      setFeatures(res.features);
      setPros(res.pros);
      setCons(res.cons);
      setFaqs(res.faqs);
      setReviews(res.reviews);
      setSubscription(res.subscription);
      setLoading(false);
    }).catch(() => {
      setLoadError('Failed to load your dashboard');
      setLoading(false);
    });
  }, [authLoading, user]);

  if (authLoading) {
    return <div className="min-h-screen flex items-center justify-center bg-[#f7f8fa]"><Loader2 className="w-6 h-6 text-[#4F47E6] animate-spin" /></div>;
  }

  if (!user) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[#f7f8fa] px-4">
        <div className="text-center">
          <h1 className="text-lg font-bold text-[#0B1221] mb-2">Sign in required</h1>
          <p className="text-sm text-slate-500 mb-4">You need to sign in to view your vendor dashboard.</p>
          <Link to="/login" className="inline-flex items-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] text-white px-5 py-2.5 rounded-xl font-semibold text-sm">Sign in</Link>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f7f8fa]">
      <EntitySEOTags title="Vendor Dashboard | Gappsy" description="Manage your featured Gappsy listing." path="/vendor/dashboard" noindex />

      <header className="sticky top-0 z-30 bg-white border-b border-[#F1F3F5]">
        <div className="max-w-5xl mx-auto px-4 sm:px-6 h-16 flex items-center justify-between">
          <Link to="/" aria-label="Gappsy home" className="flex items-center">
            <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-6 w-auto" />
          </Link>
          <div className="flex items-center gap-3">
            <span className="hidden sm:inline text-[13px] text-slate-400">{user.email}</span>
            <button
              type="button"
              onClick={() => signOut()}
              className="inline-flex items-center gap-1.5 text-[13px] font-medium text-slate-500 hover:text-red-600 transition-colors px-3 py-1.5 rounded-lg hover:bg-red-50"
            >
              <LogOut className="w-3.5 h-3.5" /> Sign out
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-4 sm:px-6 py-8">
        {loading && (
          <div className="flex items-center justify-center py-24"><Loader2 className="w-6 h-6 text-[#4F47E6] animate-spin" /></div>
        )}

        {!loading && loadError && (
          <div className="max-w-md mx-auto text-center py-16">
            <h1 className="text-lg font-bold text-[#0B1221] mb-2">Couldn't load your dashboard</h1>
            <p className="text-sm text-slate-500">{loadError}</p>
          </div>
        )}

        {!loading && !loadError && tool && (
          <div className="flex flex-col lg:flex-row gap-6">
            <nav className="lg:w-56 shrink-0">
              <div className="flex lg:flex-col gap-1 overflow-x-auto lg:overflow-visible pb-2 lg:pb-0">
                {TABS.map(({ key, label, icon: Icon }) => (
                  <button
                    key={key}
                    type="button"
                    onClick={() => setTab(key)}
                    className={`flex items-center gap-2 px-3.5 py-2.5 rounded-xl text-sm font-medium whitespace-nowrap transition-colors text-left ${
                      tab === key ? 'bg-[#EEF0FE] text-[#4338CA]' : 'text-slate-500 hover:bg-white hover:text-[#0B1221]'
                    }`}
                  >
                    <Icon className="w-4 h-4 shrink-0" />
                    {label}
                  </button>
                ))}
              </div>
            </nav>

            <div className="flex-1 min-w-0">
              {tab === 'overview' && <OverviewTab tool={tool} subscription={subscription} reviews={reviews} />}
              {tab === 'listing' && <ListingTab tool={tool} onSaved={setTool} />}
              {tab === 'content' && (
                <ContentTab features={features} pros={pros} cons={cons} faqs={faqs} onFeatures={setFeatures} onPros={setPros} onCons={setCons} onFaqs={setFaqs} />
              )}
              {tab === 'reviews' && <ReviewsTab reviews={reviews} onReviews={setReviews} />}
              {tab === 'billing' && <BillingTab subscription={subscription} toolSlug={tool.slug} />}
            </div>
          </div>
        )}
      </main>
    </div>
  );
}

function Card({ children }: { children: React.ReactNode }) {
  return <div className="bg-white border border-[#eef0f3] rounded-2xl p-5 sm:p-6 shadow-[0_4px_16px_rgba(15,23,42,0.04)]">{children}</div>;
}

function OverviewTab({ tool, subscription, reviews }: { tool: ToolRow; subscription: SubscriptionRow | null; reviews: ReviewRow[] }) {
  const pendingCount = reviews.filter((r) => r.status === 'pending').length;
  const publishedCount = reviews.filter((r) => r.status === 'approved').length;
  const isActive = subscription?.status === 'active';

  return (
    <div className="space-y-5">
      <Card>
        <div className="flex items-start gap-4">
          {tool.logo ? (
            <img src={tool.logo} alt={tool.name} className="w-14 h-14 rounded-2xl object-contain border border-slate-100 bg-white shrink-0" />
          ) : (
            <div className="w-14 h-14 rounded-2xl bg-[#EEF0FE] flex items-center justify-center text-[#8B90D9] font-bold text-xl shrink-0">{tool.name.charAt(0)}</div>
          )}
          <div className="min-w-0 flex-1">
            <div className="flex items-center gap-2 flex-wrap">
              <h1 className="text-lg font-bold text-[#0B1221] truncate">{tool.name}</h1>
              {tool.verified && <ShieldCheck className="w-4 h-4 text-[#4F47E6] shrink-0" aria-label="Verified" />}
            </div>
            <div className="flex items-center gap-3 mt-1.5 text-[13px] text-slate-500 flex-wrap">
              <span className="inline-flex items-center gap-1"><Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />{tool.rating.toFixed(1)} ({tool.review_count})</span>
              <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-semibold ${tool.status === 'published' ? 'bg-emerald-50 text-emerald-700' : 'bg-slate-100 text-slate-500'}`}>
                {tool.status === 'published' ? 'Live' : tool.status}
              </span>
              <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-semibold ${isActive ? 'bg-amber-50 text-amber-700' : 'bg-slate-100 text-slate-400'}`}>
                {isActive ? 'Featured' : 'Not featured'}
              </span>
            </div>
            <Link to={`/tools/${tool.slug}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-[13px] font-medium text-[#4F47E6] hover:text-[#4338CA] mt-2.5">
              View live listing <ExternalLink className="w-3 h-3" />
            </Link>
          </div>
        </div>
      </Card>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <Card><p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Rating</p><p className="text-2xl font-bold text-[#0B1221]">{tool.rating.toFixed(1)}</p></Card>
        <Card><p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Published reviews</p><p className="text-2xl font-bold text-[#0B1221]">{publishedCount}</p></Card>
        <Card><p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Awaiting moderation</p><p className="text-2xl font-bold text-[#0B1221]">{pendingCount}</p></Card>
      </div>

      {tool.featured_until && (
        <Card>
          <p className="text-sm text-slate-600">
            Your featured placement is active until <strong className="text-[#0B1221]">{new Date(tool.featured_until).toLocaleDateString()}</strong>.
          </p>
        </Card>
      )}
    </div>
  );
}

function FieldInput({ label, value, onChange, placeholder, type = 'text' }: { label: string; value: string; onChange: (v: string) => void; placeholder?: string; type?: string }) {
  return (
    <div>
      <label className="block text-xs font-semibold text-slate-600 mb-1.5">{label}</label>
      <input
        type={type}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="w-full h-10 rounded-xl border border-slate-200 px-3.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow"
      />
    </div>
  );
}

function FieldTextarea({ label, value, onChange, rows = 3 }: { label: string; value: string; onChange: (v: string) => void; rows?: number }) {
  return (
    <div>
      <label className="block text-xs font-semibold text-slate-600 mb-1.5">{label}</label>
      <textarea
        value={value}
        onChange={(e) => onChange(e.target.value)}
        rows={rows}
        className="w-full rounded-xl border border-slate-200 px-3.5 py-2.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow resize-y"
      />
    </div>
  );
}

function ListingTab({ tool, onSaved }: { tool: ToolRow; onSaved: (t: ToolRow) => void }) {
  const [form, setForm] = useState({
    short_description: tool.short_description || '',
    long_description: tool.long_description || '',
    website: tool.website || '',
    pricing_model: tool.pricing_model || '',
    starting_price: tool.starting_price || '',
    youtube_url: tool.youtube_url || '',
    founded_year: tool.founded_year ? String(tool.founded_year) : '',
    company_size: tool.company_size || '',
    headquarters: tool.headquarters || '',
    best_for: tool.best_for || '',
    target_audience: tool.target_audience || '',
    pricing_summary: tool.pricing_summary || '',
    features_summary: tool.features_summary || '',
    integrations_summary: tool.integrations_summary || '',
    company_summary: tool.company_summary || '',
  });
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  function set<K extends keyof typeof form>(key: K, value: string) {
    setForm((f) => ({ ...f, [key]: value }));
    setSaved(false);
  }

  async function handleSave() {
    setSaving(true);
    setSaved(false);
    const res = await vendorDashboard.updateListing({
      ...form,
      founded_year: form.founded_year ? Number(form.founded_year) : null,
    });
    setSaving(false);
    if (res.ok) {
      onSaved(res.tool);
      setSaved(true);
    }
  }

  return (
    <div className="space-y-5">
      <Card>
        <h2 className="text-sm font-bold text-[#0B1221] mb-4">Basics</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <FieldInput label="Website" value={form.website} onChange={(v) => set('website', v)} placeholder="https://" />
          <FieldInput label="YouTube demo URL" value={form.youtube_url} onChange={(v) => set('youtube_url', v)} placeholder="https://youtube.com/watch?v=..." />
          <FieldInput label="Founded year" value={form.founded_year} onChange={(v) => set('founded_year', v)} type="number" />
          <FieldInput label="Company size" value={form.company_size} onChange={(v) => set('company_size', v)} placeholder="e.g. 51-200 employees" />
          <FieldInput label="Headquarters" value={form.headquarters} onChange={(v) => set('headquarters', v)} placeholder="e.g. Sydney, Australia" />
        </div>
        <div className="mt-4"><FieldTextarea label="Short description" value={form.short_description} onChange={(v) => set('short_description', v)} rows={2} /></div>
        <div className="mt-4"><FieldTextarea label="Long description" value={form.long_description} onChange={(v) => set('long_description', v)} rows={6} /></div>
      </Card>

      <Card>
        <h2 className="text-sm font-bold text-[#0B1221] mb-4">Pricing</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <FieldInput label="Pricing model" value={form.pricing_model} onChange={(v) => set('pricing_model', v)} placeholder="e.g. Freemium" />
          <FieldInput label="Starting price" value={form.starting_price} onChange={(v) => set('starting_price', v)} placeholder="e.g. $12/mo" />
        </div>
        <div className="mt-4"><FieldTextarea label="Pricing summary" value={form.pricing_summary} onChange={(v) => set('pricing_summary', v)} rows={3} /></div>
      </Card>

      <Card>
        <h2 className="text-sm font-bold text-[#0B1221] mb-4">Editorial summaries</h2>
        <div className="space-y-4">
          <FieldTextarea label="Best for" value={form.best_for} onChange={(v) => set('best_for', v)} rows={2} />
          <FieldTextarea label="Target audience" value={form.target_audience} onChange={(v) => set('target_audience', v)} rows={2} />
          <FieldTextarea label="Features summary" value={form.features_summary} onChange={(v) => set('features_summary', v)} rows={3} />
          <FieldTextarea label="Integrations summary" value={form.integrations_summary} onChange={(v) => set('integrations_summary', v)} rows={3} />
          <FieldTextarea label="Company summary" value={form.company_summary} onChange={(v) => set('company_summary', v)} rows={3} />
        </div>
      </Card>

      <div className="flex items-center gap-3">
        <button
          type="button"
          onClick={handleSave}
          disabled={saving}
          className="inline-flex items-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] text-white px-5 py-2.5 rounded-xl font-semibold text-sm transition-all disabled:opacity-60"
        >
          {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
          Save changes
        </button>
        {saved && <span className="text-[13px] text-emerald-600 font-medium">Saved</span>}
      </div>
    </div>
  );
}

function ContentTab({
  features, pros, cons, faqs, onFeatures, onPros, onCons, onFaqs,
}: {
  features: FeatureRow[]; pros: TextRow[]; cons: TextRow[]; faqs: FaqRow[];
  onFeatures: (v: FeatureRow[]) => void; onPros: (v: TextRow[]) => void; onCons: (v: TextRow[]) => void; onFaqs: (v: FaqRow[]) => void;
}) {
  return (
    <div className="space-y-5">
      <FeaturesEditor features={features} onSaved={onFeatures} />
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
        <ListTextEditor title="Pros" items={pros} onSaved={onPros} action={vendorDashboard.setPros} placeholder="e.g. Fast onboarding" />
        <ListTextEditor title="Cons" items={cons} onSaved={onCons} action={vendorDashboard.setCons} placeholder="e.g. Limited free tier" />
      </div>
      <FaqsEditor faqs={faqs} onSaved={onFaqs} />
    </div>
  );
}

function FeaturesEditor({ features, onSaved }: { features: FeatureRow[]; onSaved: (v: FeatureRow[]) => void }) {
  const [items, setItems] = useState(features.map((f) => ({ title: f.title, description: f.description || '' })));
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  function update(index: number, field: 'title' | 'description', value: string) {
    setItems((prev) => prev.map((it, i) => (i === index ? { ...it, [field]: value } : it)));
    setSaved(false);
  }
  function remove(index: number) {
    setItems((prev) => prev.filter((_, i) => i !== index));
    setSaved(false);
  }
  function add() {
    setItems((prev) => [...prev, { title: '', description: '' }]);
  }
  async function save() {
    setSaving(true);
    const cleaned = items.filter((it) => it.title.trim());
    const res = await vendorDashboard.setFeatures(cleaned);
    setSaving(false);
    if (res.ok) {
      onSaved(res.items);
      setItems(res.items.map((f: FeatureRow) => ({ title: f.title, description: f.description || '' })));
      setSaved(true);
    }
  }

  return (
    <Card>
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-sm font-bold text-[#0B1221]">Key features</h2>
        <button type="button" onClick={add} className="inline-flex items-center gap-1 text-[13px] font-medium text-[#4F47E6] hover:text-[#4338CA]"><Plus className="w-3.5 h-3.5" /> Add</button>
      </div>
      <div className="space-y-3">
        {items.length === 0 && <p className="text-[13px] text-slate-400">No features yet — add your first one.</p>}
        {items.map((it, i) => (
          <div key={i} className="flex items-start gap-2 border border-slate-100 rounded-xl p-3">
            <div className="flex-1 min-w-0 space-y-2">
              <input value={it.title} onChange={(e) => update(i, 'title', e.target.value)} placeholder="Feature title" className="w-full h-9 rounded-lg border border-slate-200 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0]" />
              <textarea value={it.description} onChange={(e) => update(i, 'description', e.target.value)} placeholder="Short description (optional)" rows={2} className="w-full rounded-lg border border-slate-200 px-3 py-1.5 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] resize-y" />
            </div>
            <button type="button" onClick={() => remove(i)} aria-label="Remove feature" className="shrink-0 w-8 h-8 rounded-lg flex items-center justify-center text-slate-400 hover:text-red-600 hover:bg-red-50 transition-colors"><Trash2 className="w-3.5 h-3.5" /></button>
          </div>
        ))}
      </div>
      <div className="flex items-center gap-3 mt-4">
        <button type="button" onClick={save} disabled={saving} className="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white px-4 py-2 rounded-xl font-semibold text-[13px] transition-colors disabled:opacity-60">
          {saving ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Save className="w-3.5 h-3.5" />} Save features
        </button>
        {saved && <span className="text-[13px] text-emerald-600 font-medium">Saved</span>}
      </div>
    </Card>
  );
}

function ListTextEditor({
  title, items, onSaved, action, placeholder,
}: {
  title: string; items: TextRow[]; onSaved: (v: TextRow[]) => void; action: (items: { text: string }[]) => Promise<{ ok: boolean; items: TextRow[] }>; placeholder: string;
}) {
  const [values, setValues] = useState(items.map((it) => it.text));
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  function update(index: number, value: string) {
    setValues((prev) => prev.map((v, i) => (i === index ? value : v)));
    setSaved(false);
  }
  function remove(index: number) {
    setValues((prev) => prev.filter((_, i) => i !== index));
    setSaved(false);
  }
  async function save() {
    setSaving(true);
    const cleaned = values.filter((v) => v.trim()).map((text) => ({ text }));
    const res = await action(cleaned);
    setSaving(false);
    if (res.ok) {
      onSaved(res.items);
      setValues(res.items.map((it) => it.text));
      setSaved(true);
    }
  }

  return (
    <Card>
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-sm font-bold text-[#0B1221]">{title}</h2>
        <button type="button" onClick={() => setValues((prev) => [...prev, ''])} className="inline-flex items-center gap-1 text-[13px] font-medium text-[#4F47E6] hover:text-[#4338CA]"><Plus className="w-3.5 h-3.5" /> Add</button>
      </div>
      <div className="space-y-2">
        {values.length === 0 && <p className="text-[13px] text-slate-400">Nothing added yet.</p>}
        {values.map((v, i) => (
          <div key={i} className="flex items-center gap-2">
            <input value={v} onChange={(e) => update(i, e.target.value)} placeholder={placeholder} className="flex-1 h-9 rounded-lg border border-slate-200 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0]" />
            <button type="button" onClick={() => remove(i)} aria-label="Remove" className="shrink-0 w-8 h-8 rounded-lg flex items-center justify-center text-slate-400 hover:text-red-600 hover:bg-red-50 transition-colors"><Trash2 className="w-3.5 h-3.5" /></button>
          </div>
        ))}
      </div>
      <div className="flex items-center gap-3 mt-4">
        <button type="button" onClick={save} disabled={saving} className="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white px-4 py-2 rounded-xl font-semibold text-[13px] transition-colors disabled:opacity-60">
          {saving ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Save className="w-3.5 h-3.5" />} Save {title.toLowerCase()}
        </button>
        {saved && <span className="text-[13px] text-emerald-600 font-medium">Saved</span>}
      </div>
    </Card>
  );
}

function FaqsEditor({ faqs, onSaved }: { faqs: FaqRow[]; onSaved: (v: FaqRow[]) => void }) {
  const [items, setItems] = useState(faqs.map((f) => ({ question: f.question, answer: f.answer })));
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  function update(index: number, field: 'question' | 'answer', value: string) {
    setItems((prev) => prev.map((it, i) => (i === index ? { ...it, [field]: value } : it)));
    setSaved(false);
  }
  function remove(index: number) {
    setItems((prev) => prev.filter((_, i) => i !== index));
    setSaved(false);
  }
  async function save() {
    setSaving(true);
    const cleaned = items.filter((it) => it.question.trim() && it.answer.trim());
    const res = await vendorDashboard.setFaqs(cleaned);
    setSaving(false);
    if (res.ok) {
      onSaved(res.items);
      setItems(res.items.map((f: FaqRow) => ({ question: f.question, answer: f.answer })));
      setSaved(true);
    }
  }

  return (
    <Card>
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-sm font-bold text-[#0B1221]">FAQs</h2>
        <button type="button" onClick={() => setItems((prev) => [...prev, { question: '', answer: '' }])} className="inline-flex items-center gap-1 text-[13px] font-medium text-[#4F47E6] hover:text-[#4338CA]"><Plus className="w-3.5 h-3.5" /> Add</button>
      </div>
      <div className="space-y-3">
        {items.length === 0 && <p className="text-[13px] text-slate-400">No FAQs yet.</p>}
        {items.map((it, i) => (
          <div key={i} className="flex items-start gap-2 border border-slate-100 rounded-xl p-3">
            <div className="flex-1 min-w-0 space-y-2">
              <input value={it.question} onChange={(e) => update(i, 'question', e.target.value)} placeholder="Question" className="w-full h-9 rounded-lg border border-slate-200 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0]" />
              <textarea value={it.answer} onChange={(e) => update(i, 'answer', e.target.value)} placeholder="Answer" rows={2} className="w-full rounded-lg border border-slate-200 px-3 py-1.5 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] resize-y" />
            </div>
            <button type="button" onClick={() => remove(i)} aria-label="Remove FAQ" className="shrink-0 w-8 h-8 rounded-lg flex items-center justify-center text-slate-400 hover:text-red-600 hover:bg-red-50 transition-colors"><Trash2 className="w-3.5 h-3.5" /></button>
          </div>
        ))}
      </div>
      <div className="flex items-center gap-3 mt-4">
        <button type="button" onClick={save} disabled={saving} className="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white px-4 py-2 rounded-xl font-semibold text-[13px] transition-colors disabled:opacity-60">
          {saving ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Save className="w-3.5 h-3.5" />} Save FAQs
        </button>
        {saved && <span className="text-[13px] text-emerald-600 font-medium">Saved</span>}
      </div>
    </Card>
  );
}

function ReviewsTab({ reviews, onReviews }: { reviews: ReviewRow[]; onReviews: (v: ReviewRow[]) => void }) {
  if (reviews.length === 0) {
    return <Card><p className="text-sm text-slate-500 text-center py-6">No reviews yet.</p></Card>;
  }
  return (
    <div className="space-y-4">
      {reviews.map((review) => (
        <ReviewCard key={review.id} review={review} onUpdate={(updated) => onReviews(reviews.map((r) => (r.id === updated.id ? updated : r)))} />
      ))}
    </div>
  );
}

function ReviewCard({ review, onUpdate }: { review: ReviewRow; onUpdate: (r: ReviewRow) => void }) {
  const [responseText, setResponseText] = useState(review.vendor_response || '');
  const [busy, setBusy] = useState(false);

  async function submitResponse() {
    if (!responseText.trim()) return;
    setBusy(true);
    const res = await vendorDashboard.respondToReview(review.id, responseText.trim());
    setBusy(false);
    if (res.ok) onUpdate(res.review);
  }
  async function toggleVisibility() {
    setBusy(true);
    const res = review.status === 'rejected' ? await vendorDashboard.restoreReview(review.id) : await vendorDashboard.removeReview(review.id);
    setBusy(false);
    if (res.ok) onUpdate(res.review);
  }

  const isRemoved = review.status === 'rejected';
  const isPending = review.status === 'pending';

  return (
    <Card>
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-semibold text-sm text-[#0B1221]">{review.reviewer_name}</span>
            <span className="inline-flex items-center gap-0.5 text-amber-600 text-xs font-semibold">
              <Star className="w-3 h-3 fill-amber-400 text-amber-400" />{review.rating}
            </span>
            {isPending && <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-slate-100 text-slate-500">Awaiting moderation</span>}
            {isRemoved && <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-red-50 text-red-600">Hidden from your page</span>}
          </div>
          {review.title && <p className="text-sm font-medium text-[#0B1221] mt-1.5">{review.title}</p>}
          <p className="text-sm text-slate-600 mt-1 leading-relaxed">{review.body}</p>
        </div>
        {!isPending && (
          <button
            type="button"
            onClick={toggleVisibility}
            disabled={busy}
            title={isRemoved ? 'Restore to your public page' : 'Hide from your public page'}
            className={`shrink-0 inline-flex items-center gap-1 text-[12px] font-medium px-2.5 py-1.5 rounded-lg transition-colors disabled:opacity-60 ${
              isRemoved ? 'text-emerald-600 hover:bg-emerald-50' : 'text-slate-500 hover:bg-slate-50'
            }`}
          >
            {isRemoved ? <Eye className="w-3.5 h-3.5" /> : <EyeOff className="w-3.5 h-3.5" />}
            {isRemoved ? 'Restore' : 'Remove'}
          </button>
        )}
      </div>

      {!isPending && (
        <div className="mt-4 pt-4 border-t border-slate-100">
          {review.vendor_response && (
            <div className="bg-[#EEF0FE]/60 rounded-xl p-3 mb-3">
              <p className="text-[11px] font-semibold text-[#4F47E6] mb-1">Your response</p>
              <p className="text-sm text-slate-700">{review.vendor_response}</p>
            </div>
          )}
          <div className="flex items-start gap-2">
            <textarea
              value={responseText}
              onChange={(e) => setResponseText(e.target.value)}
              placeholder="Write a public response…"
              rows={2}
              className="flex-1 rounded-xl border border-slate-200 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] resize-y"
            />
            <button
              type="button"
              onClick={submitResponse}
              disabled={busy || !responseText.trim()}
              className="shrink-0 inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white px-3.5 py-2 rounded-xl text-[13px] font-semibold transition-colors disabled:opacity-60"
            >
              <MessageSquareReply className="w-3.5 h-3.5" /> {review.vendor_response ? 'Update' : 'Reply'}
            </button>
          </div>
        </div>
      )}
    </Card>
  );
}

function BillingTab({ subscription, toolSlug }: { subscription: SubscriptionRow | null; toolSlug: string }) {
  const [opening, setOpening] = useState(false);

  async function openPortal() {
    setOpening(true);
    const res = await vendorDashboard.openBillingPortal(`${window.location.origin}/vendor/dashboard`);
    setOpening(false);
    if (res.ok && res.url) window.location.href = res.url;
  }

  if (!subscription) {
    return <Card><p className="text-sm text-slate-500 text-center py-6">No billing history found for this listing.</p></Card>;
  }

  return (
    <Card>
      <div className="flex items-center gap-3 mb-4">
        <div className="w-10 h-10 rounded-xl bg-[#EEF0FE] flex items-center justify-center"><CreditCard className="w-5 h-5 text-[#4F47E6]" /></div>
        <div>
          <p className="text-sm font-bold text-[#0B1221]">Featured placement — {toolSlug}</p>
          <p className={`text-[13px] font-medium ${subscription.status === 'active' ? 'text-emerald-600' : 'text-slate-500'}`}>
            {subscription.status === 'active' ? 'Active' : subscription.status === 'past_due' ? 'Payment past due' : subscription.status === 'canceled' ? 'Canceled' : subscription.status}
          </p>
        </div>
      </div>
      {subscription.current_period_end && (
        <p className="text-[13px] text-slate-500 mb-4">
          {subscription.status === 'canceled' ? 'Ended' : 'Renews'} on {new Date(subscription.current_period_end).toLocaleDateString()}
        </p>
      )}
      <button
        type="button"
        onClick={openPortal}
        disabled={opening || !subscription.stripe_customer_id}
        className="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white px-4 py-2.5 rounded-xl font-semibold text-sm transition-colors disabled:opacity-60"
      >
        {opening && <Loader2 className="w-4 h-4 animate-spin" />}
        Manage billing
      </button>
    </Card>
  );
}
