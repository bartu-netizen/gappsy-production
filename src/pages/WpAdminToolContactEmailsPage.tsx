import { useCallback, useEffect, useState } from 'react';
import * as XLSX from 'xlsx';
import { Mail, Download, ExternalLink, FileSpreadsheet, Send, CheckCircle2, XCircle, Clock } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

type Source = 'listed' | 'discovered';

interface ToolRef { id: string; slug: string; name: string; website: string | null; official_website?: string | null }
interface EmailRow {
  tool_id: string; email: string; source_url: string | null; discovered_at: string; tool: ToolRef; profile_url: string | null;
  listclean_status: string | null; listclean_external_status: string | null;
  smartlead_campaign_id: string | null; smartlead_synced_at: string | null;
}
interface Progress { eligible_total: number; done: number; failed: number; pending: number }
interface ListcleanSummary { valid: number; invalid: number; pending: number; failed: number; synced_to_smartlead: number }
interface Response { ok: boolean; progress: Progress; listclean: ListcleanSummary; emails: EmailRow[]; total_emails: number; error?: string }

function exportFilename(source: Source, ext: string): string {
  const label = source === 'discovered' ? 'not-yet-listed-tool-scraped-emails' : 'software-tool-scraped-emails';
  return `${label}-${new Date().toISOString().slice(0, 10)}.${ext}`;
}

// Read-only view of what the email_discovery_scan scheduled job finds by
// crawling each paid (non-open-source) tool's own website (see
// _shared/schedulerRegistry.ts + _shared/emailExtraction.ts). Runs
// automatically in the background every 5 minutes — this page is for
// tracking progress and pulling a CSV for outreach, not triggering anything.
export default function WpAdminToolContactEmailsPage() {
  const [source, setSource] = useState<Source>('listed');
  const [data, setData] = useState<Response | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [exporting, setExporting] = useState(false);
  const [campaignIds, setCampaignIds] = useState<Record<Source, string>>({ listed: '', discovered: '' });
  const [syncing, setSyncing] = useState(false);
  const [syncResult, setSyncResult] = useState<string | null>(null);
  const campaignId = campaignIds[source];

  const fetchData = useCallback(async (forSource: Source) => {
    setLoading(true);
    setError(null);
    setSyncResult(null);
    const result = await adminApiFetch<Response>(`admin-tool-contact-emails?source=${forSource}`);
    if (result.ok && result.data?.ok) {
      setData(result.data);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load emails'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchData(source);
  }, [fetchData, source]);

  async function handleExportCsv(format: 'csv' | 'listclean') {
    setExporting(true);
    try {
      const token = localStorage.getItem('gappsy_admin_token');
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-tool-contact-emails?format=${format}&source=${source}`, {
        headers: {
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          ...(token ? { 'x-admin-token': token } : {}),
        },
      });
      if (!res.ok) throw new Error(`Export failed (${res.status})`);
      const csv = await res.text();
      const blob = new Blob([csv], { type: 'text/csv' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = format === 'listclean' ? `${source}-tool-emails-listclean-${new Date().toISOString().slice(0, 10)}.csv` : exportFilename(source, 'csv');
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setExporting(false);
    }
  }

  // Built from the same rows already loaded for the table — one row per
  // email (a tool with 3 emails appears 3 times), same shape as the CSV.
  function handleExportExcel() {
    if (!data) return;
    const rows = data.emails.map((r) => ({
      tool_name: r.tool.name,
      tool_slug: r.tool.slug,
      profile_url: r.profile_url || '',
      tool_website: r.tool.website || r.tool.official_website || '',
      email: r.email,
      source_url: r.source_url || '',
      discovered_at: r.discovered_at,
    }));
    const sheet = XLSX.utils.json_to_sheet(rows);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, sheet, 'Emails');
    XLSX.writeFile(workbook, exportFilename(source, 'xlsx'));
  }

  async function handleSyncToSmartlead() {
    if (!campaignId.trim()) return;
    setSyncing(true);
    setSyncResult(null);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; synced?: number; note?: string; error?: string }>('admin-tool-contact-emails', {
      method: 'POST',
      body: { action: 'sync_to_smartlead', campaign_id: campaignId.trim(), source },
    });
    if (result.ok && result.data?.ok) {
      setSyncResult(result.data.note || `Sent ${result.data.synced ?? 0} clean email${result.data.synced === 1 ? '' : 's'} to Smartlead campaign ${campaignId.trim()}.`);
      fetchData(source);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to sync to Smartlead'));
    }
    setSyncing(false);
  }

  const progress = data?.progress;
  const pct = progress && progress.eligible_total > 0 ? Math.round(((progress.done + progress.failed) / progress.eligible_total) * 100) : 0;

  return (
    <WpAdminLayout title="Software Tool Scraped Emails" subtitle="Real emails found on each tool's own website, for vendor outreach">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        <div role="tablist" aria-label="Email source" className="inline-flex p-1 bg-slate-100 rounded-lg">
          <button
            type="button"
            role="tab"
            aria-selected={source === 'listed'}
            onClick={() => setSource('listed')}
            className={`px-4 py-1.5 rounded-md text-sm font-semibold transition-colors ${source === 'listed' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-700'}`}
          >
            Listed on Gappsy
          </button>
          <button
            type="button"
            role="tab"
            aria-selected={source === 'discovered'}
            onClick={() => setSource('discovered')}
            className={`px-4 py-1.5 rounded-md text-sm font-semibold transition-colors ${source === 'discovered' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-700'}`}
          >
            Not Yet Listed
          </button>
        </div>

        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : !data ? null : (
          <>
            <div className="bg-white border border-slate-200 rounded-xl p-4">
              <div className="flex items-center justify-between mb-2">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">
                  Scan progress &mdash; {progress!.done + progress!.failed} / {progress!.eligible_total} {source === 'discovered' ? 'not-yet-listed candidates' : 'paid tools'} checked ({pct}%)
                </p>
                <div className="flex items-center gap-3">
                  <button
                    type="button"
                    onClick={() => handleExportCsv('listclean')}
                    disabled={exporting || data.emails.length === 0}
                    className="flex items-center gap-1.5 text-xs font-medium text-emerald-600 hover:text-emerald-700 disabled:opacity-40 disabled:cursor-not-allowed"
                    title="email, email_normalized, tool_id, tool_slug, profile_url — one row per email"
                  >
                    <Download className="w-3.5 h-3.5" /> {exporting ? 'Exporting…' : 'Export for ListClean'}
                  </button>
                  <button
                    type="button"
                    onClick={() => handleExportCsv('csv')}
                    disabled={exporting || data.emails.length === 0}
                    className="flex items-center gap-1.5 text-xs font-medium text-indigo-600 hover:text-indigo-700 disabled:opacity-40 disabled:cursor-not-allowed"
                  >
                    <Download className="w-3.5 h-3.5" /> Export CSV
                  </button>
                  <button
                    type="button"
                    onClick={handleExportExcel}
                    disabled={data.emails.length === 0}
                    className="flex items-center gap-1.5 text-xs font-medium text-indigo-600 hover:text-indigo-700 disabled:opacity-40 disabled:cursor-not-allowed"
                  >
                    <FileSpreadsheet className="w-3.5 h-3.5" /> Export Excel
                  </button>
                </div>
              </div>
              <div className="h-2 rounded-full bg-slate-100 overflow-hidden">
                <div className="h-full rounded-full bg-indigo-400" style={{ width: `${pct}%` }} />
              </div>
              <div className="flex items-center gap-4 mt-2 text-xs text-slate-500">
                <span>{progress!.done} done</span>
                <span>{progress!.failed} no email found</span>
                <span>{progress!.pending} pending</span>
                <span className="ml-auto font-medium text-[#0B1221]">{data.total_emails} email{data.total_emails === 1 ? '' : 's'} found</span>
              </div>
              <p className="text-[11px] text-slate-400 mt-2">
                Runs automatically in the background (a scheduled job crawls a few tools every 5 minutes) &mdash; nothing to trigger here.
              </p>
            </div>

            <div className="bg-white border border-slate-200 rounded-xl p-4">
              <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-2">
                ListClean verification &mdash; runs automatically every 5 minutes
              </p>
              <div className="flex items-center gap-4 text-xs text-slate-600 mb-4">
                <span className="inline-flex items-center gap-1"><CheckCircle2 className="w-3.5 h-3.5 text-emerald-500" /> {data.listclean.valid} clean</span>
                <span className="inline-flex items-center gap-1"><XCircle className="w-3.5 h-3.5 text-rose-400" /> {data.listclean.invalid} dirty</span>
                <span className="inline-flex items-center gap-1"><Clock className="w-3.5 h-3.5 text-slate-300" /> {data.listclean.pending} pending</span>
                {data.listclean.failed > 0 && <span className="text-slate-400">{data.listclean.failed} gave up</span>}
                <span className="ml-auto font-medium text-[#0B1221]">{data.listclean.synced_to_smartlead} already sent to Smartlead</span>
              </div>

              <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-2">
                Send clean emails to a Smartlead campaign
              </p>
              <div className="flex items-center gap-2">
                <input
                  type="text"
                  value={campaignId}
                  onChange={(e) => setCampaignIds((prev) => ({ ...prev, [source]: e.target.value }))}
                  placeholder={source === 'discovered' ? 'Smartlead campaign ID (Not Yet Listed outreach)' : 'Smartlead campaign ID (Software Tool Listed On Gappsy)'}
                  className="flex-1 px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
                <button
                  type="button"
                  onClick={handleSyncToSmartlead}
                  disabled={syncing || !campaignId.trim() || data.listclean.valid === 0}
                  className="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] disabled:opacity-40 disabled:cursor-not-allowed transition-colors shrink-0"
                >
                  <Send className="w-3.5 h-3.5" /> {syncing ? 'Sending…' : 'Send to Smartlead'}
                </button>
              </div>
              <p className="text-[11px] text-slate-400 mt-1.5">
                Only sends emails ListClean marked clean (valid) and not already sent — safe to click again later as more emails clear verification.
              </p>
              {syncResult && <p className="text-[12.5px] text-emerald-600 mt-2">{syncResult}</p>}
            </div>

            {data.emails.length === 0 ? (
              <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">
                No emails found yet &mdash; check back once the scan has processed more tools.
              </p>
            ) : (
              <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
                <div className="overflow-x-auto">
                  <table className="w-full text-xs">
                    <thead>
                      <tr className="text-left text-slate-400 border-b border-slate-100">
                        <th className="px-4 py-2 font-semibold">Tool</th>
                        <th className="px-4 py-2 font-semibold">Profile</th>
                        <th className="px-4 py-2 font-semibold">Email</th>
                        <th className="px-4 py-2 font-semibold">Found on</th>
                        <th className="px-4 py-2 font-semibold">Discovered</th>
                        <th className="px-4 py-2 font-semibold">ListClean</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data.emails.map((row, i) => (
                        <tr key={`${row.tool_id}-${row.email}-${i}`} className="border-b border-slate-50 last:border-0">
                          <td className="px-4 py-2 text-slate-700 font-medium">{row.tool.name}</td>
                          <td className="px-4 py-2 text-slate-400">
                            {row.profile_url ? (
                              <a href={row.profile_url} target="_blank" rel="noopener noreferrer" className="hover:text-indigo-600 inline-flex items-center gap-1">
                                Profile <ExternalLink className="w-3 h-3 shrink-0" />
                              </a>
                            ) : (row.tool.official_website || row.tool.website) ? (
                              <a href={row.tool.official_website || row.tool.website!} target="_blank" rel="noopener noreferrer" className="hover:text-indigo-600 inline-flex items-center gap-1">
                                Website <ExternalLink className="w-3 h-3 shrink-0" />
                              </a>
                            ) : '—'}
                          </td>
                          <td className="px-4 py-2 text-slate-600 font-mono flex items-center gap-1.5">
                            <Mail className="w-3.5 h-3.5 text-slate-300 shrink-0" /> {row.email}
                          </td>
                          <td className="px-4 py-2 text-slate-400 truncate max-w-[260px]">
                            {row.source_url ? (
                              <a href={row.source_url} target="_blank" rel="noopener noreferrer" className="hover:text-indigo-600 inline-flex items-center gap-1">
                                {row.source_url} <ExternalLink className="w-3 h-3 shrink-0" />
                              </a>
                            ) : '—'}
                          </td>
                          <td className="px-4 py-2 whitespace-nowrap text-slate-500">{new Date(row.discovered_at).toLocaleString()}</td>
                          <td className="px-4 py-2 whitespace-nowrap">
                            {row.listclean_status === 'valid' ? (
                              <span className="inline-flex items-center gap-1 text-emerald-600"><CheckCircle2 className="w-3.5 h-3.5" /> clean</span>
                            ) : row.listclean_status === 'invalid' ? (
                              <span className="inline-flex items-center gap-1 text-rose-500"><XCircle className="w-3.5 h-3.5" /> dirty</span>
                            ) : row.listclean_status === 'failed' ? (
                              <span className="inline-flex items-center gap-1 text-rose-400"><XCircle className="w-3.5 h-3.5" /> gave up</span>
                            ) : (
                              <span className="inline-flex items-center gap-1 text-slate-300"><Clock className="w-3.5 h-3.5" /> {row.listclean_status === 'submitted' ? 'checking' : 'pending'}</span>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
