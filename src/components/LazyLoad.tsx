import { useEffect, useRef, useState, ComponentType } from 'react';

interface LazyLoadProps {
  component: () => Promise<{ default: ComponentType<any> }>;
  componentProps?: any;
  rootMargin?: string;
  placeholder?: React.ReactNode;
  /** Anchor-jump target (TOC links, hero/CTA "#id" links) needs to resolve
   * to *something* the instant the page loads, not just once this section
   * has actually scrolled into view and mounted — a plain href="#id"/
   * getElementById("id") pointed at the lazy child's own id finds nothing
   * until then, so jumping here from the very top of the page (before
   * anything has organically scrolled this section within rootMargin)
   * silently does nothing. Putting the id on this wrapper instead means
   * it's always there to scroll to, and scrolling it into view is exactly
   * what brings it within rootMargin and triggers the real mount. */
  id?: string;
  className?: string;
}

const LazyLoad: React.FC<LazyLoadProps> = ({
  component,
  componentProps = {},
  rootMargin = '200px',
  placeholder = null,
  id,
  className,
}) => {
  const [isVisible, setIsVisible] = useState(false);
  const [Component, setComponent] = useState<ComponentType<any> | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && !isVisible) {
            setIsVisible(true);
            observer.disconnect();
          }
        });
      },
      {
        rootMargin,
        threshold: 0.01,
      }
    );

    if (containerRef.current) {
      observer.observe(containerRef.current);
    }

    return () => {
      observer.disconnect();
    };
  }, [rootMargin, isVisible]);

  useEffect(() => {
    if (isVisible && !Component) {
      component().then((mod) => {
        setComponent(() => mod.default);
      });
    }
  }, [isVisible, Component, component]);

  return (
    <div ref={containerRef} id={id} className={className}>
      {Component ? <Component {...componentProps} /> : placeholder}
    </div>
  );
};

export default LazyLoad;
