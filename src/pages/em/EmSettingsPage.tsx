import { useEffect, useState } from 'react';
import { Save, AlertCircle, CheckCircle, RefreshCw, Shield, Zap, Eye } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { SenderIdentitySettings } from '../../components/em/SenderIdentitySettings';
import { emApi } from '../../hooks/useEmailMarketing';

type Setting = { key: string; value: string };

const SETTING_KEYS = ['compliance_footer', 'max_per_minute', 'track_opens', 'track_clicks'];

const SETTING_META: Record<string, { label: string; type: string; placeholder?: string; hint?: string }> = {
  compliance_footer: { label: 'Compliance Footer', type: 'textarea', hint: 'Appended to every email. Include unsubscribe instructions.' },
  max_per_minute: { label: 'Max Sends Per Minute', type: 'number', hint: 'Rate limit for the send queue. Max 200.' },
  track_opens: { label: 'Track Opens', type: 'toggle', hint: 'Inject a 1x1 tracking pixel in emails.' },
  track_clicks: { label: 'Track Clicks', type: 'toggle', hint: 'Rewrite links to track click-through rates.' },
};

export default function EmSettingsPage() {
  const [settings, setSettings] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [saved, setSaved] = useState(false);
  const [smtpStatus, setSmtpStatus] = useState<'idle' | 'testing' | 'ok' | 'error'>('idle');
  const [smtpMsg, setSmtpMsg] = useState('');

  const load = async () => {
    setLoading(true); setError(null);
    try {
      const res = await emApi.get('settings');
      const raw = res.settings ?? {};
      const map: Record<string, string> = {};
      if (Array.isArray(raw)) {
        raw.forEach((s: Setting) => { map[s.key] = s.value; });
      } else {
        Object.entries(raw).forEach(([k, v]) => { map[k] = String(v); });
      }
      setSettings(map);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  const handleSave = async () => {
    setSaving(true); setSaved(false); setError(null);
    try {
      const items = SETTING_KEYS.map(k => ({ key: k, value: settings[k] ?? '' }));
      await emApi.post('settings', { settings: items });
      setSaved(true);
      setTimeout(() => setSaved(false), 3000);
    } catch (e: any) { setError(e.message); } finally { setSaving(false); }
  };

  const testSmtp = async () => {
    setSmtpStatus('testing'); setSmtpMsg('');
    try {
      const to = settings['from_email'] || '';
      if (!to) { setSmtpStatus('error'); setSmtpMsg('Set a From Email first'); return; }
      await emApi.post('settings', { _action: 'test_smtp', to });
      setSmtpStatus('ok'); setSmtpMsg('Test email sent successfully');
    } catch (e: any) { setSmtpStatus('error'); setSmtpMsg(e.message); }
  };

  const set = (key: string, value: string) => setSettings(s => ({ ...s, [key]: value }));

  const inputCls = 'w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent';

  if (loading) return (
    <EmailModuleLayout title="Email Marketing" subtitle="Settings">
      <div className="space-y-4">{[...Array(4)].map((_, i) => <div key={i} className="h-16 bg-white border border-slate-200 rounded-xl animate-pulse" />)}</div>
    </EmailModuleLayout>
  );

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Settings">
      <div className="space-y-6 max-w-2xl">
        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}
        {saved && <div className="flex items-center gap-2 px-4 py-3 bg-emerald-50 border border-emerald-200 rounded-lg text-sm text-emerald-700"><CheckCircle className="w-4 h-4 shrink-0" />Settings saved successfully</div>}

        <SenderIdentitySettings />

        <section className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-100 bg-slate-50">
            <Shield className="w-4 h-4 text-slate-400" />
            <h3 className="text-sm font-semibold text-slate-700">Compliance</h3>
          </div>
          <div className="p-5">
            <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">{SETTING_META.compliance_footer.label}</label>
            <p className="text-xs text-slate-400 mt-0.5 mb-1">{SETTING_META.compliance_footer.hint}</p>
            <textarea value={settings['compliance_footer'] ?? ''} onChange={e => set('compliance_footer', e.target.value)} className={`${inputCls} resize-none`} rows={4} placeholder="© 2026 Gappsy. You received this because you submitted a form at gappsy.com. Unsubscribe: {{unsubscribe_url}}" />
          </div>
        </section>

        <section className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-100 bg-slate-50">
            <Zap className="w-4 h-4 text-slate-400" />
            <h3 className="text-sm font-semibold text-slate-700">Send Queue & Tracking</h3>
          </div>
          <div className="p-5 space-y-4">
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">{SETTING_META.max_per_minute.label}</label>
              <p className="text-xs text-slate-400 mt-0.5 mb-1">{SETTING_META.max_per_minute.hint}</p>
              <input type="number" value={settings['max_per_minute'] ?? '60'} onChange={e => set('max_per_minute', e.target.value)} className={`${inputCls} max-w-32`} min={1} max={200} />
            </div>
            {(['track_opens', 'track_clicks'] as const).map(key => {
              const meta = SETTING_META[key];
              const isOn = settings[key] === 'true';
              return (
                <div key={key} className="flex items-center justify-between py-2">
                  <div>
                    <p className="text-sm font-medium text-slate-700">{meta.label}</p>
                    <p className="text-xs text-slate-400">{meta.hint}</p>
                  </div>
                  <button onClick={() => set(key, isOn ? 'false' : 'true')} className={`relative w-11 h-6 rounded-full transition-colors ${isOn ? 'bg-sky-500' : 'bg-slate-200'}`}>
                    <span className={`absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transition-transform ${isOn ? 'translate-x-5' : ''}`} />
                  </button>
                </div>
              );
            })}
          </div>
        </section>

        <section className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-100 bg-slate-50">
            <Eye className="w-4 h-4 text-slate-400" />
            <h3 className="text-sm font-semibold text-slate-700">SMTP Diagnostics</h3>
          </div>
          <div className="p-5">
            <p className="text-xs text-slate-500 mb-3">Send a test email to the From address to verify your SMTP connection is working.</p>
            <button onClick={testSmtp} disabled={smtpStatus === 'testing'} className="flex items-center gap-2 px-4 py-2 bg-slate-100 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-200 disabled:opacity-50">
              <RefreshCw className={`w-3.5 h-3.5 ${smtpStatus === 'testing' ? 'animate-spin' : ''}`} />
              {smtpStatus === 'testing' ? 'Sending...' : 'Send Test Email'}
            </button>
            {smtpMsg && (
              <p className={`mt-2 text-xs font-medium ${smtpStatus === 'ok' ? 'text-emerald-600' : 'text-red-600'}`}>{smtpMsg}</p>
            )}
          </div>
        </section>

        <div className="flex justify-end">
          <button onClick={handleSave} disabled={saving} className="flex items-center gap-2 px-6 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">
            <Save className="w-3.5 h-3.5" />{saving ? 'Saving...' : 'Save Settings'}
          </button>
        </div>
      </div>
    </EmailModuleLayout>
  );
}
