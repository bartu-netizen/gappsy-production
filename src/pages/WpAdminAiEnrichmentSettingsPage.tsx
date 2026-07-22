import { useEffect, useState } from 'react';
import { Save } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface Settings {
  active_provider: string;
  default_confidence_threshold: number;
  default_batch_size: number;
  max_batch_size: number;
  default_prompt_key: string;
}

interface SettingsResponse {
  ok: boolean;
  data: Settings;
}

const PROVIDERS = [
  { key: 'claude_code_batch', label: 'Claude Code Batch (Claude Max subscription)', implemented: true },
  { key: 'anthropic', label: 'Anthropic API — coming soon', implemented: false },
  { key: 'openai', label: 'OpenAI API — coming soon', implemented: false },
  { key: 'gemini', label: 'Gemini API — coming soon', implemented: false },
];

export default function WpAdminAiEnrichmentSettingsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<SettingsResponse>('admin-enrichment-settings');
  const { mutate, isLoading: isSaving, errorMessage: saveError, isSuccess } = useAdminMutation<SettingsResponse, unknown>('admin-enrichment-settings', 'PUT');
  const [form, setForm] = useState<Settings | null>(null);

  useEffect(() => {
    if (data?.data && !form) setForm(data.data);
  }, [data, form]);

  const save = async () => {
    if (!form) return;
    const result = await mutate(form as unknown);
    if (result.ok) refetch();
  };

  return (
    <WpAdminLayout title="AI Enrichment — Model Settings" subtitle="Provider, confidence threshold, and batch size limits">
      <div className="max-w-2xl mx-auto">
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading settings..." />}

        {form && (
          <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-5">
            {saveError && <AdminErrorBanner error={{ code: 'server_error', message: saveError, retryable: true }} />}
            {isSuccess && <p className="text-sm text-emerald-600">Settings saved.</p>}

            <div>
              <label className="block text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1.5">Active provider</label>
              <select
                value={form.active_provider}
                onChange={(e) => setForm({ ...form, active_provider: e.target.value })}
                className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm"
              >
                {PROVIDERS.map((p) => (
                  <option key={p.key} value={p.key} disabled={!p.implemented}>{p.label}</option>
                ))}
              </select>
              <p className="text-xs text-gray-400 mt-1">Only Claude Code Batch is implemented today — no API key required. Live API providers can be added later without changing the rest of the system.</p>
            </div>

            <div>
              <label className="block text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1.5">Default confidence threshold for "Approve all eligible" (0–100)</label>
              <input
                type="number" min={0} max={100} value={form.default_confidence_threshold}
                onChange={(e) => setForm({ ...form, default_confidence_threshold: Number(e.target.value) })}
                className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm"
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1.5">Default batch size</label>
                <input
                  type="number" min={1} value={form.default_batch_size}
                  onChange={(e) => setForm({ ...form, default_batch_size: Number(e.target.value) })}
                  className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1.5">Max batch size</label>
                <input
                  type="number" min={1} max={250} value={form.max_batch_size}
                  onChange={(e) => setForm({ ...form, max_batch_size: Number(e.target.value) })}
                  className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1.5">Default prompt key</label>
              <input
                type="text" value={form.default_prompt_key}
                onChange={(e) => setForm({ ...form, default_prompt_key: e.target.value })}
                className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm"
              />
              <p className="text-xs text-gray-400 mt-1">Must have at least one active version in Prompt Versions.</p>
            </div>

            <button onClick={save} disabled={isSaving} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-40">
              <Save className="w-4 h-4" />
              {isSaving ? 'Saving…' : 'Save settings'}
            </button>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
