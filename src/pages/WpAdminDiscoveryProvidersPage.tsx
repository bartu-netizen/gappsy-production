import { Link } from 'react-router-dom';
import { ArrowLeft, Plug, ToggleLeft, ToggleRight } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ProviderRow {
  id: string;
  key: string;
  name: string;
  type: 'manual' | 'csv' | 'api' | 'crawler';
  enabled: boolean;
  candidate_count: number;
}

interface ListResponse { ok: boolean; data: ProviderRow[]; }
interface ToggleResponse { ok: boolean; }

const TYPE_LABELS: Record<string, string> = { manual: 'Manual', csv: 'CSV', api: 'API', crawler: 'Crawler' };

// Provider registry — the whole point of the Discovery Engine's provider
// architecture is that adding Product Hunt / GitHub / npm / etc. later is a
// migration seed row + a provider module, never a change to this page or
// the core pipeline. Today: Manual Import + CSV Import.
export default function WpAdminDiscoveryProvidersPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-discovery-providers');
  const { mutate: toggleProvider } = useAdminMutation<ToggleResponse, { id: string; enabled: boolean }>((v) => `admin-discovery-providers?id=${v.id}`, 'PUT');

  const providers = data?.data || [];

  async function handleToggle(id: string, currentEnabled: boolean) {
    const result = await toggleProvider({ id, enabled: !currentEnabled });
    if (result.ok) refetch();
  }

  return (
    <WpAdminLayout title="Providers" subtitle="Discovery sources feeding the Discovery Queue">
      <div className="max-w-4xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Providers</h1>
          <p className="text-gray-500 mt-1 text-sm">Each provider is isolated — adding a new one never requires changing the Queue, Validation, or Duplicate Engine.</p>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading providers..." />}

        {!isLoading && !isError && providers.length === 0 && (
          <AdminEmptyState icon={Plug} title="No providers configured" message="Providers are seeded by migration — none found." />
        )}

        {!isLoading && providers.length > 0 && (
          <div className="space-y-3">
            {providers.map((provider) => (
              <div key={provider.id} className="bg-white border border-gray-200 rounded-lg p-4 flex items-center justify-between gap-4">
                <div className="flex items-center gap-3 min-w-0">
                  <div className="w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center shrink-0">
                    <Plug className="w-4 h-4 text-gray-600" />
                  </div>
                  <div className="min-w-0">
                    <p className="font-semibold text-gray-900 text-sm">{provider.name}</p>
                    <p className="text-xs text-gray-500">
                      {TYPE_LABELS[provider.type] || provider.type} &middot; {provider.candidate_count.toLocaleString()} candidate{provider.candidate_count === 1 ? '' : 's'}
                    </p>
                  </div>
                </div>
                <button
                  onClick={() => handleToggle(provider.id, provider.enabled)}
                  className={`inline-flex items-center gap-1.5 text-sm font-medium shrink-0 ${provider.enabled ? 'text-emerald-600' : 'text-gray-400'}`}
                  title={provider.enabled ? 'Disable this provider' : 'Enable this provider'}
                >
                  {provider.enabled ? <ToggleRight className="w-6 h-6" /> : <ToggleLeft className="w-6 h-6" />}
                  {provider.enabled ? 'Enabled' : 'Disabled'}
                </button>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
