import { useCallback, useEffect, useState } from 'react';
import { Mail, Download, ExternalLink } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface ToolRef { id: string; slug: string; name: string; website: string | null }
interface EmailRow { tool_id: string; email: string; source_url: string | null; discovered_at: string; tool: ToolRef }
interface Progress { eligible_total: number; done: number; failed: number; pending: number }
interface Response { ok: boolean; progress: Progress; emails: EmailRow[]; total_emails: number; error?: string }

// Read-only view of what the email_discovery_scan scheduled job finds by
// crawling each paid (non-open-source) tool's own website (see
// _shared/schedulerRegistry.ts + _shared/emailExtraction.ts). Runs
// automatically in the background every 5 minutes — this page is for
// tracking progress and pulling a CSV for outreach, not triggering anything.
export default function WpAdminToolContactEmailsPage() {
  const [data, setData] = useState<Response | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [exporting, setExporting] = useState(false);

  const fetchData = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<Response>('admin-tool-contact-emails');
    if (result.ok && result.data?.ok) {
      setData(result.data);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load emails'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  async function handleExport() {
    setExporting(true);
    try {
      const token = localStorage.getItem('gappsy_admin_token');
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-tool-contact-emails?format=csv`, {
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
      a.download = `tool-contact-emails-${new Date().toISOString().slice(0, 10)}.csv`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setExporting(false);
    }
  }

  const progress = data?.progress;
  const pct = progress && progress.eligible_total > 0 ? Math.round(((progress.done + progress.failed) / progress.eligible_total) * 100) : 0;

  return (
    <WpAdminLayout title="Tool Contact Emails" subtitle="Real emails found on each paid tool's own website, for vendor outreach">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : !data ? null : (
          <>
            <div className="bg-white border border-slate-200 rounded-xl p-4">
              <div className="flex items-center justify-between mb-2">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">
                  Scan progress &mdash; {progress!.done + progress!.failed} / {progress!.eligible_total} paid tools checked ({pct}%)
                </p>
                <button
                  type="button"
                  onClick={handleExport}
                  disabled={exporting || data.emails.length === 0}
                  className="flex items-center gap-1.5 text-xs font-medium text-indigo-600 hover:text-indigo-700 disabled:opacity-40 disabled:cursor-not-allowed"
                >
                  <Download className="w-3.5 h-3.5" /> {exporting ? 'Exporting…' : 'Export CSV'}
                </button>
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
                        <th className="px-4 py-2 font-semibold">Email</th>
                        <th className="px-4 py-2 font-semibold">Found on</th>
                        <th className="px-4 py-2 font-semibold">Discovered</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data.emails.map((row, i) => (
                        <tr key={`${row.tool_id}-${row.email}-${i}`} className="border-b border-slate-50 last:border-0">
                          <td className="px-4 py-2 text-slate-700 font-medium">{row.tool.name}</td>
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
                          <td className="px-4 py-2 whitespace-nowrap text-slate-500">{new Date(row.discovered_at).toLocaleDateString()}</td>
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
