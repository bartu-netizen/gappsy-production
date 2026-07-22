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
  const [failed, setFailed] = useState(false);
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
    if (isVisible && !Component && !failed) {
      component()
        .then((mod) => {
          setComponent(() => mod.default);
        })
        .catch(() => {
          setFailed(true);
        });
    }
  }, [isVisible, Component, failed, component]);

  return (
    <div ref={containerRef} id={id} className={className}>
      {Component ? (
        <Component {...componentProps} />
      ) : failed ? (
        // A stale deployed chunk hash (common right after a new release) or a
        // transient network blip is the usual cause of a failed dynamic
        // import — reloading re-fetches the current build's asset manifest
        // instead of leaving this section silently blank forever.
        <button
          type="button"
          onClick={() => window.location.reload()}
          className="text-sm text-slate-400 hover:text-slate-600 underline underline-offset-2"
        >
          Couldn't load this section — tap to refresh
        </button>
      ) : (
        placeholder
      )}
    </div>
  );
};

export default LazyLoad;
