import { ShieldCheck, PenSquare, MessagesSquare, Lock, ExternalLink } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const BENEFITS = [
  { icon: ShieldCheck, title: 'Verified badge', body: 'A visible signal on your listing that ownership has been confirmed, not self-reported.' },
  { icon: PenSquare, title: 'Self-serve editing', body: 'Update your description, pricing, screenshots, and more yourself — no waiting on editorial review for every change.' },
  { icon: MessagesSquare, title: 'Reply to reviews', body: 'Respond directly to reviews on your listing from your own dashboard.' },
  { icon: Lock, title: 'Locked-in ownership', body: 'Once listed and verified, only you can manage this listing — nobody else can edit or misrepresent it.' },
  { icon: ExternalLink, title: 'A link to your site', body: 'Your listing links straight through to your own website, so buyers who find you on Gappsy can click through directly.' },
];

export default function BenefitsSection() {
  return (
    <section id="benefits" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">
            What listing your product gets you
          </h2>
          <p className="mt-4 text-lg text-slate-500">
            A one-time fee, ownership confirmed, and control of your own listing.
          </p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-5 gap-5">
          {BENEFITS.map((b, i) => (
            <ScrollReveal key={b.title} delayMs={(i % 5) * 70}>
              <div className="h-full rounded-2xl border border-[#eef0f3] p-5 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)]">
                <b.icon className="w-5 h-5 text-[#4F47E6]" aria-hidden="true" />
                <h3 className="mt-3 text-[15px] font-semibold text-[#0B1221]">{b.title}</h3>
                <p className="mt-1.5 text-[13.5px] leading-relaxed text-slate-500">{b.body}</p>
              </div>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
