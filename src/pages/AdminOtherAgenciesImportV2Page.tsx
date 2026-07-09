import { useState, useEffect, useRef, useCallback } from "react";
import WpAdminLayout from "../components/wpadmin/WpAdminLayout";
import { useAdminSession } from "../contexts/AdminSessionContext";
import { parseExcelFile, convertParsedRowsToJSON } from "../utils/excelImportParser";

// ─── Types ────────────────────────────────────────────────────────────────────

type PageState =
  | "idle"
  | "uploading"
  | "staged"
  | "parsing"
  | "chunking"
  | "processing"
  | "completed"
  | "partial_success"
  | "failed"
  | "reauth_required";

interface JobStatus {
  id: string;
  state_slug: string;
  file_name: string;
  file_size_bytes: number;
  file_format: string;
  status: string;
  rows_read: number;
  rows_valid: number;
  chunks_total: number;
  chunks_processed: number;
  agencies_created: number;
  agencies_updated: number;
  emails_added: number;
  errors_count: number;
  error_message: string | null;
  last_checkpoint: string | null;
  progress_pct: number;
  created_at: string;
  updated_at: string;
  work_completed_at: string | null;
  // New enhanced metrics
  profiles_created?: number;
  profiles_already_existing?: number;
  duplicate_rows_skipped?: number;
  duplicate_agencies_skipped?: number;
  duplicate_emails_skipped?: number;
  failure_reason?: string | null;
  last_activity_at?: string | null;
  // Audit layer
  is_dry_run?: boolean;
  agencies_real_updated?: number;
  agencies_noop_updated?: number;
  match_domain_cross_state?: number;
  match_domain_same_state?: number;
  match_phone_same_state?: number;
  match_name_same_state?: number;
  suspicious_matches_count?: number;
}

interface AuditSummary {
  is_dry_run: boolean;
  agencies_real_updated: number;
  agencies_noop_updated: number;
  match_domain_cross_state: number;
  match_domain_same_state: number;
  match_phone_same_state: number;
  match_name_same_state: number;
  suspicious_matches_count: number;
}

interface SuspiciousSample {
  source_row_number: number;
  source_agency_name: string;
  source_state_slug: string;
  normalized_domain: string | null;
  matched_agency_id: string | null;
  matched_agency_slug: string | null;
  matched_agency_state_slug: string | null;
  match_method: string;
  cross_state: boolean;
  changed_fields_count: number;
  only_updated_at: boolean;
  suspicious_reason: string | null;
}

interface ChunkSummary {
  total: number;
  queued: number;
  processing: number;
  completed: number;
  failed: number;
  skipped: number;
}

interface ChunkInfo {
  chunk_index: number;
  status: string;
  agencies_created: number;
  agencies_updated: number;
  emails_added: number;
  errors_count: number;
  error_message: string | null;
  error_samples: string[] | null;
  retry_count: number;
  started_at: string | null;
  completed_at: string | null;
}

interface EventInfo {
  event_type: string;
  message: string;
  created_at: string;
}

const US_STATES = [
  { slug: "alabama", name: "Alabama" }, { slug: "alaska", name: "Alaska" },
  { slug: "arizona", name: "Arizona" }, { slug: "arkansas", name: "Arkansas" },
  { slug: "california", name: "California" }, { slug: "colorado", name: "Colorado" },
  { slug: "connecticut", name: "Connecticut" }, { slug: "delaware", name: "Delaware" },
  { slug: "district-of-columbia", name: "District of Columbia" }, { slug: "florida", name: "Florida" },
  { slug: "georgia", name: "Georgia" }, { slug: "hawaii", name: "Hawaii" },
  { slug: "idaho", name: "Idaho" }, { slug: "illinois", name: "Illinois" },
  { slug: "indiana", name: "Indiana" }, { slug: "iowa", name: "Iowa" },
  { slug: "kansas", name: "Kansas" }, { slug: "kentucky", name: "Kentucky" },
  { slug: "louisiana", name: "Louisiana" }, { slug: "maine", name: "Maine" },
  { slug: "maryland", name: "Maryland" }, { slug: "massachusetts", name: "Massachusetts" },
  { slug: "michigan", name: "Michigan" }, { slug: "minnesota", name: "Minnesota" },
  { slug: "mississippi", name: "Mississippi" }, { slug: "missouri", name: "Missouri" },
  { slug: "montana", name: "Montana" }, { slug: "nebraska", name: "Nebraska" },
  { slug: "nevada", name: "Nevada" }, { slug: "new-hampshire", name: "New Hampshire" },
  { slug: "new-jersey", name: "New Jersey" }, { slug: "new-mexico", name: "New Mexico" },
  { slug: "new-york", name: "New York" }, { slug: "north-carolina", name: "North Carolina" },
  { slug: "north-dakota", name: "North Dakota" }, { slug: "ohio", name: "Ohio" },
  { slug: "oklahoma", name: "Oklahoma" }, { slug: "oregon", name: "Oregon" },
  { slug: "pennsylvania", name: "Pennsylvania" }, { slug: "puerto-rico", name: "Puerto Rico" },
  { slug: "rhode-island", name: "Rhode Island" }, { slug: "south-carolina", name: "South Carolina" },
  { slug: "south-dakota", name: "South Dakota" }, { slug: "tennessee", name: "Tennessee" },
  { slug: "texas", name: "Texas" }, { slug: "utah", name: "Utah" },
  { slug: "vermont", name: "Vermont" }, { slug: "virginia", name: "Virginia" },
  { slug: "washington", name: "Washington" }, { slug: "west-virginia", name: "West Virginia" },
  { slug: "wisconsin", name: "Wisconsin" }, { slug: "wyoming", name: "Wyoming" },
];

const STATUS_LABELS: Record<string, string> = {
  idle: "Ready",
  uploading: "Uploading file...",
  staged: "File staged",
  parsing: "Parsing file...",
  chunking: "Creating chunks...",
  processing: "Processing rows...",
  completed: "Import complete",
  partial_success: "Partial success",
  failed: "Failed",
  reauth_required: "Auth required",
  auth_loading: "Checking session...",
  no_auth: "Login required",
};

const STATUS_COLORS: Record<string, string> = {
  idle: "bg-gray-100 text-gray-600",
  uploading: "bg-blue-100 text-blue-700",
  staged: "bg-blue-100 text-blue-700",
  parsing: "bg-blue-100 text-blue-700",
  chunking: "bg-blue-100 text-blue-700",
  processing: "bg-amber-100 text-amber-700",
  completed: "bg-green-100 text-green-700",
  partial_success: "bg-yellow-100 text-yellow-700",
  failed: "bg-red-100 text-red-700",
  reauth_required: "bg-orange-100 text-orange-700",
  auth_loading: "bg-gray-100 text-gray-500",
  no_auth: "bg-orange-100 text-orange-700",
  queued: "bg-gray-100 text-gray-500",
};

const TERMINAL_STATUSES = ["completed", "partial_success", "failed", "cancelled"];

function fmt(n: number) { return n.toLocaleString(); }
function fmtBytes(b: number) {
  if (b < 1024) return `${b} B`;
  if (b < 1024 * 1024) return `${(b / 1024).toFixed(1)} KB`;
  return `${(b / 1024 / 1024).toFixed(2)} MB`;
}
function fmtTime(iso: string) {
  return new Date(iso).toLocaleTimeString();
}
function fmtExpiry(ms: number | null): string {
  if (!ms) return "unknown";
  const diff = ms - Date.now();
  if (diff <= 0) return "expired";
  const h = Math.floor(diff / 3600000);
  const m = Math.floor((diff % 3600000) / 60000);
  return h > 0 ? `${h}h ${m}m` : `${m}m`;
}

// ─── Component ────────────────────────────────────────────────────────────────

export default function AdminOtherAgenciesImportV2Page() {
  const { token: adminToken, expiresAt: tokenExpiresAt, status: sessionStatus, login } = useAdminSession();

  const supabaseUrl = import.meta.env.VITE_SUPABASE_URL ?? "";
  const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY ?? "";

  // ─── Core state ─────────────────────────────────────────────────────────────
  const [pageState, setPageState] = useState<PageState>("idle");
  const [stateSlug, setStateSlug] = useState("new-jersey");
  const [file, setFile] = useState<File | null>(null);
  const [jobId, setJobId] = useState<string | null>(null);
  const [jobStatus, setJobStatus] = useState<JobStatus | null>(null);
  const [chunks, setChunks] = useState<ChunkInfo[]>([]);
  const [events, setEvents] = useState<EventInfo[]>([]);
  const [errorMsg, setErrorMsg] = useState<string | null>(null);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [showDiagnostics, setShowDiagnostics] = useState(true);
  const [showChunks, setShowChunks] = useState(false);
  const [recentJobs, setRecentJobs] = useState<JobStatus[]>([]);
  const [loadingRecent, setLoadingRecent] = useState(false);
  const [isDragOver, setIsDragOver] = useState(false);
  const [chunkSummary, setChunkSummary] = useState<ChunkSummary | null>(null);
  const [staleChunks, setStaleChunks] = useState(0);
  const [isStuck, setIsStuck] = useState(false);
  const [needsResume, setNeedsResume] = useState(false);
  const [stallReason, setStallReason] = useState<string | null>(null);
  const [lastWorkerFailEvent, setLastWorkerFailEvent] = useState<{ event_type: string; message: string; created_at: string } | null>(null);
  const [resumeLoading, setResumeLoading] = useState(false);
  const [resumeResult, setResumeResult] = useState<string | null>(null);
  const [rebuildLoading, setRebuildLoading] = useState(false);
  const [rebuildResult, setRebuildResult] = useState<string | null>(null);

  // ─── Dry-run + audit state ───────────────────────────────────────────────────
  const [isDryRun, setIsDryRun] = useState(false);
  const [auditSummary, setAuditSummary] = useState<AuditSummary | null>(null);
  const [suspiciousSamples, setSuspiciousSamples] = useState<SuspiciousSample[]>([]);
  const [showAuditPanel, setShowAuditPanel] = useState(false);

  // ─── Client-side XLSX parsing ──────────────────────────────────────────────
  const [isParsingXlsx, setIsParsingXlsx] = useState(false);
  const [parseProgress, setParseProgress] = useState<string | null>(null);
  const [parsedRowCount, setParsedRowCount] = useState<number>(0);

  // ─── Bulk selection & delete ────────────────────────────────────────────────
  const [selectedJobIds, setSelectedJobIds] = useState<Set<string>>(new Set());
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);
  const [deleteLoading, setDeleteLoading] = useState(false);
  const [deleteResult, setDeleteResult] = useState<{ success: boolean; message: string } | null>(null);

  // ─── Details modal ───────────────────────────────────────────────────────────
  const [detailsJob, setDetailsJob] = useState<JobStatus | null>(null);
  const [showDetailsModal, setShowDetailsModal] = useState(false);

  // ─── Re-auth form ────────────────────────────────────────────────────────────
  const [reauthSecret, setReauthSecret] = useState("");
  const [reauthError, setReauthError] = useState<string | null>(null);
  const [reauthLoading, setReauthLoading] = useState(false);

  // ─── Diagnostics state ──────────────────────────────────────────────────────
  // Re-auth tracking
  const [reauthTriggeredBy, setReauthTriggeredBy] = useState<string | null>(null);
  const [lastReauthTrigger, setLastReauthTrigger] = useState<string | null>(null);
  const [reauthCompleted, setReauthCompleted] = useState(false);
  const [recoveryApplied, setRecoveryApplied] = useState(false);
  const [postReauthPageState, setPostReauthPageState] = useState<string | null>(null);
  const [postReauthCanStart, setPostReauthCanStart] = useState<boolean | null>(null);
  const [postReauthJobId, setPostReauthJobId] = useState<string | null>(null);
  // Upload/poll tracking
  const [lastFileEvent, setLastFileEvent] = useState<string | null>(null);
  const [lastUploadStartedAt, setLastUploadStartedAt] = useState<string | null>(null);
  const [lastUploadResponseStatus, setLastUploadResponseStatus] = useState<number | null>(null);
  const [lastPollResponseStatus, setLastPollResponseStatus] = useState<number | null>(null);
  const [isPollingActive, setIsPollingActive] = useState(false);

  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  // ─── Token ref: always current — prevents stale closures in poll interval ──
  const adminTokenRef = useRef<string | null>(adminToken);
  useEffect(() => { adminTokenRef.current = adminToken; }, [adminToken]);

  // ─── JobId ref: lets polling self-resume after re-auth ──────────────────────
  const jobIdRef = useRef<string | null>(jobId);
  useEffect(() => { jobIdRef.current = jobId; }, [jobId]);

  // ─── Contradictory-state reconciliation ──────────────────────────────────────
  // If page got stuck in reauth_required but session is now valid, auto-recover.
  useEffect(() => {
    if (pageState === "reauth_required" && sessionStatus === "valid" && adminToken) {
      setLastReauthTrigger(prev => reauthTriggeredBy ?? prev);
      setReauthTriggeredBy(null);
      setPageState("idle");
      setErrorMsg(null);
      setReauthCompleted(true);
      setRecoveryApplied(true);
      setPostReauthPageState("idle");
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pageState, sessionStatus, adminToken]);

  // ─── Poll job status ──────────────────────────────────────────────────────────
  // Returns the parsed job object so callers don't rely on stale React state.
  const pollStatus = useCallback(async (id: string): Promise<JobStatus | null> => {
    const token = adminTokenRef.current;
    if (!token) {
      setReauthTriggeredBy("poll — token missing at poll time");
      setPageState("reauth_required");
      return null;
    }
    try {
      const res = await fetch(
        `${supabaseUrl}/functions/v1/other-agencies-import-v2-status?job_id=${id}`,
        { headers: { Authorization: `Bearer ${anonKey}`, apikey: anonKey, 'x-admin-token': token } }
      );

      setLastPollResponseStatus(res.status);

      if (res.status === 401) {
        setReauthTriggeredBy("poll — 401 from status endpoint");
        stopPolling();
        setPageState("reauth_required");
        return null;
      }
      if (!res.ok) return null;

      const data = await res.json();
      if (!data.ok || !data.job) return null;

      const job: JobStatus = data.job;
      setJobStatus(job);
      setChunks(data.chunks ?? []);
      setEvents(data.events ?? []);
      setChunkSummary(data.chunk_summary ?? null);
      setStaleChunks(data.stale_chunks ?? 0);
      setIsStuck(data.is_stuck ?? false);
      setNeedsResume(data.needs_resume ?? false);
      setStallReason(data.stall_reason ?? null);
      setLastWorkerFailEvent(data.last_worker_fail_event ?? null);
      if (data.audit_summary) setAuditSummary(data.audit_summary);
      if (data.suspicious_samples) setSuspiciousSamples(data.suspicious_samples);

      if (TERMINAL_STATUSES.includes(job.status)) {
        setPageState(job.status as PageState);
        stopPolling();
      } else {
        setPageState(job.status as PageState);
      }

      return job;
    } catch {
      return null;
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [supabaseUrl, anonKey]);

  const stopPolling = useCallback(() => {
    if (pollRef.current) {
      clearInterval(pollRef.current);
      pollRef.current = null;
      setIsPollingActive(false);
    }
  }, []);

  const startPolling = useCallback((id: string) => {
    stopPolling();
    pollRef.current = setInterval(() => pollStatus(id), 2500);
    setIsPollingActive(true);
  }, [pollStatus, stopPolling]);

  useEffect(() => () => stopPolling(), [stopPolling]);

  // ─── Load recent jobs ─────────────────────────────────────────────────────────
  const loadRecentJobs = useCallback(async () => {
    const token = adminTokenRef.current;
    if (!token) return;
    setLoadingRecent(true);
    try {
      const res = await fetch(`${supabaseUrl}/functions/v1/other-agencies-import-v2-status`, {
        headers: { Authorization: `Bearer ${anonKey}`, apikey: anonKey, 'x-admin-token': token },
      });
      if (res.status === 401) {
        setReauthTriggeredBy("loadRecentJobs — 401 from status endpoint");
        setPageState("reauth_required");
        return;
      }
      if (res.ok) {
        const data = await res.json();
        setRecentJobs(data.jobs ?? []);
      }
    } finally {
      setLoadingRecent(false);
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [supabaseUrl, anonKey]);

  useEffect(() => { loadRecentJobs(); }, [loadRecentJobs]);

  // ─── File selection ───────────────────────────────────────────────────────────
  function applyFile(f: File) {
    setFile(f);
    setErrorMsg(null);
    setLastFileEvent(`selected: ${f.name} (${fmtBytes(f.size)}) at ${new Date().toLocaleTimeString()}`);
  }

  function handleFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const f = e.target.files?.[0];
    if (f) applyFile(f);
  }

  function handleDragOver(e: React.DragEvent) {
    e.preventDefault();
    setIsDragOver(true);
  }

  function handleDragLeave() {
    setIsDragOver(false);
  }

  function handleDrop(e: React.DragEvent) {
    e.preventDefault();
    setIsDragOver(false);
    const f = e.dataTransfer.files?.[0];
    if (f) applyFile(f);
  }

  // ─── Start import ──────────────────────────────────────────────────────────────
  async function handleStartImport() {
    if (!file || !stateSlug) return;
    const token = adminTokenRef.current;
    if (!token) {
      setReauthTriggeredBy("start-import click — no token at click time");
      setPageState("reauth_required");
      return;
    }

    setErrorMsg(null);
    setJobId(null);
    setJobStatus(null);
    setChunks([]);
    setEvents([]);
    setUploadProgress(0);
    setLastUploadResponseStatus(null);
    setLastPollResponseStatus(null);
    setReauthTriggeredBy(null);
    setLastReauthTrigger(null);
    setReauthCompleted(false);
    setRecoveryApplied(false);
    setPostReauthPageState(null);
    setPostReauthCanStart(null);
    setPostReauthJobId(null);
    setLastUploadStartedAt(new Date().toISOString());
    setIsParsingXlsx(false);
    setParseProgress(null);
    setParsedRowCount(0);
    setAuditSummary(null);
    setSuspiciousSamples([]);
    setShowAuditPanel(false);

    // ═══ DETECT XLSX/XLS AND PARSE CLIENT-SIDE ═══
    const fileExt = file.name.split('.').pop()?.toLowerCase();
    const isXlsx = fileExt === 'xlsx' || fileExt === 'xls';

    let fileToUpload: File | Blob = file;
    let uploadFileName = file.name;
    let effectiveFileType = fileExt ?? 'unknown';

    if (isXlsx) {
      try {
        setPageState("uploading");
        setIsParsingXlsx(true);
        setParseProgress("Reading spreadsheet...");

        // Use the existing battle-tested client-side parser
        const parsedRows = await parseExcelFile(file);

        setParseProgress(`Parsed ${parsedRows.length} valid rows with names`);
        setParsedRowCount(parsedRows.length);

        // Convert to JSON
        const jsonContent = convertParsedRowsToJSON(parsedRows);

        setParseProgress("Converting to normalized format...");

        // Create a JSON blob to upload instead of raw XLSX
        fileToUpload = new Blob([jsonContent], { type: 'application/json' });
        uploadFileName = file.name.replace(/\.xlsx?$/i, '.normalized.json');
        effectiveFileType = 'json';

        setParseProgress("Ready to upload normalized data");

        // Show user what we parsed
        console.log(`[XLSX Parser] Parsed ${parsedRows.length} agencies from ${file.name}`);
        console.log(`[XLSX Parser] First row sample:`, parsedRows[0]);
      } catch (parseErr) {
        setIsParsingXlsx(false);
        setPageState("failed");
        const errMsg = parseErr instanceof Error ? parseErr.message : String(parseErr);
        setErrorMsg(`XLSX parsing failed: ${errMsg}`);
        console.error("[XLSX Parser] Client-side parse failed:", parseErr);
        return;
      }
    }

    // ═══ UPLOAD (normalized JSON for XLSX, raw file for CSV/JSON) ═══
    setPageState("uploading");
    setIsParsingXlsx(false);

    try {
      const formData = new FormData();
      formData.append("admin_token", token);
      formData.append("state_slug", stateSlug);
      formData.append("file", fileToUpload, uploadFileName);
      formData.append("dry_run", isDryRun ? "true" : "false");

      // Tell backend this is pre-normalized from XLSX
      if (isXlsx) {
        formData.append("pre_normalized", "true");
        formData.append("original_filename", file.name);
      }

      const progressInterval = setInterval(() => {
        setUploadProgress(p => Math.min(p + 8, 85));
      }, 200);

      const res = await fetch(`${supabaseUrl}/functions/v1/other-agencies-import-v2-upload`, {
        method: "POST",
        headers: { Authorization: `Bearer ${anonKey}`, apikey: anonKey },
        body: formData,
      });

      clearInterval(progressInterval);
      setUploadProgress(100);
      setLastUploadResponseStatus(res.status);

      const data = await res.json();

      if (res.status === 401) {
        setReauthTriggeredBy(`upload POST — 401 from upload endpoint: ${data?.message ?? data?.error ?? "no detail"}`);
        setPageState("reauth_required");
        setErrorMsg("Session expired during upload. Log in again — your file and state are preserved.");
        return;
      }

      if (!res.ok || !data.ok) {
        setPageState("failed");
        setErrorMsg(`Upload failed [HTTP ${res.status}]: ${data?.message ?? data?.error ?? "unknown error"}`);
        return;
      }

      const newJobId = data.job_id;
      setJobId(newJobId);
      setPageState("staged");
      const latestJob = await pollStatus(newJobId);
      if (latestJob && !TERMINAL_STATUSES.includes(latestJob.status)) {
        startPolling(newJobId);
      }
    } catch (err) {
      setPageState("failed");
      setErrorMsg(err instanceof Error ? `Request failed: ${err.message}` : "Unknown upload error");
    }
  }

  // ─── Re-auth handler ───────────────────────────────────────────────────────────
  async function handleReauth(e: React.FormEvent) {
    e.preventDefault();
    if (!reauthSecret.trim()) return;
    setReauthLoading(true);
    setReauthError(null);
    const result = await login(reauthSecret.trim());
    setReauthLoading(false);

    if (result.ok) {
      setLastReauthTrigger(reauthTriggeredBy);
      setReauthTriggeredBy(null);
      setReauthCompleted(true);
      setReauthSecret("");
      setErrorMsg(null);
      setPageState("idle");
      setRecoveryApplied(true);
      setPostReauthPageState("idle");
      setPostReauthCanStart(!!file && !!stateSlug);

      const currentJobId = jobIdRef.current;
      if (currentJobId) {
        setPostReauthJobId(currentJobId);
        // Use return value — not stale outer jobStatus state
        const latestJob = await pollStatus(currentJobId);
        if (latestJob && !TERMINAL_STATUSES.includes(latestJob.status)) {
          startPolling(currentJobId);
        }
      }
    } else {
      setReauthError(result.error ?? "Login failed");
    }
  }

  // ─── Reset ─────────────────────────────────────────────────────────────────────
  function handleReset() {
    stopPolling();
    setPageState("idle");
    setFile(null);
    setJobId(null);
    setJobStatus(null);
    setChunks([]);
    setEvents([]);
    setErrorMsg(null);
    setUploadProgress(0);
    setIsDragOver(false);
    setReauthTriggeredBy(null);
    setLastReauthTrigger(null);
    setReauthCompleted(false);
    setRecoveryApplied(false);
    setPostReauthPageState(null);
    setPostReauthCanStart(null);
    setPostReauthJobId(null);
    setLastFileEvent(null);
    setLastUploadStartedAt(null);
    setLastUploadResponseStatus(null);
    setLastPollResponseStatus(null);
    setAuditSummary(null);
    setSuspiciousSamples([]);
    setShowAuditPanel(false);
    if (fileInputRef.current) fileInputRef.current.value = "";
    loadRecentJobs();
  }

  // ─── Resume handler ──────────────────────────────────────────────────────────
  async function handleResume(targetJobId: string) {
    const token = adminTokenRef.current;
    if (!token) {
      setReauthTriggeredBy("resume — no token");
      setPageState("reauth_required");
      return;
    }
    setResumeLoading(true);
    setResumeResult(null);
    try {
      const res = await fetch(`${supabaseUrl}/functions/v1/other-agencies-import-v2-resume`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${anonKey}`,
          apikey: anonKey,
          "Content-Type": "application/json",
          "x-admin-token": token,
        },
        body: JSON.stringify({ job_id: targetJobId }),
      });
      if (res.status === 401) {
        setReauthTriggeredBy("resume — 401");
        setPageState("reauth_required");
        return;
      }
      const data = await res.json();
      if (data.ok) {
        const logicOk = data.runners_logic_ok ?? 0;
        const attempted = data.runners_attempted ?? 0;
        const recovered = data.recovered ?? 0;
        const queuedBefore = data.queued_before ?? 0;
        const processingBefore = data.processing_before ?? 0;

        const failedSamples = (data.failed_samples as string[]) ?? [];
        const firstFailSample = failedSamples.length > 0 ? failedSamples[0] : "";

        let msg: string;
        if (data.action === "finalized") {
          msg = `Job finalized (${data.message ?? "done"})`;
        } else if (data.action === "resumed" && logicOk > 0) {
          msg = `Resumed: ${logicOk}/${attempted} workers started, ${queuedBefore} queued, ${processingBefore} active${recovered > 0 ? `, ${recovered} stale chunks recovered` : ""}`;
        } else if (data.action === "resume_failed_workers_did_not_start") {
          msg = `Resume failed -- workers could not claim chunks. ${firstFailSample || data.message || "No error detail"}`;
        } else if (data.action === "resume_failed_dispatch_unreachable") {
          msg = `Resume failed -- dispatch unreachable: ${data.message ?? "unknown"}`;
        } else if (data.action === "resumed") {
          msg = `Resumed: dispatch=${data.dispatch?.action ?? "unknown"}${recovered > 0 ? `, ${recovered} recovered` : ""}`;
        } else {
          msg = `${data.action}: ${data.message ?? "unknown"}`;
        }
        setResumeResult(msg);

        if (data.action === "resumed" && logicOk > 0) {
          setJobId(targetJobId);
          setPageState("processing");
          startPolling(targetJobId);
        } else if (data.action === "finalized") {
          await pollStatus(targetJobId);
        }
      } else {
        const failedSamples = (data.failed_samples as string[]) ?? [];
        const firstSample = failedSamples.length > 0 ? failedSamples[0] : "";
        const detail = data.message ?? data.error ?? "unknown";
        const fullMsg = firstSample && !detail.includes(firstSample)
          ? `Resume failed: ${detail} | ${firstSample}`
          : `Resume failed: ${detail}`;
        setResumeResult(fullMsg);
      }
    } catch (err) {
      setResumeResult(`Request failed: ${err instanceof Error ? err.message : String(err)}`);
    } finally {
      setResumeLoading(false);
    }
  }

  // ─── Bulk delete handler ──────────────────────────────────────────────────────
  async function handleBulkDelete() {
    if (selectedJobIds.size === 0) return;
    const token = adminTokenRef.current;
    if (!token) {
      setReauthTriggeredBy("bulk delete — no token");
      setPageState("reauth_required");
      return;
    }

    setDeleteLoading(true);
    setDeleteResult(null);

    try {
      const res = await fetch(`${supabaseUrl}/functions/v1/other-agencies-import-v2-delete`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${anonKey}`,
          apikey: anonKey,
          "Content-Type": "application/json",
          "x-admin-token": token,
        },
        body: JSON.stringify({ job_ids: Array.from(selectedJobIds) }),
      });

      if (res.status === 401) {
        setReauthTriggeredBy("bulk delete — 401");
        setPageState("reauth_required");
        return;
      }

      const data = await res.json();

      if (data.ok || data.deleted_count > 0) {
        setDeleteResult({
          success: true,
          message: data.message || `Deleted ${data.deleted_count} import job(s)`,
        });
        setSelectedJobIds(new Set());
        setShowDeleteConfirm(false);
        await loadRecentJobs();
      } else {
        setDeleteResult({
          success: false,
          message: data.message || data.error || "Delete failed",
        });
      }
    } catch (err) {
      setDeleteResult({
        success: false,
        message: err instanceof Error ? err.message : "Delete request failed",
      });
    } finally {
      setDeleteLoading(false);
    }
  }

  function toggleJobSelection(jobId: string) {
    setSelectedJobIds(prev => {
      const next = new Set(prev);
      if (next.has(jobId)) {
        next.delete(jobId);
      } else {
        next.add(jobId);
      }
      return next;
    });
  }

  function toggleSelectAll() {
    if (selectedJobIds.size === recentJobs.length && recentJobs.length > 0) {
      setSelectedJobIds(new Set());
    } else {
      setSelectedJobIds(new Set(recentJobs.map(j => j.id)));
    }
  }

  function selectByStatus(status: string) {
    const matching = recentJobs.filter(j => j.status === status).map(j => j.id);
    setSelectedJobIds(new Set(matching));
  }

  // ─── Rebuild /your-agency index handler ──────────────────────────────────────
  async function handleRebuildIndex() {
    const token = adminTokenRef.current;
    if (!token) {
      setReauthTriggeredBy("rebuild — no token");
      setPageState("reauth_required");
      return;
    }
    setRebuildLoading(true);
    setRebuildResult(null);
    try {
      const res = await fetch(`${supabaseUrl}/functions/v1/your-agency-rebuild-index`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${anonKey}`,
          apikey: anonKey,
          "Content-Type": "application/json",
          "x-admin-token": token,
        },
      });
      if (res.status === 401) {
        setReauthTriggeredBy("rebuild — 401");
        setPageState("reauth_required");
        return;
      }
      const data = await res.json();
      if (data.ok) {
        const searchCount = data.search_rebuild?.unique_agencies ?? 0;
        const listingsCount = data.listings_rebuild?.processed_count ?? 0;
        const searchDuration = data.search_rebuild?.duration_ms ?? 0;
        const listingsDuration = data.listings_rebuild?.duration_ms ?? 0;
        setRebuildResult(`Success: ${searchCount} search agencies, ${listingsCount} profile listings. Duration: ${searchDuration}ms + ${listingsDuration}ms`);
      } else {
        setRebuildResult(`Rebuild failed: ${data.error ?? "unknown error"}`);
      }
    } catch (err) {
      setRebuildResult(`Request failed: ${err instanceof Error ? err.message : String(err)}`);
    } finally {
      setRebuildLoading(false);
    }
  }

  // ─── Derived state ─────────────────────────────────────────────────────────────
  const isTerminal = TERMINAL_STATUSES.includes(pageState);
  const isBusy = ["uploading", "staged", "parsing", "chunking", "processing"].includes(pageState) || isParsingXlsx;

  type DisabledReason = "page_not_idle" | "missing_file" | "missing_state" | null;
  const disabledReason: DisabledReason = (() => {
    if (pageState !== "idle") return "page_not_idle";
    if (!file) return "missing_file";
    if (!stateSlug) return "missing_state";
    return null;
  })();
  const canStartButton = disabledReason === null;

  type ClickGateResult = "start_upload" | "reauth_required" | "missing_file" | "missing_state" | "page_not_idle";
  const clickGateResult: ClickGateResult = (() => {
    if (pageState !== "idle") return "page_not_idle";
    if (!file) return "missing_file";
    if (!stateSlug) return "missing_state";
    if (!adminToken) return "reauth_required";
    return "start_upload";
  })();

  const progressPct = pageState === "uploading" ? uploadProgress : (jobStatus?.progress_pct ?? 0);

  const chipState: string = (() => {
    if (pageState === "reauth_required") return "reauth_required";
    if (pageState === "idle" && sessionStatus === "loading") return "auth_loading";
    if (pageState === "idle" && !adminToken) return "no_auth";
    return pageState;
  })();

  const showReauthBlock =
    pageState === "reauth_required" ||
    (pageState === "idle" && sessionStatus !== "loading" && !adminToken);

  // ─── Modal components ─────────────────────────────────────────────────────────

  const DetailsModal = () => {
    if (!showDetailsModal || !detailsJob) return null;

    return (
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setShowDetailsModal(false)}>
        <div className="bg-white rounded-2xl shadow-xl max-w-3xl w-full max-h-[90vh] overflow-hidden" onClick={e => e.stopPropagation()}>
          <div className="px-6 py-4 border-b border-gray-200 flex items-center justify-between">
            <h2 className="text-lg font-bold text-gray-900">Import Details</h2>
            <button onClick={() => setShowDetailsModal(false)} className="text-gray-400 hover:text-gray-600">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <div className="p-6 space-y-4 overflow-y-auto max-h-[calc(90vh-120px)]">
            <div className="grid grid-cols-2 gap-4">
              <DetailRow label="State" value={detailsJob.state_slug} />
              <DetailRow label="Status" value={<span className={`px-2 py-1 rounded text-xs font-medium ${STATUS_COLORS[detailsJob.status]}`}>{detailsJob.status}</span>} />
              <DetailRow label="File name" value={detailsJob.file_name} className="col-span-2" />
              <DetailRow label="File size" value={fmtBytes(detailsJob.file_size_bytes)} />
              <DetailRow label="Format" value={detailsJob.file_format.toUpperCase()} />
            </div>

            <div className="border-t border-gray-200 pt-4">
              <h3 className="text-sm font-semibold text-gray-700 mb-3">Progress Metrics</h3>
              <div className="grid grid-cols-2 gap-4">
                <DetailRow label="Rows read" value={fmt(detailsJob.rows_read)} />
                <DetailRow label="Rows valid" value={fmt(detailsJob.rows_valid)} />
                <DetailRow label="Chunks total" value={fmt(detailsJob.chunks_total)} />
                <DetailRow label="Chunks processed" value={fmt(detailsJob.chunks_processed)} />
              </div>
            </div>

            <div className="border-t border-gray-200 pt-4">
              <h3 className="text-sm font-semibold text-gray-700 mb-3">Import Results</h3>
              {detailsJob.is_dry_run && (
                <div className="mb-3 px-3 py-2 bg-amber-50 border border-amber-300 rounded-lg">
                  <p className="text-xs font-bold text-amber-800">DRY RUN — no rows were mutated</p>
                </div>
              )}
              <div className="grid grid-cols-2 gap-4">
                <DetailRow label="Agencies created" value={fmt(detailsJob.agencies_created)} highlight="green" />
                <DetailRow label="Matched existing" value={fmt(detailsJob.agencies_updated)} highlight="blue" />
                {detailsJob.agencies_real_updated !== undefined && (
                  <DetailRow label="Real updates" value={fmt(detailsJob.agencies_real_updated)} highlight="green" />
                )}
                {detailsJob.agencies_noop_updated !== undefined && (
                  <DetailRow label="No-op updates" value={fmt(detailsJob.agencies_noop_updated)} />
                )}
                <DetailRow label="Emails added" value={fmt(detailsJob.emails_added)} />
                {(detailsJob.suspicious_matches_count !== undefined && detailsJob.suspicious_matches_count > 0) && (
                  <DetailRow label="Suspicious matches" value={fmt(detailsJob.suspicious_matches_count)} highlight="red" />
                )}
                {(detailsJob.profiles_created !== undefined && detailsJob.profiles_created > 0) && (
                  <DetailRow label="Profiles created" value={fmt(detailsJob.profiles_created)} highlight="green" />
                )}
              </div>
              {(detailsJob.match_domain_same_state !== undefined || detailsJob.match_domain_cross_state !== undefined) && (
                <div className="mt-3 pt-3 border-t border-gray-100">
                  <p className="text-xs font-semibold text-gray-500 mb-2">Match methods</p>
                  <div className="grid grid-cols-2 gap-2 text-xs">
                    {detailsJob.match_domain_same_state !== undefined && <span className="text-gray-600">Domain same-state: <strong>{fmt(detailsJob.match_domain_same_state)}</strong></span>}
                    {detailsJob.match_domain_cross_state !== undefined && <span className={detailsJob.match_domain_cross_state > 0 ? "text-amber-700 font-semibold" : "text-gray-600"}>Domain cross-state: <strong>{fmt(detailsJob.match_domain_cross_state)}</strong></span>}
                    {detailsJob.match_phone_same_state !== undefined && <span className="text-gray-600">Phone same-state: <strong>{fmt(detailsJob.match_phone_same_state)}</strong></span>}
                    {detailsJob.match_name_same_state !== undefined && <span className="text-gray-600">Name same-state: <strong>{fmt(detailsJob.match_name_same_state)}</strong></span>}
                  </div>
                </div>
              )}
            </div>

            {(detailsJob.duplicate_rows_skipped || detailsJob.duplicate_agencies_skipped || detailsJob.duplicate_emails_skipped) && (
              <div className="border-t border-gray-200 pt-4">
                <h3 className="text-sm font-semibold text-gray-700 mb-3">Duplicates Skipped</h3>
                <div className="grid grid-cols-2 gap-4">
                  {detailsJob.duplicate_rows_skipped > 0 && <DetailRow label="Duplicate rows" value={fmt(detailsJob.duplicate_rows_skipped)} />}
                  {detailsJob.duplicate_agencies_skipped > 0 && <DetailRow label="Duplicate agencies" value={fmt(detailsJob.duplicate_agencies_skipped)} />}
                  {detailsJob.duplicate_emails_skipped > 0 && <DetailRow label="Duplicate emails" value={fmt(detailsJob.duplicate_emails_skipped)} />}
                </div>
              </div>
            )}

            <div className="border-t border-gray-200 pt-4">
              <h3 className="text-sm font-semibold text-gray-700 mb-3">Timestamps</h3>
              <div className="grid grid-cols-2 gap-4">
                <DetailRow label="Started" value={new Date(detailsJob.created_at).toLocaleString()} />
                {detailsJob.work_completed_at && (
                  <DetailRow label="Completed" value={new Date(detailsJob.work_completed_at).toLocaleString()} />
                )}
                {detailsJob.last_activity_at && (
                  <DetailRow label="Last activity" value={new Date(detailsJob.last_activity_at).toLocaleString()} />
                )}
              </div>
            </div>

            {(detailsJob.error_message || detailsJob.failure_reason) && (
              <div className="border-t border-gray-200 pt-4">
                <h3 className="text-sm font-semibold text-red-700 mb-3">Error Information</h3>
                {detailsJob.failure_reason && (
                  <DetailRow label="Failure reason" value={detailsJob.failure_reason} className="mb-2" />
                )}
                {detailsJob.error_message && (
                  <div className="bg-red-50 border border-red-200 rounded-lg p-3">
                    <p className="text-xs text-red-600 font-mono break-all">{detailsJob.error_message}</p>
                  </div>
                )}
              </div>
            )}

            {detailsJob.last_checkpoint && (
              <div className="border-t border-gray-200 pt-4">
                <h3 className="text-sm font-semibold text-gray-700 mb-2">Last Checkpoint</h3>
                <p className="text-xs text-gray-600 font-mono bg-gray-50 p-3 rounded-lg">{detailsJob.last_checkpoint}</p>
              </div>
            )}

            <div className="text-xs text-gray-400 font-mono pt-2 border-t border-gray-100">
              Job ID: {detailsJob.id}
            </div>
          </div>
        </div>
      </div>
    );
  };

  const DeleteConfirmModal = () => {
    if (!showDeleteConfirm) return null;

    return (
      <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={() => setShowDeleteConfirm(false)}>
        <div className="bg-white rounded-2xl shadow-xl max-w-md w-full" onClick={e => e.stopPropagation()}>
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-lg font-bold text-gray-900">Confirm Delete</h2>
          </div>

          <div className="p-6 space-y-4">
            <p className="text-sm text-gray-700">
              You are about to delete <span className="font-bold text-red-600">{selectedJobIds.size}</span> import job{selectedJobIds.size > 1 ? "s" : ""}.
            </p>

            <div className="bg-amber-50 border border-amber-200 rounded-lg p-4">
              <p className="text-xs font-semibold text-amber-800 mb-1">What gets deleted:</p>
              <ul className="text-xs text-amber-700 space-y-0.5 list-disc list-inside">
                <li>Import job records</li>
                <li>Chunk processing data</li>
                <li>Event logs</li>
              </ul>

              <p className="text-xs font-semibold text-amber-800 mt-3 mb-1">What is preserved:</p>
              <ul className="text-xs text-amber-700 space-y-0.5 list-disc list-inside">
                <li>Imported agency data</li>
                <li>Email records</li>
                <li>/your-agency profiles</li>
              </ul>
            </div>

            <p className="text-xs text-gray-500">
              This only removes import history and logs. Real business data is NOT affected.
            </p>

            {deleteResult && (
              <div className={`rounded-lg p-3 ${deleteResult.success ? "bg-green-50 border border-green-200" : "bg-red-50 border border-red-200"}`}>
                <p className={`text-sm font-medium ${deleteResult.success ? "text-green-700" : "text-red-700"}`}>
                  {deleteResult.message}
                </p>
              </div>
            )}
          </div>

          <div className="px-6 py-4 border-t border-gray-200 flex gap-3 justify-end">
            <button
              onClick={() => setShowDeleteConfirm(false)}
              className="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200"
            >
              Cancel
            </button>
            <button
              onClick={handleBulkDelete}
              disabled={deleteLoading}
              className="px-4 py-2 text-sm font-semibold text-white bg-red-600 rounded-lg hover:bg-red-700 disabled:opacity-50"
            >
              {deleteLoading ? "Deleting..." : `Delete ${selectedJobIds.size} job${selectedJobIds.size > 1 ? "s" : ""}`}
            </button>
          </div>
        </div>
      </div>
    );
  };

  return (
    <WpAdminLayout title="Import Other Agencies V2">
      <DetailsModal />
      <DeleteConfirmModal />
      <div className="max-w-4xl mx-auto space-y-6 pb-16">

        {/* ── Header ── */}
        <div className="flex items-start justify-between">
          <div>
            <div className="flex items-center gap-3">
              <h1 className="text-2xl font-bold text-gray-900">Import Other Agencies</h1>
              <span className="px-2 py-0.5 text-xs font-bold bg-blue-600 text-white rounded-full tracking-wider">V2</span>
            </div>
            <p className="mt-1 text-sm text-gray-500">
              Real background processing, real progress, no fake success.
            </p>
          </div>
          <a href="/wp-admin/other-agencies-import" className="text-xs text-gray-400 hover:text-gray-600 underline">
            Switch to V1
          </a>
        </div>

        {/* ── Inline re-auth block ── */}
        {showReauthBlock && (
          <div className="rounded-xl border border-orange-200 bg-orange-50 p-5">
            <p className="font-semibold text-orange-800 mb-0.5">
              {pageState === "reauth_required" ? "Session expired — log in to continue" : "Admin login required"}
            </p>
            <p className="text-sm text-orange-700 mb-1">
              {pageState === "reauth_required"
                ? "Your session expired. Log in again — your selected file and state are preserved."
                : "You must be logged in as admin to start an import."}
            </p>
            {reauthTriggeredBy && (
              <p className="text-xs text-orange-500 font-mono mb-3">Triggered by: {reauthTriggeredBy}</p>
            )}
            <form onSubmit={handleReauth} className="flex gap-2 items-start flex-wrap">
              <input
                type="password"
                placeholder="Admin secret"
                value={reauthSecret}
                onChange={e => setReauthSecret(e.target.value)}
                className="flex-1 min-w-[200px] rounded-lg border border-orange-300 bg-white px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400"
                autoFocus
                autoComplete="current-password"
              />
              <button
                type="submit"
                disabled={reauthLoading || !reauthSecret.trim()}
                className="px-4 py-2 bg-orange-600 text-white text-sm font-semibold rounded-lg hover:bg-orange-700 disabled:opacity-50"
              >
                {reauthLoading ? "Logging in..." : "Log in"}
              </button>
            </form>
            {reauthError && <p className="mt-2 text-sm text-red-600 font-medium">{reauthError}</p>}
          </div>
        )}

        {/* ── Recovery confirmation ── */}
        {recoveryApplied && pageState === "idle" && (
          <div className="rounded-xl border border-green-200 bg-green-50 p-4 flex items-center justify-between">
            <div>
              <p className="text-sm font-semibold text-green-800">Session restored</p>
              <p className="text-xs text-green-600 mt-0.5">
                {postReauthJobId
                  ? `Re-auth succeeded. Resumed polling job ${postReauthJobId.slice(0, 8)}...`
                  : "Re-auth succeeded. Select a file and state, then click Start Import."}
              </p>
            </div>
            <button onClick={() => setRecoveryApplied(false)} className="text-xs text-green-500 hover:text-green-700 underline ml-4">
              Dismiss
            </button>
          </div>
        )}

        {/* ── Main card ── */}
        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">

          <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
            <span className="text-sm font-semibold text-gray-700">Import status</span>
            <span className={`px-3 py-1 text-xs font-semibold rounded-full ${STATUS_COLORS[chipState] ?? "bg-gray-100 text-gray-600"}`}>
              {STATUS_LABELS[chipState] ?? chipState}
            </span>
          </div>

          <div className="p-6 space-y-5">

            {/* ── Step 1: State + file ── */}
            <div className={`space-y-4 transition-opacity ${isBusy || isTerminal ? "opacity-50 pointer-events-none" : ""}`}>

              {/* State selector */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">State</label>
                <select
                  value={stateSlug}
                  onChange={e => setStateSlug(e.target.value)}
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  {US_STATES.map(s => (
                    <option key={s.slug} value={s.slug}>{s.name}</option>
                  ))}
                </select>
              </div>

              {/* File picker — real label + input, plus drag-and-drop */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">File</label>

                {/* Hidden real file input — label drives it */}
                <input
                  ref={fileInputRef}
                  id="other-agencies-v2-file-input"
                  type="file"
                  accept=".csv,.xlsx,.xls,.json"
                  className="sr-only"
                  onChange={handleFileChange}
                />

                <label
                  htmlFor="other-agencies-v2-file-input"
                  onDragOver={handleDragOver}
                  onDragLeave={handleDragLeave}
                  onDrop={handleDrop}
                  className={`flex flex-col items-center justify-center gap-3 cursor-pointer rounded-xl border-2 border-dashed px-6 py-8 text-center transition-colors select-none ${
                    isDragOver
                      ? "border-blue-500 bg-blue-50"
                      : file
                      ? "border-blue-400 bg-blue-50"
                      : "border-gray-300 hover:border-blue-400 hover:bg-blue-50"
                  }`}
                >
                  {file ? (
                    <div className="space-y-1">
                      <p className="font-semibold text-blue-700 text-sm break-all">{file.name}</p>
                      <p className="text-xs text-blue-500">{fmtBytes(file.size)}</p>
                      <p className="text-xs text-gray-400 mt-1">Click or drop a new file to replace</p>
                    </div>
                  ) : (
                    <div className="space-y-2">
                      <p className="text-sm text-gray-500">Drop a file here, or click to browse</p>
                      <p className="text-xs text-gray-400">CSV, XLSX, XLS, JSON — up to 50 MB</p>
                    </div>
                  )}
                </label>

                {/* Explicit fallback button — always visible below dropzone */}
                <div className="mt-2 flex items-center gap-3">
                  <label
                    htmlFor="other-agencies-v2-file-input"
                    className="cursor-pointer px-3 py-1.5 text-xs font-medium text-blue-700 bg-blue-50 border border-blue-200 rounded-lg hover:bg-blue-100 transition-colors select-none"
                  >
                    Choose file
                  </label>
                  {file && (
                    <span className="text-xs text-gray-500 truncate max-w-xs">
                      {file.name} <span className="text-gray-400">({fmtBytes(file.size)})</span>
                    </span>
                  )}
                </div>

                <p className="mt-1.5 text-xs text-gray-400">
                  Supported formats: CSV (comma or semicolon), XLSX, XLS, JSON. Column "Name" is required.
                </p>
                <div className="mt-2 px-3 py-2 bg-blue-50 border border-blue-200 rounded-lg">
                  <p className="text-xs text-blue-700">
                    <span className="font-semibold">XLSX/XLS files:</span> Parsed automatically in your browser before upload. No server timeout issues.
                  </p>
                </div>
              </div>

              {/* Dry-run toggle */}
              <label className="flex items-start gap-3 cursor-pointer select-none group">
                <div className="mt-0.5">
                  <input
                    type="checkbox"
                    checked={isDryRun}
                    onChange={e => setIsDryRun(e.target.checked)}
                    className="w-4 h-4 rounded border-gray-300 text-amber-600 focus:ring-amber-500"
                  />
                </div>
                <div>
                  <p className="text-sm font-semibold text-gray-800 group-hover:text-amber-700">
                    Dry-run (audit only, no mutations)
                  </p>
                  <p className="text-xs text-gray-500 mt-0.5">
                    Parse, match, and audit the file without writing to <code className="bg-gray-100 px-1 rounded">other_agencies</code> or email tables. Use this to investigate match quality before committing.
                  </p>
                </div>
              </label>
            </div>

            {/* ── Client-side XLSX parsing progress ── */}
            {isParsingXlsx && parseProgress && (
              <div className="rounded-xl border border-blue-200 bg-blue-50 p-4">
                <div className="flex items-start gap-3">
                  <div className="w-5 h-5 border-2 border-blue-600 border-t-transparent rounded-full animate-spin shrink-0 mt-0.5" />
                  <div className="flex-1">
                    <p className="text-sm font-semibold text-blue-900">Parsing Excel file in browser...</p>
                    <p className="text-sm text-blue-700 mt-1">{parseProgress}</p>
                    {parsedRowCount > 0 && (
                      <p className="text-xs text-blue-600 mt-1 font-medium">
                        Detected {parsedRowCount} valid agencies with names
                      </p>
                    )}
                  </div>
                </div>
              </div>
            )}

            {/* ── Progress bar ── */}
            {(isBusy || isTerminal) && !isParsingXlsx && (
              <div className="space-y-2">
                <div className="flex items-center justify-between text-xs text-gray-500">
                  <span>{jobStatus?.last_checkpoint ?? (pageState === "uploading" ? "Uploading file..." : "Starting...")}</span>
                  <span>{progressPct}%</span>
                </div>
                <div className="h-2.5 w-full bg-gray-100 rounded-full overflow-hidden">
                  <div
                    className={`h-full rounded-full transition-all duration-500 ${
                      pageState === "failed" ? "bg-red-500"
                      : pageState === "completed" ? "bg-green-500"
                      : pageState === "partial_success" ? "bg-yellow-500"
                      : "bg-blue-500"
                    }`}
                    style={{ width: `${progressPct}%` }}
                  />
                </div>
              </div>
            )}

            {/* ── Stuck / resume alert ── */}
            {jobId && (isStuck || needsResume || staleChunks > 0) && (
              <div className="rounded-xl border border-amber-200 bg-amber-50 p-4">
                <div className="flex items-start justify-between gap-4">
                  <div className="space-y-1">
                    <p className="text-sm font-semibold text-amber-800">
                      {isStuck ? "Job appears stuck" : staleChunks > 0 ? `${staleChunks} stale chunk${staleChunks > 1 ? "s" : ""} detected` : "Job needs resume"}
                    </p>
                    {stallReason && (
                      <p className="text-xs text-amber-700 font-medium">{stallReason}</p>
                    )}
                    <p className="text-xs text-amber-600">
                      {chunkSummary && `Chunks: ${chunkSummary.completed} done, ${chunkSummary.failed} failed, ${chunkSummary.queued} queued, ${chunkSummary.processing} processing`}
                      {staleChunks > 0 && ` (${staleChunks} stale > 10 min)`}
                    </p>
                    {staleChunks > 0 && (
                      <div className="mt-2 px-2 py-1.5 bg-blue-100 border border-blue-200 rounded text-xs text-blue-700">
                        <span className="font-semibold">Auto-recovery active:</span> Stale chunks are automatically requeued every 2.5 seconds. Wait 10-30 seconds for recovery, then check if job progresses.
                      </div>
                    )}
                    {lastWorkerFailEvent && (
                      <div className="mt-2 px-2 py-1.5 bg-red-100 border border-red-200 rounded">
                        <p className="text-xs font-semibold text-red-700">Last worker failure:</p>
                        <p className="text-xs text-red-600 font-mono mt-0.5 break-all">{lastWorkerFailEvent.message}</p>
                        {(lastWorkerFailEvent.message.includes("504") || lastWorkerFailEvent.message.includes("timeout")) && (
                          <p className="text-xs text-red-600 mt-1">
                            <span className="font-semibold">Worker timeout detected.</span> Chunks stuck in processing will be auto-recovered and retried (up to 3 attempts).
                          </p>
                        )}
                      </div>
                    )}
                    {resumeResult && (
                      <p className={`text-xs font-mono mt-1 ${resumeResult.startsWith("Resume failed") ? "text-red-700 font-semibold" : "text-amber-700"}`}>{resumeResult}</p>
                    )}
                  </div>
                  <button
                    onClick={() => handleResume(jobId)}
                    disabled={resumeLoading}
                    className="shrink-0 px-4 py-2 bg-amber-600 text-white text-sm font-semibold rounded-lg hover:bg-amber-700 disabled:opacity-50"
                  >
                    {resumeLoading ? "Resuming..." : "Force Resume"}
                  </button>
                </div>
              </div>
            )}

            {/* ── Chunk summary bar ── */}
            {chunkSummary && chunkSummary.total > 0 && (isBusy || isTerminal) && (
              <div className="space-y-2">
                <div className="flex items-center gap-2 text-xs text-gray-500">
                  <span>Chunks:</span>
                  <span className="text-green-600 font-medium">{chunkSummary.completed} done</span>
                  <span className="text-gray-300">|</span>
                  <span className="text-blue-600 font-medium">{chunkSummary.processing} active</span>
                  <span className="text-gray-300">|</span>
                  <span className="text-gray-500">{chunkSummary.queued} queued</span>
                  {chunkSummary.failed > 0 && (
                    <>
                      <span className="text-gray-300">|</span>
                      <span className="text-red-600 font-medium">{chunkSummary.failed} failed</span>
                    </>
                  )}
                  {staleChunks > 0 && (
                    <>
                      <span className="text-gray-300">|</span>
                      <span className="text-amber-600 font-medium">{staleChunks} stale</span>
                    </>
                  )}
                </div>
                <div className="h-2 w-full bg-gray-100 rounded-full overflow-hidden flex">
                  {chunkSummary.completed > 0 && (
                    <div className="h-full bg-green-500" style={{ width: `${(chunkSummary.completed / chunkSummary.total) * 100}%` }} />
                  )}
                  {chunkSummary.processing > 0 && (
                    <div className="h-full bg-blue-500" style={{ width: `${(chunkSummary.processing / chunkSummary.total) * 100}%` }} />
                  )}
                  {chunkSummary.failed > 0 && (
                    <div className="h-full bg-red-400" style={{ width: `${(chunkSummary.failed / chunkSummary.total) * 100}%` }} />
                  )}
                </div>
              </div>
            )}

            {/* ── /your-agency index rebuild status ── */}
            {isTerminal && (pageState === "completed" || pageState === "partial_success") && jobStatus?.last_checkpoint && (
              <div className={`rounded-xl p-4 ${
                jobStatus.last_checkpoint.includes("Index rebuilt")
                  ? "bg-green-50 border border-green-200"
                  : jobStatus.last_checkpoint.includes("Index rebuild issue")
                    ? "bg-amber-50 border border-amber-200"
                    : "bg-gray-50 border border-gray-200"
              }`}>
                <p className={`text-sm font-semibold ${
                  jobStatus.last_checkpoint.includes("Index rebuilt") ? "text-green-700"
                  : jobStatus.last_checkpoint.includes("Index rebuild issue") ? "text-amber-700"
                  : "text-gray-700"
                }`}>
                  {jobStatus.last_checkpoint.includes("Index rebuilt")
                    ? "/your-agency index rebuilt"
                    : jobStatus.last_checkpoint.includes("Index rebuild issue")
                      ? "/your-agency index rebuild issue"
                      : "Post-import status"}
                </p>
                <p className="text-xs text-gray-600 mt-1 font-mono break-all">{jobStatus.last_checkpoint}</p>
              </div>
            )}

            {/* ── Error message ── */}
            {(errorMsg || jobStatus?.error_message) && (
              <div className="rounded-xl bg-red-50 border border-red-200 p-4">
                <p className="text-sm font-semibold text-red-700">Error</p>
                <p className="text-sm text-red-600 mt-0.5 font-mono break-all">
                  {errorMsg ?? jobStatus?.error_message}
                </p>
              </div>
            )}

            {/* ── DRY RUN banner ── */}
            {jobStatus?.is_dry_run && (
              <div className="rounded-xl bg-amber-50 border-2 border-amber-400 p-4 flex items-center gap-3">
                <div className="shrink-0 w-8 h-8 bg-amber-400 rounded-lg flex items-center justify-center">
                  <svg className="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div>
                  <p className="text-sm font-bold text-amber-900">DRY RUN — no data was mutated</p>
                  <p className="text-xs text-amber-700 mt-0.5">
                    Matching and audit were performed. <code className="bg-amber-100 px-1 rounded">other_agencies</code>, emails, and phones were NOT modified.
                    Run without dry-run to apply changes.
                  </p>
                </div>
              </div>
            )}

            {/* ── Job metrics ── */}
            {jobStatus && (
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {[
                  { label: "Rows read", value: fmt(jobStatus.rows_read) },
                  { label: "Chunks", value: `${fmt(jobStatus.chunks_processed)} / ${fmt(jobStatus.chunks_total)}` },
                  { label: "Created", value: fmt(jobStatus.agencies_created) },
                  { label: "Emails added", value: fmt(jobStatus.emails_added) },
                  { label: "Errors", value: fmt(jobStatus.errors_count), warn: jobStatus.errors_count > 0 },
                  { label: "File size", value: fmtBytes(jobStatus.file_size_bytes) },
                  { label: "Format", value: jobStatus.file_format.toUpperCase() },
                ].map(m => (
                  <div key={m.label} className={`rounded-xl p-3 ${m.warn ? "bg-red-50 border border-red-100" : "bg-gray-50"}`}>
                    <p className="text-xs text-gray-500">{m.label}</p>
                    <p className={`text-lg font-bold mt-0.5 ${m.warn ? "text-red-600" : "text-gray-900"}`}>{m.value}</p>
                  </div>
                ))}
                {/* Honest "Updated" split — show all three once audit data available */}
                {(jobStatus.agencies_real_updated !== undefined || jobStatus.agencies_noop_updated !== undefined) ? (
                  <>
                    <div className="rounded-xl p-3 bg-blue-50 border border-blue-100">
                      <p className="text-xs text-blue-600">Matched existing</p>
                      <p className="text-lg font-bold mt-0.5 text-blue-800">{fmt(jobStatus.agencies_updated)}</p>
                    </div>
                    <div className="rounded-xl p-3 bg-emerald-50 border border-emerald-100">
                      <p className="text-xs text-emerald-600">Real updates</p>
                      <p className="text-lg font-bold mt-0.5 text-emerald-800">{fmt(jobStatus.agencies_real_updated ?? 0)}</p>
                    </div>
                    <div className="rounded-xl p-3 bg-gray-50">
                      <p className="text-xs text-gray-500">No-op updates</p>
                      <p className="text-lg font-bold mt-0.5 text-gray-500">{fmt(jobStatus.agencies_noop_updated ?? 0)}</p>
                    </div>
                  </>
                ) : (
                  <div className="rounded-xl p-3 bg-gray-50">
                    <p className="text-xs text-gray-500">Updated</p>
                    <p className="text-lg font-bold mt-0.5 text-gray-900">{fmt(jobStatus.agencies_updated)}</p>
                  </div>
                )}
              </div>
            )}

            {/* ── Match Audit panel ── */}
            {auditSummary && (
              <div className="rounded-2xl border border-gray-200 overflow-hidden">
                <button
                  className="w-full px-4 py-3 flex items-center justify-between text-left bg-gray-50 hover:bg-gray-100 transition-colors"
                  onClick={() => setShowAuditPanel(v => !v)}
                >
                  <div className="flex items-center gap-2">
                    <span className="text-sm font-semibold text-gray-700">Match Audit</span>
                    {auditSummary.suspicious_matches_count > 0 && (
                      <span className="px-2 py-0.5 bg-red-100 text-red-700 text-xs font-bold rounded-full">
                        {auditSummary.suspicious_matches_count} suspicious
                      </span>
                    )}
                  </div>
                  <span className="text-xs text-gray-400">{showAuditPanel ? "Hide" : "Show"}</span>
                </button>

                {showAuditPanel && (
                  <div className="p-4 space-y-4 border-t border-gray-100">
                    {/* Match method breakdown */}
                    <div>
                      <p className="text-xs font-semibold text-gray-600 mb-2 uppercase tracking-wide">Match Methods</p>
                      <div className="grid grid-cols-2 gap-2">
                        {[
                          { label: "Domain (same state)", value: auditSummary.match_domain_same_state, color: "text-green-700 bg-green-50" },
                          { label: "Domain (cross-state)", value: auditSummary.match_domain_cross_state, color: "text-amber-700 bg-amber-50", warn: auditSummary.match_domain_cross_state > 0 },
                          { label: "Phone (same state)", value: auditSummary.match_phone_same_state, color: "text-blue-700 bg-blue-50" },
                          { label: "Name (same state)", value: auditSummary.match_name_same_state, color: "text-gray-700 bg-gray-50" },
                        ].map(m => (
                          <div key={m.label} className={`rounded-lg p-2.5 ${m.color}`}>
                            <p className="text-xs font-medium">{m.label}</p>
                            <p className="text-base font-bold mt-0.5">{fmt(m.value)}</p>
                          </div>
                        ))}
                      </div>
                    </div>

                    {/* Real vs no-op update breakdown */}
                    <div>
                      <p className="text-xs font-semibold text-gray-600 mb-2 uppercase tracking-wide">Update Quality</p>
                      <div className="grid grid-cols-3 gap-2">
                        <div className="rounded-lg p-2.5 bg-blue-50">
                          <p className="text-xs text-blue-600 font-medium">Matched existing</p>
                          <p className="text-base font-bold text-blue-800 mt-0.5">{fmt(jobStatus?.agencies_updated ?? 0)}</p>
                        </div>
                        <div className="rounded-lg p-2.5 bg-emerald-50">
                          <p className="text-xs text-emerald-600 font-medium">Real updates</p>
                          <p className="text-base font-bold text-emerald-800 mt-0.5">{fmt(auditSummary.agencies_real_updated)}</p>
                          <p className="text-xs text-emerald-500 mt-0.5">
                            {jobStatus?.agencies_updated ? Math.round((auditSummary.agencies_real_updated / jobStatus.agencies_updated) * 100) : 0}% of matched
                          </p>
                        </div>
                        <div className="rounded-lg p-2.5 bg-gray-50">
                          <p className="text-xs text-gray-500 font-medium">No-op updates</p>
                          <p className="text-base font-bold text-gray-600 mt-0.5">{fmt(auditSummary.agencies_noop_updated)}</p>
                          <p className="text-xs text-gray-400 mt-0.5">only updated_at written</p>
                        </div>
                      </div>
                    </div>

                    {/* Suspicious samples */}
                    {suspiciousSamples.length > 0 && (
                      <div>
                        <p className="text-xs font-semibold text-red-700 mb-2 uppercase tracking-wide">
                          Suspicious Matches ({suspiciousSamples.length} shown)
                        </p>
                        <div className="space-y-2 max-h-64 overflow-y-auto">
                          {suspiciousSamples.map((s, i) => (
                            <div key={i} className="rounded-lg bg-red-50 border border-red-100 p-2.5 text-xs space-y-0.5">
                              <div className="flex items-center justify-between gap-2">
                                <span className="font-semibold text-red-800 truncate">{s.source_agency_name}</span>
                                <span className="shrink-0 text-red-500">row {s.source_row_number}</span>
                              </div>
                              <div className="text-red-700 font-mono">{s.match_method}{s.cross_state ? " (cross-state)" : ""}</div>
                              {s.matched_agency_slug && (
                                <div className="text-red-600">
                                  Matched: <span className="font-medium">{s.matched_agency_slug}</span>
                                  {s.matched_agency_state_slug && s.matched_agency_state_slug !== s.source_state_slug && (
                                    <span className="text-amber-700 ml-1">({s.matched_agency_state_slug})</span>
                                  )}
                                </div>
                              )}
                              {s.suspicious_reason && (
                                <div className="text-red-600 italic">{s.suspicious_reason}</div>
                              )}
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                )}
              </div>
            )}

            {/* ── Action buttons ── */}
            <div className="space-y-2 pt-2">
              <div className="flex flex-wrap gap-3 items-center">
                {pageState === "idle" && (
                  <button
                    onClick={handleStartImport}
                    disabled={!canStartButton}
                    className="px-6 py-2.5 bg-blue-600 text-white text-sm font-semibold rounded-xl hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                  >
                    {clickGateResult === "reauth_required" ? "Start Import (login required)" : "Start Import"}
                  </button>
                )}

                {isBusy && (
                  <div className="flex items-center gap-2 text-sm text-gray-500">
                    <div className="w-4 h-4 border-2 border-blue-500 border-t-transparent rounded-full animate-spin" />
                    {isParsingXlsx ? "Parsing Excel in browser..." : "Working in background..."}
                  </div>
                )}

                {isTerminal && (
                  <>
                    <button
                      onClick={handleReset}
                      className="px-5 py-2.5 bg-gray-900 text-white text-sm font-semibold rounded-xl hover:bg-gray-700"
                    >
                      Start new import
                    </button>
                    {jobId && (
                      <button
                        onClick={() => pollStatus(jobId)}
                        className="px-5 py-2.5 border border-gray-300 text-gray-700 text-sm font-medium rounded-xl hover:bg-gray-50"
                      >
                        Refresh
                      </button>
                    )}
                  </>
                )}

                <button
                  onClick={handleRebuildIndex}
                  disabled={rebuildLoading}
                  className="px-5 py-2.5 border border-blue-300 bg-blue-50 text-blue-700 text-sm font-medium rounded-xl hover:bg-blue-100 disabled:opacity-50"
                >
                  {rebuildLoading ? "Rebuilding..." : "Rebuild /your-agency Index"}
                </button>
              </div>

              {rebuildResult && (
                <div className={`mt-2 px-3 py-2 rounded-lg text-xs ${rebuildResult.startsWith("Success") ? "bg-green-50 text-green-700 border border-green-200" : "bg-red-50 text-red-700 border border-red-200"}`}>
                  <p className="font-semibold">{rebuildResult.startsWith("Success") ? "Rebuild completed" : "Rebuild error"}</p>
                  <p className="mt-0.5 font-mono">{rebuildResult}</p>
                </div>
              )}

              {pageState === "idle" && !canStartButton && disabledReason && disabledReason !== "page_not_idle" && (
                <p className="text-xs text-amber-600 font-medium">
                  Not ready: {disabledReason === "missing_file" ? "No file selected" : disabledReason === "missing_state" ? "No state selected" : disabledReason}
                </p>
              )}

              {pageState === "idle" && canStartButton && clickGateResult === "reauth_required" && (
                <p className="text-xs text-orange-600 font-medium">
                  No active session — clicking Start Import will open the login form.
                </p>
              )}
            </div>

            {jobId && (
              <p className="text-xs text-gray-400 font-mono">Job ID: {jobId}</p>
            )}
          </div>
        </div>

        {/* ── Diagnostics panel ── */}
        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
          <button
            className="w-full px-6 py-4 flex items-center justify-between text-left"
            onClick={() => setShowDiagnostics(v => !v)}
          >
            <span className="text-sm font-semibold text-gray-700">Diagnostics</span>
            <span className="text-xs text-gray-400">{showDiagnostics ? "Hide" : "Show"}</span>
          </button>

          {showDiagnostics && (
            <div className="px-6 pb-6 space-y-5 border-t border-gray-100 pt-4">

              {/* Session & readiness */}
              <DiagSection title="Session & readiness">
                {[
                  ["sessionStatus", sessionStatus],
                  ["adminToken present", adminToken ? "yes" : "no"],
                  ["tokenExpiry", fmtExpiry(tokenExpiresAt)],
                  ["canStartButton", canStartButton ? "yes" : "no"],
                  ["disabledReason", disabledReason ?? "none"],
                  ["clickGateResult", clickGateResult],
                  ["pageState", pageState],
                  ["file selected", file ? `yes — ${file.name} (${fmtBytes(file.size)})` : "no"],
                  ["stateSlug", stateSlug],
                  ["jobId", jobId ?? "none"],
                ].map(([k, v]) => (
                  <DiagRow key={k} label={k} value={String(v)} highlight={
                    k === "adminToken present" ? (v === "no" ? "red" : "green")
                    : k === "canStartButton" ? (v === "no" ? "amber" : "green")
                    : k === "clickGateResult" ? (v === "start_upload" ? "green" : v === "reauth_required" ? "orange" : "amber")
                    : k === "file selected" && v === "no" ? "amber"
                    : k === "tokenExpiry" && v === "expired" ? "red"
                    : null
                  } />
                ))}
              </DiagSection>

              {/* Upload & poll tracking */}
              <DiagSection title="Upload & poll events">
                {[
                  ["lastFileEvent", lastFileEvent ?? "none"],
                  ["lastUploadStartedAt", lastUploadStartedAt ? new Date(lastUploadStartedAt).toLocaleTimeString() : "n/a"],
                  ["lastUploadResponseStatus", lastUploadResponseStatus !== null ? String(lastUploadResponseStatus) : "n/a"],
                  ["lastPollResponseStatus", lastPollResponseStatus !== null ? String(lastPollResponseStatus) : "n/a"],
                  ["pollingActive", isPollingActive ? "yes" : "no"],
                ].map(([k, v]) => (
                  <DiagRow key={k} label={k} value={String(v)} highlight={
                    (k === "lastUploadResponseStatus" || k === "lastPollResponseStatus") && v === "401" ? "red"
                    : (k === "lastUploadResponseStatus" || k === "lastPollResponseStatus") && v !== "n/a" && v !== "200" ? "amber"
                    : k === "pollingActive" && v === "yes" ? "green"
                    : null
                  } />
                ))}
              </DiagSection>

              {/* Re-auth & recovery */}
              <DiagSection title="Re-auth & recovery">
                {[
                  ["reauthTriggeredBy", reauthTriggeredBy ?? "none"],
                  ["lastReauthTrigger", lastReauthTrigger ?? "n/a"],
                  ["reauthCompleted", reauthCompleted ? "yes" : "no"],
                  ["recoveryApplied", recoveryApplied ? "yes" : "no"],
                  ["postReauthPageState", postReauthPageState ?? "n/a"],
                  ["postReauthCanStart", postReauthCanStart === null ? "n/a" : postReauthCanStart ? "yes" : "no"],
                  ["postReauthJobId", postReauthJobId ?? "none"],
                ].map(([k, v]) => (
                  <DiagRow key={k} label={k} value={String(v)} highlight={
                    k === "reauthCompleted" && v === "yes" ? "green"
                    : k === "recoveryApplied" && v === "yes" ? "green"
                    : k === "postReauthCanStart" && v === "yes" ? "green"
                    : k === "postReauthCanStart" && v === "no" ? "amber"
                    : (k === "reauthTriggeredBy" || k === "lastReauthTrigger") && v !== "none" && v !== "n/a" ? "orange"
                    : null
                  } />
                ))}
              </DiagSection>

              {/* Queue health */}
              {jobStatus && chunkSummary && (
                <DiagSection title="Queue health">
                  {[
                    ["queued_chunks", String(chunkSummary.queued)],
                    ["processing_chunks", String(chunkSummary.processing)],
                    ["completed_chunks", String(chunkSummary.completed)],
                    ["failed_chunks", String(chunkSummary.failed)],
                    ["stale_chunks", String(staleChunks)],
                    ["is_stuck", isStuck ? "YES" : "no"],
                    ["needs_resume", needsResume ? "YES" : "no"],
                    ["stall_reason", stallReason ?? "none"],
                    ["last_worker_fail", lastWorkerFailEvent ? `${lastWorkerFailEvent.event_type}: ${lastWorkerFailEvent.message}` : "none"],
                  ].map(([k, v]) => (
                    <DiagRow key={k} label={k} value={String(v)} highlight={
                      k === "is_stuck" && v === "YES" ? "red"
                      : k === "needs_resume" && v === "YES" ? "amber"
                      : k === "stale_chunks" && Number(v) > 0 ? "amber"
                      : k === "failed_chunks" && Number(v) > 0 ? "red"
                      : k === "stall_reason" && v !== "none" ? "red"
                      : k === "last_worker_fail" && v !== "none" ? "red"
                      : null
                    } />
                  ))}
                </DiagSection>
              )}

              {/* Events log */}
              {jobStatus && (
                <>
                  <DiagSection title="Event log">
                    {events.length === 0 ? (
                      <p className="text-xs text-gray-400">No events yet.</p>
                    ) : (
                      <div className="space-y-1">
                        {events.map((e, i) => (
                          <div key={i} className="flex items-start gap-3 text-xs">
                            <span className="text-gray-400 shrink-0 tabular-nums">{fmtTime(e.created_at)}</span>
                            <span className="text-blue-600 font-mono shrink-0">{e.event_type}</span>
                            <span className="text-gray-600">{e.message}</span>
                          </div>
                        ))}
                      </div>
                    )}
                  </DiagSection>

                  <DiagSection title="Job fields">
                    {([
                      ["id", jobStatus.id],
                      ["status", jobStatus.status],
                      ["state_slug", jobStatus.state_slug],
                      ["file_name", jobStatus.file_name],
                      ["file_format", jobStatus.file_format],
                      ["file_size", fmtBytes(jobStatus.file_size_bytes)],
                      ["rows_read", jobStatus.rows_read],
                      ["chunks_total", jobStatus.chunks_total],
                      ["chunks_processed", jobStatus.chunks_processed],
                      ["agencies_created", jobStatus.agencies_created],
                      ["agencies_updated", jobStatus.agencies_updated],
                      ["emails_added", jobStatus.emails_added],
                      ["errors_count", jobStatus.errors_count],
                      ["last_checkpoint", jobStatus.last_checkpoint ?? "-"],
                      ["error_message", jobStatus.error_message ?? "-"],
                      ["created_at", jobStatus.created_at],
                      ["updated_at", jobStatus.updated_at],
                    ] as [string, string | number][]).map(([k, v]) => (
                      <DiagRow key={k} label={k} value={String(v)} highlight={
                        k === "error_message" && v !== "-" ? "red"
                        : k === "errors_count" && Number(v) > 0 ? "amber"
                        : null
                      } />
                    ))}
                  </DiagSection>
                </>
              )}
            </div>
          )}
        </div>

        {/* ── Chunks panel ── */}
        {chunks.length > 0 && (
          <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
            <button
              className="w-full px-6 py-4 flex items-center justify-between text-left"
              onClick={() => setShowChunks(v => !v)}
            >
              <span className="text-sm font-semibold text-gray-700">Chunks ({chunks.length} total)</span>
              <span className="text-xs text-gray-400">{showChunks ? "Hide" : "Show"}</span>
            </button>
            {showChunks && (
              <div className="overflow-x-auto border-t border-gray-100">
                <table className="w-full text-xs">
                  <thead className="bg-gray-50">
                    <tr>
                      {["#", "Status", "Retries", "Created", "Updated", "Emails", "Errors", "Duration", "Error samples"].map(h => (
                        <th key={h} className="px-3 py-2 text-left text-gray-500 font-medium">{h}</th>
                      ))}
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {chunks.map(c => {
                      const duration = c.started_at && c.completed_at
                        ? `${((new Date(c.completed_at).getTime() - new Date(c.started_at).getTime()) / 1000).toFixed(1)}s`
                        : c.started_at
                        ? "running..."
                        : "—";
                      const isStaleChunk = c.status === "processing" && c.started_at && (Date.now() - new Date(c.started_at).getTime()) > 10 * 60 * 1000;
                      return (
                      <tr key={c.chunk_index} className={`hover:bg-gray-50 align-top ${c.errors_count > 0 ? "bg-red-50/30" : ""} ${isStaleChunk ? "bg-amber-50/50" : ""}`}>
                        <td className="px-3 py-2 text-gray-500">{c.chunk_index}</td>
                        <td className="px-3 py-2">
                          <span className={`px-1.5 py-0.5 rounded text-xs font-medium ${STATUS_COLORS[c.status] ?? "bg-gray-100 text-gray-500"}`}>
                            {c.status}
                          </span>
                          {isStaleChunk && <span className="ml-1 px-1 py-0.5 rounded text-[10px] font-bold bg-amber-200 text-amber-800">STALE</span>}
                        </td>
                        <td className="px-3 py-2 text-gray-500">{c.retry_count > 0 ? <span className="text-amber-600 font-medium">{c.retry_count}</span> : "0"}</td>
                        <td className="px-3 py-2 text-green-600">{c.agencies_created}</td>
                        <td className="px-3 py-2 text-blue-600">{c.agencies_updated}</td>
                        <td className="px-3 py-2 text-gray-600">{c.emails_added}</td>
                        <td className="px-3 py-2 text-red-500 font-semibold">{c.errors_count}</td>
                        <td className="px-3 py-2 text-gray-500 tabular-nums">{duration}</td>
                        <td className="px-3 py-2 max-w-xs">
                          {c.error_samples && c.error_samples.length > 0 ? (
                            <div className="space-y-0.5">
                              {c.error_samples.slice(0, 3).map((s, i) => (
                                <p key={i} className="text-red-600 font-mono text-[10px] leading-tight truncate" title={s}>{s}</p>
                              ))}
                              {c.error_samples.length > 3 && (
                                <p className="text-gray-400 text-[10px]">+{c.error_samples.length - 3} more</p>
                              )}
                            </div>
                          ) : (
                            <span className="text-gray-300">—</span>
                          )}
                        </td>
                      </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        )}

        {/* ── Recent jobs ── */}
        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
            <span className="text-sm font-semibold text-gray-700">Recent imports</span>
            <button onClick={loadRecentJobs} disabled={loadingRecent} className="text-xs text-blue-600 hover:text-blue-800 disabled:opacity-50">
              {loadingRecent ? "Loading..." : "Refresh"}
            </button>
          </div>

          {/* Bulk actions bar */}
          {selectedJobIds.size > 0 && (
            <div className="px-6 py-3 bg-blue-50 border-b border-blue-100 flex items-center justify-between">
              <div className="flex items-center gap-4">
                <span className="text-sm font-medium text-blue-900">
                  {selectedJobIds.size} job{selectedJobIds.size > 1 ? "s" : ""} selected
                </span>
                <div className="flex items-center gap-2">
                  <button
                    onClick={handleBulkDelete}
                    disabled={deleteLoading}
                    className="px-3 py-1.5 text-xs font-semibold bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {deleteLoading ? "Deleting..." : "Delete Selected"}
                  </button>
                  <button
                    onClick={() => selectByStatus(["failed"])}
                    className="px-3 py-1.5 text-xs font-medium text-red-700 bg-red-50 border border-red-200 rounded-lg hover:bg-red-100"
                  >
                    Select Failed
                  </button>
                  <button
                    onClick={() => selectByStatus(["failed", "parsing", "chunking", "staged"])}
                    className="px-3 py-1.5 text-xs font-medium text-amber-700 bg-amber-50 border border-amber-200 rounded-lg hover:bg-amber-100"
                  >
                    Select Failed + Stuck
                  </button>
                </div>
              </div>
              <button
                onClick={() => setSelectedJobIds(new Set())}
                className="text-xs text-gray-600 hover:text-gray-800"
              >
                Clear Selection
              </button>
            </div>
          )}

          {recentJobs.length === 0 ? (
            <div className="px-6 py-8 text-center text-sm text-gray-400">No imports yet.</div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-xs">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-3 py-2 text-left">
                      <input
                        type="checkbox"
                        checked={selectedJobIds.size === recentJobs.length && recentJobs.length > 0}
                        onChange={toggleSelectAll}
                        className="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-2 focus:ring-blue-500"
                      />
                    </th>
                    {["State", "File", "Status", "Rows", "Created", "Updated", "Emails", "Profiles", "Dupes", "Started", "Actions"].map(h => (
                      <th key={h} className="px-3 py-2 text-left text-gray-500 font-medium">{h}</th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {recentJobs.map(j => {
                    const jobAge = Date.now() - new Date(j.updated_at).getTime();
                    const looksStuck = j.status === "processing" && jobAge > 10 * 60 * 1000;
                    const isSelected = selectedJobIds.has(j.id);
                    return (
                    <tr
                      key={j.id}
                      className={`hover:bg-gray-50 ${looksStuck ? "bg-amber-50/40" : ""} ${isSelected ? "bg-blue-50/50" : ""}`}
                    >
                      <td className="px-3 py-2">
                        <input
                          type="checkbox"
                          checked={isSelected}
                          onChange={() => toggleJobSelection(j.id)}
                          onClick={(e) => e.stopPropagation()}
                          className="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-2 focus:ring-blue-500"
                        />
                      </td>
                      <td className="px-3 py-2 font-medium text-gray-700">{j.state_slug}</td>
                      <td className="px-3 py-2 text-gray-500 max-w-[160px] truncate" title={j.file_name}>{j.file_name}</td>
                      <td className="px-3 py-2">
                        <span className={`px-1.5 py-0.5 rounded text-xs font-medium ${STATUS_COLORS[j.status] ?? "bg-gray-100 text-gray-500"}`}>
                          {j.status}
                        </span>
                        {looksStuck && <span className="ml-1 px-1 py-0.5 rounded text-[10px] font-bold bg-amber-200 text-amber-800">STUCK?</span>}
                      </td>
                      <td className="px-3 py-2 text-gray-600">{fmt(j.rows_read)}</td>
                      <td className="px-3 py-2 text-green-600">{fmt(j.agencies_created)}</td>
                      <td className="px-3 py-2 text-blue-600">{fmt(j.agencies_updated)}</td>
                      <td className="px-3 py-2 text-gray-500">{fmt(j.emails_added)}</td>
                      <td className="px-3 py-2 text-purple-600">{fmt(j.profiles_created ?? 0)}</td>
                      <td className="px-3 py-2 text-gray-400">{fmt((j.duplicate_rows_skipped ?? 0) + (j.duplicate_agencies_skipped ?? 0) + (j.duplicate_emails_skipped ?? 0))}</td>
                      <td className="px-3 py-2 text-gray-400">{fmtTime(j.created_at)}</td>
                      <td className="px-3 py-2">
                        <div className="flex items-center gap-1">
                          <button
                            onClick={() => {
                              setDetailsJob(j);
                              setShowDetailsModal(true);
                            }}
                            className="px-2 py-1 text-[10px] font-semibold text-blue-700 bg-blue-50 border border-blue-200 rounded hover:bg-blue-100"
                          >
                            Details
                          </button>
                          {(looksStuck || j.status === "failed") && (
                            <button
                              onClick={() => handleResume(j.id)}
                              disabled={resumeLoading}
                              className="px-2 py-1 text-[10px] font-semibold bg-amber-100 text-amber-700 border border-amber-200 rounded hover:bg-amber-200 disabled:opacity-50"
                            >
                              Resume
                            </button>
                          )}
                        </div>
                      </td>
                    </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>

      </div>
    </WpAdminLayout>
  );
}

// ─── Small diagnostic helpers ─────────────────────────────────────────────────

type HighlightColor = "red" | "green" | "amber" | "orange" | null;

function DiagSection({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div>
      <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">{title}</p>
      <div className="bg-gray-50 rounded-lg p-3 font-mono text-xs space-y-1">{children}</div>
    </div>
  );
}

function DiagRow({ label, value, highlight }: { label: string; value: string; highlight: HighlightColor }) {
  const color =
    highlight === "red" ? "text-red-600 font-semibold"
    : highlight === "green" ? "text-green-600 font-semibold"
    : highlight === "amber" ? "text-amber-600 font-semibold"
    : highlight === "orange" ? "text-orange-600"
    : "text-gray-700";
  return (
    <div className="flex gap-2">
      <span className="text-gray-400 w-52 shrink-0">{label}:</span>
      <span className={color}>{value}</span>
    </div>
  );
}

function DetailRow({ label, value, highlight, className = "" }: { label: string; value: React.ReactNode; highlight?: "green" | "blue" | "red"; className?: string }) {
  const valueColor = highlight === "green" ? "text-green-700" : highlight === "blue" ? "text-blue-700" : highlight === "red" ? "text-red-700" : "text-gray-900";
  return (
    <div className={className}>
      <p className="text-xs text-gray-500 mb-0.5">{label}</p>
      <p className={`text-sm font-medium ${valueColor}`}>{value}</p>
    </div>
  );
}
