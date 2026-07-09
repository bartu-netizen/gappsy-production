import { useEffect, useRef } from 'react';
import { ExternalLink } from 'lucide-react';

interface SpotlightCardProps {
  position: number;
  name: string;
  tagline?: string;
  description?: string;
  logo?: string;
  featuredImage?: string;
  backgroundColor?: string;
  ctaText?: string;
  ctaUrl?: string;
  services?: string[];
  onView: () => void;
  onClick: () => void;
}

export default function SpotlightCard({
  position,
  name,
  tagline,
  description,
  logo,
  featuredImage,
  backgroundColor = '#1e40af',
  ctaText = 'Learn More',
  ctaUrl,
  services = [],
  onView,
  onClick
}: SpotlightCardProps) {
  const cardRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          onView();
          observer.disconnect();
        }
      },
      { threshold: 0.5 }
    );

    if (cardRef.current) {
      observer.observe(cardRef.current);
    }

    return () => observer.disconnect();
  }, [onView]);

  return (
    <div
      ref={cardRef}
      className={`spotlight-card spotlight-position-${position} rounded-xl shadow-2xl overflow-hidden`}
      style={{ backgroundColor }}
    >
      {featuredImage && (
        <div className="spotlight-hero-image relative h-48">
          <img
            src={featuredImage}
            alt={name}
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
        </div>
      )}

      <div className="spotlight-content p-8 text-white">
        <div className="inline-block mb-4 px-3 py-1 bg-white/20 backdrop-blur-sm rounded-full text-sm font-semibold">
          Featured #{position}
        </div>

        {logo && (
          <div className="mb-4">
            <img
              src={logo}
              alt={`${name} logo`}
              className="h-16 w-auto object-contain"
              style={{ filter: 'brightness(0) invert(1)' }}
            />
          </div>
        )}

        <h3 className="text-2xl font-bold mb-2">{name}</h3>

        {tagline && (
          <p className="text-xl font-semibold mb-4 text-white/90">
            {tagline}
          </p>
        )}

        {description && (
          <p className="text-white/80 mb-6 line-clamp-3">
            {description}
          </p>
        )}

        {services && services.length > 0 && (
          <div className="flex flex-wrap gap-2 mb-6">
            {services.slice(0, 4).map(service => (
              <span
                key={service}
                className="px-3 py-1 bg-white/20 backdrop-blur-sm rounded-full text-sm"
              >
                {service}
              </span>
            ))}
            {services.length > 4 && (
              <span className="px-3 py-1 bg-white/20 backdrop-blur-sm rounded-full text-sm">
                +{services.length - 4} more
              </span>
            )}
          </div>
        )}

        {ctaUrl && (
          <a
            href={ctaUrl}
            target="_blank"
            rel="noopener noreferrer"
            onClick={onClick}
            className="inline-flex items-center gap-2 px-6 py-3 bg-white text-gray-900 font-semibold rounded-lg hover:bg-gray-100 transition-colors"
          >
            {ctaText}
            <ExternalLink className="w-5 h-5" />
          </a>
        )}
      </div>
    </div>
  );
}
