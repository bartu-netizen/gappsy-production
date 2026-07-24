import { useState } from 'react';
import { ChevronDown } from 'lucide-react';
import ScrollReveal from './ScrollReveal';
import { FMP_FAQS, type FmpFaqItem } from './fmpFaqData';

interface FmpFaqSectionProps {
  /** Defaults to the $29 listing page's FAQs; pass a different array to
   * reuse this same accordion UI for another page's FAQ content (e.g. the
   * Featured explainer page) without duplicating the component. */
  faqs?: FmpFaqItem[];
}

export default function FmpFaqSection({ faqs = FMP_FAQS }: FmpFaqSectionProps) {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  return (
    <section id="faq" className="py-20 sm:py-28 bg-slate-50/40 border-y border-[#f1f3f5] scroll-mt-24">
      <div className="max-w-3xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="text-center mb-12">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">Frequently asked questions</h2>
        </ScrollReveal>

        <div className="space-y-3">
          {faqs.map((faq, i) => {
            const isOpen = openIndex === i;
            return (
              <ScrollReveal key={faq.question} delayMs={Math.min(i, 6) * 40}>
                <div className="rounded-2xl border border-[#eef0f3] bg-white overflow-hidden">
                  <button
                    type="button"
                    onClick={() => setOpenIndex(isOpen ? null : i)}
                    aria-expanded={isOpen}
                    aria-controls={`fmp-faq-panel-${i}`}
                    className="flex items-center justify-between w-full text-left px-5 py-4 gap-4"
                  >
                    <span className="text-[15px] font-semibold text-[#0B1221]">{faq.question}</span>
                    <ChevronDown
                      className={`w-4 h-4 text-slate-400 shrink-0 transition-transform duration-200 ${isOpen ? 'rotate-180' : ''}`}
                      aria-hidden="true"
                    />
                  </button>
                  {isOpen && (
                    <div id={`fmp-faq-panel-${i}`} className="px-5 pb-4 text-[15px] leading-relaxed text-slate-500">
                      {faq.answer}
                    </div>
                  )}
                </div>
              </ScrollReveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
