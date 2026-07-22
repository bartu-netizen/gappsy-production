import { useState, useEffect, useCallback } from 'react';
import { Download, Upload, AlertTriangle, AlertCircle, CheckCircle, Loader, MailOpen, ChevronDown, ChevronUp, Zap, Info, Wrench, Globe, Database, Copy, ClipboardCheck, ShieldCheck, XCircle } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { formatStateName } from '../utils/formatLocation';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface ExportResult {
  rows: number;
  filename: string;
  timestamp: string;
}

interface ImportCleanedResult {
  ok: boolean;
  total_rows: number;
  rows_matched: number;
  rows_updated: number;
  rows_unmatched: number;
  rows_invalid: number;
  detected_format?: string;
  timing_ms?: number;
  match_method_stats?: {
    via_lineage: number;
    via_lineage_dedup_fan_out: number;
    via_email_id: number;
    via_agency_email: number;
    via_unique_email: number;
    ambiguous_skipped: number;
  };
  errors: Array<{ row: number; reason: string }>;
  flags_refresh?: {
    ok: boolean;
    shared_email_patterns?: number;
    rows_newly_flagged?: number;
    rows_cleared?: number;
    error?: string;
  };
}

interface RepairReport {
  state_slug: string;
  total_valid_emails: number;
  emails_on_active_agencies: number;
  emails_on_inactive_agencies: number;
  emails_relinked: number;
  emails_ambiguous: number;
  emails_no_match: number;
  bucket_agencies_found: string[];
  relink_details: Array<{
    email: string;
    from_agency: string;
    to_agency: string;
    match_method: string;
  }>;
  dry_run: boolean;
}

interface OrphanRepairStats {
  state_slug: string;
  dry_run: boolean;
  total_valid_orphans: number;
  generic_domain_skipped: number;
  franchise_domain_skipped: number;
  business_domain_repairable: number;
  agencies_created: number;
  emails_relinked: number;
  emails_failed: number;
  repair_details: Array<{
    email_domain: string;
    email_count: number;
    agency_name: string;
    agency_slug: string;
    agency_id: string;
    action: "created" | "existing" | "skipped";
  }>;
  unrepaired_emails: Array<{
    email: string;
    reason: string;
  }>;
}

interface SystemHealth {
  timestamp: string;
  state_slug: string;
  email_inventory: {
    total_emails: number;
    by_validation_status: Record<string, number>;
    valid_on_active_agencies: number;
    valid_on_inactive_agencies: number;
    orphan_rate_percent: number;
  };
  agency_inventory: {
    total_agencies: number;
    active_agencies: number;
    inactive_agencies: number;
    agencies_with_valid_emails: number;
    active_agencies_with_valid_emails: number;
  };
  lineage_system: {
    total_export_jobs: number;
    total_lineage_rows: number;
    jobs_with_imports: number;
    lineage_match_rate_percent: number;
  };
  smartlead_readiness: {
    sendable_emails_active_only: number;
    sendable_emails_with_inactive: number;
    emails_with_your_agency_slug: number;
    emails_missing_slug: number;
  };
  repair_status: {
    business_domain_orphans: number;
    generic_domain_orphans: number;
    repaired_in_last_24h: number;
  };
  recommendations: string[];
}

interface StateDiagnostics {
  state_slug: string;
  total_emails: number;
  on_active_agencies: number;
  on_inactive_agencies: number;
  by_status_active: Record<string, number>;
  by_status_inactive: Record<string, number>;
  active_agencies_count: number;
  inactive_agencies_count: number;
}

interface ExportMeta {
  state: string;
  validation_status_filter: string;
  active_agencies_only: boolean;
  total_rows: number;
  duplicates_included: boolean;
}

interface FailureSample {
  email_id: string;
  email_normalized: string;
  validation_status_before: string;
  verification_attempt_count: number;
  failure_stage: "submit_batch" | "poll_batch" | "download_results" | "parse_results" | "db_update" | "other";
  error_message: string;
  external_status?: string;
  batch_id?: string;
}

interface QueueProcessResult {
  ok: boolean;
  total_selected?: number;
  processed: number;
  verified_valid: number;
  verified_invalid: number;
  verified_retry: number;
  scheduled_for_retry: number;
  verified_failed: number;
  failed: number;
  result_mismatch_count?: number;
  errors: string[];
  failure_samples?: FailureSample[];
  paused?: boolean;
  pause_reason?: string | null;
}

interface VerifyMismatchRow {
  email: string;
  imported_agency_id: string;
  imported_agency_name: string;
  imported_agency_slug: string | null;
  imported_state_slug: string;
  imported_your_agency_url: string;
  lookup_agency_id: string | null;
  lookup_agency_name: string | null;
  lookup_agency_slug: string | null;
  lookup_your_agency_url: string | null;
  conflict_type: 'agency_id_mismatch' | 'url_mismatch' | 'lookup_not_found' | 'expected_placeholder_conflict' | 'dangerous_real_conflict';
  is_placeholder_email?: boolean;
  is_shared_conflict?: boolean;
}

interface VerifyMappingResult {
  ok: boolean;
  sample_checked: number;
  exact_agreement_count: number;
  mismatch_count: number;
  duplicate_conflict_count: number;
  expected_placeholder_conflict_count: number;
  dangerous_real_conflict_count: number;
  no_data_count: number;
  timing_ms: number;
  export_job_id: string | null;
  state_slug: string | null;
  mismatches: VerifyMismatchRow[];
  message?: string;
}

interface CreditsStatusResult {
  ok: boolean;
  credits: number;
  status: 'ok' | 'warning' | 'critical' | 'error';
  threshold_warning: number;
  threshold_critical: number;
  queue_auto_paused: boolean;
  queue_pause_reason: string | null;
  manual_pause: boolean;
  last_checked_at: string | null;
  last_alert_sent_at: string | null;
  last_alert_type_sent: string | null;
  error: string | null;
}

const states = [
  'alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut',
  'delaware', 'district-of-columbia', 'florida', 'georgia', 'hawaii', 'idaho',
  'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine',
  'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri',
  'montana', 'nebraska', 'nevada', 'new-hampshire', 'new-jersey', 'new-mexico',
  'new-york', 'north-carolina', 'north-dakota', 'ohio', 'oklahoma', 'oregon',
  'pennsylvania', 'puerto-rico', 'rhode-island', 'south-carolina', 'south-dakota',
  'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington',
  'west-virginia', 'wisconsin', 'wyoming'
];

export default function AdminEmailCleaningExportPage() {
  const { token, status } = useAdminSession();
  const [authChecked, setAuthChecked] = useState(false);
  const [activeTab, setActiveTab] = useState<'export' | 'import'>('export');

  // Export state
  const [exportState, setExportState] = useState('');
  const [exportStatus, setExportStatus] = useState<'pending' | 'valid' | 'invalid' | 'all'>('pending');
  const [exporting, setExporting] = useState(false);
  const [exportError, setExportError] = useState('');
  const [exportResult, setExportResult] = useState<ExportResult | null>(null);

  // ListClean CSV export state
  const [listcleanExporting, setListcleanExporting] = useState(false);
  const [listcleanError, setListcleanError] = useState('');
  const [listcleanStatus, setListcleanStatus] = useState<'all' | 'pending' | 'valid' | 'invalid'>('pending');
  const [listcleanResult, setListcleanResult] = useState<{
    rows: number;
    filename: string;
    export_job_id: string;
    stats: {
      state: string;
      validation_status_filter: string;
      active_agencies_only: boolean;
      raw_rows_fetched: number;
      unique_emails_exported: number;
      duplicate_rows_skipped: number;
      duplicates_excluded: boolean;
      export_job_id: string;
    };
  } | null>(null);

  // State diagnostics
  const [stateDiagnostics, setStateDiagnostics] = useState<StateDiagnostics | null>(null);
  const [diagLoading, setDiagLoading] = useState(false);

  // Export meta (from header after download)
  const [exportMeta, setExportMeta] = useState<ExportMeta | null>(null);

  // Repair state
  const [repairing, setRepairing] = useState(false);
  const [repairDryRun, setRepairDryRun] = useState(true);
  const [repairError, setRepairError] = useState('');
  const [repairResult, setRepairResult] = useState<RepairReport | null>(null);

  // Orphan repair state
  const [orphanRepairing, setOrphanRepairing] = useState(false);
  const [orphanRepairDryRun, setOrphanRepairDryRun] = useState(true);
  const [orphanRepairError, setOrphanRepairError] = useState('');
  const [orphanRepairResult, setOrphanRepairResult] = useState<OrphanRepairStats | null>(null);

  // System health state
  const [systemHealth, setSystemHealth] = useState<SystemHealth | null>(null);
  const [healthLoading, setHealthLoading] = useState(false);
  const [healthError, setHealthError] = useState('');

  // Import state
  const [importFile, setImportFile] = useState<File | null>(null);
  const [importProvider, setImportProvider] = useState('ListClean');
  const [importExportJobId, setImportExportJobId] = useState(() => {
    try { return localStorage.getItem('listclean_last_export_job_id') || ''; } catch { return ''; }
  });
  const [importing, setImporting] = useState(false);
  const [importError, setImportError] = useState('');
  const [importResult, setImportResult] = useState<ImportCleanedResult | null>(null);

  // Verification state
  const [verifying, setVerifying] = useState(false);
  const [verifyError, setVerifyError] = useState('');
  const [verifyResult, setVerifyResult] = useState<VerifyMappingResult | null>(null);
  const [verifySampleSize, setVerifySampleSize] = useState(50);
  const [showVerifyMismatches, setShowVerifyMismatches] = useState(false);

  // Copy state for Export Job ID
  const [copiedJobId, setCopiedJobId] = useState(false);

  // Queue processing state
  const [processingQueue, setProcessingQueue] = useState(false);
  const [queueError, setQueueError] = useState('');
  const [queueResult, setQueueResult] = useState<QueueProcessResult | null>(null);
  const [expandFailures, setExpandFailures] = useState(false);

  // Credits state
  const [creditsStatus, setCreditsStatus] = useState<CreditsStatusResult | null>(null);
  const [creditsLoading, setCreditsLoading] = useState(false);
  const [creditsError, setCreditsError] = useState('');
  const [showCreditsWarning, setShowCreditsWarning] = useState(false);
  const [forceRunOverride, setForceRunOverride] = useState(false);

  // Queue health state
  const [queueHealth, setQueueHealth] = useState<{
    last_run?: {
      started_at: string;
      status: string;
      selected: number;
      processed: number;
      valid: number;
      invalid: number;
      retry: number;
      failed: number;
      mismatch: number;
      triggered_by: string;
    };
    last_24h?: {
      total_runs: number;
      total_processed: number;
      total_valid: number;
      total_invalid: number;
      total_failed: number;
      total_mismatch: number;
    };
    queue_depth?: {
      pending: number;
      retry_due: number;
    };
  } | null>(null);

  const fetchStateDiagnostics = useCallback(async (stateSlug: string) => {
    if (!stateSlug) {
      setStateDiagnostics(null);
      return;
    }
    setDiagLoading(true);
    try {
      const response = await fetch(
        `${SUPABASE_URL}/rest/v1/rpc/get_state_email_diagnostics`,
        {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'apikey': SUPABASE_ANON_KEY,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ p_state_slug: stateSlug }),
        }
      );
      if (response.ok) {
        const data = await response.json();
        setStateDiagnostics(data);
      }
    } catch {
      // Non-critical
    } finally {
      setDiagLoading(false);
    }
  }, []);

  useEffect(() => {
    if (status !== 'loading') {
      setAuthChecked(true);
      if (status === 'valid') {
        refreshCredits();
        refreshQueueHealth();
      }
    }
  }, [status]);

  useEffect(() => {
    if (exportState && status === 'valid') {
      fetchStateDiagnostics(exportState);
      setListcleanResult(null);
      setExportResult(null);
      setExportMeta(null);
    }
  }, [exportState, status, fetchStateDiagnostics]);

  const refreshQueueHealth = async () => {
    if (!token) return;
    try {
      const response = await fetch(
        `${SUPABASE_URL}/rest/v1/rpc/get_queue_health_summary`,
        {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'apikey': SUPABASE_ANON_KEY,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({}),
        }
      );
      if (response.ok) {
        const data = await response.json();
        setQueueHealth(data);
      }
    } catch {
      // Silently fail - queue health is optional
    }
  };

  // Refresh credits status
  const refreshCredits = async () => {
    if (!token) return;

    setCreditsLoading(true);
    setCreditsError('');

    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-credits-status`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to fetch credits');
      }

      const result: CreditsStatusResult = await response.json();
      setCreditsStatus(result);
      setShowCreditsWarning(false);
    } catch (err) {
      setCreditsError(err instanceof Error ? err.message : 'Failed to fetch credits');
    } finally {
      setCreditsLoading(false);
    }
  };

  // Export emails for cleaning
  const handleExport = async () => {
    if (!exportState) {
      setExportError('Please select a state');
      return;
    }

    if (!token) {
      setExportError('Authentication required - please login first');
      return;
    }

    setExporting(true);
    setExportError('');
    setExportResult(null);

    try {
      const params = new URLSearchParams({
        state: exportState,
        validation_status: exportStatus,
        format: 'csv',
      });

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-export-for-cleaning?${params}`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || errorData.message || 'Export failed');
      }

      const metaHeader = response.headers.get('X-Export-Meta');
      const csv = await response.text();
      const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
      const downloadUrl = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = downloadUrl;
      a.download = `agencies-emails-${exportState}-${exportStatus}-${new Date().toISOString().split('T')[0]}.csv`;
      document.body.appendChild(a);
      a.click();
      a.remove();

      setTimeout(() => {
        window.URL.revokeObjectURL(downloadUrl);
      }, 5000);

      const lines = csv.split('\n').length - 1;
      setExportResult({
        rows: lines,
        filename: a.download,
        timestamp: new Date().toISOString(),
      });

      if (metaHeader) {
        try { setExportMeta(JSON.parse(metaHeader)); } catch { /* ignore */ }
      }
    } catch (err) {
      setExportError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setExporting(false);
    }
  };

  // Export clean ListClean CSV
  const handleListcleanExport = async () => {
    if (!exportState) {
      setListcleanError('Please select a state');
      return;
    }

    if (!token) {
      setListcleanError('Authentication required - please login first');
      return;
    }

    setListcleanExporting(true);
    setListcleanError('');
    setListcleanResult(null);

    try {
      const params = new URLSearchParams({
        state: exportState,
        validation_status: listcleanStatus,
      });

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-export-listclean-csv?${params}`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || errorData.message || 'Export failed');
      }

      const csv = await response.text();
      const statsHeader = response.headers.get('X-Export-Stats');
      const exportJobId = response.headers.get('X-Export-Job-Id') || '';
      const stats = statsHeader ? JSON.parse(statsHeader) : null;

      const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      const dateStr = new Date().toISOString().split('T')[0];
      a.download = exportJobId
        ? `listclean-export-${exportState}-${exportJobId.slice(0, 8)}.csv`
        : `listclean-export-${exportState}-${dateStr}.csv`;
      document.body.appendChild(a);
      a.click();
      a.remove();

      setTimeout(() => {
        window.URL.revokeObjectURL(url);
      }, 5000);

      const lines = csv.split('\n').length - 1;
      setListcleanResult({
        rows: lines,
        filename: a.download,
        export_job_id: exportJobId,
        stats: stats || {
          state: exportState,
          validation_status_filter: listcleanStatus,
          active_agencies_only: true,
          raw_rows_fetched: lines,
          unique_emails_exported: lines,
          duplicate_rows_skipped: 0,
          duplicates_excluded: true,
          export_job_id: exportJobId,
        },
      });

      if (exportJobId) {
        setImportExportJobId(exportJobId);
        try { localStorage.setItem('listclean_last_export_job_id', exportJobId); } catch { /* ignore */ }
      }
    } catch (err) {
      setListcleanError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setListcleanExporting(false);
    }
  };

  // Import cleaned results
  const handleImportClicked = async () => {
    if (!importFile) {
      setImportError('Please select a file');
      return;
    }

    if (!token) {
      setImportError('Authentication required - please login first');
      return;
    }

    setImporting(true);
    setImportError('');
    setImportResult(null);

    const startTs = Date.now();

    try {
      const fileContent = await importFile.text();

      const payload: Record<string, string> = {
        filename: importFile.name,
        mode: importFile.name.endsWith('.json') ? 'json' : 'csv',
        data: fileContent,
        provider: importProvider || 'ListClean',
      };

      if (importExportJobId.trim()) {
        payload.export_job_id = importExportJobId.trim();
      }

      let response: Response;
      try {
        response = await fetch(
          `${SUPABASE_URL}/functions/v1/other-agencies-import-cleaned-results`,
          {
            method: 'POST',
            headers: {
              'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
              'x-admin-token': token,
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(payload),
          }
        );
      } catch (networkErr) {
        const elapsed = Date.now() - startTs;
        const msg = networkErr instanceof Error ? networkErr.message : String(networkErr);
        if (msg.includes('Failed to fetch') || msg.includes('NetworkError') || msg.includes('fetch')) {
          if (elapsed > 25000) {
            throw new Error(
              `Gateway timeout after ${Math.round(elapsed / 1000)}s — the edge function was cut off before it could respond. ` +
              `This is a network/gateway limit, not a bug. The new bulk import should complete in <5s — try again.`
            );
          }
          throw new Error(
            `Network error after ${Math.round(elapsed / 1000)}s: ${msg}. ` +
            `Check your connection and try again. If this recurs, the Supabase edge function endpoint may be unreachable.`
          );
        }
        throw new Error(`Fetch error after ${Math.round(elapsed / 1000)}s: ${msg}`);
      }

      const elapsed = Date.now() - startTs;

      if (response.status === 502 || response.status === 504) {
        throw new Error(
          `Gateway ${response.status} after ${Math.round(elapsed / 1000)}s — upstream cut the connection. ` +
          `This was the root cause of previous failures. The new bulk import should complete in <5s — try again.`
        );
      }

      let result: ImportCleanedResult & { error?: string; timing_ms?: number };
      try {
        result = await response.json();
      } catch {
        throw new Error(
          `Invalid JSON in response (HTTP ${response.status}) after ${Math.round(elapsed / 1000)}s. ` +
          `The edge function may have been cut off mid-response by the gateway.`
        );
      }

      if (!response.ok) {
        const backendMs = result.timing_ms ? ` (backend ran ${result.timing_ms}ms before error)` : '';
        throw new Error((result.error || result.message || 'Import failed') + backendMs);
      }

      setImportResult(result);
      setImportFile(null);
    } catch (err) {
      setImportError(err instanceof Error ? err.message : 'Import failed');
    } finally {
      setImporting(false);
    }
  };

  // Process verification queue
  const handleProcessQueue = async (useForceRun: boolean = false) => {
    if (!token) {
      setQueueError('Authentication required');
      return;
    }

    // Check credits status first
    if (!useForceRun && creditsStatus && creditsStatus.status === 'critical') {
      setShowCreditsWarning(true);
      return;
    }

    setProcessingQueue(true);
    setQueueError('');
    setQueueResult(null);
    setShowCreditsWarning(false);

    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-listclean-process-queue`,
        {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ force_run: useForceRun && creditsStatus?.queue_auto_paused }),
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Queue processing failed');
      }

      const result: QueueProcessResult = await response.json();
      setQueueResult(result);
      if (result.paused) {
        setShowCreditsWarning(true);
      }
    } catch (err) {
      setQueueError(err instanceof Error ? err.message : 'Queue processing failed');
    } finally {
      setProcessingQueue(false);
      setForceRunOverride(false);
    }
  };

  const handleRepairLinkage = async () => {
    if (!exportState) {
      setRepairError('Please select a state first');
      return;
    }

    if (!token) {
      setRepairError('Authentication required');
      return;
    }

    setRepairing(true);
    setRepairError('');
    setRepairResult(null);

    try {
      const params = new URLSearchParams({
        state: exportState,
        dry_run: repairDryRun ? 'true' : 'false',
      });

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-repair-nj-linkage?${params}`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Repair failed');
      }

      const result: RepairReport = await response.json();
      setRepairResult(result);
    } catch (err) {
      setRepairError(err instanceof Error ? err.message : 'Repair failed');
    } finally {
      setRepairing(false);
    }
  };

  const handleOrphanRepair = async () => {
    if (!exportState) {
      setOrphanRepairError('Please select a state first');
      return;
    }

    if (!token) {
      setOrphanRepairError('Authentication required');
      return;
    }

    setOrphanRepairing(true);
    setOrphanRepairError('');
    setOrphanRepairResult(null);

    try {
      const params = new URLSearchParams({
        state: exportState,
        dry_run: orphanRepairDryRun ? 'true' : 'false',
      });

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-repair-orphaned-emails?${params}`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Orphan repair failed');
      }

      const result: OrphanRepairStats = await response.json();
      setOrphanRepairResult(result);
    } catch (err) {
      setOrphanRepairError(err instanceof Error ? err.message : 'Orphan repair failed');
    } finally {
      setOrphanRepairing(false);
    }
  };

  const refreshSystemHealth = async () => {
    if (!token || !exportState) return;

    setHealthLoading(true);
    setHealthError('');

    try {
      const params = new URLSearchParams({ state: exportState });
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-system-health?${params}`,
        {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to fetch health');
      }

      const result: SystemHealth = await response.json();
      setSystemHealth(result);
    } catch (err) {
      setHealthError(err instanceof Error ? err.message : 'Failed to fetch health');
    } finally {
      setHealthLoading(false);
    }
  };

  const handleVerifyMappings = async () => {
    if (!token) {
      setVerifyError('Authentication required');
      return;
    }

    setVerifying(true);
    setVerifyError('');
    setVerifyResult(null);
    setShowVerifyMismatches(false);

    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-verify-import-mappings`,
        {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            export_job_id: importExportJobId || undefined,
            state_slug: exportState || undefined,
            sample_size: verifySampleSize,
          }),
        }
      );

      const result: VerifyMappingResult & { error?: string } = await response.json();

      if (!response.ok) {
        throw new Error(result.error || 'Verification failed');
      }

      setVerifyResult(result);
    } catch (err) {
      setVerifyError(err instanceof Error ? err.message : 'Verification failed');
    } finally {
      setVerifying(false);
    }
  };

  if (!authChecked) {
    return (
      <WpAdminLayout>
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center justify-center min-h-96">
            <Loader className="w-8 h-8 animate-spin text-blue-600" />
          </div>
        </div>
      </WpAdminLayout>
    );
  }

  if (status === 'invalid') {
    return (
      <WpAdminLayout>
        <div className="max-w-4xl mx-auto">
          <div className="bg-red-50 border border-red-200 rounded-lg p-6">
            <div className="flex gap-3">
              <AlertTriangle className="w-6 h-6 text-red-600 shrink-0 mt-0.5" />
              <div>
                <p className="font-medium text-red-900 mb-2">Authentication Required</p>
                <p className="text-sm text-red-700">You must be logged in as an admin to access this page. Please login first.</p>
              </div>
            </div>
          </div>
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout>
      <div className="max-w-4xl mx-auto">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <MailOpen className="w-6 h-6 text-blue-600" />
            <h1 className="text-2xl font-bold text-gray-900">Email Cleaning Workflow</h1>
          </div>
          <p className="text-gray-600">Export agency emails for validation, then re-import cleaned results</p>
        </div>

        {/* Tabs */}
        <div className="flex gap-2 mb-6 border-b border-gray-200">
          <button
            onClick={() => setActiveTab('export')}
            className={`px-4 py-3 font-medium border-b-2 transition-colors ${
              activeTab === 'export'
                ? 'text-blue-600 border-blue-600'
                : 'text-gray-600 border-transparent hover:text-gray-900'
            }`}
          >
            <Download className="inline w-4 h-4 mr-2" />
            Export for Cleaning
          </button>
          <button
            onClick={() => setActiveTab('import')}
            className={`px-4 py-3 font-medium border-b-2 transition-colors ${
              activeTab === 'import'
                ? 'text-blue-600 border-blue-600'
                : 'text-gray-600 border-transparent hover:text-gray-900'
            }`}
          >
            <Upload className="inline w-4 h-4 mr-2" />
            Import Cleaned Results
          </button>
        </div>

        {/* ListClean Credits Card */}
        {creditsStatus && (
          <div className={`rounded-lg p-6 mb-8 border ${
            creditsStatus.status === 'critical' ? 'bg-red-50 border-red-200' :
            creditsStatus.status === 'warning' ? 'bg-amber-50 border-amber-200' :
            'bg-blue-50 border-blue-200'
          }`}>
            <div className="flex items-start justify-between gap-4">
              <div className="flex-1">
                <div className="flex items-center gap-3 mb-2">
                  <h3 className="text-lg font-semibold text-gray-900">ListClean Credits</h3>
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                    creditsStatus.status === 'critical' ? 'bg-red-100 text-red-700' :
                    creditsStatus.status === 'warning' ? 'bg-amber-100 text-amber-700' :
                    creditsStatus.status === 'error' ? 'bg-gray-100 text-gray-700' :
                    'bg-green-100 text-green-700'
                  }`}>
                    {creditsStatus.status === 'critical' ? 'CRITICAL' :
                     creditsStatus.status === 'warning' ? 'WARNING' :
                     creditsStatus.status === 'error' ? 'ERROR' :
                     'OK'}
                  </span>
                </div>

                <div className="grid grid-cols-2 gap-4 mb-4">
                  <div>
                    <p className="text-sm text-gray-600">Current Credits</p>
                    <p className="text-2xl font-bold text-gray-900">{creditsStatus.credits}</p>
                  </div>
                  <div>
                    <p className="text-sm text-gray-600">Thresholds</p>
                    <p className="text-sm text-gray-700">
                      Warning: {creditsStatus.threshold_warning} | Critical: {creditsStatus.threshold_critical}
                    </p>
                  </div>
                </div>

                {creditsStatus.queue_auto_paused && (
                  <div className={`rounded p-3 mb-4 ${
                    creditsStatus.queue_pause_reason === 'critical_credits'
                      ? 'bg-red-100 border border-red-200'
                      : 'bg-amber-100 border border-amber-200'
                  }`}>
                    <p className={`text-sm font-medium ${
                      creditsStatus.queue_pause_reason === 'critical_credits'
                        ? 'text-red-800'
                        : 'text-amber-800'
                    }`}>
                      Queue is AUTO-PAUSED due to {creditsStatus.queue_pause_reason === 'critical_credits' ? 'critical credits' : 'pause'}
                    </p>
                  </div>
                )}

                <p className="text-xs text-gray-600">
                  Low credits alerts are sent to bartu@gappsy.com. Queue automatically resumes when credits recover above {creditsStatus.threshold_warning}.
                </p>
              </div>

              <button
                onClick={refreshCredits}
                disabled={creditsLoading}
                className="px-4 py-2 bg-gray-600 text-white rounded-lg font-medium hover:bg-gray-700 disabled:opacity-50 disabled:cursor-not-allowed shrink-0 flex items-center gap-2"
              >
                {creditsLoading ? (
                  <>
                    <Loader className="w-4 h-4 animate-spin" />
                    Refreshing...
                  </>
                ) : (
                  'Refresh Credits'
                )}
              </button>
            </div>
          </div>
        )}

        {/* Queue Health Indicator — GLOBAL across all states */}
        {queueHealth && (
          <div className="bg-white border border-gray-200 rounded-lg p-6 mb-8">
            <div className="flex items-center justify-between mb-1">
              <div className="flex items-center gap-3">
                <Globe className="w-4 h-4 text-gray-500" />
                <h3 className="text-lg font-semibold text-gray-900">Verification Queue Health</h3>
                <span className="px-2 py-1 bg-gray-100 text-gray-600 text-xs font-medium rounded">GLOBAL — all states</span>
                {queueHealth.last_run?.status === 'completed' && (
                  <span className="px-2 py-1 bg-green-100 text-green-700 text-xs font-medium rounded">Healthy</span>
                )}
                {queueHealth.last_run?.status === 'completed_with_errors' && (
                  <span className="px-2 py-1 bg-amber-100 text-amber-700 text-xs font-medium rounded">Issues Detected</span>
                )}
                {queueHealth.last_run?.status === 'failed' && (
                  <span className="px-2 py-1 bg-red-100 text-red-700 text-xs font-medium rounded">Failed</span>
                )}
              </div>
              <button
                onClick={refreshQueueHealth}
                className="text-sm text-blue-600 hover:text-blue-700 font-medium"
              >
                Refresh
              </button>
            </div>
            <p className="text-xs text-gray-500 mb-4 ml-7">
              These numbers cover all states combined. To see counts for a specific state, select a state below and check the diagnostics panel.
            </p>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
              <div className="bg-gray-50 rounded-lg p-3">
                <p className="text-xs text-gray-500 mb-1">Global Pending Queue</p>
                <p className="text-xl font-bold text-gray-900">{queueHealth.queue_depth?.pending ?? 0}</p>
                <p className="text-xs text-gray-400 mt-1">all states, unverified</p>
              </div>
              <div className="bg-gray-50 rounded-lg p-3">
                <p className="text-xs text-gray-500 mb-1">Global Retries Due</p>
                <p className="text-xl font-bold text-amber-600">{queueHealth.queue_depth?.retry_due ?? 0}</p>
                <p className="text-xs text-gray-400 mt-1">all states, need retry</p>
              </div>
              <div className="bg-gray-50 rounded-lg p-3">
                <p className="text-xs text-gray-500 mb-1">Global 24h Processed</p>
                <p className="text-xl font-bold text-blue-600">{queueHealth.last_24h?.total_processed ?? 0}</p>
                <p className="text-xs text-gray-400 mt-1">last 24 hours</p>
              </div>
              <div className="bg-gray-50 rounded-lg p-3">
                <p className="text-xs text-gray-500 mb-1">Global 24h Valid / Invalid</p>
                <p className="text-xl font-bold">
                  <span className="text-green-600">{queueHealth.last_24h?.total_valid ?? 0}</span>
                  <span className="text-gray-400 mx-1">/</span>
                  <span className="text-red-600">{queueHealth.last_24h?.total_invalid ?? 0}</span>
                </p>
                <p className="text-xs text-gray-400 mt-1">last 24 hours</p>
              </div>
            </div>

            {/* Last Run Details */}
            {queueHealth.last_run && (
              <div className="border-t border-gray-100 pt-4">
                <p className="text-xs text-gray-500 mb-2">Last Queue Run</p>
                <div className="flex flex-wrap gap-4 text-sm">
                  <div>
                    <span className="text-gray-500">Time:</span>{' '}
                    <span className="font-medium text-gray-900">
                      {new Date(queueHealth.last_run.started_at).toLocaleString()}
                    </span>
                  </div>
                  <div>
                    <span className="text-gray-500">Selected:</span>{' '}
                    <span className="font-medium text-gray-900">{queueHealth.last_run.selected}</span>
                  </div>
                  <div>
                    <span className="text-gray-500">Processed:</span>{' '}
                    <span className="font-medium text-gray-900">{queueHealth.last_run.processed}</span>
                  </div>
                  <div>
                    <span className="text-gray-500">Valid:</span>{' '}
                    <span className="font-medium text-green-600">{queueHealth.last_run.valid}</span>
                  </div>
                  <div>
                    <span className="text-gray-500">Invalid:</span>{' '}
                    <span className="font-medium text-red-600">{queueHealth.last_run.invalid}</span>
                  </div>
                  {queueHealth.last_run.mismatch > 0 && (
                    <div>
                      <span className="text-gray-500">Mismatch:</span>{' '}
                      <span className="font-medium text-amber-600">{queueHealth.last_run.mismatch}</span>
                    </div>
                  )}
                  <div>
                    <span className="text-gray-500">Trigger:</span>{' '}
                    <span className="font-medium text-gray-700">{queueHealth.last_run.triggered_by}</span>
                  </div>
                </div>
              </div>
            )}

            {/* Warning if mismatch count is high */}
            {queueHealth.last_24h && queueHealth.last_24h.total_mismatch > 0 && (
              <div className="mt-4 bg-amber-50 border border-amber-200 rounded p-3">
                <div className="flex items-start gap-2">
                  <AlertTriangle className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" />
                  <p className="text-sm text-amber-800">
                    <span className="font-medium">{queueHealth.last_24h.total_mismatch} result mismatches</span> in the last 24 hours.
                    This indicates emails submitted to ListClean that could not be matched back to results.
                    Check worker logs for details.
                  </p>
                </div>
              </div>
            )}
          </div>
        )}

        {/* Automatic Verification Info Box */}
        <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-6">
          <div className="flex items-start gap-3">
            <Zap className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
            <div>
              <p className="text-sm font-medium text-green-900 mb-1">Fully Automatic Email Verification</p>
              <p className="text-sm text-green-800 mb-2">
                All newly imported emails are automatically queued and processed for verification immediately after import.
                Unknown results are automatically retried after 48 hours (max 6 attempts).
              </p>
              <div className="text-xs text-green-700 bg-green-100 rounded px-3 py-2">
                <strong>Scheduled Worker:</strong> A background job runs every 30 minutes to process pending retries automatically.
                No manual intervention required for the complete verification lifecycle.
              </div>
            </div>
          </div>
        </div>

        {/* Automated Verification Section */}
        <div className={`rounded-lg p-6 mb-8 border ${
          queueResult?.paused ? 'bg-amber-50 border-amber-200' :
          queueResult && queueResult.failed > 0 ? 'bg-red-50 border-red-200' :
          queueResult && queueResult.failed === 0 ? 'bg-green-50 border-green-200' :
          'bg-gradient-to-r from-green-50 to-teal-50 border-green-200'
        }`}>
          <div className="flex items-start justify-between gap-4">
            <div className="flex-1">
              <h2 className="text-lg font-semibold text-gray-900 mb-2">Manual Override: Process Queue Now</h2>
              <p className="text-sm text-gray-700 mb-4">
                Verification runs automatically after each import. Use this button only if you need to manually trigger processing for edge cases. Unknown statuses are retried automatically (48-hour intervals, max 6 attempts).
              </p>
              {queueError && (
                <div className="bg-red-50 border border-red-200 rounded p-3 mb-4 flex gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm text-red-900 font-medium">Error</p>
                    <p className="text-xs text-red-700">{queueError}</p>
                  </div>
                </div>
              )}
              {queueResult && (
                <div className={`rounded p-3 ${
                  queueResult.paused ? 'bg-amber-100 border border-amber-300' :
                  queueResult.failed > 0 ? 'bg-red-100 border border-red-300' :
                  'bg-green-100 border border-green-300'
                }`}>
                  <div className="flex items-start gap-3">
                    <div className="flex-1">
                      <p className={`text-sm font-medium mb-2 ${
                        queueResult.paused ? 'text-amber-900' :
                        queueResult.failed > 0 ? 'text-red-900' :
                        'text-green-900'
                      }`}>
                        {queueResult.paused ? (
                          <>Queue is Paused ({queueResult.pause_reason})</>
                        ) : queueResult.failed > 0 ? (
                          <>Processing Complete - {queueResult.failed} Failure{queueResult.failed !== 1 ? 's' : ''}</>
                        ) : (
                          <>Queue processed successfully</>
                        )}
                      </p>
                      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 text-xs font-medium mb-3">
                        {queueResult.total_selected !== undefined && (
                          <div className="bg-white rounded px-2 py-1">
                            <p className="text-gray-500">Selected</p>
                            <p className="text-lg text-gray-900">{queueResult.total_selected}</p>
                          </div>
                        )}
                        <div className="bg-white rounded px-2 py-1">
                          <p className="text-gray-500">Processed</p>
                          <p className="text-lg text-gray-900">{queueResult.processed}</p>
                        </div>
                        <div className="bg-white rounded px-2 py-1">
                          <p className="text-gray-500">Valid</p>
                          <p className="text-lg text-green-600">{queueResult.verified_valid}</p>
                        </div>
                        <div className="bg-white rounded px-2 py-1">
                          <p className="text-gray-500">Invalid</p>
                          <p className="text-lg text-red-600">{queueResult.verified_invalid}</p>
                        </div>
                        <div className="bg-white rounded px-2 py-1">
                          <p className="text-gray-500">Retry</p>
                          <p className="text-lg text-amber-600">{queueResult.scheduled_for_retry}</p>
                        </div>
                        <div className="bg-white rounded px-2 py-1">
                          <p className="text-gray-500">Failed</p>
                          <p className="text-lg text-red-600 font-bold">{queueResult.failed}</p>
                        </div>
                      </div>

                      {/* Result Mismatch Warning */}
                      {queueResult.result_mismatch_count && queueResult.result_mismatch_count > 0 && (
                        <div className="bg-amber-100 border border-amber-300 rounded p-3 mb-3">
                          <div className="flex items-start gap-2">
                            <Info className="w-4 h-4 text-amber-700 shrink-0 mt-0.5" />
                            <div>
                              <p className="text-sm font-medium text-amber-900">
                                Result Parsing Issue Detected
                              </p>
                              <p className="text-xs text-amber-800 mt-1">
                                {queueResult.result_mismatch_count} email(s) could not be matched to ListClean results.
                                This is a system parsing issue, not an email validation failure.
                                Check worker logs for normalization mismatch details.
                              </p>
                            </div>
                          </div>
                        </div>
                      )}

                      {/* Zero Processed Warning */}
                      {queueResult.total_selected && queueResult.total_selected > 0 && queueResult.processed === 0 && (
                        <div className="bg-red-100 border border-red-300 rounded p-3 mb-3">
                          <div className="flex items-start gap-2">
                            <AlertTriangle className="w-4 h-4 text-red-700 shrink-0 mt-0.5" />
                            <div>
                              <p className="text-sm font-medium text-red-900">
                                ListClean Result Retrieval Failed
                              </p>
                              <p className="text-xs text-red-800 mt-1">
                                {queueResult.total_selected} emails were selected but none were processed.
                                The completed batch exists, but the backend could not fetch the official result files.
                                Check worker logs for the download endpoint and HTTP status details.
                              </p>
                            </div>
                          </div>
                        </div>
                      )}

                      {/* Failure Diagnostics */}
                      {queueResult.failed > 0 && queueResult.failure_samples && queueResult.failure_samples.length > 0 && (
                        <div className="mt-4 pt-3 border-t border-current border-opacity-20">
                          <button
                            onClick={() => setExpandFailures(!expandFailures)}
                            className={`flex items-center gap-2 text-sm font-medium mb-3 ${
                              queueResult.paused ? 'text-amber-900 hover:text-amber-800' :
                              'text-red-900 hover:text-red-800'
                            }`}
                          >
                            {expandFailures ? (
                              <ChevronUp className="w-4 h-4" />
                            ) : (
                              <ChevronDown className="w-4 h-4" />
                            )}
                            Failure Details ({queueResult.failure_samples.length})
                          </button>

                          {expandFailures && (
                            <div className="space-y-3 mt-3">
                              {queueResult.failure_samples.map((sample, idx) => (
                                <div
                                  key={idx}
                                  className={`bg-white rounded p-3 border-l-4 ${
                                    sample.failure_stage === 'submit_batch' ? 'border-l-red-500' :
                                    sample.failure_stage === 'poll_batch' ? 'border-l-orange-500' :
                                    sample.failure_stage === 'download_results' ? 'border-l-yellow-500' :
                                    sample.failure_stage === 'parse_results' ? 'border-l-amber-500' :
                                    sample.failure_stage === 'db_update' ? 'border-l-red-400' :
                                    'border-l-gray-500'
                                  }`}
                                >
                                  <div className="flex items-start justify-between gap-2 mb-2">
                                    <div className="flex-1 min-w-0">
                                      <p className="text-xs font-medium text-gray-900 break-words">{sample.email_normalized}</p>
                                      <p className="text-xs text-gray-600 mt-0.5">
                                        ID: <span className="font-mono">{sample.email_id.substring(0, 8)}...</span>
                                      </p>
                                    </div>
                                    <span className="inline-block px-2 py-1 bg-red-100 text-red-700 text-xs font-medium rounded shrink-0">
                                      {sample.failure_stage}
                                    </span>
                                  </div>

                                  <div className="bg-gray-50 rounded p-2 mb-2">
                                    <p className="text-xs text-gray-700">{sample.error_message}</p>
                                  </div>

                                  <div className="flex flex-wrap gap-2 text-xs">
                                    <span className="bg-gray-100 text-gray-700 px-2 py-1 rounded">
                                      Attempt {sample.verification_attempt_count}
                                    </span>
                                    {sample.external_status && (
                                      <span className="bg-blue-100 text-blue-700 px-2 py-1 rounded">
                                        ListClean: {sample.external_status}
                                      </span>
                                    )}
                                    {sample.batch_id && (
                                      <span className="bg-purple-100 text-purple-700 px-2 py-1 rounded font-mono">
                                        Batch: {sample.batch_id}
                                      </span>
                                    )}
                                  </div>
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              )}
            </div>
            <button
              onClick={handleProcessQueue}
              disabled={processingQueue}
              className={`px-6 py-3 rounded-lg font-medium flex items-center gap-2 shrink-0 disabled:opacity-50 disabled:cursor-not-allowed transition-colors ${
                queueResult?.paused ? 'bg-amber-600 hover:bg-amber-700 text-white' :
                queueResult && queueResult.failed > 0 ? 'bg-red-600 hover:bg-red-700 text-white' :
                'bg-green-600 hover:bg-green-700 text-white'
              }`}
            >
              {processingQueue ? (
                <>
                  <Loader className="w-4 h-4 animate-spin" />
                  Processing...
                </>
              ) : (
                <>
                  <Zap className="w-4 h-4" />
                  Manual Override: Process Now
                </>
              )}
            </button>
          </div>
        </div>

        {/* Export Tab */}
        {activeTab === 'export' && (
          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <div className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Select State
                </label>
                <select
                  value={exportState}
                  onChange={(e) => setExportState(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                  <option value="">-- Choose a state --</option>
                  {states.map((state) => (
                    <option key={state} value={state}>
                      {formatStateName(state)}
                    </option>
                  ))}
                </select>
              </div>

              {/* State-specific diagnostics — auto-loads when state is selected */}
              {exportState && (
                <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
                  <div className="flex items-center gap-2 mb-3">
                    <Database className="w-4 h-4 text-gray-600" />
                    <span className="text-sm font-semibold text-gray-800">
                      Email Status — {formatStateName(exportState)}
                    </span>
                    {diagLoading && <Loader className="w-3 h-3 animate-spin text-gray-500" />}
                    <button
                      onClick={() => fetchStateDiagnostics(exportState)}
                      className="ml-auto text-xs text-blue-600 hover:text-blue-700"
                    >
                      Refresh
                    </button>
                  </div>

                  {stateDiagnostics ? (
                    <>
                      {/* Operational status model — primary view */}
                      <div className="grid grid-cols-2 md:grid-cols-5 gap-3 mb-3">
                        <div className="bg-white rounded p-3 border border-gray-200">
                          <p className="text-xs text-gray-500 font-medium">Total Imported</p>
                          <p className="text-xl font-bold text-gray-900">{stateDiagnostics.total_emails.toLocaleString()}</p>
                          <p className="text-xs text-gray-400">all email rows</p>
                        </div>
                        <div className="bg-white rounded p-3 border border-amber-200">
                          <p className="text-xs text-amber-700 font-medium">Needs Verification</p>
                          <p className="text-xl font-bold text-amber-700">
                            {((stateDiagnostics.by_status_active?.pending ?? 0) + (stateDiagnostics.by_status_active?.retry ?? 0)).toLocaleString()}
                          </p>
                          <p className="text-xs text-gray-400">pending + retry</p>
                        </div>
                        <div className="bg-white rounded p-3 border border-green-200">
                          <p className="text-xs text-green-700 font-medium">Clean Emails</p>
                          <p className="text-xl font-bold text-green-700">{(stateDiagnostics.by_status_active?.valid ?? 0).toLocaleString()}</p>
                          <p className="text-xs text-gray-400">verified valid</p>
                        </div>
                        <div className="bg-white rounded p-3 border border-red-200">
                          <p className="text-xs text-red-600 font-medium">Not Clean</p>
                          <p className="text-xl font-bold text-red-600">{(stateDiagnostics.by_status_active?.invalid ?? 0).toLocaleString()}</p>
                          <p className="text-xs text-gray-400">verified invalid</p>
                        </div>
                        <div className="bg-white rounded p-3 border border-orange-200">
                          <p className="text-xs text-orange-700 font-medium">Needs Repair</p>
                          <p className="text-xl font-bold text-orange-700">{(stateDiagnostics.by_status_inactive?.valid ?? 0).toLocaleString()}</p>
                          <p className="text-xs text-gray-400">clean but on archived record</p>
                        </div>
                      </div>

                      <div className="text-xs text-gray-600 bg-blue-50 rounded p-2 border border-blue-100 mb-3">
                        <strong>Export scope:</strong> Export buttons below only include emails from live canonical agency records in this state.
                        Emails on archived duplicate/junk records are excluded and appear in "Needs Repair\" above.
                      </div>

                      {/* Advanced record diagnostics — collapsed by default */}
                      <details className="group">
                        <summary className="cursor-pointer text-xs font-semibold text-gray-600 hover:text-gray-800 flex items-center gap-1 select-none">
                          <ChevronDown className="w-3 h-3 group-open:rotate-180 transition-transform" />
                          Advanced record diagnostics
                        </summary>
                        <div className="mt-3 pt-3 border-t border-gray-200 grid grid-cols-2 md:grid-cols-4 gap-3">
                          <div className="bg-white rounded p-2 border border-gray-200">
                            <p className="text-xs text-gray-500">Live canonical records</p>
                            <p className="text-lg font-bold text-gray-800">{stateDiagnostics.active_agencies_count.toLocaleString()}</p>
                          </div>
                          <div className="bg-white rounded p-2 border border-gray-200">
                            <p className="text-xs text-gray-500">Archived duplicate/junk records</p>
                            <p className="text-lg font-bold text-gray-500">{stateDiagnostics.inactive_agencies_count.toLocaleString()}</p>
                          </div>
                          <div className="bg-white rounded p-2 border border-gray-200">
                            <p className="text-xs text-gray-500">Emails on live records</p>
                            <p className="text-lg font-bold text-gray-800">{stateDiagnostics.on_active_agencies.toLocaleString()}</p>
                          </div>
                          <div className="bg-white rounded p-2 border border-gray-200">
                            <p className="text-xs text-gray-500">Emails on archived records</p>
                            <p className="text-lg font-bold text-gray-500">{stateDiagnostics.on_inactive_agencies.toLocaleString()}</p>
                          </div>
                        </div>
                      </details>
                    </>
                  ) : !diagLoading ? (
                    <p className="text-sm text-gray-500">Select a state to load diagnostics.</p>
                  ) : null}
                </div>
              )}

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Validation Status Filter
                </label>
                <select
                  value={exportStatus}
                  onChange={(e) => setExportStatus(e.target.value as any)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                  <option value="pending">Pending only (not validated yet)</option>
                  <option value="valid">Valid only</option>
                  <option value="invalid">Invalid only</option>
                  <option value="all">All statuses</option>
                </select>
                <p className="text-xs text-gray-500 mt-1">
                  This filter is applied. Only matching rows from <strong>active agencies</strong> are exported.
                  {stateDiagnostics && exportStatus !== 'all' && (
                    <> Estimated export size:{' '}
                      <strong className="text-gray-800">
                        {(stateDiagnostics.by_status_active?.[exportStatus] ?? 0).toLocaleString()} rows
                      </strong>
                    </>
                  )}
                  {stateDiagnostics && exportStatus === 'all' && (
                    <> Estimated export size:{' '}
                      <strong className="text-gray-800">
                        {stateDiagnostics.on_active_agencies.toLocaleString()} rows
                      </strong>
                    </>
                  )}
                </p>
              </div>

              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <p className="text-sm text-blue-900 mb-1">
                  <strong>What this exports:</strong> A flattened CSV with one row per email, including agency info.
                  Use with ZeroBounce, NeverBounce, or similar validators.
                </p>
                <p className="text-xs text-blue-700">
                  Filters applied: state = {exportState || '(none selected)'} | status = {exportStatus} | live canonical records only = yes | duplicates = included
                </p>
              </div>

              {exportError && (
                <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                  <div>
                    <p className="font-medium text-red-900">Export failed</p>
                    <p className="text-sm text-red-700">{exportError}</p>
                  </div>
                </div>
              )}

              {exportResult && (
                <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                  <div className="flex gap-3 mb-3">
                    <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-medium text-green-900">Export complete</p>
                      <p className="text-sm text-green-700">{exportResult.rows.toLocaleString()} rows downloaded to {exportResult.filename}</p>
                    </div>
                  </div>
                  {exportMeta && (
                    <div className="grid grid-cols-2 md:grid-cols-3 gap-2 text-xs bg-white rounded p-3 border border-green-100">
                      <div>
                        <p className="text-gray-500">State</p>
                        <p className="font-semibold text-gray-900">{exportMeta.state}</p>
                      </div>
                      <div>
                        <p className="text-gray-500">Status Filter Applied</p>
                        <p className="font-semibold text-gray-900">{exportMeta.validation_status_filter}</p>
                      </div>
                      <div>
                        <p className="text-gray-500">Live Records Only</p>
                        <p className="font-semibold text-gray-900">{exportMeta.active_agencies_only ? 'Yes' : 'No'}</p>
                      </div>
                      <div>
                        <p className="text-gray-500">Total Rows Exported</p>
                        <p className="font-semibold text-green-700">{exportMeta.total_rows.toLocaleString()}</p>
                      </div>
                      <div>
                        <p className="text-gray-500">Duplicates</p>
                        <p className="font-semibold text-gray-900">{exportMeta.duplicates_included ? 'Included' : 'Removed'}</p>
                      </div>
                    </div>
                  )}
                </div>
              )}

              <button
                onClick={handleExport}
                disabled={exporting || !exportState}
                className="w-full px-4 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
              >
                {exporting ? (
                  <>
                    <Loader className="w-4 h-4 animate-spin" />
                    Exporting...
                  </>
                ) : (
                  <>
                    <Download className="w-4 h-4" />
                    Download CSV for Cleaning
                  </>
                )}
              </button>

              {/* ListClean Export Section */}
              <div className="pt-6 border-t border-gray-200">
                <h3 className="text-sm font-semibold text-gray-900 mb-1">Export for ListClean (single-column email CSV)</h3>
                <p className="text-xs text-gray-600 mb-3">
                  Exports a single-column CSV of <strong className="text-gray-800">unique normalized email addresses</strong> for upload directly to ListClean.
                  Exact duplicate emails are excluded — each email appears only once, preventing wasted ListClean credits.
                  <strong className="text-gray-800"> Only emails on live canonical agency records</strong> in the selected state are included.
                  Emails on archived duplicate/junk records are excluded.
                </p>

                <div className="mb-4">
                  <label className="block text-xs font-medium text-gray-700 mb-1">
                    Status Filter (ListClean export)
                  </label>
                  <select
                    value={listcleanStatus}
                    onChange={(e) => setListcleanStatus(e.target.value as any)}
                    className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
                  >
                    <option value="pending">Pending only — emails not yet verified (recommended)</option>
                    <option value="all">All statuses — pending + valid + invalid + retry</option>
                    <option value="valid">Valid only</option>
                    <option value="invalid">Invalid only</option>
                  </select>
                  <p className="text-xs text-gray-500 mt-1">
                    This filter is applied in the backend query. Actual export count may be lower after exact duplicate emails are removed.
                    {stateDiagnostics && listcleanStatus === 'pending' && (
                      <> Raw rows before dedup: <strong className="text-gray-800">{(stateDiagnostics.by_status_active?.pending ?? 0).toLocaleString()}</strong></>
                    )}
                    {stateDiagnostics && listcleanStatus === 'all' && (
                      <> Raw rows before dedup: <strong className="text-gray-800">{stateDiagnostics.on_active_agencies.toLocaleString()}</strong></>
                    )}
                    {stateDiagnostics && listcleanStatus === 'valid' && (
                      <> Raw rows before dedup: <strong className="text-gray-800">{(stateDiagnostics.by_status_active?.valid ?? 0).toLocaleString()}</strong></>
                    )}
                    {stateDiagnostics && listcleanStatus === 'invalid' && (
                      <> Raw rows before dedup: <strong className="text-gray-800">{(stateDiagnostics.by_status_active?.invalid ?? 0).toLocaleString()}</strong></>
                    )}
                  </p>
                </div>

                {listcleanError && (
                  <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-4 flex gap-3">
                    <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-medium text-red-900">Export failed</p>
                      <p className="text-sm text-red-700">{listcleanError}</p>
                    </div>
                  </div>
                )}

                {listcleanResult && (
                  <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-4">
                    <div className="flex gap-3 mb-3">
                      <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                      <div className="flex-1">
                        <p className="font-medium text-green-900">Export complete</p>
                        <p className="text-sm text-green-700">
                          <strong>{listcleanResult.stats?.unique_emails_exported?.toLocaleString() ?? listcleanResult.rows.toLocaleString()}</strong> unique emails downloaded to {listcleanResult.filename}
                        </p>
                        {(listcleanResult.stats?.duplicate_rows_skipped ?? 0) > 0 && (
                          <p className="text-xs text-amber-700 mt-1">
                            {listcleanResult.stats.duplicate_rows_skipped.toLocaleString()} exact duplicate email rows skipped — not charged by ListClean
                          </p>
                        )}
                        {listcleanResult.export_job_id && (
                          <div className="mt-3 p-3 bg-white border-2 border-green-400 rounded-lg">
                            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Export Job ID</p>
                            <div className="flex items-center gap-2">
                              <code className="flex-1 font-mono text-sm bg-gray-100 border border-gray-200 rounded px-3 py-2 text-gray-900 break-all select-all">
                                {listcleanResult.export_job_id}
                              </code>
                              <button
                                type="button"
                                onClick={() => {
                                  navigator.clipboard.writeText(listcleanResult.export_job_id).then(() => {
                                    setCopiedJobId(true);
                                    setTimeout(() => setCopiedJobId(false), 2000);
                                  });
                                }}
                                className="shrink-0 flex items-center gap-1 px-3 py-2 bg-green-600 text-white text-xs font-medium rounded hover:bg-green-700 transition-colors"
                              >
                                {copiedJobId ? (
                                  <><ClipboardCheck className="w-3.5 h-3.5" /> Copied!</>
                                ) : (
                                  <><Copy className="w-3.5 h-3.5" /> Copy</>
                                )}
                              </button>
                            </div>
                            <p className="text-xs text-green-800 mt-2 font-medium">
                              Use this Export Job ID when importing the cleaned ListClean results.
                            </p>
                            <p className="text-xs text-gray-500 mt-0.5">
                              It has been auto-filled in the "Import Cleaned Results" tab below and saved to your browser for convenience.
                            </p>
                          </div>
                        )}
                      </div>
                    </div>

                    {listcleanResult.stats && (
                      <div className="grid grid-cols-2 md:grid-cols-3 gap-2 text-xs bg-white rounded p-3 border border-green-100">
                        <div>
                          <p className="text-gray-500">State</p>
                          <p className="font-semibold text-gray-900">{listcleanResult.stats.state}</p>
                        </div>
                        <div>
                          <p className="text-gray-500">Status Filter Applied</p>
                          <p className="font-semibold text-gray-900">{listcleanResult.stats.validation_status_filter}</p>
                        </div>
                        <div>
                          <p className="text-gray-500">Live Records Only</p>
                          <p className="font-semibold text-gray-900">{listcleanResult.stats.active_agencies_only ? 'Yes' : 'No'}</p>
                        </div>
                        <div>
                          <p className="text-gray-500">Raw Rows Fetched</p>
                          <p className="font-semibold text-gray-900">{listcleanResult.stats.raw_rows_fetched?.toLocaleString() ?? '—'}</p>
                        </div>
                        <div>
                          <p className="text-gray-500">Unique Emails Exported</p>
                          <p className="font-semibold text-green-700">{listcleanResult.stats.unique_emails_exported?.toLocaleString() ?? listcleanResult.rows.toLocaleString()}</p>
                        </div>
                        <div>
                          <p className="text-gray-500">Duplicate Rows Skipped</p>
                          <p className={`font-semibold ${(listcleanResult.stats.duplicate_rows_skipped ?? 0) > 0 ? 'text-amber-700' : 'text-gray-400'}`}>
                            {listcleanResult.stats.duplicate_rows_skipped?.toLocaleString() ?? '0'}
                          </p>
                        </div>
                        <div className="col-span-2 md:col-span-3">
                          <p className="text-gray-500">Exact Duplicate Emails</p>
                          <p className="font-semibold text-green-700">Excluded — unique normalized emails only</p>
                        </div>
                      </div>
                    )}
                  </div>
                )}

                <button
                  onClick={handleListcleanExport}
                  disabled={listcleanExporting || !exportState}
                  className="w-full px-4 py-3 bg-emerald-600 text-white rounded-lg font-medium hover:bg-emerald-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                >
                  {listcleanExporting ? (
                    <>
                      <Loader className="w-4 h-4 animate-spin" />
                      Exporting All Emails...
                    </>
                  ) : (
                    <>
                      <Download className="w-4 h-4" />
                      Export All Emails for ListClean
                    </>
                  )}
                </button>
              </div>

              {/* Repair Linkage Section */}
              <div className="pt-6 border-t border-gray-200">
                <div className="flex items-center gap-2 mb-3">
                  <Wrench className="w-4 h-4 text-amber-600" />
                  <h3 className="text-sm font-semibold text-gray-900">Repair Agency Linkage</h3>
                </div>
                <p className="text-xs text-gray-600 mb-4">
                  Fix emails that got attached to wrong "bucket" agencies during previous imports.
                  This will re-link valid emails from inactive agencies to their correct active agencies
                  based on email matching and domain analysis.
                </p>

                <div className="flex items-center gap-3 mb-4">
                  <label className="flex items-center gap-2 text-sm text-gray-700">
                    <input
                      type="checkbox"
                      checked={repairDryRun}
                      onChange={(e) => setRepairDryRun(e.target.checked)}
                      className="w-4 h-4 text-amber-600 rounded"
                    />
                    Dry run (preview only, no changes)
                  </label>
                </div>

                {repairError && (
                  <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-4 flex gap-3">
                    <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-medium text-red-900">Repair failed</p>
                      <p className="text-sm text-red-700">{repairError}</p>
                    </div>
                  </div>
                )}

                {repairResult && (
                  <div className={`rounded-lg p-4 mb-4 border ${
                    repairResult.dry_run ? 'bg-amber-50 border-amber-200' : 'bg-green-50 border-green-200'
                  }`}>
                    <div className="flex gap-3 mb-3">
                      {repairResult.dry_run ? (
                        <Info className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />
                      ) : (
                        <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                      )}
                      <div className="flex-1">
                        <p className={`font-medium ${repairResult.dry_run ? 'text-amber-900' : 'text-green-900'}`}>
                          {repairResult.dry_run ? 'Dry Run Preview' : 'Repair Complete!'}
                        </p>
                        <p className={`text-sm ${repairResult.dry_run ? 'text-amber-700' : 'text-green-700'}`}>
                          {repairResult.emails_relinked} emails {repairResult.dry_run ? 'would be' : 'were'} relinked
                        </p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 md:grid-cols-3 gap-3 text-xs bg-white rounded p-3 border border-current border-opacity-20 mb-3">
                      <div>
                        <p className="text-gray-600">Total Valid</p>
                        <p className="font-semibold text-gray-900">{repairResult.total_valid_emails}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">On Active</p>
                        <p className="font-semibold text-green-600">{repairResult.emails_on_active_agencies}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">On Inactive</p>
                        <p className="font-semibold text-red-600">{repairResult.emails_on_inactive_agencies}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Relinked</p>
                        <p className="font-semibold text-blue-600">{repairResult.emails_relinked}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Ambiguous</p>
                        <p className="font-semibold text-amber-600">{repairResult.emails_ambiguous}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">No Match</p>
                        <p className="font-semibold text-gray-600">{repairResult.emails_no_match}</p>
                      </div>
                    </div>

                    {repairResult.bucket_agencies_found.length > 0 && (
                      <div className="mb-3">
                        <p className="text-xs font-medium text-gray-700 mb-1">Bucket Agencies Found:</p>
                        <div className="flex flex-wrap gap-1">
                          {repairResult.bucket_agencies_found.map((name, i) => (
                            <span key={i} className="px-2 py-1 bg-red-100 text-red-700 text-xs rounded">
                              {name}
                            </span>
                          ))}
                        </div>
                      </div>
                    )}

                    {repairResult.relink_details.length > 0 && (
                      <div>
                        <p className="text-xs font-medium text-gray-700 mb-2">
                          Relink Details (first 20):
                        </p>
                        <div className="max-h-48 overflow-y-auto space-y-1">
                          {repairResult.relink_details.slice(0, 20).map((detail, i) => (
                            <div key={i} className="text-xs bg-gray-50 rounded p-2">
                              <span className="font-mono text-gray-600">{detail.email}</span>
                              <span className="mx-2 text-gray-400">:</span>
                              <span className="text-red-600">{detail.from_agency}</span>
                              <span className="mx-1 text-gray-400">{'->'}</span>
                              <span className="text-green-600">{detail.to_agency}</span>
                              <span className="ml-2 text-gray-400">({detail.match_method})</span>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                )}

                <button
                  onClick={handleRepairLinkage}
                  disabled={repairing || !exportState}
                  className={`w-full px-4 py-3 rounded-lg font-medium disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2 ${
                    repairDryRun
                      ? 'bg-amber-600 text-white hover:bg-amber-700'
                      : 'bg-red-600 text-white hover:bg-red-700'
                  }`}
                >
                  {repairing ? (
                    <>
                      <Loader className="w-4 h-4 animate-spin" />
                      {repairDryRun ? 'Analyzing...' : 'Repairing...'}
                    </>
                  ) : (
                    <>
                      <Wrench className="w-4 h-4" />
                      {repairDryRun ? 'Preview Repair (Dry Run)' : 'Execute Repair'}
                    </>
                  )}
                </button>
              </div>

              {/* Orphan Repair Section - Creates New Agencies */}
              <div className="pt-6 border-t border-gray-200">
                <div className="flex items-center gap-2 mb-3">
                  <Zap className="w-4 h-4 text-purple-600" />
                  <h3 className="text-sm font-semibold text-gray-900">Orphan Email Repair (Create Agencies)</h3>
                </div>
                <p className="text-xs text-gray-600 mb-4">
                  For orphan emails on inactive agencies that can't be relinked (because no matching active agency exists),
                  this will CREATE NEW active agencies based on email domains and move the emails there.
                  This ensures all valid business-domain emails become usable in Smartlead.
                </p>

                <div className="flex items-center gap-3 mb-4">
                  <label className="flex items-center gap-2 text-sm text-gray-700">
                    <input
                      type="checkbox"
                      checked={orphanRepairDryRun}
                      onChange={(e) => setOrphanRepairDryRun(e.target.checked)}
                      className="w-4 h-4 text-purple-600 rounded"
                    />
                    Dry run (preview only, no changes)
                  </label>
                </div>

                {orphanRepairError && (
                  <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-4 flex gap-3">
                    <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-medium text-red-900">Orphan repair failed</p>
                      <p className="text-sm text-red-700">{orphanRepairError}</p>
                    </div>
                  </div>
                )}

                {orphanRepairResult && (
                  <div className={`rounded-lg p-4 mb-4 border ${
                    orphanRepairResult.dry_run ? 'bg-purple-50 border-purple-200' : 'bg-green-50 border-green-200'
                  }`}>
                    <div className="flex gap-3 mb-3">
                      {orphanRepairResult.dry_run ? (
                        <Info className="w-5 h-5 text-purple-600 shrink-0 mt-0.5" />
                      ) : (
                        <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                      )}
                      <div className="flex-1">
                        <p className={`font-medium ${orphanRepairResult.dry_run ? 'text-purple-900' : 'text-green-900'}`}>
                          {orphanRepairResult.dry_run ? 'Dry Run Preview' : 'Orphan Repair Complete!'}
                        </p>
                        <p className={`text-sm ${orphanRepairResult.dry_run ? 'text-purple-700' : 'text-green-700'}`}>
                          {orphanRepairResult.agencies_created} agencies {orphanRepairResult.dry_run ? 'would be' : 'were'} created,
                          {' '}{orphanRepairResult.emails_relinked} emails {orphanRepairResult.dry_run ? 'would be' : 'were'} relinked
                        </p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 md:grid-cols-4 gap-3 text-xs bg-white rounded p-3 border border-current border-opacity-20 mb-3">
                      <div>
                        <p className="text-gray-600">Total Orphans</p>
                        <p className="font-semibold text-gray-900">{orphanRepairResult.total_valid_orphans}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Business Domain</p>
                        <p className="font-semibold text-blue-600">{orphanRepairResult.business_domain_repairable}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Generic (gmail etc)</p>
                        <p className="font-semibold text-gray-500">{orphanRepairResult.generic_domain_skipped}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Franchise</p>
                        <p className="font-semibold text-gray-500">{orphanRepairResult.franchise_domain_skipped}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Agencies Created</p>
                        <p className="font-semibold text-green-600">{orphanRepairResult.agencies_created}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Emails Relinked</p>
                        <p className="font-semibold text-green-600">{orphanRepairResult.emails_relinked}</p>
                      </div>
                      <div>
                        <p className="text-gray-600">Failed</p>
                        <p className="font-semibold text-red-600">{orphanRepairResult.emails_failed}</p>
                      </div>
                    </div>

                    {orphanRepairResult.repair_details.length > 0 && (
                      <div>
                        <p className="text-xs font-medium text-gray-700 mb-2">
                          Created Agencies (first 20):
                        </p>
                        <div className="max-h-48 overflow-y-auto space-y-1">
                          {orphanRepairResult.repair_details.slice(0, 20).map((detail, i) => (
                            <div key={i} className="text-xs bg-gray-50 rounded p-2 flex justify-between items-center">
                              <div>
                                <span className="font-mono text-gray-600">{detail.email_domain}</span>
                                <span className="mx-2 text-gray-400">-&gt;</span>
                                <span className="text-green-600">{detail.agency_name}</span>
                              </div>
                              <span className={`px-2 py-0.5 rounded text-xs ${
                                detail.action === 'created' ? 'bg-green-100 text-green-700' :
                                detail.action === 'existing' ? 'bg-blue-100 text-blue-700' :
                                'bg-gray-100 text-gray-700'
                              }`}>
                                {detail.email_count} emails / {detail.action}
                              </span>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}

                    {orphanRepairResult.unrepaired_emails.length > 0 && orphanRepairResult.unrepaired_emails.length <= 50 && (
                      <div className="mt-3">
                        <p className="text-xs font-medium text-gray-700 mb-2">
                          Unrepaired ({orphanRepairResult.unrepaired_emails.length}):
                        </p>
                        <div className="max-h-32 overflow-y-auto space-y-1">
                          {orphanRepairResult.unrepaired_emails.slice(0, 20).map((item, i) => (
                            <div key={i} className="text-xs bg-gray-100 rounded p-1 px-2">
                              <span className="font-mono text-gray-600">{item.email}</span>
                              <span className="ml-2 text-gray-400">({item.reason})</span>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                )}

                <button
                  onClick={handleOrphanRepair}
                  disabled={orphanRepairing || !exportState}
                  className={`w-full px-4 py-3 rounded-lg font-medium disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2 ${
                    orphanRepairDryRun
                      ? 'bg-purple-600 text-white hover:bg-purple-700'
                      : 'bg-red-600 text-white hover:bg-red-700'
                  }`}
                >
                  {orphanRepairing ? (
                    <>
                      <Loader className="w-4 h-4 animate-spin" />
                      {orphanRepairDryRun ? 'Analyzing Orphans...' : 'Creating Agencies...'}
                    </>
                  ) : (
                    <>
                      <Zap className="w-4 h-4" />
                      {orphanRepairDryRun ? 'Preview Orphan Repair' : 'Execute Orphan Repair'}
                    </>
                  )}
                </button>
              </div>

              {/* System Health Section */}
              <div className="pt-6 border-t border-gray-200">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex items-center gap-2">
                    <Info className="w-4 h-4 text-blue-600" />
                    <h3 className="text-sm font-semibold text-gray-900">System Health Check</h3>
                  </div>
                  <button
                    onClick={refreshSystemHealth}
                    disabled={healthLoading || !exportState}
                    className="px-3 py-1 text-sm bg-blue-100 text-blue-700 rounded hover:bg-blue-200 disabled:opacity-50"
                  >
                    {healthLoading ? 'Loading...' : 'Refresh'}
                  </button>
                </div>

                {healthError && (
                  <div className="bg-red-50 border border-red-200 rounded p-3 mb-4 text-sm text-red-700">
                    {healthError}
                  </div>
                )}

                {systemHealth && (
                  <div className="bg-gray-50 rounded-lg p-4 border border-gray-200">
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                      <div className="bg-white rounded p-3 border">
                        <p className="text-xs text-gray-500">Valid on Active</p>
                        <p className="text-xl font-bold text-green-600">
                          {systemHealth.email_inventory.valid_on_active_agencies}
                        </p>
                      </div>
                      <div className="bg-white rounded p-3 border">
                        <p className="text-xs text-gray-500">Valid on Inactive</p>
                        <p className="text-xl font-bold text-red-600">
                          {systemHealth.email_inventory.valid_on_inactive_agencies}
                        </p>
                      </div>
                      <div className="bg-white rounded p-3 border">
                        <p className="text-xs text-gray-500">Orphan Rate</p>
                        <p className={`text-xl font-bold ${
                          systemHealth.email_inventory.orphan_rate_percent > 50 ? 'text-red-600' :
                          systemHealth.email_inventory.orphan_rate_percent > 10 ? 'text-amber-600' :
                          'text-green-600'
                        }`}>
                          {systemHealth.email_inventory.orphan_rate_percent}%
                        </p>
                      </div>
                      <div className="bg-white rounded p-3 border">
                        <p className="text-xs text-gray-500">Smartlead Ready</p>
                        <p className="text-xl font-bold text-blue-600">
                          {systemHealth.smartlead_readiness.sendable_emails_active_only}
                        </p>
                      </div>
                    </div>

                    {systemHealth.recommendations.length > 0 && (
                      <div className="space-y-2">
                        <p className="text-xs font-medium text-gray-700">Recommendations:</p>
                        {systemHealth.recommendations.map((rec, i) => (
                          <div key={i} className={`text-xs p-2 rounded ${
                            rec.startsWith('CRITICAL') ? 'bg-red-100 text-red-800' :
                            rec.startsWith('WARNING') ? 'bg-amber-100 text-amber-800' :
                            'bg-blue-100 text-blue-800'
                          }`}>
                            {rec}
                          </div>
                        ))}
                      </div>
                    )}

                    <p className="text-xs text-gray-400 mt-3">
                      Last updated: {new Date(systemHealth.timestamp).toLocaleString()}
                    </p>
                  </div>
                )}
              </div>
            </div>
          </div>
        )}

        {/* Import Tab */}
        {activeTab === 'import' && (
          <div className="bg-white rounded-lg border border-gray-200 p-6">
            <div className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Select Cleaned Results File
                </label>
                <input
                  type="file"
                  accept=".csv,.json"
                  onChange={(e) => {
                    setImportFile(e.target.files?.[0] || null);
                    setImportError('');
                  }}
                  className="w-full"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email Validation Provider
                </label>
                <select
                  value={importProvider}
                  onChange={(e) => setImportProvider(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                  <option value="ListClean">ListClean (Recommended)</option>
                  <option value="Other">Other Provider</option>
                </select>
                <p className="text-xs text-gray-500 mt-1">
                  ListClean is the default provider for cleaned result imports.
                </p>
              </div>

              <div>
                <div className="flex items-center justify-between mb-2">
                  <label className="block text-sm font-medium text-gray-700">
                    Export Job ID <span className="text-red-500">*</span>
                  </label>
                  {importExportJobId && (
                    <span className="text-xs text-green-700 font-medium flex items-center gap-1">
                      <ClipboardCheck className="w-3 h-3" /> Auto-filled from last export
                    </span>
                  )}
                </div>
                <input
                  type="text"
                  value={importExportJobId}
                  onChange={(e) => {
                    setImportExportJobId(e.target.value);
                    try { localStorage.setItem('listclean_last_export_job_id', e.target.value); } catch { /* ignore */ }
                  }}
                  placeholder="e.g., abc12345-6789-..."
                  className={`w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent font-mono text-sm ${importExportJobId ? 'border-green-400 bg-green-50' : 'border-gray-300'}`}
                />
                <p className="text-xs text-gray-500 mt-1">
                  Required for precise lineage matching. Paste the Export Job ID shown in the Export tab after a successful export.
                  Without this, emails may be matched to wrong agencies if duplicates exist.
                </p>
              </div>

              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <p className="text-sm text-blue-900 mb-2">
                  <strong>Supported formats:</strong>
                </p>
                <ul className="text-sm text-blue-900 space-y-1 ml-4 list-disc">
                  <li>
                    <strong>ListClean CSV:</strong> Columns like LC_Status, LC_Email, LC_Reason are automatically mapped and supported
                  </li>
                  <li>
                    <strong>Standard CSV/JSON:</strong> email_id (or agency_id + email_normalized), validation_status, validation_provider (optional), validation_reason (optional), validation_score (optional)
                  </li>
                </ul>
              </div>

              {importError && (
                <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                  <div>
                    <p className="font-medium text-red-900">Import failed</p>
                    <p className="text-sm text-red-700">{importError}</p>
                  </div>
                </div>
              )}

              {importResult && (
                <div className={`rounded-lg p-4 ${
                  importResult.rows_updated === 0 && importResult.rows_unmatched > 0
                    ? 'bg-red-50 border border-red-200'
                    : 'bg-green-50 border border-green-200'
                }`}>
                  <div className="flex gap-3 mb-3">
                    {importResult.rows_updated === 0 && importResult.rows_unmatched > 0 ? (
                      <>
                        <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                        <div className="flex-1">
                          <p className="font-medium text-red-900">Import failed - No rows matched</p>
                          <p className="text-sm text-red-700">
                            Could not match {importResult.total_rows} rows to existing emails in database
                          </p>
                        </div>
                      </>
                    ) : (
                      <>
                        <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
                        <div className="flex-1">
                          <p className="font-medium text-green-900">Import successful!</p>
                          <p className="text-sm text-green-700">
                            {importResult.rows_matched} of {importResult.total_rows} CSV rows matched
                          </p>
                          {importResult.rows_updated > importResult.rows_matched && (
                            <p className="text-xs text-green-600 mt-1">
                              {importResult.rows_updated} database rows updated
                            </p>
                          )}
                          {importResult.timing_ms != null && (
                            <p className="text-xs text-green-600 mt-1">
                              Completed in {importResult.timing_ms < 1000
                                ? `${importResult.timing_ms}ms`
                                : `${(importResult.timing_ms / 1000).toFixed(1)}s`}
                            </p>
                          )}
                        </div>
                      </>
                    )}
                    {importResult.detected_format && (
                      <p className="text-xs mt-1" style={{gridColumn: '2'}}>
                        Format detected: <strong>{importResult.detected_format}</strong>
                      </p>
                    )}
                  </div>

                  {importResult.rows_unmatched > 0 && (
                    <div className={`text-sm rounded p-2 mb-2 border ${
                      importResult.rows_updated === 0
                        ? 'text-red-700 bg-red-100 border-red-300'
                        : 'text-yellow-700 bg-yellow-50 border-yellow-200'
                    }`}>
                      {importResult.rows_unmatched} rows could not be matched
                    </div>
                  )}

                  {importResult.rows_invalid > 0 && (
                    <div className="text-sm text-red-700 bg-red-50 border border-red-200 rounded p-2">
                      {importResult.rows_invalid} rows had validation errors
                    </div>
                  )}

                  {importResult.match_method_stats && (
                    <div className="mt-3 p-3 bg-gray-50 rounded border border-gray-200">
                      <p className="text-xs font-medium text-gray-700 mb-2">Match Methods Used:</p>
                      <div className="grid grid-cols-2 md:grid-cols-3 gap-2 text-xs">
                        <div className="bg-white rounded p-2 border border-gray-100">
                          <p className="text-gray-500">Lineage (anchor rows)</p>
                          <p className="font-semibold text-green-600">{importResult.match_method_stats.via_lineage}</p>
                        </div>
                        {(importResult.match_method_stats.via_lineage_dedup_fan_out ?? 0) > 0 && (
                          <div className="bg-white rounded p-2 border border-green-200">
                            <p className="text-gray-500">Dedup fan-out rows updated</p>
                            <p className="font-semibold text-green-700">{importResult.match_method_stats.via_lineage_dedup_fan_out}</p>
                          </div>
                        )}
                        <div className="bg-white rounded p-2 border border-gray-100">
                          <p className="text-gray-500">Email ID</p>
                          <p className="font-semibold text-blue-600">{importResult.match_method_stats.via_email_id}</p>
                        </div>
                        <div className="bg-white rounded p-2 border border-gray-100">
                          <p className="text-gray-500">Agency+Email</p>
                          <p className="font-semibold text-blue-600">{importResult.match_method_stats.via_agency_email}</p>
                        </div>
                        <div className="bg-white rounded p-2 border border-gray-100">
                          <p className="text-gray-500">Unique Email</p>
                          <p className="font-semibold text-amber-600">{importResult.match_method_stats.via_unique_email}</p>
                        </div>
                        <div className="bg-white rounded p-2 border border-gray-100">
                          <p className="text-gray-500">Ambiguous</p>
                          <p className="font-semibold text-red-600">{importResult.match_method_stats.ambiguous_skipped}</p>
                        </div>
                      </div>
                      {(importResult.match_method_stats.via_lineage_dedup_fan_out ?? 0) > 0 && (
                        <p className="text-xs text-green-700 mt-2">
                          {importResult.match_method_stats.via_lineage_dedup_fan_out} duplicate source rows also updated via dedup fan-out — all rows sharing the same email received the same clean result.
                        </p>
                      )}
                      {importResult.match_method_stats.ambiguous_skipped > 0 && (
                        <p className="text-xs text-amber-700 mt-2">
                          {importResult.match_method_stats.ambiguous_skipped} rows skipped due to ambiguous email matches.
                          Use Export Job ID to enable precise lineage-based matching.
                        </p>
                      )}
                    </div>
                  )}

                  {importResult.flags_refresh && (
                    <div className={`mt-3 flex items-center gap-2 text-xs px-3 py-2 rounded border ${
                      importResult.flags_refresh.ok
                        ? 'bg-blue-50 border-blue-200 text-blue-800'
                        : 'bg-amber-50 border-amber-200 text-amber-800'
                    }`}>
                      {importResult.flags_refresh.ok ? (
                        <>
                          <CheckCircle className="w-3.5 h-3.5 shrink-0" />
                          <span>
                            Shared email flags refreshed —{' '}
                            {importResult.flags_refresh.rows_newly_flagged ?? 0} newly flagged,{' '}
                            {importResult.flags_refresh.rows_cleared ?? 0} cleared
                            {(importResult.flags_refresh.shared_email_patterns ?? 0) > 0 &&
                              `, ${importResult.flags_refresh.shared_email_patterns} shared patterns detected`}
                          </span>
                        </>
                      ) : (
                        <>
                          <AlertCircle className="w-3.5 h-3.5 shrink-0" />
                          <span>Flag refresh failed (non-fatal): {importResult.flags_refresh.error}</span>
                        </>
                      )}
                    </div>
                  )}

                  {importResult.errors.length > 0 && (
                    <div className="mt-3 max-h-40 overflow-y-auto">
                      <p className="text-xs font-medium text-gray-600 mb-2">Error Details:</p>
                      <div className="space-y-1">
                        {importResult.errors.slice(0, 10).map((err, i) => (
                          <div key={i} className="text-xs text-gray-600 bg-gray-50 p-2 rounded">
                            Row {err.row}: {err.reason}
                          </div>
                        ))}
                        {importResult.errors.length > 10 && (
                          <p className="text-xs text-gray-600">... and {importResult.errors.length - 10} more</p>
                        )}
                      </div>
                    </div>
                  )}
                </div>
              )}

              <button
                onClick={handleImportClicked}
                disabled={importing || !importFile}
                className="w-full px-4 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
              >
                {importing ? (
                  <>
                    <Loader className="w-4 h-4 animate-spin" />
                    Importing...
                  </>
                ) : (
                  <>
                    <Upload className="w-4 h-4" />
                    Import Cleaned Results
                  </>
                )}
              </button>
            </div>
          </div>
        )}

        {/* ── Verify Imported Agency Mappings (shown after import completes) ── */}
        {activeTab === 'import' && importResult && (
          <div className="bg-white rounded-lg border border-gray-200 mt-6">
            <div className="flex items-center justify-between px-6 py-4 border-b border-gray-100">
              <div className="flex items-center gap-3">
                <ShieldCheck className="w-5 h-5 text-blue-600" />
                <div>
                  <h2 className="text-base font-semibold text-gray-900">Verify Imported Agency Mappings</h2>
                  <p className="text-xs text-gray-500 mt-0.5">
                    Cross-checks sampled rows against the live agency lookup — proves agency_id, slug, and
                    /your-agency URL are consistent and the import never rewrote an email to the wrong agency.
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-3 shrink-0 ml-4">
                <div className="flex items-center gap-2">
                  <label className="text-xs text-gray-500 whitespace-nowrap">Sample size</label>
                  <select
                    value={verifySampleSize}
                    onChange={(e) => setVerifySampleSize(Number(e.target.value))}
                    className="text-sm border border-gray-300 rounded-lg px-2 py-1.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  >
                    {[25, 50, 100, 200].map((n) => (
                      <option key={n} value={n}>{n} rows</option>
                    ))}
                  </select>
                </div>
                <button
                  onClick={handleVerifyMappings}
                  disabled={verifying}
                  className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2 whitespace-nowrap"
                >
                  {verifying ? (
                    <>
                      <Loader className="w-4 h-4 animate-spin" />
                      Verifying...
                    </>
                  ) : (
                    <>
                      <ShieldCheck className="w-4 h-4" />
                      Verify imported agency mappings
                    </>
                  )}
                </button>
              </div>
            </div>

            <div className="p-6">
              {importExportJobId && !verifyResult && !verifying && (
                <div className="flex items-center gap-2 text-xs text-blue-700 bg-blue-50 border border-blue-100 rounded px-3 py-2 mb-4">
                  <Info className="w-3.5 h-3.5 shrink-0" />
                  Will sample from export job <span className="font-mono font-medium">{importExportJobId.slice(0, 8)}…</span> for precise lineage-based verification.
                </div>
              )}

              {verifyError && (
                <div className="flex items-start gap-3 bg-red-50 border border-red-200 rounded-lg p-4 mb-4">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-medium text-red-900">Verification failed</p>
                    <p className="text-xs text-red-700 mt-1">{verifyError}</p>
                  </div>
                </div>
              )}

              {!verifyResult && !verifyError && !verifying && (
                <p className="text-sm text-gray-500 text-center py-4">
                  Click "Verify imported agency mappings" to run the check on up to {verifySampleSize} rows.
                </p>
              )}

              {verifyResult && (
                <div className="space-y-4">
                  {/* Summary card */}
                  <div className={`rounded-lg p-4 border ${
                    verifyResult.dangerous_real_conflict_count > 0
                      ? 'bg-red-50 border-red-200'
                      : verifyResult.mismatch_count === 0 || verifyResult.mismatch_count === verifyResult.expected_placeholder_conflict_count
                      ? 'bg-green-50 border-green-200'
                      : 'bg-amber-50 border-amber-200'
                  }`}>
                    <div className="flex items-center gap-2 mb-3">
                      {verifyResult.dangerous_real_conflict_count > 0 ? (
                        <AlertTriangle className="w-5 h-5 text-red-600" />
                      ) : verifyResult.mismatch_count === 0 || verifyResult.mismatch_count === verifyResult.expected_placeholder_conflict_count ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertTriangle className="w-5 h-5 text-amber-600" />
                      )}
                      <span className={`font-semibold ${
                        verifyResult.dangerous_real_conflict_count > 0
                          ? 'text-red-800'
                          : verifyResult.mismatch_count === 0 || verifyResult.mismatch_count === verifyResult.expected_placeholder_conflict_count
                          ? 'text-green-800'
                          : 'text-amber-800'
                      }`}>
                        {verifyResult.dangerous_real_conflict_count > 0
                          ? `${verifyResult.dangerous_real_conflict_count} dangerous conflict${verifyResult.dangerous_real_conflict_count !== 1 ? 's' : ''} require repair`
                          : verifyResult.mismatch_count === 0
                          ? `All ${verifyResult.sample_checked} sampled rows agree — agency mappings are correct`
                          : verifyResult.mismatch_count === verifyResult.expected_placeholder_conflict_count
                          ? `${verifyResult.sample_checked} sampled rows — only expected placeholder conflicts (no action needed)`
                          : `${verifyResult.mismatch_count} mismatch${verifyResult.mismatch_count !== 1 ? 'es' : ''} found in ${verifyResult.sample_checked} sampled rows`}
                      </span>
                    </div>
                    <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
                      <div className="bg-white rounded-lg p-3 border border-gray-100 text-center">
                        <p className="text-xs text-gray-500 mb-1">Sampled</p>
                        <p className="text-2xl font-bold text-gray-900">{verifyResult.sample_checked}</p>
                      </div>
                      <div className="bg-white rounded-lg p-3 border border-green-100 text-center">
                        <p className="text-xs text-gray-500 mb-1">Exact agreement</p>
                        <p className="text-2xl font-bold text-green-600">{verifyResult.exact_agreement_count}</p>
                      </div>
                      <div className={`rounded-lg p-3 border text-center ${verifyResult.dangerous_real_conflict_count > 0 ? 'bg-red-50 border-red-200' : 'bg-white border-gray-100'}`}>
                        <p className="text-xs text-gray-500 mb-1">Dangerous conflicts</p>
                        <p className={`text-2xl font-bold ${verifyResult.dangerous_real_conflict_count > 0 ? 'text-red-600' : 'text-gray-300'}`}>{verifyResult.dangerous_real_conflict_count ?? 0}</p>
                      </div>
                      <div className={`rounded-lg p-3 border text-center ${verifyResult.expected_placeholder_conflict_count > 0 ? 'bg-amber-50 border-amber-200' : 'bg-white border-gray-100'}`}>
                        <p className="text-xs text-gray-500 mb-1">Placeholder (expected)</p>
                        <p className={`text-2xl font-bold ${verifyResult.expected_placeholder_conflict_count > 0 ? 'text-amber-600' : 'text-gray-300'}`}>{verifyResult.expected_placeholder_conflict_count ?? 0}</p>
                      </div>
                      <div className={`rounded-lg p-3 border text-center ${(verifyResult.mismatch_count - (verifyResult.duplicate_conflict_count ?? 0)) > 0 ? 'bg-red-50 border-red-200' : 'bg-white border-gray-100'}`}>
                        <p className="text-xs text-gray-500 mb-1">Other mismatches</p>
                        <p className={`text-2xl font-bold ${(verifyResult.mismatch_count - (verifyResult.duplicate_conflict_count ?? 0)) > 0 ? 'text-red-600' : 'text-gray-300'}`}>{verifyResult.mismatch_count - (verifyResult.duplicate_conflict_count ?? 0)}</p>
                      </div>
                    </div>
                    {verifyResult.timing_ms != null && (
                      <p className="text-xs text-gray-500 mt-3">
                        Completed in {verifyResult.timing_ms < 1000 ? `${verifyResult.timing_ms}ms` : `${(verifyResult.timing_ms / 1000).toFixed(1)}s`}
                        {verifyResult.export_job_id && <span className="ml-2 text-blue-600 font-medium">· export job: {verifyResult.export_job_id.slice(0, 8)}…</span>}
                        {verifyResult.state_slug && <span className="ml-2 text-gray-600">· state: {verifyResult.state_slug}</span>}
                      </p>
                    )}
                    {verifyResult.message && (
                      <p className="text-xs text-gray-600 mt-2 italic">{verifyResult.message}</p>
                    )}
                  </div>

                  {/* Invariant badges */}
                  {verifyResult.sample_checked > 0 && (
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                      {[
                        {
                          ok: verifyResult.mismatch_count === 0,
                          label: 'Agency ID match',
                          desc: 'Imported email rows remain attached to the correct agency',
                        },
                        {
                          ok: verifyResult.mismatch_count === 0,
                          label: 'URL match',
                          desc: '/your-agency URL agrees between import record and live lookup',
                        },
                        {
                          ok: (verifyResult.dangerous_real_conflict_count ?? 0) === 0,
                          label: 'No dangerous conflicts',
                          desc: 'No real branded-email conflicts — only expected placeholder noise',
                        },
                        {
                          ok: verifyResult.exact_agreement_count === verifyResult.sample_checked - verifyResult.no_data_count,
                          label: 'Full agreement',
                          desc: 'Import and agency-lookup agree on all sampled agency resolutions',
                        },
                      ].map((check, i) => (
                        <div key={i} className={`flex items-start gap-3 px-4 py-3 rounded-lg border ${
                          check.ok
                            ? 'bg-green-50 border-green-200'
                            : 'bg-red-50 border-red-200'
                        }`}>
                          <div className={`mt-0.5 shrink-0 ${check.ok ? 'text-green-600' : 'text-red-600'}`}>
                            {check.ok
                              ? <CheckCircle className="w-4 h-4" />
                              : <XCircle className="w-4 h-4" />}
                          </div>
                          <div>
                            <p className={`text-sm font-semibold ${check.ok ? 'text-green-800' : 'text-red-800'}`}>{check.label}</p>
                            <p className={`text-xs mt-0.5 ${check.ok ? 'text-green-700' : 'text-red-700'}`}>{check.desc}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  )}

                  {/* Mismatch table */}
                  {verifyResult.mismatches.length > 0 && (
                    <div className="border border-red-200 rounded-lg overflow-hidden">
                      <button
                        onClick={() => setShowVerifyMismatches(!showVerifyMismatches)}
                        className="w-full flex items-center justify-between px-4 py-3 bg-red-50 hover:bg-red-100 transition-colors"
                      >
                        <div className="flex items-center gap-2">
                          <AlertTriangle className="w-4 h-4 text-red-600" />
                          <span className="text-sm font-semibold text-red-800">
                            Mismatch Details ({verifyResult.mismatches.length} row{verifyResult.mismatches.length !== 1 ? 's' : ''})
                          </span>
                        </div>
                        {showVerifyMismatches ? <ChevronUp className="w-4 h-4 text-red-600" /> : <ChevronDown className="w-4 h-4 text-red-600" />}
                      </button>

                      {showVerifyMismatches && (
                        <div className="overflow-x-auto">
                          <table className="w-full text-xs">
                            <thead>
                              <tr className="bg-gray-50 border-b border-gray-200 text-left">
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Email</th>
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Conflict</th>
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Imported Agency</th>
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Imported /your-agency URL</th>
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Lookup Agency</th>
                                <th className="px-3 py-2.5 font-semibold text-gray-600">Lookup /your-agency URL</th>
                              </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-100">
                              {verifyResult.mismatches.map((m, i) => (
                                <tr key={i} className="hover:bg-gray-50">
                                  <td className="px-3 py-2.5 font-mono text-gray-800 max-w-[160px]">
                                    <span className="block truncate" title={m.email}>{m.email}</span>
                                  </td>
                                  <td className="px-3 py-2.5">
                                    <div className="flex flex-col gap-1">
                                      <span className={`inline-block px-2 py-0.5 rounded-full text-xs font-semibold ${
                                        m.conflict_type === 'dangerous_real_conflict'
                                          ? 'bg-red-100 text-red-800'
                                          : m.conflict_type === 'expected_placeholder_conflict'
                                          ? 'bg-amber-100 text-amber-700'
                                          : m.conflict_type === 'agency_id_mismatch'
                                          ? 'bg-red-100 text-red-800'
                                          : 'bg-orange-100 text-orange-800'
                                      }`}>
                                        {m.conflict_type === 'expected_placeholder_conflict'
                                          ? 'placeholder (expected)'
                                          : m.conflict_type === 'dangerous_real_conflict'
                                          ? 'dangerous conflict'
                                          : m.conflict_type.replace(/_/g, ' ')}
                                      </span>
                                      {m.is_placeholder_email && (
                                        <span className="inline-block px-1.5 py-0.5 rounded text-xs bg-gray-100 text-gray-500">junk email</span>
                                      )}
                                      {m.is_shared_conflict && !m.is_placeholder_email && (
                                        <span className="inline-block px-1.5 py-0.5 rounded text-xs bg-blue-50 text-blue-600">shared</span>
                                      )}
                                    </div>
                                  </td>
                                  <td className="px-3 py-2.5">
                                    <div className="font-medium text-gray-800 truncate max-w-[140px]" title={m.imported_agency_name}>{m.imported_agency_name}</div>
                                    <div className="text-gray-400 font-mono">{m.imported_agency_id.slice(0, 8)}…</div>
                                  </td>
                                  <td className="px-3 py-2.5 max-w-[170px]">
                                    <a href={m.imported_your_agency_url} target="_blank" rel="noopener noreferrer"
                                      className="text-blue-600 hover:underline block truncate"
                                      title={m.imported_your_agency_url}>
                                      {m.imported_your_agency_url.replace('https://gappsy.com', '')}
                                    </a>
                                  </td>
                                  <td className="px-3 py-2.5">
                                    {m.lookup_agency_name ? (
                                      <>
                                        <div className="font-medium text-gray-800 truncate max-w-[140px]" title={m.lookup_agency_name}>{m.lookup_agency_name}</div>
                                        <div className="text-gray-400 font-mono">{m.lookup_agency_id?.slice(0, 8)}…</div>
                                      </>
                                    ) : (
                                      <span className="text-gray-400 italic">not found</span>
                                    )}
                                  </td>
                                  <td className="px-3 py-2.5 max-w-[170px]">
                                    {m.lookup_your_agency_url ? (
                                      <a href={m.lookup_your_agency_url} target="_blank" rel="noopener noreferrer"
                                        className="text-blue-600 hover:underline block truncate"
                                        title={m.lookup_your_agency_url}>
                                        {m.lookup_your_agency_url.replace('https://gappsy.com', '')}
                                      </a>
                                    ) : (
                                      <span className="text-gray-400 italic">—</span>
                                    )}
                                  </td>
                                </tr>
                              ))}
                            </tbody>
                          </table>
                        </div>
                      )}
                    </div>
                  )}
                </div>
              )}
            </div>
          </div>
        )}

        {/* Credits Warning Modal */}
        {showCreditsWarning && creditsStatus && (
          <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
            <div className="bg-white rounded-lg shadow-xl max-w-md w-full mx-4">
              <div className="p-6">
                {creditsStatus.queue_auto_paused ? (
                  <>
                    <div className="flex items-center gap-3 mb-4">
                      <AlertTriangle className="w-6 h-6 text-red-600" />
                      <h3 className="text-lg font-semibold text-gray-900">Queue is Paused</h3>
                    </div>
                    <p className="text-sm text-gray-700 mb-4">
                      The verification queue has been automatically paused because ListClean credits are critical ({creditsStatus.credits} left, critical threshold: {creditsStatus.threshold_critical}).
                    </p>
                    <p className="text-sm text-gray-600 mb-6">
                      Please add more credits to your ListClean account. The queue will automatically resume once credits recover above {creditsStatus.threshold_warning}.
                    </p>
                    <div className="flex gap-3">
                      <button
                        onClick={() => setShowCreditsWarning(false)}
                        className="flex-1 px-4 py-2 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 font-medium"
                      >
                        Close
                      </button>
                      <button
                        onClick={() => {
                          setForceRunOverride(true);
                          handleProcessQueue(true);
                        }}
                        disabled={processingQueue}
                        className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50 disabled:cursor-not-allowed font-medium"
                      >
                        {processingQueue ? 'Running...' : 'Force Run Anyway'}
                      </button>
                    </div>
                  </>
                ) : (
                  <>
                    <div className="flex items-center gap-3 mb-4">
                      <AlertTriangle className="w-6 h-6 text-amber-600" />
                      <h3 className="text-lg font-semibold text-gray-900">Low Credits Warning</h3>
                    </div>
                    <p className="text-sm text-gray-700 mb-4">
                      ListClean credits are at the warning level ({creditsStatus.credits} left, warning threshold: {creditsStatus.threshold_warning}).
                    </p>
                    <p className="text-sm text-gray-600 mb-6">
                      Consider adding more credits soon. If they drop below {creditsStatus.threshold_critical}, the queue will automatically pause.
                    </p>
                    <div className="flex gap-3">
                      <button
                        onClick={() => {
                          setShowCreditsWarning(false);
                          handleProcessQueue(false);
                        }}
                        disabled={processingQueue}
                        className="flex-1 px-4 py-2 bg-amber-600 text-white rounded-lg hover:bg-amber-700 disabled:opacity-50 disabled:cursor-not-allowed font-medium"
                      >
                        {processingQueue ? 'Running...' : 'Continue Anyway'}
                      </button>
                      <button
                        onClick={() => setShowCreditsWarning(false)}
                        className="flex-1 px-4 py-2 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 font-medium"
                      >
                        Cancel
                      </button>
                    </div>
                  </>
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
