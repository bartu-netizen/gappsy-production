import { useEffect, useState, useCallback } from 'react';
import { AlertCircle, RefreshCw, ChevronLeft, ChevronRight, Search, Filter, Mail, MousePointer, Eye, X } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmMessage, STATUS_COLORS } from '../../hooks/useEmailMarketing';

const STATUS_OPTIONS = ['', 'queued', 'sent', 'failed', 'bounced', 'suppressed'];
const PER_PAGE = 50;

type MessageDetail = {
  message: any;
  events: any[];
};

function MessageDetailDrawer({ messageId, onClose }: { messageId: string; onClose: () => void }) {
  const [data, setData] = useState<MessageDetail | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    emApi.get(`logs/${messageId}`)
      .then(res => setData(res))
      .catch(() => setData(null))
      .finally(() => setLoading(false));
  }, [messageId]);

  const opens = data?.events.filter((e: any) => e.event_type === 'open').length ?? 0;
  const clicks = data?.events.filter((e: any) => e.event_type === 'click').length ?? 0;

  return (
    <div className="fixed inset-0 z-40 flex justify-end">
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={onClose} />
      <aside className="relative flex flex-col w-full max-w-md bg-white shadow-2xl h-full overflow-hidden">
        <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100">
          <p className="font-semibold text-slate-900 text-sm">Message Detail</p>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
        </div>
        <div className="flex-1 overflow-y-auto p-5 space-y-5">
          {loading ? (
            <div className="space-y-3">{[...Array(5)].map((_, i) => <div key={i} className="h-8 bg-slate-100 rounded animate-pulse" />)}</div>
          ) : !data ? (
            <p className="text-sm text-slate-400 text-center py-8">Failed to load message details</p>
          ) : (
            <>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-slate-500">To</span>
                  <span className="font-medium text-slate-800">{data.message.to_email}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-slate-500">From</span>
                  <span className="font-medium text-slate-800">{data.message.from_name} &lt;{data.message.from_email}&gt;</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-slate-500">Subject</span>
                  <span className="font-medium text-slate-800 text-right max-w-[60%]">{data.message.subject_rendered}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-slate-500">Status</span>
                  <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[data.message.status] ?? 'bg-slate-100 text-slate-600'}`}>{data.message.status}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-slate-500">Sent</span>
                  <span className="text-slate-700">{data.message.sent_at ? new Date(data.message.sent_at).toLocaleString() : '—'}</span>
                </div>
                {data.message.error && (
                  <div className="flex justify-between text-sm">
                    <span className="text-slate-500">Error</span>
                    <span className="text-red-600 text-right max-w-[60%] text-xs">{data.message.error}</span>
                  </div>
                )}
              </div>

              <div className="grid grid-cols-2 gap-3">
                <div className="bg-slate-50 rounded-xl p-4 text-center">
                  <Eye className="w-5 h-5 text-sky-500 mx-auto mb-1" />
                  <p className="text-2xl font-bold text-slate-900">{opens}</p>
                  <p className="text-xs text-slate-500 mt-0.5">Opens</p>
                </div>
                <div className="bg-slate-50 rounded-xl p-4 text-center">
                  <MousePointer className="w-5 h-5 text-emerald-500 mx-auto mb-1" />
                  <p className="text-2xl font-bold text-slate-900">{clicks}</p>
                  <p className="text-xs text-slate-500 mt-0.5">Clicks</p>
                </div>
              </div>

              {data.events.length > 0 && (
                <div>
                  <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2">Event Timeline</p>
                  <div className="space-y-2">
                    {data.events.map((ev: any) => (
                      <div key={ev.id} className="flex items-start gap-3 p-3 bg-slate-50 rounded-lg">
                        <div className={`w-2 h-2 rounded-full mt-1.5 shrink-0 ${ev.event_type === 'open' ? 'bg-sky-400' : ev.event_type === 'click' ? 'bg-emerald-400' : ev.event_type === 'unsub' ? 'bg-red-400' : 'bg-slate-300'}`} />
                        <div className="flex-1 min-w-0">
                          <p className="text-xs font-semibold text-slate-700 capitalize">{ev.event_type.replace(/_/g, ' ')}</p>
                          {ev.url && <p className="text-xs text-slate-400 truncate">{ev.url}</p>}
                          <p className="text-xs text-slate-400 mt-0.5">{new Date(ev.created_at).toLocaleString()}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </>
          )}
        </div>
      </aside>
    </div>
  );
}

export default function EmLogsPage() {
  const [messages, setMessages] = useState<EmMessage[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('');
  const [page, setPage] = useState(0);
  const [selectedId, setSelectedId] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true); setError(null);
    try {
      const params = new URLSearchParams({ limit: String(PER_PAGE), offset: String(page * PER_PAGE) });
      if (statusFilter) params.set('status', statusFilter);
      const res = await emApi.get(`logs?${params}`);
      setMessages(res.messages ?? []);
      setTotal(res.total ?? 0);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  }, [page, statusFilter]);

  useEffect(() => { load(); }, [load]);

  const filtered = search
    ? messages.filter(m => m.to_email.includes(search) || (m.subject_rendered ?? '').includes(search))
    : messages;

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Send Logs">
      {selectedId && <MessageDetailDrawer messageId={selectedId} onClose={() => setSelectedId(null)} />}

      <div className="space-y-4">
        <div className="flex items-center gap-3 flex-wrap">
          <div className="relative flex-1 min-w-48">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
            <input value={search} onChange={e => setSearch(e.target.value)} placeholder="Search by email or subject..." className="w-full pl-9 pr-4 py-2 text-sm border border-slate-200 rounded-lg focus:ring-2 focus:ring-sky-500 focus:border-transparent" />
          </div>
          <div className="flex items-center gap-2">
            <Filter className="w-4 h-4 text-slate-400" />
            <select value={statusFilter} onChange={e => { setStatusFilter(e.target.value); setPage(0); }} className="text-sm border border-slate-200 rounded-lg px-3 py-2 bg-white focus:ring-2 focus:ring-sky-500">
              {STATUS_OPTIONS.map(s => <option key={s} value={s}>{s || 'All statuses'}</option>)}
            </select>
          </div>
          <button onClick={load} className="p-2 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50 transition-colors"><RefreshCw className="w-4 h-4" /></button>
        </div>

        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}

        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-slate-50 border-b border-slate-100">
              <tr>
                <th className="text-left px-5 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">To</th>
                <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide hidden md:table-cell">Subject</th>
                <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Status</th>
                <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide hidden lg:table-cell">Tracking</th>
                <th className="text-right px-5 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Sent At</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-50">
              {loading ? (
                [...Array(8)].map((_, i) => (
                  <tr key={i}>
                    <td colSpan={5} className="px-5 py-3"><div className="h-4 bg-slate-100 rounded animate-pulse" /></td>
                  </tr>
                ))
              ) : !filtered.length ? (
                <tr>
                  <td colSpan={5} className="px-5 py-12 text-center">
                    <Mail className="w-8 h-8 mx-auto mb-2 text-slate-200" />
                    <p className="text-sm text-slate-400">No messages found</p>
                  </td>
                </tr>
              ) : filtered.map(m => (
                <tr
                  key={m.id}
                  onClick={() => setSelectedId(m.id)}
                  className="hover:bg-slate-50 transition-colors cursor-pointer"
                >
                  <td className="px-5 py-3.5 font-medium text-slate-800">{m.to_email}</td>
                  <td className="px-4 py-3.5 text-slate-500 hidden md:table-cell">
                    <span className="truncate block max-w-xs">{m.subject_rendered}</span>
                  </td>
                  <td className="px-4 py-3.5">
                    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[m.status] ?? 'bg-slate-100 text-slate-600'}`}>{m.status}</span>
                  </td>
                  <td className="px-4 py-3.5 hidden lg:table-cell">
                    <div className="flex items-center gap-2 text-xs text-slate-400">
                      {(m as any).open_count > 0 && (
                        <span className="flex items-center gap-1 text-sky-600">
                          <Eye className="w-3 h-3" />{(m as any).open_count}
                        </span>
                      )}
                      {(m as any).click_count > 0 && (
                        <span className="flex items-center gap-1 text-emerald-600">
                          <MousePointer className="w-3 h-3" />{(m as any).click_count}
                        </span>
                      )}
                      {!(m as any).open_count && !(m as any).click_count && <span>—</span>}
                    </div>
                  </td>
                  <td className="px-5 py-3.5 text-right text-xs text-slate-400">
                    {m.sent_at ? new Date(m.sent_at).toLocaleString() : m.created_at ? new Date(m.created_at).toLocaleString() : '—'}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          <div className="flex items-center justify-between px-5 py-3 border-t border-slate-100 bg-slate-50">
            <span className="text-xs text-slate-400">{total.toLocaleString()} total messages</span>
            <div className="flex items-center gap-2">
              <button onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0} className="p-1.5 rounded-lg border border-slate-200 text-slate-400 hover:bg-white disabled:opacity-40"><ChevronLeft className="w-3.5 h-3.5" /></button>
              <span className="text-xs text-slate-500">Page {page + 1} of {Math.max(1, Math.ceil(total / PER_PAGE))}</span>
              <button onClick={() => setPage(p => p + 1)} disabled={(page + 1) * PER_PAGE >= total} className="p-1.5 rounded-lg border border-slate-200 text-slate-400 hover:bg-white disabled:opacity-40"><ChevronRight className="w-3.5 h-3.5" /></button>
            </div>
          </div>
        </div>
      </div>
    </EmailModuleLayout>
  );
}
