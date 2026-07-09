import { useState, useCallback } from 'react';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { formatStateName } from '../utils/formatLocation';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import {
  Search, AlertTriangle, CheckCircle, XCircle, ChevronDown, ChevronUp,
  GitMerge, Eye, Play, Shield, RefreshCw, Loader, Info, ExternalLink,
  ArrowRight, Lock, Unlock, Globe, Mail, Building2, Zap,
} from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────────

interface DuplicateCluster {
  priority: number;
  priority_label: string;
  identity_key: string;
  count: number;
  canonical_id: string;
  canonical_name: string;
  canonical_slug: string | null;
  canonical_state: string;
  canonical_website: string | null;
  canonical_domain: string | null;
  duplicate_ids: string[];
  duplicates: Array<{
    id: string;
    name: string;
    state_slug: string;
    website_url: string | null;
    phone: string | null;
    created_at: string;
    slug: string | null;
  }>;
}

interface DetectResult {
  total_agencies: number;
  total_duplicates_found: number;
  total_clusters: number;
  clusters: DuplicateCluster[];
  detection_summary: {
    priority_1_domain: number;
    priority_2_phone: number;
    priority_3_name_website: number;
    priority_4_name_phone: number;
    priority_5_name_state: number;
  };
}

interface EmailRow {
  email_id: string;
  email_normalized: string;
  email_domain: string | null;
  source_agency_id: string;
  source_agency_name: string;
  reason: string;
  validation_status: string | null;
  is_primary: boolean;
}

interface PreviewResult {
  ok: boolean;
  error?: string;
  canonical: {
    id: string;
    name: string;
    slug: string;
    state_slug: string;
    website_url: string | null;
    website_domain_normalized: string | null;
    your_agency_url: string;
  };
  duplicates: Array<{
    id: string;
    name: string;
    slug: string | null;
    state_slug: string;
    website_url: string | null;
    website_domain_normalized: string | null;
    is_active: boolean;
  }>;
  emails_will_move: EmailRow[];
  emails_wont_move: EmailRow[];
  emails_already_on_canonical: EmailRow[];
  detection_priority: number;
  summary: {
    emails_to_move: number;
    emails_flagged: number;
    emails_skipped: number;
    duplicates_to_deactivate: number;
  };
}

interface MergeResult {
  ok: boolean;
  error?: string;
  dry_run: boolean;
  canonical_agency_id: string;
  canonical_slug: string;
  your_agency_url: string;
  emails_moved?: number;
  emails_will_move?: number;
  emails_removed_duplicate?: number;
  emails_flagged_review?: number;
  emails_flagged_untouched?: number;
  emails_already_on_canonical?: number;
  duplicates_deactivated?: number;
  duplicates_to_deactivate?: number;
  preview?: PreviewResult;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

const PRIORITY_COLORS: Record<number, string> = {
  1: 'bg-green-100 text-green-800 border-green-200',
  2: 'bg-blue-100 text-blue-800 border-blue-200',
  3: 'bg-sky-100 text-sky-800 border-sky-200',
  4: 'bg-amber-100 text-amber-800 border-amber-200',
  5: 'bg-orange-100 text-orange-800 border-orange-200',
};

const PRIORITY_SIGNAL: Record<number, string> = {
  1: 'Strong — same website domain',
  2: 'Strong — same phone number',
  3: 'Strong — same name + domain',
  4: 'Moderate — same name + phone',
  5: 'Weak — same name in state',
};

function ReasonBadge({ reason }: { reason: string }) {
  const map: Record<string, { label: string; cls: string }> = {
    email_domain_matches_canonical:    { label: 'Domain match',       cls: 'bg-green-100 text-green-800' },
    both_agencies_share_domain:        { label: 'Shared domain',      cls: 'bg-green-100 text-green-800' },
    priority_1_domain_cluster:         { label: 'P1 cluster',         cls: 'bg-green-100 text-green-800' },
    domain_match_status_confirmed:     { label: 'Domain confirmed',   cls: 'bg-green-100 text-green-800' },
    already_on_canonical:              { label: 'Already on canonical', cls: 'bg-gray-100 text-gray-600' },
    identity_contaminated:             { label: 'Contaminated',       cls: 'bg-red-100 text-red-800' },
    generic_email_domain:              { label: 'Generic domain',     cls: 'bg-orange-100 text-orange-800' },
    no_email_domain:                   { label: 'No domain',          cls: 'bg-orange-100 text-orange-800' },
    canonical_has_no_domain:           { label: 'Canonical no domain',cls: 'bg-orange-100 text-orange-800' },
    ownership_unproven:                { label: 'Unproven',           cls: 'bg-red-100 text-red-800' },
  };
  const entry = map[reason] ?? { label: reason.replace(/_/g, ' '), cls: 'bg-gray-100 text-gray-600' };
  return (
    <span className={`inline-block px-2 py-0.5 rounded-full text-xs font-medium ${entry.cls}`}>
      {entry.label}
    </span>
  );
}

function EmailTable({
  rows,
  variant,
}: {
  rows: EmailRow[];
  variant: 'safe' | 'unsafe' | 'skip';
}) {
  const [expanded, setExpanded] = useState(false);
  if (rows.length === 0) return null;

  const headerCls =
    variant === 'safe'
      ? 'bg-green-50 border-green-200 text-green-800'
      : variant === 'skip'
      ? 'bg-gray-50 border-gray-200 text-gray-600'
      : 'bg-red-50 border-red-200 text-red-800';

  const label =
    variant === 'safe'
      ? `${rows.length} email${rows.length !== 1 ? 's' : ''} WILL move to canonical`
      : variant === 'skip'
      ? `${rows.length} email${rows.length !== 1 ? 's' : ''} already on canonical (will dedup)`
      : `${rows.length} email${rows.length !== 1 ? 's' : ''} WILL NOT move — flagged for review`;

  const Icon = variant === 'safe' ? CheckCircle : variant === 'skip' ? Info : AlertTriangle;

  return (
    <div className={`rounded-lg border overflow-hidden ${variant === 'safe' ? 'border-green-200' : variant === 'skip' ? 'border-gray-200' : 'border-red-200'}`}>
      <button
        onClick={() => setExpanded(!expanded)}
        className={`w-full flex items-center justify-between px-4 py-3 ${headerCls} border-b hover:opacity-90 transition-opacity`}
      >
        <div className="flex items-center gap-2">
          <Icon className="w-4 h-4 shrink-0" />
          <span className="text-sm font-semibold">{label}</span>
        </div>
        {expanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
      </button>
      {expanded && (
        <div className="overflow-x-auto">
          <table className="w-full text-xs">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-100 text-left">
                <th className="px-3 py-2 font-semibold text-gray-600">Email</th>
                <th className="px-3 py-2 font-semibold text-gray-600">Domain</th>
                <th className="px-3 py-2 font-semibold text-gray-600">Source Agency</th>
                <th className="px-3 py-2 font-semibold text-gray-600">Reason</th>
                <th className="px-3 py-2 font-semibold text-gray-600">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {rows.map((r) => (
                <tr key={r.email_id} className="hover:bg-gray-50">
                  <td className="px-3 py-2 font-mono text-gray-800 max-w-[200px]">
                    <span className="block truncate" title={r.email_normalized}>{r.email_normalized}</span>
                  </td>
                  <td className="px-3 py-2 text-gray-500">{r.email_domain ?? '—'}</td>
                  <td className="px-3 py-2 text-gray-700 max-w-[160px]">
                    <span className="block truncate" title={r.source_agency_name}>{r.source_agency_name}</span>
                  </td>
                  <td className="px-3 py-2"><ReasonBadge reason={r.reason} /></td>
                  <td className="px-3 py-2 text-gray-500">{r.validation_status ?? '—'}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}

// ─── Main Page ────────────────────────────────────────────────────────────────

export default function WpAdminAgencyDedupeRepairPage() {
  const { session } = useAdminSession();

  // Detect
  const [detecting, setDetecting]     = useState(false);
  const [detectResult, setDetectResult] = useState<DetectResult | null>(null);
  const [detectError, setDetectError]  = useState('');
  const [filterPriority, setFilterPriority] = useState<number | 'all'>('all');
  const [expandedClusters, setExpandedClusters] = useState<Set<string>>(new Set());

  // Selected cluster
  const [selectedCluster, setSelectedCluster] = useState<DuplicateCluster | null>(null);

  // Preview
  const [previewing, setPreviewing]   = useState(false);
  const [previewResult, setPreviewResult] = useState<PreviewResult | null>(null);
  const [previewError, setPreviewError]  = useState('');

  // Merge
  const [dryRun, setDryRun]           = useState(true);
  const [merging, setMerging]         = useState(false);
  const [mergeResult, setMergeResult] = useState<MergeResult | null>(null);
  const [mergeError, setMergeError]   = useState('');
  const [mergeConfirmed, setMergeConfirmed] = useState(false);

  const callEdgeFn = useCallback(async (body: object) => {
    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;
    const res = await fetch(`${supabaseUrl}/functions/v1/agency-safe-dedup`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${anonKey}`,
        'x-admin-token': session?.token ?? '',
        'x-admin-secret': session?.secret ?? '',
      },
      body: JSON.stringify(body),
    });
    if (!res.ok) {
      const txt = await res.text().catch(() => res.statusText);
      throw new Error(txt || `HTTP ${res.status}`);
    }
    return res.json();
  }, [session]);

  const handleDetect = useCallback(async () => {
    setDetecting(true);
    setDetectError('');
    setDetectResult(null);
    setSelectedCluster(null);
    setPreviewResult(null);
    setMergeResult(null);
    try {
      const data = await callEdgeFn({ action: 'detect' });
      setDetectResult(data);
    } catch (e) {
      setDetectError(String(e));
    } finally {
      setDetecting(false);
    }
  }, [callEdgeFn]);

  const handlePreview = useCallback(async (cluster: DuplicateCluster) => {
    setSelectedCluster(cluster);
    setPreviewResult(null);
    setPreviewError('');
    setMergeResult(null);
    setMergeConfirmed(false);
    setPreviewing(true);
    try {
      const data = await callEdgeFn({
        action: 'preview',
        canonical_id: cluster.canonical_id,
        duplicate_ids: cluster.duplicate_ids,
        detection_priority: cluster.priority,
      });
      setPreviewResult(data);
    } catch (e) {
      setPreviewError(String(e));
    } finally {
      setPreviewing(false);
    }
  }, [callEdgeFn]);

  const handleMerge = useCallback(async () => {
    if (!selectedCluster || !previewResult) return;
    setMerging(true);
    setMergeError('');
    setMergeResult(null);
    try {
      const data = await callEdgeFn({
        action: 'merge',
        canonical_id: selectedCluster.canonical_id,
        duplicate_ids: selectedCluster.duplicate_ids,
        detection_priority: selectedCluster.priority,
        dry_run: dryRun,
      });
      setMergeResult(data);
      if (!dryRun && data.ok) {
        // Refresh detect results after a live merge
        await handleDetect();
      }
    } catch (e) {
      setMergeError(String(e));
    } finally {
      setMerging(false);
    }
  }, [selectedCluster, previewResult, dryRun, callEdgeFn, handleDetect]);

  const toggleCluster = (key: string) => {
    setExpandedClusters(prev => {
      const next = new Set(prev);
      if (next.has(key)) next.delete(key);
      else next.add(key);
      return next;
    });
  };

  const visibleClusters = detectResult?.clusters.filter(
    c => filterPriority === 'all' || c.priority === filterPriority
  ) ?? [];

  return (
    <WpAdminLayout>
      <div className="max-w-5xl mx-auto px-4 py-8 space-y-8">

        {/* ── Header ─────────────────────────────────────────────────────── */}
        <div className="flex items-start gap-4">
          <div className="p-3 bg-blue-50 rounded-xl">
            <GitMerge className="w-6 h-6 text-blue-600" />
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Agency Dedup &amp; Repair</h1>
            <p className="text-sm text-gray-500 mt-1">
              Detect duplicate agency records, preview safe merges with strict email-ownership
              rules, and eliminate competing /your-agency URLs.
            </p>
          </div>
        </div>

        {/* ── Business rules callout ──────────────────────────────────────── */}
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
          {[
            { icon: Building2, color: 'text-blue-600', bg: 'bg-blue-50', label: 'One real agency = one canonical record = one /your-agency URL' },
            { icon: Mail,       color: 'text-green-600', bg: 'bg-green-50', label: 'Multiple emails per agency are allowed and fully preserved' },
            { icon: Lock,       color: 'text-amber-600', bg: 'bg-amber-50', label: 'Emails with uncertain ownership are NEVER moved — flagged for review' },
          ].map(({ icon: Icon, color, bg, label }, i) => (
            <div key={i} className="flex items-start gap-3 bg-white border border-gray-200 rounded-lg p-4">
              <div className={`p-2 rounded-lg ${bg} shrink-0`}>
                <Icon className={`w-4 h-4 ${color}`} />
              </div>
              <p className="text-xs text-gray-700 leading-relaxed">{label}</p>
            </div>
          ))}
        </div>

        {/* ── Step 1: Detect ──────────────────────────────────────────────── */}
        <section className="bg-white rounded-xl border border-gray-200 overflow-hidden">
          <div className="flex items-center justify-between px-6 py-4 border-b border-gray-100">
            <div className="flex items-center gap-3">
              <div className="w-7 h-7 rounded-full bg-blue-600 text-white text-sm font-bold flex items-center justify-center">1</div>
              <div>
                <h2 className="font-semibold text-gray-900">Detect Duplicate Clusters</h2>
                <p className="text-xs text-gray-500">Scans all active agencies using 5-tier signal matching</p>
              </div>
            </div>
            <button
              onClick={handleDetect}
              disabled={detecting}
              className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
            >
              {detecting ? (
                <><Loader className="w-4 h-4 animate-spin" />Scanning...</>
              ) : (
                <><Search className="w-4 h-4" />{detectResult ? 'Re-scan' : 'Scan for duplicates'}</>
              )}
            </button>
          </div>

          {detectError && (
            <div className="mx-6 mt-4 flex items-start gap-3 bg-red-50 border border-red-200 rounded-lg p-4">
              <AlertTriangle className="w-5 h-5 text-red-600 shrink-0" />
              <p className="text-sm text-red-700">{detectError}</p>
            </div>
          )}

          {!detectResult && !detecting && !detectError && (
            <div className="px-6 py-12 text-center text-gray-400">
              <Search className="w-10 h-10 mx-auto mb-3 opacity-30" />
              <p className="text-sm">Click "Scan for duplicates" to find duplicate agency clusters</p>
            </div>
          )}

          {detectResult && (
            <div className="p-6 space-y-5">
              {/* Summary row */}
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {[
                  { label: 'Total agencies', value: detectResult.total_agencies, color: 'text-gray-900' },
                  { label: 'Clusters found', value: detectResult.total_clusters, color: 'text-blue-700' },
                  { label: 'Duplicate records', value: detectResult.total_duplicates_found, color: detectResult.total_duplicates_found > 0 ? 'text-red-600' : 'text-green-600' },
                  { label: 'Domain conflicts (P1)', value: detectResult.detection_summary.priority_1_domain, color: detectResult.detection_summary.priority_1_domain > 0 ? 'text-red-600' : 'text-gray-400' },
                ].map(({ label, value, color }) => (
                  <div key={label} className="bg-gray-50 rounded-lg p-3 text-center">
                    <p className="text-xs text-gray-500 mb-1">{label}</p>
                    <p className={`text-2xl font-bold ${color}`}>{value}</p>
                  </div>
                ))}
              </div>

              {detectResult.total_clusters === 0 ? (
                <div className="flex items-center gap-3 bg-green-50 border border-green-200 rounded-lg px-4 py-3">
                  <CheckCircle className="w-5 h-5 text-green-600 shrink-0" />
                  <p className="text-sm font-medium text-green-800">No duplicate clusters detected. Agency identity is clean.</p>
                </div>
              ) : (
                <>
                  {/* Priority filter */}
                  <div className="flex items-center gap-2 flex-wrap">
                    <span className="text-xs text-gray-500 font-medium">Filter:</span>
                    {(['all', 1, 2, 3, 4, 5] as const).map(p => (
                      <button
                        key={p}
                        onClick={() => setFilterPriority(p)}
                        className={`px-3 py-1 rounded-full text-xs font-medium border transition-colors ${
                          filterPriority === p
                            ? 'bg-blue-600 text-white border-blue-600'
                            : 'bg-white text-gray-600 border-gray-300 hover:border-gray-400'
                        }`}
                      >
                        {p === 'all' ? `All (${detectResult.total_clusters})` : `P${p} ${p === 1 ? '· Domain' : p === 2 ? '· Phone' : p === 3 ? '· Name+web' : p === 4 ? '· Name+phone' : '· Name'}`}
                      </button>
                    ))}
                  </div>

                  {/* Cluster list */}
                  <div className="space-y-3">
                    {visibleClusters.map((cluster) => {
                      const isExpanded = expandedClusters.has(cluster.identity_key);
                      const isSelected = selectedCluster?.identity_key === cluster.identity_key;
                      return (
                        <div
                          key={cluster.identity_key}
                          className={`rounded-lg border transition-colors ${isSelected ? 'border-blue-400 ring-2 ring-blue-100' : 'border-gray-200 hover:border-gray-300'}`}
                        >
                          <div className="flex items-center justify-between px-4 py-3">
                            <div className="flex items-center gap-3 min-w-0">
                              <span className={`shrink-0 px-2 py-0.5 rounded-full text-xs font-bold border ${PRIORITY_COLORS[cluster.priority]}`}>
                                P{cluster.priority}
                              </span>
                              <div className="min-w-0">
                                <p className="font-medium text-gray-900 truncate">{cluster.canonical_name}</p>
                                <p className="text-xs text-gray-500">
                                  {cluster.count} records · {PRIORITY_SIGNAL[cluster.priority]}
                                  {cluster.canonical_domain && <span className="ml-2 font-mono">{cluster.canonical_domain}</span>}
                                </p>
                              </div>
                            </div>
                            <div className="flex items-center gap-2 shrink-0 ml-3">
                              <button
                                onClick={() => toggleCluster(cluster.identity_key)}
                                className="p-1.5 rounded text-gray-400 hover:text-gray-700 hover:bg-gray-100"
                              >
                                {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                              </button>
                              <button
                                onClick={() => handlePreview(cluster)}
                                disabled={previewing && isSelected}
                                className="flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-700 text-xs font-semibold rounded-lg hover:bg-blue-100 disabled:opacity-50 transition-colors border border-blue-200"
                              >
                                {previewing && isSelected ? (
                                  <Loader className="w-3.5 h-3.5 animate-spin" />
                                ) : (
                                  <Eye className="w-3.5 h-3.5" />
                                )}
                                Preview
                              </button>
                            </div>
                          </div>

                          {isExpanded && (
                            <div className="px-4 pb-4 border-t border-gray-100 pt-3 space-y-2">
                              <div className="flex items-center gap-2 text-xs text-gray-700">
                                <CheckCircle className="w-3.5 h-3.5 text-green-600 shrink-0" />
                                <span className="font-semibold">Canonical:</span>
                                <span>{cluster.canonical_name}</span>
                                <span className="text-gray-400">({cluster.canonical_state})</span>
                                {cluster.canonical_slug && (
                                  <a
                                    href={`/your-agency/${cluster.canonical_slug}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="text-blue-600 hover:underline flex items-center gap-0.5 ml-1"
                                  >
                                    /your-agency/{cluster.canonical_slug}
                                    <ExternalLink className="w-3 h-3" />
                                  </a>
                                )}
                              </div>
                              {cluster.duplicates.map(dup => (
                                <div key={dup.id} className="flex items-center gap-2 text-xs text-gray-600 pl-5">
                                  <XCircle className="w-3.5 h-3.5 text-red-500 shrink-0" />
                                  <span className="font-medium">{dup.name}</span>
                                  <span className="text-gray-400">({formatStateName(dup.state_slug)})</span>
                                  {dup.slug && (
                                    <a
                                      href={`/your-agency/${dup.slug}`}
                                      target="_blank"
                                      rel="noopener noreferrer"
                                      className="text-blue-600 hover:underline flex items-center gap-0.5"
                                    >
                                      /your-agency/{dup.slug}
                                      <ExternalLink className="w-3 h-3" />
                                    </a>
                                  )}
                                  {dup.website_url && <span className="text-gray-400 font-mono">{dup.website_url}</span>}
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      );
                    })}
                  </div>
                </>
              )}
            </div>
          )}
        </section>

        {/* ── Step 2: Preview ─────────────────────────────────────────────── */}
        {(selectedCluster || previewing) && (
          <section className="bg-white rounded-xl border border-gray-200 overflow-hidden">
            <div className="flex items-center gap-3 px-6 py-4 border-b border-gray-100">
              <div className="w-7 h-7 rounded-full bg-blue-600 text-white text-sm font-bold flex items-center justify-center">2</div>
              <div>
                <h2 className="font-semibold text-gray-900">
                  Preview: {selectedCluster?.canonical_name ?? '…'}
                </h2>
                <p className="text-xs text-gray-500">
                  See exactly what will happen before any data changes
                </p>
              </div>
            </div>

            {previewing && (
              <div className="px-6 py-10 flex items-center justify-center gap-3 text-gray-500">
                <Loader className="w-5 h-5 animate-spin" />
                <span className="text-sm">Running ownership classification…</span>
              </div>
            )}

            {previewError && (
              <div className="mx-6 my-4 flex items-start gap-3 bg-red-50 border border-red-200 rounded-lg p-4">
                <AlertTriangle className="w-5 h-5 text-red-600 shrink-0" />
                <p className="text-sm text-red-700">{previewError}</p>
              </div>
            )}

            {previewResult && !previewing && (
              <div className="p-6 space-y-5">

                {/* Agency cards */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  {/* Canonical */}
                  <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                    <div className="flex items-center gap-2 mb-3">
                      <CheckCircle className="w-4 h-4 text-green-600" />
                      <span className="text-sm font-bold text-green-800">Canonical — will keep</span>
                    </div>
                    <p className="font-semibold text-gray-900">{previewResult.canonical.name}</p>
                    <p className="text-xs text-gray-500 mt-0.5">{formatStateName(previewResult.canonical.state_slug)}</p>
                    {previewResult.canonical.website_url && (
                      <div className="flex items-center gap-1 text-xs text-gray-600 mt-1">
                        <Globe className="w-3 h-3" />
                        <span className="font-mono truncate">{previewResult.canonical.website_domain_normalized}</span>
                      </div>
                    )}
                    <a
                      href={previewResult.canonical.your_agency_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline mt-2"
                    >
                      {previewResult.canonical.your_agency_url}
                      <ExternalLink className="w-3 h-3" />
                    </a>
                  </div>

                  {/* Duplicates */}
                  <div className="space-y-2">
                    {previewResult.duplicates.map(dup => (
                      <div key={dup.id} className="bg-red-50 border border-red-200 rounded-lg p-3">
                        <div className="flex items-center gap-2 mb-1">
                          <XCircle className="w-3.5 h-3.5 text-red-600" />
                          <span className="text-xs font-bold text-red-800">Duplicate — will deactivate</span>
                        </div>
                        <p className="text-sm font-medium text-gray-900">{dup.name}</p>
                        <p className="text-xs text-gray-500">{formatStateName(dup.state_slug)}</p>
                        {dup.slug && (
                          <a
                            href={`/your-agency/${dup.slug}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline mt-1"
                          >
                            /your-agency/{dup.slug}
                            <ExternalLink className="w-3 h-3" />
                          </a>
                        )}
                      </div>
                    ))}
                  </div>
                </div>

                {/* Summary counts */}
                <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                  {[
                    { label: 'Emails to move', value: previewResult.summary.emails_to_move, color: 'text-green-600', bg: 'bg-green-50 border-green-100' },
                    { label: 'Flagged for review', value: previewResult.summary.emails_flagged, color: previewResult.summary.emails_flagged > 0 ? 'text-amber-600' : 'text-gray-300', bg: previewResult.summary.emails_flagged > 0 ? 'bg-amber-50 border-amber-100' : 'bg-gray-50 border-gray-100' },
                    { label: 'Already on canonical', value: previewResult.summary.emails_skipped, color: 'text-gray-500', bg: 'bg-gray-50 border-gray-100' },
                    { label: 'Duplicates to deactivate', value: previewResult.summary.duplicates_to_deactivate, color: 'text-red-600', bg: 'bg-red-50 border-red-100' },
                  ].map(({ label, value, color, bg }) => (
                    <div key={label} className={`rounded-lg p-3 border text-center ${bg}`}>
                      <p className="text-xs text-gray-500 mb-1">{label}</p>
                      <p className={`text-2xl font-bold ${color}`}>{value}</p>
                    </div>
                  ))}
                </div>

                {/* Email tables */}
                <div className="space-y-3">
                  <h3 className="text-sm font-semibold text-gray-800 flex items-center gap-2">
                    <Mail className="w-4 h-4 text-gray-500" />
                    Email Ownership Classification
                  </h3>
                  <EmailTable rows={previewResult.emails_will_move} variant="safe" />
                  <EmailTable rows={previewResult.emails_wont_move} variant="unsafe" />
                  <EmailTable rows={previewResult.emails_already_on_canonical} variant="skip" />
                  {previewResult.emails_will_move.length === 0 &&
                    previewResult.emails_wont_move.length === 0 &&
                    previewResult.emails_already_on_canonical.length === 0 && (
                    <p className="text-sm text-gray-500 text-center py-4">
                      No emails found on duplicate agencies for this cluster.
                    </p>
                  )}
                </div>

                {previewResult.summary.emails_flagged > 0 && (
                  <div className="flex items-start gap-3 bg-amber-50 border border-amber-200 rounded-lg p-4">
                    <AlertTriangle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="text-sm font-semibold text-amber-900">
                        {previewResult.summary.emails_flagged} email{previewResult.summary.emails_flagged !== 1 ? 's' : ''} will remain on the deactivated duplicate for manual review
                      </p>
                      <p className="text-xs text-amber-800 mt-1">
                        These emails cannot be proven to belong to the canonical agency. They are left intact
                        and will not be lost — you can inspect them via the email-cleaning export tool.
                      </p>
                    </div>
                  </div>
                )}
              </div>
            )}
          </section>
        )}

        {/* ── Step 3: Execute ─────────────────────────────────────────────── */}
        {previewResult && !previewing && (
          <section className="bg-white rounded-xl border border-gray-200 overflow-hidden">
            <div className="flex items-center gap-3 px-6 py-4 border-b border-gray-100">
              <div className="w-7 h-7 rounded-full bg-blue-600 text-white text-sm font-bold flex items-center justify-center">3</div>
              <div>
                <h2 className="font-semibold text-gray-900">Execute Merge</h2>
                <p className="text-xs text-gray-500">Run dry-run first, then confirm live merge</p>
              </div>
            </div>

            <div className="p-6 space-y-5">

              {/* Dry run toggle */}
              <div className="flex items-start gap-4 bg-gray-50 border border-gray-200 rounded-lg p-4">
                <button
                  onClick={() => { setDryRun(!dryRun); setMergeResult(null); setMergeConfirmed(false); }}
                  className={`relative flex-shrink-0 w-10 h-6 rounded-full transition-colors ${dryRun ? 'bg-amber-400' : 'bg-green-500'}`}
                >
                  <span className={`absolute top-1 w-4 h-4 bg-white rounded-full shadow transition-transform ${dryRun ? 'left-1' : 'left-5'}`} />
                </button>
                <div>
                  <p className="text-sm font-semibold text-gray-900 flex items-center gap-2">
                    {dryRun ? <><Lock className="w-4 h-4 text-amber-500" />Dry run — no data will change</> : <><Unlock className="w-4 h-4 text-green-600" />Live merge — data WILL change</>}
                  </p>
                  <p className="text-xs text-gray-500 mt-0.5">
                    {dryRun
                      ? 'Run dry-run first to validate the plan, then toggle to live.'
                      : 'Live mode is active. The merge will move emails, delete duplicates, and deactivate agency shells.'}
                  </p>
                </div>
              </div>

              {/* Confirmation checkbox for live mode */}
              {!dryRun && (
                <label className="flex items-start gap-3 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={mergeConfirmed}
                    onChange={(e) => setMergeConfirmed(e.target.checked)}
                    className="mt-0.5 w-4 h-4 rounded border-gray-300 text-red-600 focus:ring-red-500"
                  />
                  <span className="text-sm text-red-700 font-medium">
                    I have reviewed the preview above. I understand this will permanently deactivate{' '}
                    {previewResult.summary.duplicates_to_deactivate} duplicate agency record{previewResult.summary.duplicates_to_deactivate !== 1 ? 's' : ''}{' '}
                    and move {previewResult.summary.emails_to_move} email{previewResult.summary.emails_to_move !== 1 ? 's' : ''}.
                    This cannot be undone automatically.
                  </span>
                </label>
              )}

              <button
                onClick={handleMerge}
                disabled={merging || (!dryRun && !mergeConfirmed)}
                className={`w-full flex items-center justify-center gap-2 px-5 py-3 text-sm font-semibold rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed ${
                  dryRun
                    ? 'bg-amber-500 hover:bg-amber-600 text-white'
                    : 'bg-red-600 hover:bg-red-700 text-white'
                }`}
              >
                {merging ? (
                  <><Loader className="w-4 h-4 animate-spin" />{dryRun ? 'Running dry run…' : 'Merging…'}</>
                ) : dryRun ? (
                  <><Play className="w-4 h-4" />Run dry run</>
                ) : (
                  <><Zap className="w-4 h-4" />Execute live merge</>
                )}
              </button>

              {mergeError && (
                <div className="flex items-start gap-3 bg-red-50 border border-red-200 rounded-lg p-4">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0" />
                  <p className="text-sm text-red-700">{mergeError}</p>
                </div>
              )}

              {/* Merge result */}
              {mergeResult && (
                <div className={`rounded-lg border p-5 space-y-4 ${
                  mergeResult.dry_run
                    ? 'bg-amber-50 border-amber-200'
                    : mergeResult.ok
                    ? 'bg-green-50 border-green-200'
                    : 'bg-red-50 border-red-200'
                }`}>
                  <div className="flex items-center gap-3">
                    {mergeResult.dry_run ? (
                      <Eye className="w-5 h-5 text-amber-600" />
                    ) : mergeResult.ok ? (
                      <CheckCircle className="w-5 h-5 text-green-600" />
                    ) : (
                      <AlertTriangle className="w-5 h-5 text-red-600" />
                    )}
                    <span className={`font-semibold ${mergeResult.dry_run ? 'text-amber-900' : mergeResult.ok ? 'text-green-900' : 'text-red-900'}`}>
                      {mergeResult.dry_run
                        ? 'Dry run complete — no data was changed'
                        : mergeResult.ok
                        ? 'Live merge complete'
                        : `Merge failed: ${mergeResult.error}`}
                    </span>
                  </div>

                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                    {mergeResult.dry_run ? (
                      <>
                        <div className="bg-white rounded-lg p-3 border border-amber-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Would move</p>
                          <p className="text-xl font-bold text-green-600">{mergeResult.emails_will_move ?? 0}</p>
                          <p className="text-xs text-gray-400">emails</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-amber-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Would flag</p>
                          <p className="text-xl font-bold text-amber-600">{mergeResult.emails_flagged_review ?? 0}</p>
                          <p className="text-xs text-gray-400">for review</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-amber-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Already present</p>
                          <p className="text-xl font-bold text-gray-400">{mergeResult.emails_already_on_canonical ?? 0}</p>
                          <p className="text-xs text-gray-400">emails</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-amber-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Would deactivate</p>
                          <p className="text-xl font-bold text-red-600">{mergeResult.duplicates_to_deactivate ?? 0}</p>
                          <p className="text-xs text-gray-400">agencies</p>
                        </div>
                      </>
                    ) : (
                      <>
                        <div className="bg-white rounded-lg p-3 border border-green-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Emails moved</p>
                          <p className="text-xl font-bold text-green-600">{mergeResult.emails_moved ?? 0}</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-green-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Deduped</p>
                          <p className="text-xl font-bold text-gray-500">{mergeResult.emails_removed_duplicate ?? 0}</p>
                          <p className="text-xs text-gray-400">duplicate rows</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-amber-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Flagged untouched</p>
                          <p className="text-xl font-bold text-amber-600">{mergeResult.emails_flagged_untouched ?? 0}</p>
                          <p className="text-xs text-gray-400">need review</p>
                        </div>
                        <div className="bg-white rounded-lg p-3 border border-red-100 text-center">
                          <p className="text-xs text-gray-500 mb-1">Deactivated</p>
                          <p className="text-xl font-bold text-red-600">{mergeResult.duplicates_deactivated ?? 0}</p>
                          <p className="text-xs text-gray-400">agencies</p>
                        </div>
                      </>
                    )}
                  </div>

                  {mergeResult.ok && (
                    <div className="flex items-center gap-2 pt-1">
                      <ArrowRight className="w-4 h-4 text-gray-500" />
                      <span className="text-xs text-gray-600">Canonical /your-agency URL:</span>
                      <a
                        href={mergeResult.your_agency_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-xs font-mono text-blue-600 hover:underline flex items-center gap-1"
                      >
                        {mergeResult.your_agency_url}
                        <ExternalLink className="w-3 h-3" />
                      </a>
                    </div>
                  )}

                  {!mergeResult.dry_run && mergeResult.ok && (
                    <div className="flex items-start gap-3 bg-blue-50 border border-blue-200 rounded-lg p-3">
                      <Shield className="w-4 h-4 text-blue-600 shrink-0 mt-0.5" />
                      <p className="text-xs text-blue-800">
                        Run "Verify Imported Agency Mappings" in Email Cleaning to confirm the lookup is now
                        consistent for affected email addresses.
                      </p>
                    </div>
                  )}

                  {mergeResult.dry_run && (
                    <div className="flex items-center gap-2 bg-white border border-amber-200 rounded-lg px-4 py-3">
                      <Info className="w-4 h-4 text-amber-600 shrink-0" />
                      <p className="text-xs text-amber-800 font-medium">
                        Toggle to "Live merge" and confirm the checkbox above to execute.
                      </p>
                    </div>
                  )}
                </div>
              )}
            </div>
          </section>
        )}

        {/* ── Guards / Next steps ────────────────────────────────────────── */}
        <section className="bg-gray-50 border border-gray-200 rounded-xl p-6">
          <div className="flex items-center gap-2 mb-4">
            <Shield className="w-5 h-5 text-gray-600" />
            <h2 className="font-semibold text-gray-800">Active Guards</h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs text-gray-700">
            {[
              { ok: true, label: 'website_domain_normalized auto-computed on insert/update' },
              { ok: true, label: 'global_identity_key unique per active domain (prevents new domain duplicates)' },
              { ok: true, label: 'state-scoped agency_dedupe_key unique per state (prevents in-state duplicates)' },
              { ok: true, label: 'email_normalized unique per agency (no duplicate emails on same agency)' },
              { ok: true, label: 'Unsafe emails are never auto-moved — left for manual review' },
              { ok: true, label: 'Soft-delete only — no agency data is permanently destroyed' },
            ].map((g, i) => (
              <div key={i} className="flex items-start gap-2 bg-white border border-gray-200 rounded-lg px-3 py-2.5">
                <CheckCircle className="w-3.5 h-3.5 text-green-600 shrink-0 mt-0.5" />
                <span>{g.label}</span>
              </div>
            ))}
          </div>
        </section>

      </div>
    </WpAdminLayout>
  );
}
