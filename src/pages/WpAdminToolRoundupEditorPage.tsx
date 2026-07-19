import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
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

interface MemberFormRow {
  tool_id: string;
  best_for: string;
}

interface RoundupFormData {
  title: string;
  verdict: string;
  video_url: string;
  status: 'draft' | 'published';
  members: MemberFormRow[];
}

interface RoundupDetailResponse {
  ok: boolean;
  data: {
    id: string;
    slug: string;
    title: string;
    verdict: string | null;
    video_url: string | null;
    status: 'draft' | 'published';
    members: { sort_order: number; best_for: string | null; tool: ToolOption | null }[];
  };
}

const MIN_MEMBERS = 3;
const EMPTY_MEMBER: MemberFormRow = { tool_id: '', best_for: '' };
const EMPTY_FORM: RoundupFormData = {
  title: '',
  verdict: '',
  video_url: '',
  status: 'draft',
  members: [EMPTY_MEMBER, { ...EMPTY_MEMBER }, { ...EMPTY_MEMBER }],
};

export default function WpAdminToolRoundupEditorPage() {
  const { id } = useParams<{ id?: string }>();
  const navigate = useNavigate();
  const isEditMode = !!id;

  const { data: toolsData, isLoading: toolsLoading } = useAdminFetch<ToolsListResponse>('admin-tools');
  const { data, isLoading, isError, error } = useAdminFetch<RoundupDetailResponse>(
    () => (isEditMode ? `admin-tool-roundups?id=${id}` : null)
  );

  const [formData, setFormData] = useState<RoundupFormData>(EMPTY_FORM);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const { mutate: createRoundup } = useAdminMutation<{ ok: boolean; data: { id: string } }, unknown>(
    'admin-tool-roundups',
    'POST'
  );
  const { mutate: updateRoundup } = useAdminMutation<{ ok: boolean }, unknown>(
    `admin-tool-roundups?id=${id}`,
    'PUT'
  );

  useEffect(() => {
    document.title = isEditMode ? 'Edit Tool Roundup | Admin' : 'New Tool Roundup | Admin';
  }, [isEditMode]);

  useEffect(() => {
    if (data?.data) {
      const r = data.data;
      const sortedMembers = [...r.members].sort((a, b) => a.sort_order - b.sort_order);
      setFormData({
        title: r.title,
        verdict: r.verdict || '',
        video_url: r.video_url || '',
        status: r.status,
        members: sortedMembers.length
          ? sortedMembers.map((m) => ({ tool_id: m.tool?.id || '', best_for: m.best_for || '' }))
          : EMPTY_FORM.members,
      });
    }
  }, [data]);

  const tools = toolsData?.data || [];
  const publishedTools = tools.filter((t) => t.status === 'published');
  const selectedTools = formData.members
    .map((m) => tools.find((t) => t.id === m.tool_id))
    .filter((t): t is ToolOption => Boolean(t));
  const previewSlug =
    selectedTools.length >= MIN_MEMBERS
      ? [...selectedTools].sort((a, b) => a.slug.localeCompare(b.slug)).map((t) => t.slug).join('-vs-')
      : null;

  function updateMember(index: number, patch: Partial<MemberFormRow>) {
    setFormData((p) => ({
      ...p,
      members: p.members.map((m, i) => (i === index ? { ...m, ...patch } : m)),
    }));
  }

  function addMemberRow() {
    setFormData((p) => ({ ...p, members: [...p.members, { ...EMPTY_MEMBER }] }));
  }

  function removeMemberRow(index: number) {
    setFormData((p) => ({ ...p, members: p.members.filter((_, i) => i !== index) }));
  }

  async function handleSave() {
    setSaveError(null);

    const filledMembers = formData.members.filter((m) => m.tool_id);
    if (filledMembers.length < MIN_MEMBERS) {
      setSaveError(`Select at least ${MIN_MEMBERS} tools.`);
      return;
    }
    const uniqueToolIds = new Set(filledMembers.map((m) => m.tool_id));
    if (uniqueToolIds.size !== filledMembers.length) {
      setSaveError('Each tool can only appear once in a roundup.');
      return;
    }
    if (!formData.title.trim()) {
      setSaveError('Title is required.');
      return;
    }

    const payload = {
      title: formData.title.trim(),
      verdict: formData.verdict.trim() || null,
      video_url: formData.video_url.trim() || null,
      status: formData.status,
      members: filledMembers.map((m) => ({ tool_id: m.tool_id, best_for: m.best_for.trim() || null })),
    };

    setSaving(true);
    const result = isEditMode ? await updateRoundup(payload) : await createRoundup(payload);
    setSaving(false);
    if (!result.ok) {
      setSaveError(result.error?.message || 'Failed to save roundup');
      return;
    }
    navigate('/wp-admin/tool-roundups');
  }

  if (isEditMode && isLoading) {
    return (
      <WpAdminLayout title="Edit Tool Roundup">
        <AdminLoadingState message="Loading roundup..." />
      </WpAdminLayout>
    );
  }

  if (isEditMode && isError && error) {
    return (
      <WpAdminLayout title="Edit Tool Roundup">
        <AdminErrorBanner error={error} />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title={isEditMode ? 'Edit Tool Roundup' : 'New Tool Roundup'}>
      <div className="max-w-2xl mx-auto">
        <Link to="/wp-admin/tool-roundups" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Roundups
        </Link>

        {saveError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-700">{saveError}</div>
        )}

        <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 text-sm text-amber-800 mb-4">
          Only publish a roundup once real editorial content exists for it in
          <code className="mx-1 px-1 py-0.5 bg-amber-100 rounded text-xs">src/data/roundupContent/</code>
          (verdict, best-for per tool, highlights, feature matrix). Publishing without that content still works, but the page will fall back to DB facts only.
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
            <input
              type="text"
              value={formData.title}
              onChange={(e) => setFormData((p) => ({ ...p, title: e.target.value }))}
              placeholder="e.g. Bitwarden vs Keeper vs NordPass"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">Member tools (minimum {MIN_MEMBERS})</label>
            <div className="space-y-3">
              {formData.members.map((member, i) => (
                <div key={i} className="flex gap-2 items-start">
                  <select
                    value={member.tool_id}
                    disabled={toolsLoading}
                    onChange={(e) => updateMember(i, { tool_id: e.target.value })}
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  >
                    <option value="">Select a tool…</option>
                    {publishedTools.map((t) => (
                      <option key={t.id} value={t.id}>{t.name}</option>
                    ))}
                  </select>
                  <input
                    type="text"
                    value={member.best_for}
                    onChange={(e) => updateMember(i, { best_for: e.target.value })}
                    placeholder="Best for… (optional)"
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                  <button
                    onClick={() => removeMemberRow(i)}
                    disabled={formData.members.length <= MIN_MEMBERS}
                    className="p-2 text-gray-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition disabled:opacity-30 disabled:hover:bg-transparent disabled:hover:text-gray-400"
                    title={formData.members.length <= MIN_MEMBERS ? `At least ${MIN_MEMBERS} tools are required` : 'Remove'}
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                </div>
              ))}
            </div>
            <button
              onClick={addMemberRow}
              className="mt-3 inline-flex items-center gap-1.5 text-sm text-gray-600 hover:text-gray-900 font-medium"
            >
              <Plus className="w-4 h-4" />
              Add another tool
            </button>
          </div>

          {previewSlug && (
            <p className="text-xs text-gray-400">
              Canonical URL: /roundup/{previewSlug} (ordering is always alphabetical by slug, regardless of pick order)
            </p>
          )}

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Verdict (optional)</label>
            <textarea
              value={formData.verdict}
              onChange={(e) => setFormData((p) => ({ ...p, verdict: e.target.value }))}
              rows={3}
              placeholder="A concise, nuanced summary — never a blanket 'X wins' declaration."
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Video URL (optional)</label>
            <input
              type="text"
              value={formData.video_url}
              onChange={(e) => setFormData((p) => ({ ...p, video_url: e.target.value }))}
              placeholder="https://youtube.com/watch?v=..."
              className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select
              value={formData.status}
              onChange={(e) => setFormData((p) => ({ ...p, status: e.target.value as RoundupFormData['status'] }))}
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
              {saving ? 'Saving...' : 'Save Roundup'}
            </button>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
