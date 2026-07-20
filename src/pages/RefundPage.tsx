import React, { useEffect } from 'react';
import FooterWrapper from '../components/FooterWrapper';

export default function RefundPage() {
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
      <div style={{ flex: 1, padding: '96px 24px' }}>
        <div style={{ maxWidth: '800px', margin: '0 auto' }}>
          <img
            src="/logos/Gappsy Logo 4A5DFF transparent background.png"
            alt="Gappsy"
            style={{ height: '32px', width: 'auto', marginBottom: '40px' }}
          />

          <h1 style={{ fontSize: '40px', fontWeight: 700, color: '#0F172A', marginBottom: '16px', lineHeight: 1.2 }}>
            Refund Policy
          </h1>

          <p style={{ color: '#64748B', fontSize: '15px', marginBottom: '40px' }}>
            <span id="last-updated"></span>
          </p>

          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <section style={{ marginBottom: '40px' }}>
              <p style={{ marginBottom: '16px' }}>
                At Gappsy, we strive to provide valuable services to marketing agencies seeking visibility on our platform. This Refund Policy explains our approach to refunds for Spotlight Placement purchases.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Spotlight Placement Purchases
              </h2>
              <p style={{ marginBottom: '16px', padding: '20px', backgroundColor: '#FEF3C7', border: '1px solid #FCD34D', borderRadius: '8px' }}>
                <strong>Important:</strong> Spotlight Placement purchases are non-refundable once a listing is created and published, due to editorial review time, labor, and promotional exposure already provided.
              </p>
              <p style={{ marginBottom: '16px', marginTop: '20px' }}>
                When you purchase a Spotlight Placement, our team immediately begins work on your listing:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Editorial review of submitted content and materials</li>
                <li style={{ marginBottom: '8px' }}>Verification of agency information and credentials</li>
                <li style={{ marginBottom: '8px' }}>Optimization of listing content for maximum visibility</li>
                <li style={{ marginBottom: '8px' }}>Publication and promotion on the Gappsy platform</li>
                <li style={{ marginBottom: '8px' }}>Ongoing maintenance during the placement period</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                Because this work begins immediately and resources are committed to your placement, we cannot offer refunds once the listing is live.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Exceptions & Special Circumstances
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We will issue a full correction or refund in the following situations:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Technical Errors:</strong> If a technical issue on our end prevents your listing from being published as agreed</li>
                <li style={{ marginBottom: '8px' }}><strong>Duplicate Payments:</strong> If you were accidentally charged multiple times for the same placement</li>
                <li style={{ marginBottom: '8px' }}><strong>Service Not Delivered:</strong> If we are unable to fulfill the placement as described</li>
                <li style={{ marginBottom: '8px' }}><strong>Pre-Publication Cancellation:</strong> If you request cancellation before your listing is reviewed and published (subject to a processing fee)</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Quality Guarantee
              </h2>
              <p style={{ marginBottom: '16px' }}>
                While we cannot offer refunds for published placements, we stand behind the quality of our service:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Your listing will be displayed prominently as agreed</li>
                <li style={{ marginBottom: '8px' }}>We will work with you to optimize content before publication</li>
                <li style={{ marginBottom: '8px' }}>Technical issues affecting your listing will be resolved promptly</li>
                <li style={{ marginBottom: '8px' }}>Your placement will remain active for the full purchased term</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                If you experience any issues with your Spotlight Placement, please contact us immediately so we can address them.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Requesting a Refund
              </h2>
              <p style={{ marginBottom: '16px' }}>
                If you believe you qualify for a refund under the exceptions listed above, please contact us with:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Your agency name and contact information</li>
                <li style={{ marginBottom: '8px' }}>Order or transaction details</li>
                <li style={{ marginBottom: '8px' }}>Detailed explanation of the issue</li>
                <li style={{ marginBottom: '8px' }}>Any relevant documentation or screenshots</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                We will review refund requests within 5 business days and respond with our decision.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Chargebacks & Disputes
              </h2>
              <p style={{ marginBottom: '16px' }}>
                If you initiate a chargeback or payment dispute without first contacting us:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Your Spotlight Placement will be immediately removed</li>
                <li style={{ marginBottom: '8px' }}>We will provide documentation to the payment processor showing service was delivered</li>
                <li style={{ marginBottom: '8px' }}>Future services may be restricted</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                We strongly encourage you to contact us first so we can resolve any concerns directly.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Contact Information
              </h2>
              <p style={{ marginBottom: '16px' }}>
                For all refund questions and requests, please contact us:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px', listStyle: 'none' }}>
                <li style={{ marginBottom: '8px' }}>Email: <a href="mailto:support@gappsy.com" style={{ color: '#0A1735', textDecoration: 'none', fontWeight: 600 }}>support@gappsy.com</a></li>
                <li style={{ marginBottom: '8px' }}>Subject line: "Refund Request"</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                We aim to respond to all inquiries within 24-48 hours during business days.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                Policy Updates
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We reserve the right to update this Refund Policy at any time. Changes will be posted on this page with an updated "Last updated" date. Continued use of our services after changes constitutes acceptance of the updated policy.
              </p>
            </section>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
