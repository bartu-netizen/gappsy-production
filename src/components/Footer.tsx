import React from 'react';
import { Link } from 'react-router-dom';

interface FooterProps {
  currentState?: string;
}

export default function Footer({ currentState }: FooterProps = {}) {
  return (
    <footer style={{ width: '100%' }}>
      <div
        style={{
          backgroundColor: '#0A1735',
          padding: '40px',
          color: '#ffffff'
        }}
      >
          <div
            style={{
              display: 'grid',
              gridTemplateColumns: '1fr',
              gap: '48px'
            }}
            className="footer-grid"
          >
            <div>
              <img
                src="/logos/Gappsy-logo-white.webp"
                alt="Gappsy"
                style={{
                  height: '36px',
                  width: 'auto',
                  marginBottom: '20px'
                }}
              />
              <p
                style={{
                  color: '#94A3B8',
                  lineHeight: '1.7',
                  fontSize: '15px',
                  maxWidth: '400px'
                }}
              >
                A directory of 3,000+ software tools across every category, so you can compare pricing, features, and reviews to find exactly what your business needs to grow.
              </p>
            </div>

            <div>
              <h3
                style={{
                  fontSize: '14px',
                  fontWeight: 700,
                  color: '#ffffff',
                  marginBottom: '20px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px'
                }}
              >
                Software Directory
              </h3>
              <nav style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                <Link
                  to="/tools"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  All Software Tools
                </Link>
                <Link
                  to="/tool-categories"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Browse Categories
                </Link>
              </nav>
            </div>

            <div>
              <h3
                style={{
                  fontSize: '14px',
                  fontWeight: 700,
                  color: '#ffffff',
                  marginBottom: '20px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px'
                }}
              >
                Marketing Agencies
              </h3>
              <nav style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                <Link
                  to="/marketing-agencies"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Top 25 Agency Lists
                </Link>
                <Link
                  to="/marketing-agencies/usa"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Browse by State
                </Link>
              </nav>
            </div>

            <div>
              <h3
                style={{
                  fontSize: '14px',
                  fontWeight: 700,
                  color: '#ffffff',
                  marginBottom: '20px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px'
                }}
              >
                Company
              </h3>
              <nav style={{ display: 'flex', flexDirection: 'column', gap: '12px', marginBottom: '24px' }}>
                <Link
                  to="/about"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  About Us
                </Link>
                <Link
                  to="/contact"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Contact
                </Link>
                <Link
                  to="/editorial-policy"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Editorial Policy
                </Link>
              </nav>
            </div>

            <div>
              <h3
                style={{
                  fontSize: '14px',
                  fontWeight: 700,
                  color: '#ffffff',
                  marginBottom: '20px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px'
                }}
              >
                Gappsy Software
              </h3>
              <nav style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                <Link
                  to="/appbuilder"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Gappsy Appbuilder
                </Link>
                <Link
                  to="/publish-service"
                  style={{
                    color: 'rgba(148, 163, 184, 0.7)',
                    textDecoration: 'none',
                    fontSize: '14px',
                    transition: 'color 0.2s',
                    paddingLeft: '16px'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = 'rgba(148, 163, 184, 0.7)'; }}
                >
                  App Publishing Service
                </Link>
                <Link
                  to="/done-for-you-app-creation"
                  style={{
                    color: 'rgba(148, 163, 184, 0.7)',
                    textDecoration: 'none',
                    fontSize: '14px',
                    transition: 'color 0.2s',
                    paddingLeft: '16px'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = 'rgba(148, 163, 184, 0.7)'; }}
                >
                  Done-for-You App Creation
                </Link>
                <Link
                  to="/proof"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Gappsy Proof
                </Link>
                <Link
                  to="/analytics"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Gappsy Analytics
                </Link>
              </nav>
            </div>

            <div>
              <h3
                style={{
                  fontSize: '14px',
                  fontWeight: 700,
                  color: '#ffffff',
                  marginBottom: '20px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px'
                }}
              >
                Legal
              </h3>
              <nav style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                <Link
                  to="/terms"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Terms of Service
                </Link>
                <Link
                  to="/privacy"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Privacy Policy
                </Link>
                <Link
                  to="/refunds"
                  style={{
                    color: '#94A3B8',
                    textDecoration: 'none',
                    fontSize: '15px',
                    transition: 'color 0.2s'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.color = '#ffffff'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.color = '#94A3B8'; }}
                >
                  Refund Policy
                </Link>
              </nav>
            </div>
          </div>

        <div
          style={{
            borderTop: '1px solid #2D3748',
            marginTop: '48px',
            paddingTop: '24px',
            textAlign: 'center'
          }}
        >
          <p style={{ color: '#64748B', fontSize: '14px' }}>
            © {new Date().getFullYear()} Gappsy. All rights reserved.
          </p>
        </div>
      </div>

      <style>{`
        @media (min-width: 640px) {
          .footer-grid {
            grid-template-columns: 1fr 1fr !important;
          }
        }
        @media (min-width: 1024px) {
          .footer-grid {
            grid-template-columns: 1.3fr 1fr 1fr 1fr 1fr 1fr !important;
          }
        }
      `}</style>
    </footer>
  );
}
