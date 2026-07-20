import { useEffect, useRef, useState, ComponentType } from 'react';

interface LazyLoadProps {
  component: () => Promise<{ default: ComponentType<any> }>;
  componentProps?: any;
  rootMargin?: string;
  placeholder?: React.ReactNode;
}

const LazyLoad: React.FC<LazyLoadProps> = ({
  component,
  componentProps = {},
  rootMargin = '200px',
  placeholder = null,
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
    <div ref={containerRef}>
      {Component ? <Component {...componentProps} /> : placeholder}
    </div>
  );
};

export default LazyLoad;
