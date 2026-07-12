import { useMemo, useState } from 'react';
import { CheckCircle2, Plus } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface PromptVersion {
  id: string;
  prompt_key: string;
  version: number;
  name: string;
  purpose: string | null;
  system_template: string;
  user_template: string;
  output_schema: Record<string, unknown>;
  provider_compatibility: string[];
  model_recommendation: string | null;
  active: boolean;
  created_at: string;
  created_by: string | null;
  change_notes: string | null;
}

interface ListResponse {
  ok: boolean;
  data: PromptVersion[];
}

export default function WpAdminAiEnrichmentPromptVersionsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-enrichment-prompt-versions');
  const { mutate: mutateActivate } = useAdminMutation('admin-enrichment-prompt-versions');
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState({ prompt_key: 'tool_editorial_enrichment', name: '', purpose: '', change_notes: '', system_template: '', user_template: '', output_schema: '', make_active: false });
  const { mutate: mutateCreate, isLoading: isCreating, errorMessage: createError } = useAdminMutation('admin-enrichment-prompt-versions');

  const versions = useMemo(() => data?.data || [], [data]);
  const grouped = useMemo(() => {
    const map = new Map<string, PromptVersion[]>();
    for (const v of versions) {
      if (!map.has(v.prompt_key)) map.set(v.prompt_key, []);
      map.get(v.prompt_key)!.push(v);
    }
    return [...map.entries()];
  }, [versions]);

  const activate = async (id: string) => {
    await mutateActivate({ action: 'activate', id });
    refetch();
  };

  const submitCreate = async () => {
    let outputSchema: unknown;
    try {
      outputSchema = JSON.parse(form.output_schema || '{}');
    } catch {
      return;
    }
    const result = await mutateCreate({ ...form, output_schema: outputSchema });
    if (result.ok) {
      setShowForm(false);
      setForm({ prompt_key: 'tool_editorial_enrichment', name: '', purpose: '', change_notes: '', system_template: '', user_template: '', output_schema: '', make_active: false });
      refetch();
    }
  };

  return (
    <WpAdminLayout title="Prompt Versions" subtitle="Versioned enrichment prompt templates — creating a new version never overwrites history">
      <div className="max-w-4xl mx-auto">
        <div className="flex justify-end mb-4">
          <button onClick={() => setShowForm((v) => !v)} className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm">
            <Plus className="w-4 h-4" /> New version
          </button>
        </div>

        {showForm && (
          <div className="bg-white border border-gray-200 rounded-lg p-4 mb-6 space-y-3">
            {createError && <AdminErrorBanner error={{ code: 'server_error', message: createError, retryable: true }} />}
            <input placeholder="prompt_key" value={form.prompt_key} onChange={(e) => setForm({ ...form, prompt_key: e.target.value })} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm" />
            <input placeholder="Name" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm" />
            <input placeholder="Purpose" value={form.purpose} onChange={(e) => setForm({ ...form, purpose: e.target.value })} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm" />
            <textarea placeholder="System template" value={form.system_template} onChange={(e) => setForm({ ...form, system_template: e.target.value })} rows={4} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm font-mono" />
            <textarea placeholder="User template" value={form.user_template} onChange={(e) => setForm({ ...form, user_template: e.target.value })} rows={3} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm font-mono" />
            <textarea placeholder="Output schema (JSON)" value={form.output_schema} onChange={(e) => setForm({ ...form, output_schema: e.target.value })} rows={4} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm font-mono" />
            <textarea placeholder="Change notes" value={form.change_notes} onChange={(e) => setForm({ ...form, change_notes: e.target.value })} rows={2} className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm" />
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" checked={form.make_active} onChange={(e) => setForm({ ...form, make_active: e.target.checked })} />
              Make this version active immediately
            </label>
            <button onClick={submitCreate} disabled={isCreating || !form.name || !form.system_template || !form.user_template} className="bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold text-sm disabled:opacity-40">
              {isCreating ? 'Creating…' : 'Create version'}
            </button>
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading prompt versions..." />}
        {!isLoading && !isError && versions.length === 0 && <AdminEmptyState icon={Plus} title="No prompt versions" message="Create the first one above." />}

        {grouped.map(([key, list]) => (
          <div key={key} className="mb-6">
            <h2 className="font-semibold text-gray-900 text-sm mb-2">{key}</h2>
            <div className="bg-white border border-gray-200 rounded-lg divide-y divide-gray-100">
              {list.sort((a, b) => b.version - a.version).map((v) => (
                <div key={v.id} className="p-3 flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-gray-900 text-sm">v{v.version} — {v.name}</span>
                      {v.active && <span className="text-[10px] px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700 flex items-center gap-1"><CheckCircle2 className="w-3 h-3" /> Active</span>}
                    </div>
                    {v.purpose && <p className="text-xs text-gray-500 mt-0.5">{v.purpose}</p>}
                    <p className="text-xs text-gray-400 mt-0.5">{v.provider_compatibility.join(', ')} · {v.model_recommendation || 'no model recommendation'} · by {v.created_by || 'unknown'} · {new Date(v.created_at).toLocaleDateString()}</p>
                    {v.change_notes && <p className="text-xs text-gray-500 mt-1 italic">{v.change_notes}</p>}
                  </div>
                  {!v.active && (
                    <button onClick={() => activate(v.id)} className="shrink-0 px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
                      Activate
                    </button>
                  )}
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </WpAdminLayout>
  );
}
