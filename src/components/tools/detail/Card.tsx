import type { ReactNode } from 'react';

interface CardProps {
  children: ReactNode;
  className?: string;
  hoverLift?: boolean;
  highlight?: boolean;
}

// Shared white/border/radius/shadow surface used across the tool-detail
// "master template" (FeatureGrid, PricingSection, ProsConsSection, FAQSection,
// AlternativesSection, IntegrationsSection, ReviewsSection, ToolFactsSidebar).
// One place to tune the premium-SaaS card treatment instead of eight.
export default function Card({ children, className = '', hoverLift = false, highlight = false }: CardProps) {
  const border = highlight
    ? 'border-2 border-indigo-500 shadow-[0_16px_32px_rgba(79,70,229,0.12)]'
    : 'border border-[#eef0f3]';
  return (
    <div
      className={`relative bg-white rounded-2xl transition-all duration-200 ${border} ${
        hoverLift ? 'hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)] hover:-translate-y-0.5' : ''
      } ${className}`}
    >
      {children}
    </div>
  );
}
