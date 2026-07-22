import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Save, ArrowLeft } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface ToolOption {
  id: string;
  slug: string;
  name: string;
  status: string;
}

interface ToolsListResponse {
  ok: boolean;
  data: ToolOption[];
}

interface ComparisonFormData {
  tool_a_id: string;
  tool_b_id: string;
  status: 'draft' | 'published';
}

interface ComparisonDetailResponse {
  ok: boolean;
  data: ComparisonFormData & { id: string; slug: string };
}

const EMPTY_FORM: ComparisonFormData = { tool_a_id: '', tool_b_id: '', status: 'draft' };

export default function WpAdminToolComparisonEditorPage() {
  const { id } = useParams<{ id?: string }>();
  const navigate = useNavigate();
  const isEditMode = !!id;

  const { data: toolsData, isLoading: toolsLoading } = useAdminFetch<ToolsListResponse>('admin-tools');
  const { data, isLoading, isError, error } = useAdminFetch<ComparisonDetailResponse>(
    () => (isEditMode ? `admin-tool-comparisons?id=${id}` : null)
  );

  const [formData, setFormData] = useState<ComparisonFormData>(EMPTY_FORM);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const { mutate: createComparison } = useAdminMutation<{ ok: boolean; data: { id: string } }, ComparisonFormData>(
    'admin-tool-comparisons',
    'POST'
  );
  const { mutate: updateComparison } = useAdminMutation<{ ok: boolean }, ComparisonFormData>(
    `admin-tool-comparisons?id=${id}`,
    'PUT'
  );

  useEffect(() => {
    document.title = isEditMode ? 'Edit Tool Comparison | Admin' : 'New Tool Comparison | Admin';
  }, [isEditMode]);

  useEffect(() => {
    if (data?.data) {
      const c = data.data;
      setFormData({ tool_a_id: c.tool_a_id, tool_b_id: c.tool_b_id, status: c.status });
    }
  }, [data]);

  const tools = toolsData?.data || [];
  const publishedTools = tools.filter((t) => t.status === 'published');
  const toolA = tools.find((t) => t.id === formData.tool_a_id);
  const toolB = tools.find((t) => t.id === formData.tool_b_id);
  const previewSlug =
    toolA && toolB
      ? [toolA.slug, toolB.slug].sort((a, b) => a.localeCompare(b)).join('-vs-')
      : null;

  async function handleSave() {
    setSaveError(null);
    if (!formData.tool_a_id || !formData.tool_b_id) {
      setSaveError('Both tools are required.');
      return;
    }
    if (formData.tool_a_id === formData.tool_b_id) {
      setSaveError('Tool A and Tool B must be different tools.');
      return;
    }
    setSaving(true);
    const result = isEditMode ? await updateComparison(formData) : await createComparison(formData);
    setSaving(false);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to save comparison');
      return;
    }
    navigate('/wp-admin/tool-comparisons');
  }

  if (isEditMode && isLoading) {
    return (
      <WpAdminLayout title="Edit Tool Comparison">
        <AdminLoadingState message="Loading comparison..." />
      </WpAdminLayout>
    );
  }

  if (isEditMode && isError && error) {
    return (
      <WpAdminLayout title="Edit Tool Comparison">
        <AdminErrorBanner error={error} />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title={isEditMode ? 'Edit Tool Comparison' : 'New Tool Comparison'}>
      <div className="max-w-2xl mx-auto">
        <Link to="/wp-admin/tool-comparisons" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Comparisons
        </Link>

        {saveError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700">{saveError}</div>
        )}

        <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 text-sm text-amber-800 mb-4">
          Only publish a pair once real editorial content exists for it in
          <code className="mx-1 px-1 py-0.5 bg-amber-100 rounded text-xs">src/data/comparisonContent/</code>
          (verdict, best-for, key differences). Publishing without that content still works, but the page will fall back to DB facts only.
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tool A</label>
            <select
              value={formData.tool_a_id}
              disabled={toolsLoading}
              onChange={(e) => setFormData((p) => ({ ...p, tool_a_id: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Select a tool…</option>
              {publishedTools.map((t) => (
                <option key={t.id} value={t.id}>{t.name}</option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tool B</label>
            <select
              value={formData.tool_b_id}
              disabled={toolsLoading}
              onChange={(e) => setFormData((p) => ({ ...p, tool_b_id: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Select a tool…</option>
              {publishedTools.map((t) => (
                <option key={t.id} value={t.id}>{t.name}</option>
              ))}
            </select>
          </div>

          {previewSlug && (
            <p className="text-xs text-gray-400">
              Canonical URL: /compare/{previewSlug} (ordering is always alphabetical by slug, regardless of which tool is A or B)
            </p>
          )}

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select
              value={formData.status}
              onChange={(e) => setFormData((p) => ({ ...p, status: e.target.value as ComparisonFormData['status'] }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="draft">Draft</option>
              <option value="published">Published</option>
            </select>
          </div>

          <div className="flex justify-end pt-2">
            <button
              onClick={handleSave}
              disabled={saving}
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 disabled:bg-gray-400 transition text-sm"
            >
              <Save className="w-4 h-4" />
              {saving ? 'Saving...' : 'Save Comparison'}
            </button>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
