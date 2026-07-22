import { useEffect, useRef, useState, type ReactNode } from 'react';

interface ScrollRevealProps {
  children: ReactNode;
  delayMs?: number;
  className?: string;
}

// Fire-once fade/slide-in on scroll, shared by every section on the
// Feature My Product page. Mirrors the threshold-based IntersectionObserver
// pattern already used by SpotlightCard.tsx, generalized into one component
// instead of six separate inline implementations.
export default function ScrollReveal({ children, delayMs = 0, className = '' }: ScrollRevealProps) {
  const ref = useRef<HTMLDivElement>(null);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const node = ref.current;
    if (!node) return;
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setVisible(true);
          observer.disconnect();
        }
      },
      { threshold: 0.15 }
    );
    observer.observe(node);
    return () => observer.disconnect();
  }, []);

  return (
    <div
      ref={ref}
      className={`transition-all duration-700 ease-out ${visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-4'} ${className}`}
      style={{ transitionDelay: visible ? `${delayMs}ms` : '0ms' }}
    >
      {children}
    </div>
  );
}
