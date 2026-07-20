import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import FooterWrapper from '../components/FooterWrapper';

export default function TermsPage() {
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
            Terms of Service
          </h1>

          <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: '14px' }}>
            <span id="last-updated"></span>
          </p>
        </div>
      </div>

      <div style={{ flex: 1, padding: '56px 24px 96px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                1. Acceptance of Terms
              </h2>
              <p style={{ marginBottom: '16px' }}>
                By accessing or using Gappsy, you agree to be bound by these Terms of Service and our Privacy Policy. If you do not agree to these terms, please do not use our service.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                2. Use of the Service
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Gappsy provides a platform for businesses to discover and connect with marketing agencies. You may use our service for lawful purposes only. You agree not to:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Submit false, misleading, or inaccurate information</li>
                <li style={{ marginBottom: '8px' }}>Interfere with or disrupt the service or servers</li>
                <li style={{ marginBottom: '8px' }}>Attempt to gain unauthorized access to any portion of the service</li>
                <li style={{ marginBottom: '8px' }}>Use automated systems to access the service without permission</li>
                <li style={{ marginBottom: '8px' }}>Violate any applicable laws or regulations</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                3. Agency Listing Rules
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Agencies may submit their information for consideration in our rankings. By submitting information, you represent that:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>All information provided is accurate and truthful</li>
                <li style={{ marginBottom: '8px' }}>You have the authority to represent the agency</li>
                <li style={{ marginBottom: '8px' }}>Your agency is a legitimate, operating business</li>
                <li style={{ marginBottom: '8px' }}>You will update information if it becomes outdated</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                Gappsy reserves the right to verify submitted information and remove listings that do not meet our quality standards or contain inaccurate information.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                4. Spotlight Placement Rules
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Paid Spotlight Placements are subject to the following terms:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Placements are sold for a specified term (monthly, quarterly, or annually)</li>
                <li style={{ marginBottom: '8px' }}>Payment is required before activation</li>
                <li style={{ marginBottom: '8px' }}>Content must be approved by our editorial team before publication</li>
                <li style={{ marginBottom: '8px' }}>We reserve the right to reject placements that do not meet quality standards</li>
                <li style={{ marginBottom: '8px' }}>Placements are clearly marked as sponsored content</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                5. Payment & Renewals
              </h2>
              <p style={{ marginBottom: '16px' }}>
                For paid Spotlight Placements:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Payment is processed securely through our payment provider</li>
                <li style={{ marginBottom: '8px' }}>Placements are not automatically renewed unless explicitly agreed</li>
                <li style={{ marginBottom: '8px' }}>Pricing is subject to change with 30 days notice</li>
                <li style={{ marginBottom: '8px' }}>Refunds are handled according to our Refund Policy</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                6. Intellectual Property
              </h2>
              <p style={{ marginBottom: '16px' }}>
                All content on Gappsy, including rankings, text, graphics, logos, and software, is the property of Gappsy or its content suppliers and is protected by intellectual property laws. You may not reproduce, distribute, or create derivative works without explicit permission.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                7. Disclaimers
              </h2>
              <p style={{ marginBottom: '16px' }}>
                THE SERVICE IS PROVIDED "AS IS" WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED. GAPPSY DOES NOT WARRANT THAT:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>The service will be uninterrupted or error-free</li>
                <li style={{ marginBottom: '8px' }}>Any particular agency will meet your specific needs</li>
                <li style={{ marginBottom: '8px' }}>Rankings are exhaustive or include every qualified agency</li>
                <li style={{ marginBottom: '8px' }}>Information provided by agencies is accurate or complete</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                We encourage users to conduct their own due diligence when selecting a marketing partner.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                8. Limitation of Liability
              </h2>
              <p style={{ marginBottom: '16px' }}>
                TO THE MAXIMUM EXTENT PERMITTED BY LAW, GAPPSY SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFITS, LOST DATA, OR BUSINESS INTERRUPTION.
              </p>
              <p style={{ marginBottom: '16px' }}>
                Our total liability for any claims arising from your use of the service shall not exceed the amount you paid us in the twelve months preceding the claim.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                9. Indemnification
              </h2>
              <p style={{ marginBottom: '16px' }}>
                You agree to indemnify and hold Gappsy harmless from any claims, damages, losses, or expenses (including legal fees) arising from your use of the service, your violation of these terms, or your infringement of any third-party rights.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                10. Governing Law
              </h2>
              <p style={{ marginBottom: '16px' }}>
                These Terms shall be governed by and construed in accordance with the laws of the State of Delaware, United States, without regard to its conflict of law provisions.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                11. Changes to Terms
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We reserve the right to modify these Terms at any time. We will notify users of material changes by updating the "Last updated" date. Continued use of the service after changes constitutes acceptance of the new Terms.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                12. Contact
              </h2>
              <p style={{ marginBottom: '16px' }}>
                For questions about these Terms, please contact us at <a href="mailto:support@gappsy.com" style={{ color: '#0A1735', textDecoration: 'none' }}>support@gappsy.com</a>.
              </p>
            </section>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
