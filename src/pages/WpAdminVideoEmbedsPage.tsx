import { useCallback, useEffect, useState } from 'react';
import { Play, Trash2, Pencil, Eye, EyeOff, Plus, X } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';
import { extractYouTubeId, isYouTubeShortsUrl } from '../utils/youtube';

interface VideoEmbedRow {
  id: string;
  page_path: string;
  youtube_url: string;
  youtube_video_id: string;
  is_short: boolean;
  title: string;
  is_active: boolean;
  view_count: number;
  created_at: string;
}

interface FormState {
  id: string | null;
  page_path: string;
  youtube_url: string;
  title: string;
}

const EMPTY_FORM: FormState = { id: null, page_path: '', youtube_url: '', title: '' };

// Manages page_video_embeds (see migration 20260715050000) — one YouTube /
// YouTube Shorts video per page path, rendered on the public page right
// above "At a Glance" (see VideoEmbedSection.tsx). All writes go through
// admin-video-embeds; URL parsing (video ID + Shorts detection) happens
// here, client-side, before the request ever leaves the browser.
export default function WpAdminVideoEmbedsPage() {
  const [embeds, setEmbeds] = useState<VideoEmbedRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [form, setForm] = useState<FormState>(EMPTY_FORM);
  const [formOpen, setFormOpen] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [actingId, setActingId] = useState<string | null>(null);

  const fetchEmbeds = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; data: VideoEmbedRow[]; error?: string }>('admin-video-embeds');
    if (result.ok && result.data?.ok) {
      setEmbeds(result.data.data);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load video embeds'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchEmbeds();
  }, [fetchEmbeds]);

  function openCreate() {
    setForm(EMPTY_FORM);
    setFormOpen(true);
  }

  function openEdit(embed: VideoEmbedRow) {
    setForm({ id: embed.id, page_path: embed.page_path, youtube_url: embed.youtube_url, title: embed.title });
    setFormOpen(true);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const videoId = extractYouTubeId(form.youtube_url);
    if (!videoId) {
      setError('Could not read a video ID from that YouTube URL — check the link and try again.');
      return;
    }
    if (!form.page_path.trim() || !form.title.trim()) {
      setError('Page path and title are required.');
      return;
    }

    setSubmitting(true);
    setError(null);
    const payload = {
      action: form.id ? 'update' : 'create',
      ...(form.id ? { id: form.id } : {}),
      page_path: form.page_path.trim(),
      youtube_url: form.youtube_url.trim(),
      youtube_video_id: videoId,
      is_short: isYouTubeShortsUrl(form.youtube_url),
      title: form.title.trim(),
    };
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-video-embeds', { method: 'POST', body: payload });
    setSubmitting(false);
    if (result.ok && result.data?.ok) {
      setFormOpen(false);
      setForm(EMPTY_FORM);
      fetchEmbeds();
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to save video embed'));
    }
  }

  async function toggleActive(embed: VideoEmbedRow) {
    setActingId(embed.id);
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-video-embeds', {
      method: 'POST',
      body: { action: 'update', id: embed.id, is_active: !embed.is_active },
    });
    if (result.ok && result.data?.ok) {
      setEmbeds((prev) => prev.map((e) => (e.id === embed.id ? { ...e, is_active: !e.is_active } : e)));
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to update video embed'));
    }
    setActingId(null);
  }

  async function handleDelete(embed: VideoEmbedRow) {
    if (!confirm(`Delete the video embed for ${embed.page_path}? This can't be undone.`)) return;
    setActingId(embed.id);
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-video-embeds', {
      method: 'POST',
      body: { action: 'delete', id: embed.id },
    });
    if (result.ok && result.data?.ok) {
      setEmbeds((prev) => prev.filter((e) => e.id !== embed.id));
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to delete video embed'));
    }
    setActingId(null);
  }

  return (
    <WpAdminLayout title="Video Embeds" subtitle="Manage YouTube / Shorts embeds shown on specific pages, above At a Glance">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        <div className="flex items-center justify-between">
          <p className="text-sm text-slate-500">{embeds.length} video embed{embeds.length === 1 ? '' : 's'}</p>
          <button
            type="button"
            onClick={openCreate}
            className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] transition-colors"
          >
            <Plus className="w-4 h-4" />
            Add video embed
          </button>
        </div>

        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {formOpen && (
          <form onSubmit={handleSubmit} className="bg-white border border-slate-200 rounded-xl p-5 space-y-4">
            <div className="flex items-center justify-between">
              <p className="font-semibold text-[#0B1221] text-sm">{form.id ? 'Edit video embed' : 'New video embed'}</p>
              <button type="button" onClick={() => setFormOpen(false)} aria-label="Close" className="text-slate-400 hover:text-slate-600">
                <X className="w-4 h-4" />
              </button>
            </div>
            <div>
              <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">Webpage URL</label>
              <input
                type="text"
                value={form.page_path}
                onChange={(e) => setForm((f) => ({ ...f, page_path: e.target.value }))}
                placeholder="/tools/canva"
                required
                className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <div>
              <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">YouTube link (normal or Shorts)</label>
              <input
                type="text"
                value={form.youtube_url}
                onChange={(e) => setForm((f) => ({ ...f, youtube_url: e.target.value }))}
                placeholder="https://www.youtube.com/shorts/... or https://www.youtube.com/watch?v=..."
                required
                className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <div>
              <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">Title</label>
              <input
                type="text"
                value={form.title}
                onChange={(e) => setForm((f) => ({ ...f, title: e.target.value }))}
                placeholder="See Canva in 60 seconds"
                required
                className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <button
              type="submit"
              disabled={submitting}
              className="inline-flex items-center justify-center px-5 py-2.5 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] disabled:opacity-60 transition-colors"
            >
              {submitting ? 'Saving…' : form.id ? 'Save changes' : 'Create embed'}
            </button>
          </form>
        )}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : embeds.length === 0 ? (
          <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">No video embeds yet.</p>
        ) : (
          <div className="space-y-3">
            {embeds.map((embed) => (
              <div key={embed.id} className="bg-white border border-slate-200 rounded-xl p-4 flex items-center gap-4">
                <img
                  src={`https://img.youtube.com/vi/${embed.youtube_video_id}/hqdefault.jpg`}
                  alt=""
                  className={`shrink-0 rounded-lg object-cover bg-slate-100 ${embed.is_short ? 'w-14 h-24' : 'w-24 h-14'}`}
                />
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-2 flex-wrap">
                    <p className="font-medium text-[#0B1221] text-sm truncate">{embed.title}</p>
                    {embed.is_short && <span className="text-[10px] font-semibold uppercase tracking-wide text-indigo-600 bg-indigo-50 px-1.5 py-0.5 rounded">Shorts</span>}
                    {!embed.is_active && <span className="text-[10px] font-semibold uppercase tracking-wide text-slate-500 bg-slate-100 px-1.5 py-0.5 rounded">Inactive</span>}
                  </div>
                  <p className="text-xs text-slate-400 mt-0.5">{embed.page_path}</p>
                  <p className="text-xs text-slate-500 mt-1 inline-flex items-center gap-1">
                    <Play className="w-3 h-3" /> {embed.view_count.toLocaleString()} view{embed.view_count === 1 ? '' : 's'}
                  </p>
                </div>
                <div className="flex items-center gap-1.5 shrink-0">
                  <button
                    type="button"
                    disabled={actingId === embed.id}
                    onClick={() => toggleActive(embed)}
                    aria-label={embed.is_active ? 'Deactivate' : 'Activate'}
                    className="w-9 h-9 rounded-full bg-slate-50 text-slate-500 hover:bg-slate-100 flex items-center justify-center transition-colors disabled:opacity-50"
                  >
                    {embed.is_active ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
                  </button>
                  <button
                    type="button"
                    onClick={() => openEdit(embed)}
                    aria-label="Edit"
                    className="w-9 h-9 rounded-full bg-indigo-50 text-indigo-600 hover:bg-indigo-100 flex items-center justify-center transition-colors"
                  >
                    <Pencil className="w-4 h-4" />
                  </button>
                  <button
                    type="button"
                    disabled={actingId === embed.id}
                    onClick={() => handleDelete(embed)}
                    aria-label="Delete"
                    className="w-9 h-9 rounded-full bg-rose-50 text-rose-600 hover:bg-rose-100 flex items-center justify-center transition-colors disabled:opacity-50"
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
