import { useState, useRef, useCallback } from 'react';
import { X, Upload, AlertCircle, CheckCircle, ChevronRight, ChevronLeft, Download, FileText, RefreshCw } from 'lucide-react';
import { emApi } from '../../hooks/useEmailMarketing';

const IMPORTABLE_FIELDS = [
  { key: 'email', label: 'Email *', required: true },
  { key: 'first_name', label: 'First Name' },
  { key: 'last_name', label: 'Last Name' },
  { key: 'company_name', label: 'Company' },
  { key: 'website', label: 'Website' },
  { key: 'phone', label: 'Phone' },
  { key: 'state_name', label: 'State' },
  { key: 'country', label: 'Country' },
  { key: 'source_type', label: 'Source' },
  { key: 'lead_status', label: 'Lead Status' },
  { key: 'tags', label: 'Tags (comma-sep)' },
  { key: 'notes', label: 'Notes' },
];

const COMMON_HEADER_MAP: Record<string, string> = {
  email: 'email', 'e-mail': 'email', 'email address': 'email',
  'first name': 'first_name', firstname: 'first_name', 'first_name': 'first_name',
  'last name': 'last_name', lastname: 'last_name', 'last_name': 'last_name',
  name: 'first_name', 'full name': 'first_name', fullname: 'first_name',
  company: 'company_name', 'company name': 'company_name', organization: 'company_name',
  website: 'website', url: 'website', 'web site': 'website',
  phone: 'phone', 'phone number': 'phone', mobile: 'phone', tel: 'phone',
  state: 'state_name', region: 'state_name', province: 'state_name',
  country: 'country',
  source: 'source_type', 'lead source': 'source_type',
  status: 'lead_status', 'lead status': 'lead_status',
  tags: 'tags', tag: 'tags', labels: 'tags',
  notes: 'notes', note: 'notes', comments: 'notes',
};

function parseCSV(text: string, delimiter = ','): Record<string, string>[] {
  const lines = text.split(/\r?\n/).filter(l => l.trim());
  if (!lines.length) return [];

  const parseRow = (line: string): string[] => {
    const cells: string[] = [];
    let cur = '';
    let inQ = false;
    for (let i = 0; i < line.length; i++) {
      const ch = line[i];
      if (ch === '"') {
        if (inQ && line[i + 1] === '"') { cur += '"'; i++; }
        else inQ = !inQ;
      } else if (ch === delimiter && !inQ) {
        cells.push(cur.trim()); cur = '';
      } else cur += ch;
    }
    cells.push(cur.trim());
    return cells;
  };

  const headers = parseRow(lines[0]).map(h => h.replace(/^["']|["']$/g, '').trim());
  const rows: Record<string, string>[] = [];
  for (let i = 1; i < lines.length; i++) {
    if (!lines[i].trim()) continue;
    const cells = parseRow(lines[i]);
    const row: Record<string, string> = {};
    headers.forEach((h, idx) => { row[h] = cells[idx] ?? ''; });
    rows.push(row);
  }
  return rows;
}

function autoDetectMapping(columns: string[]): Record<string, string> {
  const mapping: Record<string, string> = {};
  for (const col of columns) {
    const normalized = col.toLowerCase().trim();
    const field = COMMON_HEADER_MAP[normalized];
    if (field && !mapping[field]) mapping[field] = col;
  }
  if (!mapping.email) {
    const emailCol = columns.find(c => c.toLowerCase().includes('email') || c.toLowerCase().includes('mail'));
    if (emailCol) mapping.email = emailCol;
  }
  return mapping;
}

function SAMPLE_CSV_CONTENT() {
  return 'email,first_name,last_name,company_name,state_name,lead_status,tags\njohn@example.com,John,Smith,Acme Inc,New Jersey,new,"marketing,seo"\njane@example.com,Jane,Doe,Widget Co,California,qualified,design\n';
}

interface PreviewResult {
  total_rows: number;
  valid_rows: number;
  duplicate_rows: number;
  invalid_rows: number;
  new_count: number;
  update_count: number;
  preview: any[];
  validation_errors: { row: number; reason: string }[];
}

interface ImportResult {
  inserted_count: number;
  updated_count: number;
  skipped_count: number;
  error_count: number;
  errors: { row: number; reason: string }[];
}

interface Props {
  onClose: () => void;
  onImported: () => void;
}

type Step = 'upload' | 'mapping' | 'preview' | 'done';

export default function ImportContactsModal({ onClose, onImported }: Props) {
  const [step, setStep] = useState<Step>('upload');
  const [filename, setFilename] = useState('');
  const [rawRows, setRawRows] = useState<Record<string, string>[]>([]);
  const [columns, setColumns] = useState<string[]>([]);
  const [delimiter, setDelimiter] = useState(',');
  const [mapping, setMapping] = useState<Record<string, string>>({});
  const [previewResult, setPreviewResult] = useState<PreviewResult | null>(null);
  const [importResult, setImportResult] = useState<ImportResult | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [dragOver, setDragOver] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  const processFile = useCallback((file: File) => {
    setFilename(file.name);
    setError(null);
    const reader = new FileReader();
    reader.onload = (e) => {
      const text = e.target?.result as string;
      const delim = text.includes(';') && !text.includes(',') ? ';' : ',';
      setDelimiter(delim);
      const rows = parseCSV(text, delim);
      if (!rows.length) { setError('No data rows found in file.'); return; }
      const cols = Object.keys(rows[0]);
      setColumns(cols);
      setRawRows(rows);
      setMapping(autoDetectMapping(cols));
      setStep('mapping');
    };
    reader.readAsText(file);
  }, []);

  const handleFile = (file: File | undefined) => {
    if (!file) return;
    if (!file.name.match(/\.(csv|tsv|txt)$/i)) { setError('Only CSV files are supported.'); return; }
    if (file.size > 5 * 1024 * 1024) { setError('File too large. Max 5MB.'); return; }
    processFile(file);
  };

  const handlePreview = async () => {
    setLoading(true); setError(null);
    try {
      const result = await emApi.post('contacts/import/preview', { filename, rows: rawRows, mapping });
      setPreviewResult(result);
      setStep('preview');
    } catch (e: any) {
      setError(e.message || 'Preview failed');
    } finally { setLoading(false); }
  };

  const handleCommit = async () => {
    setLoading(true); setError(null);
    try {
      const result = await emApi.post('contacts/import/commit', { filename, rows: rawRows, mapping });
      setImportResult(result);
      setStep('done');
      onImported();
    } catch (e: any) {
      setError(e.message || 'Import failed');
    } finally { setLoading(false); }
  };

  const downloadSample = () => {
    const blob = new Blob([SAMPLE_CSV_CONTENT()], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = 'sample-contacts.csv'; a.click();
    URL.revokeObjectURL(url);
  };

  const stepIndex = ['upload', 'mapping', 'preview', 'done'].indexOf(step);

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" onClick={handleBackdropClick}>
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={handleBackdropClick} />
      <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-3xl max-h-[92vh] flex flex-col overflow-hidden">

        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
          <div>
            <h2 className="text-base font-semibold text-slate-900">Import Contacts</h2>
            <p className="text-xs text-slate-400 mt-0.5">CSV upload with column mapping, validation, and dedupe</p>
          </div>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
        </div>

        <div className="px-6 py-3 border-b border-slate-100 bg-slate-50">
          <div className="flex items-center gap-2">
            {['Upload File', 'Map Columns', 'Preview & Validate', 'Done'].map((label, i) => (
              <div key={i} className="flex items-center gap-2">
                <div className={`flex items-center gap-1.5 text-xs font-medium ${i <= stepIndex ? 'text-slate-900' : 'text-slate-400'}`}>
                  <div className={`w-5 h-5 rounded-full flex items-center justify-center text-[10px] font-bold ${i < stepIndex ? 'bg-emerald-500 text-white' : i === stepIndex ? 'bg-slate-900 text-white' : 'bg-slate-200 text-slate-500'}`}>
                    {i < stepIndex ? '✓' : i + 1}
                  </div>
                  <span className="hidden sm:block">{label}</span>
                </div>
                {i < 3 && <ChevronRight className="w-3 h-3 text-slate-300" />}
              </div>
            ))}
          </div>
        </div>

        <div className="flex-1 overflow-y-auto p-6">

          {error && (
            <div className="flex items-start gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-xl text-sm text-red-700 mb-4">
              <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          {step === 'upload' && (
            <div className="space-y-5">
              <div
                onDragOver={e => { e.preventDefault(); setDragOver(true); }}
                onDragLeave={() => setDragOver(false)}
                onDrop={e => { e.preventDefault(); setDragOver(false); handleFile(e.dataTransfer.files[0]); }}
                onClick={() => fileRef.current?.click()}
                className={`border-2 border-dashed rounded-2xl p-12 text-center cursor-pointer transition-colors ${dragOver ? 'border-sky-400 bg-sky-50' : 'border-slate-200 hover:border-slate-300 hover:bg-slate-50'}`}
              >
                <Upload className={`w-10 h-10 mx-auto mb-3 ${dragOver ? 'text-sky-500' : 'text-slate-300'}`} />
                <p className="text-sm font-medium text-slate-700">Drop your CSV file here, or <span className="text-sky-600">browse</span></p>
                <p className="text-xs text-slate-400 mt-1">Supports CSV · Max 5MB</p>
                <input ref={fileRef} type="file" accept=".csv,.tsv,.txt" className="hidden" onChange={e => handleFile(e.target.files?.[0])} />
              </div>
              <div className="flex items-center justify-between p-4 bg-slate-50 rounded-xl border border-slate-200">
                <div className="flex items-center gap-3">
                  <FileText className="w-5 h-5 text-slate-400" />
                  <div>
                    <p className="text-sm font-medium text-slate-700">Download Sample CSV</p>
                    <p className="text-xs text-slate-400">See the expected format and column names</p>
                  </div>
                </div>
                <button onClick={downloadSample} className="flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium text-slate-700 border border-slate-200 rounded-lg hover:bg-white transition-colors">
                  <Download className="w-3.5 h-3.5" /> Download
                </button>
              </div>
            </div>
          )}

          {step === 'mapping' && (
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <p className="text-sm text-slate-600">
                  File: <span className="font-medium text-slate-800">{filename}</span> · <span className="text-slate-500">{rawRows.length} rows detected</span>
                </p>
                <div className="flex items-center gap-2 text-sm">
                  <label className="text-xs text-slate-500">Delimiter:</label>
                  <select value={delimiter} onChange={e => { setDelimiter(e.target.value); const rows = parseCSV(rawRows.map(r => Object.values(r).join(delimiter)).join('\n'), e.target.value); setColumns(Object.keys(rows[0] ?? {})); }} className="text-xs border border-slate-200 rounded-lg px-2 py-1 focus:ring-1 focus:ring-sky-500">
                    <option value=",">, Comma</option>
                    <option value=";">; Semicolon</option>
                    <option value="&#9;">Tab</option>
                  </select>
                </div>
              </div>

              <div className="bg-slate-50 rounded-xl border border-slate-200 overflow-hidden">
                <div className="grid grid-cols-2 gap-4 px-4 py-2.5 bg-slate-100 text-xs font-semibold text-slate-500 uppercase tracking-wide border-b border-slate-200">
                  <div>Gappsy Field</div>
                  <div>CSV Column</div>
                </div>
                <div className="divide-y divide-slate-100 max-h-80 overflow-y-auto">
                  {IMPORTABLE_FIELDS.map(field => (
                    <div key={field.key} className="grid grid-cols-2 gap-4 px-4 py-2.5 items-center">
                      <div className="flex items-center gap-2">
                        <span className="text-sm text-slate-700">{field.label}</span>
                        {field.required && <span className="text-xs text-red-500 font-medium">required</span>}
                        {mapping[field.key] && <CheckCircle className="w-3.5 h-3.5 text-emerald-500 shrink-0" />}
                      </div>
                      <select
                        value={mapping[field.key] ?? ''}
                        onChange={e => setMapping(m => ({ ...m, [field.key]: e.target.value || '' }))}
                        className="text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent bg-white"
                      >
                        <option value="">— Skip —</option>
                        {columns.map(col => <option key={col} value={col}>{col}</option>)}
                      </select>
                    </div>
                  ))}
                </div>
              </div>

              {!mapping.email && (
                <div className="flex items-center gap-2 px-4 py-2.5 bg-amber-50 border border-amber-200 rounded-xl text-sm text-amber-700">
                  <AlertCircle className="w-4 h-4 shrink-0" />
                  You must map the <strong className="mx-1">Email</strong> column to proceed.
                </div>
              )}
            </div>
          )}

          {step === 'preview' && previewResult && (
            <div className="space-y-4">
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {[
                  { label: 'Total Rows', value: previewResult.total_rows, color: 'text-slate-800' },
                  { label: 'New Contacts', value: previewResult.new_count, color: 'text-emerald-700' },
                  { label: 'Updates', value: previewResult.update_count, color: 'text-sky-700' },
                  { label: 'Skipped/Invalid', value: previewResult.duplicate_rows + previewResult.invalid_rows, color: 'text-amber-700' },
                ].map(stat => (
                  <div key={stat.label} className="bg-slate-50 rounded-xl border border-slate-200 p-3.5 text-center">
                    <p className={`text-2xl font-bold ${stat.color}`}>{stat.value}</p>
                    <p className="text-xs text-slate-500 mt-0.5">{stat.label}</p>
                  </div>
                ))}
              </div>

              {previewResult.validation_errors.length > 0 && (
                <div className="bg-red-50 border border-red-200 rounded-xl p-4">
                  <p className="text-sm font-semibold text-red-800 mb-2">Validation Errors ({previewResult.validation_errors.length})</p>
                  <div className="space-y-1 max-h-24 overflow-y-auto">
                    {previewResult.validation_errors.map((e, i) => (
                      <p key={i} className="text-xs text-red-600">Row {e.row}: {e.reason}</p>
                    ))}
                  </div>
                </div>
              )}

              <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
                <div className="px-4 py-2.5 bg-slate-50 border-b border-slate-100">
                  <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Preview (first {Math.min(20, previewResult.preview.length)} rows)</p>
                </div>
                <div className="overflow-x-auto">
                  <table className="w-full text-xs">
                    <thead className="bg-slate-50 border-b border-slate-100">
                      <tr>
                        {['Status', 'Email', 'Name', 'Company', 'State', 'Lead Status', 'Tags'].map(h => (
                          <th key={h} className="px-3 py-2 text-left font-semibold text-slate-500 whitespace-nowrap">{h}</th>
                        ))}
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-50">
                      {previewResult.preview.map((row: any, i: number) => (
                        <tr key={i} className="hover:bg-slate-50">
                          <td className="px-3 py-2">
                            <span className={`px-1.5 py-0.5 rounded-full font-medium ${row._exists ? 'bg-sky-100 text-sky-700' : 'bg-emerald-100 text-emerald-700'}`}>
                              {row._exists ? 'update' : 'new'}
                            </span>
                          </td>
                          <td className="px-3 py-2 text-slate-700 font-medium max-w-32 truncate">{row.email}</td>
                          <td className="px-3 py-2 text-slate-600 whitespace-nowrap">{[row.first_name, row.last_name].filter(Boolean).join(' ') || '—'}</td>
                          <td className="px-3 py-2 text-slate-500 max-w-28 truncate">{row.company_name || '—'}</td>
                          <td className="px-3 py-2 text-slate-500">{row.state_name || '—'}</td>
                          <td className="px-3 py-2">
                            <span className="px-1.5 py-0.5 bg-slate-100 text-slate-600 rounded-full">{row.lead_status}</span>
                          </td>
                          <td className="px-3 py-2 text-slate-400">{row.tags?.join(', ') || '—'}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          )}

          {step === 'done' && importResult && (
            <div className="space-y-4">
              <div className="flex flex-col items-center py-6 text-center">
                <CheckCircle className="w-12 h-12 text-emerald-500 mb-3" />
                <h3 className="text-lg font-semibold text-slate-900">Import Complete</h3>
                <p className="text-sm text-slate-500 mt-1">Contacts have been saved to your audience.</p>
              </div>
              <div className="grid grid-cols-3 gap-3">
                {[
                  { label: 'Inserted', value: importResult.inserted_count, color: 'text-emerald-700' },
                  { label: 'Updated', value: importResult.updated_count, color: 'text-sky-700' },
                  { label: 'Skipped', value: importResult.skipped_count + importResult.error_count, color: 'text-slate-600' },
                ].map(s => (
                  <div key={s.label} className="bg-slate-50 rounded-xl border border-slate-200 p-4 text-center">
                    <p className={`text-2xl font-bold ${s.color}`}>{s.value}</p>
                    <p className="text-xs text-slate-500 mt-0.5">{s.label}</p>
                  </div>
                ))}
              </div>
              {importResult.errors.length > 0 && (
                <div className="bg-amber-50 border border-amber-200 rounded-xl p-4">
                  <p className="text-sm font-semibold text-amber-800 mb-2">{importResult.errors.length} rows had errors</p>
                  <div className="space-y-1 max-h-24 overflow-y-auto">
                    {importResult.errors.map((e, i) => <p key={i} className="text-xs text-amber-700">Row {e.row}: {e.reason}</p>)}
                  </div>
                </div>
              )}
            </div>
          )}
        </div>

        <div className="flex items-center justify-between gap-3 px-6 py-4 border-t border-slate-100 bg-white">
          <div>
            {step !== 'upload' && step !== 'done' && (
              <button onClick={() => setStep(s => s === 'preview' ? 'mapping' : 'upload')} className="flex items-center gap-1.5 px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">
                <ChevronLeft className="w-3.5 h-3.5" /> Back
              </button>
            )}
          </div>
          <div className="flex items-center gap-2">
            {step !== 'done' && (
              <button onClick={onClose} className="px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
            )}
            {step === 'mapping' && (
              <button
                onClick={handlePreview}
                disabled={loading || !mapping.email}
                className="flex items-center gap-2 px-5 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50 transition-colors"
              >
                {loading ? <RefreshCw className="w-3.5 h-3.5 animate-spin" /> : <ChevronRight className="w-3.5 h-3.5" />}
                {loading ? 'Processing...' : 'Preview Import'}
              </button>
            )}
            {step === 'preview' && previewResult && (
              <button
                onClick={handleCommit}
                disabled={loading || previewResult.valid_rows === 0}
                className="flex items-center gap-2 px-5 py-2 bg-emerald-600 text-white text-sm font-medium rounded-lg hover:bg-emerald-700 disabled:opacity-50 transition-colors"
              >
                {loading ? <RefreshCw className="w-3.5 h-3.5 animate-spin" /> : <Upload className="w-3.5 h-3.5" />}
                {loading ? 'Importing...' : `Import ${previewResult.valid_rows} Contacts`}
              </button>
            )}
            {step === 'done' && (
              <button onClick={onClose} className="px-5 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">
                Close
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
