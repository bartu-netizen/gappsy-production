import { useEffect, useState } from 'react';
import { useSearchParams, useNavigate, Link } from 'react-router-dom';
import { Loader2, Lock, ShieldCheck, CheckCircle2, ArrowRight, MailCheck } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { vendorClaim } from '../lib/vendorDashboardApi';
import EntitySEOTags from '../components/EntitySEOTags';
import { useNoindex } from '../components/NoindexMeta';

type LoadState = 'loading' | 'ready' | 'not_found' | 'expired' | 'not_verified' | 'no_tool' | 'already_claimed';
type Step = 'form' | 'confirm_email' | 'done' | 'error';

export default function VendorClaimPage() {
  useNoindex();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const token = searchParams.get('token') || '';

  const [loadState, setLoadState] = useState<LoadState>('loading');
  const [contactEmail, setContactEmail] = useState('');
  const [toolName, setToolName] = useState('');

  const [step, setStep] = useState<Step>('form');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!token) {
      setLoadState('not_found');
      return;
    }
    vendorClaim.lookupToken(token).then((res) => {
      if (!res.ok) {
        setLoadState((res.error_code as LoadState) || 'not_found');
        return;
      }
      setContactEmail(res.contact_email);
      setToolName(res.tool_name);
      setLoadState('ready');
    }).catch(() => setLoadState('not_found'));
  }, [token]);

  async function finalizeClaim() {
    const { data } = await supabase.auth.getSession();
    const accessToken = data.session?.access_token;
    if (!accessToken) {
      setStep('confirm_email');
      return;
    }
    const claimRes = await vendorClaim.claim(token, accessToken);
    if (!claimRes.ok) {
      setError(claimRes.error_code === 'email_mismatch'
        ? 'That account email does not match the verified listing email.'
        : 'Could not link your account to this listing. Contact support if this keeps happening.');
      setStep('error');
      return;
    }
    setStep('done');
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    if (password.length < 8) {
      setError('Password must be at least 8 characters.');
      return;
    }
    if (password !== confirmPassword) {
      setError('Passwords do not match.');
      return;
    }
    setSubmitting(true);
    const { data, error: signUpError } = await supabase.auth.signUp({ email: contactEmail, password });
    setSubmitting(false);
    if (signUpError) {
      setError(signUpError.message.includes('already registered')
        ? 'An account already exists for this email — try signing in instead.'
        : signUpError.message);
      return;
    }
    if (data.session) {
      await finalizeClaim();
    } else {
      setStep('confirm_email');
    }
  }

  async function handleConfirmedContinue() {
    setSubmitting(true);
    setError(null);
    const { error: signInError } = await supabase.auth.signInWithPassword({ email: contactEmail, password });
    setSubmitting(false);
    if (signInError) {
      setError('Please confirm your email first, then try again.');
      return;
    }
    await finalizeClaim();
  }

  return (
    <div className="min-h-screen bg-[#f7f8fa] flex flex-col">
      <EntitySEOTags title="Claim Your Listing Account | Gappsy" description="Create your vendor account to manage your featured Gappsy listing." path="/vendor/claim" noindex />

      <header className="flex items-center justify-center pt-8 pb-2">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-7 w-auto" />
        </Link>
      </header>

      <main className="flex-1 flex items-center justify-center px-4 py-10">
        <div className="w-full max-w-sm">
          <div className="bg-white border border-[#eef0f3] rounded-3xl p-7 shadow-[0_8px_24px_rgba(15,23,42,0.06)]">
            {loadState === 'loading' && (
              <div className="flex items-center justify-center py-10"><Loader2 className="w-6 h-6 text-[#0A1735] animate-spin" /></div>
            )}

            {loadState === 'not_found' && <ClaimNotice title="Link not found" body="Double-check the link from your verification email, or contact support for a new one." />}
            {loadState === 'expired' && <ClaimNotice title="This link has expired" body="Contact support and we'll send you a fresh one." />}
            {loadState === 'not_verified' && <ClaimNotice title="Verify ownership first" body="You need to finish domain ownership verification before you can create an account." />}
            {loadState === 'no_tool' && <ClaimNotice title="No listing found" body="This link isn't linked to a listing. Contact support for help." />}
            {loadState === 'already_claimed' && <ClaimNotice title="Already claimed" body="An account has already been created for this listing." action={{ label: 'Sign in instead', href: '/login' }} />}

            {loadState === 'ready' && step === 'form' && (
              <>
                <div className="w-11 h-11 rounded-2xl bg-emerald-50 flex items-center justify-center mb-4">
                  <ShieldCheck className="w-5 h-5 text-emerald-500" />
                </div>
                <h1 className="text-xl font-bold text-[#0B1221] tracking-tight">Create your account</h1>
                <p className="text-[13px] text-slate-500 mt-1.5 mb-6 leading-relaxed">
                  Manage the <strong className="text-slate-700">{toolName}</strong> listing on Gappsy — edit content, respond to reviews, and more.
                </p>

                {error && <div className="mb-4 text-[13px] text-red-600 bg-red-50 border border-red-100 rounded-xl px-3.5 py-2.5">{error}</div>}

                <form onSubmit={handleSubmit} className="space-y-3.5">
                  <div>
                    <label className="block text-xs font-semibold text-slate-600 mb-1.5">Email</label>
                    <input
                      type="email"
                      value={contactEmail}
                      disabled
                      className="w-full h-11 rounded-xl border border-slate-200 bg-slate-50 px-3.5 text-sm text-slate-500"
                    />
                  </div>
                  <div>
                    <label htmlFor="password" className="block text-xs font-semibold text-slate-600 mb-1.5">Password</label>
                    <div className="relative">
                      <Lock className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" aria-hidden="true" />
                      <input
                        id="password"
                        type="password"
                        required
                        minLength={8}
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/20 focus:border-[#8A9AC4] transition-shadow"
                        placeholder="At least 8 characters"
                      />
                    </div>
                  </div>
                  <div>
                    <label htmlFor="confirmPassword" className="block text-xs font-semibold text-slate-600 mb-1.5">Confirm password</label>
                    <div className="relative">
                      <Lock className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" aria-hidden="true" />
                      <input
                        id="confirmPassword"
                        type="password"
                        required
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)}
                        className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/20 focus:border-[#8A9AC4] transition-shadow"
                        placeholder="Repeat password"
                      />
                    </div>
                  </div>

                  <button
                    type="submit"
                    disabled={submitting}
                    className="w-full inline-flex items-center justify-center gap-1.5 bg-[#0A1735] hover:bg-[#132952] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all disabled:opacity-60 mt-1"
                  >
                    {submitting && <Loader2 className="w-4 h-4 animate-spin" />}
                    Create account
                  </button>
                </form>
              </>
            )}

            {step === 'confirm_email' && (
              <div className="text-center py-2">
                <div className="w-11 h-11 rounded-2xl bg-[#EEF1F7] flex items-center justify-center mx-auto mb-4">
                  <MailCheck className="w-5 h-5 text-[#0A1735]" />
                </div>
                <h1 className="text-lg font-bold text-[#0B1221]">Confirm your email</h1>
                <p className="text-[13px] text-slate-500 mt-1.5 mb-5 leading-relaxed">
                  We sent a confirmation link to <strong className="text-slate-700">{contactEmail}</strong>. Once confirmed, come back and continue.
                </p>
                {error && <div className="mb-4 text-[13px] text-red-600 bg-red-50 border border-red-100 rounded-xl px-3.5 py-2.5 text-left">{error}</div>}
                <button
                  type="button"
                  onClick={handleConfirmedContinue}
                  disabled={submitting}
                  className="w-full inline-flex items-center justify-center gap-1.5 bg-[#0A1735] hover:bg-[#132952] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all disabled:opacity-60"
                >
                  {submitting && <Loader2 className="w-4 h-4 animate-spin" />}
                  I've confirmed — continue
                </button>
              </div>
            )}

            {step === 'done' && (
              <div className="text-center py-2">
                <div className="w-11 h-11 rounded-2xl bg-emerald-50 flex items-center justify-center mx-auto mb-4">
                  <CheckCircle2 className="w-5 h-5 text-emerald-500" />
                </div>
                <h1 className="text-lg font-bold text-[#0B1221]">You're all set</h1>
                <p className="text-[13px] text-slate-500 mt-1.5 mb-5">Your account is linked to {toolName}.</p>
                <button
                  type="button"
                  onClick={() => navigate('/vendor/dashboard')}
                  className="w-full inline-flex items-center justify-center gap-1.5 bg-[#0A1735] hover:bg-[#132952] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all"
                >
                  Go to dashboard
                  <ArrowRight className="w-4 h-4" />
                </button>
              </div>
            )}

            {step === 'error' && (
              <ClaimNotice title="Something went wrong" body={error || 'Please try again.'} />
            )}
          </div>

          <p className="text-center mt-5">
            <Link to="/" className="text-[13px] text-slate-400 hover:text-slate-600 transition-colors">← Back to Gappsy</Link>
          </p>
        </div>
      </main>
    </div>
  );
}

function ClaimNotice({ title, body, action }: { title: string; body: string; action?: { label: string; href: string } }) {
  return (
    <div className="text-center py-2">
      <h1 className="text-lg font-bold text-[#0B1221]">{title}</h1>
      <p className="text-[13px] text-slate-500 mt-1.5 mb-4 leading-relaxed">{body}</p>
      {action && (
        <Link to={action.href} className="inline-flex items-center gap-1 text-sm font-medium text-[#0A1735] hover:text-[#132952]">
          {action.label} <ArrowRight className="w-3.5 h-3.5" />
        </Link>
      )}
    </div>
  );
}
