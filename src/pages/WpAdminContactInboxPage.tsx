import { useState, useEffect, useCallback, useRef } from 'react';
import {
  Mail, Search, Loader, RefreshCw, AlertCircle, X,
  Inbox, CheckCircle, MessageSquare, Clock,
} from 'lucide-react';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch } from '../lib/adminApiFetch';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import {
  ContactDetailPanel,
  StatusBadge,
  type DetailData,
} from '../components/wpadmin/ContactInboxDetail';

// ─── Types ────────────────────────────────────────────────────────────────────

interface MessageListItem {
  id: string;
  created_at: string;
  full_name: string;
  email: string;
  subject: string;
  preview: string;
  status: string;
  category: string | null;
  outbound_reply_count: number;
  page_path: string | null;
  country_name: string | null;
  email_normalized: string | null;
}

type StatusFilter = 'all' | 'new' | 'open' | 'replied' | 'closed' | 'spam';

// ─── Helpers ──────────────────────────────────────────────────────────────────

function relativeTime(dateStr: string): string {
  try {
    const diff = Date.now() - new Date(dateStr).getTime();
    const m = Math.floor(diff / 60000);
    if (m < 1)  return 'just now';
    if (m < 60) return `${m}m ago`;
    const h = Math.floor(m / 60);
    if (h < 24) return `${h}h ago`;
    const d = Math.floor(h / 24);
    if (d < 7)  return `${d}d ago`;
    return new Date(dateStr).toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
  } catch { return ''; }
}

// ─── Message list item ────────────────────────────────────────────────────────

function MessageRow({
  msg, isSelected, onClick,
}: {
  msg: MessageListItem; isSelected: boolean; onClick: () => void;
}) {
  return (
    <button
      onClick={onClick}
      className={`w-full text-left px-4 py-3.5 border-b border-slate-100 transition-colors
        ${isSelected
          ? 'bg-blue-50 border-l-[3px] border-l-blue-500'
          : 'hover:bg-slate-50/80 border-l-[3px] border-l-transparent'
        }`}
    >
      <div className="flex items-start justify-between gap-2 mb-1">
        <div className="flex items-center gap-1.5 min-w-0">
          {msg.status === 'new' && (
            <span className="w-2 h-2 rounded-full bg-blue-500 flex-shrink-0 mt-1" />
          )}
          <span className={`text-sm truncate font-medium ${isSelected ? 'text-blue-900' : 'text-slate-900'} ${msg.status === 'new' ? 'font-semibold' : ''}`}>
            {msg.full_name}
          </span>
        </div>
        <span className="text-[11px] text-slate-400 whitespace-nowrap flex-shrink-0">
          {relativeTime(msg.created_at)}
        </span>
      </div>
      <div className="text-xs text-slate-500 truncate mb-1.5">{msg.subject}</div>
      <div className="text-[11px] text-slate-400 truncate mb-2">{msg.preview}</div>
      <div className="flex items-center gap-1.5 flex-wrap">
        <StatusBadge status={msg.status} />
        {msg.page_path && (
          <span className="text-[10px] text-slate-400 bg-slate-100 px-1.5 py-0.5 rounded font-mono truncate max-w-[120px]">
            {msg.page_path}
          </span>
        )}
        {msg.outbound_reply_count > 0 && (
          <span className="text-[10px] text-slate-400 flex items-center gap-0.5">
            <MessageSquare className="w-2.5 h-2.5" /> {msg.outbound_reply_count}
          </span>
        )}
      </div>
    </button>
  );
}

// ─── Sidebar ──────────────────────────────────────────────────────────────────

function InboxSidebar({
  messages, selectedId, counts, loading, statusFilter, searchQuery,
  onSelect, onStatusFilter, onSearch, onLoadMore, hasMore, loadingMore,
}: {
  messages: MessageListItem[];
  selectedId: string | null;
  counts: Record<string, number>;
  loading: boolean;
  statusFilter: StatusFilter;
  searchQuery: string;
  onSelect: (id: string) => void;
  onStatusFilter: (s: StatusFilter) => void;
  onSearch: (q: string) => void;
  onLoadMore: () => void;
  hasMore: boolean;
  loadingMore: boolean;
}) {
  const TABS: { key: StatusFilter; label: string; icon: React.ReactNode }[] = [
    { key: 'all',     label: 'All',     icon: <Inbox className="w-3 h-3" /> },
    { key: 'new',     label: 'New',     icon: <Mail className="w-3 h-3" /> },
    { key: 'open',    label: 'Open',    icon: <Clock className="w-3 h-3" /> },
    { key: 'replied', label: 'Replied', icon: <CheckCircle className="w-3 h-3" /> },
    { key: 'closed',  label: 'Closed',  icon: <X className="w-3 h-3" /> },
  ];

  return (
    <div className="flex flex-col flex-1 min-h-0 border-r border-slate-200 bg-white">
      {/* Search */}
      <div className="px-3 py-3 border-b border-slate-100">
        <div className="relative">
          <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400" />
          <input
            type="text"
            placeholder="Search messages…"
            value={searchQuery}
            onChange={e => onSearch(e.target.value)}
            className="w-full pl-8 pr-3 py-1.5 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 placeholder:text-slate-400"
          />
        </div>
      </div>

      {/* Status tabs */}
      <div className="flex items-center gap-0.5 px-2 py-2 border-b border-slate-100 overflow-x-auto flex-shrink-0">
        {TABS.map(t => (
          <button
            key={t.key}
            onClick={() => onStatusFilter(t.key)}
            className={`flex items-center gap-1 px-2.5 py-1 rounded-md text-[11px] font-medium whitespace-nowrap transition-colors
              ${statusFilter === t.key
                ? 'bg-blue-100 text-blue-700'
                : 'text-slate-500 hover:bg-slate-100'}`}
          >
            {t.icon}
            {t.label}
            {counts[t.key] != null && counts[t.key] > 0 && (
              <span className={`ml-0.5 text-[10px] px-1 rounded-full font-bold
                ${statusFilter === t.key ? 'bg-blue-200 text-blue-800' : 'bg-slate-200 text-slate-600'}`}>
                {counts[t.key]}
              </span>
            )}
          </button>
        ))}
      </div>

      {/* Message list */}
      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="flex items-center justify-center py-12 gap-2">
            <Loader className="w-4 h-4 animate-spin text-blue-500" />
            <span className="text-sm text-slate-500">Loading…</span>
          </div>
        ) : messages.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-12 gap-2 text-slate-400">
            <Inbox className="w-8 h-8 text-slate-200" />
            <p className="text-sm">No messages</p>
          </div>
        ) : (
          <>
            {messages.map(msg => (
              <MessageRow
                key={msg.id}
                msg={msg}
                isSelected={selectedId === msg.id}
                onClick={() => onSelect(msg.id)}
              />
            ))}
            {hasMore && (
              <button
                onClick={onLoadMore}
                disabled={loadingMore}
                className="w-full py-3 text-xs text-slate-500 hover:bg-slate-50 transition-colors flex items-center justify-center gap-1.5"
              >
                {loadingMore ? <Loader className="w-3.5 h-3.5 animate-spin" /> : null}
                {loadingMore ? 'Loading…' : 'Load more'}
              </button>
            )}
          </>
        )}
      </div>
    </div>
  );
}

// ─── Main page ────────────────────────────────────────────────────────────────

export default function WpAdminContactInboxPage() {
  const { status, isReady, isValid } = useAdminSession();
  const [authError, setAuthError] = useState(false);

  const [messages, setMessages]       = useState<MessageListItem[]>([]);
  const [counts, setCounts]           = useState<Record<string, number>>({});
  const [selectedId, setSelectedId]   = useState<string | null>(null);
  const [detail, setDetail]           = useState<DetailData | null>(null);

  const [listLoading, setListLoading]     = useState(false);
  const [detailLoading, setDetailLoading] = useState(false);
  const [detailError, setDetailError]     = useState('');
  const [loadingMore, setLoadingMore]     = useState(false);
  const [error, setError]                 = useState('');

  const detailRequestId = useRef(0);

  const [statusFilter, setStatusFilter] = useState<StatusFilter>('new');
  const [searchQuery, setSearchQuery]   = useState('');
  const [page, setPage]                 = useState(1);
  const [total, setTotal]               = useState(0);

  const PAGE_SIZE = 25;
  const searchTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const hasFetched  = useRef(false);

  // ── Data loading ────────────────────────────────────────────────────────────

  const loadCounts = useCallback(async () => {
    const result = await adminApiFetch<{ ok: boolean; counts: Record<string, number> }>(
      'contact-inbox-admin?action=counts'
    );
    if (result.ok && result.data?.ok) setCounts(result.data.counts);
  }, []);

  const loadMessages = useCallback(async (p = 1, append = false) => {
    if (!isReady || !isValid) return;
    if (append) setLoadingMore(true); else setListLoading(true);
    setError('');

    const params = new URLSearchParams({
      action: 'list', page: String(p), limit: String(PAGE_SIZE),
    });
    if (statusFilter !== 'all') params.set('status', statusFilter);
    if (searchQuery.trim()) params.set('search', searchQuery.trim());

    const result = await adminApiFetch<{ ok: boolean; messages: MessageListItem[]; total: number }>(
      `contact-inbox-admin?${params}`
    );

    if (!result.ok) {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        setAuthError(true);
      } else {
        setError(result.error?.message ?? 'Failed to load messages');
      }
    } else if (result.data?.ok) {
      const incoming = result.data.messages ?? [];
      setMessages(prev => append ? [...prev, ...incoming] : incoming);
      setTotal(result.data.total ?? 0);
      setPage(p);
    }

    if (append) setLoadingMore(false); else setListLoading(false);
  }, [isReady, isValid, statusFilter, searchQuery]);

  const loadDetail = useCallback(async (id: string) => {
    const requestId = ++detailRequestId.current;
    setDetailLoading(true);
    setDetailError('');
    setDetail(null);

    const result = await adminApiFetch<DetailData & { ok: boolean }>(
      `contact-inbox-admin?action=detail&id=${encodeURIComponent(id)}`
    );

    if (detailRequestId.current !== requestId) return;

    if (!result.ok) {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        setAuthError(true);
      } else {
        setDetailError(result.error?.message ?? 'Failed to load this message');
      }
    } else if (result.data?.ok) {
      setDetail(result.data as unknown as DetailData);
    } else {
      setDetailError('Failed to load this message');
    }

    setDetailLoading(false);
  }, []);

  // ── Effects ─────────────────────────────────────────────────────────────────

  useEffect(() => {
    if (isReady && isValid && !hasFetched.current) {
      hasFetched.current = true;
      loadMessages(1);
      loadCounts();
    }
    if (isReady && !isValid) {
      setAuthError(true);
      hasFetched.current = false;
    }
  }, [isReady, isValid]);

  useEffect(() => {
    if (!hasFetched.current) return;
    setPage(1);
    setMessages([]);
    loadMessages(1);
  }, [statusFilter]);

  useEffect(() => {
    if (searchTimer.current) clearTimeout(searchTimer.current);
    searchTimer.current = setTimeout(() => {
      if (!hasFetched.current) return;
      setPage(1);
      setMessages([]);
      loadMessages(1);
    }, 350);
    return () => { if (searchTimer.current) clearTimeout(searchTimer.current); };
  }, [searchQuery]);

  // ── Handlers ─────────────────────────────────────────────────────────────────

  const handleSelect = (id: string) => {
    setSelectedId(id);
    setDetailError('');
    loadDetail(id);
    // Optimistically mark as open if new
    setMessages(prev => prev.map(m =>
      m.id === id && m.status === 'new' ? { ...m, status: 'open' } : m
    ));
  };

  const handleStatusChange = async (id: string, newStatus: string) => {
    setMessages(prev => prev.map(m => m.id === id ? { ...m, status: newStatus } : m));
    if (detail?.message?.id === id) {
      setDetail(prev => prev ? { ...prev, message: { ...prev.message, status: newStatus } } : prev);
    }
    await adminApiFetch('contact-inbox-admin?action=status', {
      method: 'PATCH', body: { id, status: newStatus },
    });
    loadCounts();
  };

  const handleNotesSave = async (id: string, notes: string, category: string | null) => {
    await adminApiFetch('contact-inbox-admin?action=notes', {
      method: 'PATCH', body: { id, internal_notes: notes, category },
    });
    if (detail?.message?.id === id) {
      setDetail(prev => prev
        ? { ...prev, message: { ...prev.message, internal_notes: notes, category } }
        : prev
      );
    }
  };

  const handleReplySent = () => {
    if (selectedId) {
      setMessages(prev => prev.map(m =>
        m.id === selectedId
          ? { ...m, status: 'replied', outbound_reply_count: m.outbound_reply_count + 1 }
          : m
      ));
      loadDetail(selectedId);
      loadCounts();
    }
  };

  const handleRefresh = () => {
    hasFetched.current = false;
    hasFetched.current = true;
    loadMessages(1);
    loadCounts();
    if (selectedId) loadDetail(selectedId);
  };

  const hasMore = messages.length < total;

  return (
    <WpAdminLayout title="Contact Inbox" subtitle="Manage inbound contact messages" fullHeight>
      {status === 'loading' ? (
        <div className="flex items-center justify-center h-64 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Restoring admin session…</span>
        </div>
      ) : authError || status === 'invalid' ? (
        <div className="max-w-lg mx-auto mt-8 px-4">
          <AdminReAuthCard
            onSuccess={() => { setAuthError(false); hasFetched.current = false; }}
            message="Your admin session is invalid or expired. Please log in again."
          />
        </div>
      ) : (
        <div className="flex flex-col flex-1 min-h-0 overflow-hidden">
          {/* Toolbar */}
          <div className="flex items-center justify-between px-5 py-3 bg-white border-b border-slate-200 flex-shrink-0">
            <div className="flex items-center gap-2">
              <Inbox className="w-4 h-4 text-blue-500" />
              <span className="text-sm font-semibold text-slate-800">Inbox</span>
              {counts.new > 0 && (
                <span className="text-[11px] px-1.5 py-0.5 rounded-full bg-blue-500 text-white font-bold">
                  {counts.new}
                </span>
              )}
            </div>
            <button
              onClick={handleRefresh}
              disabled={listLoading}
              className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg bg-white text-slate-600 hover:bg-slate-100 disabled:opacity-50 transition-colors"
            >
              {listLoading ? <Loader className="w-3.5 h-3.5 animate-spin" /> : <RefreshCw className="w-3.5 h-3.5" />}
              Refresh
            </button>
          </div>

          {error && (
            <div className="mx-5 mt-3 flex items-center gap-2 bg-red-50 border border-red-200 rounded-xl px-4 py-2.5 flex-shrink-0">
              <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0" />
              <span className="text-sm text-red-700 flex-1">{error}</span>
              <button onClick={() => setError('')}><X className="w-4 h-4 text-red-400 hover:text-red-600" /></button>
            </div>
          )}

          {/* Two-column layout */}
          <div className="flex flex-1 min-h-0 overflow-hidden">
            {/* Sidebar */}
            <div className="w-80 xl:w-96 flex-shrink-0 flex flex-col min-h-0">
              <InboxSidebar
                messages={messages}
                selectedId={selectedId}
                counts={counts}
                loading={listLoading}
                statusFilter={statusFilter}
                searchQuery={searchQuery}
                onSelect={handleSelect}
                onStatusFilter={s => { setStatusFilter(s); setSelectedId(null); setDetail(null); }}
                onSearch={setSearchQuery}
                onLoadMore={() => loadMessages(page + 1, true)}
                hasMore={hasMore}
                loadingMore={loadingMore}
              />
            </div>

            {/* Detail panel */}
            <div className="flex-1 min-w-0 min-h-0 overflow-hidden bg-slate-50/40">
              <ContactDetailPanel
                data={detail}
                loading={detailLoading}
                error={detailError}
                onStatusChange={handleStatusChange}
                onNotesSave={handleNotesSave}
                onReplySent={handleReplySent}
                onRefresh={() => selectedId && loadDetail(selectedId)}
                onRetry={() => selectedId && loadDetail(selectedId)}
              />
            </div>
          </div>
        </div>
      )}
    </WpAdminLayout>
  );
}
