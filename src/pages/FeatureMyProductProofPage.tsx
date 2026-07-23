import { useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { ArrowRight, Maximize2, X, Rocket, Users, ThumbsUp, Search } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';

const WHY_POINTS = [
  { icon: Rocket, text: 'Started in 2019 as a mobile app-builder for businesses' },
  { icon: ThumbsUp, text: 'They trust our recommendations and love trying new tools' },
  { icon: Search, text: 'Found through Google, ChatGPT, YouTube, TikTok, and Instagram' },
];

// Real, unedited numbers pulled from a handful of representative email
// broadcasts to our existing paid user base — campaign names and dates
// deliberately left out, just the performance columns.
const EMAIL_PROOF_ROWS = [
  { contacts: '11,064', sent: '11,035', openRate: '35.42%', clickRate: '2.24%', revenue: '$107.87' },
  { contacts: '10,599', sent: '10,582', openRate: '46.63%', clickRate: '2.42%', revenue: '$861' },
  { contacts: '10,536', sent: '10,520', openRate: '40.48%', clickRate: '1.60%', revenue: '$758.80' },
  { contacts: '10,119', sent: '10,110', openRate: '37.21%', clickRate: '0.68%', revenue: '$2,296.35' },
  { contacts: '10,059', sent: '10,049', openRate: '38.10%', clickRate: '0.89%', revenue: '$1,228.56' },
  { contacts: '9,994', sent: '9,986', openRate: '39.11%', clickRate: '0.92%', revenue: '$1,221.00' },
];

const REVENUE_STATS = [
  { value: '$1.49M', label: 'gross revenue' },
  { value: '16,516', label: 'transactions' },
  { value: '8,583', label: 'customers' },
];

const EMAIL_STATS = [
  { value: '46.6%', label: 'best open rate' },
  { value: '$2,296', label: 'from one send' },
];

// Step in the /list-your-product sequence (after typing a URL, before the
// real matching step) explaining why listing matters — same app-shell and
// same strict no-scroll rule as the rest of this funnel. Mobile/tablet get
// compact real-number stat chips instead of the actual screenshot/table
// (neither renders legibly at a size that still fits one screen); lg+ gets
// the real screenshot (click to enlarge) and table since there's room.
// Also reachable directly without a url param (e.g. the onboarding claim
// step's "See proof" link) — the CTA falls back to a plain
// /list-your-product start in that case instead of erroring.
export default function FeatureMyProductProofPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const url = searchParams.get('url');
  const [lightbox, setLightbox] = useState(false);

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
              <h1 className="mt-2.5 text-xl sm:text-2xl lg:text-3xl font-bold tracking-tight text-[#0B1221] leading-[1.15]">
                Why list on Gappsy?
              </h1>
              <ul className="mt-3 sm:mt-4 space-y-1.5 sm:space-y-2">
                {WHY_POINTS.map((p) => (
                  <li key={p.text} className="flex items-center gap-2.5 text-[13.5px] sm:text-[15px] text-slate-600">
                    <p.icon className="w-4 h-4 text-[#4F47E6] shrink-0" aria-hidden="true" />
                    <span>{p.text}</span>
                  </li>
                ))}
              </ul>
            </div>

            {/* Right: the proof, stacked */}
            <div className="space-y-4 sm:space-y-5">
              <section>
                <h2 className="text-[11px] font-semibold uppercase tracking-wide text-slate-400">Real revenue, screenshot from ThriveCart</h2>

                {/* lg+: real screenshot, click to enlarge. Below lg: compact stat chips (the screenshot doesn't render legibly at a size that still fits one screen). */}
                <button
                  type="button"
                  onClick={() => setLightbox(true)}
                  className="group hidden lg:block relative mt-2 w-full rounded-2xl border border-[#eef0f3] overflow-hidden shadow-[0_12px_28px_rgba(15,23,42,0.06)] cursor-zoom-in"
                >
                  <img
                    src="/images/gappsy-proof/thrivecart-revenue-proof.webp"
                    alt="ThriveCart dashboard showing $1,488,072.90 gross revenue, 16,516 total transactions, and 8,583 total customers"
                    className="w-full h-auto block"
                    loading="lazy"
                  />
                  <div className="absolute inset-0 bg-[#0A1735]/0 group-hover:bg-[#0A1735]/10 transition-colors flex items-center justify-center">
                    <span className="opacity-0 group-hover:opacity-100 transition-opacity inline-flex items-center gap-1.5 bg-white/95 rounded-full px-3.5 py-2 text-[13px] font-semibold text-[#0B1221] shadow-lg">
                      <Maximize2 className="w-3.5 h-3.5" aria-hidden="true" />
                      Click to enlarge
                    </span>
                  </div>
                </button>

                <div className="lg:hidden mt-2.5 flex flex-wrap items-center gap-x-5 gap-y-2">
                  {REVENUE_STATS.map((s) => (
                    <div key={s.label}>
                      <span className="text-lg font-bold text-[#0B1221]">{s.value}</span>{' '}
                      <span className="text-[12.5px] text-slate-400">{s.label}</span>
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

      {lightbox && (
        <div className="fixed inset-0 z-[70] flex items-center justify-center p-4 sm:p-8">
          <div className="absolute inset-0 bg-[#05070F]/85 backdrop-blur-sm" onClick={() => setLightbox(false)} aria-hidden="true" />
          <button
            type="button"
            onClick={() => setLightbox(false)}
            aria-label="Close"
            className="absolute top-5 right-5 w-10 h-10 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white transition-colors z-10"
          >
            <X className="w-5 h-5" aria-hidden="true" />
          </button>
          <img
            src="/images/gappsy-proof/thrivecart-revenue-proof.webp"
            alt="ThriveCart dashboard showing $1,488,072.90 gross revenue, 16,516 total transactions, and 8,583 total customers"
            className="relative max-w-full max-h-full w-auto h-auto rounded-2xl shadow-2xl"
          />
        </div>
      )}

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
