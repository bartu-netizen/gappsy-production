import { useCallback, useEffect, useState } from 'react';
import { Play, Trash2, Pencil, Eye, EyeOff, Plus, X, MousePointerClick, Layers, Clock, Wand2 } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';
import { extractYouTubeId, isYouTubeShortsUrl } from '../utils/youtube';
import { supabase } from '../lib/supabase';

// Given a /compare/<slug> page path, finds the tool(s) that comparison is
// about (checking group comparisons first, since a 3+ tool comparison is
// the main use case, then pairwise) and returns each tool's own page path —
// e.g. so a 3-tool comparison video's admin can auto-fill the 3 individual
// tool pages instead of typing them by hand. Returns [] for anything that
// isn't a recognized /compare/ page (including a genuinely unknown slug).
async function findComparisonToolPaths(pagePath: string): Promise<string[]> {
  const match = pagePath.trim().toLowerCase().match(/^\/compare\/([^/]+)\/?$/);
  if (!match) return [];
  const slug = match[1];

  const { data: group } = await supabase
    .from('tool_group_comparisons')
    .select('tool_group_comparison_members(tools(slug))')
    .eq('slug', slug)
    .maybeSingle();
  if (group) {
    const members = (group.tool_group_comparison_members || []) as unknown as { tools: { slug: string } | null }[];
    return members.filter((m) => m.tools).map((m) => `/tools/${m.tools!.slug}/`);
  }

  const { data: pair } = await supabase
    .from('tool_comparisons')
    .select('tool_a:tools!tool_comparisons_tool_a_id_fkey(slug), tool_b:tools!tool_comparisons_tool_b_id_fkey(slug)')
    .eq('slug', slug)
    .maybeSingle();
  if (pair) {
    const row = pair as unknown as { tool_a: { slug: string } | null; tool_b: { slug: string } | null };
    return [row.tool_a?.slug, row.tool_b?.slug].filter((s): s is string => Boolean(s)).map((s) => `/tools/${s}/`);
  }

  return [];
}

interface VideoTarget {
  id: string;
  page_path: string;
}

interface VideoEmbedRow {
  id: string;
  page_path: string;
  youtube_url: string;
  youtube_video_id: string;
  is_short: boolean;
  title: string;
  is_active: boolean;
  impression_count: number;
  click_count: number;
  view_count: number;
  seconds_watched_total: number;
  created_at: string;
  page_video_embed_targets: VideoTarget[];
}

interface FormState {
  id: string | null;
  page_path: string;
  extra_page_paths: string;
  youtube_url: string;
  title: string;
}

const EMPTY_FORM: FormState = { id: null, page_path: '', extra_page_paths: '', youtube_url: '', title: '' };

function formatSeconds(total: number): string {
  const s = Math.round(total);
  if (s < 60) return `${s}s`;
  const m = Math.floor(s / 60);
  const rem = s % 60;
  return `${m}m ${rem}s`;
}

// Manages page_video_embeds + page_video_embed_targets (see migrations
// 20260715050000, 20260722040000) — one video can be shown on several
// pages at once (e.g. a 3-tool comparison video also embedded on each of
// the 3 tool pages), rendered right above "At a Glance" (see
// VideoEmbedSection.tsx). All writes go through admin-video-embeds; URL
// parsing (video ID + Shorts detection) happens here, client-side, before
// the request ever leaves the browser.
export default function WpAdminVideoEmbedsPage() {
  const [embeds, setEmbeds] = useState<VideoEmbedRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [form, setForm] = useState<FormState>(EMPTY_FORM);
  const [formOpen, setFormOpen] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [actingId, setActingId] = useState<string | null>(null);
  const [newTargetPath, setNewTargetPath] = useState<Record<string, string>>({});
  const [detecting, setDetecting] = useState(false);

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
    setForm({ id: embed.id, page_path: embed.page_path, extra_page_paths: '', youtube_url: embed.youtube_url, title: embed.title });
    setFormOpen(true);
  }

  const isComparePath = /^\/compare\/[^/]+\/?$/.test(form.page_path.trim().toLowerCase());

  async function handleDetectToolPaths() {
    setDetecting(true);
    setError(null);
    const found = await findComparisonToolPaths(form.page_path);
    setDetecting(false);
    if (found.length === 0) {
      setError("Couldn't find a comparison matching that page — check the slug, or add the tool pages manually below.");
      return;
    }
    setForm((f) => {
      const existing = new Set(f.extra_page_paths.split('\n').map((p) => p.trim()).filter(Boolean));
      const merged = [...existing, ...found.filter((p) => !existing.has(p))];
      return { ...f, extra_page_paths: merged.join('\n') };
    });
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
    const extraPaths = form.extra_page_paths
      .split('\n')
      .map((p) => p.trim())
      .filter(Boolean);
    const payload = {
      action: form.id ? 'update' : 'create',
      ...(form.id ? { id: form.id } : {}),
      page_path: form.page_path.trim(),
      ...(form.id ? {} : { extra_page_paths: extraPaths }),
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

  async function handleAddTarget(embed: VideoEmbedRow) {
    const path = (newTargetPath[embed.id] || '').trim();
    if (!path) return;
    setActingId(embed.id);
    const result = await adminApiFetch<{ ok: boolean; data: VideoTarget; error?: string }>('admin-video-embeds', {
      method: 'POST',
      body: { action: 'add_target', video_embed_id: embed.id, page_path: path },
    });
    if (result.ok && result.data?.ok) {
      setNewTargetPath((prev) => ({ ...prev, [embed.id]: '' }));
      fetchEmbeds();
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to add page'));
    }
    setActingId(null);
  }

  async function handleRemoveTarget(embed: VideoEmbedRow, target: VideoTarget) {
    setActingId(embed.id);
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-video-embeds', {
      method: 'POST',
      body: { action: 'remove_target', id: target.id },
    });
    if (result.ok && result.data?.ok) {
      fetchEmbeds();
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to remove page'));
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
                placeholder="/tools/canva or /compare/canva-vs-figma-vs-webflow"
                required
                className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            {!form.id && (
              <div>
                <div className="flex items-center justify-between mb-1.5">
                  <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 block">
                    Also show on these pages (one per line, optional)
                  </label>
                  {isComparePath && (
                    <button
                      type="button"
                      onClick={handleDetectToolPaths}
                      disabled={detecting}
                      className="inline-flex items-center gap-1 text-xs font-medium text-indigo-600 hover:text-indigo-700 disabled:opacity-40 shrink-0"
                    >
                      <Wand2 className="w-3.5 h-3.5" /> {detecting ? 'Detecting…' : 'Detect tool pages from this comparison'}
                    </button>
                  )}
                </div>
                <textarea
                  value={form.extra_page_paths}
                  onChange={(e) => setForm((f) => ({ ...f, extra_page_paths: e.target.value }))}
                  placeholder={'/tools/figma\n/tools/webflow'}
                  rows={3}
                  className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 font-mono"
                />
                <p className="text-[11px] text-slate-400 mt-1">
                  E.g. a 3-tool comparison video: the webpage URL above is the comparison page — click "Detect tool pages" once you've typed it in, or add each tool's own page here by hand.
                </p>
              </div>
            )}
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
              <div key={embed.id} className="bg-white border border-slate-200 rounded-xl p-4">
                <div className="flex items-center gap-4">
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
                    <div className="flex items-center gap-3 mt-1.5 text-xs text-slate-500 flex-wrap">
                      <span className="inline-flex items-center gap-1"><Eye className="w-3 h-3" /> {embed.impression_count.toLocaleString()} impressions</span>
                      <span className="inline-flex items-center gap-1"><MousePointerClick className="w-3 h-3" /> {embed.click_count.toLocaleString()} clicks</span>
                      <span className="inline-flex items-center gap-1"><Play className="w-3 h-3" /> {embed.view_count.toLocaleString()} views</span>
                      <span className="inline-flex items-center gap-1"><Clock className="w-3 h-3" /> {formatSeconds(embed.seconds_watched_total)} watched</span>
                    </div>
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

                <div className="mt-3 pt-3 border-t border-slate-100">
                  <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1.5 flex items-center gap-1">
                    <Layers className="w-3 h-3" /> Shown on {embed.page_video_embed_targets.length} page{embed.page_video_embed_targets.length === 1 ? '' : 's'}
                  </p>
                  <div className="flex flex-wrap gap-1.5 mb-2">
                    {embed.page_video_embed_targets.map((t) => (
                      <span key={t.id} className="inline-flex items-center gap-1 text-xs bg-slate-50 text-slate-600 px-2 py-1 rounded-full">
                        {t.page_path}
                        <button
                          type="button"
                          disabled={actingId === embed.id}
                          onClick={() => handleRemoveTarget(embed, t)}
                          aria-label={`Remove ${t.page_path}`}
                          className="text-slate-400 hover:text-rose-600 disabled:opacity-50"
                        >
                          <X className="w-3 h-3" />
                        </button>
                      </span>
                    ))}
                  </div>
                  <div className="flex items-center gap-2">
                    <input
                      type="text"
                      value={newTargetPath[embed.id] || ''}
                      onChange={(e) => setNewTargetPath((prev) => ({ ...prev, [embed.id]: e.target.value }))}
                      placeholder="/tools/another-tool"
                      className="flex-1 px-2.5 py-1.5 rounded-lg border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    />
                    <button
                      type="button"
                      disabled={actingId === embed.id || !(newTargetPath[embed.id] || '').trim()}
                      onClick={() => handleAddTarget(embed)}
                      className="inline-flex items-center gap-1 text-xs font-medium text-indigo-600 hover:text-indigo-700 disabled:opacity-40 shrink-0"
                    >
                      <Plus className="w-3.5 h-3.5" /> Add page
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
