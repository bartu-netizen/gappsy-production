import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Search,
  ChevronLeft,
  ChevronRight,
  Copy,
  Check,
  ExternalLink,
  Trash2,
  Image as ImageIcon,
  ImageOff,
  Video,
  File as FileIcon,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

type MediaKind = 'logo' | 'screenshot' | 'video' | 'other';

interface MediaRow {
  id: string;
  tool_id: string | null;
  file_url: string;
  file_path: string;
  kind: MediaKind;
  original_filename: string | null;
  size_bytes: number | null;
  uploaded_by: string | null;
  created_at: string;
  tools: { id: string; slug: string; name: string; logo: string | null } | null;
}

interface ListResponse {
  ok: boolean;
  data: MediaRow[];
  total: number;
  page: number;
  per_page: number;
}

const PER_PAGE = 24;
const DEBOUNCE_MS = 300;

const KIND_FILTERS: { value: 'all' | MediaKind; label: string }[] = [
  { value: 'all', label: 'All' },
  { value: 'logo', label: 'Logo' },
  { value: 'screenshot', label: 'Screenshot' },
  { value: 'video', label: 'Video' },
  { value: 'other', label: 'Other' },
];

const KIND_BADGE_CLASS: Record<MediaKind, string> = {
  logo: 'bg-blue-100 text-blue-700',
  screenshot: 'bg-violet-100 text-violet-700',
  video: 'bg-rose-100 text-rose-700',
  other: 'bg-gray-100 text-gray-600',
};

function KindFallbackIcon({ kind, className }: { kind: MediaKind; className?: string }) {
  if (kind === 'video') return <Video className={className} />;
  if (kind === 'other') return <FileIcon className={className} />;
  return <ImageOff className={className} />;
}

function formatBytes(bytes: number | null): string {
  if (bytes === null || bytes === undefined || Number.isNaN(bytes)) return '—';
  if (bytes === 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB'];
  const exponent = Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1);
  const value = bytes / Math.pow(1024, exponent);
  return `${value.toFixed(exponent === 0 ? 0 : 1)} ${units[exponent]}`;
}

function formatDate(iso: string): string {
  const d = new Date(iso);
  if (Number.isNaN(d.getTime())) return '—';
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

// Browse/manage view for every file tracked by admin-tool-media. This is a
// deliberately read-and-manage page, not an uploader — uploads still happen
// from the Tool Editor's Screenshots/Overview tabs. "Reuse across tools" here
// means: copy a file's public URL and paste it into another tool's Screenshots
// field (which already accepts a raw URL as an upload alternative).
export default function WpAdminMediaLibraryPage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [kindFilter, setKindFilter] = useState<'all' | MediaKind>('all');
  const [page, setPage] = useState(1);
  const [copiedId, setCopiedId] = useState<string | null>(null);
  const [erroredIds, setErroredIds] = useState<Set<string>>(new Set());
  const [deleteConfirmId, setDeleteConfirmId] = useState<string | null>(null);
  const [deleteBusyId, setDeleteBusyId] = useState<string | null>(null);
  const [deleteError, setDeleteError] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => {
    setPage(1);
    setDeleteError(null);
  }, [search, kindFilter]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    if (search) params.set('q', search);
    if (kindFilter !== 'all') params.set('kind', kindFilter);
    return `admin-tool-media?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: deleteMedia } = useAdminMutation<{ ok: boolean }, string>(
    (id) => `admin-tool-media?id=${id}`,
    'DELETE'
  );

  const items = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));
  const hasFilters = !!search || kindFilter !== 'all';

  async function handleCopy(id: string, url: string) {
    try {
      await navigator.clipboard.writeText(url);
      setCopiedId(id);
      setTimeout(() => setCopiedId((current) => (current === id ? null : current)), 2000);
    } catch {
      setDeleteError('Could not copy to clipboard. Copy the URL manually.');
    }
  }

  async function handleDelete(id: string) {
    if (deleteConfirmId !== id) {
      setDeleteConfirmId(id);
      setTimeout(() => setDeleteConfirmId((current) => (current === id ? null : current)), 5000);
      return;
    }
    if (!window.confirm('Delete this file? This removes it from storage and cannot be undone.')) {
      setDeleteConfirmId(null);
      return;
    }
    setDeleteBusyId(id);
    setDeleteError(null);
    const result = await deleteMedia(id);
    setDeleteBusyId(null);
    setDeleteConfirmId(null);
    if (!result.ok) {
      setDeleteError(result.error?.message || 'Failed to delete file.');
    } else {
      refetch();
    }
  }

  return (
    <WpAdminLayout title="Media Library" subtitle="Every file uploaded through the tool editor — logos, screenshots, and more">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Media Library</h1>
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} file{total === 1 ? '' : 's'}</p>
          </div>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px] relative">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by filename..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
          <div className="flex flex-wrap items-center gap-1.5">
            {KIND_FILTERS.map((k) => (
              <button
                key={k.value}
                onClick={() => setKindFilter(k.value)}
                className={`text-xs font-medium px-3 py-1.5 rounded-lg border transition ${
                  kindFilter === k.value
                    ? 'bg-gray-900 text-white border-gray-900'
                    : 'bg-white text-gray-600 border-gray-300 hover:bg-gray-50'
                }`}
              >
                {k.label}
              </button>
            ))}
          </div>
        </div>

        {deleteError && (
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 mb-4 text-sm text-amber-800">
            {deleteError}
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading media..." />}

        {!isLoading && !isError && items.length === 0 && (
          <AdminEmptyState
            icon={ImageIcon}
            title="No media found"
            message={
              hasFilters
                ? 'No media matches these filters.'
                : "No tracked uploads yet — files uploaded through the tool editor's Screenshots/Logo fields will appear here."
            }
          />
        )}

        {!isLoading && items.length > 0 && (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
              {items.map((item) => {
                const errored = erroredIds.has(item.id);
                const isCopied = copiedId === item.id;
                const isConfirmingDelete = deleteConfirmId === item.id;
                const isDeleteBusy = deleteBusyId === item.id;

                return (
                  <div key={item.id} className="bg-white border border-gray-200 rounded-lg overflow-hidden flex flex-col">
                    <div className="relative aspect-square bg-gray-50">
                      {!errored ? (
                        <img
                          src={item.file_url}
                          alt={item.original_filename || ''}
                          className="w-full h-full object-cover"
                          onError={() => setErroredIds((prev) => new Set(prev).add(item.id))}
                        />
                      ) : (
                        <div className="w-full h-full flex items-center justify-center text-gray-300">
                          <KindFallbackIcon kind={item.kind} className="w-8 h-8" />
                        </div>
                      )}
                      <span
                        className={`absolute top-2 left-2 inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${KIND_BADGE_CLASS[item.kind]}`}
                      >
                        {item.kind}
                      </span>
                    </div>

                    <div className="p-3 flex-1 flex flex-col gap-1.5">
                      <p className="text-sm font-medium text-gray-900 truncate" title={item.original_filename || item.file_path}>
                        {item.original_filename || item.file_path}
                      </p>

                      <p className="text-xs text-gray-500 truncate">
                        {item.tools ? (
                          <Link to={`/wp-admin/tools/${item.tools.id}/edit`} className="text-blue-600 hover:underline">
                            {item.tools.name}
                          </Link>
                        ) : (
                          <span className="text-gray-400">— (unattached)</span>
                        )}
                      </p>

                      <div className="flex items-center justify-between text-xs text-gray-400">
                        <span>{formatBytes(item.size_bytes)}</span>
                        <span>{formatDate(item.created_at)}</span>
                      </div>
                      <p className="text-xs text-gray-400 truncate">By {item.uploaded_by || '—'}</p>

                      <div className="mt-auto pt-2 flex items-center gap-1.5">
                        <button
                          onClick={() => handleCopy(item.id, item.file_url)}
                          className={`flex-1 inline-flex items-center justify-center gap-1 text-xs font-medium px-2 py-1.5 rounded-lg border transition ${
                            isCopied
                              ? 'bg-emerald-50 border-emerald-200 text-emerald-700'
                              : 'bg-white border-gray-300 text-gray-600 hover:bg-gray-50'
                          }`}
                          title="Copy public URL to reuse this file on another tool"
                        >
                          {isCopied ? <Check className="w-3.5 h-3.5" /> : <Copy className="w-3.5 h-3.5" />}
                          {isCopied ? 'Copied!' : 'Copy URL'}
                        </button>
                        <a
                          href={item.file_url}
                          target="_blank"
                          rel="noreferrer"
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded-lg border border-gray-300 transition"
                          title="View"
                        >
                          <ExternalLink className="w-3.5 h-3.5" />
                        </a>
                        <button
                          onClick={() => handleDelete(item.id)}
                          disabled={isDeleteBusy}
                          className={`p-1.5 rounded-lg border transition disabled:opacity-50 ${
                            isConfirmingDelete
                              ? 'text-white bg-red-600 border-red-600 hover:bg-red-700'
                              : 'text-red-600 border-gray-300 hover:bg-red-50'
                          }`}
                          title={isConfirmingDelete ? 'Click again to confirm delete' : 'Delete'}
                        >
                          <Trash2 className="w-3.5 h-3.5" />
                        </button>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} file{total === 1 ? '' : 's'}</p>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => setPage((p) => Math.max(1, p - 1))}
                  disabled={page <= 1}
                  className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition"
                >
                  <ChevronLeft className="w-4 h-4" /> Prev
                </button>
                <button
                  onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
                  disabled={page >= totalPages}
                  className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition"
                >
                  Next <ChevronRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
