import { useState } from 'react';
import { ChevronDown } from 'lucide-react';
import type { ToolFAQ } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

// Generic accordion — same aria-expanded toggle pattern used elsewhere on the
// site (e.g. NewJerseyFAQ.tsx) but decoupled from state-page data.
export default function FAQSection({ toolName, faqs }: { toolName: string; faqs: ToolFAQ[] }) {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  if (faqs.length === 0) return null;

  return (
    <section id="faq" className="scroll-mt-24">
      <ToolsSectionHeader
        eyebrow="FAQ"
        title={`${toolName} frequently asked questions`}
        subtitle={`Answers to the ${faqs.length} most common question${faqs.length === 1 ? '' : 's'} about ${toolName}.`}
      />
      <Card className="divide-y divide-slate-100">
        {faqs.map((faq, index) => {
          const isOpen = openIndex === index;
          return (
            <div key={faq.question}>
              <button
                type="button"
                onClick={() => setOpenIndex(isOpen ? null : index)}
                aria-expanded={isOpen}
                aria-controls={`faq-answer-${index}`}
                className="w-full flex items-center justify-between gap-3 text-left px-5 py-4 hover:bg-slate-50 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-blue-500"
              >
                <span className="font-medium text-[#0B1221] text-[15px]">{faq.question}</span>
                <ChevronDown className={`w-4 h-4 text-slate-400 shrink-0 transition-transform ${isOpen ? 'rotate-180' : ''}`} />
              </button>
              {isOpen && (
                <div id={`faq-answer-${index}`} className="px-5 pb-4 -mt-1">
                  <p className="text-[14.5px] text-slate-600 leading-relaxed">{faq.answer}</p>
                </div>
              )}
            </div>
          );
        })}
      </Card>
    </section>
  );
}
