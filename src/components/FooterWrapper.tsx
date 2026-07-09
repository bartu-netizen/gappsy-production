import React from 'react';
import Footer from './Footer';

interface FooterWrapperProps {
  currentState?: string;
  isHomepage?: boolean;
}

export default function FooterWrapper({ currentState, isHomepage = false }: FooterWrapperProps) {
  if (isHomepage) {
    return (
      <div style={{ padding: '40px 0' }}>
        <div style={{ maxWidth: '900px', margin: '0 auto' }}>
          <div
            style={{
              borderRadius: '24px',
              overflow: 'hidden',
              boxShadow: '0 4px 24px rgba(0, 0, 0, 0.1)'
            }}
          >
            <Footer currentState={currentState} />
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full bg-transparent px-6 sm:px-8 pb-10">
      <div className="mx-auto max-w-[1366px]">
        <div className="rounded-[32px] overflow-hidden shadow-lg">
          <Footer currentState={currentState} />
        </div>
      </div>
    </div>
  );
}
