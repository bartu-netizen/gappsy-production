import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Plus, Edit2, Trash2, Search, Filter, Eye, AlertCircle, CheckCircle, Upload, ThumbsUp, ThumbsDown, FileText, RefreshCw, Bug } from 'lucide-react';
import { supabase } from '../lib/supabase';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { formatStateName } from '../utils/formatLocation';

interface AgencyReview {
  id: string;
  agency_name: string;
  agency_slug: string;
  state_name: string;
  state_slug: string;
  city: string | null;
  is_top_25_ranked: boolean;
  last_updated: string;
  review_type?: 'positive' | 'negative';
  is_published?: boolean;
  uniqueness_score?: number;
}

function ReviewTypeBadge({ type }: { type?: 'positive' | 'negative' }) {
  if (!type) return <span className="text-xs text-gray-400">—</span>;
  if (type === 'positive') {
    return (
      <span className="inline-flex items-center gap-1 bg-emerald-50 text-emerald-700 border border-emerald-200 px-2 py-0.5 rounded text-xs font-medium">
        <ThumbsUp className="w-3 h-3" />
        Positive
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 bg-red-50 text-red-700 border border-red-200 px-2 py-0.5 rounded text-xs font-medium">
      <ThumbsDown className="w-3 h-3" />
      Negative
    </span>
  );
}

function PublishedBadge({ published }: { published?: boolean }) {
  if (published) {
    return (
      <span className="inline-flex items-center gap-1 bg-green-100 text-green-800 px-2 py-0.5 rounded text-xs font-medium">
        <CheckCircle className="w-3 h-3" />
        Published
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 bg-gray-100 text-gray-600 px-2 py-0.5 rounded text-xs font-medium">
      <FileText className="w-3 h-3" />
      Draft
    </span>
  );
}

function ScoreBadge({ score }: { score?: number }) {
  if (score == null) return <span className="text-xs text-gray-400">—</span>;
  let colorClass = 'bg-gray-100 text-gray-600';
  let label = 'Very Thin';
  if (score >= 80) { colorClass = 'bg-emerald-100 text-emerald-800'; label = 'Strong'; }
  else if (score >= 60) { colorClass = 'bg-blue-100 text-blue-800'; label = 'OK'; }
  else if (score >= 40) { colorClass = 'bg-yellow-100 text-yellow-800'; label = 'Thin'; }
  else { colorClass = 'bg-red-100 text-red-800'; label = 'Very Thin'; }
  return (
    <span className={`inline-flex items-center gap-1 ${colorClass} px-2 py-0.5 rounded text-xs font-medium`}>
      {score} <span className="opacity-70">{label}</span>
    </span>
  );
}

interface DiagnosticsData {
  unpublishedCount: number;
  unpublishedReviews: AgencyReview[];
  hasHozio: boolean;
  hasCalta: boolean;
  supabaseHost: string;
  projectRef: string;
  anonKeyPresent: boolean;
  directCount: number | null;
  directCountError: string | null;
  hozioLookup: { found: boolean; id?: string; is_published?: boolean; updated_at?: string } | null;
  caltaLookup: { found: boolean; id?: string; is_published?: boolean; updated_at?: string } | null;
  fetchStatus: number | null;
  fetchError: string | null;
}

export default function AdminAgencyReviewsPage() {
  const [agencies, setAgencies] = useState<AgencyReview[]>([]);
  const [filteredAgencies, setFilteredAgencies] = useState<AgencyReview[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [stateFilter, setStateFilter] = useState('all');
  const [rankingFilter, setRankingFilter] = useState('all');
  const [reviewTypeFilter, setReviewTypeFilter] = useState('all');
  const [publishedFilter, setPublishedFilter] = useState('all');
  const [uniquenessFilter, setUniquenessFilter] = useState('all');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [diagnostics, setDiagnostics] = useState<DiagnosticsData | null>(null);
  const [showDiagnostics, setShowDiagnostics] = useState(false);
  const [restoring, setRestoring] = useState(false);
  const [restoreMessage, setRestoreMessage] = useState<string | null>(null);

  useEffect(() => {
    document.title = 'Admin - Agency Reviews Management | Gappsy';
    fetchAgencies();
  }, []);

  useEffect(() => {
    filterAgencies();
  }, [searchTerm, stateFilter, rankingFilter, reviewTypeFilter, publishedFilter, uniquenessFilter, agencies]);

  async function fetchAgencies() {
    setLoading(true);
    setError(null);

    const { data, error: fetchError } = await supabase
      .from('agency_reviews')
      .select('id, agency_name, agency_slug, state_name, state_slug, city, is_top_25_ranked, last_updated, review_type, is_published, uniqueness_score')
      .order('agency_name', { ascending: true });

    if (fetchError) {
      setError('Failed to load agency reviews');
      console.error(fetchError);
    } else {
      setAgencies(data || []);
    }

    setLoading(false);
  }

  function filterAgencies() {
    let filtered = [...agencies];

    if (searchTerm) {
      const term = searchTerm.toLowerCase();
      filtered = filtered.filter(agency =>
        agency.agency_name.toLowerCase().includes(term) ||
        agency.agency_slug.toLowerCase().includes(term) ||
        agency.state_name.toLowerCase().includes(term) ||
        (agency.city && agency.city.toLowerCase().includes(term))
      );
    }

    if (stateFilter !== 'all') {
      filtered = filtered.filter(agency => agency.state_slug === stateFilter);
    }

    if (rankingFilter === 'top25') {
      filtered = filtered.filter(agency => agency.is_top_25_ranked);
    } else if (rankingFilter === 'not-ranked') {
      filtered = filtered.filter(agency => !agency.is_top_25_ranked);
    }

    if (reviewTypeFilter !== 'all') {
      filtered = filtered.filter(agency => agency.review_type === reviewTypeFilter);
    }

    if (publishedFilter === 'published') {
      filtered = filtered.filter(agency => agency.is_published);
    } else if (publishedFilter === 'draft') {
      filtered = filtered.filter(agency => !agency.is_published);
    }

    if (uniquenessFilter !== 'all') {
      const getScore = (a: AgencyReview) => a.uniqueness_score || 0;
      if (uniquenessFilter === 'strong') {
        filtered = filtered.filter(a => getScore(a) >= 80);
      } else if (uniquenessFilter === 'ok') {
        filtered = filtered.filter(a => getScore(a) >= 60 && getScore(a) < 80);
      } else if (uniquenessFilter === 'thin') {
        filtered = filtered.filter(a => getScore(a) >= 40 && getScore(a) < 60);
      } else if (uniquenessFilter === 'very-thin') {
        filtered = filtered.filter(a => getScore(a) < 40);
      }
    }

    setFilteredAgencies(filtered);
  }

  async function handleDelete(id: string, name: string) {
    if (deleteConfirm !== id) {
      setDeleteConfirm(id);
      setTimeout(() => setDeleteConfirm(null), 5000);
      return;
    }

    const confirmed = window.confirm(
      `PERMANENT DELETE: "${name}"\n\nThis will permanently remove this agency review. This action cannot be undone.\n\nAre you sure?`
    );
    if (!confirmed) {
      setDeleteConfirm(null);
      return;
    }

    const { error: deleteError } = await supabase
      .from('agency_reviews')
      .delete()
      .eq('id', id);

    if (deleteError) {
      alert(`Failed to delete ${name}: ${deleteError.message}`);
    } else {
      alert(`Successfully deleted ${name}`);
      fetchAgencies();
    }

    setDeleteConfirm(null);
  }

  async function loadDiagnostics() {
    const unpublished = agencies.filter(a => !a.is_published);
    const hasHozio = agencies.some(a => a.agency_slug === 'hozio-new-york');
    const hasCalta = agencies.some(a => a.agency_slug === 'calta-marketing-new-york');

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || '';
    const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || '';
    let host = '';
    let projectRef = '';
    try {
      const u = new URL(supabaseUrl);
      host = u.host;
      projectRef = u.host.split('.')[0]?.slice(0, 6) || '???';
    } catch { host = supabaseUrl; projectRef = '???'; }

    let directCount: number | null = null;
    let directCountError: string | null = null;
    try {
      const { count, error: cErr } = await supabase
        .from('agency_reviews')
        .select('id', { count: 'exact', head: true });
      if (cErr) directCountError = cErr.message;
      else directCount = count;
    } catch (e: any) { directCountError = e.message; }

    let hozioLookup = null;
    try {
      const { data } = await supabase
        .from('agency_reviews')
        .select('id, is_published, updated_at')
        .eq('agency_slug', 'hozio-new-york')
        .maybeSingle();
      hozioLookup = data
        ? { found: true, id: data.id, is_published: data.is_published, updated_at: data.updated_at }
        : { found: false };
    } catch { hozioLookup = { found: false }; }

    let caltaLookup = null;
    try {
      const { data } = await supabase
        .from('agency_reviews')
        .select('id, is_published, updated_at')
        .eq('agency_slug', 'calta-marketing-new-york')
        .maybeSingle();
      caltaLookup = data
        ? { found: true, id: data.id, is_published: data.is_published, updated_at: data.updated_at }
        : { found: false };
    } catch { caltaLookup = { found: false }; }

    setDiagnostics({
      unpublishedCount: unpublished.length,
      unpublishedReviews: unpublished,
      hasHozio,
      hasCalta,
      supabaseHost: host,
      projectRef,
      anonKeyPresent: anonKey.length > 10,
      directCount,
      directCountError,
      hozioLookup,
      caltaLookup,
      fetchStatus: null,
      fetchError: error,
    });
    setShowDiagnostics(true);
  }

  async function handleRestoreReviews() {
    if (!diagnostics) return;
    setRestoring(true);
    setRestoreMessage(null);

    try {
      const { error } = await supabase
        .from('agency_reviews')
        .update({ is_published: true })
        .eq('is_published', false);

      if (error) throw error;

      setRestoreMessage('Successfully restored all unpublished reviews! They are now visible to the public.');
      await new Promise(r => setTimeout(r, 1000));
      fetchAgencies();
      setShowDiagnostics(false);
      setDiagnostics(null);
    } catch (err) {
      setRestoreMessage(`Failed to restore reviews: ${err instanceof Error ? err.message : 'Unknown error'}`);
    } finally {
      setRestoring(false);
    }
  }

  const uniqueStates = Array.from(new Set(agencies.map(a => a.state_slug))).sort();
  const publishedCount = agencies.filter(a => a.is_published).length;
  const strongCount = agencies.filter(a => (a.uniqueness_score || 0) >= 80).length;

  return (
    <WpAdminLayout title="Agency Reviews" subtitle="Manage and monitor all agency review pages">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Agency Reviews Management</h1>
              <p className="text-gray-600 mt-2">Manage and monitor all agency review pages</p>
            </div>
            <div className="flex gap-2">
              <Link
                to="/wp-admin/agency-reviews/import"
                className="inline-flex items-center gap-2 bg-blue-600 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-blue-700 transition text-sm"
              >
                <Upload className="w-4 h-4" />
                Bulk Import
              </Link>
              <Link
                to="/wp-admin/agency-reviews/new"
                className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
              >
                <Plus className="w-4 h-4" />
                Add New
              </Link>
            </div>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-6">
            <div className="bg-white border border-gray-200 rounded-lg p-4">
              <p className="text-xs text-gray-500 mb-1">Total</p>
              <p className="text-2xl font-bold text-gray-900">{agencies.length}</p>
            </div>
            <div className="bg-white border border-gray-200 rounded-lg p-4">
              <p className="text-xs text-gray-500 mb-1">Published</p>
              <p className="text-2xl font-bold text-green-700">{publishedCount}</p>
            </div>
            <div className="bg-white border border-gray-200 rounded-lg p-4">
              <p className="text-xs text-gray-500 mb-1">Top 25 Ranked</p>
              <p className="text-2xl font-bold text-blue-700">{agencies.filter(a => a.is_top_25_ranked).length}</p>
            </div>
            <div className="bg-white border border-gray-200 rounded-lg p-4">
              <p className="text-xs text-gray-500 mb-1">Strong Content</p>
              <p className="text-2xl font-bold text-emerald-700">{strongCount}</p>
            </div>
          </div>

          {/* Filters */}
          <div className="bg-white border border-gray-200 rounded-lg p-5">
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6 gap-3">
              {/* Search */}
              <div className="xl:col-span-2">
                <label className="block text-xs font-medium text-gray-500 mb-1.5">
                  <Search className="w-3 h-3 inline mr-1" />
                  Search
                </label>
                <input
                  type="text"
                  placeholder="Name, slug, city, state..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
              </div>

              {/* State Filter */}
              <div>
                <label className="block text-xs font-medium text-gray-500 mb-1.5">
                  <Filter className="w-3 h-3 inline mr-1" />
                  State
                </label>
                <select
                  value={stateFilter}
                  onChange={(e) => setStateFilter(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="all">All States</option>
                  {uniqueStates.map(state => (
                    <option key={state} value={state}>
                      {agencies.find(a => a.state_slug === state)?.state_name || formatStateName(state)}
                    </option>
                  ))}
                </select>
              </div>

              {/* Review Type */}
              <div>
                <label className="block text-xs font-medium text-gray-500 mb-1.5">Review Type</label>
                <select
                  value={reviewTypeFilter}
                  onChange={(e) => setReviewTypeFilter(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="all">All Types</option>
                  <option value="positive">Positive</option>
                  <option value="negative">Negative</option>
                </select>
              </div>

              {/* Published */}
              <div>
                <label className="block text-xs font-medium text-gray-500 mb-1.5">Status</label>
                <select
                  value={publishedFilter}
                  onChange={(e) => setPublishedFilter(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="all">All Status</option>
                  <option value="published">Published</option>
                  <option value="draft">Draft</option>
                </select>
              </div>

              {/* Uniqueness */}
              <div>
                <label className="block text-xs font-medium text-gray-500 mb-1.5">Uniqueness</label>
                <select
                  value={uniquenessFilter}
                  onChange={(e) => setUniquenessFilter(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="all">All Scores</option>
                  <option value="strong">Strong (≥80)</option>
                  <option value="ok">OK (60–79)</option>
                  <option value="thin">Thin (40–59)</option>
                  <option value="very-thin">Very Thin (&lt;40)</option>
                </select>
              </div>
            </div>

            <div className="mt-3 flex items-center justify-between">
              <p className="text-xs text-gray-500">
                Showing <span className="font-semibold text-gray-700">{filteredAgencies.length}</span> of {agencies.length} agencies
              </p>
              {(searchTerm || stateFilter !== 'all' || rankingFilter !== 'all' || reviewTypeFilter !== 'all' || publishedFilter !== 'all' || uniquenessFilter !== 'all') && (
                <button
                  onClick={() => { setSearchTerm(''); setStateFilter('all'); setRankingFilter('all'); setReviewTypeFilter('all'); setPublishedFilter('all'); setUniquenessFilter('all'); }}
                  className="text-xs text-blue-600 hover:text-blue-700 font-medium"
                >
                  Clear filters
                </button>
              )}
            </div>
          </div>
        </div>

        {/* Loading State */}
        {loading && (
          <div className="bg-white border border-gray-200 rounded-lg p-12 text-center">
            <div className="animate-pulse text-gray-600">Loading agencies...</div>
          </div>
        )}

        {/* Error State */}
        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-6 mb-6">
            <div className="flex items-start gap-3">
              <AlertCircle className="w-6 h-6 text-red-600 flex-shrink-0 mt-0.5" />
              <div>
                <p className="font-semibold text-red-900">Error Loading Agencies</p>
                <p className="text-sm text-red-700 mt-1">{error}</p>
                <button onClick={fetchAgencies} className="mt-3 text-sm text-red-600 hover:text-red-700 font-medium">
                  Try Again
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Restore Message */}
        {restoreMessage && (
          <div className={`${restoreMessage.includes('Successfully') ? 'bg-green-50 border-green-200' : 'bg-red-50 border-red-200'} border rounded-lg p-6 mb-6`}>
            <div className="flex items-start gap-3">
              {restoreMessage.includes('Successfully') ? (
                <CheckCircle className="w-6 h-6 text-green-600 flex-shrink-0 mt-0.5" />
              ) : (
                <AlertCircle className="w-6 h-6 text-red-600 flex-shrink-0 mt-0.5" />
              )}
              <div>
                <p className={`font-semibold ${restoreMessage.includes('Successfully') ? 'text-green-900' : 'text-red-900'}`}>
                  {restoreMessage.includes('Successfully') ? 'Restore Complete' : 'Restore Failed'}
                </p>
                <p className={`text-sm ${restoreMessage.includes('Successfully') ? 'text-green-700' : 'text-red-700'} mt-1`}>{restoreMessage}</p>
              </div>
            </div>
          </div>
        )}

        {/* Debug Mode Button */}
        {window.location.search.includes('debug=1') && (
          <div className="mb-6 flex gap-2">
            <button
              onClick={loadDiagnostics}
              className="inline-flex items-center gap-2 bg-purple-100 text-purple-700 px-4 py-2 rounded-lg font-medium hover:bg-purple-200 transition text-sm border border-purple-300"
            >
              <Bug className="w-4 h-4" />
              Show Diagnostics
            </button>
          </div>
        )}

        {/* Diagnostics Modal */}
        {showDiagnostics && diagnostics && (
          <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4 overflow-y-auto">
            <div className="bg-white rounded-lg max-w-lg w-full p-6 my-8">
              <div className="mb-6">
                <h2 className="text-xl font-bold text-gray-900">Agency Reviews Diagnostics</h2>
                <p className="text-sm text-gray-600 mt-1">Debug panel - admin only</p>
              </div>

              <div className="space-y-4 mb-6 bg-gray-50 p-4 rounded-lg border border-gray-200 text-sm">
                <div>
                  <p className="font-semibold text-gray-700 mb-1">Data Source</p>
                  <p className="text-xs text-gray-500 font-mono">Supabase: {diagnostics.supabaseHost}</p>
                  <p className="text-xs text-gray-500 font-mono">Project ref: {diagnostics.projectRef}...</p>
                  <p className="text-xs text-gray-500">Anon key: {diagnostics.anonKeyPresent ? 'present' : 'MISSING'}</p>
                </div>

                <div className="pt-3 border-t border-gray-200">
                  <p className="font-semibold text-gray-700 mb-1">Direct COUNT query</p>
                  {diagnostics.directCountError ? (
                    <p className="text-xs text-red-600 font-mono">Error: {diagnostics.directCountError}</p>
                  ) : (
                    <p className="text-xs text-gray-600">agency_reviews rows visible to client: <span className="font-bold">{diagnostics.directCount}</span></p>
                  )}
                </div>

                <div className="pt-3 border-t border-gray-200">
                  <p className="font-semibold text-gray-700">Client fetch: {agencies.length} loaded</p>
                  {diagnostics.fetchError && (
                    <p className="text-xs text-red-600 mt-1">Error: {diagnostics.fetchError}</p>
                  )}
                  <p className="text-xs text-gray-500 mt-1">Published: {agencies.filter(a => a.is_published).length} | Draft: {agencies.filter(a => !a.is_published).length}</p>
                </div>

                <div className="pt-3 border-t border-gray-200">
                  <p className="font-semibold text-gray-700 mb-2">Slug lookups</p>
                  <div className="space-y-2 text-xs">
                    <div className={`p-2 rounded ${diagnostics.hozioLookup?.found ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
                      <p className="font-semibold">hozio-new-york: {diagnostics.hozioLookup?.found ? 'FOUND' : 'NOT FOUND'}</p>
                      {diagnostics.hozioLookup?.found && (
                        <p className="text-gray-500 mt-0.5">id: {diagnostics.hozioLookup.id?.slice(0, 8)}... | published: {String(diagnostics.hozioLookup.is_published)} | updated: {diagnostics.hozioLookup.updated_at}</p>
                      )}
                    </div>
                    <div className={`p-2 rounded ${diagnostics.caltaLookup?.found ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
                      <p className="font-semibold">calta-marketing-new-york: {diagnostics.caltaLookup?.found ? 'FOUND' : 'NOT FOUND'}</p>
                      {diagnostics.caltaLookup?.found && (
                        <p className="text-gray-500 mt-0.5">id: {diagnostics.caltaLookup.id?.slice(0, 8)}... | published: {String(diagnostics.caltaLookup.is_published)} | updated: {diagnostics.caltaLookup.updated_at}</p>
                      )}
                    </div>
                  </div>
                </div>

                {diagnostics.unpublishedCount > 0 && (
                  <div className="pt-3 border-t border-gray-200">
                    <p className="font-semibold text-red-600 mb-2">Unpublished Reviews: {diagnostics.unpublishedCount}</p>
                    <div className="space-y-1 text-xs text-gray-600 max-h-32 overflow-y-auto">
                      {diagnostics.unpublishedReviews.map(r => (
                        <p key={r.id}>{r.agency_name} ({r.state_name})</p>
                      ))}
                    </div>
                  </div>
                )}
              </div>

              {diagnostics.unpublishedCount > 0 && (
                <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-6">
                  <p className="text-sm text-amber-900 font-semibold mb-2">Root Cause: Unpublished reviews</p>
                  <p className="text-sm text-amber-800">
                    {diagnostics.unpublishedCount} review(s) are marked as <strong>draft</strong>. Public pages will not render drafts. Use the restore button to publish them.
                  </p>
                </div>
              )}

              <div className="flex gap-3">
                <button
                  onClick={() => {
                    setShowDiagnostics(false);
                    setDiagnostics(null);
                  }}
                  className="flex-1 px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg font-medium transition"
                >
                  Close
                </button>
                {diagnostics.unpublishedCount > 0 && (
                  <button
                    onClick={handleRestoreReviews}
                    disabled={restoring}
                    className="flex-1 inline-flex items-center justify-center gap-2 px-4 py-2 bg-green-600 text-white hover:bg-green-700 disabled:bg-gray-400 rounded-lg font-medium transition"
                  >
                    <RefreshCw className={`w-4 h-4 ${restoring ? 'animate-spin' : ''}`} />
                    {restoring ? 'Restoring...' : 'Restore All Reviews'}
                  </button>
                )}
              </div>
            </div>
          </div>
        )}

        {/* Agencies Table */}
        {!loading && !error && (
          <>
            {/* Desktop Table */}
            <div className="hidden lg:block bg-white border border-gray-200 rounded-lg overflow-hidden">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Agency</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">State</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Review Type</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Uniqueness</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Ranking</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Updated</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {filteredAgencies.length === 0 ? (
                    <tr>
                      <td colSpan={8} className="px-6 py-12 text-center text-gray-500 text-sm">
                        No agencies found matching your filters
                      </td>
                    </tr>
                  ) : (
                    filteredAgencies.map((agency) => (
                      <tr key={agency.id} className="hover:bg-gray-50 transition-colors">
                        <td className="px-5 py-3.5">
                          <p className="font-semibold text-gray-900 text-sm">{agency.agency_name}</p>
                          <p className="text-xs text-gray-400 mt-0.5">{agency.agency_slug}</p>
                        </td>
                        <td className="px-5 py-3.5">
                          <p className="text-sm text-gray-700">{agency.state_name}</p>
                          {agency.city && <p className="text-xs text-gray-400">{agency.city}</p>}
                        </td>
                        <td className="px-5 py-3.5">
                          <ReviewTypeBadge type={agency.review_type} />
                        </td>
                        <td className="px-5 py-3.5">
                          <PublishedBadge published={agency.is_published} />
                        </td>
                        <td className="px-5 py-3.5">
                          <ScoreBadge score={agency.uniqueness_score} />
                        </td>
                        <td className="px-5 py-3.5">
                          {agency.is_top_25_ranked ? (
                            <span className="inline-flex items-center gap-1 bg-green-100 text-green-800 px-2 py-0.5 rounded text-xs font-medium">
                              <CheckCircle className="w-3 h-3" />
                              Top 25
                            </span>
                          ) : (
                            <span className="bg-gray-100 text-gray-500 px-2 py-0.5 rounded text-xs font-medium">
                              Not Ranked
                            </span>
                          )}
                        </td>
                        <td className="px-5 py-3.5 text-xs text-gray-500">
                          {new Date(agency.last_updated).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                        </td>
                        <td className="px-5 py-3.5">
                          <div className="flex items-center justify-end gap-1">
                            <Link
                              to={`/agency-reviews/${agency.agency_slug}`}
                              target="_blank"
                              className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                              title="View public page"
                            >
                              <Eye className="w-4 h-4" />
                            </Link>
                            <Link
                              to={`/wp-admin/agency-reviews/edit/${agency.id}`}
                              className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                              title="Edit"
                            >
                              <Edit2 className="w-4 h-4" />
                            </Link>
                            <button
                              onClick={() => handleDelete(agency.id, agency.agency_name)}
                              className={`p-1.5 rounded transition ${
                                deleteConfirm === agency.id
                                  ? 'bg-red-600 text-white'
                                  : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                              }`}
                              title={deleteConfirm === agency.id ? 'Click again to confirm delete' : 'Delete'}
                            >
                              <Trash2 className="w-4 h-4" />
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            {/* Mobile Cards */}
            <div className="lg:hidden space-y-3">
              {filteredAgencies.length === 0 ? (
                <div className="bg-white border border-gray-200 rounded-lg p-12 text-center text-gray-500">
                  No agencies found matching your filters
                </div>
              ) : (
                filteredAgencies.map((agency) => (
                  <div key={agency.id} className="bg-white border border-gray-200 rounded-lg p-5">
                    <div className="flex items-start justify-between mb-3">
                      <div className="flex-1 min-w-0 mr-3">
                        <h3 className="font-semibold text-gray-900 text-sm mb-0.5">{agency.agency_name}</h3>
                        <p className="text-xs text-gray-400">{agency.agency_slug}</p>
                        <p className="text-xs text-gray-600 mt-1">{agency.state_name}{agency.city && `, ${agency.city}`}</p>
                      </div>
                      <PublishedBadge published={agency.is_published} />
                    </div>

                    <div className="flex flex-wrap gap-1.5 mb-3">
                      <ReviewTypeBadge type={agency.review_type} />
                      <ScoreBadge score={agency.uniqueness_score} />
                      {agency.is_top_25_ranked ? (
                        <span className="inline-flex items-center gap-1 bg-green-100 text-green-800 px-2 py-0.5 rounded text-xs font-medium">
                          <CheckCircle className="w-3 h-3" />
                          Top 25
                        </span>
                      ) : (
                        <span className="bg-gray-100 text-gray-500 px-2 py-0.5 rounded text-xs font-medium">Not Ranked</span>
                      )}
                    </div>

                    <p className="text-xs text-gray-400 mb-3">
                      Updated: {new Date(agency.last_updated).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                    </p>

                    <div className="flex gap-2">
                      <Link
                        to={`/agency-reviews/${agency.agency_slug}`}
                        target="_blank"
                        className="flex-1 flex items-center justify-center gap-1.5 bg-gray-100 text-gray-700 px-3 py-2 rounded-lg text-xs font-medium hover:bg-gray-200 transition"
                      >
                        <Eye className="w-3.5 h-3.5" />
                        View
                      </Link>
                      <Link
                        to={`/wp-admin/agency-reviews/edit/${agency.id}`}
                        className="flex-1 flex items-center justify-center gap-1.5 bg-blue-50 text-blue-600 px-3 py-2 rounded-lg text-xs font-medium hover:bg-blue-100 transition"
                      >
                        <Edit2 className="w-3.5 h-3.5" />
                        Edit
                      </Link>
                      <button
                        onClick={() => handleDelete(agency.id, agency.agency_name)}
                        className={`px-3 py-2 rounded-lg text-xs font-medium transition ${
                          deleteConfirm === agency.id
                            ? 'bg-red-600 text-white'
                            : 'bg-red-50 text-red-600 hover:bg-red-100'
                        }`}
                      >
                        {deleteConfirm === agency.id ? 'Confirm?' : <Trash2 className="w-3.5 h-3.5" />}
                      </button>
                    </div>
                  </div>
                ))
              )}
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
