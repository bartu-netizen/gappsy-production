import { useEffect, useState, useCallback, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  ChevronLeft,
  Mail,
  Eye,
  MousePointerClick,
  Clock,
  CheckCircle,
  XCircle,
  AlertCircle,
  BarChart2,
  List,
  Link2,
  FileText,
  RefreshCw,
  Copy,
  Check,
  Send,
  Zap,
  Shield,
  ShieldOff,
  ExternalLink,
  Play,
  Bug,
  Loader,
} from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { useAdminSession } from '../../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../../lib/adminApiFetch';
import { AdminErrorBanner } from '../../components/admin/AdminErrorBanner';
import AdminReAuthCard from '../../components/admin/AdminReAuthCard';

interface EmailMessage {
  id: string;
  to_email: string;
  to_name?: string;
  subject: string;
  from_name: string;
  from_email: string;
  reply_to?: string;
  status: string;
  provider_message_id?: string;
  sent_at?: string;
  delivered_at?: string;
  created_at: string;
  html_body?: string;
  text_body?: string;
  body_preview?: string;
  final_body_html?: string;
  tracking_pixel_url?: string;
  tracking_enabled?: boolean;
}

interface EmailEvent {
  id: string;
  event_type: string;
  occurred_at: string;
  url?: string;
  user_agent?: string;
}

interface TrackingStats {
  delivered_count: number;
  open_total: number;
  open_unique: number;
  click_total: number;
  click_unique: number;
  last_open_at: string | null;
  last_click_at: string | null;
  clicks_by_url: { url: string; count: number; last_clicked_at: string }[];
  opens_by_hour: { hour: number; count: number }[];
  clicks_by_hour: { hour: number; count: number }[];
}

type Tab = 'overview' | 'timeline' | 'links' | 'message' | 'debug';

function fmtDate(iso?: string | null): string {
  if (!iso) return '\u2014';
  return new Date(iso).toLocaleString(undefined, {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

function fmtRelative(iso?: string | null): string {
  if (!iso) return '\u2014';
  const diff = Date.now() - new Date(iso).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 1) return 'just now';
  if (mins < 60) return `${mins}m ago`;
  const hrs = Math.floor(mins / 60);
  if (hrs < 24) return `${hrs}h ago`;
  return `${Math.floor(hrs / 24)}d ago`;
}

function StatusBadge({ status }: { status: string }) {
  const configs: Record<string, { cls: string; icon: React.ReactNode; label: string }> = {
    sent: { cls: 'bg-green-100 text-green-800 border-green-200', icon: <CheckCircle size={12} />, label: 'Sent' },
    delivered: { cls: 'bg-emerald-100 text-emerald-800 border-emerald-200', icon: <CheckCircle size={12} />, label: 'Delivered' },
    queued: { cls: 'bg-blue-100 text-blue-800 border-blue-200', icon: <Clock size={12} />, label: 'Queued' },
    failed: { cls: 'bg-red-100 text-red-800 border-red-200', icon: <XCircle size={12} />, label: 'Failed' },
  };
  const s = configs[status] || {
    cls: 'bg-gray-100 text-gray-700 border-gray-200',
    icon: null,
    label: status.charAt(0).toUpperCase() + status.slice(1),
  };
  return (
    <span className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold border ${s.cls}`}>
      {s.icon}{s.label}
    </span>
  );
}

function KpiCard({ label, value, sub, colorBg, icon, loading, tooltip }: {
  label: string; value: number | string; sub?: string;
  colorBg: string; icon: React.ReactNode; loading: boolean; tooltip?: string;
}) {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm" title={tooltip}>
      <div className="flex items-start justify-between mb-3">
        <p className="text-sm font-medium text-gray-500">{label}</p>
        <div className={`p-2 rounded-lg ${colorBg}`}>{icon}</div>
      </div>
      {loading ? (
        <>
          <div className="h-8 w-16 bg-gray-100 rounded animate-pulse mb-1" />
          <div className="h-3 w-24 bg-gray-100 rounded animate-pulse" />
        </>
      ) : (
        <>
          <p className="text-3xl font-bold text-gray-900">{value}</p>
          {sub && <p className="text-xs text-gray-500 mt-1">{sub}</p>}
        </>
      )}
    </div>
  );
}

function HourBarChart({ data, label, barColor }: {
  data: { hour: number; count: number }[]; label: string; barColor: string;
}) {
  const all24 = Array.from({ length: 24 }, (_, h) => ({
    hour: h,
    count: data.find((d) => d.hour === h)?.count || 0,
  }));
  const max = Math.max(...all24.map((d) => d.count), 1);
  return (
    <div>
      <p className="text-sm font-semibold text-gray-700 mb-3">{label}</p>
      <div className="flex items-end gap-1 h-24">
        {all24.map((d) => (
          <div key={d.hour} className="flex-1 flex flex-col items-center" title={`${d.hour}:00 — ${d.count}`}>
            <div
              className={`w-full rounded-t ${barColor}`}
              style={{ height: `${(d.count / max) * 88}px`, minHeight: d.count > 0 ? 4 : 0 }}
            />
          </div>
        ))}
      </div>
      <div className="flex justify-between text-xs text-gray-400 mt-1">
        <span>00:00</span><span>06:00</span><span>12:00</span><span>18:00</span><span>23:00</span>
      </div>
    </div>
  );
}

function SkeletonLine({ w = 'w-full', h = 'h-4' }: { w?: string; h?: string }) {
  return <div className={`${w} ${h} bg-gray-100 rounded animate-pulse`} />;
}

function EventIcon({ type }: { type: string }) {
  if (type === 'open') return (
    <div className="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
      <Eye size={14} className="text-blue-600" />
    </div>
  );
  if (type === 'click') return (
    <div className="w-8 h-8 rounded-full bg-green-100 flex items-center justify-center flex-shrink-0">
      <MousePointerClick size={14} className="text-green-600" />
    </div>
  );
  return (
    <div className="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center flex-shrink-0">
      <Zap size={14} className="text-gray-500" />
    </div>
  );
}

function highlightPixelLine(html: string): React.ReactNode {
  const lines = html.split('\n');
  return (
    <div className="font-mono text-xs whitespace-pre-wrap break-all">
      {lines.map((line, i) => {
        const isPixelLine = line.includes('/functions/v1/email-track-open') || line.includes('email-track-open');
        return (
          <div
            key={i}
            className={isPixelLine ? 'bg-yellow-900/40 text-yellow-300 px-1 rounded' : 'text-green-400'}
          >
            {line || ' '}
          </div>
        );
      })}
    </div>
  );
}

function TrackingDebugPanel({
  message,
  events,
  stats,
  onRefresh,
}: {
  message: EmailMessage;
  events: EmailEvent[];
  stats: TrackingStats | null;
  onRefresh: () => void;
}) {
  const [simulateStatus, setSimulateStatus] = useState<'idle' | 'loading' | 'ok' | 'error'>('idle');
  const [simulateMsg, setSimulateMsg] = useState('');
  const [copiedPixel, setCopiedPixel] = useState(false);

  const pixelUrl = message.tracking_pixel_url;
  const trackingEnabled = message.tracking_enabled !== false;
  const finalHtml = message.final_body_html;

  const pixelInFinalHtml = finalHtml
    ? finalHtml.includes('/functions/v1/email-track-open') || finalHtml.includes('email-track-open')
    : null;

  const diagnoseIssue = (): string | null => {
    if (!trackingEnabled) return 'Tracking was disabled when this message was sent.';
    if (!pixelUrl) return 'No tracking_pixel_url stored — the send function may not have written it yet. Re-send to fix.';
    if (finalHtml === null || finalHtml === undefined) return 'final_body_html is missing — the send function did not persist the rendered HTML. Re-send to fix.';
    if (pixelInFinalHtml === false) return 'Pixel URL was not found in final_body_html — pixel injection failed. Check send function logs.';
    return null;
  };

  const issue = diagnoseIssue();

  async function simulateOpen() {
    if (!pixelUrl) return;
    setSimulateStatus('loading');
    setSimulateMsg('');
    try {
      const res = await fetch(pixelUrl, { mode: 'no-cors' });
      setSimulateStatus('ok');
      setSimulateMsg('Pixel request fired (no-cors). Wait 1–2s then click Refresh Stats.');
      setTimeout(onRefresh, 1500);
    } catch (err) {
      setSimulateStatus('error');
      setSimulateMsg(err instanceof Error ? err.message : 'Fetch failed');
    }
  }

  async function copyPixelUrl() {
    if (!pixelUrl) return;
    await navigator.clipboard.writeText(pixelUrl).catch(() => {});
    setCopiedPixel(true);
    setTimeout(() => setCopiedPixel(false), 2000);
  }

  const recentEvents = [...events]
    .sort((a, b) => new Date(b.occurred_at).getTime() - new Date(a.occurred_at).getTime())
    .slice(0, 10);

  return (
    <div className="space-y-6">
      <div className={`rounded-xl border p-5 ${issue ? 'border-red-200 bg-red-50' : 'border-green-200 bg-green-50'}`}>
        <div className="flex items-start gap-3">
          <div className={`p-2 rounded-lg flex-shrink-0 ${issue ? 'bg-red-100' : 'bg-green-100'}`}>
            {issue ? <ShieldOff size={20} className="text-red-600" /> : <Shield size={20} className="text-green-600" />}
          </div>
          <div>
            <p className={`font-semibold text-sm ${issue ? 'text-red-800' : 'text-green-800'}`}>
              {issue ? 'Tracking issue detected' : 'Tracking looks correct'}
            </p>
            {issue ? (
              <p className="text-sm text-red-700 mt-1">{issue}</p>
            ) : (
              <p className="text-sm text-green-700 mt-1">
                Pixel is injected and pixel URL is stored. Opens will increment when the recipient loads images.
              </p>
            )}
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-3">
          <p className="text-sm font-semibold text-gray-700">Tracking Status</p>
          <div className="space-y-2 text-sm">
            <div className="flex justify-between">
              <span className="text-gray-500">Tracking enabled</span>
              <span className={`font-semibold ${trackingEnabled ? 'text-green-700' : 'text-red-600'}`}>
                {trackingEnabled ? 'Yes' : 'No'}
              </span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Pixel URL stored</span>
              <span className={`font-semibold ${pixelUrl ? 'text-green-700' : 'text-red-600'}`}>
                {pixelUrl ? 'Yes' : 'No'}
              </span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Pixel in sent HTML</span>
              <span className={`font-semibold ${
                pixelInFinalHtml === null ? 'text-gray-400' :
                pixelInFinalHtml ? 'text-green-700' : 'text-red-600'
              }`}>
                {pixelInFinalHtml === null ? 'Unknown (no HTML stored)' : pixelInFinalHtml ? 'Yes' : 'No'}
              </span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Unique opens</span>
              <span className="font-semibold text-gray-800">{stats?.open_unique ?? 0}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-500">Total pixel fires</span>
              <span className="font-semibold text-gray-800">{stats?.open_total ?? 0}</span>
            </div>
          </div>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-3">
          <p className="text-sm font-semibold text-gray-700">Pixel URL</p>
          {pixelUrl ? (
            <>
              <p className="font-mono text-xs text-gray-600 break-all bg-gray-50 rounded p-2 border border-gray-200">
                {pixelUrl}
              </p>
              <div className="flex gap-2 flex-wrap">
                <button
                  onClick={copyPixelUrl}
                  className="flex items-center gap-1.5 px-3 py-1.5 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-xs font-medium transition-colors"
                >
                  {copiedPixel ? <Check size={12} className="text-green-500" /> : <Copy size={12} />}
                  {copiedPixel ? 'Copied!' : 'Copy URL'}
                </button>
                <a
                  href={pixelUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 px-3 py-1.5 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-xs font-medium transition-colors"
                >
                  <ExternalLink size={12} />Open in browser
                </a>
              </div>
            </>
          ) : (
            <p className="text-sm text-gray-400 italic">Not available — pixel URL not stored for this send.</p>
          )}
        </div>
      </div>

      <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-3">
        <div className="flex items-center justify-between">
          <p className="text-sm font-semibold text-gray-700">Simulate Open</p>
          <button
            onClick={onRefresh}
            className="flex items-center gap-1.5 px-2.5 py-1 text-xs text-gray-500 hover:text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-lg transition-colors"
          >
            <RefreshCw size={11} />Refresh stats
          </button>
        </div>
        <p className="text-sm text-gray-500">
          Fires the pixel URL from your browser. This simulates what happens when the email recipient's client loads the tracking image.
          Note: some email clients block images — this is expected.
        </p>
        <button
          onClick={simulateOpen}
          disabled={!pixelUrl || simulateStatus === 'loading'}
          className={`flex items-center gap-2 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
            !pixelUrl
              ? 'bg-gray-100 text-gray-400 cursor-not-allowed'
              : 'bg-blue-600 hover:bg-blue-700 text-white'
          }`}
        >
          <Play size={14} />
          {simulateStatus === 'loading' ? 'Firing pixel...' : 'Simulate Open'}
        </button>
        {simulateMsg && (
          <p className={`text-xs mt-1 ${simulateStatus === 'error' ? 'text-red-600' : 'text-green-700'}`}>
            {simulateMsg}
          </p>
        )}
      </div>

      <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-3">
        <p className="text-sm font-semibold text-gray-700">
          Recent Events
          {recentEvents.length > 0 && (
            <span className="ml-2 px-1.5 py-0.5 bg-gray-100 text-gray-600 text-xs rounded-full">
              {recentEvents.length}
            </span>
          )}
        </p>
        {recentEvents.length === 0 ? (
          <p className="text-sm text-gray-400 italic">No events recorded yet.</p>
        ) : (
          <div className="divide-y divide-gray-100">
            {recentEvents.map((ev) => (
              <div key={ev.id} className="flex items-center gap-3 py-2">
                <EventIcon type={ev.event_type} />
                <div className="flex-1 min-w-0">
                  <span className="text-sm font-medium text-gray-800 capitalize">{ev.event_type}</span>
                  {ev.user_agent && (
                    <p className="text-xs text-gray-400 truncate">{ev.user_agent.substring(0, 80)}</p>
                  )}
                </div>
                <span className="text-xs text-gray-500 flex-shrink-0">{fmtRelative(ev.occurred_at)}</span>
              </div>
            ))}
          </div>
        )}
      </div>

      {finalHtml && (
        <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-3">
          <div>
            <p className="text-sm font-semibold text-gray-700">Sent HTML — Pixel Verification</p>
            <p className="text-xs text-gray-400 mt-0.5">
              Lines containing the tracking pixel are highlighted in yellow.
            </p>
          </div>
          <div className="bg-gray-900 rounded-lg p-4 max-h-72 overflow-auto">
            {highlightPixelLine(finalHtml)}
          </div>
        </div>
      )}
    </div>
  );
}

export default function QuickSendTrackingPage() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const isDebugMode = new URLSearchParams(window.location.search).get('debug') === '1';
  const { status: sessionStatus, isReady, isValid } = useAdminSession();

  const [message, setMessage] = useState<EmailMessage | null>(null);
  const [events, setEvents] = useState<EmailEvent[]>([]);
  const [stats, setStats] = useState<TrackingStats | null>(null);

  const [msgLoading, setMsgLoading] = useState(true);
  const [eventsLoading, setEventsLoading] = useState(true);
  const [statsLoading, setStatsLoading] = useState(true);

  const [msgError, setMsgError] = useState<string | null>(null);
  const [eventsError, setEventsError] = useState<string | null>(null);
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [authError, setAuthError] = useState(false);
  const hasFetchedRef = useRef(false);

  const [debugLog, setDebugLog] = useState<string[]>([]);
  const [activeTab, setActiveTab] = useState<Tab>('overview');
  const [htmlPreview, setHtmlPreview] = useState(false);
  const [copiedId, setCopiedId] = useState(false);

  const log = useCallback((msg: string) => {
    if (isDebugMode) setDebugLog((prev) => [...prev, `[${new Date().toISOString()}] ${msg}`]);
    console.log(`[QS_TRACKING_DEBUG] ${msg}`);
  }, [isDebugMode]);

  const loadMessage = useCallback(async () => {
    if (!id) return;
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    setMsgLoading(true);
    setMsgError(null);
    setApiError(null);

    log(`GET quick-send-admin-read?id=${id}`);
    const result = await adminApiFetch<EmailMessage>(`quick-send-admin-read?id=${id}`);

    if (!result.ok) {
      setMsgLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setMsgError(result.error?.message ?? 'Failed to load message');
      log(`message error: ${result.error?.message}`);
      return;
    }

    setMessage(result.data ?? null);
    log(`message loaded: "${result.data?.subject}" status=${result.data?.status} tracking_enabled=${result.data?.tracking_enabled} pixel=${result.data?.tracking_pixel_url}`);
    setMsgLoading(false);
  }, [id, log, isReady, isValid]);

  const loadEvents = useCallback(async () => {
    if (!id) return;
    if (!isReady || !isValid) return;
    setEventsLoading(true);
    setEventsError(null);

    log(`GET quick-send-admin-read?id=${id}&include=events`);
    const result = await adminApiFetch<{ events: EmailEvent[] }>(`quick-send-admin-read?id=${id}&include=events`);

    if (!result.ok) {
      setEventsLoading(false);
      setEventsError(result.error?.message ?? 'Failed to load events');
      log(`events error: ${result.error?.message}`);
      return;
    }

    setEvents(result.data?.events ?? []);
    log(`events: ${result.data?.events?.length || 0}`);
    setEventsLoading(false);
  }, [id, log, isReady, isValid]);

  const loadStats = useCallback(async () => {
    if (!id) return;
    if (!isReady || !isValid) return;
    setStatsLoading(true);

    log(`GET quick-send-admin-read?id=${id}&include=stats`);
    const result = await adminApiFetch<TrackingStats>(`quick-send-admin-read?id=${id}&include=stats`);

    if (!result.ok) {
      log(`stats error: ${result.error?.message}`);
      setStats(null);
      setStatsLoading(false);
      return;
    }

    setStats(result.data ?? null);
    log(`stats: opens=${result.data?.open_total} clicks=${result.data?.click_total}`);
    setStatsLoading(false);
  }, [id, log, isReady, isValid]);

  useEffect(() => {
    if (!id) { navigate('/wp-admin/email/quick-sends'); return; }
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      loadMessage();
      loadEvents();
      loadStats();
    }
  }, [id, isReady, isValid, loadMessage, loadEvents, loadStats, navigate]);

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  const handleRefresh = () => { loadEvents(); loadStats(); loadMessage(); };

  if (sessionStatus === 'loading') {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Tracking Details">
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Restoring admin session...</span>
        </div>
      </EmailModuleLayout>
    );
  }

  if (authError || sessionStatus === 'invalid') {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Tracking Details">
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to view tracking details."
          />
        </div>
      </EmailModuleLayout>
    );
  }

  const copyId = async () => {
    if (!message) return;
    await navigator.clipboard.writeText(message.id).catch(() => {});
    setCopiedId(true);
    setTimeout(() => setCopiedId(false), 2000);
  };

  const tabs: { id: Tab; label: string; icon: React.ReactNode }[] = [
    { id: 'overview', label: 'Overview', icon: <BarChart2 size={16} /> },
    { id: 'timeline', label: 'Timeline', icon: <List size={16} /> },
    { id: 'links', label: 'Links', icon: <Link2 size={16} /> },
    { id: 'message', label: 'Message', icon: <FileText size={16} /> },
    { id: 'debug', label: 'Tracking Debug', icon: <Bug size={16} /> },
  ];

  if (msgLoading) {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Tracking Details">
        <div className="max-w-5xl mx-auto space-y-6">
          <div className="flex items-center gap-2 mb-6">
            <div className="h-4 w-4 bg-gray-200 rounded animate-pulse" />
            <div className="h-4 w-32 bg-gray-200 rounded animate-pulse" />
          </div>
          <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
            <SkeletonLine w="w-2/3" h="h-7" />
            <div className="mt-3 space-y-2">
              <SkeletonLine w="w-1/2" h="h-4" />
              <SkeletonLine w="w-1/3" h="h-4" />
            </div>
          </div>
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            {[1, 2, 3, 4].map((i) => (
              <div key={i} className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
                <SkeletonLine w="w-1/2" h="h-3" />
                <div className="mt-3"><SkeletonLine w="w-1/3" h="h-8" /></div>
              </div>
            ))}
          </div>
        </div>
      </EmailModuleLayout>
    );
  }

  if (msgError || !message) {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Tracking Details">
        <div className="max-w-5xl mx-auto">
          <button
            onClick={() => navigate('/wp-admin/email/quick-sends')}
            className="flex items-center gap-2 text-blue-600 hover:text-blue-700 mb-6 font-medium text-sm"
          >
            <ChevronLeft size={18} />Back to Quick Sends
          </button>

          {apiError && (
            <div className="mb-6">
              <AdminErrorBanner
                error={apiError}
                onRetry={apiError.retryable ? () => { setApiError(null); loadMessage(); } : undefined}
                onLogin={() => setAuthError(true)}
              />
            </div>
          )}

          <div className="bg-white rounded-xl border border-red-200 p-8 shadow-sm">
            <div className="flex flex-col items-center text-center max-w-sm mx-auto">
              <div className="w-14 h-14 bg-red-100 rounded-full flex items-center justify-center mb-4">
                <AlertCircle size={28} className="text-red-500" />
              </div>
              <h2 className="text-lg font-semibold text-gray-900 mb-2">
                {msgError ? 'Could not load message' : 'Message not found'}
              </h2>
              <p className="text-sm text-gray-500 mb-6">
                {isDebugMode && msgError ? msgError : 'The requested message could not be retrieved.'}
              </p>
              <div className="flex gap-3">
                <button
                  onClick={loadMessage}
                  className="flex items-center gap-2 px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium text-sm"
                >
                  <RefreshCw size={16} />Retry
                </button>
                <button
                  onClick={() => navigate('/wp-admin/email/quick-sends')}
                  className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg font-medium text-sm"
                >
                  Go Back
                </button>
              </div>
              {isDebugMode && debugLog.length > 0 && (
                <div className="w-full mt-6 text-left bg-gray-900 rounded-lg p-4 text-xs font-mono text-green-400 max-h-40 overflow-y-auto">
                  {debugLog.map((line, i) => <div key={i}>{line}</div>)}
                </div>
              )}
            </div>
          </div>
        </div>
      </EmailModuleLayout>
    );
  }

  const lastActivity = stats?.last_click_at || stats?.last_open_at || null;
  const sortedEvents = [...events].sort(
    (a, b) => new Date(b.occurred_at).getTime() - new Date(a.occurred_at).getTime()
  );

  return (
    <EmailModuleLayout title="Quick Sends" subtitle="Tracking Details">
      <div className="max-w-5xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <button
            onClick={() => navigate('/wp-admin/email/quick-sends')}
            className="flex items-center gap-2 text-blue-600 hover:text-blue-700 font-medium text-sm"
          >
            <ChevronLeft size={18} />Back to Quick Sends
          </button>
          <button
            onClick={handleRefresh}
            className="flex items-center gap-2 px-3 py-1.5 text-sm text-gray-600 hover:text-gray-900 bg-white hover:bg-gray-50 border border-gray-200 rounded-lg font-medium transition-colors"
          >
            <RefreshCw size={14} />Refresh
          </button>
        </div>

        <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-6 mb-6">
          <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4">
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-3 mb-3">
                <h1 className="text-xl font-bold text-gray-900 truncate">{message.subject}</h1>
                <StatusBadge status={message.status} />
                {message.tracking_enabled !== false && message.tracking_pixel_url && (
                  <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-blue-50 text-blue-700 text-xs font-medium rounded-full border border-blue-200">
                    <Shield size={10} />Tracking on
                  </span>
                )}
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-1.5 text-sm text-gray-600">
                <div>
                  <span className="font-medium text-gray-700">To:</span>{' '}
                  {message.to_name ? `${message.to_name} <${message.to_email}>` : message.to_email}
                </div>
                <div>
                  <span className="font-medium text-gray-700">From:</span>{' '}
                  {message.from_name} &lt;{message.from_email}&gt;
                </div>
                {message.sent_at && (
                  <div>
                    <span className="font-medium text-gray-700">Sent:</span>{' '}
                    {fmtDate(message.sent_at)}
                  </div>
                )}
                <div className="flex items-center gap-1">
                  <span className="font-medium text-gray-700">ID:</span>{' '}
                  <span className="font-mono text-xs text-gray-400">{message.id.substring(0, 8)}&hellip;</span>
                  <button onClick={copyId} className="ml-1 text-gray-400 hover:text-gray-600" title="Copy ID">
                    {copiedId ? <Check size={12} className="text-green-500" /> : <Copy size={12} />}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
          <KpiCard
            label="Delivered"
            value={1}
            sub={message.sent_at ? fmtRelative(message.sent_at) : 'Just sent'}
            colorBg="bg-emerald-50"
            icon={<Send size={18} className="text-emerald-600" />}
            loading={false}
          />
          <KpiCard
            label="Opens (unique)"
            value={statsLoading ? '\u2014' : (stats?.open_unique ?? 0)}
            sub={
              statsLoading ? undefined
              : stats && stats.open_total > 0
              ? `${stats.open_total} total \u00b7 ${fmtRelative(stats.last_open_at)}`
              : 'No opens yet'
            }
            tooltip="Unique opens (0 or 1 per recipient). Total may be higher due to email client prefetch/proxy."
            colorBg="bg-blue-50"
            icon={<Eye size={18} className="text-blue-600" />}
            loading={statsLoading}
          />
          <KpiCard
            label="Clicks (unique)"
            value={statsLoading ? '\u2014' : (stats?.click_unique ?? 0)}
            sub={
              statsLoading ? undefined
              : stats && stats.click_total > 0
              ? `${stats.click_total} total \u00b7 ${fmtRelative(stats.last_click_at)}`
              : 'No clicks yet'
            }
            tooltip="Unique clicks per recipient. Total counts every click event."
            colorBg="bg-green-50"
            icon={<MousePointerClick size={18} className="text-green-600" />}
            loading={statsLoading}
          />
          <KpiCard
            label="Last Activity"
            value={statsLoading ? '\u2014' : (lastActivity ? fmtRelative(lastActivity) : '\u2014')}
            sub={lastActivity ? fmtDate(lastActivity) : 'No activity yet'}
            colorBg="bg-amber-50"
            icon={<Clock size={18} className="text-amber-600" />}
            loading={statsLoading}
          />
        </div>

        <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
          <div className="border-b border-gray-200">
            <nav className="flex px-6 gap-1 overflow-x-auto">
              {tabs.map((tab) => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  className={`flex items-center gap-2 px-3 py-4 text-sm font-medium border-b-2 transition-colors -mb-px whitespace-nowrap ${
                    activeTab === tab.id
                      ? 'border-blue-600 text-blue-600'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                  }`}
                >
                  {tab.icon}
                  {tab.label}
                  {tab.id === 'timeline' && events.length > 0 && (
                    <span className="ml-1 px-1.5 py-0.5 bg-gray-100 text-gray-600 text-xs rounded-full">
                      {events.length}
                    </span>
                  )}
                  {tab.id === 'debug' && !message.tracking_pixel_url && (
                    <span className="ml-1 w-2 h-2 rounded-full bg-red-500 flex-shrink-0" />
                  )}
                </button>
              ))}
            </nav>
          </div>

          <div className="p-6">
            {activeTab === 'overview' && (
              <div className="space-y-8">
                {statsLoading ? (
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    {[1, 2].map((i) => (
                      <div key={i} className="space-y-3">
                        <SkeletonLine w="w-1/3" h="h-4" />
                        <div className="flex items-end gap-1 h-24">
                          {Array.from({ length: 24 }).map((_, j) => (
                            <div key={j} className="flex-1 bg-gray-100 rounded-t animate-pulse" style={{ height: `${20 + (j % 5) * 10}px` }} />
                          ))}
                        </div>
                      </div>
                    ))}
                  </div>
                ) : stats && (stats.open_total > 0 || stats.click_total > 0) ? (
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <HourBarChart data={stats.opens_by_hour} label="Opens by Hour (UTC)" barColor="bg-blue-400" />
                    <HourBarChart data={stats.clicks_by_hour} label="Clicks by Hour (UTC)" barColor="bg-green-400" />
                  </div>
                ) : (
                  <div className="text-center py-16">
                    <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                      <Mail size={28} className="text-gray-400" />
                    </div>
                    <h3 className="text-base font-semibold text-gray-900 mb-2">No tracking events yet</h3>
                    <p className="text-sm text-gray-500 max-w-xs mx-auto">
                      Charts will appear here once the recipient opens or clicks links in the email.
                    </p>
                    <p className="text-xs text-gray-400 mt-3">
                      Tracking uses an open pixel and link rewrites. Some email clients block images.
                    </p>
                    <button
                      onClick={() => setActiveTab('debug')}
                      className="mt-4 inline-flex items-center gap-1.5 text-xs text-blue-600 hover:text-blue-700 font-medium"
                    >
                      <Bug size={13} />Open Tracking Debug panel to verify pixel injection
                    </button>
                  </div>
                )}
                {isDebugMode && debugLog.length > 0 && (
                  <div className="bg-gray-900 rounded-lg p-4">
                    <p className="text-xs text-gray-400 font-mono font-bold mb-2">Debug Log</p>
                    <div className="space-y-0.5 max-h-40 overflow-y-auto">
                      {debugLog.map((line, i) => <p key={i} className="text-xs font-mono text-green-400">{line}</p>)}
                    </div>
                  </div>
                )}
              </div>
            )}

            {activeTab === 'timeline' && (
              <div>
                {eventsLoading ? (
                  <div className="space-y-4">
                    {[1, 2, 3].map((i) => (
                      <div key={i} className="flex items-start gap-4">
                        <div className="w-8 h-8 bg-gray-100 rounded-full animate-pulse flex-shrink-0" />
                        <div className="flex-1 space-y-2 pt-1">
                          <SkeletonLine w="w-1/4" h="h-4" />
                          <SkeletonLine w="w-1/2" h="h-3" />
                        </div>
                      </div>
                    ))}
                  </div>
                ) : sortedEvents.length === 0 ? (
                  <div className="text-center py-16">
                    <div className="w-14 h-14 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                      <List size={24} className="text-gray-400" />
                    </div>
                    <h3 className="text-base font-semibold text-gray-900 mb-1">No events yet</h3>
                    <p className="text-sm text-gray-500">Opens and clicks will appear here in real time.</p>
                    {eventsError && (
                      <p className="text-xs text-red-500 mt-3">
                        {isDebugMode ? eventsError : 'Error loading events — try refreshing.'}
                      </p>
                    )}
                  </div>
                ) : (
                  <div className="divide-y divide-gray-100">
                    {sortedEvents.map((event, idx) => (
                      <div key={event.id} className="flex items-start gap-4 py-3">
                        <EventIcon type={event.event_type} />
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2 mb-0.5">
                            <p className="text-sm font-semibold text-gray-800 capitalize">{event.event_type}</p>
                            <span className="text-xs text-gray-400">#{sortedEvents.length - idx}</span>
                          </div>
                          {event.url && (
                            <p className="text-xs text-gray-500 truncate max-w-sm">{event.url}</p>
                          )}
                        </div>
                        <div className="text-right flex-shrink-0">
                          <p className="text-xs font-medium text-gray-600">{fmtRelative(event.occurred_at)}</p>
                          <p className="text-xs text-gray-400">{fmtDate(event.occurred_at)}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}

            {activeTab === 'links' && (
              <div>
                {statsLoading ? (
                  <div className="space-y-3">
                    {[1, 2].map((i) => (
                      <div key={i} className="p-4 border border-gray-200 rounded-lg space-y-2">
                        <SkeletonLine w="w-3/4" h="h-4" />
                        <SkeletonLine w="w-1/4" h="h-3" />
                      </div>
                    ))}
                  </div>
                ) : stats && stats.clicks_by_url.length > 0 ? (
                  <div className="space-y-3">
                    {stats.clicks_by_url.map((entry, idx) => {
                      const maxClicks = stats.clicks_by_url[0].count;
                      const pct = Math.round((entry.count / maxClicks) * 100);
                      return (
                        <div key={idx} className="border border-gray-200 rounded-xl p-4 hover:border-gray-300 transition-colors">
                          <div className="flex items-start justify-between gap-4 mb-2">
                            <p className="font-mono text-xs text-gray-700 break-all flex-1">{entry.url}</p>
                            <span className="flex-shrink-0 px-2.5 py-1 bg-green-100 text-green-800 text-xs font-bold rounded-full">
                              {entry.count} click{entry.count !== 1 ? 's' : ''}
                            </span>
                          </div>
                          <div className="h-1.5 bg-gray-100 rounded-full overflow-hidden mb-2">
                            <div className="h-full bg-green-400 rounded-full" style={{ width: `${pct}%` }} />
                          </div>
                          <p className="text-xs text-gray-400">Last clicked: {fmtRelative(entry.last_clicked_at)}</p>
                        </div>
                      );
                    })}
                  </div>
                ) : (
                  <div className="text-center py-16">
                    <div className="w-14 h-14 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                      <Link2 size={24} className="text-gray-400" />
                    </div>
                    <h3 className="text-base font-semibold text-gray-900 mb-1">No link clicks yet</h3>
                    <p className="text-sm text-gray-500">Click statistics per URL will appear here.</p>
                  </div>
                )}
              </div>
            )}

            {activeTab === 'message' && (
              <div className="space-y-4">
                <div className="flex items-center gap-2 justify-end">
                  {(['Rendered', 'HTML Source'] as const).map((label, i) => (
                    <button
                      key={label}
                      onClick={() => setHtmlPreview(i === 1)}
                      className={`px-3 py-1.5 text-sm rounded-lg font-medium transition-colors ${
                        htmlPreview === (i === 1)
                          ? 'bg-blue-100 text-blue-800'
                          : 'text-gray-500 hover:text-gray-700'
                      }`}
                    >
                      {label}
                    </button>
                  ))}
                </div>
                {htmlPreview ? (
                  <div className="bg-gray-900 rounded-lg p-4 overflow-auto max-h-[500px]">
                    <pre className="text-xs text-green-400 font-mono whitespace-pre-wrap break-all">
                      {message.html_body || '(no HTML body)'}
                    </pre>
                  </div>
                ) : (
                  <div
                    className="bg-white border border-gray-200 rounded-lg p-6 max-h-[500px] overflow-y-auto prose prose-sm max-w-none"
                    dangerouslySetInnerHTML={{ __html: message.html_body || '<p class="text-gray-400">(no preview available)</p>' }}
                  />
                )}
                {message.text_body && (
                  <div>
                    <p className="text-sm font-medium text-gray-700 mb-2">Plain Text Version</p>
                    <div className="bg-gray-50 border border-gray-200 rounded-lg p-4 max-h-40 overflow-y-auto">
                      <pre className="text-xs text-gray-700 font-mono whitespace-pre-wrap">{message.text_body}</pre>
                    </div>
                  </div>
                )}
              </div>
            )}

            {activeTab === 'debug' && (
              <TrackingDebugPanel
                message={message}
                events={events}
                stats={stats}
                onRefresh={handleRefresh}
              />
            )}
          </div>
        </div>
      </div>
    </EmailModuleLayout>
  );
}
