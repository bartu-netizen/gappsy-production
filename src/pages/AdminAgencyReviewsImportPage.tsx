import { useState, useRef, useCallback } from 'react';
import { Link } from 'react-router-dom';
import {
  Upload, Download, AlertTriangle, CheckCircle, Loader, Eye,
  ArrowLeft, FileText, FileCode, Info, ChevronDown, ChevronUp, X
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import {
  normalizeAndValidateRow,
  getUniquenessLabel,
  getPublishEligibility,
  ParsedImportRow,
  STATE_SLUG_TO_NAME,
} from '../lib/agencyReviewImport';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

const CSV_HEADER = 'agency_name;agency_slug;state_slug;state_name;city;review_type;is_top_25_ranked;website_url;services_offered;target_clients;geographic_reach;team_size_range;evaluation_status;about_description;strengths;concerns;risk_factors;fit_for;case_studies_status;pricing_transparency;team_information;independent_recognition;local_presence;entity_signals';

const CSV_EXAMPLE_ROW = 'Lone Star Digital Solutions;lone-star-digital-solutions-texas;texas;Texas;Austin;positive;true;https://example.com;SEO|PPC|Web Design|Social Media;Local businesses|Ecommerce;Texas|US;5-15;Top 25 Agency;Lone Star Digital Solutions is an Austin-based marketing agency specializing in results-driven campaigns for Texas businesses. Founded in 2015, their team of 10 combines deep local market expertise with data-driven strategies. They have a documented track record of delivering measurable ROI across SEO, paid media, and web design engagements, with a client portfolio spanning retail, professional services, and e-commerce sectors.;Clear reporting|Strong execution|Fast communication|Great audits|Proven local SEO results;None;Scope creep risk|Pricing ambiguity;Local SEO|Paid Search|Small-mid brands|Ecommerce|Service businesses;Has public case studies;Pricing partially disclosed;Team page exists;Mentions in directories;Local office listed;Clutch profile|Google Business Profile';

const JSON_EXAMPLE = JSON.stringify([
  {
    agency_name: "Lone Star Digital Solutions",
    agency_slug: "lone-star-digital-solutions-texas",
    state_slug: "texas",
    state_name: "Texas",
    city: "Austin",
    review_type: "positive",
    is_top_25_ranked: true,
    website_url: "https://example.com",
    services_offered: ["SEO", "PPC", "Web Design", "Social Media"],
    target_clients: ["Local businesses", "Ecommerce"],
    geographic_reach: ["Texas", "US"],
    team_size_range: "5-15",
    evaluation_status: "Top 25 Agency",
    about_description: "Lone Star Digital Solutions is an Austin-based marketing agency specializing in results-driven campaigns for Texas businesses. Founded in 2015, their team of 10 combines deep local market expertise with data-driven strategies.",
    strengths: ["Clear reporting", "Strong execution", "Fast communication", "Great audits"],
    concerns: [],
    risk_factors: ["Scope creep risk"],
    fit_for: ["Local SEO", "Paid Search", "Small-mid brands"],
    case_studies_status: "Has public case studies",
    pricing_transparency: "Pricing partially disclosed",
    team_information: "Team page exists",
    independent_recognition: "Mentions in directories",
    local_presence: "Local office listed",
    entity_signals: ["Clutch profile", "Google Business Profile"]
  }
], null, 2);

interface ImportResult {
  ok: boolean;
  total: number;
  inserted: number;
  updated: number;
  skipped: number;
  failed: number;
  errors: Array<{ row: number; agency_slug: string; reason: string }>;
}

type TabType = 'csv' | 'json' | 'preview' | 'results';

function ScoreBadge({ score }: { score: number }) {
  const label = getUniquenessLabel(score);
  const cls =
    score >= 80 ? 'bg-green-100 text-green-800 border-green-200' :
    score >= 60 ? 'bg-blue-100 text-blue-800 border-blue-200' :
    score >= 40 ? 'bg-yellow-100 text-yellow-800 border-yellow-200' :
                  'bg-red-100 text-red-800 border-red-200';
  return (
    <span className={`inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded border font-medium ${cls}`}>
      {score} — {label}
    </span>
  );
}

function EligibilityBadge({ eligible, reason }: { eligible: boolean; reason: string }) {
  return eligible ? (
    <span className="inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded bg-green-50 text-green-800 border border-green-200 font-medium">
      <CheckCircle className="w-3 h-3" />
      Eligible
    </span>
  ) : (
    <span
      className="inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded bg-gray-100 text-gray-700 border border-gray-200 font-medium"
      title={reason}
    >
      Draft only
    </span>
  );
}

export default function AdminAgencyReviewsImportPage() {
  const [activeTab, setActiveTab] = useState<TabType>('csv');
  const [csvText, setCsvText] = useState('');
  const [jsonText, setJsonText] = useState('');
  const [parsedRows, setParsedRows] = useState<ParsedImportRow[]>([]);
  const [importResult, setImportResult] = useState<ImportResult | null>(null);
  const [isImporting, setIsImporting] = useState(false);
  const [error, setError] = useState('');
  const [options, setOptions] = useState({ upsert: true, publish: false });
  const [adminToken, setAdminToken] = useState('');
  const [showTemplate, setShowTemplate] = useState(false);
  const [showJsonSample, setShowJsonSample] = useState(false);
  const [csvDragOver, setCsvDragOver] = useState(false);
  const [jsonDragOver, setJsonDragOver] = useState(false);
  const [expandedRows, setExpandedRows] = useState<Set<number>>(new Set());
  const csvFileRef = useRef<HTMLInputElement>(null);
  const jsonFileRef = useRef<HTMLInputElement>(null);

  const readFile = (file: File, setter: (t: string) => void) => {
    const reader = new FileReader();
    reader.onload = (e) => setter(e.target?.result as string || '');
    reader.readAsText(file);
  };

  const handleCsvFile = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) readFile(file, setCsvText);
  };

  const handleJsonFile = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) readFile(file, setJsonText);
  };

  const onCsvDrop = useCallback((e: React.DragEvent) => {
    e.preventDefault();
    setCsvDragOver(false);
    const file = e.dataTransfer.files?.[0];
    if (file) readFile(file, setCsvText);
  }, []);

  const onJsonDrop = useCallback((e: React.DragEvent) => {
    e.preventDefault();
    setJsonDragOver(false);
    const file = e.dataTransfer.files?.[0];
    if (file) readFile(file, setJsonText);
  }, []);

  const parseCSV = (text: string): Array<Record<string, unknown>> => {
    const lines = text.trim().split('\n');
    if (lines.length < 2) return [];
    const headers = lines[0].split(';').map((h: string) => h.trim().toLowerCase());
    return lines.slice(1).filter((l: string) => l.trim()).map((line: string) => {
      const values = line.split(';');
      const row: Record<string, unknown> = {};
      headers.forEach((header: string, idx: number) => { row[header] = (values[idx] || '').trim(); });
      return row;
    });
  };

  const handlePreview = () => {
    setError('');
    let rawRows: Array<Record<string, unknown>> = [];

    if (activeTab === 'csv') {
      if (!csvText.trim()) { setError('Please paste CSV data or upload a file'); return; }
      rawRows = parseCSV(csvText);
    } else if (activeTab === 'json') {
      if (!jsonText.trim()) { setError('Please paste JSON data or upload a file'); return; }
      try {
        const parsed = JSON.parse(jsonText);
        rawRows = Array.isArray(parsed) ? parsed : [parsed];
      } catch (e) {
        setError(`Invalid JSON: ${e instanceof Error ? e.message : 'Unknown error'}`);
        return;
      }
    }

    if (rawRows.length === 0) { setError('No data rows found'); return; }

    const usedSlugs = new Set<string>();
    const normalized = rawRows
      .map((row, idx) => normalizeAndValidateRow(row, idx + 2, usedSlugs))
      .filter((row): row is ParsedImportRow => row !== null);

    setParsedRows(normalized);
    setExpandedRows(new Set());
    setActiveTab('preview');
  };

  const downloadValidationErrors = () => {
    const errorRows = parsedRows.filter(r => r.errors.length > 0);
    if (!errorRows.length) return;
    const lines = ['Row,Agency Slug,Field,Reason'];
    errorRows.forEach(r => {
      r.errors.forEach(e => {
        lines.push(`${e.row},"${r.agency_slug}","${e.field}","${e.message.replace(/"/g, '""')}"`);
      });
    });
    const blob = new Blob([lines.join('\n')], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = 'validation-errors.csv'; a.click();
    URL.revokeObjectURL(url);
  };

  const handleImport = async () => {
    if (!adminToken) { setError('Admin token is required. Check wp-admin Settings > Secrets'); return; }
    setIsImporting(true);
    setError('');

    try {
      const response = await fetch(`${SUPABASE_URL}/functions/v1/agency-reviews-import`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
          'x-admin-token': adminToken,
        },
        body: JSON.stringify({ rows: parsedRows, options }),
      });

      const result = await response.json();
      if (!response.ok) throw new Error(result.error || 'Import failed');
      setImportResult(result);
      setActiveTab('results');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Import error');
    } finally {
      setIsImporting(false);
    }
  };

  const downloadImportErrors = () => {
    if (!importResult?.errors) return;
    const csv = 'Row,Agency Slug,Reason\n' +
      importResult.errors.map(e => `${e.row},"${e.agency_slug}","${String(e.reason).replace(/"/g, '""')}"`).join('\n');
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = 'import-errors.csv'; a.click();
    URL.revokeObjectURL(url);
  };

  const stats = {
    total: parsedRows.length,
    withErrors: parsedRows.filter(r => r.errors.length > 0).length,
    eligible: parsedRows.filter(r => getPublishEligibility(r).eligible).length,
    strong: parsedRows.filter(r => r.uniqueness_score >= 80).length,
    ok: parsedRows.filter(r => r.uniqueness_score >= 60 && r.uniqueness_score < 80).length,
    thin: parsedRows.filter(r => r.uniqueness_score >= 40 && r.uniqueness_score < 60).length,
    veryThin: parsedRows.filter(r => r.uniqueness_score < 40).length,
    avgScore: parsedRows.length
      ? Math.round(parsedRows.reduce((s, r) => s + r.uniqueness_score, 0) / parsedRows.length)
      : 0,
  };

  const toggleRow = (idx: number) => {
    setExpandedRows(prev => {
      const next = new Set(prev);
      if (next.has(idx)) next.delete(idx); else next.add(idx);
      return next;
    });
  };

  return (
    <WpAdminLayout>
      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="mb-6 flex items-center gap-3">
          <Link
            to="/wp-admin/agency-reviews"
            className="p-2 text-gray-500 hover:text-gray-900 hover:bg-gray-100 rounded-lg transition"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Import Agency Reviews</h1>
            <p className="text-gray-500 mt-1">Bulk import custom agency review pages with validation and uniqueness scoring</p>
          </div>
        </div>

        {error && (
          <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-xl flex gap-3 items-start">
            <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
            <div className="flex-1">
              <p className="font-semibold text-red-900">Error</p>
              <p className="text-red-800 text-sm">{error}</p>
            </div>
            <button onClick={() => setError('')}><X className="w-4 h-4 text-red-400 hover:text-red-600" /></button>
          </div>
        )}

        {/* Tab Navigation */}
        <div className="flex gap-1 mb-6 border-b border-gray-200">
          {(['csv', 'json'] as const).map(tab => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={`px-5 py-2.5 font-medium text-sm rounded-t-lg transition ${
                activeTab === tab
                  ? 'bg-white border border-b-white border-gray-200 text-blue-600 -mb-px'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              {tab === 'csv' ? (
                <span className="flex items-center gap-2"><FileText className="w-4 h-4" />CSV Upload</span>
              ) : (
                <span className="flex items-center gap-2"><FileCode className="w-4 h-4" />JSON Upload</span>
              )}
            </button>
          ))}
          {parsedRows.length > 0 && (
            <button
              onClick={() => setActiveTab('preview')}
              className={`px-5 py-2.5 font-medium text-sm rounded-t-lg transition ${
                activeTab === 'preview'
                  ? 'bg-white border border-b-white border-gray-200 text-blue-600 -mb-px'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              Preview ({parsedRows.length})
              {stats.withErrors > 0 && (
                <span className="ml-1.5 bg-red-100 text-red-700 text-xs px-1.5 py-0.5 rounded">{stats.withErrors}</span>
              )}
            </button>
          )}
          {importResult && (
            <button
              onClick={() => setActiveTab('results')}
              className={`px-5 py-2.5 font-medium text-sm rounded-t-lg transition ${
                activeTab === 'results'
                  ? 'bg-white border border-b-white border-gray-200 text-blue-600 -mb-px'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              Results
            </button>
          )}
        </div>

        {/* ── CSV Tab ── */}
        {activeTab === 'csv' && (
          <div className="space-y-5">
            <div
              className={`bg-white rounded-xl border-2 border-dashed p-10 text-center transition cursor-pointer ${
                csvDragOver ? 'border-blue-400 bg-blue-50' : 'border-gray-300 hover:border-blue-300 hover:bg-gray-50'
              }`}
              onDragOver={e => { e.preventDefault(); setCsvDragOver(true); }}
              onDragLeave={() => setCsvDragOver(false)}
              onDrop={onCsvDrop}
              onClick={() => csvFileRef.current?.click()}
            >
              <Upload className={`w-10 h-10 mx-auto mb-3 ${csvDragOver ? 'text-blue-500' : 'text-gray-300'}`} />
              <p className="font-semibold text-gray-700 mb-1">Drop CSV file here or click to browse</p>
              <p className="text-sm text-gray-400">Semicolon-delimited .csv — arrays separated by pipes (|)</p>
              <input ref={csvFileRef} type="file" accept=".csv,.txt" onChange={handleCsvFile} className="hidden" />
            </div>

            {csvText && (
              <div className="bg-blue-50 border border-blue-100 rounded-lg px-4 py-2 text-sm text-blue-800 flex items-center gap-2">
                <CheckCircle className="w-4 h-4 text-blue-600" />
                File loaded: {csvText.trim().split('\n').length - 1} data row(s) detected
              </div>
            )}

            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <label className="block text-sm font-semibold text-gray-700 mb-2">Or paste CSV data</label>
              <textarea
                value={csvText}
                onChange={e => setCsvText(e.target.value)}
                rows={8}
                className="block w-full px-3 py-2 border border-gray-300 rounded-lg font-mono text-xs focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                placeholder={`${CSV_HEADER}\n${CSV_EXAMPLE_ROW.substring(0, 120)}...`}
              />
            </div>

            {/* Template */}
            <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
              <button
                onClick={() => setShowTemplate(v => !v)}
                className="w-full flex items-center justify-between px-6 py-4 text-left hover:bg-gray-50 transition"
              >
                <span className="flex items-center gap-2 font-semibold text-gray-800 text-sm">
                  <Info className="w-4 h-4 text-blue-500" />
                  CSV Format Reference &amp; Template
                </span>
                {showTemplate ? <ChevronUp className="w-4 h-4 text-gray-400" /> : <ChevronDown className="w-4 h-4 text-gray-400" />}
              </button>
              {showTemplate && (
                <div className="border-t border-gray-100 p-6 space-y-5">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                      <p className="text-sm font-semibold text-gray-700 mb-2">Format rules</p>
                      <ul className="text-sm text-gray-600 space-y-1.5">
                        <li><span className="font-mono bg-gray-100 px-1 rounded text-xs">;</span> — column separator</li>
                        <li><span className="font-mono bg-gray-100 px-1 rounded text-xs">|</span> — array item separator</li>
                        <li>Row 1 = header. Data starts at row 2.</li>
                        <li><code className="bg-gray-100 px-1 rounded text-xs">true/false/1/0/yes/no</code> accepted for booleans</li>
                      </ul>
                    </div>
                    <div>
                      <p className="text-sm font-semibold text-gray-700 mb-2">Required for publishing</p>
                      <ul className="text-sm text-gray-600 space-y-1">
                        {[
                          'agency_name (non-empty)',
                          'state_slug (valid US state)',
                          'about_description (400+ chars)',
                          'services_offered (4+ items)',
                          'review_type positive|negative',
                          'strengths or concerns (4+ each)',
                          'fit_for (3+ items)',
                        ].map(f => (
                          <li key={f} className="flex items-start gap-1.5">
                            <span className="text-red-400 text-xs mt-0.5">*</span>
                            <span className="text-xs">{f}</span>
                          </li>
                        ))}
                      </ul>
                    </div>
                  </div>
                  <div>
                    <p className="text-sm font-semibold text-gray-700 mb-1">Header row (copy this)</p>
                    <code className="block text-xs bg-gray-50 border border-gray-200 p-3 rounded-lg overflow-x-auto whitespace-pre-wrap break-all text-gray-800">
                      {CSV_HEADER}
                    </code>
                  </div>
                  <div>
                    <p className="text-sm font-semibold text-gray-700 mb-1">Example data row</p>
                    <code className="block text-xs bg-gray-50 border border-gray-200 p-3 rounded-lg overflow-x-auto whitespace-pre-wrap break-all text-gray-700">
                      {CSV_EXAMPLE_ROW}
                    </code>
                  </div>
                  <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 text-xs text-amber-800">
                    <strong>Inference:</strong> If <code>review_type</code> blank and <code>is_top_25_ranked=true</code> → type = <strong>positive</strong>. Otherwise → <strong>negative</strong>.
                    If <code>review_type=negative</code>, <code>is_top_25_ranked</code> is forced to <strong>false</strong>.
                  </div>
                  <button
                    onClick={() => { setCsvText(`${CSV_HEADER}\n${CSV_EXAMPLE_ROW}`); setShowTemplate(false); }}
                    className="text-sm text-blue-600 hover:text-blue-700 font-medium"
                  >
                    Load example into editor
                  </button>
                </div>
              )}
            </div>

            <button
              onClick={handlePreview}
              disabled={!csvText.trim()}
              className="w-full px-4 py-3.5 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 disabled:bg-gray-200 disabled:text-gray-400 disabled:cursor-not-allowed flex items-center justify-center gap-2 transition"
            >
              <Eye className="w-5 h-5" />
              Preview &amp; Validate
            </button>
          </div>
        )}

        {/* ── JSON Tab ── */}
        {activeTab === 'json' && (
          <div className="space-y-5">
            <div
              className={`bg-white rounded-xl border-2 border-dashed p-10 text-center transition cursor-pointer ${
                jsonDragOver ? 'border-blue-400 bg-blue-50' : 'border-gray-300 hover:border-blue-300 hover:bg-gray-50'
              }`}
              onDragOver={e => { e.preventDefault(); setJsonDragOver(true); }}
              onDragLeave={() => setJsonDragOver(false)}
              onDrop={onJsonDrop}
              onClick={() => jsonFileRef.current?.click()}
            >
              <FileCode className={`w-10 h-10 mx-auto mb-3 ${jsonDragOver ? 'text-blue-500' : 'text-gray-300'}`} />
              <p className="font-semibold text-gray-700 mb-1">Drop JSON file here or click to browse</p>
              <p className="text-sm text-gray-400">Must be an array of objects — arrays are real JSON arrays</p>
              <input ref={jsonFileRef} type="file" accept=".json" onChange={handleJsonFile} className="hidden" />
            </div>

            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <label className="block text-sm font-semibold text-gray-700 mb-2">Or paste JSON data</label>
              <textarea
                value={jsonText}
                onChange={e => setJsonText(e.target.value)}
                rows={12}
                className="block w-full px-3 py-2 border border-gray-300 rounded-lg font-mono text-xs focus:outline-none focus:ring-2 focus:ring-blue-500 bg-gray-50"
                placeholder='[{"agency_name":"...","state_slug":"...","services_offered":["SEO","PPC"],...}]'
              />
            </div>

            <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
              <button
                onClick={() => setShowJsonSample(v => !v)}
                className="w-full flex items-center justify-between px-6 py-4 text-left hover:bg-gray-50 transition"
              >
                <span className="flex items-center gap-2 font-semibold text-gray-800 text-sm">
                  <Info className="w-4 h-4 text-blue-500" />
                  JSON Format Reference
                </span>
                {showJsonSample ? <ChevronUp className="w-4 h-4 text-gray-400" /> : <ChevronDown className="w-4 h-4 text-gray-400" />}
              </button>
              {showJsonSample && (
                <div className="border-t border-gray-100 p-6 space-y-4">
                  <p className="text-sm text-gray-600">Array of objects. Array fields are real JSON arrays (not pipe strings).</p>
                  <pre className="text-xs bg-gray-50 border border-gray-200 p-3 rounded-lg overflow-x-auto max-h-80 text-gray-800">
                    {JSON_EXAMPLE}
                  </pre>
                  <button
                    onClick={() => { setJsonText(JSON_EXAMPLE); setShowJsonSample(false); }}
                    className="text-sm text-blue-600 hover:text-blue-700 font-medium"
                  >
                    Load example into editor
                  </button>
                </div>
              )}
            </div>

            <button
              onClick={handlePreview}
              disabled={!jsonText.trim()}
              className="w-full px-4 py-3.5 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 disabled:bg-gray-200 disabled:text-gray-400 disabled:cursor-not-allowed flex items-center justify-center gap-2 transition"
            >
              <Eye className="w-5 h-5" />
              Preview &amp; Validate
            </button>
          </div>
        )}

        {/* ── Preview Tab ── */}
        {activeTab === 'preview' && parsedRows.length > 0 && (
          <div className="space-y-5">
            {/* Stats grid */}
            <div className="grid grid-cols-2 sm:grid-cols-4 xl:grid-cols-7 gap-3">
              {[
                { label: 'Total', val: stats.total, color: 'gray' },
                { label: 'Errors', val: stats.withErrors, color: stats.withErrors ? 'red' : 'gray' },
                { label: 'Eligible', val: stats.eligible, color: 'green' },
                { label: 'Strong ≥80', val: stats.strong, color: 'green' },
                { label: 'OK 60-79', val: stats.ok, color: 'blue' },
                { label: 'Thin 40-59', val: stats.thin, color: 'yellow' },
                { label: 'Very Thin <40', val: stats.veryThin, color: 'red' },
              ].map(s => {
                const bg = s.color === 'green' ? 'bg-green-50 border-green-200' :
                           s.color === 'blue'  ? 'bg-blue-50 border-blue-200' :
                           s.color === 'yellow' ? 'bg-yellow-50 border-yellow-200' :
                           s.color === 'red' && s.val > 0 ? 'bg-red-50 border-red-200' :
                           'bg-white border-gray-200';
                const text = s.color === 'green' ? 'text-green-700' :
                             s.color === 'blue'  ? 'text-blue-700' :
                             s.color === 'yellow' ? 'text-yellow-700' :
                             s.color === 'red' && s.val > 0 ? 'text-red-700' :
                             'text-gray-700';
                return (
                  <div key={s.label} className={`rounded-xl border p-3 text-center ${bg}`}>
                    <p className={`text-2xl font-bold ${text}`}>{s.val}</p>
                    <p className="text-xs text-gray-500 mt-0.5">{s.label}</p>
                  </div>
                );
              })}
            </div>

            {/* Average score bar */}
            <div className="bg-white rounded-xl border border-gray-200 px-6 py-4 flex items-center justify-between">
              <span className="text-sm text-gray-600 font-medium">Average Uniqueness Score across all rows</span>
              <ScoreBadge score={stats.avgScore} />
            </div>

            {/* Validation error download */}
            {stats.withErrors > 0 && (
              <div className="bg-red-50 border border-red-200 rounded-xl p-4 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
                <div className="flex items-center gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 shrink-0" />
                  <p className="text-sm text-red-800">
                    <strong>{stats.withErrors} row{stats.withErrors > 1 ? 's have' : ' has'} validation errors</strong> —
                    click a row to expand the errors, or download the full report.
                  </p>
                </div>
                <button
                  onClick={downloadValidationErrors}
                  className="shrink-0 flex items-center gap-2 bg-red-600 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-red-700 transition"
                >
                  <Download className="w-4 h-4" />
                  Download Error Report
                </button>
              </div>
            )}

            {/* Import Options */}
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <h2 className="text-base font-semibold text-gray-900 mb-4">Import Options</h2>
              <div className="space-y-4">
                <label className="flex items-start gap-3 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={options.upsert}
                    onChange={e => setOptions({...options, upsert: e.target.checked})}
                    className="mt-0.5 w-4 h-4 accent-blue-600"
                  />
                  <div>
                    <span className="text-sm font-medium text-gray-800">Upsert existing by agency_slug</span>
                    <p className="text-xs text-gray-500 mt-0.5">
                      ON = update row if slug already exists. OFF = skip duplicate slugs.
                    </p>
                  </div>
                </label>
                <label className="flex items-start gap-3 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={options.publish}
                    onChange={e => setOptions({...options, publish: e.target.checked})}
                    className="mt-0.5 w-4 h-4 accent-blue-600"
                  />
                  <div>
                    <span className="text-sm font-medium text-gray-800">Publish eligible rows after import</span>
                    <p className="text-xs text-gray-500 mt-0.5">
                      Only rows with uniqueness score ≥60 AND all content minimums met are published.
                      Thin/risky content always imports as Draft regardless of this toggle.
                    </p>
                  </div>
                </label>
              </div>
            </div>

            {/* Admin Token */}
            <div className="bg-white rounded-xl border border-gray-200 p-6">
              <label className="block text-base font-semibold text-gray-900 mb-3">Admin Token</label>
              <input
                type="password"
                value={adminToken}
                onChange={e => setAdminToken(e.target.value)}
                placeholder="Paste your admin import token..."
                className="w-full px-3 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm"
              />
              <p className="mt-2 text-xs text-gray-500">
                Found at <Link to="/wp-admin/settings" className="text-blue-600 hover:underline">Settings &amp; Secrets</Link> — look for <code className="bg-gray-100 px-1 rounded">ADMIN_IMPORT_SECRET</code>
              </p>
            </div>

            {/* Preview Table */}
            <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
              <div className="px-6 py-4 border-b border-gray-100 bg-gray-50 flex items-center justify-between">
                <h2 className="font-semibold text-gray-900 text-sm">
                  Row Preview
                  {parsedRows.length > 25 && (
                    <span className="text-gray-400 font-normal ml-2">showing first 25 of {parsedRows.length}</span>
                  )}
                </h2>
              </div>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead className="bg-gray-50 border-b border-gray-200">
                    <tr>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Row</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Agency</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">State</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Type</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Uniqueness</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Publish</th>
                      <th className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">Validation</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {parsedRows.slice(0, 25).map((row, idx) => {
                      const eligibility = getPublishEligibility(row);
                      const isExpanded = expandedRows.has(idx);
                      return (
                        <>
                          <tr
                            key={`row-${idx}`}
                            className={`${row.errors.length > 0 ? 'bg-red-50' : 'hover:bg-gray-50'} transition`}
                          >
                            <td className="px-4 py-3 text-gray-400 text-xs">{idx + 2}</td>
                            <td className="px-4 py-3 max-w-xs">
                              <p className="font-medium text-gray-900 text-xs truncate">{row.agency_name}</p>
                              <p className="text-gray-400 font-mono text-xs truncate">{row.agency_slug}</p>
                            </td>
                            <td className="px-4 py-3 text-gray-600 text-xs">{row.state_name}</td>
                            <td className="px-4 py-3">
                              <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${
                                row.review_type === 'positive'
                                  ? 'bg-green-100 text-green-800'
                                  : 'bg-orange-100 text-orange-800'
                              }`}>
                                {row.review_type}
                              </span>
                            </td>
                            <td className="px-4 py-3"><ScoreBadge score={row.uniqueness_score} /></td>
                            <td className="px-4 py-3">
                              <EligibilityBadge eligible={eligibility.eligible} reason={eligibility.reason} />
                            </td>
                            <td className="px-4 py-3">
                              {row.errors.length > 0 ? (
                                <button
                                  onClick={() => toggleRow(idx)}
                                  className="flex items-center gap-1 text-xs text-red-600 hover:text-red-700 font-medium"
                                >
                                  <AlertTriangle className="w-3.5 h-3.5" />
                                  {row.errors.length} error{row.errors.length > 1 ? 's' : ''}
                                  {isExpanded ? <ChevronUp className="w-3 h-3" /> : <ChevronDown className="w-3 h-3" />}
                                </button>
                              ) : (
                                <span className="flex items-center gap-1 text-xs text-green-600">
                                  <CheckCircle className="w-3.5 h-3.5" />Valid
                                </span>
                              )}
                            </td>
                          </tr>
                          {isExpanded && row.errors.length > 0 && (
                            <tr key={`errors-${idx}`} className="bg-red-50">
                              <td colSpan={7} className="px-6 pb-4 pt-0">
                                <div className="space-y-1 pl-4 border-l-2 border-red-300">
                                  {row.errors.map((e, ei) => (
                                    <div key={ei} className="text-xs text-red-700 flex gap-2 items-start">
                                      <span className="font-semibold text-red-900 shrink-0">{e.field}:</span>
                                      <span>{e.message}</span>
                                    </div>
                                  ))}
                                </div>
                              </td>
                            </tr>
                          )}
                        </>
                      );
                    })}
                  </tbody>
                </table>
              </div>
              {parsedRows.length > 25 && (
                <div className="px-6 py-3 bg-gray-50 border-t border-gray-100 text-xs text-gray-500">
                  Showing first 25 of {parsedRows.length} rows — all rows will be imported.
                </div>
              )}
            </div>

            {/* Import Button */}
            <button
              onClick={handleImport}
              disabled={isImporting || !adminToken}
              className="w-full px-4 py-4 bg-green-600 text-white rounded-xl font-bold hover:bg-green-700 disabled:bg-gray-200 disabled:text-gray-400 disabled:cursor-not-allowed flex items-center justify-center gap-2 transition text-base"
            >
              {isImporting ? (
                <><Loader className="w-5 h-5 animate-spin" />Importing {parsedRows.length} rows...</>
              ) : (
                <><Upload className="w-5 h-5" />Start Import ({parsedRows.length} rows)</>
              )}
            </button>
          </div>
        )}

        {/* ── Results Tab ── */}
        {activeTab === 'results' && importResult && (
          <div className="space-y-5">
            <div className={`rounded-xl border p-6 ${
              importResult.failed > 0 && importResult.inserted + importResult.updated === 0
                ? 'bg-red-50 border-red-200'
                : 'bg-green-50 border-green-200'
            }`}>
              <div className="flex gap-3 mb-5">
                <CheckCircle className="w-6 h-6 text-green-600 shrink-0" />
                <div>
                  <h3 className="font-bold text-green-900 text-lg">Import Complete</h3>
                  <p className="text-green-700 text-sm">{importResult.total} total rows processed</p>
                </div>
              </div>
              <div className="grid grid-cols-5 gap-4 text-center">
                {[
                  { label: 'Inserted', val: importResult.inserted, cls: 'text-green-700' },
                  { label: 'Updated', val: importResult.updated, cls: 'text-blue-700' },
                  { label: 'Skipped', val: importResult.skipped, cls: 'text-yellow-700' },
                  { label: 'Failed', val: importResult.failed, cls: 'text-red-700' },
                  { label: 'Total', val: importResult.total, cls: 'text-gray-700' },
                ].map(s => (
                  <div key={s.label}>
                    <p className={`text-3xl font-bold ${s.cls}`}>{s.val}</p>
                    <p className="text-xs text-gray-500 mt-1">{s.label}</p>
                  </div>
                ))}
              </div>
            </div>

            {importResult.errors.length > 0 && (
              <div className="bg-white rounded-xl border border-gray-200 p-6">
                <div className="flex items-center justify-between mb-4">
                  <h2 className="font-semibold text-gray-900">Import Errors ({importResult.errors.length})</h2>
                  <button
                    onClick={downloadImportErrors}
                    className="flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg text-sm hover:bg-gray-200 transition"
                  >
                    <Download className="w-4 h-4" />
                    Download CSV
                  </button>
                </div>
                <div className="overflow-x-auto">
                  <table className="w-full text-sm">
                    <thead className="bg-gray-50 border-b border-gray-200">
                      <tr>
                        <th className="px-4 py-3 text-left text-xs font-semibold text-gray-600">Row</th>
                        <th className="px-4 py-3 text-left text-xs font-semibold text-gray-600">Agency Slug</th>
                        <th className="px-4 py-3 text-left text-xs font-semibold text-gray-600">Reason</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      {importResult.errors.slice(0, 20).map((err, idx) => (
                        <tr key={idx}>
                          <td className="px-4 py-2.5 text-gray-400 text-xs">{err.row}</td>
                          <td className="px-4 py-2.5 font-mono text-xs text-gray-700">{err.agency_slug}</td>
                          <td className="px-4 py-2.5 text-red-700 text-xs">{err.reason}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                  {importResult.errors.length > 20 && (
                    <p className="px-4 py-3 text-xs text-gray-400 bg-gray-50 border-t border-gray-100">
                      Showing 20 of {importResult.errors.length}. Download CSV for full list.
                    </p>
                  )}
                </div>
              </div>
            )}

            <Link
              to="/wp-admin/agency-reviews"
              className="w-full flex items-center justify-center gap-2 px-4 py-3 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 transition"
            >
              View Updated Agency Reviews
            </Link>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
