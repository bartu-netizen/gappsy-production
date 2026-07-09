import { useEffect, useState, useCallback } from 'react';
import { Shield, RefreshCw, Filter, AlertTriangle, CheckCircle, XCircle, Clock, Search, ChevronLeft, ChevronRight } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminFetch } from '../utils/adminFetch';
import { formatStateName } from '../utils/formatLocation';

interface AuditLog {
  id: string;
  actor_session_type: string;
  actor_email: string | null;
  action: string;
  target_table: string | null;
  target_id: string | null;
  state_slug: string | null;
  payload_hash: string | null;
  ip: string | null;
  user_agent: string | null;
  status: 'success' | 'rejected' | 'error';
  rejection_reason: string | null;
  created_at: string;
}

interface LogResponse {
  logs: AuditLog[];
  total: number;
  limit: number;
  offset: number;
}

const PAGE_SIZE = 50;

const STATUS_CONFIG = {
  success: { icon: CheckCircle, color: 'text-emerald-600', bg: 'bg-emerald-50', border: 'border-emerald-200', label: 'Success' },
  rejected: { icon: XCircle, color: 'text-red-600', bg: 'bg-red-50', border: 'border-red-200', label: 'Rejected' },
  error: { icon: AlertTriangle, color: 'text-amber-600', bg: 'bg-amber-50', border: 'border-amber-200', label: 'Error' },
};

const ACTION_LABELS: Record<string, string> = {
  state_json_import: 'State Import',
  logo_upload: 'Logo Upload',
  top25_admin_update: 'Top-25 Update',
};

function formatDate(iso: string) {
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric',
    hour: '2-digit', minute: '2-digit', second: '2-digit',
  });
}

export default function WpAdminAuditLogPage() {
  const [logs, setLogs] = useState<AuditLog[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [page, setPage] = useState(0);
  const [filterAction, setFilterAction] = useState('');
  const [filterStatus, setFilterStatus] = useState('');
  const [filterState, setFilterState] = useState('');
  const [expandedId, setExpandedId] = useState<string | null>(null);

  const fetchLogs = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const params = new URLSearchParams({
        limit: String(PAGE_SIZE),
        offset: String(page * PAGE_SIZE),
      });
      if (filterAction) params.set('action', filterAction);
      if (filterStatus) params.set('status', filterStatus);
      if (filterState) params.set('state_slug', filterState);

      const res = await adminFetch(`admin-audit-log?${params}`);

      if (res.status === 401 || res.status === 403) {
        throw new Error('You are not authorized to view the audit log.');
      }
      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        throw new Error(body.message || `Could not load audit log (HTTP ${res.status}). Try refresh.`);
      }

      const data: LogResponse = await res.json();
      setLogs(data.logs ?? []);
      setTotal(data.total ?? 0);
    } catch (err) {
      console.error('[AuditLog] fetch failed:', err);
      setError(err instanceof Error ? err.message : 'Could not load audit log. Try refresh.');
    } finally {
      setLoading(false);
    }
  }, [page, filterAction, filterStatus, filterState]);

  useEffect(() => {
    fetchLogs();
  }, [fetchLogs]);

  const totalPages = Math.ceil(total / PAGE_SIZE);

  const rejectedCount = logs.filter(l => l.status === 'rejected').length;
  const successCount = logs.filter(l => l.status === 'success').length;

  return (
    <WpAdminLayout title="Security Audit Log" subtitle="Every admin write action is recorded here">
      <div className="space-y-6">

        {/* Summary stats */}
        <div className="grid grid-cols-3 gap-4">
          <div className="bg-white rounded-xl border border-slate-200 p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-slate-100 flex items-center justify-center">
              <Shield className="w-5 h-5 text-slate-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-slate-900">{total.toLocaleString()}</div>
              <div className="text-xs text-slate-500">Total Records</div>
            </div>
          </div>
          <div className="bg-white rounded-xl border border-emerald-200 p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-emerald-50 flex items-center justify-center">
              <CheckCircle className="w-5 h-5 text-emerald-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-emerald-700">{successCount}</div>
              <div className="text-xs text-slate-500">Successful (this page)</div>
            </div>
          </div>
          <div className="bg-white rounded-xl border border-red-200 p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-red-50 flex items-center justify-center">
              <XCircle className="w-5 h-5 text-red-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-red-700">{rejectedCount}</div>
              <div className="text-xs text-slate-500">Rejected (this page)</div>
            </div>
          </div>
        </div>

        {/* Filters */}
        <div className="bg-white rounded-xl border border-slate-200 p-4">
          <div className="flex items-center gap-3 flex-wrap">
            <Filter className="w-4 h-4 text-slate-400 shrink-0" />
            <select
              value={filterAction}
              onChange={e => { setFilterAction(e.target.value); setPage(0); }}
              className="text-sm border border-slate-200 rounded-lg px-3 py-1.5 text-slate-700 bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">All Actions</option>
              <option value="state_json_import">State Import</option>
              <option value="logo_upload">Logo Upload</option>
              <option value="top25_admin_update">Top-25 Update</option>
            </select>
            <select
              value={filterStatus}
              onChange={e => { setFilterStatus(e.target.value); setPage(0); }}
              className="text-sm border border-slate-200 rounded-lg px-3 py-1.5 text-slate-700 bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">All Statuses</option>
              <option value="success">Success</option>
              <option value="rejected">Rejected</option>
              <option value="error">Error</option>
            </select>
            <div className="relative">
              <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400" />
              <input
                type="text"
                placeholder="Filter by state slug..."
                value={filterState}
                onChange={e => { setFilterState(e.target.value); setPage(0); }}
                className="text-sm border border-slate-200 rounded-lg pl-8 pr-3 py-1.5 text-slate-700 focus:ring-2 focus:ring-blue-500 focus:border-transparent w-48"
              />
            </div>
            <button
              onClick={fetchLogs}
              className="ml-auto flex items-center gap-1.5 text-sm text-slate-600 hover:text-slate-900 px-3 py-1.5 rounded-lg border border-slate-200 hover:border-slate-300 transition-colors"
            >
              <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
              Refresh
            </button>
          </div>
        </div>

        {/* Log table */}
        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          {error && (
            <div className="p-4 bg-red-50 border-b border-red-200 text-red-700 text-sm flex items-center gap-2">
              <AlertTriangle className="w-4 h-4 shrink-0" />
              {error}
            </div>
          )}

          {loading && logs.length === 0 ? (
            <div className="p-12 text-center text-slate-400">
              <RefreshCw className="w-6 h-6 animate-spin mx-auto mb-2" />
              <p className="text-sm">Loading audit logs...</p>
            </div>
          ) : logs.length === 0 ? (
            <div className="p-12 text-center text-slate-400">
              <Shield className="w-8 h-8 mx-auto mb-2 opacity-40" />
              <p className="text-sm">No audit log entries found.</p>
            </div>
          ) : (
            <div className="divide-y divide-slate-100">
              {/* Header */}
              <div className="grid grid-cols-[140px_120px_120px_120px_1fr_160px] gap-3 px-4 py-2.5 bg-slate-50 text-xs font-semibold text-slate-500 uppercase tracking-wide">
                <div>Time</div>
                <div>Action</div>
                <div>Status</div>
                <div>Session</div>
                <div>State / Target</div>
                <div>IP</div>
              </div>

              {logs.map(log => {
                const cfg = STATUS_CONFIG[log.status] ?? STATUS_CONFIG.error;
                const StatusIcon = cfg.icon;
                const isExpanded = expandedId === log.id;

                return (
                  <div key={log.id} className="hover:bg-slate-50 transition-colors">
                    <button
                      onClick={() => setExpandedId(isExpanded ? null : log.id)}
                      className="w-full grid grid-cols-[140px_120px_120px_120px_1fr_160px] gap-3 px-4 py-3 text-left"
                    >
                      <div className="flex items-center gap-1.5 text-xs text-slate-500">
                        <Clock className="w-3 h-3 shrink-0" />
                        <span className="truncate">{formatDate(log.created_at)}</span>
                      </div>
                      <div className="text-xs font-medium text-slate-700 truncate">
                        {ACTION_LABELS[log.action] ?? log.action}
                      </div>
                      <div>
                        <span className={`inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-full border ${cfg.bg} ${cfg.border} ${cfg.color}`}>
                          <StatusIcon className="w-3 h-3" />
                          {cfg.label}
                        </span>
                      </div>
                      <div className="text-xs text-slate-500 truncate">
                        {log.actor_session_type === 'session_token' ? 'Session' : log.actor_session_type === 'admin_secret' ? 'Secret' : log.actor_session_type}
                      </div>
                      <div className="text-xs text-slate-600 truncate">
                        {log.state_slug ? (
                          <span className="font-medium">{formatStateName(log.state_slug)}</span>
                        ) : log.target_table ? (
                          <span className="text-slate-400">{log.target_table}</span>
                        ) : (
                          <span className="text-slate-300">—</span>
                        )}
                      </div>
                      <div className="text-xs text-slate-400 truncate font-mono">
                        {log.ip ?? '—'}
                      </div>
                    </button>

                    {isExpanded && (
                      <div className="px-4 pb-4 bg-slate-50 border-t border-slate-100">
                        <div className="grid grid-cols-2 gap-4 mt-3 text-xs">
                          <div className="space-y-2">
                            <div>
                              <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">Log ID</span>
                              <p className="text-slate-600 font-mono mt-0.5">{log.id}</p>
                            </div>
                            {log.target_table && (
                              <div>
                                <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">Tables Written</span>
                                <p className="text-slate-600 mt-0.5">{log.target_table}</p>
                              </div>
                            )}
                            {log.payload_hash && (
                              <div>
                                <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">Payload Hash (SHA-256)</span>
                                <p className="text-slate-600 font-mono mt-0.5 break-all">{log.payload_hash}</p>
                              </div>
                            )}
                          </div>
                          <div className="space-y-2">
                            {log.rejection_reason && (
                              <div>
                                <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">Rejection Reason</span>
                                <p className="text-red-600 mt-0.5 break-all">{log.rejection_reason}</p>
                              </div>
                            )}
                            {log.user_agent && (
                              <div>
                                <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">User Agent</span>
                                <p className="text-slate-500 mt-0.5 break-all">{log.user_agent}</p>
                              </div>
                            )}
                            {log.actor_email && (
                              <div>
                                <span className="text-slate-400 uppercase tracking-wide font-semibold text-[10px]">Actor Email</span>
                                <p className="text-slate-600 mt-0.5">{log.actor_email}</p>
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}

          {/* Pagination */}
          {totalPages > 1 && (
            <div className="flex items-center justify-between px-4 py-3 border-t border-slate-100 bg-slate-50">
              <span className="text-xs text-slate-500">
                Showing {page * PAGE_SIZE + 1}–{Math.min((page + 1) * PAGE_SIZE, total)} of {total.toLocaleString()} records
              </span>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => setPage(p => Math.max(0, p - 1))}
                  disabled={page === 0}
                  className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40 hover:border-slate-300 transition-colors"
                >
                  <ChevronLeft className="w-4 h-4 text-slate-600" />
                </button>
                <span className="text-xs text-slate-600">Page {page + 1} of {totalPages}</span>
                <button
                  onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
                  disabled={page >= totalPages - 1}
                  className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40 hover:border-slate-300 transition-colors"
                >
                  <ChevronRight className="w-4 h-4 text-slate-600" />
                </button>
              </div>
            </div>
          )}
        </div>

      </div>
    </WpAdminLayout>
  );
}
