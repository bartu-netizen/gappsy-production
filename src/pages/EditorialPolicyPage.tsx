import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import FooterWrapper from '../components/FooterWrapper';

export default function EditorialPolicyPage() {
  useEffect(() => {
    const monthNames = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];

    const now = new Date();
    const shownDate = new Date(now);
    shownDate.setDate(now.getDate() - 2);

    const month = monthNames[shownDate.getMonth()];
    const day = shownDate.getDate();
    const year = shownDate.getFullYear();

    const text = `Last updated: ${month} ${day}, ${year}`;

    const el = document.getElementById("last-updated");
    if (el) el.textContent = text;
  }, []);

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
            Gappsy Editorial Policy
          </h1>

          <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: '14px' }}>
            <span id="last-updated"></span>
          </p>
        </div>
      </div>

      <div style={{ flex: 1, padding: '56px 24px 96px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px', marginTop: '32px' }}>
                Our Mission
              </h2>
              <p style={{ marginBottom: '16px' }}>
                At Gappsy, our editorial team maintains independent, data-driven rankings of the top marketing agencies in every state. Our goal is to help businesses find high-quality, trustworthy marketing partners using transparent criteria and ongoing review.
              </p>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                How Agencies Are Reviewed
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Our evaluations combine multiple data sources and signals to create comprehensive agency assessments:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Publicly available performance data and portfolio reviews</li>
                <li style={{ marginBottom: '8px' }}>Client feedback and reputation signals across multiple platforms</li>
                <li style={{ marginBottom: '8px' }}>Industry expertise and service specialization analysis</li>
                <li style={{ marginBottom: '8px' }}>Business stability, longevity, and track record</li>
                <li style={{ marginBottom: '8px' }}>Service quality indicators and case study verification</li>
              </ul>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Ranking Methodology
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Each state's Top 25 list represents our editorial team's assessment of the highest-performing marketing agencies in that region. Rankings are based on:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Service Quality:</strong> Demonstrated excellence in delivering marketing results</li>
                <li style={{ marginBottom: '8px' }}><strong>Client Satisfaction:</strong> Positive feedback, testimonials, and retention rates</li>
                <li style={{ marginBottom: '8px' }}><strong>Industry Recognition:</strong> Awards, certifications, and professional standing</li>
                <li style={{ marginBottom: '8px' }}><strong>Specialization:</strong> Depth of expertise in specific marketing disciplines</li>
                <li style={{ marginBottom: '8px' }}><strong>Business Fundamentals:</strong> Stability, transparency, and professional operations</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                Rankings are reviewed regularly to ensure accuracy and relevance as agencies evolve and new information becomes available.
              </p>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Spotlight Placements
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Gappsy offers paid Spotlight Placements that allow qualifying agencies to gain additional visibility on our platform. These placements are:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Clearly marked as sponsored content</li>
                <li style={{ marginBottom: '8px' }}>Separate from editorial Top 25 rankings</li>
                <li style={{ marginBottom: '8px' }}>Available to agencies that meet our quality standards</li>
                <li style={{ marginBottom: '8px' }}>Subject to editorial review before publication</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                <strong>Important:</strong> Paid Spotlight Placements do not influence editorial rankings. Our Top 25 lists are maintained independently based solely on merit and performance criteria.
              </p>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Independence & Transparency
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Gappsy maintains a clear separation between our editorial rankings and commercial relationships:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Editorial decisions are made independently by our review team</li>
                <li style={{ marginBottom: '8px' }}>Rankings cannot be purchased or influenced through payment</li>
                <li style={{ marginBottom: '8px' }}>We clearly distinguish between editorial content and sponsored placements</li>
                <li style={{ marginBottom: '8px' }}>Our methodology is transparent and applied consistently</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                We believe businesses deserve accurate, unbiased information when selecting a marketing partner. Our commitment is to maintain the integrity of our rankings while offering agencies legitimate opportunities to showcase their expertise through clearly marked promotional options.
              </p>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Updates & Corrections
              </h2>
              <p style={{ marginBottom: '16px' }}>
                If you believe information on Gappsy is inaccurate or outdated, please contact our editorial team. We review all submissions and make corrections when warranted by evidence.
              </p>
              <p style={{ marginBottom: '16px' }}>
                Agencies interested in Spotlight Placements can submit their information through our platform. All submissions are reviewed for quality and accuracy before publication.
              </p>
            </section>

            <section style={{ marginBottom: '48px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Contact Editorial Team
              </h2>
              <p style={{ marginBottom: '16px' }}>
                For questions about our editorial policy, ranking methodology, or to submit corrections, please contact us at <a href="mailto:support@gappsy.com" style={{ color: '#0A1735', textDecoration: 'none' }}>support@gappsy.com</a>.
              </p>
            </section>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
