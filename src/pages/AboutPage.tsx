import React from 'react';
import FooterWrapper from '../components/FooterWrapper';

export default function AboutPage() {
  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', backgroundColor: '#ffffff' }}>
      <div style={{ flex: 1, padding: '96px 24px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <img
            src="/logos/Gappsy Logo 4A5DFF transparent background.png"
            alt="Gappsy"
            style={{ height: '32px', width: 'auto', marginBottom: '40px' }}
          />

          <h1 style={{ fontSize: '40px', fontWeight: 700, color: '#0F172A', marginBottom: '24px', lineHeight: 1.2 }}>
            About Gappsy
          </h1>

          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <p style={{ marginBottom: '24px' }}>
              Gappsy is a comprehensive directory platform connecting businesses with top-performing marketing agencies across the United States.
            </p>

            <p style={{ marginBottom: '24px' }}>
              Our mission is to help companies find reliable, high-performing marketing partners through curated rankings and data-driven evaluations.
            </p>

            <p style={{ marginBottom: '24px' }}>
              More information coming soon.
            </p>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
