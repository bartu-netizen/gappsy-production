import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Upload, CheckCircle, AlertCircle, Loader } from 'lucide-react';

type ImportTier = 'spotlight' | 'top25' | 'other';
type ImportStep = 1 | 2 | 3 | 4 | 5 | 6;

interface StateStats {
  spotlights: { total: number; paid: number; available: number };
  top25: { total: number; paid: number; placeholders: number };
  others: { total: number; featured: number; verified: number };
}

interface ValidationResult {
  isValid: boolean;
  errors: string[];
  warnings: string[];
}

interface ParsedRow {
  original: any;
  validation: ValidationResult;
}

export default function AdminBulkImportPage() {
  const [step, setStep] = useState<ImportStep>(1);
  const [selectedState, setSelectedState] = useState('new-jersey');
  const [stateStats, setStateStats] = useState<StateStats | null>(null);
  const [importTier, setImportTier] = useState<ImportTier>('top25');
  const [file, setFile] = useState<File | null>(null);
  const [parsedData, setParsedData] = useState<ParsedRow[]>([]);
  const [importing, setImporting] = useState(false);
  const [importProgress, setImportProgress] = useState(0);
  const [importResults, setImportResults] = useState<any>(null);

  const [config, setConfig] = useState({
    autoAssign: true,
    markAsPaid: false,
    markAsFeatured: false,
    markAsVerified: false,
    expirationDate: '',
    handleDuplicates: 'skip' as 'skip' | 'move' | 'keep'
  });

  const US_STATES = [
    { slug: 'alabama', name: 'Alabama' },
    { slug: 'alaska', name: 'Alaska' },
    { slug: 'arizona', name: 'Arizona' },
    { slug: 'arkansas', name: 'Arkansas' },
    { slug: 'california', name: 'California' },
    { slug: 'colorado', name: 'Colorado' },
    { slug: 'connecticut', name: 'Connecticut' },
    { slug: 'delaware', name: 'Delaware' },
    { slug: 'florida', name: 'Florida' },
    { slug: 'georgia', name: 'Georgia' },
    { slug: 'hawaii', name: 'Hawaii' },
    { slug: 'idaho', name: 'Idaho' },
    { slug: 'illinois', name: 'Illinois' },
    { slug: 'indiana', name: 'Indiana' },
    { slug: 'iowa', name: 'Iowa' },
    { slug: 'kansas', name: 'Kansas' },
    { slug: 'kentucky', name: 'Kentucky' },
    { slug: 'louisiana', name: 'Louisiana' },
    { slug: 'maine', name: 'Maine' },
    { slug: 'maryland', name: 'Maryland' },
    { slug: 'massachusetts', name: 'Massachusetts' },
    { slug: 'michigan', name: 'Michigan' },
    { slug: 'minnesota', name: 'Minnesota' },
    { slug: 'mississippi', name: 'Mississippi' },
    { slug: 'missouri', name: 'Missouri' },
    { slug: 'montana', name: 'Montana' },
    { slug: 'nebraska', name: 'Nebraska' },
    { slug: 'nevada', name: 'Nevada' },
    { slug: 'new-hampshire', name: 'New Hampshire' },
    { slug: 'new-jersey', name: 'New Jersey' },
    { slug: 'new-mexico', name: 'New Mexico' },
    { slug: 'new-york', name: 'New York' },
    { slug: 'north-carolina', name: 'North Carolina' },
    { slug: 'north-dakota', name: 'North Dakota' },
    { slug: 'ohio', name: 'Ohio' },
    { slug: 'oklahoma', name: 'Oklahoma' },
    { slug: 'oregon', name: 'Oregon' },
    { slug: 'pennsylvania', name: 'Pennsylvania' },
    { slug: 'rhode-island', name: 'Rhode Island' },
    { slug: 'south-carolina', name: 'South Carolina' },
    { slug: 'south-dakota', name: 'South Dakota' },
    { slug: 'tennessee', name: 'Tennessee' },
    { slug: 'texas', name: 'Texas' },
    { slug: 'utah', name: 'Utah' },
    { slug: 'vermont', name: 'Vermont' },
    { slug: 'virginia', name: 'Virginia' },
    { slug: 'washington', name: 'Washington' },
    { slug: 'west-virginia', name: 'West Virginia' },
    { slug: 'wisconsin', name: 'Wisconsin' },
    { slug: 'wyoming', name: 'Wyoming' },
    { slug: 'district-of-columbia', name: 'District of Columbia' },
    { slug: 'puerto-rico', name: 'Puerto Rico' }
  ];

  useEffect(() => {
    if (selectedState) {
      loadStateStats();
    }
  }, [selectedState]);

  async function loadStateStats() {
    try {
      const { data: spotlights } = await supabase
        .from('spotlight_placements')
        .select('*')
        .eq('state_slug', selectedState);

      const { data: top25 } = await supabase
        .from('top25_slots')
        .select('*')
        .eq('state_slug', selectedState);

      const { data: others, count: othersCount } = await supabase
        .from('other_agencies')
        .select('*', { count: 'exact', head: false })
        .eq('state_slug', selectedState);

      setStateStats({
        spotlights: {
          total: spotlights?.length || 0,
          paid: spotlights?.filter(s => s.is_paid).length || 0,
          available: 3 - (spotlights?.length || 0)
        },
        top25: {
          total: top25?.length || 0,
          paid: top25?.filter(t => t.is_paid).length || 0,
          placeholders: top25?.filter(t => !t.is_paid).length || 0
        },
        others: {
          total: othersCount || 0,
          featured: others?.filter(o => o.featured).length || 0,
          verified: others?.filter(o => o.verified).length || 0
        }
      });
    } catch (error) {
      console.error('Failed to load state stats:', error);
    }
  }

  function handleFileSelect(e: React.ChangeEvent<HTMLInputElement>) {
    const selectedFile = e.target.files?.[0];
    if (selectedFile) {
      setFile(selectedFile);
    }
  }

  async function parseCSV() {
    if (!file) return;

    const text = await file.text();
    const lines = text.split('\n').filter(line => line.trim());
    const headers = lines[0].split(',').map(h => h.trim());

    const rows: ParsedRow[] = [];

    for (let i = 1; i < lines.length; i++) {
      const values = lines[i].split(',').map(v => v.trim());
      const row: any = {};

      headers.forEach((header, index) => {
        row[header.toLowerCase().replace(/\s+/g, '_')] = values[index];
      });

      const validation = validateRow(row, importTier);
      rows.push({ original: row, validation });
    }

    setParsedData(rows);
    setStep(5);
  }

  function validateRow(row: any, tier: ImportTier): ValidationResult {
    const errors: string[] = [];
    const warnings: string[] = [];

    if (tier === 'spotlight') {
      if (!row.position || row.position < 1 || row.position > 3) {
        errors.push('Position must be 1, 2, or 3');
      }
      if (!row.agency_name) {
        errors.push('Agency name is required');
      }
      if (!row.website) {
        errors.push('Website URL is required');
      }
      if (!row.tagline) {
        warnings.push('Missing tagline (will use agency name)');
      }
      if (!row.logo_url) {
        warnings.push('Missing logo (will use placeholder)');
      }
    } else if (tier === 'top25') {
      if (!row.rank || row.rank < 1 || row.rank > 25) {
        errors.push('Rank must be between 1 and 25');
      }
      if (!row.agency_name) {
        errors.push('Agency name is required');
      }
      if (!row.website) {
        errors.push('Website URL is required');
      }
      if (!row.description) {
        warnings.push('Missing description');
      }
    } else if (tier === 'other') {
      if (!row.agency_name) {
        errors.push('Agency name is required');
      }
      if (!row.website) {
        errors.push('Website URL is required');
      }
    }

    return {
      isValid: errors.length === 0,
      errors,
      warnings
    };
  }

  async function startImport() {
    setImporting(true);
    setImportProgress(0);

    const validRows = parsedData.filter(r => r.validation.isValid);
    const results = { success: 0, errors: 0, warnings: 0 };

    for (let i = 0; i < validRows.length; i++) {
      try {
        await importRow(validRows[i].original, importTier);
        results.success++;
      } catch (error) {
        console.error('Import error:', error);
        results.errors++;
      }
      setImportProgress(((i + 1) / validRows.length) * 100);
    }

    setImportResults(results);
    setImporting(false);
    setStep(6);
  }

  async function importRow(row: any, tier: ImportTier) {
    if (tier === 'spotlight') {
      await supabase.from('spotlight_placements').insert({
        state_slug: selectedState,
        position: config.autoAssign ? undefined : parseInt(row.position),
        agency_name: row.agency_name,
        website_url: row.website,
        logo_url: row.logo_url,
        city: row.city,
        state: row.state,
        email: row.email,
        phone: row.phone,
        tagline: row.tagline,
        short_description: row.description,
        services: row.services ? row.services.split(',').map((s: string) => s.trim()) : [],
        background_color: row.background_color || '#1e40af',
        featured_image_url: row.featured_image,
        cta_text: row.cta_text || 'Get Started',
        cta_url: row.cta_url || row.website,
        is_paid: config.markAsPaid
      });
    } else if (tier === 'top25') {
      const rank = config.autoAssign ? undefined : parseInt(row.rank);
      const isPaid = rank === 1 ? true : config.markAsPaid;

      await supabase.from('top25_slots').insert({
        state_slug: selectedState,
        rank: rank,
        agency_name: row.agency_name,
        website: row.website,
        logo_url: row.logo_url,
        city: row.city,
        description: row.description,
        services: row.services ? row.services.split(',').map((s: string) => s.trim()) : [],
        is_paid: isPaid
      });
    } else if (tier === 'other') {
      const slug = row.agency_name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
      await supabase.from('other_agencies').insert({
        state_slug: selectedState,
        name: row.agency_name,
        slug: slug,
        website_url: row.website,
        logo_url: row.logo_url,
        city: row.city,
        state: row.state,
        email: row.email,
        phone: row.phone,
        short_description: row.description,
        services: row.services ? row.services.split(',').map((s: string) => s.trim()) : [],
        featured: config.markAsFeatured,
        verified: config.markAsVerified
      });
    }
  }

  const selectedStateName = US_STATES.find(s => s.slug === selectedState)?.name || selectedState;

  return (
    <div className="min-h-screen bg-gray-50 py-8 px-4">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-3xl font-bold mb-8">Bulk Import Agencies</h1>

        {step === 1 && (
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-bold mb-4">Step 1: Select State</h2>
            <select
              value={selectedState}
              onChange={e => setSelectedState(e.target.value)}
              className="w-full p-3 border rounded-lg mb-4"
            >
              {US_STATES.map(state => (
                <option key={state.slug} value={state.slug}>
                  {state.name}
                </option>
              ))}
            </select>

            {stateStats && (
              <div className="bg-gray-50 rounded p-4 mb-4">
                <p className="font-semibold mb-2">Current status for {selectedStateName}:</p>
                <ul className="text-sm space-y-1 text-gray-700">
                  <li>Spotlight: {stateStats.spotlights.total}/3 filled ({stateStats.spotlights.available} available)</li>
                  <li>Top 25: {stateStats.top25.total}/25 filled ({stateStats.top25.paid} paid, {stateStats.top25.placeholders} placeholders)</li>
                  <li>Other Agencies: {stateStats.others.total} listings</li>
                </ul>
              </div>
            )}

            <button
              onClick={() => setStep(2)}
              className="w-full px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
            >
              Continue
            </button>
          </div>
        )}

        {step === 2 && (
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-bold mb-4">Step 2: Select Import Type</h2>

            <div className="space-y-4 mb-6">
              <label className="flex items-start gap-3 p-4 border-2 rounded-lg cursor-pointer hover:border-indigo-600 transition-colors">
                <input
                  type="radio"
                  name="importTier"
                  value="spotlight"
                  checked={importTier === 'spotlight'}
                  onChange={e => setImportTier(e.target.value as ImportTier)}
                  className="mt-1"
                />
                <div>
                  <div className="font-semibold">Spotlight Placements</div>
                  <div className="text-sm text-gray-600">Premium hero section (max 3 per state)</div>
                  <div className="text-xs text-gray-500">Pricing: $997/mo (position 1), $497/mo (positions 2-3)</div>
                </div>
              </label>

              <label className="flex items-start gap-3 p-4 border-2 rounded-lg cursor-pointer hover:border-indigo-600 transition-colors">
                <input
                  type="radio"
                  name="importTier"
                  value="top25"
                  checked={importTier === 'top25'}
                  onChange={e => setImportTier(e.target.value as ImportTier)}
                  className="mt-1"
                />
                <div>
                  <div className="font-semibold">Top 25 Listings</div>
                  <div className="text-sm text-gray-600">Ranked section with positions 1-25</div>
                  <div className="text-xs text-gray-500">Pricing: $297/mo (ranks 1-10), $197/mo (ranks 11-25)</div>
                </div>
              </label>

              <label className="flex items-start gap-3 p-4 border-2 rounded-lg cursor-pointer hover:border-indigo-600 transition-colors">
                <input
                  type="radio"
                  name="importTier"
                  value="other"
                  checked={importTier === 'other'}
                  onChange={e => setImportTier(e.target.value as ImportTier)}
                  className="mt-1"
                />
                <div>
                  <div className="font-semibold">Other Agencies</div>
                  <div className="text-sm text-gray-600">Directory section (unlimited listings)</div>
                  <div className="text-xs text-gray-500">Pricing: Free or $49/mo (featured)</div>
                </div>
              </label>
            </div>

            <div className="flex gap-4">
              <button
                onClick={() => setStep(1)}
                className="px-6 py-3 border rounded-lg hover:bg-gray-50"
              >
                Back
              </button>
              <button
                onClick={() => setStep(3)}
                className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
              >
                Continue
              </button>
            </div>
          </div>
        )}

        {step === 3 && (
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-bold mb-4">Step 3: Upload File</h2>

            <div className="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center mb-4">
              <Upload className="w-12 h-12 mx-auto mb-4 text-gray-400" />
              <p className="mb-4 text-gray-600">Drag and drop CSV file here, or</p>
              <input
                type="file"
                accept=".csv"
                onChange={handleFileSelect}
                className="hidden"
                id="file-upload"
              />
              <label
                htmlFor="file-upload"
                className="inline-block px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 cursor-pointer"
              >
                Select File
              </label>
              {file && (
                <p className="mt-4 text-sm text-green-600 flex items-center justify-center gap-2">
                  <CheckCircle className="w-4 h-4" />
                  {file.name} selected
                </p>
              )}
            </div>

            <div className="flex gap-4">
              <button
                onClick={() => setStep(2)}
                className="px-6 py-3 border rounded-lg hover:bg-gray-50"
              >
                Back
              </button>
              <button
                onClick={() => setStep(4)}
                disabled={!file}
                className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Continue
              </button>
            </div>
          </div>
        )}

        {step === 4 && (
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-bold mb-4">Step 4: Configure Import</h2>

            <div className="space-y-4 mb-6">
              <label className="flex items-center gap-2">
                <input
                  type="checkbox"
                  checked={config.autoAssign}
                  onChange={e => setConfig({ ...config, autoAssign: e.target.checked })}
                />
                <span>Auto-assign {importTier === 'spotlight' ? 'positions' : 'ranks'}</span>
              </label>

              <label className="flex items-center gap-2">
                <input
                  type="checkbox"
                  checked={config.markAsPaid}
                  onChange={e => setConfig({ ...config, markAsPaid: e.target.checked })}
                />
                <span>Mark all as paid</span>
              </label>

              {importTier === 'other' && (
                <>
                  <label className="flex items-center gap-2">
                    <input
                      type="checkbox"
                      checked={config.markAsFeatured}
                      onChange={e => setConfig({ ...config, markAsFeatured: e.target.checked })}
                    />
                    <span>Mark all as featured</span>
                  </label>

                  <label className="flex items-center gap-2">
                    <input
                      type="checkbox"
                      checked={config.markAsVerified}
                      onChange={e => setConfig({ ...config, markAsVerified: e.target.checked })}
                    />
                    <span>Mark all as verified</span>
                  </label>
                </>
              )}
            </div>

            <div className="flex gap-4">
              <button
                onClick={() => setStep(3)}
                className="px-6 py-3 border rounded-lg hover:bg-gray-50"
              >
                Back
              </button>
              <button
                onClick={parseCSV}
                className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
              >
                Preview & Validate
              </button>
            </div>
          </div>
        )}

        {step === 5 && (
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-bold mb-4">Step 5: Preview & Validate</h2>

            <div className="mb-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="flex items-center gap-2">
                  <CheckCircle className="w-5 h-5 text-green-600" />
                  <span className="text-sm">Valid: {parsedData.filter(r => r.validation.isValid).length}</span>
                </div>
                <div className="flex items-center gap-2">
                  <AlertCircle className="w-5 h-5 text-yellow-600" />
                  <span className="text-sm">Warnings: {parsedData.filter(r => r.validation.warnings.length > 0).length}</span>
                </div>
                <div className="flex items-center gap-2">
                  <AlertCircle className="w-5 h-5 text-red-600" />
                  <span className="text-sm">Errors: {parsedData.filter(r => !r.validation.isValid).length}</span>
                </div>
              </div>

              <div className="max-h-96 overflow-y-auto space-y-2">
                {parsedData.slice(0, 10).map((row, index) => (
                  <div key={index} className={`p-3 rounded border ${
                    !row.validation.isValid ? 'bg-red-50 border-red-200' :
                    row.validation.warnings.length > 0 ? 'bg-yellow-50 border-yellow-200' :
                    'bg-green-50 border-green-200'
                  }`}>
                    <div className="font-semibold">{row.original.agency_name}</div>
                    {row.validation.errors.length > 0 && (
                      <div className="text-sm text-red-600">Errors: {row.validation.errors.join(', ')}</div>
                    )}
                    {row.validation.warnings.length > 0 && (
                      <div className="text-sm text-yellow-600">Warnings: {row.validation.warnings.join(', ')}</div>
                    )}
                  </div>
                ))}
              </div>
            </div>

            <div className="flex gap-4">
              <button
                onClick={() => setStep(4)}
                className="px-6 py-3 border rounded-lg hover:bg-gray-50"
              >
                Back
              </button>
              <button
                onClick={startImport}
                disabled={parsedData.filter(r => r.validation.isValid).length === 0}
                className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Start Import
              </button>
            </div>
          </div>
        )}

        {step === 6 && (
          <div className="bg-white rounded-lg shadow p-6">
            {importing ? (
              <>
                <h2 className="text-xl font-bold mb-4">Importing...</h2>
                <div className="mb-4">
                  <div className="w-full bg-gray-200 rounded-full h-4">
                    <div
                      className="bg-indigo-600 h-4 rounded-full transition-all"
                      style={{ width: `${importProgress}%` }}
                    />
                  </div>
                  <p className="text-center mt-2 text-sm text-gray-600">{Math.round(importProgress)}%</p>
                </div>
              </>
            ) : (
              <>
                <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                  <CheckCircle className="w-6 h-6 text-green-600" />
                  Import Complete!
                </h2>

                {importResults && (
                  <div className="bg-gray-50 rounded p-4 mb-6">
                    <p className="font-semibold mb-2">Results:</p>
                    <ul className="text-sm space-y-1">
                      <li className="text-green-600">Imported: {importResults.success}</li>
                      {importResults.errors > 0 && (
                        <li className="text-red-600">Errors: {importResults.errors}</li>
                      )}
                    </ul>
                  </div>
                )}

                <div className="flex gap-4">
                  <button
                    onClick={() => {
                      setStep(1);
                      setFile(null);
                      setParsedData([]);
                      setImportResults(null);
                      loadStateStats();
                    }}
                    className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
                  >
                    Import More
                  </button>
                  <button
                    onClick={() => window.location.href = `/states/${selectedState}`}
                    className="px-6 py-3 border rounded-lg hover:bg-gray-50"
                  >
                    View {selectedStateName} Page
                  </button>
                </div>
              </>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
