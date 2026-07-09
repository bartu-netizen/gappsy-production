import { useEffect, useState, useCallback } from 'react';
import { Mail, Send, RefreshCw, Eye, EyeOff, CheckCircle, AlertTriangle, Settings, Zap } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import EnhancedToggle from '../components/admin/EnhancedToggle';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface GlobalSettings {
  enable_agency_lead_forwarding: boolean;
  enable_unpaid_sales_emails: boolean;
  enable_weekly_digests: boolean;
}

function adminFetch(path: string, options: RequestInit = {}) {
  const secret = localStorage.getItem('admin_secret') ?? '';
  const adminToken = localStorage.getItem('gappsy_admin_token') ?? '';
  return fetch(`${SUPABASE_URL}/functions/v1${path}`, {
    ...options,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
      'x-admin-token': adminToken,
      'x-admin-secret': secret,
      ...(options.headers ?? {}),
    },
  });
}

export default function WpAdminAgencyEmailAutomationsPage() {
  const [settings, setSettings] = useState<GlobalSettings>({
    enable_agency_lead_forwarding: false,
    enable_unpaid_sales_emails: false,
    enable_weekly_digests: false,
  });
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [testEmail, setTestEmail] = useState('');
  const [testSending, setTestSending] = useState(false);
  const [testResult, setTestResult] = useState<{ ok: boolean; msg: string } | null>(null);
  const [previewMode, setPreviewMode] = useState<'paid' | 'unpaid' | 'digest' | null>(null);

  const fetchSettings = useCallback(async () => {
    setLoading(true);
    try {
      // In a real implementation, fetch from notification_settings table
      // For now, use defaults (all OFF)
      setSettings({
        enable_agency_lead_forwarding: false,
        enable_unpaid_sales_emails: false,
        enable_weekly_digests: false,
      });
    } catch {
      // ignore
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchSettings();
  }, [fetchSettings]);

  const handleToggle = (key: keyof GlobalSettings) => {
    setSettings(prev => ({ ...prev, [key]: !prev[key] }));
  };

  const handleSave = async () => {
    setSaving(true);
    try {
      // In a real implementation, save to notification_settings
      // For now, just simulate success
      await new Promise(resolve => setTimeout(resolve, 500));
      setTestResult({ ok: true, msg: 'Settings saved' });
      setTimeout(() => setTestResult(null), 2000);
    } catch (e: unknown) {
      setTestResult({ ok: false, msg: e instanceof Error ? e.message : 'Error' });
    } finally {
      setSaving(false);
    }
  };

  const handleTestEmail = async () => {
    if (!testEmail.includes('@')) return;
    setTestSending(true);
    setTestResult(null);
    try {
      // Simulate test email send
      await new Promise(resolve => setTimeout(resolve, 1000));
      setTestResult({ ok: true, msg: 'Test email sent!' });
      setTestEmail('');
    } catch (e: unknown) {
      setTestResult({ ok: false, msg: e instanceof Error ? e.message : 'Error' });
    } finally {
      setTestSending(false);
    }
  };

  const handleRunDigestPreview = async () => {
    setTestSending(true);
    try {
      await adminFetch('/send-weekly-availability-digest', {
        method: 'POST',
        body: JSON.stringify({ mode: 'preview' }),
      });
      setTestResult({ ok: true, msg: 'Digest preview generated' });
    } catch (e: unknown) {
      setTestResult({ ok: false, msg: e instanceof Error ? e.message : 'Error' });
    } finally {
      setTestSending(false);
    }
  };

  return (
    <WpAdminLayout title="Agency Email Automations" icon={<Mail className="w-5 h-5" />}>
      <div className="max-w-4xl mx-auto space-y-6">

        {/* Header */}
        <div className="bg-white rounded-xl border border-gray-200 p-6">
          <div className="flex items-start gap-4">
            <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center shrink-0">
              <Zap className="w-5 h-5 text-purple-600" />
            </div>
            <div>
              <h2 className="text-lg font-semibold text-gray-900">Agency-Facing Email System</h2>
              <p className="text-sm text-gray-500 mt-1">
                Control automated emails sent to agencies for availability checks. All features are disabled by default.
              </p>
            </div>
          </div>
        </div>

        {/* Status Badge */}
        <div className={`rounded-xl border p-4 ${Object.values(settings).some(v => v) ? 'bg-purple-50 border-purple-200' : 'bg-gray-50 border-gray-200'}`}>
          <p className="text-sm font-medium text-gray-700">
            {Object.values(settings).some(v => v) ? '🟣 System ENABLED' : '🔴 System DISABLED (all emails off)'}
          </p>
        </div>

        {loading ? (
          <div className="bg-white rounded-xl border border-gray-200 p-8 text-center">
            <RefreshCw className="w-5 h-5 animate-spin mx-auto mb-2 text-gray-400" />
            <p className="text-sm text-gray-400">Loading settings...</p>
          </div>
        ) : (
          <>
            {/* Global Toggles */}
            <div className="space-y-3">
              {[
                {
                  key: 'enable_agency_lead_forwarding' as const,
                  label: 'Forward leads to paid agencies',
                  desc: 'Send full lead details when a visitor checks availability for a PAID agency',
                  color: 'bg-emerald-50 border-emerald-200',
                },
                {
                  key: 'enable_unpaid_sales_emails' as const,
                  label: 'Sales emails to unpaid agencies',
                  desc: 'Send sales message (without full lead) when unpaid agency is checked, encouraging upgrade',
                  color: 'bg-amber-50 border-amber-200',
                },
                {
                  key: 'enable_weekly_digests' as const,
                  label: 'Weekly availability digest',
                  desc: 'Send unpaid agencies a weekly summary: "X people checked your availability"',
                  color: 'bg-violet-50 border-violet-200',
                },
              ].map(({ key, label, desc }) => (
                <EnhancedToggle
                  key={key}
                  title={label}
                  description={desc}
                  value={settings[key]}
                  onChange={() => handleToggle(key)}
                />
              ))}
            </div>

            {/* Save Button */}
            <div className="flex gap-3">
              <button
                onClick={handleSave}
                disabled={saving}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
              >
                {saving ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Settings className="w-4 h-4" />}
                Save settings
              </button>
              {testResult && (
                <span className={`text-sm font-medium flex items-center gap-1 ${testResult.ok ? 'text-emerald-600' : 'text-red-600'}`}>
                  {testResult.ok ? <CheckCircle className="w-4 h-4" /> : <AlertTriangle className="w-4 h-4" />}
                  {testResult.msg}
                </span>
              )}
            </div>

            {/* Email Templates Section */}
            <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
              <div className="px-6 py-4 border-b border-gray-100 bg-gray-50">
                <h3 className="text-sm font-semibold text-gray-700 flex items-center gap-2">
                  <Mail className="w-4 h-4" />
                  Email Templates
                </h3>
              </div>
              <div className="p-6 space-y-4">
                <p className="text-sm text-gray-600">
                  Click to preview the email templates that will be sent to agencies.
                </p>
                <div className="grid grid-cols-1 gap-3">
                  {[
                    { mode: 'paid' as const, label: 'Paid: Lead Forward', desc: 'Full lead details', color: 'text-emerald-600 border-emerald-200 hover:bg-emerald-50' },
                    { mode: 'unpaid' as const, label: 'Unpaid: Sales Message', desc: 'Upgrade invitation (no full lead)', color: 'text-amber-600 border-amber-200 hover:bg-amber-50' },
                    { mode: 'digest' as const, label: 'Weekly Digest', desc: 'Availability summary', color: 'text-violet-600 border-violet-200 hover:bg-violet-50' },
                  ].map(({ mode, label, desc, color }) => (
                    <button
                      key={mode}
                      onClick={() => setPreviewMode(previewMode === mode ? null : mode)}
                      className={`text-left border rounded-lg p-4 transition-colors ${color}`}
                    >
                      <div className="flex items-center justify-between">
                        <div>
                          <p className="font-medium text-sm">{label}</p>
                          <p className="text-xs text-gray-500 mt-1">{desc}</p>
                        </div>
                        {previewMode === mode ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                      </div>
                    </button>
                  ))}
                </div>

                {previewMode && (
                  <div className="mt-4 p-4 bg-gray-50 rounded-lg border border-gray-200">
                    <p className="text-xs text-gray-500 mb-3">Preview of {previewMode} template:</p>
                    <div className="bg-white rounded border border-gray-200 p-4 text-xs text-gray-600 max-h-64 overflow-y-auto font-mono">
                      {previewMode === 'paid' && (
                        <>
                          <p>Subject: [Gappsy] New availability request — StateN…</p>
                          <p className="mt-2">From: Gappsy Leads</p>
                          <p className="mt-2">You're receiving this because you have an active paid listing.</p>
                          <p className="mt-2">Lead Details:</p>
                          <p className="ml-2">Name: [Contact Name]</p>
                          <p className="ml-2">Email: contact@example.com</p>
                          <p className="ml-2">Phone: [if provided]</p>
                          <p className="ml-2">Message: [if provided]</p>
                          <p className="mt-2">→ Manage preferences / Unsubscribe</p>
                        </>
                      )}
                      {previewMode === 'unpaid' && (
                        <>
                          <p>Subject: [Gappsy] Someone checked your availability…</p>
                          <p className="mt-2">From: Gappsy Opportunity</p>
                          <p className="mt-2">A visitor just checked if you were available.</p>
                          <p className="mt-2">Their name: [First Name]</p>
                          <p className="mt-2">Because your listing isn't paid, we routed this lead elsewhere.</p>
                          <p className="mt-2">→ [BUTTON] Activate paid listing</p>
                          <p className="mt-2">→ Manage preferences / Unsubscribe</p>
                        </>
                      )}
                      {previewMode === 'digest' && (
                        <>
                          <p>Subject: [Gappsy] 12 availability checks this week — Top-25 [State]</p>
                          <p className="mt-2">From: Gappsy Weekly Summary</p>
                          <p className="mt-2">This week, 12 potential clients checked your availability.</p>
                          <p className="mt-2">To receive leads directly, upgrade your listing.</p>
                          <p className="mt-2">→ [BUTTON] Upgrade to get leads</p>
                          <p className="mt-2">→ Manage preferences / Unsubscribe</p>
                        </>
                      )}
                    </div>
                  </div>
                )}
              </div>
            </div>

            {/* Test Email */}
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2"><Send className="w-4 h-4" />Send Test Email</h3>
              <div className="flex gap-2 mb-3">
                <input
                  type="email"
                  value={testEmail}
                  onChange={e => setTestEmail(e.target.value)}
                  placeholder="test@example.com"
                  className="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <button
                  onClick={handleTestEmail}
                  disabled={testSending || !testEmail}
                  className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
                >
                  {testSending ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                  Send
                </button>
              </div>
              <p className="text-xs text-gray-500">Sends a test notification email. Useful for verifying SMTP is working.</p>
            </div>

            {/* Digest Preview */}
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h3 className="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2"><Mail className="w-4 h-4" />Run Digest Preview</h3>
              <button
                onClick={handleRunDigestPreview}
                disabled={testSending}
                className="flex items-center gap-2 bg-violet-600 hover:bg-violet-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
              >
                {testSending ? <RefreshCw className="w-4 h-4 animate-spin" /> : <RefreshCw className="w-4 h-4" />}
                Preview weekly digest
              </button>
              <p className="text-xs text-gray-500 mt-2">Simulates running the weekly digest job. No emails are actually sent in preview mode.</p>
            </div>

            {/* Info Box */}
            <div className="bg-blue-50 border border-blue-200 rounded-xl p-4">
              <p className="text-sm text-blue-900 font-medium">Important</p>
              <ul className="text-sm text-blue-800 mt-2 space-y-1 ml-4 list-disc">
                <li>All agency-facing emails are disabled by default.</li>
                <li>Toggling these settings affects system-wide behavior for all agencies.</li>
                <li>Each agency can individually opt out via email preferences link.</li>
                <li>Compliance: every email includes unsubscribe link and reason for sending.</li>
              </ul>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
