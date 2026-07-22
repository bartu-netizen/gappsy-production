import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, ToggleLeft, ToggleRight, Loader2, Info } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface Rule {
  id: string; field_key: string; label: string; tier: string; required: boolean; enabled: boolean; updated_at: string; updated_by: string | null;
}
interface ListResponse { ok: boolean; data: Rule[] }
interface UpdateResponse { ok: boolean; data?: Rule; error?: string }

// Configurable first-publish gate — see _shared/toolCompletenessRelations.ts's
// getConfiguredFirstPublishRequiredKeys, which admin-tools reads on every
// publish attempt. Toggling a rule here takes effect immediately, no
// deploy. The base gate (name/slug/website/category/description/pricing)
// is intentionally NOT editable here — those are structural requirements
// a tool page can't render without, not an editorial policy choice.
export default function WpAdminPublishingRulesPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-publishing-rules');
  const { mutate: updateRule } = useAdminMutation<UpdateResponse, Record<string, unknown>>('admin-publishing-rules', 'POST');
  const [busyKey, setBusyKey] = useState<string | null>(null);

  const rules = data?.data || [];

  async function handleToggle(rule: Rule, field: 'enabled' | 'required') {
    setBusyKey(rule.field_key);
    await updateRule({ action: 'update', field_key: rule.field_key, [field]: !rule[field] });
    setBusyKey(null);
    refetch();
  }

  return (
    <WpAdminLayout title="Publishing Rules" subtitle="Configure what's required before a tool can be marked Ready to Publish">
      <div className="max-w-3xl mx-auto">
        <Link to="/wp-admin/editorial" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" /> Back to Editorial Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Publishing Rules</h1>
          <p className="text-gray-500 mt-1 text-sm">These gate the first draft/needs_review/ready_to_publish → published transition. Re-saving an already-published tool is never blocked by these.</p>
        </div>

        <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 mb-6 flex items-start gap-2.5">
          <Info className="w-4 h-4 text-blue-600 shrink-0 mt-0.5" />
          <p className="text-xs text-blue-800">
            Name, slug, website, category, description, and pricing model are always required and can't be disabled here —
            a tool page can't render without them.
          </p>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading rules..." />}

        {!isLoading && rules.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg overflow-hidden divide-y divide-gray-100">
            {rules.map((rule) => {
              const isBusy = busyKey === rule.field_key;
              return (
                <div key={rule.id} className="flex items-center justify-between gap-4 px-4 py-3.5">
                  <div>
                    <p className="font-medium text-gray-900 text-sm">{rule.label}</p>
                    <p className="text-xs text-gray-400 mt-0.5">field_key: {rule.field_key}</p>
                  </div>
                  <div className="flex items-center gap-4 shrink-0">
                    {isBusy && <Loader2 className="w-4 h-4 animate-spin text-gray-400" />}
                    <button
                      onClick={() => handleToggle(rule, 'required')}
                      disabled={isBusy || !rule.enabled}
                      className={`text-xs font-medium px-2.5 py-1 rounded-full border transition disabled:opacity-40 disabled:cursor-not-allowed ${rule.required ? 'bg-gray-900 text-white border-gray-900' : 'bg-white text-gray-500 border-gray-200'}`}
                    >
                      {rule.required ? 'Required' : 'Optional'}
                    </button>
                    <button
                      onClick={() => handleToggle(rule, 'enabled')}
                      disabled={isBusy}
                      className={`inline-flex items-center gap-1.5 text-sm font-medium disabled:opacity-40 disabled:cursor-not-allowed ${rule.enabled ? 'text-emerald-600' : 'text-gray-400'}`}
                      title={rule.enabled ? 'Disable this rule (never blocks publish)' : 'Enable this rule'}
                    >
                      {rule.enabled ? <ToggleRight className="w-6 h-6" /> : <ToggleLeft className="w-6 h-6" />}
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
