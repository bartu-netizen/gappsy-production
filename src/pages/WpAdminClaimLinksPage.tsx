import { useState } from 'react';
import { Link2, Copy, Check, Search, RefreshCw, AlertCircle, ExternalLink } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { searchAgencies, type AgencyResult } from '../lib/yourAgencyApi';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

function generateToken(): string {
  const chars = 'ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789';
  let token = '';
  for (let i = 0; i < 12; i++) {
    token += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return token;
}

async function saveToken(token: string, agency: AgencyResult, note: string) {
  const secret = localStorage.getItem('admin_secret') ?? '';
  const adminToken = localStorage.getItem('gappsy_admin_token') ?? '';
  const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-auth-check`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
      'x-admin-token': adminToken,
      'x-admin-secret': secret,
    },
  });
  if (!res.ok) throw new Error('Not authenticated');

  const { createClient } = await import('@supabase/supabase-js');
  const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

  const { error } = await supabase.from('agency_claim_tokens').insert({
    token,
    agency_id: agency.agency_id,
    agency_slug: agency.agency_slug,
    agency_name: agency.agency_name,
    note: note || null,
  });
  if (error) throw new Error(error.message);
}

interface GeneratedLink {
  token: string;
  agency: AgencyResult;
  url: string;
  note: string;
}

export default function WpAdminClaimLinksPage() {
  const [query, setQuery] = useState('');
  const [searching, setSearching] = useState(false);
  const [results, setResults] = useState<AgencyResult[]>([]);
  const [selected, setSelected] = useState<AgencyResult | null>(null);
  const [note, setNote] = useState('');
  const [generating, setGenerating] = useState(false);
  const [generated, setGenerated] = useState<GeneratedLink[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [copiedToken, setCopiedToken] = useState<string | null>(null);

  const handleSearch = async () => {
    if (!query.trim()) return;
    setSearching(true);
    setError(null);
    try {
      const res = await searchAgencies(query, 10);
      setResults(res);
    } catch {
      setError('Search failed. Check your connection.');
    } finally {
      setSearching(false);
    }
  };

  const handleGenerate = async () => {
    if (!selected) return;
    setGenerating(true);
    setError(null);
    try {
      const token = generateToken();
      await saveToken(token, selected, note);
      const url = `${window.location.origin}/your-agency/t/${token}`;
      setGenerated((prev) => [{ token, agency: selected, url, note }, ...prev]);
      setNote('');
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : 'Failed to generate token');
    } finally {
      setGenerating(false);
    }
  };

  const copyToClipboard = async (text: string, token: string) => {
    await navigator.clipboard.writeText(text);
    setCopiedToken(token);
    setTimeout(() => setCopiedToken(null), 2000);
  };

  return (
    <WpAdminLayout title="Claim Links" icon={<Link2 className="w-5 h-5" />}>
      <div className="max-w-3xl mx-auto space-y-5">

        {/* Header */}
        <div className="bg-white rounded-xl border border-gray-200 p-5">
          <div className="flex items-start gap-3">
            <div className="w-9 h-9 bg-blue-100 rounded-lg flex items-center justify-center shrink-0">
              <Link2 className="w-4.5 h-4.5 text-blue-600" />
            </div>
            <div>
              <h2 className="text-sm font-semibold text-gray-900">Generate Agency Claim Links</h2>
              <p className="text-xs text-gray-500 mt-0.5">
                Create a unique deep-link for any agency. Share it via email or campaign.
                The recipient lands directly on their listing summary page.
              </p>
            </div>
          </div>
        </div>

        {/* Search agency */}
        <div className="bg-white rounded-xl border border-gray-200 p-5 space-y-4">
          <h3 className="text-xs font-semibold text-gray-600 uppercase tracking-wide">1. Find Agency</h3>
          <div className="flex gap-2">
            <input
              type="text"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
              placeholder="Search by agency name…"
              className="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <button
              onClick={handleSearch}
              disabled={searching}
              className="flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
            >
              {searching ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Search className="w-4 h-4" />}
              Search
            </button>
          </div>

          {results.length > 0 && (
            <div className="divide-y divide-gray-50 border border-gray-100 rounded-xl overflow-hidden">
              {results.map((agency) => (
                <button
                  key={agency.agency_id}
                  onClick={() => { setSelected(agency); setResults([]); setQuery(agency.agency_name); }}
                  className={`w-full text-left flex items-center justify-between px-4 py-3 hover:bg-blue-50 transition-colors ${selected?.agency_id === agency.agency_id ? 'bg-blue-50' : ''}`}
                >
                  <div>
                    <p className="text-sm font-medium text-gray-900">{agency.agency_name}</p>
                    <p className="text-xs text-gray-400">{agency.agency_domain ?? `${new Set(agency.listings.map(l => l.state_slug)).size} states`}</p>
                  </div>
                  <span className="text-xs font-medium text-blue-600 border border-blue-200 bg-blue-50 px-2 py-0.5 rounded-full">
                    Select
                  </span>
                </button>
              ))}
            </div>
          )}

          {selected && (
            <div className="flex items-center gap-2 bg-emerald-50 border border-emerald-200 rounded-lg px-3 py-2">
              <Check className="w-4 h-4 text-emerald-600 shrink-0" />
              <span className="text-sm font-medium text-emerald-700">Selected: {selected.agency_name}</span>
            </div>
          )}
        </div>

        {/* Configure & generate */}
        {selected && (
          <div className="bg-white rounded-xl border border-gray-200 p-5 space-y-4">
            <h3 className="text-xs font-semibold text-gray-600 uppercase tracking-wide">2. Generate Link</h3>
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">
                Campaign note <span className="text-gray-400 font-normal">(optional, e.g. "cold email Jan 2026")</span>
              </label>
              <input
                type="text"
                value={note}
                onChange={(e) => setNote(e.target.value)}
                placeholder="e.g. cold email campaign"
                className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <button
              onClick={handleGenerate}
              disabled={generating}
              className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-semibold px-5 py-2.5 rounded-lg transition-colors"
            >
              {generating ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Link2 className="w-4 h-4" />}
              Generate Claim Link
            </button>
          </div>
        )}

        {error && (
          <div className="flex items-center gap-2 bg-red-50 border border-red-200 rounded-xl px-4 py-3 text-sm text-red-700">
            <AlertCircle className="w-4 h-4 shrink-0" />
            {error}
          </div>
        )}

        {/* Generated links */}
        {generated.length > 0 && (
          <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
            <div className="px-5 py-3 border-b border-gray-100">
              <h3 className="text-xs font-semibold text-gray-600 uppercase tracking-wide">Generated Links</h3>
            </div>
            <div className="divide-y divide-gray-50">
              {generated.map((item) => (
                <div key={item.token} className="px-5 py-4">
                  <div className="flex items-start justify-between gap-3">
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-semibold text-gray-900">{item.agency.agency_name}</p>
                      {item.note && <p className="text-xs text-gray-400 mt-0.5">{item.note}</p>}
                      <div className="flex items-center gap-1 mt-2">
                        <code className="text-xs font-mono text-blue-700 bg-blue-50 border border-blue-200 px-2 py-1 rounded truncate max-w-sm">
                          {item.url}
                        </code>
                      </div>
                    </div>
                    <div className="flex gap-2 shrink-0">
                      <button
                        onClick={() => copyToClipboard(item.url, item.token)}
                        className="flex items-center gap-1.5 text-xs font-medium px-3 py-1.5 rounded-lg border border-gray-200 hover:bg-gray-50 transition-colors"
                        title="Copy link"
                      >
                        {copiedToken === item.token ? <Check className="w-3.5 h-3.5 text-emerald-500" /> : <Copy className="w-3.5 h-3.5" />}
                        {copiedToken === item.token ? 'Copied' : 'Copy'}
                      </button>
                      <a
                        href={item.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center gap-1.5 text-xs font-medium px-3 py-1.5 rounded-lg border border-gray-200 hover:bg-gray-50 transition-colors"
                      >
                        <ExternalLink className="w-3.5 h-3.5" />
                        Preview
                      </a>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
