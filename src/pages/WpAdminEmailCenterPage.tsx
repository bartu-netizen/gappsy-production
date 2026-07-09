import { useEffect, useState, useRef, useCallback } from 'react';
import { RefreshCw, Send, CheckCircle, XCircle, Loader } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner } from '../components/admin/AdminErrorBanner';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';

interface SmtpVars {
  SMTP_HOST: boolean;
  SMTP_PORT: boolean;
  SMTP_USERNAME: boolean;
  SMTP_PASSWORD: boolean;
  SMTP_FROM_SUPPORT: boolean;
  SMTP_INTERNAL_EMAIL: boolean;
}

interface SmtpDetails {
  portNumber: number | null;
  fromSupport: string | null;
  internalEmail: string | null;
}

interface StatusResponse {
  ok: boolean;
  action: string;
  vars: SmtpVars;
  details: SmtpDetails;
}

interface SendTestResponse {
  ok: boolean;
  action?: string;
  messageId?: string;
  to?: string;
  from?: string;
  subject?: string;
  error?: string;
  hint?: string;
}

const LOCAL_TEMPLATES = [
  { key: 'basic', label: 'Basic Test Email', description: 'Simple test message' },
  { key: 'welcome', label: 'Welcome Email', description: 'Welcome message for new users' },
  { key: 'notification', label: 'Notification', description: 'Generic notification template' },
];

export default function WpAdminEmailCenterPage() {
  const BUILD_ID = 'smtp-test-supabase-v1';
  const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
  const apiUrl = `${supabaseUrl}/functions/v1/smtp-test`;

  const { status: sessionStatus, isReady, isValid } = useAdminSession();
  const [loading, setLoading] = useState(false);
  const [status, setStatus] = useState<StatusResponse | null>(null);
  const [selectedTemplate, setSelectedTemplate] = useState('basic');
  const [testEmail, setTestEmail] = useState('bartu@gappsy.com');
  const [alert, setAlert] = useState<{ type: 'success' | 'error'; message: string } | null>(null);
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [authError, setAuthError] = useState(false);
  const hasFetchedRef = useRef(false);

  const fetchStatus = useCallback(async () => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    setLoading(true);
    setAlert(null);
    setApiError(null);

    const result = await adminApiFetch<StatusResponse>('smtp-test', {
      method: 'POST',
      body: { action: 'status' },
    });

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setAlert({
        type: 'error',
        message: `Failed to fetch status: ${result.error?.message ?? 'Unknown error'}`,
      });
      return;
    }

    const data = result.data;
    if (data && !data.ok) {
      setAlert({
        type: 'error',
        message: (data as any).error || 'Status check failed',
      });
      setLoading(false);
      return;
    }

    setStatus(data ?? null);
    if (data) {
      const allConfigured = Object.values(data.vars).every(v => v);
      setAlert({
        type: 'success',
        message: allConfigured
          ? 'SMTP is fully configured!'
          : 'SMTP is partially configured. Check missing variables below.',
      });
    }
    setLoading(false);
  }, [isReady, isValid]);

  const handleSendTest = async () => {
    if (!testEmail || !testEmail.includes('@')) {
      setAlert({ type: 'error', message: 'Please enter a valid email address' });
      return;
    }

    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }

    setLoading(true);
    setAlert(null);
    setApiError(null);

    const template = LOCAL_TEMPLATES.find(t => t.key === selectedTemplate);
    const subject = template ? `Gappsy SMTP Test - ${template.label}` : 'Gappsy SMTP Test';

    const result = await adminApiFetch<SendTestResponse>('smtp-test', {
      method: 'POST',
      body: {
        action: 'sendTest',
        to: testEmail,
        subject,
        text: `This is a test email from Gappsy Email Center.\n\nTemplate: ${template?.label || 'Basic'}\nSent at: ${new Date().toLocaleString()}`,
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 30px; border-radius: 10px 10px 0 0;">
              <h1 style="color: white; margin: 0; font-size: 28px;">Gappsy SMTP Test</h1>
            </div>
            <div style="background: white; padding: 30px; border: 1px solid #e5e7eb; border-top: none; border-radius: 0 0 10px 10px;">
              <h2 style="color: #4f46e5; margin-top: 0;">Test Email Successful!</h2>
              <p style="color: #374151; font-size: 16px; line-height: 1.6;">
                This is a test email from the Gappsy Email Center. If you're reading this, your SMTP configuration is working correctly.
              </p>
              <div style="background: #f3f4f6; padding: 15px; border-radius: 8px; margin: 20px 0;">
                <p style="margin: 5px 0; color: #6b7280; font-size: 14px;">
                  <strong>Template:</strong> ${template?.label || 'Basic'}
                </p>
                <p style="margin: 5px 0; color: #6b7280; font-size: 14px;">
                  <strong>Sent at:</strong> ${new Date().toLocaleString()}
                </p>
              </div>
              <p style="color: #9ca3af; font-size: 12px; margin-top: 30px; padding-top: 20px; border-top: 1px solid #e5e7eb;">
                This is an automated test email from gappsy.com
              </p>
            </div>
          </div>
        `,
      },
    });

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setAlert({
        type: 'error',
        message: `Send failed: ${result.error?.message ?? 'Unknown error'}`,
      });
      return;
    }

    const data = result.data;
    if (data?.ok) {
      setAlert({
        type: 'success',
        message: `Test email sent successfully to ${testEmail}!`,
      });
    } else {
      setAlert({
        type: 'error',
        message: `Send failed: ${data?.error || 'Unknown error'}`,
      });
    }
    setLoading(false);
  };

  useEffect(() => {
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      fetchStatus();
    }
  }, [isReady, isValid, fetchStatus]);

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  if (sessionStatus === 'loading') {
    return (
      <WpAdminLayout title="Email Center" subtitle="SMTP status, templates, and test sends">
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Restoring admin session...</span>
        </div>
      </WpAdminLayout>
    );
  }

  if (authError || sessionStatus === 'invalid') {
    return (
      <WpAdminLayout title="Email Center" subtitle="SMTP status, templates, and test sends">
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to access the email center."
          />
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title="Email Center" subtitle="SMTP status, templates, and test sends">
      <div className="space-y-6">
            {/* Build Info */}
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <div className="flex items-center gap-3">
                <div className="text-blue-800 font-semibold">Supabase Edge Function SMTP Testing</div>
                <div className="flex-1 text-sm font-mono text-blue-700">
                  Build: {BUILD_ID}
                </div>
              </div>
              <div className="mt-2 text-xs font-mono text-blue-600 break-all">
                {apiUrl}
              </div>
            </div>

            {/* API Error Banner */}
            {apiError && (
              <AdminErrorBanner
                error={apiError}
                onRetry={apiError.retryable ? () => { setApiError(null); fetchStatus(); } : undefined}
                onLogin={() => setAuthError(true)}
              />
            )}

            {/* Alert */}
            {alert && !apiError && (
              <div
                className={`p-4 rounded-lg flex items-start gap-3 ${
                  alert.type === 'success'
                    ? 'bg-green-50 border border-green-200'
                    : 'bg-red-50 border border-red-200'
                }`}
              >
                {alert.type === 'success' ? (
                  <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                ) : (
                  <XCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                )}
                <p
                  className={`text-sm font-medium ${
                    alert.type === 'success' ? 'text-green-800' : 'text-red-800'
                  }`}
                >
                  {alert.message}
                </p>
              </div>
            )}

            {/* SMTP Status Card */}
            <div className="bg-white border-2 border-gray-200 rounded-xl p-6">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-xl font-semibold text-gray-900">SMTP Configuration Status</h2>
                <button
                  onClick={fetchStatus}
                  disabled={loading}
                  className="flex items-center gap-2 px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg transition-colors disabled:opacity-50"
                >
                  <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
                  Refresh
                </button>
              </div>

              {status && (
                <div className="space-y-4">
                  {/* Overall Status */}
                  <div
                    className={`flex items-center gap-3 p-4 rounded-lg ${
                      Object.values(status.vars).every(v => v)
                        ? 'bg-green-50 border-2 border-green-300'
                        : 'bg-yellow-50 border-2 border-yellow-300'
                    }`}
                  >
                    {Object.values(status.vars).every(v => v) ? (
                      <>
                        <CheckCircle className="w-6 h-6 text-green-600" />
                        <div>
                          <div className="font-semibold text-green-900">SMTP Fully Configured</div>
                          <div className="text-sm text-green-700">
                            All required environment variables are set in Bolt Secrets. Ready to send emails.
                          </div>
                        </div>
                      </>
                    ) : (
                      <>
                        <XCircle className="w-6 h-6 text-yellow-600" />
                        <div>
                          <div className="font-semibold text-yellow-900">SMTP Incomplete</div>
                          <div className="text-sm text-yellow-700">
                            Some environment variables are missing. Check the details below.
                          </div>
                        </div>
                      </>
                    )}
                  </div>

                  {/* Individual Variables */}
                  <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                    {[
                      { label: 'SMTP_HOST', value: status.vars.SMTP_HOST },
                      { label: 'SMTP_PORT', value: status.vars.SMTP_PORT },
                      { label: 'SMTP_USERNAME', value: status.vars.SMTP_USERNAME },
                      { label: 'SMTP_PASSWORD', value: status.vars.SMTP_PASSWORD },
                      { label: 'SMTP_FROM_SUPPORT', value: status.vars.SMTP_FROM_SUPPORT },
                      { label: 'SMTP_INTERNAL_EMAIL', value: status.vars.SMTP_INTERNAL_EMAIL },
                    ].map((item) => (
                      <div
                        key={item.label}
                        className={`flex items-center gap-2 px-3 py-2 rounded-lg ${
                          item.value ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-700'
                        }`}
                      >
                        {item.value ? (
                          <CheckCircle className="w-4 h-4" />
                        ) : (
                          <XCircle className="w-4 h-4" />
                        )}
                        <span className="text-sm font-medium">{item.label}</span>
                      </div>
                    ))}
                  </div>

                  {/* Details Section */}
                  {status.details && (status.details.fromSupport || status.details.internalEmail || status.details.portNumber) && (
                    <div className="mt-4 pt-4 border-t border-gray-200">
                      <div className="grid md:grid-cols-3 gap-3 text-sm">
                        {status.details.portNumber && (
                          <div>
                            <span className="font-semibold text-gray-700">Port:</span>{' '}
                            <span className="text-gray-600">{status.details.portNumber}</span>
                          </div>
                        )}
                        {status.details.fromSupport && (
                          <div>
                            <span className="font-semibold text-gray-700">From:</span>{' '}
                            <span className="text-gray-600">{status.details.fromSupport}</span>
                          </div>
                        )}
                        {status.details.internalEmail && (
                          <div>
                            <span className="font-semibold text-gray-700">Internal:</span>{' '}
                            <span className="text-gray-600">{status.details.internalEmail}</span>
                          </div>
                        )}
                      </div>
                    </div>
                  )}

                  {!Object.values(status.vars).every(v => v) && (
                    <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 mt-4">
                      <p className="text-sm text-yellow-800">
                        <strong>Configuration Required:</strong> Set missing environment variables in
                        Bolt Secrets to enable email functionality.
                      </p>
                    </div>
                  )}
                </div>
              )}
            </div>

            {/* Send Test Email Card */}
            <div className="bg-white border-2 border-gray-200 rounded-xl p-6">
              <h2 className="text-xl font-semibold text-gray-900 mb-4">Send Test Email</h2>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Email Template
                  </label>
                  <select
                    value={selectedTemplate}
                    onChange={(e) => setSelectedTemplate(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                  >
                    {LOCAL_TEMPLATES.map((template) => (
                      <option key={template.key} value={template.key}>
                        {template.label} - {template.description}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Recipient Email
                  </label>
                  <input
                    type="email"
                    value={testEmail}
                    onChange={(e) => setTestEmail(e.target.value)}
                    placeholder="your-email@example.com"
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                  />
                </div>

                <button
                  onClick={handleSendTest}
                  disabled={loading || !testEmail || !status || !Object.values(status.vars).every(v => v)}
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium"
                >
                  <Send className="w-5 h-5" />
                  {loading ? 'Sending...' : 'Send Test Email'}
                </button>

                {status && !Object.values(status.vars).every(v => v) && (
                  <p className="text-sm text-gray-600 text-center">
                    Configure all SMTP variables above before sending test emails
                  </p>
                )}
              </div>
            </div>

            {/* Instructions Card */}
            <div className="bg-gray-50 border border-gray-200 rounded-xl p-6">
              <h3 className="text-lg font-semibold text-gray-900 mb-3">How to Configure SMTP</h3>
              <ol className="space-y-2 text-sm text-gray-700">
                <li className="flex gap-2">
                  <span className="font-semibold text-indigo-600">1.</span>
                  <span>Go to Bolt Dashboard → Your Project → Secrets</span>
                </li>
                <li className="flex gap-2">
                  <span className="font-semibold text-indigo-600">2.</span>
                  <span>Add the following environment variables:</span>
                </li>
              </ol>
              <div className="mt-3 bg-gray-100 rounded-lg p-3 font-mono text-xs text-gray-800 space-y-1">
                <div>SMTP_HOST = your-smtp-server.com</div>
                <div>SMTP_PORT = 587</div>
                <div>SMTP_USERNAME = your-username</div>
                <div>SMTP_PASSWORD = your-password</div>
                <div>SMTP_FROM_SUPPORT = support@gappsy.com</div>
                <div>SMTP_INTERNAL_EMAIL = bartu@gappsy.com</div>
              </div>
              <ol start={3} className="space-y-2 text-sm text-gray-700 mt-3">
                <li className="flex gap-2">
                  <span className="font-semibold text-indigo-600">3.</span>
                  <span>Deploy your project</span>
                </li>
                <li className="flex gap-2">
                  <span className="font-semibold text-indigo-600">4.</span>
                  <span>Click "Refresh" above to verify configuration</span>
                </li>
                <li className="flex gap-2">
                  <span className="font-semibold text-indigo-600">5.</span>
                  <span>Send a test email to verify SMTP is working</span>
                </li>
              </ol>
            </div>
      </div>
    </WpAdminLayout>
  );
}
