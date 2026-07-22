import { useEffect, useRef, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import { ArrowRight, Check, Loader2, ShieldCheck, AlertCircle, Copy, Minus, CornerRightDown } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';
import OnboardingShell from '../components/featureMyProduct/onboarding/OnboardingShell';
import AskGappsyBubble from '../components/askGappsy/AskGappsyBubble';
import { vendorOnboarding, getStoredSessionId, setStoredSessionId, clearStoredSessionId } from '../lib/vendorOnboardingApi';

type WizardStep =
  | 'url' | 'matching' | 'match_existing' | 'already_featured' | 'new_product'
  | 'contact' | 'claim' | 'growth_upsell' | 'redirecting' | 'finalizing' | 'success' | 'error';

const STEP_INDEX: Record<string, number> = {
  url: 1, matching: 1,
  match_existing: 2, already_featured: 2, new_product: 2,
  contact: 3,
  claim: 4,
  growth_upsell: 5,
};

const GROWTH_MONTHLY_FEATURES = [
  'Featured placement across category, comparison, and search',
  'Priority ranking ahead of unfeatured listings',
  'Listing analytics — views and click-throughs, right in your dashboard',
  'See what visitors ask in the chat on your listing, anonymized',
  'Priority placement in AI/LLM answer engines (ChatGPT, Perplexity, Claude)',
  'Remove or hide reviews from your listing, not just reply to them',
];
const GROWTH_YEARLY_ONLY_FEATURES = [
  'A produced video review, posted on our socials',
  'A featured spot in the Gappsy newsletter',
  'No competitor ads shown on your own listing',
  'Faster editorial review of listing updates',
  'Priority support',
  'Early access to new placement types',
];

interface ToolSummary { id: string; name: string; slug: string; logo: string | null; short_description: string | null; category: string | null }

// Shared layout for every step: content area (scrolls if it doesn't fit a
// short viewport) + a CTA sticky to the bottom of that same scroll region,
// so the primary action never gets hidden behind a mobile keyboard.
function StepLayout({
  eyebrow, title, subtitle, children, ctaLabel, onCta, ctaDisabled, ctaLoading, footnote, secondaryAction,
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
  secondaryAction?: React.ReactNode;
}) {
  return (
    <>
      <div className="flex-1 flex flex-col justify-center w-full max-w-xl mx-auto px-5 sm:px-10 py-4 sm:py-6">
        {eyebrow && <p className="text-sm font-semibold text-[#4F47E6] mb-1.5">{eyebrow}</p>}
        <h1 className="text-2xl sm:text-[32px] font-bold tracking-tight text-[#0B1221] leading-tight">{title}</h1>
        {subtitle && <p className="mt-2 text-[15px] sm:text-base text-slate-500 leading-snug">{subtitle}</p>}
        {children && <div className="mt-5">{children}</div>}
      </div>
      <div className="sticky bottom-0 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-5 sm:px-10 py-4 pb-[calc(1rem+env(safe-area-inset-bottom))]">
        <div className="w-full max-w-xl mx-auto">
          <button
            type="button"
            onClick={onCta}
            disabled={ctaDisabled || ctaLoading}
            className="w-full flex items-center justify-center gap-1.5 px-6 py-4 rounded-xl text-base font-semibold text-white bg-[#4F47E6] hover:opacity-90 disabled:opacity-40 disabled:cursor-not-allowed transition-opacity active:scale-[0.99]"
          >
            {ctaLoading ? <Loader2 className="w-4 h-4 animate-spin" aria-hidden="true" /> : null}
            {ctaLabel}
          </button>
          {secondaryAction}
          {footnote && <p className="mt-2 text-center text-[13px] text-slate-400">{footnote}</p>}
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
  const [alreadyClaimed, setAlreadyClaimed] = useState(false);

  const [email, setEmail] = useState('');
  const [contactName, setContactName] = useState('');

  // Which card's button is mid-checkout — two independent pricing cards
  // (Monthly / Yearly) instead of one shared toggle, so each has its own
  // loading state instead of a single global one.
  const [checkingOutInterval, setCheckingOutInterval] = useState<'month' | 'year' | null>(null);
  const [purchasedGrowth, setPurchasedGrowth] = useState(false);

  const [ownershipToken, setOwnershipToken] = useState<string | null>(null);
  const [cancelledNotice, setCancelledNotice] = useState(false);
  const pollRef = useRef<number | null>(null);

  // ── Resume / return-from-Stripe handling ──────────────────────────────
  useEffect(() => {
    const stepParam = searchParams.get('step');
    const sidParam = searchParams.get('session_id');
    const stripeSid = searchParams.get('stripe_session_id');
    const next = searchParams.get('next');

    if (stepParam === 'success' && (sidParam || stripeSid)) {
      setSessionId(sidParam);
      setStep('finalizing');
      pollForCompletion(sidParam, stripeSid, next === 'growth_upsell' ? 'growth_upsell' : 'success');
      return;
    }
    if ((stepParam === 'claim' || stepParam === 'growth_upsell') && sidParam) {
      setSessionId(sidParam);
      setCancelledNotice(searchParams.get('checkout') === 'cancelled');
      setStep(stepParam);
      return;
    }

    // Arrived via a "Claim this listing" link from a tool page — prefill the
    // URL step instead of resuming any stale stored session, since the
    // visitor explicitly wants to start a fresh claim for this specific URL.
    const urlParam = searchParams.get('url');
    if (urlParam) {
      setRawUrl(urlParam);
      return;
    }

    const stored = getStoredSessionId();
    if (stored) {
      vendorOnboarding.sessionStatus({ sessionId: stored }).then((res) => {
        if (!res.ok) { clearStoredSessionId(); return; }
        if (res.claim_status === 'active' && res.growth_status !== 'active') {
          // Claimed before but never added Growth — send them straight to
          // the upsell instead of the static success screen.
          setSessionId(stored);
          setOwnershipToken(res.ownership_token || null);
          setStep('growth_upsell');
        } else if (res.session_status === 'checkout_completed' || res.session_status === 'verified') {
          setSessionId(stored);
          setOwnershipToken(res.ownership_token || null);
          setPurchasedGrowth(res.growth_status === 'active');
          setStep('success');
        } else {
          clearStoredSessionId();
        }
      }).catch(() => clearStoredSessionId());
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => () => { if (pollRef.current) window.clearInterval(pollRef.current); }, []);

  function pollForCompletion(sid: string | null, stripeSid: string | null, onDone: 'growth_upsell' | 'success') {
    let attempts = 0;
    pollRef.current = window.setInterval(async () => {
      attempts += 1;
      const res = await vendorOnboarding.sessionStatus({ sessionId: sid || undefined, stripeSessionId: stripeSid || undefined });
      const isDone = res.ok && (res.session_status === 'checkout_completed' || res.session_status === 'verified');
      if (isDone || attempts >= 15) {
        if (pollRef.current) window.clearInterval(pollRef.current);
        setOwnershipToken(res.ownership_token || null);
        if (onDone === 'growth_upsell') {
          setStep('growth_upsell');
        } else {
          setPurchasedGrowth(res.growth_status === 'active');
          setStep('success');
          clearStoredSessionId();
        }
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
    setAlreadyClaimed(Boolean(res.already_claimed));

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
    if (!sessionId || !email.trim() || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.submitContact(sessionId, email.trim(), contactName.trim(), true);
    setLoading(false);
    if (!res.ok) {
      setErrorMessage(res.error || 'Please check your email address and try again.');
      return;
    }
    // Already claimed in an earlier visit (paid the one-time fee, never
    // added Growth) — skip straight to the upsell instead of charging again.
    setStep(alreadyClaimed ? 'growth_upsell' : 'claim');
  }

  // ── Step 4: claim -> one-time checkout ──────────────────────────────────
  async function handleClaimCheckout() {
    if (!sessionId || loading) return;
    setLoading(true);
    setErrorMessage(null);
    const res = await vendorOnboarding.createCheckout(sessionId, 'claim');
    if (!res.ok) {
      setLoading(false);
      setErrorMessage(res.error_code === 'already_claimed' ? 'This product has already been claimed.' : (res.error || 'Could not start checkout. Please try again.'));
      return;
    }
    setStep('redirecting');
    window.location.href = res.checkout_url;
  }

  // ── Step 5: growth upsell -> recurring checkout (or skip) ───────────────
  async function handleGrowthCheckout(interval: 'month' | 'year') {
    if (!sessionId || checkingOutInterval) return;
    setCheckingOutInterval(interval);
    setErrorMessage(null);
    const res = await vendorOnboarding.createCheckout(sessionId, 'growth', interval);
    if (!res.ok) {
      setCheckingOutInterval(null);
      setErrorMessage(res.error_code === 'already_subscribed' ? 'This product already has an active Growth subscription.' : (res.error || 'Could not start checkout. Please try again.'));
      return;
    }
    setStep('redirecting');
    window.location.href = res.checkout_url;
  }

  function handleSkipGrowth() {
    setPurchasedGrowth(false);
    setStep('success');
    clearStoredSessionId();
  }

  function goBack() {
    setErrorMessage(null);
    if (step === 'match_existing' || step === 'new_product' || step === 'already_featured') setStep('url');
    else if (step === 'contact') setStep(tool ? 'match_existing' : 'new_product');
    else if (step === 'claim') setStep('contact');
  }

  const stepIndex = STEP_INDEX[step] ?? (step === 'redirecting' ? (purchasedGrowth ? 5 : 4) : 0);
  const showBack = ['match_existing', 'already_featured', 'new_product', 'contact', 'claim'].includes(step);

  return (
    <>
      <EntitySEOTags
        title="Get Featured on Gappsy — Start Your Listing"
        description="Claim your Gappsy software listing for a one-time fee, then optionally upgrade to Growth for featured placement, video reviews, and more."
        path="/feature-my-product/onboarding"
        noindex
      />
      <OnboardingShell step={stepIndex} onBack={showBack ? goBack : undefined}>
        {errorMessage && (
          <div className="max-w-xl w-full mx-auto px-5 sm:px-10 pt-4">
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
              className="w-full h-14 rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
            />
          </StepLayout>
        )}

        {step === 'already_featured' && (
          <StepLayout
            eyebrow="Already featured"
            title={tool ? `${tool.name} already has a Growth subscription` : 'This product is already on Growth'}
            subtitle="To manage an existing subscription, verify ownership first — we don't show billing details to unverified visitors."
            ctaLabel="Contact support to manage this listing"
            onCta={() => { window.location.href = '/contact'; }}
          />
        )}

        {step === 'match_existing' && tool && (
          <StepLayout
            eyebrow="Found your listing"
            title={tool.name}
            subtitle="Your existing Gappsy listing stays exactly as it is — claiming it adds a verified badge and self-serve editing once ownership is verified."
            ctaLabel="Claim this listing"
            onCta={handleConfirmExisting}
          >
            <div className="rounded-2xl border border-[#eef0f3] p-4 flex items-start gap-3">
              <div className="w-12 h-12 rounded-xl bg-slate-100 flex items-center justify-center text-base font-bold text-slate-400 shrink-0">{tool.name.charAt(0)}</div>
              <div className="min-w-0">
                {tool.category && <p className="text-[13px] font-medium text-slate-400">{tool.category}</p>}
                <p className="text-[15px] text-slate-600 leading-relaxed line-clamp-3">{tool.short_description}</p>
              </div>
            </div>
            <button type="button" onClick={() => setStep('url')} className="mt-3 text-[15px] font-medium text-slate-400 hover:text-slate-600 transition-colors">
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
            <div className="space-y-3.5">
              <div>
                <label htmlFor="fmp-name" className="block text-[13px] font-medium text-slate-500 mb-1">Product name</label>
                <input
                  id="fmp-name"
                  type="text"
                  value={prefillName}
                  onChange={(e) => setPrefillName(e.target.value)}
                  className="w-full h-[3.25rem] rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
                />
              </div>
              <div>
                <label htmlFor="fmp-website" className="block text-[13px] font-medium text-slate-500 mb-1">Canonical website</label>
                <input
                  id="fmp-website"
                  type="text"
                  value={prefillWebsite}
                  onChange={(e) => setPrefillWebsite(e.target.value)}
                  className="w-full h-[3.25rem] rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
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
            ctaDisabled={!email.trim()}
          >
            <div className="space-y-3.5">
              <div>
                <label htmlFor="fmp-email" className="block text-[13px] font-medium text-slate-500 mb-1">Business email</label>
                <input
                  id="fmp-email"
                  type="email"
                  autoFocus
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full h-[3.25rem] rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
                />
              </div>
              <div>
                <label htmlFor="fmp-contact-name" className="block text-[13px] font-medium text-slate-500 mb-1">Your name (optional)</label>
                <input
                  id="fmp-contact-name"
                  type="text"
                  value={contactName}
                  onChange={(e) => setContactName(e.target.value)}
                  className="w-full h-[3.25rem] rounded-xl border border-slate-200 px-4 text-base text-[#0B1221] focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
                />
              </div>
            </div>
          </StepLayout>
        )}

        {step === 'claim' && (
          <StepLayout
            eyebrow="Claim & Verify"
            title="One-time $29 fee"
            ctaLabel="Continue to secure checkout"
            onCta={handleClaimCheckout}
            ctaLoading={loading}
            footnote="Billed once via Stripe. No subscription — no card kept on file."
          >
            {cancelledNotice && (
              <div className="mb-3 rounded-xl bg-amber-50 border border-amber-100 px-4 py-2.5 text-[13px] text-amber-700">
                Checkout was cancelled — no charge was made. You can try again below.
              </div>
            )}
            <p className="text-sm text-slate-400 mb-3">Takes about 2 minutes. Here's what you get:</p>
            <ul className="space-y-2.5">
              {[
                ['Verified badge', 'on your listing'],
                ['Self-serve editing', 'of your listing'],
                ['Reply to reviews', 'from your dashboard'],
                ['A link to your site', 'from your Gappsy listing'],
              ].map(([bold, rest]) => (
                <li key={bold} className="flex items-start gap-2 text-[15px] leading-snug text-slate-600">
                  <Check className="w-4 h-4 text-[#4F47E6] shrink-0 mt-0.5" aria-hidden="true" />
                  <span><span className="font-semibold text-[#0B1221]">{bold}</span> {rest}</span>
                </li>
              ))}
            </ul>
          </StepLayout>
        )}

        {step === 'growth_upsell' && (
          <div className="flex-1 w-full max-w-4xl mx-auto px-5 sm:px-8 py-5 sm:py-8">
            <div className="text-center mb-5 sm:mb-7">
              <p className="text-sm font-semibold text-[#4F47E6] mb-1">Upgrade to Growth</p>
              <h1 className="text-2xl sm:text-[32px] font-bold tracking-tight text-[#0B1221] leading-tight lg:whitespace-nowrap">
                Your listing is claimed. Ready to get seen?
              </h1>
              <p className="mt-2 text-[15px] sm:text-base text-slate-500 leading-snug max-w-xl lg:max-w-none mx-auto lg:whitespace-nowrap">
                Growth puts your product in front of buyers who are already comparing tools like yours.
              </p>
            </div>

            {cancelledNotice && (
              <div className="mb-4 rounded-xl bg-amber-50 border border-amber-100 px-4 py-2.5 text-[13px] text-amber-700 text-center">
                Checkout was cancelled — no charge was made. You can try again below.
              </div>
            )}

            <p className="text-center text-[12.5px] text-slate-400 mb-3">
              Everything below is extra
            </p>

            {/* CSS Grid instead of a <table>: every "row" is 3 grid items, so
                Monthly/Yearly naturally share the exact same row height with
                no spacer-div hacks, and the savings annotation + "Best
                value" badge can float above the bordered box as real
                siblings (not table cells) without being clipped by its
                own overflow-hidden corners. */}
            <div className="relative">
              <div className="grid grid-cols-[1fr_92px_112px] sm:grid-cols-[1fr_112px_136px]">
                <div />
                <div />
                <div className="flex flex-col items-center">
                  <p className="flex items-center gap-1 text-[10.5px] font-semibold text-[#4F47E6] whitespace-nowrap">
                    ≈4 months free
                    <CornerRightDown className="w-3 h-3 shrink-0" aria-hidden="true" />
                  </p>
                  <span className="relative z-10 -mb-2.5 mt-1 inline-block bg-[#4F47E6] text-white text-[8.5px] font-semibold uppercase tracking-wide px-2.5 py-1 rounded-full whitespace-nowrap shadow-md">
                    Best value
                  </span>
                </div>
              </div>

              <div className="rounded-2xl border border-slate-200 bg-white overflow-hidden">
                <div className="grid grid-cols-[1fr_92px_112px] sm:grid-cols-[1fr_112px_136px]">
                  <div className="border-b border-slate-100" />
                  <div className="px-2 pt-5 pb-4 text-center border-b border-slate-100">
                    <p className="text-[13px] font-semibold text-slate-500">Monthly</p>
                    <div className="mt-1 flex items-end justify-center gap-0.5">
                      <span className="text-2xl sm:text-[28px] font-bold text-[#0B1221]">$89</span>
                      <span className="text-[11px] text-slate-400 mb-1">/mo</span>
                    </div>
                    <p className="mt-0.5 text-[10.5px] text-slate-400">Cancel anytime</p>
                  </div>
                  <div className="px-2 pt-5 pb-4 text-center bg-[#EEF0FE]/70 border-t-2 border-l-2 border-r-2 border-b border-[#4F47E6]">
                    <p className="text-[13px] font-semibold text-[#4F47E6]">Yearly</p>
                    <div className="mt-1 flex items-end justify-center gap-0.5">
                      <span className="text-2xl sm:text-[28px] font-bold text-[#0B1221]">$699</span>
                      <span className="text-[11px] text-slate-400 mb-1">/yr</span>
                    </div>
                    <p className="mt-0.5 text-[10.5px] text-slate-400">Billed annually</p>
                  </div>

                  {[...GROWTH_MONTHLY_FEATURES.map((item) => ({ item, yearlyOnly: false })), ...GROWTH_YEARLY_ONLY_FEATURES.map((item) => ({ item, yearlyOnly: true }))].map((row, i) => (
                    <div key={row.item} className="contents">
                      <div className={`py-1.5 pl-4 pr-2 flex items-center text-[13px] leading-snug text-slate-600 ${i % 2 === 1 ? 'bg-slate-50/70' : ''}`}>{row.item}</div>
                      <div className={`py-1.5 flex items-center justify-center ${i % 2 === 1 ? 'bg-slate-50/70' : ''}`}>
                        {row.yearlyOnly ? (
                          <Minus className="w-3.5 h-3.5 text-slate-300" aria-hidden="true" />
                        ) : (
                          <Check className="w-4 h-4 text-[#4F47E6]" aria-hidden="true" />
                        )}
                      </div>
                      <div className="py-1.5 flex items-center justify-center bg-[#EEF0FE]/70 border-l-2 border-r-2 border-[#4F47E6]">
                        <Check className="w-4 h-4 text-[#4F47E6]" aria-hidden="true" />
                      </div>
                    </div>
                  ))}

                  <div className="p-3" />
                  <div className="p-2">
                    <button
                      type="button"
                      onClick={() => handleGrowthCheckout('month')}
                      disabled={checkingOutInterval !== null}
                      className="w-full flex items-center justify-center px-2 py-2.5 rounded-lg text-[12.5px] font-semibold text-[#0B1221] bg-slate-100 hover:bg-slate-200 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                    >
                      {checkingOutInterval === 'month' ? <Loader2 className="w-3.5 h-3.5 animate-spin" aria-hidden="true" /> : 'Continue'}
                    </button>
                  </div>
                  <div className="p-2 bg-[#EEF0FE]/70 border-l-2 border-r-2 border-b-2 border-[#4F47E6]">
                    <button
                      type="button"
                      onClick={() => handleGrowthCheckout('year')}
                      disabled={checkingOutInterval !== null}
                      className="w-full flex items-center justify-center px-2 py-2.5 rounded-lg text-[12.5px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 disabled:opacity-40 disabled:cursor-not-allowed transition-opacity active:scale-[0.99]"
                    >
                      {checkingOutInterval === 'year' ? <Loader2 className="w-3.5 h-3.5 animate-spin" aria-hidden="true" /> : 'Get Yearly'}
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <p className="mt-5 text-center text-[13px] text-slate-400">Billed via Stripe. Cancel anytime.</p>

            <button
              type="button"
              onClick={handleSkipGrowth}
              className="mt-4 w-full text-center text-sm font-semibold text-red-500 hover:text-red-600 underline underline-offset-2 decoration-red-200 hover:decoration-red-300 transition-colors"
            >
              No thanks — skip Growth and stay unfeatured for now
            </button>

            <AskGappsyBubble
              page="growth_upsell"
              chatTitle="Ask Gappsy about Growth"
              chatSubtitle="Real answers — ask us anything before you decide"
              placeholder="Ask anything about Growth..."
              triggerLabel="Any questions?"
              nudgeText="Any questions? Not sure this is right for you? Ask here and get answers right away."
              suggestedQuestions={[
                'What do I get with Yearly vs Monthly?',
                'What happens if I cancel later?',
                'Is this worth it for a new listing?',
              ]}
            />
          </div>
        )}

        {step === 'redirecting' && (
          <div className="flex-1 flex flex-col items-center justify-center gap-3 px-6">
            <Loader2 className="w-6 h-6 text-[#4F47E6] animate-spin" aria-hidden="true" />
            <p className="text-sm text-slate-500">Redirecting you to secure checkout…</p>
          </div>
        )}

        {step === 'finalizing' && (
          <div className="flex-1 flex flex-col items-center justify-center gap-3 px-6">
            <Loader2 className="w-6 h-6 text-[#4F47E6] animate-spin" aria-hidden="true" />
            <p className="text-sm text-slate-500">Finalizing…</p>
          </div>
        )}

        {step === 'success' && <SuccessStep ownershipToken={ownershipToken} purchasedGrowth={purchasedGrowth} />}
      </OnboardingShell>
    </>
  );
}

function SuccessStep({ ownershipToken, purchasedGrowth }: { ownershipToken: string | null; purchasedGrowth: boolean }) {
  const [copied, setCopied] = useState(false);
  const verifyUrl = ownershipToken ? `${window.location.origin}/feature-my-product/verify/${ownershipToken}` : null;

  return (
    <div className="flex-1 w-full max-w-md mx-auto px-5 sm:px-6 py-8 flex flex-col">
      <div className="w-12 h-12 rounded-full bg-emerald-50 flex items-center justify-center mb-4">
        <Check className="w-6 h-6 text-emerald-500" aria-hidden="true" />
      </div>
      <h1 className="text-2xl sm:text-[28px] font-bold tracking-tight text-[#0B1221] leading-tight">
        {purchasedGrowth ? 'Your Growth listing is being prepared' : 'Your listing claim is being prepared'}
      </h1>
      <p className="mt-2 text-[15px] text-slate-500 leading-relaxed">Here's what happens next:</p>

      <ol className="mt-5 space-y-3">
        {[
          'Verify ownership of your product',
          'Review or complete your product details',
          'Gappsy prepares or updates your listing',
          purchasedGrowth ? 'Featured placement activates after eligibility checks' : 'Upgrade to Growth anytime from your dashboard',
        ].map((item, i) => (
          <li key={item} className="flex items-start gap-3 text-[14px] text-slate-600">
            <span className="w-5 h-5 rounded-full bg-indigo-50 text-[#4F47E6] text-[11px] font-bold flex items-center justify-center shrink-0 mt-0.5">{i + 1}</span>
            {item}
          </li>
        ))}
      </ol>

      <div className="mt-6 space-y-2.5">
        {verifyUrl && (
          <a
            href={verifyUrl}
            className="flex items-center justify-center gap-1.5 w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity"
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
