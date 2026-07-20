import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { Loader2, Mail, Lock, ArrowRight, LayoutDashboard, Rocket, Grid2x2 } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';
import EntitySEOTags from '../components/EntitySEOTags';
import { useNoindex } from '../components/NoindexMeta';

// A focused, single-purpose screen — full navy backdrop (the same #0A1735
// as the site's sticky header) rather than the light page chrome used
// everywhere else, so the white Gappsy logo reads the same way here as it
// does there. Account creation is never open here (see vendor-claim-
// account): only businesses with a paid, ownership-verified listing ever
// get one, so that's stated plainly with a real CTA to Feature My Product
// rather than a vague "contact us" footnote.
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
    <div className="min-h-screen bg-[#0A1735] flex flex-col relative overflow-hidden">
      <EntitySEOTags title="Sign In | Gappsy" description="Sign in to manage your featured listing on Gappsy." path="/login" noindex />

      <div
        className="pointer-events-none absolute inset-0 opacity-60"
        style={{ background: 'radial-gradient(60% 50% at 50% 0%, rgba(79,71,230,0.25), transparent)' }}
        aria-hidden="true"
      />

      <header className="flex items-center justify-center pt-6 lg:pt-8 pb-2 relative">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-9 lg:h-10 w-auto" />
        </Link>
      </header>

      <main className="flex-1 flex items-start justify-center px-4 pt-4 lg:pt-6 pb-10 relative">
        <div className="w-full max-w-sm lg:max-w-3xl">
          <div className="lg:flex lg:justify-center lg:gap-6 lg:items-start">
            <div className="w-full max-w-sm">
              {!authLoading && user ? (
                <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)] text-center">
                  <div className="w-11 h-11 rounded-2xl bg-[#EEF0FE] flex items-center justify-center mx-auto mb-4">
                    <LayoutDashboard className="w-5 h-5 text-[#4F47E6]" />
                  </div>
                  <h1 className="text-lg font-bold text-[#0B1221]">You're already signed in</h1>
                  <p className="text-sm text-slate-500 mt-1.5 mb-5">{user.email}</p>
                  <Link
                    to="/vendor/dashboard"
                    className="inline-flex items-center justify-center gap-1.5 w-full bg-[#4F47E6] hover:bg-[#4338CA] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all"
                  >
                    Go to dashboard
                    <ArrowRight className="w-4 h-4" />
                  </Link>
                </div>
              ) : (
                <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)]">
                  <h1 className="text-xl font-bold text-[#0B1221] tracking-tight">Vendor sign in</h1>
                  <p className="text-[13px] text-slate-500 mt-1.5 mb-6 leading-relaxed">
                    For businesses with a featured, ownership-verified listing on Gappsy.
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
                          className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow"
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
                          className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow"
                          placeholder="••••••••"
                        />
                      </div>
                    </div>

                    <button
                      type="submit"
                      disabled={submitting}
                      className="w-full inline-flex items-center justify-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all disabled:opacity-60 mt-1"
                    >
                      {submitting && <Loader2 className="w-4 h-4 animate-spin" />}
                      Sign in
                    </button>
                  </form>
                </div>
              )}
            </div>

            <div className="w-full max-w-sm lg:max-w-[280px] mt-4 lg:mt-0 space-y-3">
              <Link
                to="/login/apps"
                className="flex items-center gap-3 rounded-2xl bg-white p-4 shadow-[0_12px_28px_rgba(0,0,0,0.18)] hover:shadow-[0_16px_36px_rgba(0,0,0,0.24)] transition-shadow"
              >
                <div className="w-10 h-10 shrink-0 rounded-xl bg-[#EEF0FE] flex items-center justify-center">
                  <Grid2x2 className="w-5 h-5 text-[#0A1735]" aria-hidden="true" />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-[13px] font-bold text-[#0B1221] leading-tight">Looking to log into a Gappsy product?</p>
                  <p className="text-[12px] text-slate-500 leading-tight mt-0.5">Appbuilder, Proof, or Analytics — click here</p>
                </div>
                <ArrowRight className="w-4 h-4 text-slate-300 shrink-0" aria-hidden="true" />
              </Link>

              {(authLoading || !user) && (
                <div className="rounded-2xl bg-white/5 border border-white/10 backdrop-blur-sm p-4 text-center lg:text-left">
                  <p className="text-[13px] text-white/70 leading-relaxed">
                    Accounts are only created for businesses with a paid, verified listing — there's no open sign-up.
                  </p>
                  <Link
                    to="/feature-my-product"
                    className="inline-flex items-center justify-center gap-1.5 w-full mt-3 bg-white/10 hover:bg-white/15 border border-white/15 text-white px-4 py-2.5 rounded-xl font-semibold text-[13px] transition-colors"
                  >
                    <Rocket className="w-3.5 h-3.5" aria-hidden="true" />
                    Feature your product to get one
                  </Link>
                </div>
              )}
            </div>
          </div>

          <p className="text-center mt-6">
            <Link to="/" className="text-[13px] text-white/50 hover:text-white/80 transition-colors">← Back to Gappsy</Link>
          </p>
        </div>
      </main>
    </div>
  );
}
