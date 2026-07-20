import { useState, useRef, useEffect } from 'react';
import { Upload, Download, AlertTriangle, CheckCircle, Loader, Trash2, CreditCard as Edit2, Eye } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { parseExcelFile, convertParsedRowsToJSON } from '../utils/excelImportParser';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';
import { formatStateName } from '../utils/formatLocation';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

// EXPLICIT UI STATE MACHINE - no silent failures allowed
type ImportPhase =
  | 'idle'
  | 'validating_session'
  | 'uploading'
  | 'staged'
  | 'parsing'
  | 'queued'
  | 'processing'
  | 'completed'
  | 'failed'
  | 'reauth_required';

interface ParseProgress {
  parse_cursor_status?: string;
  parse_bytes_done?: number;
  parse_bytes_total?: number;
  parse_bytes_percent?: number;
}

interface ImportResult {
  ok: boolean;
  jobId: string;
  status: 'staged' | 'parsing' | 'queued' | 'processing' | 'completed' | 'failed';
  rows_read?: number;
  duplicate_rows_skipped?: number;
  total_agencies: number;
  total_emails: number;
  agencies_created: number;
  agencies_updated: number;
  agencies_skipped_duplicate?: number;
  emails_created: number;
  emails_skipped: number;
  duplicate_emails_skipped?: number;
  queue_ready_unique_emails?: number;
  agencies_with_no_email: number;
  failed: number;
  progress_percent?: number;
  chunks_total?: number;
  chunks_processed?: number;
  error_message?: string;
  last_checkpoint?: string;
  detected_delimiter?: string;
  detected_header_row?: number;
  source_rows_total?: number;
  storage_path?: string;
  file_size_bytes?: number;
  source_file_type?: string;
  parse_progress?: ParseProgress;
  errors: Array<{ row: number; agency: string; error: string }>;
}

interface DiagnosticState {
  currentPhase: ImportPhase;
  selectedFileName: string;
  selectedFileSize: number;
  selectedState: string;
  tokenPresent: boolean;
  ensureValidPassed: boolean | null;
  uploadStarted: boolean;
  uploadUrl: string;
  uploadMethod: string;
  uploadUsesFormData: boolean;
  uploadHasAuthorization: boolean;
  uploadHasApikey: boolean;
  uploadHasAdminToken: boolean;
  uploadHasContentType: boolean;
  uploadFetchThrew: boolean;
  uploadResponseReceived: boolean;
  uploadResponseStatus: number | null;
  uploadResponseBody: string;
  jobIdReceived: string;
  importResultSet: boolean;
  pollingStarted: boolean;
  lastPollStatus: string;
  lastError: string;
  lastAuthCheck: string;
}

interface ImportJob {
  id: string;
  state_slug: string;
  filename: string;
  mode: string;
  status: string;
  total_rows: number;
  inserted: number;
  updated: number;
  failed: number;
  skipped: number;
  created_at: string;
}

interface EmailRow {
  id?: string;
  email_raw?: string;
  email_normalized?: string;
  validation_status?: string;
  validation_provider?: string;
  validation_reason?: string;
  validation_checked_at?: string;
  validation_score?: number;
  is_primary?: boolean;
}

interface PhoneRow {
  id?: string;
  phone_raw?: string;
  phone_normalized?: string;
  is_primary?: boolean;
  sms_opt_out?: boolean;
}

interface Agency {
  id: string;
  state_slug: string;
  slug?: string;
  name: string;
  website_url?: string;
  city?: string;
  description?: string;
  services?: string[];
  email?: string;
  is_active: boolean;
  emails?: EmailRow[];
  zip_code?: string;
  full_address?: string;
  maps_url?: string;
  latitude?: number;
  longitude?: number;
  maps_position?: number;
  keyword?: string;
  facebook_url?: string;
  instagram_url?: string;
  twitter_url?: string;
  youtube_url?: string;
  linkedin_url?: string;
  primary_service?: string;
  phone?: string;
}

function isAuthError(errorMsg: string, statusCode?: number): boolean {
  const lower = errorMsg.toLowerCase();
  return (
    lower.includes('invalid_token') ||
    lower.includes('invalid token') ||
    lower.includes('no_token') ||
    lower.includes('no token') ||
    lower.includes('missing authorization') ||
    lower.includes('token') && lower.includes('expired') ||
    lower.includes('session') && lower.includes('expired') ||
    lower.includes('unauthorized') ||
    lower.includes('401') ||
    lower.includes('403') ||
    lower.includes('forbidden') ||
    lower.includes('please log in again') ||
    statusCode === 401 ||
    statusCode === 403
  );
}

function getAdminHeaders(adminToken: string, options?: { json?: boolean }): HeadersInit {
  const headers: HeadersInit = {
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
    'apikey': SUPABASE_ANON_KEY,
    'x-admin-token': adminToken,
    'Accept': 'application/json',
  };
  if (options?.json) {
    (headers as Record<string, string>)['Content-Type'] = 'application/json';
  }
  return headers;
}

// For FormData (file upload) requests, x-admin-token cannot be sent as a browser header
// because Supabase's gateway rejects it at the CORS preflight stage.
// The admin token is instead passed as a FormData field and read server-side from the body.
function getUploadHeaders(): HeadersInit {
  return {
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
    'apikey': SUPABASE_ANON_KEY,
    'Accept': 'application/json',
  };
}

export default function AdminOtherAgenciesImportPage() {
  const { token, status, ensureValid, logout } = useAdminSession();
  const [selectedState, setSelectedState] = useState('');
  const [mode, setMode] = useState<'csv' | 'json' | 'xlsx'>('xlsx');
  const [file, setFile] = useState<File | null>(null);
  const [isImporting, setIsImporting] = useState(false);
  const [importResult, setImportResult] = useState<ImportResult | null>(null);
  const [error, setError] = useState('');
  const [activeTab, setActiveTab] = useState<'upload' | 'jobs' | 'manage'>('upload');
  const [jobs, setJobs] = useState<ImportJob[]>([]);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [loadingJobs, setLoadingJobs] = useState(false);
  const [loadingAgencies, setLoadingAgencies] = useState(false);
  const [filterState, setFilterState] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<'active' | 'inactive' | 'all'>('active');
  const [isParsingExcel, setIsParsingExcel] = useState(false);
  const [viewAgency, setViewAgency] = useState<Agency | null>(null);
  const [editAgency, setEditAgency] = useState<Agency | null>(null);
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [isSaving, setIsSaving] = useState(false);
  const [editFormData, setEditFormData] = useState<Partial<Agency>>({});
  const [editEmails, setEditEmails] = useState<EmailRow[]>([]);
  const [editPhones, setEditPhones] = useState<PhoneRow[]>([]);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [needsReAuth, setNeedsReAuth] = useState(false);
  const [fileNeedsReselect, setFileNeedsReselect] = useState(false);
  const [viewJobDetails, setViewJobDetails] = useState<ImportJob | null>(null);
  const [jobEvents, setJobEvents] = useState<Array<{event_type: string; event_data: Record<string, unknown>; created_at: string}>>([]);

  // STATE MACHINE - explicit phase tracking
  const [importPhase, setImportPhase] = useState<ImportPhase>('idle');

  // DIAGNOSTICS - track every step for visibility
  const [diagnostics, setDiagnostics] = useState<DiagnosticState>({
    currentPhase: 'idle',
    selectedFileName: '',
    selectedFileSize: 0,
    selectedState: '',
    tokenPresent: false,
    ensureValidPassed: null,
    uploadStarted: false,
    uploadUrl: '',
    uploadMethod: 'POST',
    uploadUsesFormData: false,
    uploadHasAuthorization: false,
    uploadHasApikey: false,
    uploadHasAdminToken: false,
    uploadHasContentType: false,
    uploadFetchThrew: false,
    uploadResponseReceived: false,
    uploadResponseStatus: null,
    uploadResponseBody: '',
    jobIdReceived: '',
    importResultSet: false,
    pollingStarted: false,
    lastPollStatus: '',
    lastError: '',
    lastAuthCheck: '',
  });

  const updateDiagnostics = (updates: Partial<DiagnosticState>) => {
    setDiagnostics(prev => ({ ...prev, ...updates }));
  };

  useEffect(() => {
    if (status === 'invalid' && !needsReAuth) {
      setNeedsReAuth(true);
    } else if (status === 'valid' && needsReAuth) {
      setNeedsReAuth(false);
      setError('');
    }
  }, [status, needsReAuth]);

  const handleReAuthSuccess = () => {
    setNeedsReAuth(false);
    setError('');
    if (file) {
      setFileNeedsReselect(true);
      setFile(null);
      if (fileInputRef.current) {
        fileInputRef.current.value = '';
      }
    }
  };

  const enterReAuthMode = (reason: string, statusCode?: number) => {
    console.log('[AUTH FAILURE - ENTERING RE-AUTH MODE]', reason, statusCode);
    setImportPhase('reauth_required');
    setNeedsReAuth(true);
    setError('');
    setIsImporting(false);
    setIsSaving(false);
    setLoadingJobs(false);
    setLoadingAgencies(false);
    setIsParsingExcel(false);
    updateDiagnostics({
      currentPhase: 'reauth_required',
      lastAuthCheck: reason,
      lastError: `Auth failed: ${reason} (${statusCode || 'no status'})`,
    });
  };

  const handleAuthFailure = (errorMsg: string, statusCode?: number) => {
    if (isAuthError(errorMsg, statusCode)) {
      enterReAuthMode(errorMsg, statusCode);
    } else {
      setError(errorMsg);
    }
  };

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

  const parseApiError = async (response: Response): Promise<string> => {
    try {
      const json = await response.json();
      if (json.error) {
        return json.details ? `${json.error} - ${json.details}` : json.error;
      }
      if (json.message) {
        return json.message;
      }
    } catch {
      // JSON parse failed, try text
    }

    try {
      const text = await response.text();
      if (text) return text;
    } catch {
      // Text parse failed
    }

    return `HTTP ${response.status}`;
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFile = e.target.files?.[0];
    if (selectedFile) {
      const extension = selectedFile.name.split('.').pop()?.toLowerCase();

      if (extension === 'xlsx' || extension === 'xls') {
        setMode('xlsx');
      } else if (extension === 'json') {
        setMode('json');
      } else if (extension === 'csv') {
        setMode('csv');
      }

      setFile(selectedFile);
      setError('');
    }
  };

  const handleImport = async () => {
    // === VALIDATION ===
    if (!file || !selectedState) {
      setImportPhase('failed');
      setError('Please select a file and state');
      updateDiagnostics({
        currentPhase: 'failed',
        lastError: 'Missing file or state',
      });
      return;
    }

    // Update diagnostics at start
    updateDiagnostics({
      currentPhase: 'validating_session',
      selectedFileName: file.name,
      selectedFileSize: file.size,
      selectedState: selectedState,
      tokenPresent: !!token,
      ensureValidPassed: null,
      uploadStarted: false,
      uploadUrl: '',
      uploadMethod: 'POST',
      uploadUsesFormData: false,
      uploadHasAuthorization: false,
      uploadHasApikey: false,
      uploadHasAdminToken: false,
      uploadHasContentType: false,
      uploadFetchThrew: false,
      uploadResponseReceived: false,
      uploadResponseStatus: null,
      uploadResponseBody: '',
      jobIdReceived: '',
      importResultSet: false,
      pollingStarted: false,
      lastPollStatus: '',
      lastError: '',
    });

    // === AUTH CHECK ===
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    setImportPhase('validating_session');
    setIsImporting(true);
    setIsParsingExcel(false);
    setError('');

    const valid = await ensureValid();
    updateDiagnostics({ ensureValidPassed: valid });

    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    updateDiagnostics({ lastAuthCheck: 'ensureValid() passed' });

    // === UPLOAD ===
    setImportPhase('uploading');
    updateDiagnostics({ currentPhase: 'uploading', uploadStarted: true });

    try {
      const fileType: 'csv' | 'json' | 'xlsx' = mode;
      const uploadUrl = `${SUPABASE_URL}/functions/v1/other-agencies-import-upload`;
      // x-admin-token is NOT sent as a browser header — Supabase gateway blocks it at CORS preflight.
      // Instead it is passed as a FormData field so it travels in the request body.
      const uploadHeaders = getUploadHeaders();
      const headersRecord = uploadHeaders as Record<string, string>;

      updateDiagnostics({
        uploadUrl,
        uploadMethod: 'POST',
        uploadUsesFormData: true,
        uploadHasAuthorization: !!headersRecord['Authorization'],
        uploadHasApikey: !!headersRecord['apikey'],
        uploadHasAdminToken: true,
        uploadHasContentType: !!headersRecord['Content-Type'],
        uploadFetchThrew: false,
        uploadResponseReceived: false,
      });

      console.log(`[import] Upload URL: ${uploadUrl}`);
      console.log(`[import] Upload headers: Authorization=${!!headersRecord['Authorization']}, apikey=${!!headersRecord['apikey']}, x-admin-token=IN_BODY`);
      console.log(`[import] FormData upload for ${file.name} (${file.size} bytes) to ${selectedState}`);

      const formData = new FormData();
      formData.append('file', file);
      formData.append('state_slug', selectedState);
      formData.append('file_type', fileType);
      // Admin token in body — avoids CORS preflight rejection for custom headers
      if (token) formData.append('admin_token', token);

      let uploadResponse: Response;
      try {
        uploadResponse = await fetch(uploadUrl, {
          method: 'POST',
          headers: uploadHeaders,
          body: formData,
        });
        updateDiagnostics({ uploadResponseReceived: true, uploadResponseStatus: uploadResponse.status });
      } catch (fetchErr) {
        // fetch() threw — no HTTP response was received at all
        // This is a network/CORS/preflight failure, NOT a backend error
        const rawFetchError = fetchErr instanceof Error ? fetchErr.message : String(fetchErr);
        console.error('[import] fetch() threw before any response:', rawFetchError);
        console.error('[import] URL attempted:', uploadUrl);

        setImportPhase('failed');
        updateDiagnostics({
          uploadFetchThrew: true,
          uploadResponseReceived: false,
          uploadResponseStatus: null,
          uploadResponseBody: '',
          currentPhase: 'failed',
          lastError: `REQUEST-LAYER FAILURE: fetch threw before any HTTP response. URL: ${uploadUrl} | Error: ${rawFetchError} | Likely cause: CORS preflight rejected (x-admin-token not in Access-Control-Allow-Headers) or network unreachable`,
        });
        setError(`Upload request failed before any HTTP response was received.\n\nURL: ${uploadUrl}\nError: ${rawFetchError}\n\nLikely cause: CORS preflight rejected the x-admin-token header, or the endpoint is unreachable.`);
        setIsImporting(false);
        return;
      }

      if (!uploadResponse.ok) {
        const errorMsg = await parseApiError(uploadResponse);
        updateDiagnostics({ uploadResponseBody: errorMsg });

        if (isAuthError(errorMsg, uploadResponse.status)) {
          enterReAuthMode(errorMsg, uploadResponse.status);
          return;
        }

        setImportPhase('failed');
        setError(`Upload failed (HTTP ${uploadResponse.status}): ${errorMsg}`);
        updateDiagnostics({
          currentPhase: 'failed',
          lastError: `Upload HTTP ${uploadResponse.status}: ${errorMsg}`,
        });
        setIsImporting(false);
        return;
      }

      const uploadResult = await uploadResponse.json();
      updateDiagnostics({ uploadResponseBody: JSON.stringify(uploadResult) });

      if (!uploadResult.ok || !uploadResult.job_id) {
        const failureMsg = uploadResult.error || 'Upload failed - no job_id received';
        setImportPhase('failed');
        setError(failureMsg);
        updateDiagnostics({
          currentPhase: 'failed',
          lastError: failureMsg,
          jobIdReceived: '',
        });
        setIsImporting(false);
        return;
      }

      // === SUCCESS - JOB CREATED ===
      console.log(`[import] Job ${uploadResult.job_id} created, file staged. Server-side parsing started.`);
      updateDiagnostics({
        jobIdReceived: uploadResult.job_id,
        importResultSet: true,
      });

      setImportPhase('staged');
      updateDiagnostics({ currentPhase: 'staged' });

      setImportResult({
        ok: true,
        jobId: uploadResult.job_id,
        status: 'staged',
        total_agencies: 0,
        total_emails: 0,
        agencies_created: 0,
        agencies_updated: 0,
        emails_created: 0,
        emails_skipped: 0,
        agencies_with_no_email: 0,
        failed: 0,
        progress_percent: 0,
        chunks_total: 0,
        chunks_processed: 0,
        errors: [],
      });

      setFile(null);
      if (fileInputRef.current) {
        fileInputRef.current.value = '';
      }

      updateDiagnostics({ pollingStarted: true });
      pollJobStatus(uploadResult.job_id);

    } catch (err) {
      const rawError = err instanceof Error ? err.message : String(err);
      console.error('[import] Caught error in handleImport:', rawError);

      if (isAuthError(rawError)) {
        enterReAuthMode(rawError);
        return;
      }

      setImportPhase('failed');
      setError(`Import error: ${rawError}`);
      updateDiagnostics({
        currentPhase: 'failed',
        lastError: `Caught error: ${rawError}`,
      });
      setIsImporting(false);
    }
  };

  const pollJobStatus = async (jobId: string) => {
    console.log(`[import] Starting to poll job status for ${jobId}`);

    const maxAttempts = 3600;
    let attempts = 0;

    const poll = async () => {
      try {
        const statusResponse = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-orchestrator-v2`, {
          method: 'POST',
          headers: getAdminHeaders(token!, { json: true }),
          body: JSON.stringify({
            action: 'get_status',
            job_id: jobId,
          }),
        });

        if (!statusResponse.ok) {
          console.error(`[import] Status check failed: ${statusResponse.status}`);
          updateDiagnostics({ lastPollStatus: `HTTP ${statusResponse.status}` });

          if (statusResponse.status === 401 || statusResponse.status === 403) {
            const errorMsg = await parseApiError(statusResponse);
            enterReAuthMode(errorMsg, statusResponse.status);
            return;
          }

          // Poll failure but not auth - retry
          attempts++;
          if (attempts < maxAttempts) {
            setTimeout(poll, 3000);
          } else {
            setImportPhase('failed');
            setError(`Status polling failed after ${attempts} attempts`);
            updateDiagnostics({
              currentPhase: 'failed',
              lastError: `Polling gave up after ${attempts} attempts`,
            });
          }
          return;
        }

        const status = await statusResponse.json();

        if (status.ok) {
          const jobStatus = status.status as ImportResult['status'];
          console.log(`[import] Job status: ${jobStatus}, progress: ${status.progress_percent}% (${status.chunks_processed}/${status.chunks_total})`);

          // Update phase based on backend status
          const phaseMap: Record<string, ImportPhase> = {
            'staged': 'staged',
            'parsing': 'parsing',
            'queued': 'queued',
            'processing': 'processing',
            'completed': 'completed',
            'failed': 'failed',
          };
          const newPhase = phaseMap[jobStatus] || 'processing';
          setImportPhase(newPhase);
          updateDiagnostics({
            currentPhase: newPhase,
            lastPollStatus: `${jobStatus} - ${status.progress_percent}%`,
          });

          setImportResult(prev => prev ? {
            ...prev,
            status: jobStatus,
            agencies_created: status.total_inserted || 0,
            agencies_updated: status.total_updated || 0,
            failed: status.total_failed || 0,
            progress_percent: status.progress_percent || 0,
            chunks_total: status.chunks_total || 0,
            chunks_processed: status.chunks_processed || 0,
            rows_read: status.source_rows_total || prev.rows_read,
            source_rows_total: status.source_rows_total || prev.source_rows_total,
            error_message: status.error_message ?? prev.error_message,
            last_checkpoint: status.last_checkpoint ?? prev.last_checkpoint,
            detected_delimiter: status.detected_delimiter ?? prev.detected_delimiter,
            detected_header_row: status.detected_header_row ?? prev.detected_header_row,
            storage_path: status.storage_path ?? prev.storage_path,
            file_size_bytes: status.file_size_bytes ?? prev.file_size_bytes,
            source_file_type: status.source_file_type ?? prev.source_file_type,
            parse_progress: status.parse_progress ?? prev.parse_progress,
          } : null);

          if (jobStatus === 'completed') {
            console.log(`[import] Job completed!`);
            setImportPhase('completed');
            updateDiagnostics({ currentPhase: 'completed' });
            setIsImporting(false);
            await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-orchestrator-v2`, {
              method: 'POST',
              headers: getAdminHeaders(token!, { json: true }),
              body: JSON.stringify({
                action: 'finalize_job',
                job_id: jobId,
              }),
            });
            return;
          }

          if (jobStatus === 'failed') {
            console.log(`[import] Job failed: ${status.error_message}`);
            setImportPhase('failed');
            setError(status.error_message || 'Job failed');
            updateDiagnostics({
              currentPhase: 'failed',
              lastError: status.error_message || 'Job marked as failed',
            });
            setIsImporting(false);
            return;
          }
        } else {
          // status.ok is false
          updateDiagnostics({ lastPollStatus: 'status.ok === false' });
        }

        attempts++;
        if (attempts < maxAttempts) {
          setTimeout(poll, 2000);
        } else {
          setImportPhase('failed');
          setError('Polling timeout');
          updateDiagnostics({
            currentPhase: 'failed',
            lastError: 'Polling reached max attempts',
          });
          setIsImporting(false);
        }
      } catch (err) {
        console.error(`[import] Poll error:`, err);
        const errorMsg = err instanceof Error ? err.message : String(err);
        updateDiagnostics({ lastPollStatus: `Error: ${errorMsg}` });

        if (isAuthError(errorMsg)) {
          enterReAuthMode(errorMsg);
          return;
        }

        // Non-auth poll error
        attempts++;
        if (attempts < maxAttempts) {
          setTimeout(poll, 5000);
        } else {
          setImportPhase('failed');
          setError(`Poll error: ${errorMsg}`);
          updateDiagnostics({
            currentPhase: 'failed',
            lastError: `Poll error after ${attempts} attempts: ${errorMsg}`,
          });
          setIsImporting(false);
        }
      }
    };

    setTimeout(poll, 1000);
  };

  const fetchJobs = async () => {
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setLoadingJobs(true);
    setError('');
    try {
      const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-jobs?limit=20`, {
        headers: getAdminHeaders(token),
      });
      if (!response.ok) {
        const errorMsg = await parseApiError(response);
        if (isAuthError(errorMsg, response.status)) {
          setNeedsReAuth(true);
          setLoadingJobs(false);
          return;
        }
        throw new Error(errorMsg);
      }
      const data = await response.json();
      setJobs(data.jobs || []);
    } catch (err) {
      const rawError = err instanceof Error ? err.message : 'Failed to fetch jobs';
      handleAuthFailure(rawError);
    } finally {
      setLoadingJobs(false);
    }
  };

  const fetchAgencies = async () => {
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setLoadingAgencies(true);
    setError('');
    try {
      let url = `${SUPABASE_URL}/functions/v1/other-agencies-list?limit=100`;
      if (statusFilter !== 'all') url += `&status=${statusFilter}`;
      if (filterState) url += `&state=${filterState}`;
      if (searchQuery) url += `&q=${encodeURIComponent(searchQuery)}`;

      const response = await fetch(url, {
        headers: getAdminHeaders(token),
      });

      if (!response.ok) {
        const errorMsg = await parseApiError(response);
        if (isAuthError(errorMsg, response.status)) {
          setNeedsReAuth(true);
          setLoadingAgencies(false);
          return;
        }
        throw new Error(errorMsg);
      }

      const data = await response.json();
      setAgencies(data.agencies || []);
    } catch (err) {
      const rawError = err instanceof Error ? err.message : 'Failed to fetch agencies';
      handleAuthFailure(rawError);
      setAgencies([]);
    } finally {
      setLoadingAgencies(false);
    }
  };

  const handleViewAgency = async (agency: Agency) => {
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setError('');
    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-admin/${agency.id}`,
        {
          headers: getAdminHeaders(token),
        }
      );
      if (!response.ok) {
        if (response.status === 401 || response.status === 403) {
          setNeedsReAuth(true);
          return;
        }
      }
      const data = await response.json();
      if (response.ok && data.agency) {
        setViewAgency(data.agency);
      } else {
        setViewAgency(agency);
      }
    } catch (err) {
      setViewAgency(agency);
    }
  };

  const handleEditAgency = async (agency: Agency) => {
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setError('');
    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-admin/${agency.id}`,
        {
          headers: getAdminHeaders(token),
        }
      );
      if (!response.ok) {
        if (response.status === 401 || response.status === 403) {
          setNeedsReAuth(true);
          return;
        }
      }
      const data = await response.json();
      if (response.ok && data.agency) {
        setEditAgency(data.agency);
        setEditFormData({ ...data.agency });
        let emailsToSet = data.agency.emails && data.agency.emails.length > 0
          ? data.agency.emails
          : [];
        const seenEmails = new Set<string>();
        emailsToSet = emailsToSet.filter((e: EmailRow) => {
          const norm = (e.email_normalized || '').toLowerCase();
          if (seenEmails.has(norm)) {
            return false;
          }
          seenEmails.add(norm);
          return true;
        });

        const phonesToSet = data.agency.phones && data.agency.phones.length > 0
          ? data.agency.phones
          : [];
        setEditEmails(emailsToSet);
        setEditPhones(phonesToSet);
      } else {
        setEditAgency(agency);
        setEditFormData({ ...agency });
        setEditEmails(agency.emails || []);
        setEditPhones((agency as any).phones || []);
      }
    } catch (err) {
      setEditAgency(agency);
      setEditFormData({ ...agency });
      setEditEmails(agency.emails || []);
      setEditPhones((agency as any).phones || []);
    }
  };

  const handleSaveEdit = async () => {
    if (!editAgency) return;

    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setIsSaving(true);
    setError('');
    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-admin/${editAgency.id}`,
        {
          method: 'PUT',
          headers: getAdminHeaders(token, { json: true }),
          body: JSON.stringify({
            name: editFormData.name,
            website_url: editFormData.website_url,
            services: editFormData.services,
            primary_service: editFormData.primary_service,
            is_active: editFormData.is_active,
            zip_code: (editFormData as any).zip_code,
            full_address: (editFormData as any).full_address,
            maps_url: (editFormData as any).maps_url,
            latitude: (editFormData as any).latitude,
            longitude: (editFormData as any).longitude,
            maps_position: (editFormData as any).maps_position,
            keyword: (editFormData as any).keyword,
            facebook_url: (editFormData as any).facebook_url,
            instagram_url: (editFormData as any).instagram_url,
            twitter_url: (editFormData as any).twitter_url,
            youtube_url: (editFormData as any).youtube_url,
            linkedin_url: (editFormData as any).linkedin_url,
            emails: editEmails.map(e => e.email_raw || e.email_normalized || '').filter(e => e && e.trim()),
            phones: editPhones.map(p => p.phone_raw || '').filter(p => p && p.trim()),
          }),
        }
      );

      if (!response.ok) {
        const errorMsg = await parseApiError(response);
        if (isAuthError(errorMsg, response.status)) {
          setNeedsReAuth(true);
          setIsSaving(false);
          return;
        }
        throw new Error(errorMsg);
      }

      const data = await response.json();

      setEditAgency(null);
      setEditFormData({});
      setEditEmails([]);
      setEditPhones([]);
      await fetchAgencies();
    } catch (err) {
      const rawError = err instanceof Error ? err.message : 'Failed to save agency';
      handleAuthFailure(rawError);
    } finally {
      setIsSaving(false);
    }
  };

  const handleDeleteAgency = async () => {
    if (!deleteConfirm) return;

    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    setIsSaving(true);
    setError('');
    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/other-agencies-admin/${deleteConfirm}`,
        {
          method: 'DELETE',
          headers: getAdminHeaders(token),
        }
      );

      if (!response.ok) {
        const errorMsg = await parseApiError(response);
        if (isAuthError(errorMsg, response.status)) {
          setNeedsReAuth(true);
          setIsSaving(false);
          return;
        }
        throw new Error(errorMsg);
      }

      setDeleteConfirm(null);
      await fetchAgencies();
    } catch (err) {
      const rawError = err instanceof Error ? err.message : 'Failed to delete agency';
      handleAuthFailure(rawError);
    } finally {
      setIsSaving(false);
    }
  };

  const fetchJobEvents = async (jobId: string) => {
    if (!token || status === 'invalid') {
      enterReAuthMode('No token or invalid session');
      return;
    }

    const valid = await ensureValid();
    if (!valid) {
      enterReAuthMode('Session validation failed');
      return;
    }

    try {
      const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-jobs?job_id=${jobId}`, {
        headers: getAdminHeaders(token, { json: true }),
      });

      if (!response.ok) {
        const errorMsg = await parseApiError(response);
        if (isAuthError(errorMsg, response.status)) {
          enterReAuthMode(errorMsg, response.status);
          return;
        }
        throw new Error(errorMsg);
      }

      const data = await response.json();
      if (data.events) {
        setJobEvents(data.events);
      }
    } catch (err) {
      const rawError = err instanceof Error ? err.message : 'Failed to fetch job events';
      handleAuthFailure(rawError);
    }
  };

  const handleViewJobDetails = async (job: ImportJob) => {
    setViewJobDetails(job);
    await fetchJobEvents(job.id);
  };

  return (
    <WpAdminLayout>
      <div className="max-w-6xl mx-auto px-4 py-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Other Agencies Import</h1>
          <p className="text-gray-600">Bulk import agencies per state from CSV, JSON, or Excel files</p>
        </div>

        <div className="flex gap-2 mb-6 border-b border-gray-200">
          <button
            onClick={() => {
              setError('');
              setActiveTab('upload');
            }}
            className={`px-4 py-2 font-medium ${activeTab === 'upload' ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-600'}`}
          >
            Upload
          </button>
          <button
            onClick={() => {
              setError('');
              setActiveTab('jobs');
              fetchJobs();
            }}
            className={`px-4 py-2 font-medium ${activeTab === 'jobs' ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-600'}`}
          >
            Import History
          </button>
          <button
            onClick={() => {
              setError('');
              setActiveTab('manage');
              fetchAgencies();
            }}
            className={`px-4 py-2 font-medium ${activeTab === 'manage' ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-600'}`}
          >
            Manage Agencies
          </button>
        </div>

        {needsReAuth && (
          <div className="mb-6">
            <AdminReAuthCard
              onSuccess={handleReAuthSuccess}
              message="Your admin session has expired. Please log in again to continue using the import tools."
            />
          </div>
        )}

        {error && !needsReAuth && (
          <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg flex gap-3">
            <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
            <div>
              <p className="font-semibold text-red-900">Error</p>
              <p className="text-red-800">{error}</p>
            </div>
          </div>
        )}

        {fileNeedsReselect && !needsReAuth && (
          <div className="mb-6 p-4 bg-blue-50 border border-blue-200 rounded-lg flex gap-3">
            <AlertTriangle className="w-5 h-5 text-blue-600 shrink-0 mt-0.5" />
            <div>
              <p className="font-semibold text-blue-900">File Needs Re-selection</p>
              <p className="text-blue-800">For security reasons, please re-select your file after logging in again.</p>
              <button
                onClick={() => setFileNeedsReselect(false)}
                className="mt-2 text-sm text-blue-600 hover:text-blue-700 underline"
              >
                Dismiss
              </button>
            </div>
          </div>
        )}

        {activeTab === 'upload' && (
          <div className="space-y-6">
            <div className="bg-white rounded-lg border border-gray-200 p-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-4">Upload File</h2>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    State
                  </label>
                  <select
                    value={selectedState}
                    onChange={(e) => setSelectedState(e.target.value)}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">Select a state...</option>
                    {states.map((state) => (
                      <option key={state} value={state}>
                        {formatStateName(state)}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Format
                  </label>
                  <div className="flex gap-4">
                    <label className="flex items-center gap-2">
                      <input
                        type="radio"
                        value="csv"
                        checked={mode === 'csv'}
                        onChange={(e) => setMode(e.target.value as 'csv' | 'json' | 'xlsx')}
                      />
                      <span className="text-gray-700">CSV (comma or semicolon)</span>
                    </label>
                    <label className="flex items-center gap-2">
                      <input
                        type="radio"
                        value="json"
                        checked={mode === 'json'}
                        onChange={(e) => setMode(e.target.value as 'csv' | 'json' | 'xlsx')}
                      />
                      <span className="text-gray-700">JSON</span>
                    </label>
                    <label className="flex items-center gap-2">
                      <input
                        type="radio"
                        value="xlsx"
                        checked={mode === 'xlsx'}
                        onChange={(e) => setMode(e.target.value as 'csv' | 'json' | 'xlsx')}
                      />
                      <span className="text-gray-700">Excel (.xlsx / .xls)</span>
                    </label>
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    File
                  </label>
                  <div className="flex gap-2">
                    <input
                      ref={fileInputRef}
                      type="file"
                      accept={mode === 'xlsx' ? '.xlsx,.xls' : mode === 'csv' ? '.csv' : '.json'}
                      onChange={handleFileChange}
                      className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                    <button
                      onClick={() => fileInputRef.current?.click()}
                      className="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
                    >
                      Browse
                    </button>
                  </div>
                  {file && (
                    <p className="mt-2 text-sm text-green-700">
                      Selected: {file.name} ({(file.size / 1024).toFixed(1)} KB)
                    </p>
                  )}
                </div>

                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 space-y-3">
                  {mode === 'xlsx' ? (
                    <>
                      <h3 className="font-semibold text-blue-900 mb-2">Excel Format</h3>
                      <p className="text-sm text-blue-800">Supports Google Maps scraper exports. Uses first sheet with columns like:</p>
                      <code className="block text-xs bg-white p-2 rounded border border-blue-200 text-blue-900 overflow-x-auto">
                        Name | Website | Phone | Email | City | Zip | Facebook | Instagram | LinkedIn
                      </code>
                      <p className="text-xs text-blue-700">Automatically maps scraper columns to agency fields. Unknown columns are ignored safely.</p>
                    </>
                  ) : (
                    <>
                      <h3 className="font-semibold text-blue-900 mb-2">CSV Format</h3>
                      <p className="text-sm text-blue-800 mb-2">Supports comma-delimited, semicolon-delimited, and Excel exports with sep= directive:</p>
                      <code className="block text-xs bg-white p-2 rounded border border-blue-200 text-blue-900 overflow-x-auto">
                        Name, Website, Phone, Email, City, Zip, Facebook, Instagram, LinkedIn
                      </code>
                      <p className="text-xs text-blue-700 mt-2">
                        Accepted name column aliases: Name, Company Name, Agency Name, Business Name, Company, Agency, Title
                      </p>
                    </>
                  )}
                </div>

                <button
                  onClick={handleImport}
                  disabled={isImporting || isParsingExcel || !file || !selectedState}
                  className="w-full px-4 py-3 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 disabled:bg-gray-400 flex items-center justify-center gap-2"
                >
                  {isParsingExcel ? (
                    <>
                      <Loader className="w-5 h-5 animate-spin" />
                      Parsing Excel...
                    </>
                  ) : isImporting ? (
                    <>
                      <Loader className="w-5 h-5 animate-spin" />
                      Importing...
                    </>
                  ) : (
                    <>
                      <Upload className="w-5 h-5" />
                      Start Import
                    </>
                  )}
                </button>
              </div>
            </div>

            {importResult && (
              <div className={`rounded-lg p-6 ${
                importResult.status === 'failed'
                  ? 'bg-red-50 border border-red-200'
                  : importResult.status === 'completed' && importResult.failed > 0
                    ? 'bg-amber-50 border border-amber-200'
                  : importResult.status === 'completed'
                    ? 'bg-green-50 border border-green-200'
                    : 'bg-blue-50 border border-blue-200'
              }`}>
                <div className="flex gap-3 mb-4">
                  {importResult.status === 'failed' ? (
                    <AlertTriangle className="w-6 h-6 text-red-600 shrink-0" />
                  ) : importResult.status === 'completed' && importResult.failed > 0 ? (
                    <AlertTriangle className="w-6 h-6 text-amber-600 shrink-0" />
                  ) : importResult.status === 'completed' ? (
                    <CheckCircle className="w-6 h-6 text-green-600 shrink-0" />
                  ) : (
                    <Loader className="w-6 h-6 text-blue-600 shrink-0 animate-spin" />
                  )}
                  <div className="flex-1">
                    <h3 className={`font-semibold ${
                      importResult.status === 'failed'
                        ? 'text-red-900'
                        : importResult.status === 'completed' && importResult.failed > 0
                          ? 'text-amber-900'
                        : importResult.status === 'completed'
                          ? 'text-green-900'
                          : 'text-blue-900'
                    }`}>
                      {importResult.status === 'failed'
                        ? 'Import Failed'
                        : importResult.status === 'completed' && importResult.failed > 0
                          ? 'Import Completed with Errors'
                        : importResult.status === 'completed'
                          ? 'Import Completed Successfully'
                        : importResult.status === 'staged'
                          ? 'File Uploaded - Starting Parse...'
                        : importResult.status === 'parsing'
                          ? 'Parsing File...'
                        : importResult.status === 'queued'
                          ? 'Parse Complete - Processing...'
                          : 'Processing Import...'}
                    </h3>
                    <p className={`text-sm ${
                      importResult.status === 'failed'
                        ? 'text-red-800'
                        : importResult.status === 'completed' && importResult.failed > 0
                          ? 'text-amber-800'
                        : importResult.status === 'completed'
                          ? 'text-green-800'
                          : 'text-blue-800'
                    }`}>Job ID: {importResult.jobId}</p>
                    {importResult.status === 'failed' && (
                      <div className="mt-2 bg-red-100 rounded p-3 space-y-1">
                        {importResult.error_message && (
                          <p className="text-red-900 text-sm font-semibold break-all">{importResult.error_message}</p>
                        )}
                        {importResult.last_checkpoint && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">Last Checkpoint:</span>{' '}
                            <span className="font-mono">{importResult.last_checkpoint}</span>
                          </p>
                        )}
                        {importResult.source_rows_total !== undefined && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">Rows Read Before Failure:</span> {importResult.source_rows_total}
                          </p>
                        )}
                        {importResult.chunks_total !== undefined && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">Chunks Created:</span> {importResult.chunks_total}
                          </p>
                        )}
                        {importResult.detected_delimiter && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">Detected Delimiter:</span>{' '}
                            <span className="font-mono">{importResult.detected_delimiter === '\t' ? 'TAB' : importResult.detected_delimiter}</span>
                          </p>
                        )}
                        {importResult.detected_header_row !== undefined && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">Header Row Index:</span> {importResult.detected_header_row}
                          </p>
                        )}
                        {importResult.file_size_bytes && (
                          <p className="text-red-800 text-xs">
                            <span className="font-semibold">File Size:</span> {(importResult.file_size_bytes / (1024 * 1024)).toFixed(2)} MB
                          </p>
                        )}
                        {importResult.parse_progress && importResult.parse_progress.parse_bytes_total && importResult.parse_progress.parse_bytes_total > 0 && (
                          <div className="mt-1">
                            <p className="text-red-800 text-xs mb-1">
                              <span className="font-semibold">Parse Progress at Failure:</span>{' '}
                              {importResult.parse_progress.parse_bytes_percent ?? 0}%{' '}
                              ({((importResult.parse_progress.parse_bytes_done ?? 0) / (1024 * 1024)).toFixed(2)} MB / {((importResult.parse_progress.parse_bytes_total) / (1024 * 1024)).toFixed(2)} MB)
                              {importResult.parse_progress.parse_cursor_status && (
                                <span className="font-mono ml-1">[{importResult.parse_progress.parse_cursor_status}]</span>
                              )}
                            </p>
                            <div className="w-full bg-red-200 rounded-full h-1.5">
                              <div
                                className="bg-red-600 h-1.5 rounded-full"
                                style={{ width: `${importResult.parse_progress.parse_bytes_percent ?? 0}%` }}
                              />
                            </div>
                          </div>
                        )}
                        {importResult.storage_path && (
                          <p className="text-red-800 text-xs font-mono break-all">
                            <span className="font-semibold not-italic">File path:</span> {importResult.storage_path}
                          </p>
                        )}
                      </div>
                    )}
                    {importResult.status !== 'completed' && importResult.status !== 'failed' && (
                      <div className="mt-3 space-y-2">
                        {importResult.status === 'parsing' && importResult.parse_progress && (importResult.parse_progress.parse_bytes_total ?? 0) > 0 ? (
                          <>
                            <div className="flex justify-between text-xs text-blue-700 mb-1">
                              <span>
                                Parsing: {((importResult.parse_progress.parse_bytes_done ?? 0) / (1024 * 1024)).toFixed(1)} MB / {((importResult.parse_progress.parse_bytes_total ?? 0) / (1024 * 1024)).toFixed(1)} MB
                                {(importResult.source_rows_total ?? 0) > 0 && ` — ${importResult.source_rows_total} rows parsed`}
                              </span>
                              <span>{importResult.parse_progress.parse_bytes_percent ?? 0}%</span>
                            </div>
                            <div className="w-full bg-blue-200 rounded-full h-2">
                              <div
                                className="bg-blue-600 h-2 rounded-full transition-all duration-300"
                                style={{ width: `${importResult.parse_progress.parse_bytes_percent ?? 0}%` }}
                              />
                            </div>
                          </>
                        ) : (
                          <>
                            <div className="flex justify-between text-xs text-blue-700 mb-1">
                              <span>
                                {importResult.status === 'parsing' ? 'Parsing file...' : `Progress: ${importResult.chunks_processed || 0} / ${importResult.chunks_total || '?'} chunks`}
                                {(importResult.source_rows_total ?? 0) > 0 && ` — ${importResult.source_rows_total} rows`}
                              </span>
                              <span>{importResult.progress_percent || 0}%</span>
                            </div>
                            <div className="w-full bg-blue-200 rounded-full h-2">
                              <div
                                className="bg-blue-600 h-2 rounded-full transition-all duration-300"
                                style={{ width: `${importResult.status === 'parsing' ? (importResult.parse_progress?.parse_bytes_percent ?? 5) : (importResult.progress_percent || 0)}%` }}
                              />
                            </div>
                          </>
                        )}
                      </div>
                    )}
                  </div>
                </div>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-center mb-4 pb-4 border-b border-gray-200">
                  <div>
                    <p className="text-2xl font-bold text-gray-700">{importResult.rows_read ?? importResult.total_agencies}</p>
                    <p className="text-xs text-gray-600">Rows Read</p>
                  </div>
                  <div>
                    <p className="text-2xl font-bold text-amber-600">{importResult.duplicate_rows_skipped ?? 0}</p>
                    <p className="text-xs text-amber-700">Duplicate Rows Skipped</p>
                  </div>
                  <div>
                    <p className="text-2xl font-bold text-green-600">{importResult.agencies_created}</p>
                    <p className="text-xs text-green-700">New Agencies</p>
                  </div>
                  <div>
                    <p className="text-2xl font-bold text-blue-600">{importResult.agencies_updated}</p>
                    <p className="text-xs text-blue-700">Updated Agencies</p>
                  </div>
                </div>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-center">
                  <div>
                    <p className="text-2xl font-bold text-emerald-600">{importResult.emails_created}</p>
                    <p className="text-xs text-emerald-700">Unique Emails Added</p>
                  </div>
                  <div>
                    <p className="text-2xl font-bold text-gray-400">{importResult.duplicate_emails_skipped ?? 0}</p>
                    <p className="text-xs text-gray-500">Duplicate Emails Skipped</p>
                  </div>
                  <div>
                    <p className="text-2xl font-bold text-teal-600">{importResult.queue_ready_unique_emails ?? 0}</p>
                    <p className="text-xs text-teal-700">Queue-Ready for ListClean</p>
                  </div>
                  <div>
                    <p className={`text-2xl font-bold ${importResult.failed > 0 ? 'text-red-600' : 'text-gray-400'}`}>{importResult.failed}</p>
                    <p className="text-xs text-red-700">Failed</p>
                  </div>
                </div>
                {importResult.agencies_with_no_email > 0 && (
                  <p className="text-xs text-amber-700 mt-3">Note: {importResult.agencies_with_no_email} agencies imported without email addresses</p>
                )}

                {importResult.errors && importResult.errors.length > 0 && (
                  <div className="mt-4 pt-4 border-t border-gray-200">
                    <h4 className="font-semibold text-red-800 mb-2">Error Samples (first {Math.min(importResult.errors.length, 10)}):</h4>
                    <div className="space-y-2 max-h-60 overflow-y-auto">
                      {importResult.errors.slice(0, 10).map((err, idx) => (
                        <div key={idx} className="bg-red-100 rounded p-2 text-sm">
                          <span className="font-medium text-red-900">Row {err.row}:</span>{' '}
                          <span className="text-red-800">{err.agency}</span>
                          <p className="text-red-700 text-xs mt-1 font-mono">{err.error}</p>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            )}

            {/* DIAGNOSTICS PANEL - always visible for debugging */}
            <div className="bg-gray-900 rounded-lg p-6 text-white font-mono text-xs">
              <h3 className="font-bold text-yellow-400 mb-4 text-sm flex items-center gap-2">
                <span className="bg-yellow-400 text-gray-900 px-2 py-1 rounded">DIAGNOSTICS</span>
                Import State Machine
              </h3>
              <div className="grid grid-cols-2 gap-x-6 gap-y-2">
                <div>
                  <span className="text-gray-400">Phase:</span>
                  <span className={`ml-2 font-bold ${
                    importPhase === 'completed' ? 'text-green-400' :
                    importPhase === 'failed' ? 'text-red-400' :
                    importPhase === 'reauth_required' ? 'text-yellow-400' :
                    'text-blue-400'
                  }`}>{importPhase.toUpperCase()}</span>
                </div>
                <div>
                  <span className="text-gray-400">File:</span>
                  <span className="ml-2 text-white truncate">{diagnostics.selectedFileName || 'none'}</span>
                </div>
                <div>
                  <span className="text-gray-400">Size:</span>
                  <span className="ml-2 text-white">{diagnostics.selectedFileSize > 0 ? `${(diagnostics.selectedFileSize / 1024).toFixed(1)} KB` : '0'}</span>
                </div>
                <div>
                  <span className="text-gray-400">State:</span>
                  <span className="ml-2 text-white">{diagnostics.selectedState || 'none'}</span>
                </div>
                <div>
                  <span className="text-gray-400">Token Present:</span>
                  <span className={`ml-2 font-bold ${diagnostics.tokenPresent ? 'text-green-400' : 'text-red-400'}`}>
                    {diagnostics.tokenPresent ? 'YES' : 'NO'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">ensureValid():</span>
                  <span className={`ml-2 font-bold ${
                    diagnostics.ensureValidPassed === null ? 'text-gray-400' :
                    diagnostics.ensureValidPassed ? 'text-green-400' : 'text-red-400'
                  }`}>
                    {diagnostics.ensureValidPassed === null ? 'NOT CALLED' : diagnostics.ensureValidPassed ? 'PASS' : 'FAIL'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Upload Started:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadStarted ? 'text-green-400' : 'text-gray-400'}`}>
                    {diagnostics.uploadStarted ? 'YES' : 'NO'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Response Received:</span>
                  <span className={`ml-2 font-bold ${
                    !diagnostics.uploadStarted ? 'text-gray-400' :
                    diagnostics.uploadFetchThrew ? 'text-red-400' :
                    diagnostics.uploadResponseReceived ? 'text-green-400' : 'text-yellow-400'
                  }`}>
                    {!diagnostics.uploadStarted ? 'N/A' :
                     diagnostics.uploadFetchThrew ? 'NO — fetch() THREW' :
                     diagnostics.uploadResponseReceived ? 'YES' : 'PENDING'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Upload Status:</span>
                  <span className={`ml-2 font-bold ${
                    diagnostics.uploadResponseStatus === null ? 'text-gray-400' :
                    diagnostics.uploadResponseStatus < 300 ? 'text-green-400' : 'text-red-400'
                  }`}>
                    {diagnostics.uploadResponseStatus ?? 'N/A'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Uses FormData:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadUsesFormData ? 'text-green-400' : 'text-gray-400'}`}>
                    {diagnostics.uploadStarted ? (diagnostics.uploadUsesFormData ? 'YES' : 'NO') : 'N/A'}
                  </span>
                </div>
                <div className="col-span-2 mt-1 pt-1 border-t border-gray-700">
                  <span className="text-gray-300 font-semibold">Upload Request Headers:</span>
                </div>
                <div>
                  <span className="text-gray-400">Authorization:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadHasAuthorization ? 'text-green-400' : 'text-red-400'}`}>
                    {diagnostics.uploadStarted ? (diagnostics.uploadHasAuthorization ? 'PRESENT' : 'MISSING') : 'N/A'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">apikey:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadHasApikey ? 'text-green-400' : 'text-red-400'}`}>
                    {diagnostics.uploadStarted ? (diagnostics.uploadHasApikey ? 'PRESENT' : 'MISSING') : 'N/A'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">x-admin-token:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadHasAdminToken ? 'text-green-400' : 'text-red-400'}`}>
                    {diagnostics.uploadStarted ? (diagnostics.uploadHasAdminToken ? 'IN BODY (not header)' : 'MISSING') : 'N/A'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Content-Type:</span>
                  <span className={`ml-2 font-bold ${diagnostics.uploadHasContentType ? 'text-yellow-400' : 'text-green-400'}`}>
                    {diagnostics.uploadStarted ? (diagnostics.uploadHasContentType ? 'MANUALLY SET (may break FormData)' : 'OMITTED (correct for FormData)') : 'N/A'}
                  </span>
                </div>
                <div className="col-span-2 mt-1 pt-1 border-t border-gray-700">
                  <span className="text-gray-400">Upload URL:</span>
                  <span className="ml-2 text-cyan-300 break-all text-xs">{diagnostics.uploadUrl || 'not set'}</span>
                </div>
                <div className="col-span-2">
                  <span className="text-gray-400">Job ID:</span>
                  <span className="ml-2 text-cyan-400 break-all">{diagnostics.jobIdReceived || 'none'}</span>
                </div>
                <div>
                  <span className="text-gray-400">importResult Set:</span>
                  <span className={`ml-2 font-bold ${diagnostics.importResultSet ? 'text-green-400' : 'text-gray-400'}`}>
                    {diagnostics.importResultSet ? 'YES' : 'NO'}
                  </span>
                </div>
                <div>
                  <span className="text-gray-400">Polling Started:</span>
                  <span className={`ml-2 font-bold ${diagnostics.pollingStarted ? 'text-green-400' : 'text-gray-400'}`}>
                    {diagnostics.pollingStarted ? 'YES' : 'NO'}
                  </span>
                </div>
                <div className="col-span-2">
                  <span className="text-gray-400">Last Poll:</span>
                  <span className="ml-2 text-white break-all">{diagnostics.lastPollStatus || 'none'}</span>
                </div>
                <div className="col-span-2">
                  <span className="text-gray-400">Last Auth Check:</span>
                  <span className="ml-2 text-white break-all">{diagnostics.lastAuthCheck || 'none'}</span>
                </div>
                <div className="col-span-2">
                  <span className="text-gray-400">Last Error:</span>
                  <span className="ml-2 text-red-300 break-all">{diagnostics.lastError || 'none'}</span>
                </div>
                <div className="col-span-2 mt-2 pt-2 border-t border-gray-700">
                  <span className="text-gray-400">Upload Response Body:</span>
                  <pre className="ml-2 text-xs text-gray-300 mt-1 p-2 bg-gray-800 rounded max-h-24 overflow-auto">
                    {diagnostics.uploadResponseBody || 'none'}
                  </pre>
                </div>
              </div>
            </div>
          </div>
        )}

        {activeTab === 'jobs' && (
          <div className="space-y-4">
            {loadingJobs ? (
              <div className="text-center py-8">
                <Loader className="w-6 h-6 animate-spin mx-auto text-gray-400" />
              </div>
            ) : jobs.length === 0 ? (
              <p className="text-gray-600">No import jobs yet</p>
            ) : (
              <div className="space-y-2">
                {jobs.map((job) => (
                  <div key={job.id} className="bg-white rounded-lg border border-gray-200 p-4 flex items-start justify-between">
                    <div className="flex-1">
                      <p className="font-medium text-gray-900">{job.filename}</p>
                      <p className="text-sm text-gray-600">
                        {job.state_slug} • {job.mode.toUpperCase()} • {new Date(job.created_at).toLocaleDateString()}
                      </p>
                      <div className="flex gap-4 mt-2 text-xs">
                        <span className="text-green-700">↓ {job.inserted} inserted</span>
                        <span className="text-blue-700">↔ {job.updated} updated</span>
                        <span className="text-red-700">✕ {job.failed} failed</span>
                      </div>
                    </div>
                    <span className={`px-2 py-1 rounded text-xs font-medium ${
                      job.status === 'completed' ? 'bg-green-100 text-green-700' :
                      job.status === 'failed' ? 'bg-red-100 text-red-700' :
                      job.status === 'processing' || job.status === 'parsing' ? 'bg-blue-100 text-blue-700' :
                      job.status === 'partial_success' ? 'bg-orange-100 text-orange-700' :
                      'bg-yellow-100 text-yellow-700'
                    }`}>
                      {job.status}
                    </span>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

        {activeTab === 'manage' && (
          <div className="space-y-4">
            <div className="flex gap-4 mb-4 flex-wrap">
              <select
                value={filterState}
                onChange={(e) => setFilterState(e.target.value)}
                className="px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="">All states</option>
                {states.map((state) => (
                  <option key={state} value={state}>
                    {formatStateName(state)}
                  </option>
                ))}
              </select>

              <select
                value={statusFilter}
                onChange={(e) => setStatusFilter(e.target.value as 'active' | 'inactive' | 'all')}
                className="px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
                <option value="all">All</option>
              </select>

              <input
                type="text"
                placeholder="Search by name..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              <button
                onClick={fetchAgencies}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
              >
                Search
              </button>
            </div>

            {loadingAgencies ? (
              <div className="text-center py-8">
                <Loader className="w-6 h-6 animate-spin mx-auto text-gray-400" />
              </div>
            ) : agencies.length === 0 ? (
              <p className="text-gray-600 text-center py-8">No agencies found</p>
            ) : (
              <div className="space-y-2">
                {agencies.map((agency) => (
                  <div key={agency.id} className="bg-white rounded-lg border border-gray-200 p-4 flex items-start justify-between">
                    <div className="flex-1">
                      <p className="font-medium text-gray-900">{agency.name}</p>
                      <p className="text-sm text-gray-600">
                        {agency.city && `${agency.city}, `}{formatStateName(agency.state_slug)}
                      </p>
                      {agency.services && agency.services.length > 0 && (
                        <div className="flex gap-1 mt-2 flex-wrap">
                          {agency.services.slice(0, 3).map((service) => (
                            <span key={service} className="text-xs bg-gray-100 text-gray-700 px-2 py-1 rounded">
                              {service}
                            </span>
                          ))}
                          {agency.services.length > 3 && (
                            <span className="text-xs text-gray-600">+{agency.services.length - 3}</span>
                          )}
                        </div>
                      )}
                    </div>
                    <div className="flex gap-2">
                      <button
                        onClick={() => handleViewAgency(agency)}
                        className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded"
                        title="View"
                      >
                        <Eye className="w-4 h-4" />
                      </button>
                      <button
                        onClick={() => handleEditAgency(agency)}
                        className="p-2 text-gray-400 hover:text-blue-600 hover:bg-blue-50 rounded"
                        title="Edit"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                      <button
                        onClick={() => setDeleteConfirm(agency.id)}
                        className="p-2 text-gray-400 hover:text-red-600 hover:bg-red-50 rounded"
                        title="Delete"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

      {/* View Modal */}
      {viewAgency && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-lg max-w-md w-full mx-4 max-h-[90vh] overflow-y-auto">
            <div className="p-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">{viewAgency.name}</h2>

              <div className="space-y-4">
                <div>
                  <p className="text-sm font-medium text-gray-500">State</p>
                  <p className="text-gray-900">{formatStateName(viewAgency.state_slug)}</p>
                </div>

                {viewAgency.city && (
                  <div>
                    <p className="text-sm font-medium text-gray-500">City</p>
                    <p className="text-gray-900">{viewAgency.city}</p>
                  </div>
                )}

                {viewAgency.website_url && (
                  <div>
                    <p className="text-sm font-medium text-gray-500">Website</p>
                    <a href={viewAgency.website_url} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline break-all">
                      {viewAgency.website_url}
                    </a>
                  </div>
                )}

                {viewAgency.phone && (
                  <div>
                    <p className="text-sm font-medium text-gray-500">Phone</p>
                    <p className="text-gray-900">{viewAgency.phone}</p>
                  </div>
                )}

                {viewAgency.services && viewAgency.services.length > 0 && (
                  <div>
                    <p className="text-sm font-medium text-gray-500">Services</p>
                    <div className="flex flex-wrap gap-2 mt-2">
                      {viewAgency.services.map((service) => (
                        <span key={service} className="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded">
                          {service}
                        </span>
                      ))}
                    </div>
                  </div>
                )}

                <div>
                  <p className="text-sm font-medium text-gray-500">Status</p>
                  <p className="text-gray-900">
                    {viewAgency.is_active === true
                      ? 'Active'
                      : viewAgency.is_active === false
                      ? 'Inactive'
                      : 'Unknown'}
                  </p>
                </div>

                {viewAgency.emails && viewAgency.emails.length > 0 && (
                  <div>
                    <p className="text-sm font-medium text-gray-500">Emails</p>
                    <div className="flex flex-wrap gap-2 mt-2">
                      {viewAgency.emails.map((emailRow, idx) => (
                        <div key={idx} className="text-xs bg-amber-100 text-amber-700 px-2 py-1 rounded">
                          {emailRow.email_raw || emailRow.email_normalized || '(empty)'}
                          {emailRow.is_primary && <span className="ml-1 font-bold">★</span>}
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>

              <button
                onClick={() => setViewAgency(null)}
                className="mt-6 w-full px-4 py-2 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 font-medium"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Edit Modal */}
      {editAgency && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-lg max-w-md w-full mx-4 max-h-[90vh] overflow-y-auto">
            <div className="p-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">Edit Agency</h2>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
                  <input
                    type="text"
                    value={editFormData.name || ''}
                    onChange={(e) => setEditFormData({ ...editFormData, name: e.target.value })}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Website URL</label>
                  <input
                    type="text"
                    value={editFormData.website_url || ''}
                    onChange={(e) => setEditFormData({ ...editFormData, website_url: e.target.value })}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                  />
                </div>


                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Services</label>
                  <div className="space-y-2 max-h-32 overflow-y-auto">
                    {[
                      'Analytics', 'Branding', 'CRO', 'Conversion Optimization',
                      'Email Marketing', 'Google Ads', 'Lead Generation', 'Local SEO',
                      'Marketing Strategy', 'PPC', 'Paid Social', 'Performance Marketing',
                      'UX/UI Design', 'Web Development'
                    ].map((service) => (
                      <label key={service} className="flex items-center gap-2">
                        <input
                          type="checkbox"
                          checked={(editFormData.services || []).includes(service)}
                          onChange={(e) => {
                            const services = editFormData.services || [];
                            if (e.target.checked) {
                              setEditFormData({ ...editFormData, services: [...services, service] });
                            } else {
                              setEditFormData({ ...editFormData, services: services.filter(s => s !== service) });
                            }
                          }}
                          className="w-4 h-4"
                        />
                        <span className="text-sm text-gray-700">{service}</span>
                      </label>
                    ))}
                  </div>
                </div>

                <div className="border-t pt-4 mt-4">
                  <p className="text-xs font-semibold text-gray-500 uppercase mb-3">Optional Scraper Data</p>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Full Address</label>
                    <input
                      type="text"
                      value={(editFormData as any).full_address || ''}
                      onChange={(e) => setEditFormData({ ...editFormData, full_address: e.target.value } as any)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                    />
                  </div>

                  <div className="mt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Zip Code</label>
                    <input
                      type="text"
                      value={(editFormData as any).zip_code || ''}
                      onChange={(e) => setEditFormData({ ...editFormData, zip_code: e.target.value } as any)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                    />
                  </div>

                  <div className="mt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Maps URL</label>
                    <input
                      type="text"
                      value={(editFormData as any).maps_url || ''}
                      onChange={(e) => setEditFormData({ ...editFormData, maps_url: e.target.value } as any)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                    />
                  </div>

                  <div className="mt-2 grid grid-cols-2 gap-2">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Latitude</label>
                      <input
                        type="number"
                        step="0.00001"
                        value={(editFormData as any).latitude || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, latitude: e.target.value ? parseFloat(e.target.value) : undefined } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Longitude</label>
                      <input
                        type="number"
                        step="0.00001"
                        value={(editFormData as any).longitude || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, longitude: e.target.value ? parseFloat(e.target.value) : undefined } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                      />
                    </div>
                  </div>

                  <div className="mt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Keyword</label>
                    <input
                      type="text"
                      value={(editFormData as any).keyword || ''}
                      onChange={(e) => setEditFormData({ ...editFormData, keyword: e.target.value } as any)}
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                    />
                  </div>

                  <div className="mt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Social URLs</label>
                    <div className="space-y-2 text-sm">
                      <input
                        type="text"
                        placeholder="Facebook"
                        value={(editFormData as any).facebook_url || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, facebook_url: e.target.value } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="text"
                        placeholder="Instagram"
                        value={(editFormData as any).instagram_url || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, instagram_url: e.target.value } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="text"
                        placeholder="Twitter/X"
                        value={(editFormData as any).twitter_url || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, twitter_url: e.target.value } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="text"
                        placeholder="YouTube"
                        value={(editFormData as any).youtube_url || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, youtube_url: e.target.value } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <input
                        type="text"
                        placeholder="LinkedIn"
                        value={(editFormData as any).linkedin_url || ''}
                        onChange={(e) => setEditFormData({ ...editFormData, linkedin_url: e.target.value } as any)}
                        className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                    </div>
                  </div>
                </div>

                <div className="mt-4 pt-4 border-t">
                  <label className="block mb-4">
                    <span className="text-sm font-medium text-gray-700 block mb-2">Your Agency Link</span>
                    <div className="flex gap-2">
                      <input
                        type="text"
                        value={editAgency?.slug ? `https://gappsy.com/your-agency/${editAgency.slug}` : editAgency?.id ? `https://gappsy.com/your-agency/${editAgency.id}` : 'Slug not generated yet'}
                        readOnly
                        className="flex-1 px-3 py-2 border border-gray-300 rounded-lg bg-gray-50 text-gray-700 text-sm"
                      />
                      <button
                        onClick={() => {
                          const linkText = editAgency?.slug ? `https://gappsy.com/your-agency/${editAgency.slug}` : editAgency?.id ? `https://gappsy.com/your-agency/${editAgency.id}` : null;
                          if (linkText) {
                            navigator.clipboard.writeText(linkText).catch(() => {});
                          }
                        }}
                        className="px-3 py-2 bg-blue-100 text-blue-600 rounded hover:bg-blue-200 text-sm font-medium whitespace-nowrap"
                      >
                        Copy
                      </button>
                    </div>
                  </label>

                  <label className="flex items-center gap-2">
                    <input
                      type="checkbox"
                      checked={editFormData.is_active !== false}
                      onChange={(e) => setEditFormData({ ...editFormData, is_active: e.target.checked })}
                      className="w-4 h-4"
                    />
                    <span className="text-sm font-medium text-gray-700">Active</span>
                  </label>
                </div>

                <div className="border-t pt-4 mt-4">
                  <div className="mb-2">
                    <p className="text-sm font-medium text-gray-700 mb-2">Emails</p>
                    <p className="text-xs text-gray-500 mb-3">Only email addresses marked "Clean / Valid" after verification (ListClean API automation or manual import).</p>
                  </div>
                  <div className="space-y-2">
                    {editEmails.map((emailRow, idx) => {
                      const attemptCount = (emailRow as any)?.verification_attempt_count || 0;
                      const isFinalized = !!(emailRow as any)?.verification_finalized_at;
                      const hasRetryScheduled = !!(emailRow as any)?.verification_next_retry_at && !isFinalized;

                      let statusColor = 'red';
                      let statusLabel = 'Not Verified';

                      if (emailRow.validation_status === 'valid') {
                        statusColor = 'green';
                        statusLabel = 'Clean / Valid';
                      } else if (emailRow.validation_status === 'invalid') {
                        statusColor = 'red';
                        statusLabel = 'Invalid / Dirty';
                      } else if (emailRow.validation_status === 'risky' || emailRow.validation_status === 'catch_all') {
                        statusColor = 'amber';
                        statusLabel = emailRow.validation_status === 'risky' ? 'Risky' : 'Catch-all';
                      } else if (emailRow.validation_status === 'duplicate') {
                        statusColor = 'amber';
                        statusLabel = 'Duplicate';
                      } else if (emailRow.validation_status === 'retry') {
                        statusColor = 'amber';
                        statusLabel = hasRetryScheduled ? 'Retry (scheduled)' : 'Retry';
                      } else if (emailRow.validation_status === 'failed') {
                        statusColor = 'red';
                        statusLabel = 'Failed (max retries)';
                      } else if (emailRow.validation_status === 'pending') {
                        statusColor = 'amber';
                        statusLabel = 'Pending';
                      }

                      const statusBgClass = statusColor === 'green' ? 'bg-green-50 border-green-200' : statusColor === 'red' ? 'bg-red-50 border-red-200' : 'bg-amber-50 border-amber-200';
                      const statusBadgeClass = statusColor === 'green' ? 'bg-green-100 text-green-700' : statusColor === 'red' ? 'bg-red-100 text-red-700' : 'bg-amber-100 text-amber-700';

                      return (
                        <div key={idx} className={`flex gap-2 p-2 border rounded-lg ${statusBgClass}`}>
                          <div className="flex-1">
                            <input
                              type="email"
                              value={emailRow.email_raw || emailRow.email_normalized || ''}
                              onChange={(e) => {
                                const updated = [...editEmails];
                                updated[idx] = { ...emailRow, email_raw: e.target.value, email_normalized: e.target.value.toLowerCase() };
                                setEditEmails(updated);
                              }}
                              placeholder="email@example.com"
                              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                            />
                            <div className="mt-1 flex flex-col gap-1">
                              <div className="flex items-center gap-2">
                                <span className={`inline-block px-2 py-0.5 rounded text-xs font-medium ${statusBadgeClass}`}>
                                  {statusLabel}
                                </span>
                                {attemptCount > 0 && (
                                  <span className="text-xs text-gray-500">
                                    Attempt {attemptCount}/6
                                  </span>
                                )}
                              </div>
                              {emailRow.validation_reason && (
                                <span className="text-xs text-gray-600">{emailRow.validation_reason}</span>
                              )}
                              {hasRetryScheduled && (emailRow as any)?.verification_next_retry_at && (
                                <span className="text-xs text-amber-700">
                                  Next retry: {new Date((emailRow as any).verification_next_retry_at).toLocaleDateString()}
                                </span>
                              )}
                            </div>
                          </div>
                          <button
                            onClick={() => {
                              setEditEmails(editEmails.filter((_, i) => i !== idx));
                            }}
                            className="px-2 py-2 bg-red-100 text-red-600 rounded hover:bg-red-200 text-sm font-medium h-fit"
                          >
                            Remove
                          </button>
                        </div>
                      );
                    })}
                    <button
                      onClick={() => {
                        setEditEmails([...editEmails, { email_raw: '', email_normalized: '', validation_status: 'pending', is_primary: false }]);
                      }}
                      className="w-full px-3 py-2 border border-dashed border-gray-300 rounded-lg text-sm text-gray-600 hover:bg-gray-50 font-medium"
                    >
                      Add Email
                    </button>
                  </div>
                </div>
              </div>

              <div className="border-t pt-4 mt-4">
                <div className="mb-2">
                  <p className="text-sm font-medium text-gray-700 mb-1">Primary Phone</p>
                  <p className="text-xs text-gray-500 mb-3">Main phone number for agency contact.</p>
                </div>
                <div className="mb-4">
                  {editPhones.length > 0 && editPhones[0]?.is_primary && (
                    <div className="flex gap-2 p-2 border rounded-lg bg-blue-50 border-blue-200">
                      <div className="flex-1">
                        <input
                          type="tel"
                          value={editPhones[0]?.phone_raw || ''}
                          onChange={(e) => {
                            const updated = [...editPhones];
                            updated[0] = { ...editPhones[0], phone_raw: e.target.value };
                            setEditPhones(updated);
                          }}
                          placeholder="+1 (555) 123-4567"
                          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                        />
                        {editPhones[0]?.phone_normalized && (
                          <span className="text-xs text-gray-600 mt-1 block">
                            Normalized: {editPhones[0].phone_normalized}
                          </span>
                        )}
                      </div>
                    </div>
                  )}
                  {editPhones.length === 0 && (
                    <p className="text-xs text-gray-500 italic">No primary phone set</p>
                  )}
                </div>

                <div className="mb-2">
                  <p className="text-sm font-medium text-gray-700 mb-1">Additional Phones</p>
                  <p className="text-xs text-gray-500 mb-3">Additional phone numbers for future outreach/SMS. Primary phone is shown above.</p>
                </div>
                <div className="space-y-2">
                  {editPhones.slice(1).map((phoneRow, sliceIdx) => {
                    const actualIdx = sliceIdx + 1;
                    return (
                      <div key={sliceIdx} className="flex gap-2 p-2 border rounded-lg bg-blue-50 border-blue-200">
                        <div className="flex-1">
                          <input
                            type="tel"
                            value={phoneRow.phone_raw || ''}
                            onChange={(e) => {
                              const updated = [...editPhones];
                              updated[actualIdx] = { ...phoneRow, phone_raw: e.target.value };
                              setEditPhones(updated);
                            }}
                            placeholder="+1 (555) 123-4567"
                            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
                          />
                          {phoneRow.phone_normalized && (
                            <span className="text-xs text-gray-600 mt-1 block">
                              Normalized: {phoneRow.phone_normalized}
                            </span>
                          )}
                        </div>
                        <button
                          onClick={() => {
                            setEditPhones(editPhones.filter((_, i) => i !== actualIdx));
                          }}
                          className="px-2 py-2 bg-red-100 text-red-600 rounded hover:bg-red-200 text-sm font-medium h-fit"
                        >
                          Remove
                        </button>
                      </div>
                    );
                  })}
                  <button
                    onClick={() => {
                      setEditPhones([...editPhones, { phone_raw: '', phone_normalized: null, is_primary: editPhones.length === 0 }]);
                    }}
                    className="w-full px-3 py-2 border border-dashed border-gray-300 rounded-lg text-sm text-gray-600 hover:bg-gray-50 font-medium"
                  >
                    Add Phone
                  </button>
                </div>
              </div>

              <div className="mt-6 flex gap-2">
                <button
                  onClick={() => {
                    setEditAgency(null);
                    setEditFormData({});
                    setEditEmails([]);
                    setEditPhones([]);
                  }}
                  className="flex-1 px-4 py-2 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 font-medium"
                >
                  Cancel
                </button>
                <button
                  onClick={handleSaveEdit}
                  disabled={isSaving}
                  className="flex-1 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium disabled:bg-gray-400 flex items-center justify-center gap-2"
                >
                  {isSaving && <Loader className="w-4 h-4 animate-spin" />}
                  {isSaving ? 'Saving...' : 'Save'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Delete Confirmation Modal */}
      {deleteConfirm && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-lg max-w-sm w-full mx-4">
            <div className="p-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">Delete Agency?</h2>
              <p className="text-gray-600 mb-6">This will deactivate the agency. It can be reactivated later.</p>

              <div className="flex gap-2">
                <button
                  onClick={() => setDeleteConfirm(null)}
                  className="flex-1 px-4 py-2 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 font-medium"
                >
                  Cancel
                </button>
                <button
                  onClick={handleDeleteAgency}
                  disabled={isSaving}
                  className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 font-medium disabled:bg-gray-400 flex items-center justify-center gap-2"
                >
                  {isSaving && <Loader className="w-4 h-4 animate-spin" />}
                  {isSaving ? 'Deleting...' : 'Delete'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
      </div>
    </WpAdminLayout>
  );
}
