import React, { useEffect } from 'react';
import FooterWrapper from '../components/FooterWrapper';

export default function PrivacyPage() {
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
            Privacy Policy
          </h1>

          <p style={{ color: '#64748B', fontSize: '15px', marginBottom: '40px' }}>
            <span id="last-updated"></span>
          </p>

          <div style={{ color: '#475569', lineHeight: '1.8', fontSize: '16px' }}>
            <section style={{ marginBottom: '40px' }}>
              <p style={{ marginBottom: '16px' }}>
                At Gappsy, we respect your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard data when you use our service.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                1. Information We Collect
              </h2>
              <h3 style={{ fontSize: '18px', fontWeight: 600, color: '#334155', marginBottom: '12px', marginTop: '20px' }}>
                Information You Provide
              </h3>
              <p style={{ marginBottom: '16px' }}>
                We collect information you voluntarily provide when using our service:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Agency Submissions:</strong> Business name, contact information, website, services offered, and agency description</li>
                <li style={{ marginBottom: '8px' }}><strong>Contact Forms:</strong> Name, email address, subject, and message content</li>
                <li style={{ marginBottom: '8px' }}><strong>Get Matched Requests:</strong> Service needs, budget range, timeline, email, and optional name</li>
                <li style={{ marginBottom: '8px' }}><strong>Payment Information:</strong> Processed securely through our payment provider (we do not store complete payment card details)</li>
              </ul>

              <h3 style={{ fontSize: '18px', fontWeight: 600, color: '#334155', marginBottom: '12px', marginTop: '20px' }}>
                Automatically Collected Information
              </h3>
              <p style={{ marginBottom: '16px' }}>
                We automatically collect certain information when you visit our website:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Usage Data:</strong> Pages viewed, time spent, links clicked, and navigation patterns</li>
                <li style={{ marginBottom: '8px' }}><strong>Device Information:</strong> Browser type, operating system, device type, and IP address</li>
                <li style={{ marginBottom: '8px' }}><strong>Cookies:</strong> Small data files that help us improve your experience</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                2. How We Use Your Information
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We use collected information for the following purposes:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Processing agency submissions and maintaining our rankings</li>
                <li style={{ marginBottom: '8px' }}>Matching businesses with suitable marketing agencies</li>
                <li style={{ marginBottom: '8px' }}>Responding to inquiries and providing customer support</li>
                <li style={{ marginBottom: '8px' }}>Processing payments for Spotlight Placements</li>
                <li style={{ marginBottom: '8px' }}>Improving our service and user experience</li>
                <li style={{ marginBottom: '8px' }}>Sending important service updates and notifications</li>
                <li style={{ marginBottom: '8px' }}>Detecting and preventing fraud or abuse</li>
                <li style={{ marginBottom: '8px' }}>Complying with legal obligations</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                3. How Agency Submissions Are Handled
              </h2>
              <p style={{ marginBottom: '16px' }}>
                When agencies submit information to Gappsy:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Submitted information is reviewed by our editorial team</li>
                <li style={{ marginBottom: '8px' }}>Approved listings may be published on our platform</li>
                <li style={{ marginBottom: '8px' }}>Contact information is used for verification and communication</li>
                <li style={{ marginBottom: '8px' }}>Data is retained as long as the listing is active</li>
                <li style={{ marginBottom: '8px' }}>Agencies can request updates or removal of their information</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                4. Data Storage & Retention
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We store your information securely using industry-standard practices:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Data is stored on secure servers with encryption</li>
                <li style={{ marginBottom: '8px' }}>Access is limited to authorized personnel only</li>
                <li style={{ marginBottom: '8px' }}>We retain data as long as necessary for our business purposes</li>
                <li style={{ marginBottom: '8px' }}>Payment information is handled by our secure payment processor</li>
                <li style={{ marginBottom: '8px' }}>We delete or anonymize data when no longer needed</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                5. Third-Party Services
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We work with trusted third-party services to operate our platform:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Payment Processing:</strong> Stripe or similar payment processors handle transactions securely</li>
                <li style={{ marginBottom: '8px' }}><strong>Analytics:</strong> We use analytics tools to understand how our service is used</li>
                <li style={{ marginBottom: '8px' }}><strong>Hosting:</strong> Our platform is hosted on secure cloud infrastructure</li>
                <li style={{ marginBottom: '8px' }}><strong>Email Services:</strong> Email communications are sent through trusted providers</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                These third parties have their own privacy policies and are contractually obligated to protect your data.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                6. Information Sharing
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We do not sell your personal information. We may share information in limited circumstances:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>With Agencies:</strong> When you use Get Matched, we share your project details with recommended agencies</li>
                <li style={{ marginBottom: '8px' }}><strong>Service Providers:</strong> With vendors who help us operate our platform</li>
                <li style={{ marginBottom: '8px' }}><strong>Legal Requirements:</strong> When required by law or to protect our rights</li>
                <li style={{ marginBottom: '8px' }}><strong>Business Transfers:</strong> In connection with a merger, sale, or acquisition</li>
              </ul>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                7. Your Rights
              </h2>
              <p style={{ marginBottom: '16px' }}>
                You have rights regarding your personal information:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}><strong>Access:</strong> Request a copy of the information we hold about you</li>
                <li style={{ marginBottom: '8px' }}><strong>Correction:</strong> Update or correct inaccurate information</li>
                <li style={{ marginBottom: '8px' }}><strong>Deletion:</strong> Request deletion of your personal information</li>
                <li style={{ marginBottom: '8px' }}><strong>Objection:</strong> Object to certain types of data processing</li>
                <li style={{ marginBottom: '8px' }}><strong>Portability:</strong> Receive your data in a structured, machine-readable format</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                To exercise these rights, contact us at <a href="mailto:support@gappsy.com" style={{ color: '#0A1735', textDecoration: 'none' }}>support@gappsy.com</a>.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                8. Cookies & Tracking
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We use cookies and similar technologies to:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px' }}>
                <li style={{ marginBottom: '8px' }}>Remember your preferences and settings</li>
                <li style={{ marginBottom: '8px' }}>Understand how you use our service</li>
                <li style={{ marginBottom: '8px' }}>Improve performance and functionality</li>
                <li style={{ marginBottom: '8px' }}>Provide personalized content</li>
              </ul>
              <p style={{ marginBottom: '16px' }}>
                You can control cookies through your browser settings. Note that disabling cookies may affect service functionality.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                9. Children's Privacy
              </h2>
              <p style={{ marginBottom: '16px' }}>
                Our service is not directed to children under 16. We do not knowingly collect information from children. If you believe we have collected information from a child, please contact us immediately.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                10. International Users
              </h2>
              <p style={{ marginBottom: '16px' }}>
                If you access Gappsy from outside the United States, your information may be transferred to and processed in the United States. By using our service, you consent to such transfer and processing.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                11. Changes to This Policy
              </h2>
              <p style={{ marginBottom: '16px' }}>
                We may update this Privacy Policy from time to time. We will notify you of material changes by updating the "Last updated" date and, where appropriate, through email or prominent notice on our website.
              </p>
            </section>

            <section style={{ marginBottom: '40px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: 700, color: '#0F172A', marginBottom: '16px' }}>
                12. Contact Us
              </h2>
              <p style={{ marginBottom: '16px' }}>
                If you have questions about this Privacy Policy or our data practices, please contact us:
              </p>
              <ul style={{ marginLeft: '24px', marginBottom: '16px', listStyle: 'none' }}>
                <li style={{ marginBottom: '8px' }}>Email: <a href="mailto:support@gappsy.com" style={{ color: '#0A1735', textDecoration: 'none' }}>support@gappsy.com</a></li>
              </ul>
            </section>
          </div>
        </div>
      </div>

      <FooterWrapper />
    </div>
  );
}
