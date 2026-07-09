import { useState } from 'react';
import {
  Mail, Globe, MapPin, Monitor, Clock, Tag, User, Building2,
  CreditCard, MessageSquare, Send, Loader, CheckCircle,
  AlertTriangle, ExternalLink, RefreshCw, FileText, ShoppingBag,
  Repeat, ChevronDown, ChevronRight, ArrowDownLeft, ArrowUpRight,
} from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────────

export interface ContactMessage {
  id: string;
  created_at: string;
  full_name: string;
  email: string;
  subject: string;
  message: string;
  status: string;
  category: string | null;
  internal_notes: string | null;
  assigned_to: string | null;
  ip_address: string | null;
  user_agent: string | null;
  country_code: string | null;
  country_name: string | null;
  city: string | null;
  device_type: string | null;
  page_url: string | null;
  page_path: string | null;
  referrer_url: string | null;
  utm_source: string | null;
  utm_medium: string | null;
  utm_campaign: string | null;
  outbound_reply_count: number;
  replied_at: string | null;
  replied_by: string | null;
  email_normalized: string | null;
}

export interface Enrichment {
  is_known: boolean;
  person_type: string;
  agencies: { id: string; name: string; slug: string; state_slug: string; website_url: string | null }[];
  customer: { customer_id: string; name: string | null; email: string; created_at: string } | null;
  orders: { id: number; amount_total: number; currency: string; payment_status: string; created_at: string; product_summary: string | null; state_slug: string | null; agency_name: string | null }[];
  total_paid_usd: number;
  active_subscription: { subscription_id: string; status: string; current_period_end: number | null; cancel_at_period_end: boolean } | null;
  prior_messages_count: number;
  prior_messages: { id: string; created_at: string; subject: string; status: string; outbound_reply_count: number }[];
}

export interface Reply {
  id: string;
  direction: string;
  subject: string | null;
  body_text: string;
  to_email: string;
  from_email: string | null;
  from_name: string | null;
  sent_at: string;
  sent_by: string | null;
  delivery_status: string;
}

export interface DetailData {
  message: ContactMessage;
  enrichment: Enrichment;
  replies: Reply[];
  thread_messages: { id: string; created_at: string; subject: string; message: string; status: string; page_url: string | null; page_path: string | null }[];
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

function fmt(d: string) {
  try {
    return new Date(d).toLocaleString('en-US', { month: 'short', day: 'numeric', year: 'numeric', hour: '2-digit', minute: '2-digit' });
  } catch { return d; }
}

function fmtShort(d: string) {
  try { return new Date(d).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' }); }
  catch { return d; }
}

function relTime(d: string) {
  try {
    const diff = Date.now() - new Date(d).getTime();
    const m = Math.floor(diff / 60000);
    if (m < 1)  return 'just now';
    if (m < 60) return `${m}m ago`;
    const h = Math.floor(m / 60);
    if (h < 24) return `${h}h ago`;
    const days = Math.floor(h / 24);
    if (days < 7) return `${days}d ago`;
    return fmtShort(d);
  } catch { return ''; }
}

const STATUS_STYLES: Record<string, string> = {
  new:     'bg-blue-50 text-blue-700 border-blue-200',
  open:    'bg-amber-50 text-amber-700 border-amber-200',
  replied: 'bg-emerald-50 text-emerald-700 border-emerald-200',
  closed:  'bg-slate-100 text-slate-600 border-slate-200',
  spam:    'bg-red-50 text-red-600 border-red-200',
};

export function StatusBadge({ status }: { status: string }) {
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium border ${STATUS_STYLES[status] ?? STATUS_STYLES.new}`}>
      {status}
    </span>
  );
}

// ─── Collapsible mini accordion ───────────────────────────────────────────────

function Accordion({ title, icon, children, defaultOpen = false }: {
  title: string; icon?: React.ReactNode; children: React.ReactNode; defaultOpen?: boolean;
}) {
  const [open, setOpen] = useState(defaultOpen);
  return (
    <div className="border border-slate-100 rounded-xl overflow-hidden">
      <button
        onClick={() => setOpen(o => !o)}
        className="w-full flex items-center justify-between px-3.5 py-2.5 bg-slate-50/70 hover:bg-slate-100/80 transition-colors"
      >
        <div className="flex items-center gap-1.5 text-[11px] font-semibold text-slate-500 uppercase tracking-wide">
          {icon}{title}
        </div>
        {open
          ? <ChevronDown className="w-3 h-3 text-slate-400" />
          : <ChevronRight className="w-3 h-3 text-slate-400" />}
      </button>
      {open && <div className="px-3.5 py-3">{children}</div>}
    </div>
  );
}

// ─── Inbound message card ─────────────────────────────────────────────────────

function InboundCard({ msg }: { msg: ContactMessage }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white shadow-sm overflow-hidden">
      <div className="flex items-center gap-2.5 px-5 py-3 border-b border-slate-100 bg-slate-50/60">
        <div className="w-7 h-7 rounded-full bg-slate-200 flex items-center justify-center flex-shrink-0">
          <User className="w-3.5 h-3.5 text-slate-500" />
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <span className="text-sm font-semibold text-slate-900 truncate">{msg.full_name}</span>
            <ArrowDownLeft className="w-3 h-3 text-slate-400 flex-shrink-0" />
            <span className="text-[11px] text-slate-400 font-medium uppercase tracking-wide">Inbound</span>
          </div>
          <span className="text-xs text-slate-500">{msg.email}</span>
        </div>
        <div className="flex-shrink-0 text-right">
          <span className="text-[11px] text-slate-400 block">{relTime(msg.created_at)}</span>
          <span className="text-[10px] text-slate-300">{fmt(msg.created_at)}</span>
        </div>
      </div>
      <div className="px-5 py-4">
        <p className="text-sm text-slate-800 leading-relaxed whitespace-pre-wrap">{msg.message}</p>
      </div>
    </div>
  );
}

// ─── Outbound reply card ──────────────────────────────────────────────────────

function OutboundCard({ reply }: { reply: Reply }) {
  return (
    <div className="rounded-2xl border border-blue-200 bg-blue-50/60 shadow-sm overflow-hidden">
      <div className="flex items-center gap-2.5 px-5 py-3 border-b border-blue-100 bg-blue-50/80">
        <div className="w-7 h-7 rounded-full bg-blue-600 flex items-center justify-center flex-shrink-0">
          <Send className="w-3 h-3 text-white" />
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <span className="text-sm font-semibold text-blue-900">
              {reply.from_name ?? 'You'}
            </span>
            <ArrowUpRight className="w-3 h-3 text-blue-400 flex-shrink-0" />
            <span className="text-[11px] text-blue-500 font-semibold uppercase tracking-wide">You replied</span>
          </div>
          <span className="text-xs text-blue-500/70">
            {reply.sent_by ? `Sent by ${reply.sent_by}` : `To ${reply.to_email}`}
          </span>
        </div>
        <div className="flex-shrink-0 text-right">
          <span className="text-[11px] text-blue-400 block">{relTime(reply.sent_at)}</span>
          <span className="text-[10px] text-blue-300">{fmt(reply.sent_at)}</span>
        </div>
      </div>
      <div className="px-5 py-4">
        <p className="text-sm text-blue-900/80 leading-relaxed whitespace-pre-wrap">{reply.body_text}</p>
      </div>
    </div>
  );
}

// ─── Thread message card (prior inbound from same sender) ─────────────────────

function ThreadCard({ tm }: {
  tm: { id: string; created_at: string; subject: string; message: string; status: string; page_url: string | null; page_path: string | null };
}) {
  const [expanded, setExpanded] = useState(false);
  const isLong = tm.message.length > 300;
  return (
    <div className="rounded-xl border border-slate-150 bg-white/70 shadow-sm overflow-hidden">
      <div className="flex items-center gap-2 px-4 py-2.5 border-b border-slate-100 bg-slate-50/50">
        <ArrowDownLeft className="w-3 h-3 text-slate-400 flex-shrink-0" />
        <span className="text-xs font-medium text-slate-600 truncate flex-1">{tm.subject}</span>
        <StatusBadge status={tm.status} />
        <span className="text-[11px] text-slate-400 flex-shrink-0">{relTime(tm.created_at)}</span>
      </div>
      <div className="px-4 py-3">
        <p className={`text-xs text-slate-600 leading-relaxed whitespace-pre-wrap ${!expanded && isLong ? 'line-clamp-4' : ''}`}>
          {tm.message}
        </p>
        {isLong && (
          <button
            onClick={() => setExpanded(e => !e)}
            className="mt-1.5 text-[11px] text-blue-500 hover:text-blue-700 font-medium"
          >
            {expanded ? 'Show less' : 'Show more'}
          </button>
        )}
      </div>
    </div>
  );
}

// ─── Conversation thread ──────────────────────────────────────────────────────

function ConversationThread({
  msg, replies, threadMessages,
}: {
  msg: ContactMessage;
  replies: Reply[];
  threadMessages: { id: string; created_at: string; subject: string; message: string; status: string; page_url: string | null; page_path: string | null }[];
}) {
  const priorMessages = threadMessages.filter(tm => tm.id !== msg.id);

  const allItems: { type: 'inbound' | 'outbound' | 'thread'; ts: string; data: unknown }[] = [
    ...priorMessages.map(tm => ({ type: 'thread' as const, ts: tm.created_at, data: tm })),
    { type: 'inbound' as const, ts: msg.created_at, data: msg },
    ...replies.map(r => ({ type: 'outbound' as const, ts: r.sent_at, data: r })),
  ].sort((a, b) => new Date(a.ts).getTime() - new Date(b.ts).getTime());

  return (
    <div className="space-y-4">
      {allItems.map((item, idx) => {
        if (item.type === 'inbound') {
          return <InboundCard key={`inbound-${idx}`} msg={item.data as ContactMessage} />;
        }
        if (item.type === 'outbound') {
          return <OutboundCard key={`outbound-${(item.data as Reply).id}`} reply={item.data as Reply} />;
        }
        return (
          <ThreadCard
            key={`thread-${(item.data as { id: string }).id}`}
            tm={item.data as { id: string; created_at: string; subject: string; message: string; status: string; page_url: string | null; page_path: string | null }}
          />
        );
      })}
    </div>
  );
}

// ─── Reply composer ────────────────────────────────────────────────────────────

export function ReplyComposer({
  message, onSent,
}: {
  message: ContactMessage;
  onSent: () => void;
}) {
  const [body, setBody] = useState('');
  const [sending, setSending] = useState(false);
  const [sent, setSent] = useState(false);
  const [error, setError] = useState('');

  const SUPABASE_URL = (window as any).__SUPABASE_URL__ ?? import.meta.env.VITE_SUPABASE_URL ?? '';
  const ANON_KEY     = (window as any).__SUPABASE_ANON_KEY__ ?? import.meta.env.VITE_SUPABASE_ANON_KEY ?? '';

  const getAdminToken = () => localStorage.getItem('gappsy_admin_token') ?? '';

  const handleSend = async () => {
    if (!body.trim()) return;
    setSending(true);
    setError('');
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/contact-inbox-reply`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${ANON_KEY}`,
          'x-admin-token': getAdminToken(),
        },
        body: JSON.stringify({
          contact_message_id: message.id,
          subject: `Re: ${message.subject}`,
          body_text: body.trim(),
          to_email: message.email,
          to_name: message.full_name,
        }),
      });
      const rawText = await res.text();
      let data: { ok: boolean; error?: string } = { ok: false, error: rawText };
      try { data = JSON.parse(rawText); } catch { /* use rawText as error message */ }
      if (!data.ok) throw new Error(data.error ?? `Server error ${res.status}`);
      setSent(true);
      setBody('');
      setTimeout(() => { setSent(false); onSent(); }, 2000);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to send');
    } finally {
      setSending(false);
    }
  };

  return (
    <div className="rounded-2xl border border-slate-200 bg-white shadow-sm overflow-hidden">
      <div className="flex items-center justify-between px-5 py-3 border-b border-slate-100 bg-slate-50/60">
        <div className="flex items-center gap-2">
          <div className="w-6 h-6 rounded-full bg-blue-600 flex items-center justify-center">
            <Send className="w-3 h-3 text-white" />
          </div>
          <div>
            <div className="text-sm font-semibold text-slate-800">Reply to {message.full_name}</div>
            <div className="text-xs text-slate-400">Re: {message.subject}</div>
          </div>
        </div>
        <span className="text-xs text-slate-400 bg-slate-100 px-2 py-0.5 rounded-full">{message.email}</span>
      </div>
      <textarea
        value={body}
        onChange={e => setBody(e.target.value)}
        placeholder="Write your reply…"
        rows={5}
        className="w-full px-5 py-4 text-sm text-slate-800 placeholder:text-slate-400 focus:outline-none resize-none bg-white"
      />
      {error && (
        <div className="px-5 pb-3 flex items-start gap-2 text-xs text-red-600 bg-red-50/50 border-t border-red-100 py-2.5">
          <AlertTriangle className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" />
          <span>{error}</span>
        </div>
      )}
      <div className="flex items-center justify-end px-5 py-3 border-t border-slate-100 bg-slate-50/40">
        <button
          onClick={handleSend}
          disabled={sending || !body.trim() || sent}
          className="flex items-center gap-2 px-5 py-2 text-sm font-semibold rounded-xl bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 transition-colors shadow-sm"
        >
          {sending
            ? <Loader className="w-4 h-4 animate-spin" />
            : sent
            ? <CheckCircle className="w-4 h-4" />
            : <Send className="w-4 h-4" />}
          {sent ? 'Sent!' : sending ? 'Sending…' : 'Send Reply'}
        </button>
      </div>
    </div>
  );
}

// ─── CRM identity card ────────────────────────────────────────────────────────

function CRMCard({ e }: { e: Enrichment }) {
  const typeLabel: Record<string, { label: string; color: string }> = {
    agency_customer: { label: 'Agency + Customer', color: 'bg-emerald-100 text-emerald-800' },
    customer:        { label: 'Customer',           color: 'bg-blue-100 text-blue-800' },
    agency:          { label: 'Agency',             color: 'bg-amber-100 text-amber-800' },
    lead:            { label: 'Lead',               color: 'bg-slate-100 text-slate-600' },
    unknown:         { label: 'Unknown',            color: 'bg-slate-100 text-slate-400' },
  };
  const type = typeLabel[e.person_type] ?? typeLabel.unknown;

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold ${type.color}`}>
          {type.label}
        </span>
        {!e.is_known && (
          <span className="text-[11px] text-slate-400">Not in database</span>
        )}
      </div>

      {e.agencies.length > 0 && (
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-1.5">
            <Building2 className="w-3 h-3" /> Agency
          </div>
          {e.agencies.map(ag => (
            <div key={ag.id} className="p-2.5 bg-amber-50 border border-amber-100 rounded-xl">
              <div className="font-semibold text-sm text-slate-900">{ag.name}</div>
              <div className="text-[11px] text-slate-500 mt-0.5">{ag.state_slug} · /{ag.slug}</div>
              {ag.website_url && (
                <a href={ag.website_url} target="_blank" rel="noopener noreferrer"
                  className="text-[11px] text-blue-600 hover:underline inline-flex items-center gap-0.5 mt-0.5">
                  {ag.website_url} <ExternalLink className="w-2.5 h-2.5" />
                </a>
              )}
            </div>
          ))}
        </div>
      )}

      {e.customer && (
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-1.5">
            <CreditCard className="w-3 h-3" /> Customer
          </div>
          <div className="p-2.5 bg-blue-50 border border-blue-100 rounded-xl">
            <div className="font-semibold text-sm text-slate-900">{e.customer.name ?? e.customer.email}</div>
            <div className="text-[11px] text-slate-500 mt-0.5">Since {fmtShort(e.customer.created_at)}</div>
            {e.total_paid_usd > 0 && (
              <div className="text-sm font-bold text-emerald-700 mt-1">${e.total_paid_usd.toFixed(2)} total paid</div>
            )}
          </div>
        </div>
      )}

      {e.active_subscription && (
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-1.5">
            <Repeat className="w-3 h-3" /> Subscription
          </div>
          <div className="p-2.5 bg-emerald-50 border border-emerald-100 rounded-xl">
            <div className="font-semibold text-sm text-emerald-900 capitalize">{e.active_subscription.status}</div>
            {e.active_subscription.current_period_end && (
              <div className="text-[11px] text-slate-500 mt-0.5">
                Renews {fmtShort(new Date(e.active_subscription.current_period_end * 1000).toISOString())}
              </div>
            )}
            {e.active_subscription.cancel_at_period_end && (
              <div className="text-[11px] text-amber-700 mt-0.5 font-medium">Cancels at period end</div>
            )}
          </div>
        </div>
      )}

      {e.orders.length > 0 && (
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-1.5">
            <ShoppingBag className="w-3 h-3" /> Orders ({e.orders.length})
          </div>
          <div className="border border-slate-100 rounded-xl overflow-hidden divide-y divide-slate-100">
            {e.orders.map(o => (
              <div key={o.id} className="flex items-center justify-between px-3 py-2 bg-white">
                <span className="text-xs text-slate-600 truncate pr-2">{o.product_summary ?? 'Order'}</span>
                <span className={`text-xs font-semibold flex-shrink-0 ${o.payment_status === 'paid' ? 'text-emerald-700' : 'text-slate-500'}`}>
                  ${((o.amount_total ?? 0) / 100).toFixed(2)}
                </span>
              </div>
            ))}
          </div>
        </div>
      )}

      {e.prior_messages_count > 1 && (
        <div className="flex items-center gap-1.5 text-xs text-slate-500 bg-slate-50 rounded-xl px-3 py-2 border border-slate-100">
          <MessageSquare className="w-3.5 h-3.5 text-slate-400" />
          {e.prior_messages_count} total messages from this email
        </div>
      )}
    </div>
  );
}

// ─── Notes editor ─────────────────────────────────────────────────────────────

function NotesEditor({ message, onSave }: {
  message: ContactMessage;
  onSave: (notes: string, category: string | null) => void;
}) {
  const [notes, setNotes]       = useState(message.internal_notes ?? '');
  const [category, setCategory] = useState(message.category ?? '');
  const [dirty, setDirty]       = useState(false);

  const CATEGORIES = ['', 'support', 'sales', 'partnership', 'other', 'spam'];

  return (
    <div className="space-y-2">
      <select
        value={category}
        onChange={e => { setCategory(e.target.value); setDirty(true); }}
        className="w-full text-xs border border-slate-200 rounded-lg px-3 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500"
      >
        <option value="">No category</option>
        {CATEGORIES.filter(Boolean).map(c => <option key={c} value={c}>{c}</option>)}
      </select>
      <textarea
        value={notes}
        onChange={e => { setNotes(e.target.value); setDirty(true); }}
        placeholder="Internal notes (not sent to sender)…"
        rows={3}
        className="w-full text-xs border border-slate-200 rounded-lg px-3 py-2 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
      />
      {dirty && (
        <button
          onClick={() => { onSave(notes, category || null); setDirty(false); }}
          className="text-xs px-3 py-1.5 bg-slate-800 text-white rounded-lg hover:bg-slate-700 transition-colors"
        >
          Save Notes
        </button>
      )}
    </div>
  );
}

// ─── Submission metadata ───────────────────────────────────────────────────────

function SubmissionMeta({ msg }: { msg: ContactMessage }) {
  const rows = [
    msg.page_url   && { label: 'Page',    val: msg.page_url, link: true },
    msg.referrer_url && { label: 'Referrer', val: msg.referrer_url },
    (msg.utm_source || msg.utm_medium || msg.utm_campaign) && {
      label: 'UTM',
      val: [msg.utm_source, msg.utm_medium, msg.utm_campaign].filter(Boolean).join(' / '),
    },
    (msg.city || msg.country_name) && {
      label: 'Location',
      val: [msg.city, msg.country_name, msg.country_code && `(${msg.country_code})`].filter(Boolean).join(' '),
    },
    msg.device_type  && { label: 'Device', val: msg.device_type },
    msg.ip_address   && { label: 'IP',     val: msg.ip_address },
  ].filter(Boolean) as { label: string; val: string; link?: boolean }[];

  if (rows.length === 0) return <p className="text-xs text-slate-400">No context data</p>;

  return (
    <div className="space-y-1.5">
      {rows.map(r => (
        <div key={r.label} className="flex items-start gap-2 text-[11px]">
          <span className="w-14 flex-shrink-0 text-slate-400 font-medium pt-0.5">{r.label}</span>
          {r.link
            ? <a href={r.val} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline break-all flex items-center gap-0.5">
                {r.val} <ExternalLink className="w-2.5 h-2.5 flex-shrink-0" />
              </a>
            : <span className="text-slate-600 break-all">{r.val}</span>}
        </div>
      ))}
    </div>
  );
}

// ─── Context sidebar ──────────────────────────────────────────────────────────

function ContextSidebar({
  msg, enrichment, onStatusChange, onNotesSave,
}: {
  msg: ContactMessage;
  enrichment: Enrichment;
  onStatusChange: (id: string, status: string) => void;
  onNotesSave: (id: string, notes: string, category: string | null) => void;
}) {
  const STATUSES = ['new', 'open', 'replied', 'closed', 'spam'];

  return (
    <div className="w-72 xl:w-80 flex-shrink-0 border-l border-slate-200 bg-white overflow-y-auto">
      <div className="px-4 py-4 space-y-4">

        {/* Status */}
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-2">
            <Tag className="w-3 h-3" /> Status
          </div>
          <select
            value={msg.status}
            onChange={e => onStatusChange(msg.id, e.target.value)}
            className="w-full text-xs border border-slate-200 rounded-lg px-3 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            {STATUSES.map(s => <option key={s} value={s}>{s}</option>)}
          </select>
          {msg.replied_at && (
            <div className="mt-1.5 text-[11px] text-slate-400">
              Replied {relTime(msg.replied_at)}
              {msg.replied_by && <span className="text-slate-300"> · {msg.replied_by}</span>}
            </div>
          )}
          {msg.outbound_reply_count > 0 && (
            <div className="flex items-center gap-1 mt-1 text-[11px] text-slate-400">
              <MessageSquare className="w-3 h-3" />
              {msg.outbound_reply_count} {msg.outbound_reply_count === 1 ? 'reply' : 'replies'} sent
            </div>
          )}
        </div>

        <div className="border-t border-slate-100" />

        {/* CRM identity */}
        <div>
          <div className="flex items-center gap-1 text-[11px] text-slate-400 font-semibold uppercase tracking-wide mb-2">
            <User className="w-3 h-3" /> Sender
          </div>
          <CRMCard e={enrichment} />
        </div>

        <div className="border-t border-slate-100" />

        {/* Notes */}
        <Accordion title="Internal Notes" icon={<FileText className="w-3 h-3" />} defaultOpen={!!(msg.internal_notes || msg.category)}>
          <NotesEditor
            message={msg}
            onSave={(notes, category) => onNotesSave(msg.id, notes, category)}
          />
        </Accordion>

        {/* Submission metadata */}
        <Accordion title="Submission Details" icon={<Globe className="w-3 h-3" />} defaultOpen={false}>
          <SubmissionMeta msg={msg} />
        </Accordion>

        {/* Device/UA */}
        {msg.user_agent && (
          <Accordion title="User Agent" icon={<Monitor className="w-3 h-3" />} defaultOpen={false}>
            <p className="text-[10px] text-slate-400 break-all font-mono leading-relaxed">{msg.user_agent}</p>
          </Accordion>
        )}

      </div>
    </div>
  );
}

// ─── Detail header ────────────────────────────────────────────────────────────

function DetailHeader({
  msg, onRefresh,
}: {
  msg: ContactMessage;
  onRefresh: () => void;
}) {
  return (
    <div className="flex-shrink-0 px-6 py-4 bg-white border-b border-slate-200">
      <div className="flex items-start justify-between gap-4">
        <div className="flex-1 min-w-0">
          <h2 className="text-base font-bold text-slate-900 leading-snug truncate mb-1">
            {msg.subject}
          </h2>
          <div className="flex items-center gap-2 flex-wrap">
            <div className="flex items-center gap-1.5">
              <div className="w-5 h-5 rounded-full bg-slate-200 flex items-center justify-center flex-shrink-0">
                <User className="w-2.5 h-2.5 text-slate-500" />
              </div>
              <span className="text-sm font-semibold text-slate-800">{msg.full_name}</span>
            </div>
            <span className="text-sm text-slate-400">&lt;{msg.email}&gt;</span>
            <StatusBadge status={msg.status} />
          </div>
          <div className="flex items-center gap-3 mt-1.5 flex-wrap">
            <div className="flex items-center gap-1 text-xs text-slate-400">
              <Clock className="w-3 h-3" />
              {fmt(msg.created_at)}
            </div>
            {msg.page_path && (
              <div className="flex items-center gap-1 text-xs text-slate-400">
                <Globe className="w-3 h-3" />
                <span className="font-mono">{msg.page_path}</span>
              </div>
            )}
            {msg.country_name && (
              <div className="flex items-center gap-1 text-xs text-slate-400">
                <MapPin className="w-3 h-3" />
                {msg.country_name}
              </div>
            )}
          </div>
        </div>
        <button
          onClick={onRefresh}
          className="flex-shrink-0 p-2 rounded-xl border border-slate-200 hover:bg-slate-50 text-slate-500 hover:text-slate-700 transition-colors"
          title="Refresh"
        >
          <RefreshCw className="w-3.5 h-3.5" />
        </button>
      </div>
    </div>
  );
}

// ─── Main detail panel ────────────────────────────────────────────────────────

export function ContactDetailPanel({
  data, loading, error, onStatusChange, onNotesSave, onReplySent, onRefresh, onRetry,
}: {
  data: DetailData | null;
  loading: boolean;
  error?: string;
  onStatusChange: (id: string, status: string) => void;
  onNotesSave: (id: string, notes: string, category: string | null) => void;
  onReplySent: () => void;
  onRefresh: () => void;
  onRetry?: () => void;
}) {
  if (loading) {
    return (
      <div className="flex items-center justify-center h-full gap-3">
        <Loader className="w-5 h-5 animate-spin text-blue-500" />
        <span className="text-sm text-slate-500">Loading conversation…</span>
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex flex-col items-center justify-center h-full gap-4 px-8">
        <div className="w-12 h-12 rounded-full bg-red-50 flex items-center justify-center">
          <AlertTriangle className="w-6 h-6 text-red-400" />
        </div>
        <div className="text-center">
          <p className="text-sm font-semibold text-slate-800 mb-1">Failed to load message</p>
          <p className="text-xs text-slate-400 max-w-xs">{error}</p>
        </div>
        {onRetry && (
          <button
            onClick={onRetry}
            className="flex items-center gap-1.5 px-4 py-2 text-xs font-semibold rounded-xl bg-slate-900 text-white hover:bg-slate-700 transition-colors"
          >
            <RefreshCw className="w-3.5 h-3.5" /> Retry
          </button>
        )}
      </div>
    );
  }

  if (!data) {
    return (
      <div className="flex flex-col items-center justify-center h-full gap-3">
        <div className="w-16 h-16 rounded-full bg-slate-100 flex items-center justify-center">
          <Mail className="w-7 h-7 text-slate-300" />
        </div>
        <p className="text-sm font-medium text-slate-400">Select a message to start reading</p>
        <p className="text-xs text-slate-300">Messages appear on the left</p>
      </div>
    );
  }

  const { message: msg, enrichment, replies, thread_messages } = data;

  return (
    <div className="flex flex-col h-full overflow-hidden bg-slate-50/30">
      {/* Header */}
      <DetailHeader msg={msg} onRefresh={onRefresh} />

      {/* Body: two-column */}
      <div className="flex flex-1 min-h-0 overflow-hidden">

        {/* Conversation column */}
        <div className="flex-1 min-w-0 overflow-y-auto">
          <div className="max-w-2xl mx-auto px-5 py-5 space-y-4">

            {/* Conversation thread */}
            <ConversationThread
              msg={msg}
              replies={replies}
              threadMessages={thread_messages}
            />

            {/* Divider before composer */}
            <div className="flex items-center gap-3 pt-1">
              <div className="flex-1 border-t border-slate-200" />
              <span className="text-[11px] text-slate-400 font-medium uppercase tracking-wide">Reply</span>
              <div className="flex-1 border-t border-slate-200" />
            </div>

            {/* Reply composer */}
            <ReplyComposer message={msg} onSent={onReplySent} />

            <div className="pb-4" />
          </div>
        </div>

        {/* Context sidebar */}
        <ContextSidebar
          msg={msg}
          enrichment={enrichment}
          onStatusChange={onStatusChange}
          onNotesSave={onNotesSave}
        />
      </div>
    </div>
  );
}
