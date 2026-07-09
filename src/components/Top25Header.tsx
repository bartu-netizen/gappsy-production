import { useEffect, useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { getStateListingUrl } from '../utils/stateListingUrl';
import { formatStateName } from '../utils/formatLocation';

interface Top25HeaderProps {
  stateSlug: string;
  variant?: 'dark' | 'light';
  useScrollSwitch?: boolean;
  type?: 'default' | 'product';
  isReviewPage?: boolean;
  isPositiveReview?: boolean;
  topOffset?: number;
}

export default function Top25Header({
  stateSlug,
  variant = 'light',
  useScrollSwitch = false,
  type = 'default',
  isReviewPage = false,
  isPositiveReview = false,
  topOffset = 0
}: Top25HeaderProps) {
  const navigate = useNavigate();
  const [isScrolled, setIsScrolled] = useState(false);

  useEffect(() => {
    if (!useScrollSwitch) return;

    const handleScroll = () => {
      setIsScrolled(window.scrollY > 30);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [useScrollSwitch]);

  const stateName = formatStateName(stateSlug);

  const computeOwnerPreviewMode = () => {
    if (typeof window === 'undefined') return false;
    if (window.location.pathname.startsWith('/your-agency')) return true;
    const hash = window.location.hash || '';
    if (hash.includes('owner=1') || hash.includes('agency=')) return true;
    const search = new URLSearchParams(window.location.search);
    if (search.get('fsid')) return true;
    return false;
  };
  const [ownerPreviewMode, setOwnerPreviewMode] = useState(computeOwnerPreviewMode);
  useEffect(() => {
    const update = () => setOwnerPreviewMode(computeOwnerPreviewMode());
    window.addEventListener('hashchange', update);
    window.addEventListener('popstate', update);
    return () => {
      window.removeEventListener('hashchange', update);
      window.removeEventListener('popstate', update);
    };
  }, []);

  const handleFindAgency = (e: React.MouseEvent) => {
    if (ownerPreviewMode) {
      e.preventDefault();
      e.stopPropagation();
      return;
    }
    window.dispatchEvent(new CustomEvent('openGetMatchedForm'));
  };

  const handleListAgency = (e: React.MouseEvent) => {
    if (ownerPreviewMode) {
      e.preventDefault();
      e.stopPropagation();
      return;
    }
    window.dispatchEvent(new CustomEvent('openSubmitAgencyForm'));
  };

  const handleLogin = (e: React.MouseEvent) => {
    if (ownerPreviewMode) {
      e.preventDefault();
      e.stopPropagation();
      return;
    }
    navigate('/login/apps');
  };

  const blockIfOwner = (e: React.MouseEvent) => {
    if (ownerPreviewMode) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <>
      {/* Desktop Full-Width Bar */}
      <div
        className="hidden md:block w-full bg-transparent sticky z-50"
        style={{ top: `${topOffset}px` }}
      >
        <div className="mx-auto w-full max-w-7xl px-4 pt-3 pb-2">
          <div className="flex items-center justify-between rounded-2xl bg-slate-900 text-white shadow-lg shadow-black/10 px-6 py-2">
            {/* Left: Logo */}
            <div className="flex items-center">
              <Link to="/" aria-label="Go to homepage" onClick={blockIfOwner}>
                <img
                  src="/logos/Gappsy-logo-white.webp"
                  alt="Gappsy"
                  className="h-10 w-auto"
                />
              </Link>
            </div>

            {/* Right: Buttons */}
            {type === 'product' ? (
              <div className="flex items-center gap-3">
                <button
                  onClick={handleLogin}
                  className="bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-600 whitespace-nowrap"
                >
                  Login
                </button>
              </div>
            ) : (
              <div className="flex items-center gap-3">
                {isReviewPage ? (
                  <Link
                    to={getStateListingUrl(stateSlug)}
                    onClick={blockIfOwner}
                    className="bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-700 whitespace-nowrap inline-block"
                  >
                    {isPositiveReview ? `See the Full ${stateName} Top 25` : `Find Better ${stateName} Agencies`}
                  </Link>
                ) : (
                  <button
                    onClick={handleFindAgency}
                    className="bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-600 whitespace-nowrap"
                  >
                    Find {stateName} Agency
                  </button>
                )}

                {!isReviewPage && (
                  <button
                    onClick={handleListAgency}
                    className="border-2 border-white bg-transparent text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-white/10 whitespace-nowrap"
                  >
                    List Your {stateName} Agency
                  </button>
                )}
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Mobile Compact Bar */}
      <div
        className="flex md:hidden w-full bg-transparent sticky z-50"
        style={{ top: `${topOffset}px` }}
      >
        <div className="flex w-full items-center justify-between bg-slate-900 text-white px-4 py-2 shadow-md shadow-black/10">
          {/* Left: Logo */}
          <div className="flex items-center">
            <Link to="/" aria-label="Go to homepage" onClick={blockIfOwner}>
              <img
                src="/logos/Gappsy-logo-white.webp"
                alt="Gappsy"
                className="h-7 w-auto"
              />
            </Link>
          </div>

          {/* Right: Buttons */}
          {type === 'product' ? (
            <div className="flex items-center gap-2 flex-nowrap">
              <button
                onClick={handleLogin}
                className="bg-indigo-600 text-white px-3 py-1.5 rounded-lg text-xs font-medium transition-all duration-200 hover:bg-indigo-600 whitespace-nowrap"
              >
                Login
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-2 flex-nowrap">
              {isReviewPage ? (
                <Link
                  to={getStateListingUrl(stateSlug)}
                  onClick={blockIfOwner}
                  className="bg-indigo-600 text-white px-3 py-1.5 rounded-lg text-xs font-medium transition-all duration-200 hover:bg-indigo-700 whitespace-nowrap inline-block"
                >
                  {isPositiveReview ? `See Full ${stateName} Top 25` : `Find Better ${stateName} Agencies`}
                </Link>
              ) : (
                <button
                  onClick={handleFindAgency}
                  className="bg-indigo-600 text-white px-3 py-1.5 rounded-lg text-xs font-medium transition-all duration-200 hover:bg-indigo-600 whitespace-nowrap"
                >
                  Find Agency
                </button>
              )}

              {!isReviewPage && (
                <button
                  onClick={handleListAgency}
                  className="border border-white/60 bg-transparent text-white px-3 py-1.5 rounded-lg text-xs font-medium transition-all duration-200 hover:bg-white/10 whitespace-nowrap"
                >
                  List Agency
                </button>
              )}
            </div>
          )}
        </div>
      </div>
    </>
  );
}
