import { useState, useEffect, useCallback, useRef } from 'react';
import {
  Mail, Search, RefreshCw, Send, ChevronDown, ChevronUp,
  Building2, DollarSign, Tag, MessageSquare, Clock, ArrowLeft,
  AlertCircle, CheckCircle, Archive, Inbox, Reply, User, ExternalLink,
} from 'lucide-react';
import EmailModuleLayout from '../components/wpadmin/EmailModuleLayout';
import { adminApiFetch } from '../lib/adminApiFetch';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';

// ─── Types ────────────────────────────────────────────────────────────────────

interface Conversation {
  id: string;
  campaign_id: string;
  smartlead_lead_id: string | null;
  email_normalized: string;
  agency_id: string | null;
  latest_event_type: string | null;
  latest_event_at: string | null;
  latest_subject: string | null;
  unread_reply_count: number;
  status: string;
  assigned_to: string | null;
  messages_synced_at: string | null;
  created_at: string;
  updated_at: string;
  agency: { id: string; name: string; slug: string; state_slug: string } | null;
}

interface Message {
  id: string;
  direction: 'inbound' | 'outbound';
  subject: string | null;
  body_text: string | null;
  from_email: string | null;
  to_email: string | null;
  event_at: string | null;
  sequence_number: number | null;
  smartlead_message_id: string | null;
}

interface Enrichment {
  person_type: string;
  agencies: { id: string; name: string; slug: string; state_slug: string; website_url: string | null }[];
  orders: { id: string; amount_total: number; payment_status: string; product_summary: string | null; created_at: string }[];
  total_paid_usd: number;
  has_paid: boolean;
  contact_messages: { id: string; created_at: string; subject: string; status: string }[];
  funnel_sessions: { id: string; funnel_step: string; created_at: string }[];
}

interface ConvDetail {
  conversation: Conversation;
  messages: Message[];
  campaign: { id: string; name: string; status: string } | null;
  enrichment: Enrichment;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

const STATUS_TABS = [
  { key: 'all',      label: 'All' },
  { key: 'new',      label: 'New' },
  { key: 'open',     label: 'Open' },
  { key: 'replied',  label: 'Replied' },
  { key: 'closed',   label: 'Closed' },
  { key: 'archived', label: 'Archived' },
];

const EVENT_COLORS: Record<string, string> = {
  replied:      'bg-green-100 text-green-700',
  opened:       'bg-blue-100 text-blue-700',
  clicked:      'bg-sky-100 text-sky-700',
  bounced:      'bg-red-100 text-red-700',
  unsubscribed: 'bg-orange-100 text-orange-700',
  opted_out:    'bg-orange-100 text-orange-700',
};

function EventBadge({ type }: { type: string | null }) {
  if (!type) return null;
  const cls = EVENT_COLORS[type] ?? 'bg-slate-100 text-slate-600';
  return <span className={`text-xs font-medium px-2 py-0.5 rounded-full capitalize ${cls}`}>{type}</span>;
}

function StatusDot({ status }: { status: string }) {
  const colors: Record<string, string> = {
    new:      'bg-blue-500',
    open:     'bg-amber-400',
    replied:  'bg-green-500',
    closed:   'bg-slate-400',
    archived: 'bg-slate-300',
  };
  return <span className={`inline-block w-2 h-2 rounded-full ${colors[status] ?? 'bg-slate-300'}`} />;
}

function fmtDate(iso: string | null) {
  if (!iso) return '';
  const d = new Date(iso);
  const now = new Date();
  const diff = now.getTime() - d.getTime();
  if (diff < 60_000) return 'Just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  if (diff < 604_800_000) return `${Math.floor(diff / 86_400_000)}d ago`;
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

function fmtDateFull(iso: string | null) {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric',
    hour: 'numeric', minute: '2-digit',
  });
}

// ─── Conversation List Item ───────────────────────────────────────────────────

function ConvListItem({
  conv,
  selected,
  onClick,
}: {
  conv: Conversation;
  selected: boolean;
  onClick: () => void;
}) {
  return (
    <button
      onClick={onClick}
      className={`w-full text-left px-4 py-3 border-b border-slate-100 transition-colors ${
        selected ? 'bg-blue-50 border-l-2 border-l-blue-500' : 'hover:bg-slate-50 border-l-2 border-l-transparent'
      }`}
    >
      <div className="flex items-start justify-between gap-2 mb-1">
        <div className="flex items-center gap-1.5 min-w-0">
          <StatusDot status={conv.status} />
          <span className="text-sm font-semibold text-slate-800 truncate">
            {conv.agency?.name ?? conv.email_normalized}
          </span>
        </div>
        <span className="text-xs text-slate-400 shrink-0">{fmtDate(conv.latest_event_at)}</span>
      </div>
      <p className="text-xs text-slate-500 truncate mb-1.5">
        {conv.email_normalized}
        {conv.agency && <span className="ml-1 text-slate-400">· {conv.agency.state_slug?.toUpperCase()}</span>}
      </p>
      <div className="flex items-center gap-2">
        <EventBadge type={conv.latest_event_type} />
        {conv.latest_subject && (
          <span className="text-xs text-slate-400 truncate">{conv.latest_subject}</span>
        )}
      </div>
    </button>
  );
}

// ─── Message Bubble ───────────────────────────────────────────────────────────

function MessageBubble({ msg }: { msg: Message }) {
  const isInbound = msg.direction === 'inbound';
  return (
    <div className={`flex ${isInbound ? 'justify-start' : 'justify-end'} mb-3`}>
      <div className={`max-w-[80%] rounded-xl px-4 py-3 ${
        isInbound
          ? 'bg-white border border-slate-200 text-slate-800'
          : 'bg-slate-800 text-white'
      }`}>
        {msg.subject && (
          <p className={`text-xs font-semibold mb-1.5 ${isInbound ? 'text-slate-500' : 'text-slate-300'}`}>
            {msg.subject}
          </p>
        )}
        <p className="text-sm whitespace-pre-wrap leading-relaxed">
          {msg.body_text ?? '(no body)'}
        </p>
        <p className={`text-xs mt-2 ${isInbound ? 'text-slate-400' : 'text-slate-400'}`}>
          {fmtDateFull(msg.event_at)}
          {msg.sequence_number != null && (
            <span className="ml-2">Step {msg.sequence_number}</span>
          )}
        </p>
      </div>
    </div>
  );
}

// ─── Enrichment Panel ─────────────────────────────────────────────────────────

function EnrichmentPanel({ enrichment, campaign }: { enrichment: Enrichment; campaign: ConvDetail['campaign'] }) {
  const [expanded, setExpanded] = useState(true);

  return (
    <div className="border border-slate-200 rounded-xl overflow-hidden">
      <button
        onClick={() => setExpanded(e => !e)}
        className="w-full flex items-center justify-between px-4 py-3 bg-slate-50 hover:bg-slate-100 transition-colors"
      >
        <span className="text-sm font-semibold text-slate-700">Lead Intelligence</span>
        {expanded ? <ChevronUp className="w-4 h-4 text-slate-400" /> : <ChevronDown className="w-4 h-4 text-slate-400" />}
      </button>

      {expanded && (
        <div className="p-4 space-y-4">
          {/* Person type */}
          <div className="flex items-center gap-2">
            <User className="w-4 h-4 text-slate-400" />
            <span className="text-xs text-slate-500">Type</span>
            <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${
              enrichment.has_paid ? 'bg-green-100 text-green-700' : 'bg-slate-100 text-slate-600'
            }`}>
              {enrichment.person_type.replace(/_/g, ' ')}
            </span>
            {enrichment.has_paid && (
              <span className="text-xs font-semibold text-green-600">
                ${enrichment.total_paid_usd.toFixed(0)} paid
              </span>
            )}
          </div>

          {/* Campaign */}
          {campaign && (
            <div className="flex items-start gap-2">
              <Tag className="w-4 h-4 text-slate-400 mt-0.5" />
              <div>
                <p className="text-xs text-slate-500 mb-0.5">Campaign</p>
                <p className="text-sm text-slate-800 font-medium">{campaign.name}</p>
                <p className={`text-xs mt-0.5 ${campaign.status === 'ACTIVE' ? 'text-green-600' : 'text-slate-400'}`}>
                  {campaign.status}
                </p>
              </div>
            </div>
          )}

          {/* Agencies */}
          {enrichment.agencies.length > 0 && (
            <div className="flex items-start gap-2">
              <Building2 className="w-4 h-4 text-slate-400 mt-0.5" />
              <div className="min-w-0">
                <p className="text-xs text-slate-500 mb-1.5">Agency Profiles</p>
                {enrichment.agencies.map(ag => (
                  <div key={ag.id} className="mb-1.5">
                    <p className="text-sm font-medium text-slate-800">{ag.name}</p>
                    <div className="flex items-center gap-2">
                      <span className="text-xs text-slate-400">{ag.state_slug?.toUpperCase()}</span>
                      {ag.website_url && (
                        <a
                          href={ag.website_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs text-blue-600 hover:underline flex items-center gap-0.5"
                        >
                          Website <ExternalLink className="w-3 h-3" />
                        </a>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Orders */}
          {enrichment.orders.length > 0 && (
            <div className="flex items-start gap-2">
              <DollarSign className="w-4 h-4 text-slate-400 mt-0.5" />
              <div className="min-w-0 flex-1">
                <p className="text-xs text-slate-500 mb-1.5">Stripe Orders</p>
                {enrichment.orders.slice(0, 3).map(o => (
                  <div key={o.id} className="flex items-center justify-between mb-1">
                    <span className="text-xs text-slate-700 truncate">{o.product_summary ?? 'Order'}</span>
                    <div className="flex items-center gap-1.5 shrink-0 ml-2">
                      <span className="text-xs font-semibold text-slate-800">
                        ${((o.amount_total ?? 0) / 100).toFixed(0)}
                      </span>
                      <span className={`text-xs px-1.5 py-0.5 rounded-full ${
                        o.payment_status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-slate-100 text-slate-500'
                      }`}>
                        {o.payment_status}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Prior contact messages */}
          {enrichment.contact_messages.length > 0 && (
            <div className="flex items-start gap-2">
              <MessageSquare className="w-4 h-4 text-slate-400 mt-0.5" />
              <div>
                <p className="text-xs text-slate-500 mb-1">
                  Contact Inbox ({enrichment.contact_messages.length})
                </p>
                {enrichment.contact_messages.slice(0, 2).map(m => (
                  <p key={m.id} className="text-xs text-slate-600 truncate">{m.subject}</p>
                ))}
              </div>
            </div>
          )}

          {/* Funnel sessions */}
          {enrichment.funnel_sessions.length > 0 && (
            <div className="flex items-start gap-2">
              <Clock className="w-4 h-4 text-slate-400 mt-0.5" />
              <div>
                <p className="text-xs text-slate-500 mb-1">
                  Funnel Activity ({enrichment.funnel_sessions.length})
                </p>
                {enrichment.funnel_sessions.slice(0, 2).map(s => (
                  <p key={s.id} className="text-xs text-slate-600">{s.funnel_step}</p>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

// ─── Reply Composer ───────────────────────────────────────────────────────────

function ReplyComposer({
  convId,
  subject,
  hasLeadId,
  onSent,
}: {
  convId: string;
  subject: string | null;
  hasLeadId: boolean;
  onSent: () => void;
}) {
  const [open, setOpen] = useState(false);
  const [replyText, setReplyText] = useState('');
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  if (!hasLeadId) {
    return (
      <div className="flex items-center gap-2 text-sm text-slate-400 px-1">
        <AlertCircle className="w-4 h-4" />
        No Smartlead lead ID — reply not available for this conversation.
      </div>
    );
  }

  if (success) {
    return (
      <div className="flex items-center gap-2 text-sm text-green-600 bg-green-50 rounded-xl px-4 py-3">
        <CheckCircle className="w-4 h-4" />
        Reply sent via Smartlead.
        <button onClick={() => { setSuccess(false); setOpen(false); setReplyText(''); }} className="ml-auto text-xs underline">
          Reply again
        </button>
      </div>
    );
  }

  if (!open) {
    return (
      <button
        onClick={() => setOpen(true)}
        className="flex items-center gap-2 px-4 py-2.5 bg-slate-800 text-white text-sm font-medium rounded-xl hover:bg-slate-700 transition-colors"
      >
        <Reply className="w-4 h-4" />
        Reply via Smartlead
      </button>
    );
  }

  async function handleSend() {
    if (!replyText.trim()) return;
    setSending(true);
    setError(null);
    try {
      const res = await adminApiFetch<{ ok: boolean; error?: string }>(
        'smartlead-reply-send',
        {
          method: 'POST',
          body: { conversation_id: convId, reply_text: replyText, subject },
        }
      );
      if (!res.ok) throw new Error(res.error?.message ?? 'Failed to send');
      setSuccess(true);
      onSent();
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Send failed');
    } finally {
      setSending(false);
    }
  }

  return (
    <div className="border border-slate-200 rounded-xl overflow-hidden">
      <div className="bg-slate-50 px-4 py-2.5 flex items-center justify-between border-b border-slate-200">
        <span className="text-sm font-semibold text-slate-700">Reply via Smartlead</span>
        <button onClick={() => setOpen(false)} className="text-xs text-slate-400 hover:text-slate-600">Cancel</button>
      </div>
      <div className="p-4">
        <textarea
          value={replyText}
          onChange={e => setReplyText(e.target.value)}
          placeholder="Type your reply..."
          rows={5}
          className="w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:outline-none focus:ring-2 focus:ring-slate-400 resize-none"
        />
        {error && <p className="text-xs text-red-600 mt-2">{error}</p>}
        <div className="flex justify-end mt-3">
          <button
            onClick={handleSend}
            disabled={sending || !replyText.trim()}
            className="flex items-center gap-2 px-4 py-2 bg-slate-800 text-white text-sm font-medium rounded-lg hover:bg-slate-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
          >
            <Send className="w-4 h-4" />
            {sending ? 'Sending…' : 'Send Reply'}
          </button>
        </div>
      </div>
    </div>
  );
}

// ─── Detail Panel ─────────────────────────────────────────────────────────────

function DetailPanel({
  convId,
  onBack,
  onStatusChange,
}: {
  convId: string;
  onBack: () => void;
  onStatusChange: (id: string, status: string) => void;
}) {
  const [detail, setDetail] = useState<ConvDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [syncing, setSyncing] = useState(false);
  const [notes, setNotes] = useState('');
  const [savingNotes, setSavingNotes] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const res = await adminApiFetch<ConvDetail>(
        `smartlead-crm-inbox?action=detail&id=${convId}`
      );
      if (!res.ok) throw new Error(res.error?.message ?? 'Failed to load');
      setDetail(res.data ?? null);
      setNotes(res.data?.conversation?.internal_notes ?? '');
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Load failed');
    } finally {
      setLoading(false);
    }
  }, [convId]);

  useEffect(() => { load(); }, [load]);

  useEffect(() => {
    if (detail?.messages.length) {
      messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
    }
  }, [detail?.messages.length]);

  async function handleSync() {
    setSyncing(true);
    try {
      await adminApiFetch('smartlead-thread-sync', {
        method: 'POST',
        body: { conversation_id: convId },
      });
      await load();
    } catch (e) {
      console.error(e);
    } finally {
      setSyncing(false);
    }
  }

  async function handleStatus(newStatus: string) {
    try {
      await adminApiFetch('smartlead-crm-inbox?action=status', {
        method: 'PATCH',
        body: { id: convId, status: newStatus },
      });
      onStatusChange(convId, newStatus);
      if (detail) {
        setDetail(prev => prev ? { ...prev, conversation: { ...prev.conversation, status: newStatus } } : prev);
      }
    } catch (e) {
      console.error(e);
    }
  }

  async function saveNotes() {
    setSavingNotes(true);
    try {
      await adminApiFetch('smartlead-crm-inbox?action=notes', {
        method: 'PATCH',
        body: { id: convId, internal_notes: notes },
      });
    } catch (e) {
      console.error(e);
    } finally {
      setSavingNotes(false);
    }
  }

  if (loading) {
    return (
      <div className="flex-1 flex items-center justify-center">
        <div className="w-6 h-6 border-2 border-slate-300 border-t-slate-700 rounded-full animate-spin" />
      </div>
    );
  }

  if (error || !detail) {
    return (
      <div className="flex-1 flex flex-col items-center justify-center gap-3 text-slate-500">
        <AlertCircle className="w-8 h-8 text-red-400" />
        <p className="text-sm">{error ?? 'Conversation not found'}</p>
        <button onClick={onBack} className="text-sm text-blue-600 hover:underline">Back to list</button>
      </div>
    );
  }

  const { conversation: conv, messages, campaign, enrichment } = detail;

  return (
    <div className="flex-1 flex flex-col min-h-0 overflow-hidden">
      {/* Header */}
      <div className="flex items-center gap-3 px-5 py-4 border-b border-slate-200 bg-white shrink-0">
        <button
          onClick={onBack}
          className="lg:hidden p-1.5 rounded-lg hover:bg-slate-100 transition-colors"
        >
          <ArrowLeft className="w-4 h-4 text-slate-500" />
        </button>
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2 mb-0.5">
            <h2 className="text-base font-bold text-slate-900 truncate">
              {conv.agency?.name ?? conv.email_normalized}
            </h2>
            <EventBadge type={conv.latest_event_type} />
          </div>
          <p className="text-xs text-slate-500">{conv.email_normalized}</p>
        </div>
        <div className="flex items-center gap-2 shrink-0">
          <button
            onClick={handleSync}
            disabled={syncing}
            title="Sync messages from Smartlead API"
            className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 disabled:opacity-50 transition-colors"
          >
            <RefreshCw className={`w-3.5 h-3.5 ${syncing ? 'animate-spin' : ''}`} />
            Sync
          </button>
          <select
            value={conv.status}
            onChange={e => handleStatus(e.target.value)}
            className="text-xs border border-slate-200 rounded-lg px-2.5 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-slate-300"
          >
            <option value="new">New</option>
            <option value="open">Open</option>
            <option value="replied">Replied</option>
            <option value="closed">Closed</option>
            <option value="archived">Archived</option>
          </select>
        </div>
      </div>

      {/* Body: messages + right sidebar */}
      <div className="flex-1 flex min-h-0 overflow-hidden">
        {/* Messages */}
        <div className="flex-1 flex flex-col min-h-0 overflow-hidden">
          <div className="flex-1 overflow-y-auto px-5 py-4">
            {messages.length === 0 ? (
              <div className="flex flex-col items-center justify-center h-full text-slate-400 gap-3">
                <Mail className="w-10 h-10 opacity-30" />
                <p className="text-sm">No messages synced yet.</p>
                <button
                  onClick={handleSync}
                  disabled={syncing}
                  className="flex items-center gap-1.5 px-4 py-2 text-sm font-medium text-white bg-slate-700 rounded-lg hover:bg-slate-800 disabled:opacity-50 transition-colors"
                >
                  <RefreshCw className={`w-4 h-4 ${syncing ? 'animate-spin' : ''}`} />
                  Fetch from Smartlead
                </button>
              </div>
            ) : (
              <>
                {messages.map(msg => <MessageBubble key={msg.id} msg={msg} />)}
                <div ref={messagesEndRef} />
              </>
            )}
          </div>

          {/* Reply + Notes */}
          <div className="border-t border-slate-200 p-4 space-y-4 bg-white shrink-0">
            <ReplyComposer
              convId={convId}
              subject={conv.latest_subject}
              hasLeadId={!!conv.smartlead_lead_id}
              onSent={load}
            />
            <div>
              <label className="block text-xs font-medium text-slate-500 mb-1.5">Internal Notes</label>
              <textarea
                value={notes}
                onChange={e => setNotes(e.target.value)}
                rows={2}
                placeholder="Private notes visible only to admins…"
                className="w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-slate-300 resize-none"
              />
              <div className="flex justify-end mt-1.5">
                <button
                  onClick={saveNotes}
                  disabled={savingNotes}
                  className="text-xs text-slate-600 hover:text-slate-900 disabled:opacity-50"
                >
                  {savingNotes ? 'Saving…' : 'Save notes'}
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Right sidebar: enrichment */}
        <div className="w-72 shrink-0 border-l border-slate-200 overflow-y-auto p-4 space-y-4 bg-slate-50 hidden xl:block">
          <EnrichmentPanel enrichment={enrichment} campaign={campaign} />

          {conv.messages_synced_at && (
            <p className="text-xs text-slate-400 text-center">
              Last synced {fmtDate(conv.messages_synced_at)}
            </p>
          )}
        </div>
      </div>
    </div>
  );
}

// ─── Sync job types ───────────────────────────────────────────────────────────

interface SyncStats {
  campaigns_total: number;
  campaigns_processed: number;
  leads_processed: number;
  conversations_upserted: number;
  inbox_worthy_leads: number;
  message_histories_fetched: number;
  messages_inserted: number;
}

type SyncPhase = 'idle' | 'starting' | 'running' | 'success' | 'error';

// ─── Main Page ────────────────────────────────────────────────────────────────

export default function WpAdminSmartleadInboxPage() {
  const [conversations, setConversations] = useState<Conversation[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [status, setStatus] = useState('all');
  const [search, setSearch] = useState('');
  const [searchInput, setSearchInput] = useState('');
  const [loading, setLoading] = useState(true);
  const [authError, setAuthError] = useState(false);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [counts, setCounts] = useState<Record<string, number>>({});

  // ── Sync job state (admin-only, never touches public pages) ──────────────
  const [syncPhase, setSyncPhase] = useState<SyncPhase>('idle');
  const [syncStats, setSyncStats] = useState<SyncStats | null>(null);
  const [syncError, setSyncError] = useState<string | null>(null);
  const syncRunningRef = useRef(false);   // prevents duplicate concurrent syncs
  const autoSyncFiredRef = useRef(false); // fires auto-sync only once per page mount

  const LIMIT = 25;

  const loadConversations = useCallback(async () => {
    setLoading(true);
    try {
      let url = `smartlead-crm-inbox?action=list&page=${page}&limit=${LIMIT}&status=${status}`;
      if (search) url += `&search=${encodeURIComponent(search)}`;

      const res = await adminApiFetch<{
        ok: boolean;
        conversations: Conversation[];
        total: number;
        error?: string;
      }>(url);

      if (!res.ok) throw new Error(res.error?.message ?? 'Failed to load');
      setConversations(res.data?.conversations ?? []);
      setTotal(res.data?.total ?? 0);
      setAuthError(false);
      return res.data?.total ?? 0;
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.includes('Unauthorized') || msg.includes('401')) setAuthError(true);
      return 0;
    } finally {
      setLoading(false);
    }
  }, [page, status, search]);

  const loadCounts = useCallback(async () => {
    try {
      const res = await adminApiFetch<{ ok: boolean; counts: Record<string, number> }>(
        'smartlead-crm-inbox?action=counts'
      );
      if (res.ok && res.data) setCounts(res.data.counts ?? {});
    } catch {}
  }, []);

  // ── Tick loop: calls tick until done, refreshes list on each progress ────
  const runTickLoop = useCallback(async (jobId: string) => {
    let done = false;
    let consecutiveErrors = 0;

    while (!done) {
      try {
        const res = await adminApiFetch<{
          ok: boolean;
          done: boolean;
          status: string;
          stats: SyncStats;
          error?: string;
        }>(`smartlead-sync-job?action=tick`, {
          method: 'POST',
          body: { job_id: jobId },
          timeoutMs: 30000,
        });

        if (!res.ok) {
          consecutiveErrors++;
          if (consecutiveErrors >= 3) {
            setSyncPhase('error');
            setSyncError(res.error?.message ?? 'Tick failed');
            break;
          }
          await new Promise(r => setTimeout(r, 1500));
          continue;
        }

        consecutiveErrors = 0;
        const d = res.data!;
        if (d.stats) setSyncStats(d.stats);

        // Refresh the list on every tick so conversations appear progressively
        await loadConversations();
        await loadCounts();

        if (d.done) {
          done = true;
          setSyncPhase(d.status === 'success' ? 'success' : 'error');
          if (d.status !== 'success') setSyncError('Sync ended with errors');
        } else {
          setSyncPhase('running');
          // Brief pause between ticks to stay responsive
          await new Promise(r => setTimeout(r, 300));
        }
      } catch (e) {
        consecutiveErrors++;
        if (consecutiveErrors >= 3) {
          setSyncPhase('error');
          setSyncError(e instanceof Error ? e.message : 'Tick failed');
          break;
        }
        await new Promise(r => setTimeout(r, 1500));
      }
    }

    syncRunningRef.current = false;
  }, [loadConversations, loadCounts]);

  // ── startSync: kickoff → tick loop. Prevents duplicate runs. ─────────────
  const startSync = useCallback(async (triggeredBy = 'manual') => {
    if (syncRunningRef.current) return;
    syncRunningRef.current = true;
    setSyncPhase('starting');
    setSyncError(null);
    setSyncStats(null);

    try {
      const res = await adminApiFetch<{
        ok: boolean;
        job_id: string;
        status: string;
        already_running: boolean;
        stats?: SyncStats;
        error?: string;
      }>('smartlead-sync-job?action=kickoff', {
        method: 'POST',
        body: { triggered_by: triggeredBy },
        timeoutMs: 20000,
      });

      if (!res.ok) {
        setSyncPhase('error');
        setSyncError(res.error?.message ?? 'Kickoff failed');
        syncRunningRef.current = false;
        return;
      }

      const { job_id, stats } = res.data!;
      if (stats) setSyncStats(stats);
      setSyncPhase('running');

      // If there was already a running job the kickoff returned it — resume it
      await runTickLoop(job_id);
    } catch (e) {
      setSyncPhase('error');
      setSyncError(e instanceof Error ? e.message : 'Sync failed');
      syncRunningRef.current = false;
    }
  }, [runTickLoop]);

  // ── On mount: load data, then auto-sync if inbox is empty ────────────────
  useEffect(() => {
    async function init() {
      const [total] = await Promise.all([loadConversations(), loadCounts()]);
      // Auto-sync only once per page mount, only if inbox is empty
      if (!autoSyncFiredRef.current && total === 0 && !syncRunningRef.current) {
        autoSyncFiredRef.current = true;
        startSync('auto');
      }
    }
    init();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Reload when filter/pagination changes (not on mount — init() handles that)
  useEffect(() => {
    loadConversations();
  }, [loadConversations]);

  useEffect(() => {
    loadCounts();
  }, [loadCounts]);

  // Debounce search
  useEffect(() => {
    const t = setTimeout(() => { setSearch(searchInput); setPage(1); }, 350);
    return () => clearTimeout(t);
  }, [searchInput]);

  function handleStatusChange(id: string, newStatus: string) {
    setConversations(prev =>
      prev.map(c => c.id === id ? { ...c, status: newStatus } : c)
    );
    loadCounts();
  }

  // ── Sync status display text ──────────────────────────────────────────────
  function buildSyncLabel(): string {
    if (syncPhase === 'starting') return 'Starting sync…';
    if (syncPhase === 'running' && syncStats) {
      const parts = [`${syncStats.campaigns_processed}/${syncStats.campaigns_total} campaigns`];
      if (syncStats.inbox_worthy_leads > 0) parts.push(`${syncStats.inbox_worthy_leads} worthy leads`);
      if (syncStats.conversations_upserted > 0) parts.push(`${syncStats.conversations_upserted} reply convs`);
      if (syncStats.messages_inserted > 0) parts.push(`${syncStats.messages_inserted} msgs`);
      return `Syncing… · ${parts.join(' · ')}`;
    }
    if (syncPhase === 'running') return 'Syncing Smartlead inbox…';
    if (syncPhase === 'success' && syncStats) {
      const convs = syncStats.conversations_upserted;
      const msgs = syncStats.messages_inserted;
      if (convs === 0) return `Sync complete · No reply conversations found (${syncStats.leads_processed} leads scanned)`;
      return `Sync complete · ${convs} reply conversation${convs !== 1 ? 's' : ''} · ${msgs} message${msgs !== 1 ? 's' : ''}`;
    }
    if (syncPhase === 'error') return `Sync error: ${syncError ?? 'Unknown error'}`;
    return '';
  }

  const isSyncing = syncPhase === 'starting' || syncPhase === 'running';
  const syncLabel = buildSyncLabel();

  if (authError) {
    return (
      <EmailModuleLayout title="Cold Outreach Inbox">
        <AdminReAuthCard onSuccess={() => { setAuthError(false); loadConversations(); }} />
      </EmailModuleLayout>
    );
  }

  const totalPages = Math.ceil(total / LIMIT);

  return (
    <EmailModuleLayout title="Cold Outreach Inbox">
      <div className="flex items-center justify-between mb-3 gap-3">
        <div className="flex-1 min-w-0">
          {syncLabel && (
            <p className={`text-xs truncate ${syncPhase === 'error' ? 'text-red-600' : 'text-slate-500'}`}>
              {syncLabel}
            </p>
          )}
        </div>
        <button
          onClick={() => startSync('manual')}
          disabled={isSyncing}
          title="Fetch all leads from Smartlead API and populate the inbox (runs in background chunks)"
          className="shrink-0 flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-white bg-slate-700 rounded-lg hover:bg-slate-800 disabled:opacity-50 transition-colors"
        >
          <RefreshCw className={`w-3.5 h-3.5 ${isSyncing ? 'animate-spin' : ''}`} />
          {isSyncing ? 'Syncing…' : 'Sync Smartlead Inbox'}
        </button>
      </div>
      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden flex h-[calc(100vh-260px)] min-h-[500px]">
        {/* Sidebar */}
        <div className={`w-80 shrink-0 flex flex-col border-r border-slate-200 ${selectedId ? 'hidden lg:flex' : 'flex'}`}>
          {/* Search */}
          <div className="p-3 border-b border-slate-100">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
              <input
                type="text"
                value={searchInput}
                onChange={e => setSearchInput(e.target.value)}
                placeholder="Search by email…"
                className="w-full pl-9 pr-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300"
              />
            </div>
          </div>

          {/* Status tabs */}
          <div className="flex gap-0.5 px-3 py-2 border-b border-slate-100 overflow-x-auto">
            {STATUS_TABS.map(tab => (
              <button
                key={tab.key}
                onClick={() => { setStatus(tab.key); setPage(1); setSelectedId(null); }}
                className={`shrink-0 flex items-center gap-1 px-2.5 py-1 rounded-lg text-xs font-medium transition-colors ${
                  status === tab.key
                    ? 'bg-slate-800 text-white'
                    : 'text-slate-500 hover:bg-slate-100 hover:text-slate-800'
                }`}
              >
                {tab.label}
                {tab.key !== 'all' && counts[tab.key] > 0 && (
                  <span className={`text-xs px-1 rounded-full ${
                    status === tab.key ? 'bg-white/20' : 'bg-slate-200'
                  }`}>
                    {counts[tab.key]}
                  </span>
                )}
                {tab.key === 'all' && counts.all > 0 && (
                  <span className={`text-xs px-1 rounded-full ${
                    status === tab.key ? 'bg-white/20' : 'bg-slate-200'
                  }`}>
                    {counts.all}
                  </span>
                )}
              </button>
            ))}
          </div>

          {/* List */}
          <div className="flex-1 overflow-y-auto">
            {loading ? (
              <div className="flex items-center justify-center h-32">
                <div className="w-5 h-5 border-2 border-slate-300 border-t-slate-600 rounded-full animate-spin" />
              </div>
            ) : conversations.length === 0 ? (
              <div className="flex flex-col items-center justify-center h-40 text-slate-400 gap-2 px-5 text-center">
                <Inbox className="w-8 h-8 opacity-30" />
                <p className="text-sm font-medium text-slate-500">No reply conversations yet</p>
                <p className="text-xs leading-relaxed">
                  {isSyncing
                    ? 'Sync in progress — reply threads will appear here as they\'re found.'
                    : 'Inbox shows only leads that have replied or engaged. Run a sync to check for new replies.'}
                </p>
              </div>
            ) : (
              conversations.map(conv => (
                <ConvListItem
                  key={conv.id}
                  conv={conv}
                  selected={selectedId === conv.id}
                  onClick={() => setSelectedId(conv.id)}
                />
              ))
            )}
          </div>

          {/* Pagination */}
          {totalPages > 1 && (
            <div className="flex items-center justify-between px-4 py-2.5 border-t border-slate-100">
              <button
                disabled={page === 1}
                onClick={() => setPage(p => p - 1)}
                className="text-xs text-slate-500 hover:text-slate-800 disabled:opacity-40"
              >
                Prev
              </button>
              <span className="text-xs text-slate-400">{page} / {totalPages}</span>
              <button
                disabled={page >= totalPages}
                onClick={() => setPage(p => p + 1)}
                className="text-xs text-slate-500 hover:text-slate-800 disabled:opacity-40"
              >
                Next
              </button>
            </div>
          )}
        </div>

        {/* Detail */}
        {selectedId ? (
          <DetailPanel
            key={selectedId}
            convId={selectedId}
            onBack={() => setSelectedId(null)}
            onStatusChange={handleStatusChange}
          />
        ) : (
          <div className="flex-1 hidden lg:flex flex-col items-center justify-center text-slate-400 gap-3">
            <Mail className="w-12 h-12 opacity-20" />
            <p className="text-sm">Select a conversation to view</p>
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
