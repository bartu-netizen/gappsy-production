import { useNavigate, useSearchParams } from 'react-router-dom';
import { ArrowRight, Rocket, Smartphone, Users, ThumbsUp } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';

const WHY_POINTS = [
  { icon: Rocket, text: 'Gappsy launched in 2019' },
  { icon: Smartphone, text: 'Started as an Appbuilder Software' },
  { icon: Users, text: '10,000+ paid users, and counting' },
  { icon: ThumbsUp, text: 'They trust our recommendations' },
];

// Real brand marks — Stripe and PayPal via their official simple-icons SVG
// paths (CC0), ThriveCart cropped directly from their own dashboard header
// in the same source screenshots used elsewhere on this page (simple-icons
// has no ThriveCart entry).
function StripeMark() {
  return (
    <svg viewBox="0 0 24 24" className="w-4 h-4" role="img" aria-label="Stripe">
      <path fill="#635BFF" d="M13.976 9.15c-2.172-.806-3.356-1.426-3.356-2.409 0-.831.683-1.305 1.901-1.305 2.227 0 4.515.858 6.09 1.631l.89-5.494C18.252.975 15.697 0 12.165 0 9.667 0 7.589.654 6.104 1.872 4.56 3.147 3.757 4.992 3.757 7.218c0 4.039 2.467 5.76 6.476 7.219 2.585.92 3.445 1.574 3.445 2.583 0 .98-.84 1.545-2.354 1.545-1.875 0-4.965-.921-6.99-2.109l-.9 5.555C5.175 22.99 8.385 24 11.714 24c2.641 0 4.843-.624 6.328-1.813 1.664-1.305 2.525-3.236 2.525-5.732 0-4.128-2.524-5.851-6.594-7.305h.003z" />
    </svg>
  );
}
function PayPalMark() {
  return (
    <svg viewBox="0 0 24 24" className="w-4 h-4" role="img" aria-label="PayPal">
      <path fill="#003087" d="M15.607 4.653H8.941L6.645 19.251H1.82L4.862 0h7.995c3.754 0 6.375 2.294 6.473 5.513-.648-.478-2.105-.86-3.722-.86m6.57 5.546c0 3.41-3.01 6.853-6.958 6.853h-2.493L11.595 24H6.74l1.845-11.538h3.592c4.208 0 7.346-3.634 7.153-6.949a5.24 5.24 0 0 1 2.848 4.686M9.653 5.546h6.408c.907 0 1.942.222 2.363.541-.195 2.741-2.655 5.483-6.441 5.483H8.714Z" />
    </svg>
  );
}
const REVENUE_SOURCE_MARKS = [
  { name: 'Stripe', Mark: StripeMark },
  { name: 'PayPal', Mark: PayPalMark },
];

// Real numbers from our own Stripe/ThriveCart/PayPal dashboards — shown as
// styled stat cards rather than a raw screenshot crop, since "Total
// customers" here is a more current count (10,528) than any single
// dashboard's snapshot.
const REVENUE_STATS = [
  { value: '$1,488,072.90', label: 'Gross revenue' },
  { value: '2019', label: 'Since' },
  { value: '16,516', label: 'Total transactions' },
  { value: '10,528', label: 'Total customers' },
];

// Real, unedited numbers pulled from a handful of representative email
// broadcasts to our existing paid user base — campaign names and dates
// deliberately left out, just the performance columns.
const EMAIL_PROOF_ROWS = [
  { contacts: '11,064', sent: '11,035', openRate: '35.42%', clickRate: '2.24%', revenue: '$107.87' },
  { contacts: '10,599', sent: '10,582', openRate: '46.63%', clickRate: '2.42%', revenue: '$861' },
  { contacts: '10,119', sent: '10,110', openRate: '37.21%', clickRate: '0.68%', revenue: '$2,296.35' },
  { contacts: '10,059', sent: '10,049', openRate: '38.10%', clickRate: '0.89%', revenue: '$1,228.56' },
  { contacts: '9,994', sent: '9,986', openRate: '39.11%', clickRate: '0.92%', revenue: '$1,221.00' },
];

const EMAIL_STATS = [
  { value: '46.6%', label: 'best open rate' },
  { value: '$2,296', label: 'from one send' },
];

// Step in the /list-your-product sequence (after typing a URL, before the
// real matching step) explaining why listing matters — same app-shell and
// same strict no-scroll rule as the rest of this funnel. Revenue is shown
// as styled stat cards (not a screenshot — see REVENUE_STATS above); email
// performance gets compact stat chips below lg and the real table at lg+,
// since the table doesn't render legibly at a size that still fits one
// screen on smaller viewports.
// Also reachable directly without a url param (e.g. the onboarding claim
// step's "See proof" link) — the CTA falls back to a plain
// /list-your-product start in that case instead of erroring.
export default function FeatureMyProductProofPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const url = searchParams.get('url');

  function handleContinue() {
    if (url) {
      navigate(`/list-your-product/onboarding?url=${encodeURIComponent(url)}&autostart=1`);
    } else {
      navigate('/list-your-product');
    }
  }

  return (
    <div className="h-[100dvh] w-full flex flex-col overflow-hidden bg-white">
      <EntitySEOTags
        title="Why List on Gappsy | Gappsy"
        description="Real proof that 10,000+ paid business owners already use and trust Gappsy — revenue, email performance, and account numbers."
        path="/list-your-product/proof"
        noindex
      />

      <header className="shrink-0 flex items-center justify-center px-5 sm:px-8 h-14 sm:h-16 bg-[#0A1735] shadow-lg">
        {/* Not a link to "/" on purpose — we don't want an easy way out of this funnel. */}
        <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-7 sm:h-8 w-auto" />
      </header>

      <main className="flex-1 min-h-0 overflow-hidden flex flex-col justify-center">
        <div className="max-w-5xl mx-auto w-full px-6 sm:px-10 py-3 sm:py-6">
          <div className="grid lg:grid-cols-[1fr_1.1fr] gap-6 lg:gap-12 items-center">
            {/* Left: why list on Gappsy */}
            <div>
              <span className="inline-flex items-center gap-1.5 text-[13px] font-semibold text-[#4F47E6] bg-[#EEF0FE] rounded-full px-3 py-1.5">
                <Users className="w-3.5 h-3.5" aria-hidden="true" />
                10,000+ paid users
              </span>
              <h1 className="mt-2.5 text-xl sm:text-2xl lg:text-3xl font-bold tracking-tight text-[#0B1221] leading-[1.15] whitespace-nowrap">
                Why list on Gappsy?
              </h1>
              <ul className="mt-3.5 sm:mt-5 space-y-2 sm:space-y-2.5">
                {WHY_POINTS.map((p) => (
                  <li key={p.text} className="flex items-center gap-2.5 whitespace-nowrap">
                    <span className="w-7 h-7 sm:w-8 sm:h-8 shrink-0 rounded-lg bg-[#EEF0FE] flex items-center justify-center">
                      <p.icon className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-[#4F47E6]" aria-hidden="true" />
                    </span>
                    <span className="text-[14px] sm:text-base font-semibold text-[#0B1221]">{p.text}</span>
                  </li>
                ))}
              </ul>
              <p className="mt-3.5 sm:mt-5 text-[13.5px] sm:text-[15px] text-slate-500 leading-relaxed">
                These users love trying new tools — <span className="font-semibold text-[#0B1221]">your perfect audience.</span>
              </p>
            </div>

            {/* Right: the proof, stacked */}
            <div className="space-y-4 sm:space-y-5">
              <section>
                <div className="flex items-center gap-2">
                  <h2 className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">Real revenue</h2>
                  <div className="flex items-center gap-2.5">
                    {REVENUE_SOURCE_MARKS.map(({ name, Mark }) => (
                      <span key={name} className="inline-flex items-center gap-1">
                        <Mark />
                        <span className="text-[10.5px] font-semibold text-slate-500">{name}</span>
                      </span>
                    ))}
                    <img src="/images/gappsy-proof/thrivecart-logo.webp" alt="ThriveCart" className="h-3 w-auto rounded-sm" />
                  </div>
                </div>
                <div className="mt-2 rounded-2xl border border-[#eef0f3] bg-white shadow-[0_12px_28px_rgba(15,23,42,0.06)] px-4 py-3 sm:px-5 sm:py-4 grid grid-cols-2 gap-x-4 gap-y-2.5 sm:gap-y-3">
                  {REVENUE_STATS.map((s) => (
                    <div key={s.label}>
                      <p className="text-lg sm:text-xl font-bold text-[#0B1221] leading-tight">{s.value}</p>
                      <p className="text-[11.5px] sm:text-[12.5px] text-slate-400">{s.label}</p>
                    </div>
                  ))}
                </div>
              </section>

              <section>
                <h2 className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">Gappsy email performance</h2>

                <div className="hidden lg:block mt-2 rounded-2xl border border-[#eef0f3] overflow-hidden shadow-[0_12px_28px_rgba(15,23,42,0.06)]">
                  <table className="w-full text-[13px]">
                    <thead>
                      <tr className="bg-slate-50 text-slate-400">
                        <th className="text-left font-semibold px-3 py-1.5">Contacts</th>
                        <th className="text-left font-semibold px-3 py-1.5">Sent</th>
                        <th className="text-left font-semibold px-3 py-1.5">Open</th>
                        <th className="text-left font-semibold px-3 py-1.5">Click</th>
                        <th className="text-left font-semibold px-3 py-1.5">Revenue</th>
                      </tr>
                    </thead>
                    <tbody>
                      {EMAIL_PROOF_ROWS.map((row, i) => (
                        <tr key={i} className={i % 2 === 1 ? 'bg-slate-50/60' : ''}>
                          <td className="px-3 py-1.5 text-[#0B1221]">{row.contacts}</td>
                          <td className="px-3 py-1.5 text-[#0B1221]">{row.sent}</td>
                          <td className="px-3 py-1.5 text-[#0B1221] font-medium">{row.openRate}</td>
                          <td className="px-3 py-1.5 text-slate-500">{row.clickRate}</td>
                          <td className="px-3 py-1.5 text-[#0B1221] font-medium">{row.revenue}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>

                <div className="lg:hidden mt-2.5 flex flex-wrap items-center gap-x-5 gap-y-2">
                  {EMAIL_STATS.map((s) => (
                    <div key={s.label}>
                      <span className="text-lg font-bold text-[#0B1221]">{s.value}</span>{' '}
                      <span className="text-[12.5px] text-slate-400">{s.label}</span>
                    </div>
                  ))}
                </div>
              </section>
            </div>
          </div>
        </div>
      </main>

      <div className="sticky bottom-0 shrink-0 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-5 sm:px-10 py-4 pb-[calc(1rem+env(safe-area-inset-bottom))] flex justify-center">
        <button
          type="button"
          onClick={handleContinue}
          className="w-full sm:w-auto sm:min-w-[320px] flex items-center justify-center gap-1.5 px-8 py-4 rounded-xl text-base font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
        >
          Continue
          <ArrowRight className="w-4 h-4" aria-hidden="true" />
        </button>
      </div>
    </div>
  );
}
