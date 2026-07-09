import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { BarChart2, Users, Send, MousePointer, TrendingUp, Zap, ArrowRight, Mail, RefreshCw, AlertCircle, CheckCircle, XCircle } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, STATUS_COLORS } from '../../hooks/useEmailMarketing';
import { adminFetch } from '../../utils/adminFetch';

interface OverviewData {
  stats: {
    total_contacts: number;
    sent_today: number;
    opens_today: number;
    clicks_today: number;
    delivered_today: number;
    unique_opens_today: number;
    open_rate_today: number | null;
  };
  recent_campaigns: any[];
  active_automations: any[];
  recent_messages: any[];
}

function StatCard({ icon: Icon, label, value, sub, sub2, color }: any) {
  return (
    <div className="bg-white rounded-xl border border-slate-200 p-5">
      <div className="flex items-start justify-between">
        <div>
          <p className="text-xs text-slate-500 font-medium uppercase tracking-wide">{label}</p>
          <p className="text-3xl font-bold text-slate-900 mt-1">{value.toLocaleString()}</p>
          {sub && <p className="text-xs text-slate-400 mt-0.5">{sub}</p>}
          {sub2 && <p className="text-xs text-slate-500 font-medium mt-1">{sub2}</p>}
        </div>
        <div className={`w-10 h-10 rounded-xl flex items-center justify-center ${color}`}>
          <Icon className="w-5 h-5" />
        </div>
      </div>
    </div>
  );
}

export default function EmOverviewPage() {
  const navigate = useNavigate();
  const [data, setData] = useState<OverviewData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [smtpConfigured, setSmtpConfigured] = useState<boolean | null>(null);

  const checkSmtp = async () => {
    try {
      const res = await adminFetch('smtp-test', {
        method: 'POST',
        body: JSON.stringify({ action: 'status' }),
      });
      if (!res.ok) { setSmtpConfigured(false); return; }
      const json = await res.json();
      if (json.ok && json.vars) {
        setSmtpConfigured(Object.values(json.vars).every(Boolean));
      } else {
        setSmtpConfigured(false);
      }
    } catch {
      setSmtpConfigured(false);
    }
  };

  const load = async () => {
    setLoading(true);
    setError(null);
    try {
      const res = await emApi.get('overview');
      setData(res);
    } catch (e: any) {
      console.error('[EmOverview] metrics fetch failed:', e);
      setError(e.message ?? 'Could not load metrics');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    load();
    checkSmtp();
  }, []);

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Overview">
      <div className="space-y-6">
        {smtpConfigured === false && (
          <div className="flex items-center justify-between gap-4 px-4 py-3 bg-amber-50 border border-amber-200 rounded-xl">
            <div className="flex items-center gap-2.5 text-sm text-amber-800">
              <XCircle className="w-4 h-4 shrink-0 text-amber-600" />
              <span><strong>SMTP not configured.</strong> Email sending is disabled until SMTP is set up.</span>
            </div>
            <button
              onClick={() => navigate('/wp-admin/email/smtp')}
              className="shrink-0 flex items-center gap-1.5 px-3 py-1.5 bg-amber-600 text-white text-xs font-semibold rounded-lg hover:bg-amber-700 transition-colors"
            >
              Set up SMTP <ArrowRight className="w-3 h-3" />
            </button>
          </div>
        )}

        {smtpConfigured === true && (
          <div className="flex items-center gap-2.5 px-4 py-3 bg-emerald-50 border border-emerald-200 rounded-xl text-sm text-emerald-800">
            <CheckCircle className="w-4 h-4 shrink-0 text-emerald-600" />
            <span>SMTP configured and ready to send.</span>
          </div>
        )}

        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-lg font-semibold text-slate-900">Overview</h2>
            <p className="text-sm text-slate-500">Today's sending activity and pipeline</p>
          </div>
          <div className="flex items-center gap-2">
            <button onClick={load} className="flex items-center gap-1.5 px-3 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:border-slate-300 transition-colors">
              <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
              Refresh
            </button>
            <button onClick={() => navigate('/wp-admin/email/quick-sends')} className="flex items-center gap-1.5 px-3 py-2 text-sm bg-blue-50 text-blue-600 border border-blue-200 rounded-lg hover:bg-blue-100 transition-colors font-medium">
              <Mail className="w-3.5 h-3.5" />
              Quick Send
            </button>
            <button onClick={() => navigate('/wp-admin/email/campaigns')} className="flex items-center gap-1.5 px-3 py-2 text-sm bg-slate-900 text-white rounded-lg hover:bg-slate-800 transition-colors">
              <Send className="w-3.5 h-3.5" />
              New Campaign
            </button>
          </div>
        </div>

        {error && (
          <div className="flex items-center gap-2 px-3 py-2 text-xs text-slate-500">
            <AlertCircle className="w-3.5 h-3.5 shrink-0 text-slate-400" />
            Metrics unavailable — {error}
          </div>
        )}

        {loading && !data ? (
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            {[...Array(4)].map((_, i) => <div key={i} className="bg-white rounded-xl border border-slate-200 p-5 h-24 animate-pulse" />)}
          </div>
        ) : (
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <StatCard icon={Users} label="Total Contacts" value={data?.stats.total_contacts ?? 0} sub="in audience" color="bg-sky-50 text-sky-600" />
            <StatCard icon={Send} label="Sent Today" value={data?.stats.sent_today ?? 0} sub="emails delivered" color="bg-emerald-50 text-emerald-600" />
            <StatCard
              icon={Mail}
              label="Opens Today"
              value={data?.stats.unique_opens_today ?? data?.stats.opens_today ?? 0}
              sub="unique opens"
              sub2={`Open rate: ${data?.stats.open_rate_today != null ? `${(data.stats.open_rate_today * 100).toFixed(0)}%` : '—'}`}
              color="bg-blue-50 text-blue-600"
            />
            <StatCard icon={MousePointer} label="Clicks Today" value={data?.stats.clicks_today ?? 0} sub="tracked clicks" color="bg-amber-50 text-amber-600" />
          </div>
        )}

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-white rounded-xl border border-slate-200">
            <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100">
              <div className="flex items-center gap-2">
                <BarChart2 className="w-4 h-4 text-slate-400" />
                <h3 className="text-sm font-semibold text-slate-800">Recent Campaigns</h3>
              </div>
              <button onClick={() => navigate('/wp-admin/email/campaigns')} className="text-xs text-blue-600 hover:text-blue-700 flex items-center gap-1">
                View all <ArrowRight className="w-3 h-3" />
              </button>
            </div>
            <div className="divide-y divide-slate-50">
              {!data?.recent_campaigns?.length ? (
                <div className="px-5 py-8 text-center text-sm text-slate-400">No campaigns yet</div>
              ) : data.recent_campaigns.map((c: any) => (
                <div key={c.id} className="flex items-center gap-3 px-5 py-3 hover:bg-slate-50 transition-colors cursor-pointer" onClick={() => navigate('/wp-admin/email/campaigns')}>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-slate-800 truncate">{c.name}</p>
                    <p className="text-xs text-slate-400">{c.sent_count} sent · {c.open_count} opens</p>
                  </div>
                  <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${STATUS_COLORS[c.status] ?? 'bg-slate-100 text-slate-600'}`}>{c.status}</span>
                </div>
              ))}
            </div>
          </div>

          <div className="bg-white rounded-xl border border-slate-200">
            <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100">
              <div className="flex items-center gap-2">
                <Zap className="w-4 h-4 text-slate-400" />
                <h3 className="text-sm font-semibold text-slate-800">Active Automations</h3>
              </div>
              <button onClick={() => navigate('/wp-admin/email/automations')} className="text-xs text-blue-600 hover:text-blue-700 flex items-center gap-1">
                View all <ArrowRight className="w-3 h-3" />
              </button>
            </div>
            <div className="divide-y divide-slate-50">
              {!data?.active_automations?.length ? (
                <div className="px-5 py-8 text-center text-sm text-slate-400">No active automations</div>
              ) : data.active_automations.map((a: any) => (
                <div key={a.id} className="flex items-center gap-3 px-5 py-3 hover:bg-slate-50 transition-colors cursor-pointer" onClick={() => navigate('/wp-admin/email/automations')}>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-slate-800 truncate">{a.name}</p>
                    <p className="text-xs text-slate-400">{a.enrolled_count} enrolled</p>
                  </div>
                  <span className="text-xs px-2 py-0.5 rounded-full font-medium bg-emerald-100 text-emerald-700">active</span>
                </div>
              ))}
            </div>
          </div>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
          {[
            { label: 'Add Contact', icon: Users, href: '/wp-admin/email/audience' },
            { label: 'New Template', icon: Mail, href: '/wp-admin/email/templates' },
            { label: 'Build Segment', icon: TrendingUp, href: '/wp-admin/email/segments' },
            { label: 'New Automation', icon: Zap, href: '/wp-admin/email/automations' },
          ].map(({ label, icon: Icon, href }) => (
            <button key={label} onClick={() => navigate(href)} className="flex items-center gap-2.5 px-4 py-3 bg-white border border-slate-200 rounded-xl text-sm font-medium text-slate-700 hover:border-slate-300 hover:bg-slate-50 transition-colors">
              <Icon className="w-4 h-4 text-sky-500 shrink-0" />
              {label}
            </button>
          ))}
        </div>
      </div>
    </EmailModuleLayout>
  );
}
