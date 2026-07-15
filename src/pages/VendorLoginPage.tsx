import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { Loader2, Mail, Lock, ArrowRight, LayoutDashboard } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';
import EntitySEOTags from '../components/EntitySEOTags';
import { useNoindex } from '../components/NoindexMeta';

export default function VendorLoginPage() {
  useNoindex();
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setSubmitting(true);
    setError(null);
    const { error: signInError } = await supabase.auth.signInWithPassword({ email, password });
    setSubmitting(false);
    if (signInError) {
      setError(signInError.message === 'Invalid login credentials' ? "That email or password doesn't match an account." : signInError.message);
      return;
    }
    navigate('/vendor/dashboard');
  }

  return (
    <div className="min-h-screen bg-[#f7f8fa] flex flex-col">
      <EntitySEOTags title="Sign In | Gappsy" description="Sign in to manage your featured listing on Gappsy." path="/login" noindex />

      <header className="flex items-center justify-center pt-8 pb-2">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-7 w-auto" />
        </Link>
      </header>

      <main className="flex-1 flex items-center justify-center px-4 py-10">
        <div className="w-full max-w-sm">
          {!authLoading && user ? (
            <div className="bg-white border border-[#eef0f3] rounded-3xl p-7 shadow-[0_8px_24px_rgba(15,23,42,0.06)] text-center">
              <div className="w-11 h-11 rounded-2xl bg-[#EEF1F7] flex items-center justify-center mx-auto mb-4">
                <LayoutDashboard className="w-5 h-5 text-[#0A1735]" />
              </div>
              <h1 className="text-lg font-bold text-[#0B1221]">You're already signed in</h1>
              <p className="text-sm text-slate-500 mt-1.5 mb-5">{user.email}</p>
              <Link
                to="/vendor/dashboard"
                className="inline-flex items-center justify-center gap-1.5 w-full bg-[#0A1735] hover:bg-[#132952] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all"
              >
                Go to dashboard
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          ) : (
            <div className="bg-white border border-[#eef0f3] rounded-3xl p-7 shadow-[0_8px_24px_rgba(15,23,42,0.06)]">
              <h1 className="text-xl font-bold text-[#0B1221] tracking-tight">Vendor sign in</h1>
              <p className="text-[13px] text-slate-500 mt-1.5 mb-6 leading-relaxed">
                For businesses that have featured a listing on Gappsy and verified ownership.
              </p>

              {error && (
                <div className="mb-4 text-[13px] text-red-600 bg-red-50 border border-red-100 rounded-xl px-3.5 py-2.5">{error}</div>
              )}

              <form onSubmit={handleSubmit} className="space-y-3.5">
                <div>
                  <label htmlFor="email" className="block text-xs font-semibold text-slate-600 mb-1.5">Email</label>
                  <div className="relative">
                    <Mail className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" aria-hidden="true" />
                    <input
                      id="email"
                      type="email"
                      required
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/20 focus:border-[#8A9AC4] transition-shadow"
                      placeholder="you@company.com"
                    />
                  </div>
                </div>
                <div>
                  <label htmlFor="password" className="block text-xs font-semibold text-slate-600 mb-1.5">Password</label>
                  <div className="relative">
                    <Lock className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" aria-hidden="true" />
                    <input
                      id="password"
                      type="password"
                      required
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/20 focus:border-[#8A9AC4] transition-shadow"
                      placeholder="••••••••"
                    />
                  </div>
                </div>

                <button
                  type="submit"
                  disabled={submitting}
                  className="w-full inline-flex items-center justify-center gap-1.5 bg-[#0A1735] hover:bg-[#132952] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all disabled:opacity-60 mt-1"
                >
                  {submitting && <Loader2 className="w-4 h-4 animate-spin" />}
                  Sign in
                </button>
              </form>

              <p className="text-[12px] text-slate-400 text-center mt-5 leading-relaxed">
                Don't have an account yet? You'll get an invite by email after your listing's ownership is verified.
              </p>
            </div>
          )}

          <p className="text-center mt-5">
            <Link to="/" className="text-[13px] text-slate-400 hover:text-slate-600 transition-colors">← Back to Gappsy</Link>
          </p>
        </div>
      </main>
    </div>
  );
}
