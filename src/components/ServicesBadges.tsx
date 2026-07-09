import { useState } from 'react';

interface ServicesBadgesProps {
  services: string[];
  maxVisible?: number;
  badgeClassName?: string;
  containerClassName?: string;
  badgeStyle?: React.CSSProperties;
  containerStyle?: React.CSSProperties;
}

export default function ServicesBadges({
  services,
  maxVisible = 1,
  badgeClassName = '',
  containerClassName = '',
  badgeStyle = {},
  containerStyle = {}
}: ServicesBadgesProps) {
  const [showAllServices, setShowAllServices] = useState(false);

  const defaultBadgeStyle: React.CSSProperties = {
    display: 'inline-block',
    fontSize: '11px',
    fontWeight: 600,
    color: '#475569',
    backgroundColor: '#f1f5f9',
    padding: '4px 10px',
    borderRadius: '6px',
    border: '1px solid #e2e8f0',
    ...badgeStyle
  };

  const moreBadgeStyle: React.CSSProperties = {
    ...defaultBadgeStyle,
    cursor: 'pointer',
    userSelect: 'none',
    transition: 'all 200ms ease',
    backgroundColor: '#F1F5F9',
    borderColor: 'rgba(0, 0, 0, 0.05)'
  };

  const defaultContainerStyle: React.CSSProperties = {
    display: 'flex',
    flexWrap: 'wrap',
    gap: '6px',
    ...containerStyle
  };

  const toggleServices = () => {
    setShowAllServices(!showAllServices);
  };

  if (services.length === 0) {
    return null;
  }

  if (services.length === 1) {
    return (
      <div style={defaultContainerStyle} className={containerClassName}>
        <span
          style={defaultBadgeStyle}
          className={badgeClassName}
        >
          {services[0]}
        </span>
      </div>
    );
  }

  return (
    <div style={defaultContainerStyle} className={containerClassName}>
      <span
        style={defaultBadgeStyle}
        className={badgeClassName}
      >
        {services[0]}
      </span>

      {!showAllServices && (
        <button
          type="button"
          onClick={toggleServices}
          style={moreBadgeStyle}
          className={`${badgeClassName} service-tag-more`}
        >
          +{services.length - 1} more
        </button>
      )}

      {showAllServices && (
        <>
          {services.slice(1).map((service, idx) => (
            <span
              key={`extra-${idx}`}
              style={{
                ...defaultBadgeStyle,
                animation: 'badgeSlideIn 180ms ease-out forwards',
                opacity: 0,
                transform: 'translateY(-4px)'
              }}
              className={`${badgeClassName} extra-service-tag`}
            >
              {service}
            </span>
          ))}
          <button
            type="button"
            onClick={toggleServices}
            style={moreBadgeStyle}
            className={`${badgeClassName} service-tag-more`}
          >
            Show less
          </button>
        </>
      )}
    </div>
  );
}
