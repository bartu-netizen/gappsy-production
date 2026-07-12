import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, PlusCircle, Upload, Loader2, CheckCircle2, AlertTriangle } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner } from '../components/admin/AdminErrorBanner';
import { parseDiscoveryCsvFile, type ParsedDiscoveryRow } from '../utils/discoveryCsvParser';

interface CategoriesResponse { ok: boolean; data: Array<{ id: string; name: string }>; }
interface ImportResponse { ok: boolean; data?: { id?: string; success_count?: number; error_count?: number; errors?: Array<{ row: number; error: string }> }; }

type Tab = 'manual' | 'csv';

// Manual Import + CSV Import — the Discovery Engine's first two providers.
// Both post to admin-discovery-import, which runs Validation + Duplicate
// Detection + Quality Score inline before the candidate lands in the Queue.
export default function WpAdminDiscoveryImportPage() {
  const [tab, setTab] = useState<Tab>('manual');

  const { data: categoriesData } = useAdminFetch<CategoriesResponse>('admin-tool-categories');
  const categories = categoriesData?.data || [];

  // Manual form state
  const [name, setName] = useState('');
  const [website, setWebsite] = useState('');
  const [categoryId, setCategoryId] = useState('');
  const [description, setDescription] = useState('');
  const [sourceUrl, setSourceUrl] = useState('');
  const [manualResult, setManualResult] = useState<{ ok: boolean; message: string } | null>(null);

  const { mutate: submitManual, isLoading: manualLoading, error: manualError } = useAdminMutation<ImportResponse, Record<string, unknown>>('admin-discovery-import', 'POST');

  async function handleManualSubmit() {
    setManualResult(null);
    const result = await submitManual({
      action: 'manual',
      name: name.trim(),
      official_website: website.trim(),
      category_id: categoryId || undefined,
      short_description: description.trim() || undefined,
      source_url: sourceUrl.trim() || undefined,
    });
    if (result.ok) {
      setManualResult({ ok: true, message: `"${name}" added to the Discovery Queue.` });
      setName(''); setWebsite(''); setCategoryId(''); setDescription(''); setSourceUrl('');
    } else {
      setManualResult({ ok: false, message: result.error?.message || 'Failed to add candidate.' });
    }
  }

  // CSV state
  const [csvFile, setCsvFile] = useState<File | null>(null);
  const [csvRows, setCsvRows] = useState<ParsedDiscoveryRow[]>([]);
  const [csvParseError, setCsvParseError] = useState<string | null>(null);
  const [csvResult, setCsvResult] = useState<{ success: number; errors: number; details: Array<{ row: number; error: string }> } | null>(null);

  const { mutate: submitCsv, isLoading: csvLoading, error: csvSubmitError } = useAdminMutation<ImportResponse, Record<string, unknown>>('admin-discovery-import', 'POST');

  async function handleFileSelect(file: File | null) {
    setCsvFile(file);
    setCsvRows([]);
    setCsvParseError(null);
    setCsvResult(null);
    if (!file) return;
    try {
      const rows = await parseDiscoveryCsvFile(file);
      setCsvRows(rows);
    } catch (err) {
      setCsvParseError(err instanceof Error ? err.message : 'Failed to parse file');
    }
  }

  async function handleCsvSubmit() {
    setCsvResult(null);
    const result = await submitCsv({
      action: 'csv',
      file_name: csvFile?.name || null,
      rows: csvRows.map((r) => ({
        name: r.name,
        official_website: r.official_website,
        short_description: r.short_description,
        source_url: r.source_url,
        logo_url: r.logo_url,
      })),
    });
    if (result.ok && result.data?.data) {
      const batch = result.data.data;
      setCsvResult({ success: batch.success_count || 0, errors: batch.error_count || 0, details: batch.errors || [] });
      setCsvFile(null);
      setCsvRows([]);
    }
  }

  return (
    <WpAdminLayout title="Discover Software" subtitle="Add a candidate manually or bulk-import from a CSV file">
      <div className="max-w-3xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Discover Software</h1>
          <p className="text-gray-500 mt-1 text-sm">Every candidate runs through validation and duplicate detection immediately.</p>
        </div>

        <div className="flex gap-1.5 mb-6 border-b border-gray-200">
          {([
            { value: 'manual' as Tab, label: 'Manual Import', icon: PlusCircle },
            { value: 'csv' as Tab, label: 'CSV Import', icon: Upload },
          ]).map((t) => (
            <button
              key={t.value}
              onClick={() => setTab(t.value)}
              className={`inline-flex items-center gap-1.5 px-4 py-2.5 text-sm font-medium border-b-2 -mb-px transition ${
                tab === t.value ? 'border-gray-900 text-gray-900' : 'border-transparent text-gray-500 hover:text-gray-700'
              }`}
            >
              <t.icon className="w-4 h-4" />
              {t.label}
            </button>
          ))}
        </div>

        {tab === 'manual' && (
          <div className="bg-white border border-gray-200 rounded-lg p-5 space-y-4">
            {manualError && <AdminErrorBanner error={manualError} compact />}
            {manualResult && (
              <div className={`flex items-center gap-2 px-3 py-2 rounded-lg text-sm ${manualResult.ok ? 'bg-emerald-50 text-emerald-700 border border-emerald-200' : 'bg-red-50 text-red-700 border border-red-200'}`}>
                {manualResult.ok ? <CheckCircle2 className="w-4 h-4 shrink-0" /> : <AlertTriangle className="w-4 h-4 shrink-0" />}
                {manualResult.message}
              </div>
            )}

            <div>
              <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Tool Name *</label>
              <input type="text" value={name} onChange={(e) => setName(e.target.value)} className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="e.g. Linear" />
            </div>
            <div>
              <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Official Website *</label>
              <input type="text" value={website} onChange={(e) => setWebsite(e.target.value)} className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="https://linear.app" />
            </div>
            <div className="grid sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Category</label>
                <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                  <option value="">Uncategorized</option>
                  {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Source URL</label>
                <input type="text" value={sourceUrl} onChange={(e) => setSourceUrl(e.target.value)} className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Where you found this (optional)" />
              </div>
            </div>
            <div>
              <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Short Description</label>
              <textarea value={description} onChange={(e) => setDescription(e.target.value)} rows={3} className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="One or two sentences, from the source only" />
            </div>

            <button
              onClick={handleManualSubmit}
              disabled={manualLoading || !name.trim() || !website.trim()}
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {manualLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <PlusCircle className="w-4 h-4" />}
              Add to Discovery Queue
            </button>
          </div>
        )}

        {tab === 'csv' && (
          <div className="bg-white border border-gray-200 rounded-lg p-5 space-y-4">
            {csvSubmitError && <AdminErrorBanner error={csvSubmitError} compact />}

            <div>
              <label className="block text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">CSV / Excel File</label>
              <input
                type="file"
                accept=".csv,.xlsx,.xls"
                onChange={(e) => handleFileSelect(e.target.files?.[0] || null)}
                className="w-full text-sm text-gray-600 file:mr-3 file:px-3 file:py-2 file:rounded-lg file:border-0 file:bg-gray-100 file:text-gray-700 file:text-sm file:font-medium hover:file:bg-gray-200"
              />
              <p className="text-xs text-gray-400 mt-1.5">Required columns: name, website (or official_website). Optional: category, description, logo_url, source_url.</p>
            </div>

            {csvParseError && (
              <div className="flex items-center gap-2 px-3 py-2 rounded-lg text-sm bg-red-50 text-red-700 border border-red-200">
                <AlertTriangle className="w-4 h-4 shrink-0" />
                {csvParseError}
              </div>
            )}

            {csvRows.length > 0 && (
              <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 text-sm text-gray-700">
                {csvRows.length} row{csvRows.length === 1 ? '' : 's'} parsed and ready to import.
              </div>
            )}

            {csvResult && (
              <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 text-sm">
                <p className="text-emerald-700 font-medium">{csvResult.success} added successfully</p>
                {csvResult.errors > 0 && (
                  <>
                    <p className="text-red-600 font-medium mt-1">{csvResult.errors} failed</p>
                    <ul className="mt-1 space-y-0.5 text-xs text-red-600">
                      {csvResult.details.slice(0, 10).map((d) => <li key={d.row}>Row {d.row}: {d.error}</li>)}
                    </ul>
                  </>
                )}
              </div>
            )}

            <button
              onClick={handleCsvSubmit}
              disabled={csvLoading || csvRows.length === 0}
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {csvLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Upload className="w-4 h-4" />}
              Import {csvRows.length > 0 ? `${csvRows.length} Row${csvRows.length === 1 ? '' : 's'}` : ''}
            </button>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
