import { useEffect, useState } from 'react';
import { Search, ChevronLeft, ChevronRight, ExternalLink, ShieldCheck, RefreshCw, CreditCard } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface SubscriptionSummary {
  id: string;
  status: string;
  contact_email: string;
  stripe_subscription_id: string | null;
  current_period_end: string | null;
}

interface SessionRow {
  id: string;
  status: string;
  submitted_url: string | null;
  normalized_hostname: string | null;
  product_name_input: string | null;
  website_input: string | null;
  contact_email: string | null;
  matched_tool_id: string | null;
  matched_discovered_tool_id: string | null;
  is_new_product: boolean | null;
  created_at: string;
  subscription: SubscriptionSummary | null;
}

interface SaleRow {
  id: string;
  tool_id: string | null;
  discovered_tool_id: string | null;
  product: 'claim' | 'featured';
  billing_interval: 'one_time' | 'month' | 'year' | null;
  contact_email: string | null;
  stripe_subscription_id: string | null;
  stripe_checkout_session_id: string | null;
  current_period_end: string | null;
  created_at: string;
  estimated_amount_cents: number | null;
  tools: { name: string; slug: string } | null;
}

interface ListResponse { ok: boolean; data: SessionRow[]; total: number; page: number; page_size: number; }
interface SalesListResponse { ok: boolean; data: SaleRow[]; total: number; page: number; page_size: number; }
interface MutateResponse { ok: boolean; error?: string; token?: string }

function productLabel(product: string, billingInterval: string | null): string {
  if (product === 'claim') return 'Claim & Verify';
  return `Featured (${billingInterval === 'year' ? 'Yearly' : 'Monthly'})`;
}

function formatAmount(cents: number | null): string {
  if (cents == null) return '—';
  return `$${(cents / 100).toFixed(2)}`;
}

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

const STATUS_CHIPS = [
  { value: 'all', label: 'All' },
  { value: 'started', label: 'Started' },
  { value: 'url_submitted', label: 'URL submitted' },
  { value: 'matched_existing', label: 'Matched existing' },
  { value: 'matched_new', label: 'New product' },
  { value: 'contact_collected', label: 'Contact collected' },
  { value: 'checkout_pending', label: 'Checkout pending' },
  { value: 'checkout_completed', label: 'Checkout completed' },
  { value: 'verified', label: 'Verified' },
  { value: 'abandoned', label: 'Abandoned' },
];

function statusBadgeClass(status: string): string {
  if (status === 'checkout_completed' || status === 'verified') return 'bg-emerald-50 text-emerald-700';
  if (status === 'abandoned') return 'bg-slate-100 text-slate-500';
  if (status === 'checkout_pending') return 'bg-amber-50 text-amber-700';
  return 'bg-indigo-50 text-indigo-700';
}

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

export default function WpAdminVendorMonetizationPage() {
  const [tab, setTab] = useState<'sessions' | 'sales'>('sales');
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [message, setMessage] = useState<string | null>(null);
  const [busyId, setBusyId] = useState<string | null>(null);
  const [reasonDrafts, setReasonDrafts] = useState<Record<string, string>>({});

  useEffect(() => {
    const t = setTimeout(() => { setSearch(searchInput.trim()); setPage(1); }, DEBOUNCE_MS);
    return () => clearTimeout(t);
  }, [searchInput]);

  useEffect(() => { setPage(1); }, [tab]);

  const params = new URLSearchParams();
  if (search) params.set('q', search);
  if (tab === 'sessions' && statusFilter !== 'all') params.set('status', statusFilter);
  if (tab === 'sales') params.set('view', 'sales');
  params.set('page', String(page));
  params.set('per_page', String(PER_PAGE));
  const listPath = `admin-vendor-monetization?${params.toString()}`;

  const { data, state, error, refetch } = useAdminFetch<ListResponse>(listPath, { deps: [listPath], enabled: tab === 'sessions' });
  const { data: salesData, state: salesState, error: salesError, refetch: refetchSales } = useAdminFetch<SalesListResponse>(listPath, { deps: [listPath], enabled: tab === 'sales' });

  const { mutate: linkToTool } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-vendor-monetization', 'POST');
  const { mutate: resendVerification } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-vendor-monetization', 'POST');
  const { mutate: manualVerify } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-vendor-monetization', 'POST');
  const { mutate: toggleFeatured } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-vendor-monetization', 'POST');

  const rows = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  async function handleResend(subscriptionId: string) {
    setBusyId(subscriptionId);
    const res = await resendVerification({ action: 'resend_verification', subscription_id: subscriptionId });
    setBusyId(null);
    setMessage(res.data?.ok ? `New verification link generated: ${res.data.token}` : (res.data?.error || 'Failed to resend'));
  }

  async function handleManualVerify(subscriptionId: string) {
    const reason = reasonDrafts[subscriptionId]?.trim();
    if (!reason) { setMessage('Enter a reason before manually verifying.'); return; }
    setBusyId(subscriptionId);
    const res = await manualVerify({ action: 'manual_verify', subscription_id: subscriptionId, reason });
    setBusyId(null);
    setMessage(res.data?.ok ? 'Marked as manually verified.' : (res.data?.error || 'Failed'));
    if (res.data?.ok) refetch();
  }

  async function handleToggleFeatured(toolId: string, featured: boolean) {
    setBusyId(toolId);
    const res = await toggleFeatured({ action: 'toggle_featured', tool_id: toolId, featured });
    setBusyId(null);
    setMessage(res.data?.ok ? (featured ? 'Featured activated.' : 'Featured deactivated.') : (res.data?.error || 'Failed'));
    if (res.data?.ok) refetch();
  }

  async function handleLinkToTool(sessionId: string) {
    const toolId = window.prompt('Paste the tool ID to link this session to:');
    if (!toolId) return;
    setBusyId(sessionId);
    const res = await linkToTool({ action: 'link_to_tool', session_id: sessionId, tool_id: toolId });
    setBusyId(null);
    setMessage(res.data?.ok ? 'Linked to tool.' : (res.data?.error || 'Failed'));
    if (res.data?.ok) refetch();
  }

  const salesRows = salesData?.data || [];
  const salesTotal = salesData?.total || 0;
  const salesTotalPages = Math.max(1, Math.ceil(salesTotal / PER_PAGE));

  return (
    <WpAdminLayout title="Vendor Monetization" subtitle="Feature My Product sales, onboarding sessions, subscriptions, and verification">
      <div className="space-y-4">
        <div className="flex gap-1.5 border-b border-slate-200">
          <button
            type="button"
            onClick={() => setTab('sales')}
            className={`px-3.5 py-2 text-sm font-medium border-b-2 -mb-px transition-colors ${tab === 'sales' ? 'border-indigo-600 text-indigo-600' : 'border-transparent text-slate-500 hover:text-slate-700'}`}
          >
            Sales
          </button>
          <button
            type="button"
            onClick={() => setTab('sessions')}
            className={`px-3.5 py-2 text-sm font-medium border-b-2 -mb-px transition-colors ${tab === 'sessions' ? 'border-indigo-600 text-indigo-600' : 'border-transparent text-slate-500 hover:text-slate-700'}`}
          >
            Onboarding sessions
          </button>
        </div>

        <div className="flex flex-col sm:flex-row gap-3 sm:items-center sm:justify-between">
          <div className="relative flex-1 max-w-md">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
            <input
              type="text"
              placeholder={tab === 'sales' ? 'Search by customer email...' : 'Search by email, product, or domain...'}
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              className="w-full h-10 pl-9 pr-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
            />
          </div>
          <button type="button" onClick={() => (tab === 'sales' ? refetchSales() : refetch())} className="inline-flex items-center gap-1.5 px-3 py-2 rounded-lg text-xs font-medium text-slate-500 border border-slate-200 hover:bg-slate-50">
            <RefreshCw className="w-3.5 h-3.5" /> Refresh
          </button>
        </div>

        {tab === 'sessions' && (
          <div className="flex flex-wrap gap-1.5">
            {STATUS_CHIPS.map((chip) => (
              <button
                key={chip.value}
                type="button"
                onClick={() => { setStatusFilter(chip.value); setPage(1); }}
                className={`px-3 py-1.5 rounded-full text-xs font-medium transition-colors ${statusFilter === chip.value ? 'bg-indigo-600 text-white' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'}`}
              >
                {chip.label}
              </button>
            ))}
          </div>
        )}

        {message && (
          <div className="rounded-lg bg-indigo-50 border border-indigo-100 px-4 py-2.5 text-sm text-indigo-700 flex items-center justify-between">
            {message}
            <button type="button" onClick={() => setMessage(null)} className="text-indigo-400 hover:text-indigo-600">&times;</button>
          </div>
        )}

        {tab === 'sales' && (
          <>
            {salesState === 'loading' && <AdminLoadingState />}
            {salesState === 'error' && salesError && <AdminErrorBanner error={salesError} onRetry={refetchSales} />}
            {salesState === 'success' && salesRows.length === 0 && <AdminEmptyState title="No sales yet" message="No completed software-listing purchases match these filters." />}

            {salesState === 'success' && salesRows.length > 0 && (
              <div className="overflow-x-auto rounded-xl border border-slate-200">
                <table className="w-full text-sm">
                  <thead className="bg-slate-50 text-xs text-slate-500 uppercase tracking-wide">
                    <tr>
                      <th className="text-left px-4 py-2.5">Tool</th>
                      <th className="text-left px-4 py-2.5">Product</th>
                      <th className="text-left px-4 py-2.5">Amount</th>
                      <th className="text-left px-4 py-2.5">Customer</th>
                      <th className="text-left px-4 py-2.5">Stripe</th>
                      <th className="text-left px-4 py-2.5">Purchased</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100">
                    {salesRows.map((sale) => (
                      <tr key={sale.id} className="align-top">
                        <td className="px-4 py-3 max-w-[200px]">
                          {sale.tools ? (
                            <a href={`/tools/${sale.tools.slug}`} target="_blank" rel="noreferrer" className="font-medium text-slate-800 hover:text-indigo-600 truncate flex items-center gap-1">
                              {sale.tools.name} <ExternalLink className="w-3 h-3 shrink-0" />
                            </a>
                          ) : <span className="text-slate-400">—</span>}
                        </td>
                        <td className="px-4 py-3">
                          <span className={`px-2 py-1 rounded-full text-[11px] font-semibold ${sale.product === 'featured' ? 'bg-amber-50 text-amber-700' : 'bg-emerald-50 text-emerald-700'}`}>
                            {productLabel(sale.product, sale.billing_interval)}
                          </span>
                        </td>
                        <td className="px-4 py-3 font-medium text-slate-700">{formatAmount(sale.estimated_amount_cents)}</td>
                        <td className="px-4 py-3 text-slate-600">{sale.contact_email || '—'}</td>
                        <td className="px-4 py-3 text-[11px] text-slate-400 font-mono truncate max-w-[140px]">
                          {sale.stripe_subscription_id || sale.stripe_checkout_session_id || '—'}
                        </td>
                        <td className="px-4 py-3 text-slate-500 text-xs whitespace-nowrap">{formatDate(sale.created_at)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}

            {salesTotalPages > 1 && (
              <div className="flex items-center justify-between text-sm text-slate-500">
                <span>Page {page} of {salesTotalPages} ({salesTotal} total)</span>
                <div className="flex gap-2">
                  <button type="button" disabled={page <= 1} onClick={() => setPage((p) => p - 1)} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40"><ChevronLeft className="w-4 h-4" /></button>
                  <button type="button" disabled={page >= salesTotalPages} onClick={() => setPage((p) => p + 1)} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40"><ChevronRight className="w-4 h-4" /></button>
                </div>
              </div>
            )}
          </>
        )}

        {tab === 'sessions' && state === 'loading' && <AdminLoadingState />}
        {tab === 'sessions' && state === 'error' && error && <AdminErrorBanner error={error} onRetry={refetch} />}
        {tab === 'sessions' && state === 'success' && rows.length === 0 && <AdminEmptyState title="No sessions" message="No vendor onboarding sessions match these filters." />}

        {tab === 'sessions' && state === 'success' && rows.length > 0 && (
          <div className="overflow-x-auto rounded-xl border border-slate-200">
            <table className="w-full text-sm">
              <thead className="bg-slate-50 text-xs text-slate-500 uppercase tracking-wide">
                <tr>
                  <th className="text-left px-4 py-2.5">Product / Domain</th>
                  <th className="text-left px-4 py-2.5">Contact</th>
                  <th className="text-left px-4 py-2.5">Funnel status</th>
                  <th className="text-left px-4 py-2.5">Subscription</th>
                  <th className="text-left px-4 py-2.5">Created</th>
                  <th className="text-left px-4 py-2.5">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {rows.map((row) => (
                  <tr key={row.id} className="align-top">
                    <td className="px-4 py-3 max-w-[220px]">
                      <div className="font-medium text-slate-800 truncate">{row.product_name_input || row.normalized_hostname || '—'}</div>
                      <div className="text-xs text-slate-400 truncate flex items-center gap-1">
                        {row.normalized_hostname}
                        {row.website_input && <a href={row.website_input} target="_blank" rel="noreferrer"><ExternalLink className="w-3 h-3" /></a>}
                      </div>
                      {!row.matched_tool_id && row.is_new_product && (
                        <button type="button" onClick={() => handleLinkToTool(row.id)} className="mt-1 text-[11px] font-medium text-indigo-600 hover:underline">
                          Link to existing tool
                        </button>
                      )}
                    </td>
                    <td className="px-4 py-3 text-slate-600">{row.contact_email || row.subscription?.contact_email || '—'}</td>
                    <td className="px-4 py-3">
                      <span className={`px-2 py-1 rounded-full text-[11px] font-semibold ${statusBadgeClass(row.status)}`}>{row.status}</span>
                    </td>
                    <td className="px-4 py-3">
                      {row.subscription ? (
                        <div className="space-y-1">
                          <span className={`px-2 py-1 rounded-full text-[11px] font-semibold ${statusBadgeClass(row.subscription.status)}`}>{row.subscription.status}</span>
                          {row.subscription.stripe_subscription_id && (
                            <div className="text-[11px] text-slate-400 font-mono truncate max-w-[140px]">{row.subscription.stripe_subscription_id}</div>
                          )}
                        </div>
                      ) : <span className="text-slate-300">—</span>}
                    </td>
                    <td className="px-4 py-3 text-slate-500 text-xs whitespace-nowrap">{formatDate(row.created_at)}</td>
                    <td className="px-4 py-3">
                      {row.subscription && (
                        <div className="flex flex-col gap-1.5 min-w-[160px]">
                          <button
                            type="button"
                            disabled={busyId === row.subscription.id}
                            onClick={() => handleResend(row.subscription!.id)}
                            className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 hover:text-indigo-600"
                          >
                            <RefreshCw className="w-3 h-3" /> Resend verification
                          </button>
                          <div className="flex items-center gap-1">
                            <input
                              type="text"
                              placeholder="Reason..."
                              value={reasonDrafts[row.subscription.id] || ''}
                              onChange={(e) => setReasonDrafts((d) => ({ ...d, [row.subscription!.id]: e.target.value }))}
                              className="w-20 h-6 px-1.5 rounded border border-slate-200 text-[11px]"
                            />
                            <button
                              type="button"
                              disabled={busyId === row.subscription.id}
                              onClick={() => handleManualVerify(row.subscription!.id)}
                              className="inline-flex items-center gap-1 text-[11px] font-medium text-emerald-600 hover:underline whitespace-nowrap"
                            >
                              <ShieldCheck className="w-3 h-3" /> Verify
                            </button>
                          </div>
                          {row.matched_tool_id && (
                            <div className="flex items-center gap-2">
                              <button type="button" disabled={busyId === row.matched_tool_id} onClick={() => handleToggleFeatured(row.matched_tool_id!, true)} className="text-[11px] font-medium text-indigo-600 hover:underline">Activate</button>
                              <button type="button" disabled={busyId === row.matched_tool_id} onClick={() => handleToggleFeatured(row.matched_tool_id!, false)} className="text-[11px] font-medium text-slate-400 hover:underline">Deactivate</button>
                            </div>
                          )}
                        </div>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {tab === 'sessions' && totalPages > 1 && (
          <div className="flex items-center justify-between text-sm text-slate-500">
            <span>Page {page} of {totalPages} ({total} total)</span>
            <div className="flex gap-2">
              <button type="button" disabled={page <= 1} onClick={() => setPage((p) => p - 1)} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40"><ChevronLeft className="w-4 h-4" /></button>
              <button type="button" disabled={page >= totalPages} onClick={() => setPage((p) => p + 1)} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40"><ChevronRight className="w-4 h-4" /></button>
            </div>
          </div>
        )}

        <p className="flex items-center gap-1.5 text-xs text-slate-400 pt-2">
          <CreditCard className="w-3.5 h-3.5" />
          Stripe checkout/subscription IDs shown above are the source of truth in the Stripe Dashboard — cross-check there for full billing detail.
        </p>
      </div>
    </WpAdminLayout>
  );
}
