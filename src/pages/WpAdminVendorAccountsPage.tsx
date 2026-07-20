import { useCallback, useEffect, useState } from 'react';
import { UserPlus, Unlink, Trash2, ExternalLink, X, Copy, Check } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import ToolSelectCombobox, { type ToolOption } from '../components/compare/ToolSelectCombobox';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

interface VendorAccountRow {
  tool_id: string;
  tool_slug: string;
  tool_name: string;
  tool_logo: string | null;
  user_id: string;
  email: string | null;
  created_at: string | null;
  last_sign_in_at: string | null;
}

function randomPassword(): string {
  return Array.from(crypto.getRandomValues(new Uint8Array(9)), (b) => b.toString(36).padStart(2, '0')).join('').slice(0, 14);
}

// Manual test tooling for the vendor account system (see
// vendor-claim-account / vendor-dashboard edge functions). In production an
// account is only ever created through the paid + ownership-verified claim
// flow at /vendor/claim — this page lets an admin create/inspect/remove one
// directly, so /login -> /vendor/dashboard can be tested without running a
// real Stripe checkout each time.
export default function WpAdminVendorAccountsPage() {
  const [accounts, setAccounts] = useState<VendorAccountRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [actingId, setActingId] = useState<string | null>(null);

  const [formOpen, setFormOpen] = useState(false);
  const [selectedTool, setSelectedTool] = useState<ToolOption | null>(null);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState(randomPassword());
  const [submitting, setSubmitting] = useState(false);
  const [createdCreds, setCreatedCreds] = useState<{ email: string; password: string } | null>(null);
  const [copied, setCopied] = useState(false);

  const fetchAccounts = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; accounts: VendorAccountRow[]; error?: string }>('admin-vendor-accounts');
    if (result.ok && result.data?.ok) {
      setAccounts(result.data.accounts);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load vendor accounts'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchAccounts();
  }, [fetchAccounts]);

  function openCreate() {
    setSelectedTool(null);
    setEmail('');
    setPassword(randomPassword());
    setCreatedCreds(null);
    setFormOpen(true);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!selectedTool || !email.trim() || password.length < 8) {
      setError('Pick a tool, enter an email, and use a password of at least 8 characters.');
      return;
    }
    setSubmitting(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; error?: string; email?: string }>('admin-vendor-accounts', {
      method: 'POST',
      body: { action: 'create', tool_slug: selectedTool.slug, email: email.trim(), password },
    });
    setSubmitting(false);
    if (result.ok && result.data?.ok) {
      setCreatedCreds({ email: email.trim(), password });
      fetchAccounts();
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to create account'));
    }
  }

  async function handleUnlink(account: VendorAccountRow) {
    if (!confirm(`Unlink ${account.email} from ${account.tool_name}? The login account itself is kept.`)) return;
    setActingId(account.tool_id);
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-vendor-accounts', {
      method: 'POST',
      body: { action: 'unlink', tool_id: account.tool_id },
    });
    if (result.ok && result.data?.ok) {
      setAccounts((prev) => prev.filter((a) => a.tool_id !== account.tool_id));
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to unlink account'));
    }
    setActingId(null);
  }

  async function handleDelete(account: VendorAccountRow) {
    if (!confirm(`Permanently delete the login account for ${account.email}? This can't be undone.`)) return;
    setActingId(account.tool_id);
    const result = await adminApiFetch<{ ok: boolean; error?: string }>('admin-vendor-accounts', {
      method: 'POST',
      body: { action: 'delete_account', user_id: account.user_id },
    });
    if (result.ok && result.data?.ok) {
      setAccounts((prev) => prev.filter((a) => a.tool_id !== account.tool_id));
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to delete account'));
    }
    setActingId(null);
  }

  function copyCreds() {
    if (!createdCreds) return;
    navigator.clipboard?.writeText(`${createdCreds.email}\n${createdCreds.password}`);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  }

  return (
    <WpAdminLayout title="Vendor Accounts" subtitle="See and manually create login accounts for /login -> /vendor/dashboard, for testing">
      <div className="p-6 max-w-4xl mx-auto space-y-5">
        <div className="flex items-center justify-between">
          <p className="text-sm text-slate-500">{accounts.length} linked account{accounts.length === 1 ? '' : 's'}</p>
          <button
            type="button"
            onClick={openCreate}
            className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] transition-colors"
          >
            <UserPlus className="w-4 h-4" />
            Create test account
          </button>
        </div>

        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {formOpen && (
          <div className="bg-white border border-slate-200 rounded-xl p-5 space-y-4">
            <div className="flex items-center justify-between">
              <p className="font-semibold text-[#0B1221] text-sm">
                {createdCreds ? 'Account created' : 'Create a vendor login account'}
              </p>
              <button type="button" onClick={() => setFormOpen(false)} aria-label="Close" className="text-slate-400 hover:text-slate-600">
                <X className="w-4 h-4" />
              </button>
            </div>

            {createdCreds ? (
              <div>
                <p className="text-sm text-slate-500 mb-3">
                  Share these with yourself to test — sign in at{' '}
                  <a href="/login" target="_blank" rel="noopener noreferrer" className="text-indigo-600 font-medium hover:underline">
                    /login
                  </a>.
                </p>
                <div className="bg-slate-50 border border-slate-200 rounded-lg p-3.5 font-mono text-sm space-y-1">
                  <p><span className="text-slate-400">email:</span> {createdCreds.email}</p>
                  <p><span className="text-slate-400">password:</span> {createdCreds.password}</p>
                </div>
                <div className="flex items-center gap-2 mt-3">
                  <button
                    type="button"
                    onClick={copyCreds}
                    className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 transition-colors"
                  >
                    {copied ? <Check className="w-3.5 h-3.5" /> : <Copy className="w-3.5 h-3.5" />}
                    {copied ? 'Copied' : 'Copy credentials'}
                  </button>
                  <button
                    type="button"
                    onClick={() => setFormOpen(false)}
                    className="inline-flex items-center px-4 py-2 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] transition-colors"
                  >
                    Done
                  </button>
                </div>
              </div>
            ) : (
              <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                  <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">Tool to link</label>
                  <ToolSelectCombobox label="Tool" value={selectedTool} onChange={setSelectedTool} compact />
                </div>
                <div>
                  <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">Email</label>
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you+test@gappsy.com"
                    required
                    className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  />
                </div>
                <div>
                  <label className="text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5 block">Password</label>
                  <div className="flex items-center gap-2">
                    <input
                      type="text"
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      required
                      minLength={8}
                      className="flex-1 px-3 py-2 rounded-lg border border-slate-200 text-sm font-mono focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    />
                    <button
                      type="button"
                      onClick={() => setPassword(randomPassword())}
                      className="px-3 py-2 rounded-lg text-xs font-semibold text-slate-500 bg-slate-50 hover:bg-slate-100 transition-colors shrink-0"
                    >
                      Regenerate
                    </button>
                  </div>
                </div>
                <button
                  type="submit"
                  disabled={submitting || !selectedTool}
                  className="inline-flex items-center justify-center px-5 py-2.5 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] disabled:opacity-50 transition-colors"
                >
                  {submitting ? 'Creating…' : 'Create account'}
                </button>
              </form>
            )}
          </div>
        )}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : accounts.length === 0 ? (
          <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">
            No tool has a linked vendor account yet.
          </p>
        ) : (
          <div className="space-y-3">
            {accounts.map((account) => (
              <div key={account.tool_id} className="bg-white border border-slate-200 rounded-xl p-4 flex items-center gap-4">
                {account.tool_logo ? (
                  <img src={account.tool_logo} alt="" className="w-10 h-10 rounded-lg object-contain border border-slate-100 shrink-0" />
                ) : (
                  <div className="w-10 h-10 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-sm shrink-0">
                    {account.tool_name.charAt(0)}
                  </div>
                )}
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-[#0B1221] text-sm truncate">{account.tool_name}</p>
                  <p className="text-xs text-slate-500 mt-0.5">{account.email}</p>
                  <p className="text-xs text-slate-400 mt-0.5">
                    Created {account.created_at ? new Date(account.created_at).toLocaleString() : '—'}
                    {account.last_sign_in_at ? ` · last signed in ${new Date(account.last_sign_in_at).toLocaleString()}` : ' · never signed in'}
                  </p>
                </div>
                <div className="flex items-center gap-1.5 shrink-0">
                  <a
                    href={`/tools/${account.tool_slug}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label="View listing"
                    className="w-9 h-9 rounded-full bg-slate-50 text-slate-500 hover:bg-slate-100 flex items-center justify-center transition-colors"
                  >
                    <ExternalLink className="w-4 h-4" />
                  </a>
                  <button
                    type="button"
                    disabled={actingId === account.tool_id}
                    onClick={() => handleUnlink(account)}
                    aria-label="Unlink from tool"
                    title="Unlink from tool (keeps the login account)"
                    className="w-9 h-9 rounded-full bg-amber-50 text-amber-600 hover:bg-amber-100 flex items-center justify-center transition-colors disabled:opacity-50"
                  >
                    <Unlink className="w-4 h-4" />
                  </button>
                  <button
                    type="button"
                    disabled={actingId === account.tool_id}
                    onClick={() => handleDelete(account)}
                    aria-label="Delete account"
                    title="Permanently delete the login account"
                    className="w-9 h-9 rounded-full bg-rose-50 text-rose-600 hover:bg-rose-100 flex items-center justify-center transition-colors disabled:opacity-50"
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
