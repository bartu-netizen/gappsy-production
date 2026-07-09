import { useEffect, useState, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { Plus, Eye, Mail, MousePointerClick, RefreshCw, Loader } from 'lucide-react';
import { QuickSendOneToOneModal } from '../../components/em/QuickSendOneToOneModal';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { supabase } from '../../lib/supabase';
import { useAdminSession } from '../../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../../lib/adminApiFetch';
import { AdminErrorBanner } from '../../components/admin/AdminErrorBanner';
import AdminReAuthCard from '../../components/admin/AdminReAuthCard';

interface QuickSendRow {
  id: string;
  to_email: string;
  to_name?: string;
  subject: string;
  status: string;
  sent_at?: string;
  opens_count: number;
  opens_total: number;
  clicks_count: number;
  clicks_total: number;
}

interface Template {
  id: string;
  name: string;
  html_body: string;
  text_body?: string;
}

function SkeletonRow() {
  return (
    <tr>
      {[1, 2, 3, 4, 5, 6, 7].map((i) => (
        <td key={i} className="px-6 py-4">
          <div className="h-4 bg-gray-100 rounded animate-pulse" />
        </td>
      ))}
    </tr>
  );
}

export default function QuickSendsPage() {
  const navigate = useNavigate();
  const { status: sessionStatus, isReady, isValid } = useAdminSession();
  const [quickSends, setQuickSends] = useState<QuickSendRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [authError, setAuthError] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [templates, setTemplates] = useState<Template[]>([]);
  const hasFetchedRef = useRef(false);

  const loadQuickSends = useCallback(async () => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    setLoading(true);
    setError(null);
    setApiError(null);

    const result = await adminApiFetch<{ messages?: QuickSendRow[]; error?: string }>('quick-send-admin-read');

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? 'Failed to load');
      return;
    }

    setQuickSends(result.data?.messages ?? []);
    setLoading(false);
  }, [isReady, isValid]);

  async function loadTemplates() {
    try {
      const { data } = await supabase
        .from('em_templates')
        .select('id, name, html_body, text_body')
        .eq('is_active', true)
        .order('created_at', { ascending: false });
      setTemplates(data || []);
    } catch {
      /* templates are optional */
    }
  }

  useEffect(() => {
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      loadQuickSends();
      loadTemplates();
    }
  }, [isReady, isValid, loadQuickSends]);

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  const handleSuccess = (messageId: string) => {
    setIsModalOpen(false);
    navigate(`/wp-admin/email/quick-send/${messageId}`);
  };

  if (sessionStatus === 'loading') {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Send and track individual emails">
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Restoring admin session...</span>
        </div>
      </EmailModuleLayout>
    );
  }

  if (authError || sessionStatus === 'invalid') {
    return (
      <EmailModuleLayout title="Quick Sends" subtitle="Send and track individual emails">
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to access quick sends."
          />
        </div>
      </EmailModuleLayout>
    );
  }

  const statusColors: Record<string, string> = {
    sent: 'bg-green-100 text-green-800',
    delivered: 'bg-emerald-100 text-emerald-800',
    queued: 'bg-blue-100 text-blue-800',
    failed: 'bg-red-100 text-red-800',
  };

  return (
    <EmailModuleLayout title="Quick Sends" subtitle="Send and track individual emails">
      <div className="max-w-6xl mx-auto">
        <div className="flex items-center justify-between mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Quick Sends</h1>
            <p className="text-gray-600 mt-1">Send individual emails with tracking</p>
          </div>
          <button
            onClick={() => setIsModalOpen(true)}
            className="flex items-center gap-2 px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium shadow-sm transition-colors"
          >
            <Plus size={20} />
            New Quick Send
          </button>
        </div>

        {apiError && (
          <div className="mb-6">
            <AdminErrorBanner
              error={apiError}
              onRetry={apiError.retryable ? () => { setApiError(null); loadQuickSends(); } : undefined}
              onLogin={() => setAuthError(true)}
            />
          </div>
        )}
        {error && !apiError && (
          <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-xl flex items-start gap-3">
            <div className="flex-1">
              <p className="text-sm font-medium text-red-800">Failed to load quick sends</p>
              <p className="text-xs text-red-600 mt-0.5">{error}</p>
            </div>
            <button
              onClick={loadQuickSends}
              className="flex items-center gap-1 px-3 py-1.5 bg-red-100 hover:bg-red-200 text-red-700 rounded-lg text-sm font-medium"
            >
              <RefreshCw size={14} />
              Retry
            </button>
          </div>
        )}

        {loading ? (
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    {['Recipient', 'Subject', 'Status', 'Sent', 'Opens', 'Clicks', ''].map((h) => (
                      <th key={h} className="px-6 py-3 text-left text-sm font-semibold text-gray-700">{h}</th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {[1, 2, 3].map((i) => <SkeletonRow key={i} />)}
                </tbody>
              </table>
            </div>
          </div>
        ) : !error && quickSends.length === 0 ? (
          <div className="bg-white rounded-xl border border-gray-200 p-16 text-center shadow-sm">
            <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Mail size={28} className="text-gray-400" />
            </div>
            <h3 className="text-lg font-semibold text-gray-900 mb-2">No quick sends yet</h3>
            <p className="text-gray-500 mb-6 max-w-xs mx-auto">
              Send a 1:1 email with full open and click tracking
            </p>
            <button
              onClick={() => setIsModalOpen(true)}
              className="inline-flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium shadow-sm transition-colors"
            >
              <Plus size={20} />
              Send Your First Email
            </button>
          </div>
        ) : quickSends.length > 0 ? (
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="px-6 py-3 text-left text-sm font-semibold text-gray-700">Recipient</th>
                    <th className="px-6 py-3 text-left text-sm font-semibold text-gray-700">Subject</th>
                    <th className="px-6 py-3 text-left text-sm font-semibold text-gray-700">Status</th>
                    <th className="px-6 py-3 text-left text-sm font-semibold text-gray-700">Sent</th>
                    <th className="px-6 py-3 text-center text-sm font-semibold text-gray-700 cursor-help" title="Unique opens. Total opens are available on the message detail page.">Opens</th>
                    <th className="px-6 py-3 text-center text-sm font-semibold text-gray-700 cursor-help" title="Unique clicks. Total clicks are available on the message detail page.">Clicks</th>
                    <th className="px-6 py-3"></th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {quickSends.map((send) => (
                    <tr key={send.id} className="hover:bg-gray-50 transition-colors">
                      <td className="px-6 py-4">
                        <div className="text-sm">
                          <p className="font-medium text-gray-900 truncate max-w-[160px]">
                            {send.to_name || send.to_email}
                          </p>
                          {send.to_name && (
                            <p className="text-gray-400 text-xs truncate max-w-[160px]">{send.to_email}</p>
                          )}
                        </div>
                      </td>
                      <td className="px-6 py-4">
                        <p className="text-sm text-gray-900 truncate max-w-xs">{send.subject}</p>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${statusColors[send.status] || 'bg-gray-100 text-gray-700'}`}>
                          {send.status.charAt(0).toUpperCase() + send.status.slice(1)}
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <p className="text-sm text-gray-500">
                          {send.sent_at ? new Date(send.sent_at).toLocaleDateString() : '\u2014'}
                        </p>
                      </td>
                      <td className="px-6 py-4 text-center">
                        <div className="flex items-center justify-center gap-1.5">
                          <Eye size={15} className="text-blue-400" />
                          <span className="text-sm font-semibold text-gray-800">{send.opens_count}</span>
                        </div>
                      </td>
                      <td className="px-6 py-4 text-center">
                        <div className="flex items-center justify-center gap-1.5">
                          <MousePointerClick size={15} className="text-green-400" />
                          <span className="text-sm font-semibold text-gray-800">{send.clicks_count}</span>
                        </div>
                      </td>
                      <td className="px-6 py-4 text-right">
                        <button
                          onClick={() => navigate(`/wp-admin/email/quick-send/${send.id}`)}
                          className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"
                        >
                          <Eye size={15} />
                          View
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        <QuickSendOneToOneModal
          isOpen={isModalOpen}
          onClose={() => setIsModalOpen(false)}
          onSuccess={handleSuccess}
          templates={templates}
        />
      </div>
    </EmailModuleLayout>
  );
}
