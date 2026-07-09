import { useState, useEffect, useCallback } from 'react';
import { Activity, AlertTriangle, CheckCircle2, RefreshCw, ShieldAlert, TrendingUp, XCircle, Clock, Database, Zap, Wrench } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { supabase } from '../lib/supabase';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { US_STATE_SLUGS_52, US_STATE_SLUG_TO_NAME } from '../lib/usStateSlugs';
import { formatStateName } from '../utils/formatLocation';

type SlotStatus = 'available' | 'locked' | 'reserved' | 'sold';

interface SlotStatusCount {
  state_slug: string;
  available: number;
  locked: number;
  reserved: number;
  sold: number;
  total: number;
}

interface AuditLogEntry {
  id: string;
  created_at: string;
  state_slug: string;
  rank: number;
  old_status: string | null;
  new_status: string;
  changed_by: string;
  reason: string | null;
  stripe_session_id: string | null;
}

interface SelfTestResult {
  stateSlug: string;
  stateName: string;
  dbAvailable: number;
  uiWouldShow: boolean;
  pass: boolean;
  detail: string;
}

interface HealthSummary {
  totalStates: number;
  statesWithZeroAvailable: number;
  statesWithMismatch: number;
  statesWithMissingRanks: number;
  totalAvailable: number;
  totalLocked: number;
  totalSold: number;
  totalReserved: number;
  fetchIncomplete: boolean;
  fetchedRows: number;
  expectedRows: number;
  pages: number;
}

interface PerStateRepairResult {
  state_slug: string;
  existingCount: number;
  inserted: number;
  finalCount: number;
}

interface RepairResponse {
  ok: boolean;
  statesProcessed: number;
  statesFixed: number;
  totalInserted: number;
  perState: PerStateRepairResult[];
  repairs: { state_slug: string; missingRanksInserted: number; rank1Fixed: boolean }[];
  failures: { state_slug: string; error: string }[];
  verification: { ok: boolean; badStates: { slug: string; count: number }[]; badCount: number };
}

const STATE_NAMES = US_STATE_SLUG_TO_NAME;

export default function WpAdminRevenueHealthPage() {
  const { isReady, isValid, status } = useAdminSession();
  const [slotCounts, setSlotCounts] = useState<SlotStatusCount[]>([]);
  const [auditLog, setAuditLog] = useState<AuditLogEntry[]>([]);
  const [summary, setSummary] = useState<HealthSummary | null>(null);
  const [loading, setLoading] = useState(true);
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [selfTestResults, setSelfTestResults] = useState<SelfTestResult[]>([]);
  const [selfTestRunning, setSelfTestRunning] = useState(false);
  const [selfTestDone, setSelfTestDone] = useState(false);
  const [filterZeroOnly, setFilterZeroOnly] = useState(false);
  const [repairRunning, setRepairRunning] = useState(false);
  const [repairResult, setRepairResult] = useState<string | null>(null);
  const [repairDetail, setRepairDetail] = useState<RepairResponse | null>(null);
  const [showRepairDetail, setShowRepairDetail] = useState(false);

  const loadData = useCallback(async () => {
    if (!isReady) return;
    if (!isValid) {
      setLoading(false);
      return;
    }

    setLoading(true);
    setApiError(null);
    try {
      const [healthRes, auditRes] = await Promise.all([
        adminApiFetch<{
          ok?: boolean;
          error?: string;
          fetch_incomplete?: boolean;
          states?: Array<{
            state_slug: string;
            available?: number;
            locked?: number;
            reserved?: number;
            sold?: number;
            total?: number;
          }>;
          summary?: {
            states_with_missing_ranks?: number;
            states_with_broken_rank1?: number;
          };
          debug?: {
            fetchedRows?: number;
            expectedTotalRows?: number;
            pages?: number;
          };
        }>('top25-revenue-health'),
        supabase.from('slot_status_audit_log').select('*').order('created_at', { ascending: false }).limit(20),
      ]);

      if (!healthRes.ok) {
        setApiError(healthRes.error ?? { code: 'unknown_error', message: 'Health check failed', retryable: true });
        setLoading(false);
        return;
      }

      const healthData = healthRes.data;
      if (!healthData || healthData.error) {
        setApiError({ code: 'server_error', message: healthData?.error ?? 'Invalid response', retryable: true });
        setLoading(false);
        return;
      }

      const fetchIncomplete = healthData.fetch_incomplete === true;

      const edgeStates: Record<string, typeof healthData.states extends Array<infer T> ? T : never> = {};
      for (const s of (healthData.states ?? [])) {
        edgeStates[s.state_slug] = s;
      }

      const counts: SlotStatusCount[] = US_STATE_SLUGS_52.map(slug => {
        const s = edgeStates[slug];
        if (!s) {
          return { state_slug: slug, available: 0, locked: 0, reserved: 0, sold: 0, total: 0 };
        }
        return {
          state_slug: slug,
          available: s.available ?? 0,
          locked: s.locked ?? 0,
          reserved: s.reserved ?? 0,
          sold: s.sold ?? 0,
          total: s.total ?? 0,
        };
      });

      setSlotCounts(counts);

      const zeroAvail = counts.filter(c => c.available === 0).length;
      const missingRanks = fetchIncomplete ? 0 : (healthData.summary?.states_with_missing_ranks ?? counts.filter(c => c.total !== 25).length);

      setSummary({
        totalStates: 52,
        statesWithZeroAvailable: zeroAvail,
        statesWithMismatch: healthData.summary?.states_with_broken_rank1 ?? 0,
        statesWithMissingRanks: missingRanks,
        totalAvailable: counts.reduce((s, c) => s + c.available, 0),
        totalLocked: counts.reduce((s, c) => s + c.locked, 0),
        totalSold: counts.reduce((s, c) => s + c.sold, 0),
        totalReserved: counts.reduce((s, c) => s + c.reserved, 0),
        fetchIncomplete,
        fetchedRows: healthData.debug?.fetchedRows ?? 0,
        expectedRows: healthData.debug?.expectedTotalRows ?? 1300,
        pages: healthData.debug?.pages ?? 0,
      });

      setAuditLog((auditRes.data ?? []) as AuditLogEntry[]);
    } catch (err: any) {
      setApiError({ code: 'unknown_error', message: err?.message ?? 'Failed to load data', retryable: true });
    } finally {
      setLoading(false);
    }
  }, [isReady, isValid]);

  useEffect(() => {
    loadData();
  }, [loadData]);

  const runSelfTest = async () => {
    if (!isValid) return;

    setSelfTestRunning(true);
    setSelfTestDone(false);
    setSelfTestResults([]);

    try {
      const res = await adminApiFetch<{ results?: any[] }>('top25-inventory-self-test');
      if (!res.ok || !res.data) {
        setSelfTestResults([{
          stateSlug: 'error',
          stateName: 'Error',
          dbAvailable: 0,
          uiWouldShow: false,
          pass: false,
          detail: `Self-test error: ${res.error?.message ?? 'Unknown error'}`,
        }]);
        return;
      }

      const results: SelfTestResult[] = (res.data.results ?? []).map((r: any) => ({
        stateSlug: r.state_slug,
        stateName: r.state_name ?? STATE_NAMES[r.state_slug] ?? r.state_slug,
        dbAvailable: r.available_slots_ranks_2_to_25 ?? 0,
        uiWouldShow: (r.available_slots_ranks_2_to_25 ?? 0) >= 1,
        pass: r.pass ?? false,
        detail: r.pass
          ? `${r.available_slots_ranks_2_to_25} available slot(s) | all 25 ranks present | rank 1 locked`
          : (r.failures ?? []).join('; ') || 'Validation failed',
      }));

      setSelfTestResults(results);
    } catch (err: any) {
      setSelfTestResults([{
        stateSlug: 'error',
        stateName: 'Error',
        dbAvailable: 0,
        uiWouldShow: false,
        pass: false,
        detail: `Self-test error: ${err?.message}`,
      }]);
    } finally {
      setSelfTestRunning(false);
      setSelfTestDone(true);
    }
  };

  const runRepair = async () => {
    if (!isValid) return;

    setRepairRunning(true);
    setRepairResult(null);
    setRepairDetail(null);
    setShowRepairDetail(false);
    try {
      const res = await adminApiFetch<RepairResponse>('top25-inventory-repair', { method: 'POST' });
      if (!res.ok || !res.data) {
        setRepairResult(`Repair failed: ${res.error?.message ?? 'Unknown error'}`);
        return;
      }

      const data = res.data;
      if (data.ok) {
        setRepairDetail(data);
        const rank1Fixes = (data.repairs ?? []).filter((r: any) => r.rank1Fixed).length;
        if (data.totalInserted > 0 || rank1Fixes > 0) {
          const parts: string[] = [];
          if (data.totalInserted > 0) parts.push(`inserted ${data.totalInserted} missing rank(s) across ${data.statesFixed} state(s)`);
          if (rank1Fixes > 0) parts.push(`fixed rank-1 invariant in ${rank1Fixes} state(s)`);
          const verifyMsg = data.verification.ok
            ? 'All 52 states now have exactly 25 ranks.'
            : `WARNING: ${data.verification.badCount} state(s) still broken after repair.`;
          setRepairResult(`Repair complete: ${parts.join('; ')}. ${verifyMsg}`);
        } else {
          setRepairResult('All states already have all 25 ranks — no repair needed.');
        }
        if (data.failures?.length > 0) {
          setRepairResult(prev => `${prev} Failures: ${data.failures.map((f: any) => f.state_slug).join(', ')}`);
        }
        await loadData();
      } else {
        setRepairResult(`Repair failed: ${(data as any).error || 'Unknown error'}`);
      }
    } catch (err: any) {
      setRepairResult(`Repair error: ${err.message}`);
    } finally {
      setRepairRunning(false);
    }
  };

  const filteredCounts = slotCounts.filter(c => {
    if (filterZeroOnly && c.available > 0) return false;
    return true;
  });

  const formatTime = (iso: string) => {
    const d = new Date(iso);
    return d.toLocaleString('en-US', { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' });
  };

  const statusColor: Record<string, string> = {
    available: 'text-emerald-700 bg-emerald-50 border-emerald-200',
    locked: 'text-amber-700 bg-amber-50 border-amber-200',
    reserved: 'text-blue-700 bg-blue-50 border-blue-200',
    sold: 'text-slate-700 bg-slate-50 border-slate-200',
  };

  if (!isReady) {
    return (
      <WpAdminLayout title="Revenue Health">
        <AdminLoadingState message="Initializing admin session..." />
      </WpAdminLayout>
    );
  }

  if (!isValid) {
    return (
      <WpAdminLayout title="Revenue Health">
        <AdminErrorBanner
          error={{ code: 'no_session', message: 'Please log in to access Revenue Health.', retryable: false }}
          context="Revenue Health"
        />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title="Revenue Health">
      <div className="space-y-6">

        {/* Header row */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-emerald-100 flex items-center justify-center">
              <Activity className="w-5 h-5 text-emerald-700" />
            </div>
            <div>
              <h1 className="text-xl font-bold text-gray-900">Revenue Health</h1>
              <p className="text-sm text-gray-500">Top-25 slot inventory, audit log, and system self-test</p>
            </div>
          </div>
          <button
            onClick={loadData}
            disabled={loading || !isValid}
            className="flex items-center gap-2 px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-sm font-medium transition-colors disabled:opacity-50"
          >
            <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
            Refresh
          </button>
        </div>

        {apiError && (
          <AdminErrorBanner
            error={apiError}
            context="Revenue Health"
            onRetry={apiError.retryable ? loadData : undefined}
          />
        )}

        {/* Fetch-incomplete guardrail — shown when pagination failed */}
        {summary?.fetchIncomplete && (
          <div className="flex items-start gap-3 p-4 bg-red-100 border-2 border-red-400 rounded-xl text-red-900">
            <AlertTriangle className="w-5 h-5 flex-shrink-0 mt-0.5 text-red-600" />
            <div className="flex-1 min-w-0">
              <p className="font-bold text-sm">Revenue Health fetch incomplete — data may be wrong</p>
              <p className="text-sm mt-1">
                Only fetched <strong>{summary.fetchedRows}</strong> of <strong>{summary.expectedRows}</strong> expected rows ({summary.pages} page{summary.pages !== 1 ? 's' : ''}).
                Inventory totals are unreliable. Missing-ranks count is suppressed to prevent false alerts.
              </p>
              <p className="text-xs text-red-700 mt-1 font-mono">Hint: {summary.fetchIncomplete ? 'Pagination or ordering issue in top25-revenue-health edge function.' : ''}</p>
            </div>
            <button
              onClick={loadData}
              disabled={loading}
              className="flex-shrink-0 flex items-center gap-2 px-3 py-2 bg-red-600 hover:bg-red-700 disabled:opacity-60 text-white rounded-lg text-sm font-semibold transition-colors"
            >
              <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
              Retry
            </button>
          </div>
        )}

        {/* Guardrail alert */}
        {summary && !summary.fetchIncomplete && (summary.statesWithZeroAvailable > 0 || summary.statesWithMissingRanks > 0) && (
          <div className="flex items-start gap-3 p-4 bg-red-50 border border-red-300 rounded-xl text-red-800">
            <AlertTriangle className="w-5 h-5 flex-shrink-0 mt-0.5 text-red-500" />
            <div className="flex-1 min-w-0">
              <p className="font-semibold text-sm">Revenue health issue detected</p>
              <ul className="mt-1 text-sm space-y-0.5 text-red-700">
                {summary.statesWithZeroAvailable > 0 && (
                  <li>{summary.statesWithZeroAvailable} state(s) have zero available slots — upsell is hidden for buyers in those states.</li>
                )}
                {summary.statesWithMissingRanks > 0 && (
                  <li>{summary.statesWithMissingRanks} state(s) have fewer than 25 ranks — use Repair Inventory to fix.</li>
                )}
              </ul>
            </div>
            <button
              onClick={runRepair}
              disabled={repairRunning}
              className="flex-shrink-0 flex items-center gap-2 px-4 py-2 bg-red-600 hover:bg-red-700 disabled:opacity-60 text-white rounded-lg text-sm font-semibold transition-colors"
            >
              {repairRunning ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Wrench className="w-4 h-4" />}
              {repairRunning ? 'Repairing...' : 'Repair Inventory'}
            </button>
          </div>
        )}

        {repairResult && !(repairResult === 'All states already have all 25 ranks — no repair needed.' && summary && (summary.statesWithMissingRanks > 0 || summary.fetchIncomplete)) && (
          <div className={`p-3 rounded-lg text-sm border ${repairResult.startsWith('Repair error') || repairResult.startsWith('Repair failed') ? 'bg-red-50 border-red-200 text-red-700' : 'bg-emerald-50 border-emerald-200 text-emerald-700'}`}>
            <div className="flex items-center justify-between gap-3">
              <span>{repairResult}</span>
              {repairDetail && (
                <button
                  onClick={() => setShowRepairDetail(v => !v)}
                  className="shrink-0 text-xs underline opacity-70 hover:opacity-100"
                >
                  {showRepairDetail ? 'Hide details' : 'Show details'}
                </button>
              )}
            </div>
            {showRepairDetail && repairDetail && (
              <div className="mt-3 border-t border-current/20 pt-3 space-y-1 max-h-64 overflow-y-auto">
                {repairDetail.perState.filter(s => s.inserted > 0).map(s => (
                  <div key={s.state_slug} className="flex justify-between text-xs">
                    <span>{STATE_NAMES[s.state_slug] ?? formatStateName(s.state_slug)}</span>
                    <span>+{s.inserted} inserted → {s.finalCount}/25</span>
                  </div>
                ))}
                {repairDetail.failures.length > 0 && (
                  <div className="mt-2 text-red-700">
                    Failures: {repairDetail.failures.map(f => `${f.state_slug}: ${f.error}`).join('; ')}
                  </div>
                )}
                {repairDetail.verification.badStates.length > 0 && (
                  <div className="mt-2 text-red-700 text-xs">
                    Still broken: {repairDetail.verification.badStates.map(b => `${b.slug}(${b.count})`).join(', ')}
                  </div>
                )}
                {repairDetail.totalInserted === 0 && (
                  <p className="text-xs opacity-70">No rows were inserted — all states already had all 25 ranks.</p>
                )}
              </div>
            )}
          </div>
        )}

        {/* Repair button when no issues */}
        {summary && !summary.fetchIncomplete && summary.statesWithZeroAvailable === 0 && summary.statesWithMissingRanks === 0 && (
          <div className="flex items-center justify-between p-4 bg-gray-50 border border-gray-200 rounded-xl">
            <div>
              <p className="text-sm font-medium text-gray-700">Inventory looks healthy</p>
              <p className="text-xs text-gray-500 mt-0.5">Run repair if you suspect missing ranks after a schema change</p>
            </div>
            <button
              onClick={runRepair}
              disabled={repairRunning}
              className="flex items-center gap-2 px-4 py-2 bg-gray-200 hover:bg-gray-300 disabled:opacity-60 text-gray-700 rounded-lg text-sm font-medium transition-colors"
            >
              {repairRunning ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Wrench className="w-4 h-4" />}
              {repairRunning ? 'Repairing...' : 'Repair Missing Ranks'}
            </button>
          </div>
        )}

        {/* Summary KPI cards */}
        {summary && (
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <KpiCard
              label="Available Slots"
              value={summary.totalAvailable}
              icon={<CheckCircle2 className="w-5 h-5 text-emerald-600" />}
              color="emerald"
              sub={`across ${summary.totalStates} states`}
            />
            <KpiCard
              label="Locked Slots"
              value={summary.totalLocked}
              icon={<ShieldAlert className="w-5 h-5 text-amber-600" />}
              color="amber"
              sub="admin-assigned, not for sale"
            />
            <KpiCard
              label="Sold Slots"
              value={summary.totalSold}
              icon={<TrendingUp className="w-5 h-5 text-slate-600" />}
              color="slate"
              sub="confirmed payment"
            />
            <KpiCard
              label="States — 0 Available"
              value={summary.statesWithZeroAvailable}
              icon={<AlertTriangle className="w-5 h-5 text-red-500" />}
              color={summary.statesWithZeroAvailable > 0 ? 'red' : 'gray'}
              sub="no upsell shown to buyers"
            />
          </div>
        )}
        {summary && !summary.fetchIncomplete && summary.statesWithMissingRanks > 0 && (
          <div className="flex items-center gap-2 text-sm text-red-700 bg-red-50 border border-red-200 rounded-lg px-4 py-2">
            <AlertTriangle className="w-4 h-4 shrink-0" />
            <span><strong>{summary.statesWithMissingRanks}</strong> state(s) have fewer than 25 slot rows in the database. Run Repair Inventory to fix.</span>
          </div>
        )}
        {summary && (
          <div className="text-xs text-gray-400 font-mono px-1">
            Fetched {summary.fetchedRows}/{summary.expectedRows} rows in {summary.pages} page{summary.pages !== 1 ? 's' : ''}
            {summary.fetchIncomplete ? ' — INCOMPLETE' : ' — complete'}
          </div>
        )}

        {/* Self-test section */}
        <div className="bg-white border border-gray-200 rounded-2xl p-6">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-3">
              <Zap className="w-5 h-5 text-blue-600" />
              <div>
                <h2 className="font-semibold text-gray-900">Self-Test</h2>
                <p className="text-xs text-gray-500">Picks 3 random states, queries inventory, confirms UI would behave correctly</p>
              </div>
            </div>
            <button
              onClick={runSelfTest}
              disabled={selfTestRunning}
              className="flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 disabled:opacity-60 text-white rounded-xl text-sm font-semibold transition-colors"
            >
              {selfTestRunning ? (
                <><RefreshCw className="w-4 h-4 animate-spin" /> Running...</>
              ) : (
                <><Zap className="w-4 h-4" /> Run Self-Test</>
              )}
            </button>
          </div>

          {selfTestDone && selfTestResults.length > 0 && (
            <div className="space-y-3 mt-2">
              {selfTestResults.map(r => (
                <div
                  key={r.stateSlug}
                  className={`flex items-start gap-3 p-4 rounded-xl border ${r.pass ? 'bg-emerald-50 border-emerald-200' : 'bg-red-50 border-red-200'}`}
                >
                  {r.pass ? (
                    <CheckCircle2 className="w-5 h-5 text-emerald-600 flex-shrink-0 mt-0.5" />
                  ) : (
                    <XCircle className="w-5 h-5 text-red-500 flex-shrink-0 mt-0.5" />
                  )}
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="font-semibold text-gray-900 text-sm">{r.stateName}</span>
                      <span className={`text-xs px-2 py-0.5 rounded-full border font-medium ${r.pass ? 'text-emerald-700 bg-emerald-100 border-emerald-200' : 'text-red-700 bg-red-100 border-red-200'}`}>
                        {r.pass ? 'PASS' : 'FAIL'}
                      </span>
                    </div>
                    <p className="text-sm text-gray-600 mt-0.5">{r.detail}</p>
                    <div className="flex gap-4 mt-1.5 text-xs text-gray-500">
                      <span>DB available slots: <strong>{r.dbAvailable}</strong></span>
                      <span>UI would show upsell: <strong>{r.uiWouldShow ? 'Yes' : 'No'}</strong></span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Slot inventory table */}
        <div className="bg-white border border-gray-200 rounded-2xl overflow-hidden">
          <div className="flex items-center justify-between p-5 border-b border-gray-100">
            <div className="flex items-center gap-3">
              <Database className="w-5 h-5 text-gray-500" />
              <h2 className="font-semibold text-gray-900">Slot Inventory by State</h2>
              {!loading && <span className="text-xs text-gray-400">{slotCounts.length} states</span>}
            </div>
            <div className="flex items-center gap-3">
              <label className="flex items-center gap-2 text-xs text-gray-600 cursor-pointer select-none">
                <input
                  type="checkbox"
                  checked={filterZeroOnly}
                  onChange={e => setFilterZeroOnly(e.target.checked)}
                  className="rounded"
                />
                Show only 0-available states
              </label>
            </div>
          </div>

          {loading ? (
            <div className="flex items-center justify-center py-16">
              <RefreshCw className="w-6 h-6 animate-spin text-gray-400" />
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 text-left">
                    <th className="px-5 py-3 font-medium text-gray-600 text-xs uppercase tracking-wide">State</th>
                    <th className="px-4 py-3 font-medium text-emerald-600 text-xs uppercase tracking-wide text-center">Available</th>
                    <th className="px-4 py-3 font-medium text-amber-600 text-xs uppercase tracking-wide text-center">Locked</th>
                    <th className="px-4 py-3 font-medium text-blue-600 text-xs uppercase tracking-wide text-center">Reserved</th>
                    <th className="px-4 py-3 font-medium text-slate-600 text-xs uppercase tracking-wide text-center">Sold</th>
                    <th className="px-4 py-3 font-medium text-gray-500 text-xs uppercase tracking-wide text-center">Total</th>
                    <th className="px-5 py-3 font-medium text-gray-500 text-xs uppercase tracking-wide">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {filteredCounts.map(c => (
                    <tr key={c.state_slug} className={`hover:bg-gray-50 transition-colors ${c.available === 0 ? 'bg-red-50/40' : ''}`}>
                      <td className="px-5 py-3 font-medium text-gray-900">
                        {STATE_NAMES[c.state_slug] ?? formatStateName(c.state_slug)}
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`font-bold ${c.available > 0 ? 'text-emerald-600' : 'text-gray-400'}`}>{c.available}</span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`font-medium ${c.locked > 0 ? 'text-amber-600' : 'text-gray-400'}`}>{c.locked}</span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`font-medium ${c.reserved > 0 ? 'text-blue-600' : 'text-gray-400'}`}>{c.reserved}</span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`font-medium ${c.sold > 0 ? 'text-slate-700' : 'text-gray-400'}`}>{c.sold}</span>
                      </td>
                      <td className="px-4 py-3 text-center text-gray-500">{c.total}</td>
                      <td className="px-5 py-3">
                        {c.available === 0 ? (
                          <span className="inline-flex items-center gap-1.5 text-xs px-2.5 py-1 rounded-full bg-red-100 text-red-700 border border-red-200 font-medium">
                            <AlertTriangle className="w-3 h-3" />
                            No upsell shown
                          </span>
                        ) : (
                          <span className="inline-flex items-center gap-1.5 text-xs px-2.5 py-1 rounded-full bg-emerald-100 text-emerald-700 border border-emerald-200 font-medium">
                            <CheckCircle2 className="w-3 h-3" />
                            Upsell active
                          </span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
              {filteredCounts.length === 0 && (
                <div className="py-10 text-center text-gray-400 text-sm">No states match the current filter.</div>
              )}
            </div>
          )}
        </div>

        {/* Audit log */}
        <div className="bg-white border border-gray-200 rounded-2xl overflow-hidden">
          <div className="flex items-center gap-3 p-5 border-b border-gray-100">
            <Clock className="w-5 h-5 text-gray-500" />
            <h2 className="font-semibold text-gray-900">Last 20 Inventory Decisions</h2>
            <span className="text-xs text-gray-400">from slot_status_audit_log</span>
          </div>

          {loading ? (
            <div className="flex items-center justify-center py-10">
              <RefreshCw className="w-5 h-5 animate-spin text-gray-400" />
            </div>
          ) : auditLog.length === 0 ? (
            <div className="py-10 text-center text-gray-400 text-sm">
              No audit log entries yet. Entries are created when slot statuses change via Stripe or admin actions.
            </div>
          ) : (
            <div className="divide-y divide-gray-50">
              {auditLog.map(entry => (
                <div key={entry.id} className="flex items-start gap-4 px-5 py-4 hover:bg-gray-50 transition-colors">
                  <div className="flex-shrink-0 mt-0.5">
                    <span className={`inline-flex items-center text-xs px-2 py-0.5 rounded-full border font-medium ${statusColor[entry.new_status] ?? 'text-gray-700 bg-gray-50 border-gray-200'}`}>
                      {entry.new_status}
                    </span>
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="font-semibold text-gray-900 text-sm">{STATE_NAMES[entry.state_slug] ?? entry.state_slug}</span>
                      <span className="text-gray-400 text-xs">Rank #{entry.rank}</span>
                      {entry.old_status && (
                        <span className="text-xs text-gray-500">
                          <span className={`inline-block px-1.5 py-0.5 rounded border text-xs ${statusColor[entry.old_status] ?? 'text-gray-600 bg-gray-50 border-gray-200'}`}>{entry.old_status}</span>
                          <span className="mx-1 text-gray-400">→</span>
                          <span className={`inline-block px-1.5 py-0.5 rounded border text-xs ${statusColor[entry.new_status] ?? 'text-gray-600 bg-gray-50 border-gray-200'}`}>{entry.new_status}</span>
                        </span>
                      )}
                    </div>
                    <div className="flex items-center gap-3 mt-1 text-xs text-gray-500 flex-wrap">
                      <span>by <strong className="text-gray-700">{entry.changed_by}</strong></span>
                      {entry.reason && <span className="text-gray-400">— {entry.reason}</span>}
                      {entry.stripe_session_id && (
                        <span className="font-mono text-blue-600 truncate max-w-[200px]">{entry.stripe_session_id}</span>
                      )}
                    </div>
                  </div>
                  <div className="text-xs text-gray-400 flex-shrink-0 whitespace-nowrap">
                    {formatTime(entry.created_at)}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

      </div>
    </WpAdminLayout>
  );
}

interface KpiCardProps {
  label: string;
  value: number;
  icon: React.ReactNode;
  color: 'emerald' | 'amber' | 'slate' | 'red' | 'gray';
  sub: string;
}

function KpiCard({ label, value, icon, color, sub }: KpiCardProps) {
  const bgMap = {
    emerald: 'bg-emerald-50 border-emerald-100',
    amber: 'bg-amber-50 border-amber-100',
    slate: 'bg-slate-50 border-slate-100',
    red: 'bg-red-50 border-red-100',
    gray: 'bg-gray-50 border-gray-100',
  };
  const valMap = {
    emerald: 'text-emerald-700',
    amber: 'text-amber-700',
    slate: 'text-slate-700',
    red: 'text-red-600',
    gray: 'text-gray-700',
  };

  return (
    <div className={`rounded-2xl border p-5 ${bgMap[color]}`}>
      <div className="flex items-center justify-between mb-3">
        <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">{label}</span>
        {icon}
      </div>
      <div className={`text-3xl font-bold ${valMap[color]}`}>{value}</div>
      <div className="text-xs text-gray-500 mt-1">{sub}</div>
    </div>
  );
}
