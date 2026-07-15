import { useCallback, useEffect, useState } from 'react';
import { ArrowLeft, ExternalLink, Eye, MousePointerClick, Search } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

interface ToolSummaryRow {
  tool_id: string;
  views_total: number;
  views_7d: number;
  views_30d: number;
  clicks_total: number;
  clicks_7d: number;
  clicks_30d: number;
  tool: { id: string; slug: string; name: string; logo: string | null };
}

interface EventRow {
  id: string;
  ip_address: string | null;
  country_code: string | null;
  country_name: string | null;
  referrer: string | null;
  created_at: string;
  link_type?: string;
  destination_url?: string;
}

interface CountryCount {
  country_code: string | null;
  country_name: string | null;
  count: number;
}

interface ToolDetail {
  tool: { id: string; slug: string; name: string; logo: string | null };
  counts: { views_total: number; clicks_total: number };
  recent_views: EventRow[];
  recent_clicks: EventRow[];
  view_countries: CountryCount[];
  click_countries: CountryCount[];
}

function ctr(views: number, clicks: number): string {
  if (views === 0) return '—';
  return `${((clicks / views) * 100).toFixed(1)}%`;
}

// Real, per-event tool analytics — page views (tool_page_views) and
// outbound "Visit Website" clicks (tool_outbound_clicks), fed by the
// public track-tool-event edge function via the Netlify geo-capture relay
// (netlify/edge-functions/track-event.js). This page is read-only.
export default function WpAdminToolAnalyticsPage() {
  const [tools, setTools] = useState<ToolSummaryRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');

  const [selectedSlug, setSelectedSlug] = useState<string | null>(null);
  const [detail, setDetail] = useState<ToolDetail | null>(null);
  const [detailLoading, setDetailLoading] = useState(false);
  const [detailTab, setDetailTab] = useState<'views' | 'clicks'>('clicks');

  const fetchSummary = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; tools: ToolSummaryRow[]; error?: string }>('admin-tool-analytics');
    if (result.ok && result.data?.ok) {
      setTools(result.data.tools);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load analytics'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchSummary();
  }, [fetchSummary]);

  useEffect(() => {
    if (!selectedSlug) {
      setDetail(null);
      return;
    }
    setDetailLoading(true);
    adminApiFetch<{ ok: boolean } & ToolDetail>(`admin-tool-analytics?tool_slug=${encodeURIComponent(selectedSlug)}`).then((result) => {
      if (result.ok && result.data?.ok) setDetail(result.data);
      setDetailLoading(false);
    });
  }, [selectedSlug]);

  const filtered = tools.filter((row) => row.tool.name.toLowerCase().includes(search.trim().toLowerCase()));

  return (
    <WpAdminLayout title="Tool Analytics" subtitle="Page views and outbound 'Visit Website' clicks, per tool">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        {!selectedSlug ? (
          <>
            <div className="relative">
              <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Filter by tool name..."
                className="w-full h-10 pl-10 pr-3 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>

            {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

            {loading ? (
              <p className="text-sm text-slate-400">Loading…</p>
            ) : filtered.length === 0 ? (
              <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">
                {tools.length === 0 ? 'No tracked activity yet — views and clicks will appear here once real visitors show up.' : 'No tools match that filter.'}
              </p>
            ) : (
              <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-slate-100 text-left text-xs font-semibold uppercase tracking-wide text-slate-400">
                      <th className="px-4 py-3">Tool</th>
                      <th className="px-4 py-3 text-right">Views (7d / 30d / all)</th>
                      <th className="px-4 py-3 text-right">Clicks (7d / 30d / all)</th>
                      <th className="px-4 py-3 text-right">CTR</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filtered.map((row) => (
                      <tr
                        key={row.tool_id}
                        onClick={() => setSelectedSlug(row.tool.slug)}
                        className="border-b border-slate-50 last:border-0 hover:bg-slate-50 cursor-pointer transition-colors"
                      >
                        <td className="px-4 py-3">
                          <div className="flex items-center gap-2.5">
                            {row.tool.logo ? (
                              <img src={row.tool.logo} alt="" className="w-7 h-7 rounded-lg object-contain border border-slate-100" />
                            ) : (
                              <div className="w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center text-[11px] font-semibold text-slate-400">{row.tool.name.charAt(0)}</div>
                            )}
                            <span className="font-medium text-[#0B1221]">{row.tool.name}</span>
                          </div>
                        </td>
                        <td className="px-4 py-3 text-right tabular-nums text-slate-600">{row.views_7d} / {row.views_30d} / {row.views_total}</td>
                        <td className="px-4 py-3 text-right tabular-nums text-slate-600">{row.clicks_7d} / {row.clicks_30d} / {row.clicks_total}</td>
                        <td className="px-4 py-3 text-right tabular-nums font-medium text-[#0B1221]">{ctr(row.views_total, row.clicks_total)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </>
        ) : (
          <div>
            <button type="button" onClick={() => setSelectedSlug(null)} className="inline-flex items-center gap-1.5 text-sm font-medium text-slate-500 hover:text-[#0B1221] mb-4 transition-colors">
              <ArrowLeft className="w-4 h-4" /> Back to all tools
            </button>

            {detailLoading || !detail ? (
              <p className="text-sm text-slate-400">Loading…</p>
            ) : (
              <div className="space-y-5">
                <div className="flex items-center gap-3">
                  {detail.tool.logo ? (
                    <img src={detail.tool.logo} alt="" className="w-10 h-10 rounded-xl object-contain border border-slate-100" />
                  ) : (
                    <div className="w-10 h-10 rounded-xl bg-slate-100 flex items-center justify-center text-sm font-semibold text-slate-400">{detail.tool.name.charAt(0)}</div>
                  )}
                  <div>
                    <h2 className="font-bold text-[#0B1221]">{detail.tool.name}</h2>
                    <a href={`https://gappsy.netlify.app/tools/${detail.tool.slug}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-indigo-600 hover:text-indigo-700">
                      View live listing <ExternalLink className="w-3 h-3" />
                    </a>
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="bg-white border border-slate-200 rounded-xl p-4">
                    <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1 flex items-center gap-1.5"><Eye className="w-3.5 h-3.5" /> Page views</p>
                    <p className="text-2xl font-bold text-[#0B1221] tabular-nums">{detail.counts.views_total.toLocaleString()}</p>
                  </div>
                  <div className="bg-white border border-slate-200 rounded-xl p-4">
                    <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1 flex items-center gap-1.5"><MousePointerClick className="w-3.5 h-3.5" /> Outbound clicks</p>
                    <p className="text-2xl font-bold text-[#0B1221] tabular-nums">{detail.counts.clicks_total.toLocaleString()}</p>
                  </div>
                </div>

                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-3">Top countries</p>
                  <div className="grid grid-cols-2 gap-6">
                    <div>
                      <p className="text-xs font-medium text-slate-500 mb-2">Page views</p>
                      <CountryBars countries={detail.view_countries} />
                    </div>
                    <div>
                      <p className="text-xs font-medium text-slate-500 mb-2">Outbound clicks</p>
                      <CountryBars countries={detail.click_countries} />
                    </div>
                  </div>
                </div>

                <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
                  <div className="flex border-b border-slate-100">
                    <button type="button" onClick={() => setDetailTab('clicks')} className={`flex-1 px-4 py-2.5 text-sm font-medium transition-colors ${detailTab === 'clicks' ? 'text-indigo-600 bg-indigo-50' : 'text-slate-500 hover:bg-slate-50'}`}>
                      Recent clicks
                    </button>
                    <button type="button" onClick={() => setDetailTab('views')} className={`flex-1 px-4 py-2.5 text-sm font-medium transition-colors ${detailTab === 'views' ? 'text-indigo-600 bg-indigo-50' : 'text-slate-500 hover:bg-slate-50'}`}>
                      Recent views
                    </button>
                  </div>
                  <EventTable events={detailTab === 'clicks' ? detail.recent_clicks : detail.recent_views} showLinkType={detailTab === 'clicks'} />
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

function CountryBars({ countries }: { countries: CountryCount[] }) {
  if (countries.length === 0) return <p className="text-xs text-slate-400">No data yet.</p>;
  const max = Math.max(...countries.map((c) => c.count), 1);
  return (
    <div className="space-y-1.5">
      {countries.map((c) => (
        <div key={c.country_code || c.country_name || 'unknown'} className="flex items-center gap-2 text-xs">
          <span className="w-8 shrink-0 font-medium text-slate-600">{c.country_code || '—'}</span>
          <div className="flex-1 h-1.5 rounded-full bg-slate-100 overflow-hidden">
            <div className="h-full bg-indigo-400 rounded-full" style={{ width: `${(c.count / max) * 100}%` }} />
          </div>
          <span className="w-6 shrink-0 text-right tabular-nums text-slate-500">{c.count}</span>
        </div>
      ))}
    </div>
  );
}

function EventTable({ events, showLinkType }: { events: EventRow[]; showLinkType: boolean }) {
  if (events.length === 0) return <p className="text-sm text-slate-400 p-6 text-center">Nothing recorded yet.</p>;
  return (
    <div className="overflow-x-auto">
      <table className="w-full text-xs">
        <thead>
          <tr className="text-left text-slate-400 border-b border-slate-100">
            <th className="px-4 py-2 font-semibold">When</th>
            <th className="px-4 py-2 font-semibold">Country</th>
            <th className="px-4 py-2 font-semibold">IP</th>
            {showLinkType && <th className="px-4 py-2 font-semibold">Link</th>}
            <th className="px-4 py-2 font-semibold">Referrer</th>
          </tr>
        </thead>
        <tbody>
          {events.map((e) => (
            <tr key={e.id} className="border-b border-slate-50 last:border-0">
              <td className="px-4 py-2 whitespace-nowrap text-slate-600">{new Date(e.created_at).toLocaleString()}</td>
              <td className="px-4 py-2 text-slate-600">{e.country_name || e.country_code || '—'}</td>
              <td className="px-4 py-2 text-slate-500 font-mono">{e.ip_address || '—'}</td>
              {showLinkType && <td className="px-4 py-2 text-slate-500">{e.link_type || '—'}</td>}
              <td className="px-4 py-2 text-slate-500 truncate max-w-[200px]">{e.referrer || '—'}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
