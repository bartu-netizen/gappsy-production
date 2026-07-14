import { useEffect, useRef, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import { ArrowRight, Check, Loader2, ShieldCheck, AlertCircle, Copy } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';
import OnboardingShell from '../components/featureMyProduct/onboarding/OnboardingShell';
import { vendorOnboarding, getStoredSessionId, setStoredSessionId, clearStoredSessionId } from '../lib/vendorOnboardingApi';

type WizardStep =
  | 'url' | 'matching' | 'match_existing' | 'already_featured' | 'new_product'
  | 'contact' | 'plan' | 'redirecting' | 'finalizing' | 'success' | 'error';

const STEP_INDEX: Record<string, number> = {
  url: 1, matching: 1,
  match_existing: 2, already_featured: 2, new_product: 2,
  contact: 3,
  plan: 4, redirecting: 4,
};

interface ToolSummary { id: string; name: string; slug: string; logo: string | null; short_description: string | null; category: string | null }

// Shared layout for every step: content area (scrolls if it doesn't fit a
// short viewport) + a CTA sticky to the bottom of that same scroll region,
// so the primary action never gets hidden behind a mobile keyboard.
function StepLayout({
  eyebrow, title, subtitle, children, ctaLabel, onCta, ctaDisabled, ctaLoading, footnote,
}: {
  eyebrow?: string;
  title: string;
  subtitle?: string;
  children?: React.ReactNode;
  ctaLabel: string;
  onCta: () => void;
  ctaDisabled?: boolean;
  ctaLoading?: boolean;
  footnote?: string;
}) {
  return (
    <>
      <div className="flex-1 flex flex-col justify-center w-full max-w-md mx-auto px-5 sm:px-6 py-4 sm:py-6">
        {eyebrow && <p className="text-[13px] font-semibold text-[#4F46E5] mb-1">{eyebrow}</p>}
        <h1 className="text-xl sm:text-[26px] font-bold tracking-tight text-[#0B1221] leading-tight">{title}</h1>
        {subtitle && <p className="mt-1.5 text-[14px] sm:text-[15px] text-slate-500 leading-snug">{subtitle}</p>}
        {children && <div className="mt-4">{children}</div>}
      </div>
      <div className="sticky bottom-0 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-5 sm:px-6 py-4 pb-[calc(1rem+env(safe-area-inset-bottom))]">
        <div className="w-full max-w-md mx-auto">
          <button
            type="button"
            onClick={onCta}
            disabled={ctaDisabled || ctaLoading}
            className="w-full flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] hover:opacity-90 disabled:opacity-40 disabled:cursor-not-allowed transition-opacity active:scale-[0.99]"
          >
            {ctaLoading ? <Loader2 className="w-4 h-4 animate-spin" aria-hidden="true" /> : null}
            {ctaLabel}
          </button>
          {footnote && <p className="mt-2 text-center text-xs text-slate-400">{footnote}</p>}
        </div>
      </div>
    </>
  );
}

export default function FeatureMyProductOnboardingPage() {
  const [searchParams] = useSearchParams();
  const [step, setStep] = useState<WizardStep>('url');
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const [rawUrl, setRawUrl] = useState('');
  const [tool, setTool] = useState<ToolSummary | null>(null);
  const [prefillName, setPrefillName] = useState('');
  const [prefillWebsite, setPrefillWebsite] = useState('');
  const [pendingSubmission, setPendingSubmission] = useState(false);

  const [email, setEmail] = useState('');
  const [contactName, setContactName] = useState('');
  const [ownershipConfirmed, setOwnershipConfirmed] = useState(false);

  const [ownershipToken, setOwnershipToken] = useState<string | null>(null);
  const [cancelledNotice, setCancelledNotice] = useState(false);
  const pollRef = useRef<number | null>(null);

  // ── Resume / return-from-Stripe handling ──────────────────────────────
  useEffect(() => {
    const stepParam = searchParams.get('step');
    const sidParam = searchParams.get('session_id');
    const stripeSid = searchParams.get('stripe_session_id');

    if (stepParam === 'success' && (sidParam || stripeSid)) {
      setSessionId(sidParam);
      setStep('finalizing');
      pollForCompletion(sidParam, stripeSid);
      return;
    }
    if (stepParam === 'plan' && sidParam) {
      setSessionId(sidParam);
      setCancelledNotice(searchParams.get('checkout') === 'cancelled');
      setStep('plan');
      return;
    }

    const stored = getStoredSessionId();
    if (stored) {
      vendorOnboarding.sessionStatus({ sessionId: stored }).then((res) => {
        if (res.ok && (res.session_status === 'checkout_completed' || res.session_status === 'verified')) {
          setSessionId(stored);
          setOwnershipToken(res.ownership_token || null);
          setStep('success');
        } else {
          clearStoredSessionId();
        }
      }).catch(() => clearStoredSessionId());
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => () => { if (pollRef.current) window.clearInterval(pollRef.current); }, []);

  function pollForCompletion(sid: string | null, stripeSid: string | null) {
    let attempts = 0;
    pollRef.current = window.setInterval(async () => {
      attempts += 1;
      const res = await vendorOnboarding.sessionStatus({ sessionId: sid || undefined, stripeSessionId: stripeSid || undefined });
      if (res.ok && (res.session_status === 'checkout_completed' || res.session_status === 'verified')) {
        if (pollRef.current) window.clearInterval(pollRef.current);
        setOwnershipToken(res.ownership_token || null);
        setStep('success');
        clearStoredSessionId();
      } else if (attempts >= 15) {
        if (pollRef.current) window.clearInterval(pollRef.current);
        setStep('success'); // webhook is just slow — still a success from the buyer's POV
      }
    }, 2000);
  }

  // ── Step 1: URL ────────────────────────────────────────────────────────
  async function handleUrlSubmit() {
    if (!rawUrl.trim() || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.normalizeAndMatch(rawUrl);
    setLoading(false);
    if (!res.ok) {
      setErrorMessage(res.error || 'Something went wrong. Please try a different URL.');
      return;
    }
    setSessionId(res.session_id);
    setStoredSessionId(res.session_id);

    if (res.already_featured) {
      setTool(res.tool || null);
      setStep('already_featured');
      return;
    }
    if (!res.is_new_product) {
      setTool(res.tool);
      setStep('match_existing');
      return;
    }
    setPendingSubmission(Boolean(res.pending_submission));
    setPrefillName(res.prefill?.name || '');
    setPrefillWebsite(res.prefill?.website || rawUrl);
    setStep('new_product');
  }

  // ── Step 2a: confirm existing tool ─────────────────────────────────────
  function handleConfirmExisting() {
    setStep('contact');
  }

  // ── Step 2b: confirm new product ───────────────────────────────────────
  async function handleConfirmNewProduct() {
    if (!sessionId || !prefillName.trim() || !prefillWebsite.trim() || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.confirmNewProduct(sessionId, prefillName.trim(), prefillWebsite.trim());
    setLoading(false);
    if (!res.ok) {
      setErrorMessage(res.error || 'Could not save this product. Please try again.');
      return;
    }
    setStep('contact');
  }

  // ── Step 3: contact ─────────────────────────────────────────────────────
  async function handleContactSubmit() {
    if (!sessionId || !email.trim() || !ownershipConfirmed || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.submitContact(sessionId, email.trim(), contactName.trim(), ownershipConfirmed);
    setLoading(false);
    if (!res.ok) {
      setErrorMessage(res.error || 'Please check your email address and try again.');
      return;
    }
    setStep('plan');
  }

  // ── Step 4: plan -> checkout ─────────────────────────────────────────────
  async function handleCheckout() {
    if (!sessionId || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.createCheckout(sessionId);
    if (!res.ok) {
      setLoading(false);
      setErrorMessage(res.error_code === 'already_subscribed' ? 'This product already has an active featured subscription.' : (res.error || 'Could not start checkout. Please try again.'));
      return;
    }
    setStep('redirecting');
    window.location.href = res.checkout_url;
  }

  function goBack() {
    setErrorMessage(null);
    if (step === 'match_existing' || step === 'new_product' || step === 'already_featured') setStep('url');
    else if (step === 'contact') setStep(tool ? 'match_existing' : 'new_product');
    else if (step === 'plan') setStep('contact');
  }

  const stepIndex = STEP_INDEX[step] ?? 0;
  const showBack = ['match_existing', 'already_featured', 'new_product', 'contact', 'plan'].includes(step);

  return (
    <>
      <EntitySEOTags
        title="Get Featured on Gappsy — Start Your Listing"
        description="Feature your software on Gappsy's software directory. $37/month, cancel anytime."
        path="/feature-my-product/onboarding"
        noindex
      />
      <OnboardingShell step={stepIndex} onBack={showBack ? goBack : undefined}>
        {errorMessage && (
          <div className="max-w-md w-full mx-auto px-5 sm:px-6 pt-4">
            <div className="flex items-start gap-2 rounded-xl bg-red-50 border border-red-100 px-4 py-3 text-sm text-red-700">
              <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" aria-hidden="true" />
              <span>{errorMessage}</span>
            </div>
          </div>
        )}

        {step === 'url' && (
          <StepLayout
            eyebrow="Feature My Product"
            title="Which product would you like to feature?"
            subtitle="Enter your product's website — we'll check if it's already in the Gappsy directory."
            ctaLabel="Continue"
            onCta={handleUrlSubmit}
            ctaLoading={loading}
            ctaDisabled={!rawUrl.trim()}
            footnote="No account required to get started."
          >
            <label htmlFor="fmp-url" className="sr-only">Product website</label>
            <input
              id="fmp-url"
              type="text"
              inputMode="url"
              autoFocus
              autoCapitalize="off"
              autoCorrect="off"
              placeholder="yourproduct.com"
              value={rawUrl}
              onChange={(e) => setRawUrl(e.target.value)}
              onKeyDown={(e) => { if (e.key === 'Enter') handleUrlSubmit(); }}
              className="w-full h-14 rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-[#7C3AED]/20 focus:border-slate-300"
            />
          </StepLayout>
        )}

        {step === 'already_featured' && (
          <StepLayout
            eyebrow="Already featured"
            title={tool ? `${tool.name} already has a featured subscription` : 'This product is already featured'}
            subtitle="To manage an existing subscription, verify ownership first — we don't show billing details to unverified visitors."
            ctaLabel="Contact support to manage this listing"
            onCta={() => { window.location.href = '/contact'; }}
          />
        )}

        {step === 'match_existing' && tool && (
          <StepLayout
            eyebrow="Found your listing"
            title={tool.name}
            subtitle="Your existing Gappsy listing stays exactly as it is — a featured subscription adds premium visibility and vendor-management access once ownership is verified."
            ctaLabel="Feature this product"
            onCta={handleConfirmExisting}
          >
            <div className="rounded-2xl border border-[#eef0f3] p-4 flex items-start gap-3">
              <div className="w-11 h-11 rounded-xl bg-slate-100 flex items-center justify-center text-sm font-bold text-slate-400 shrink-0">{tool.name.charAt(0)}</div>
              <div className="min-w-0">
                {tool.category && <p className="text-xs font-medium text-slate-400">{tool.category}</p>}
                <p className="text-[14px] text-slate-600 leading-relaxed line-clamp-3">{tool.short_description}</p>
              </div>
            </div>
            <button type="button" onClick={() => setStep('url')} className="mt-3 text-sm font-medium text-slate-400 hover:text-slate-600 transition-colors">
              This is not my product
            </button>
          </StepLayout>
        )}

        {step === 'new_product' && (
          <StepLayout
            eyebrow={pendingSubmission ? 'Pending submission found' : 'We found a new product'}
            title="Confirm your product details"
            subtitle={pendingSubmission ? 'This product is already in our review queue — confirm the details below to continue.' : 'This isn\'t in the Gappsy directory yet. Confirm or edit the details below.'}
            ctaLabel="Continue"
            onCta={handleConfirmNewProduct}
            ctaLoading={loading}
            ctaDisabled={!prefillName.trim() || !prefillWebsite.trim()}
          >
            <div className="space-y-3">
              <div>
                <label htmlFor="fmp-name" className="block text-xs font-medium text-slate-500 mb-1">Product name</label>
                <input
                  id="fmp-name"
                  type="text"
                  value={prefillName}
                  onChange={(e) => setPrefillName(e.target.value)}
                  className="w-full h-12 rounded-xl border border-slate-200 px-4 text-[15px] text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#7C3AED]/20 focus:border-slate-300"
                />
              </div>
              <div>
                <label htmlFor="fmp-website" className="block text-xs font-medium text-slate-500 mb-1">Canonical website</label>
                <input
                  id="fmp-website"
                  type="text"
                  value={prefillWebsite}
                  onChange={(e) => setPrefillWebsite(e.target.value)}
                  className="w-full h-12 rounded-xl border border-slate-200 px-4 text-[15px] text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#7C3AED]/20 focus:border-slate-300"
                />
              </div>
            </div>
          </StepLayout>
        )}

        {step === 'contact' && (
          <StepLayout
            eyebrow="Contact & ownership"
            title="How can we reach you?"
            subtitle="We use your email domain as a signal, not proof — you'll verify ownership after checkout."
            ctaLabel="Continue"
            onCta={handleContactSubmit}
            ctaLoading={loading}
            ctaDisabled={!email.trim() || !ownershipConfirmed}
          >
            <div className="space-y-3">
              <div>
                <label htmlFor="fmp-email" className="block text-xs font-medium text-slate-500 mb-1">Business email</label>
                <input
                  id="fmp-email"
                  type="email"
                  autoFocus
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full h-12 rounded-xl border border-slate-200 px-4 text-[15px] text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#7C3AED]/20 focus:border-slate-300"
                />
              </div>
              <div>
                <label htmlFor="fmp-contact-name" className="block text-xs font-medium text-slate-500 mb-1">Your name (optional)</label>
                <input
                  id="fmp-contact-name"
                  type="text"
                  value={contactName}
                  onChange={(e) => setContactName(e.target.value)}
                  className="w-full h-12 rounded-xl border border-slate-200 px-4 text-[15px] text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#7C3AED]/20 focus:border-slate-300"
                />
              </div>
              <label className="flex items-start gap-2.5 pt-1 cursor-pointer">
                <input
                  type="checkbox"
                  checked={ownershipConfirmed}
                  onChange={(e) => setOwnershipConfirmed(e.target.checked)}
                  className="mt-0.5 w-4 h-4 rounded border-slate-300 text-[#7C3AED] focus:ring-[#7C3AED]/30"
                />
                <span className="text-[13.5px] text-slate-500 leading-snug">I confirm this is my product, or I'm authorized to promote it on Gappsy.</span>
              </label>
            </div>
          </StepLayout>
        )}

        {step === 'plan' && (
          <StepLayout
            eyebrow="Featured Listing"
            title="$37/mo — cancel anytime"
            subtitle="Placements depend on relevance, listing quality, and editorial eligibility — we never guarantee traffic, leads, or rankings."
            ctaLabel="Continue to secure checkout"
            onCta={handleCheckout}
            ctaLoading={loading}
            footnote="Billed monthly via Stripe. No setup fees, no contracts."
          >
            {cancelledNotice && (
              <div className="mb-3 rounded-xl bg-amber-50 border border-amber-100 px-4 py-2.5 text-[13px] text-amber-700">
                Checkout was cancelled — no charge was made. You can try again below.
              </div>
            )}
            <ul className="grid grid-cols-2 gap-x-3 gap-y-2">
              {[
                'Category & comparison placement',
                'Featured tool page badge',
                'Eligible search visibility',
                'Vendor-managed listing',
                'Priority content refresh',
                'Future analytics access',
              ].map((item) => (
                <li key={item} className="flex items-start gap-1.5 text-[12.5px] leading-snug text-slate-600">
                  <Check className="w-3.5 h-3.5 text-[#4F46E5] shrink-0 mt-0.5" aria-hidden="true" />
                  {item}
                </li>
              ))}
            </ul>
          </StepLayout>
        )}

        {step === 'redirecting' && (
          <div className="flex-1 flex flex-col items-center justify-center gap-3 px-6">
            <Loader2 className="w-6 h-6 text-[#7C3AED] animate-spin" aria-hidden="true" />
            <p className="text-sm text-slate-500">Redirecting you to secure checkout…</p>
          </div>
        )}

        {step === 'finalizing' && (
          <div className="flex-1 flex flex-col items-center justify-center gap-3 px-6">
            <Loader2 className="w-6 h-6 text-[#7C3AED] animate-spin" aria-hidden="true" />
            <p className="text-sm text-slate-500">Finalizing your subscription…</p>
          </div>
        )}

        {step === 'success' && <SuccessStep ownershipToken={ownershipToken} />}
      </OnboardingShell>
    </>
  );
}

function SuccessStep({ ownershipToken }: { ownershipToken: string | null }) {
  const [copied, setCopied] = useState(false);
  const verifyUrl = ownershipToken ? `${window.location.origin}/feature-my-product/verify/${ownershipToken}` : null;

  return (
    <div className="flex-1 w-full max-w-md mx-auto px-5 sm:px-6 py-8 flex flex-col">
      <div className="w-12 h-12 rounded-full bg-emerald-50 flex items-center justify-center mb-4">
        <Check className="w-6 h-6 text-emerald-500" aria-hidden="true" />
      </div>
      <h1 className="text-2xl sm:text-[28px] font-bold tracking-tight text-[#0B1221] leading-tight">Your featured listing is being prepared</h1>
      <p className="mt-2 text-[15px] text-slate-500 leading-relaxed">Here's what happens next:</p>

      <ol className="mt-5 space-y-3">
        {[
          'Verify ownership of your product',
          'Review or complete your product details',
          'Gappsy prepares or updates your listing',
          'Featured placement activates after eligibility checks',
        ].map((item, i) => (
          <li key={item} className="flex items-start gap-3 text-[14px] text-slate-600">
            <span className="w-5 h-5 rounded-full bg-indigo-50 text-[#4F46E5] text-[11px] font-bold flex items-center justify-center shrink-0 mt-0.5">{i + 1}</span>
            {item}
          </li>
        ))}
      </ol>

      <div className="mt-6 space-y-2.5">
        {verifyUrl && (
          <a
            href={verifyUrl}
            className="flex items-center justify-center gap-1.5 w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] hover:opacity-90 transition-opacity"
          >
            Verify ownership
            <ArrowRight className="w-4 h-4" aria-hidden="true" />
          </a>
        )}
        {verifyUrl && (
          <button
            type="button"
            onClick={() => { navigator.clipboard?.writeText(verifyUrl); setCopied(true); setTimeout(() => setCopied(false), 2000); }}
            className="flex items-center justify-center gap-1.5 w-full px-6 py-3 rounded-xl text-[14px] font-medium text-slate-500 border border-slate-200 hover:bg-slate-50 transition-colors"
          >
            <Copy className="w-3.5 h-3.5" aria-hidden="true" />
            {copied ? 'Link copied' : 'Copy verification link'}
          </button>
        )}
        <a href="/feature-my-product" className="flex items-center justify-center w-full px-6 py-3 rounded-xl text-[14px] font-medium text-slate-400 hover:text-slate-600 transition-colors">
          Return to Gappsy
        </a>
      </div>

      <div className="mt-auto pt-6 flex items-center gap-1.5 text-xs text-slate-400">
        <ShieldCheck className="w-3.5 h-3.5" aria-hidden="true" />
        Save this page or the verification link — it's how you'll manage your listing.
      </div>
    </div>
  );
}
