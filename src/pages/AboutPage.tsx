import { Link } from 'react-router-dom';
import { Compass, ListChecks, ShieldCheck } from 'lucide-react';
import FooterWrapper from '../components/FooterWrapper';

const PILLARS = [
  {
    icon: Compass,
    title: 'A single starting point',
    body: "Whether you're evaluating software or looking for a marketing partner, Gappsy is the one place to compare your options side by side instead of digging through a dozen review sites.",
  },
  {
    icon: ListChecks,
    title: 'Curated, not crowdsourced',
    body: 'Every tool profile and every Top 25 agency ranking is built from real pricing, features, and reviews — not open, unmoderated submissions anyone can game.',
  },
  {
    icon: ShieldCheck,
    title: 'Built for trust',
    body: "Agencies can't buy their way to the top of a ranking. Paid placements exist and are always clearly labeled as sponsored, so the rankings stay honest.",
  },
];

export default function AboutPage() {
  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', backgroundColor: '#ffffff' }}>
      <div style={{ backgroundColor: '#0A1735', padding: '48px 24px 56px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <Link to="/" aria-label="Gappsy home" style={{ display: 'inline-flex', alignItems: 'center' }}>
            <img
              src="/logos/Gappsy-logo-white.webp"
              alt="Gappsy"
              style={{ height: '32px', width: 'auto', marginBottom: '32px' }}
            />
          </Link>

          <h1 style={{ fontSize: '40px', fontWeight: 700, color: '#ffffff', marginBottom: '12px', lineHeight: 1.2 }}>
            About Gappsy
          </h1>

          <p style={{ color: 'rgba(255,255,255,0.6)', fontSize: '16px', lineHeight: 1.6, maxWidth: '560px' }}>
            A directory built to help businesses find the right software tools and the right marketing agency — without the guesswork.
          </p>
        </div>
      </div>

      <div style={{ flex: 1, padding: '56px 24px 96px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <section style={{ marginBottom: '40px' }}>
              <p style={{ marginBottom: '16px' }}>
                Gappsy is a directory platform with two sides: a growing catalog of software tools for running and growing a business, and Top 25 rankings of marketing agencies in every U.S. state. Both exist for the same reason — helping business owners make a confident decision faster than they could on their own.
              </p>
              <p>
                Our mission is simple: help companies find reliable software and high-performing marketing partners through curated listings and data-driven evaluations, instead of scattered reviews and guesswork.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '22px', fontWeight: 700, color: '#0F172A', marginBottom: '20px' }}>
                What we stand for
              </h2>
              <div style={{ display: 'grid', gap: '20px' }}>
                {PILLARS.map((pillar) => {
                  const Icon = pillar.icon;
                  return (
                    <div key={pillar.title} style={{ display: 'flex', gap: '16px', alignItems: 'flex-start' }}>
                      <div style={{ width: '40px', height: '40px', borderRadius: '12px', backgroundColor: '#EEF0FE', display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>
                        <Icon size={18} color="#0A1735" aria-hidden="true" />
                      </div>
                      <div>
                        <p style={{ fontWeight: 700, color: '#0F172A', marginBottom: '4px', fontSize: '16px' }}>{pillar.title}</p>
                        <p style={{ margin: 0 }}>{pillar.body}</p>
                      </div>
                    </div>
                  );
                })}
              </div>
            </section>

            <section style={{ marginBottom: '8px' }}>
              <h2 style={{ fontSize: '22px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Get in touch
              </h2>
              <p>
                Have a question, a correction, or a business you think belongs on Gappsy?{' '}
                <Link to="/contact" style={{ color: '#0A1735', fontWeight: 600, textDecoration: 'none' }}>Contact us</Link> — we read every message.
              </p>
            </section>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
