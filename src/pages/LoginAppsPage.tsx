import { useEffect } from 'react';
import { ChevronRight } from 'lucide-react';

interface AppCard {
  title: string;
  subtitle: string;
  href: string;
  ariaLabel: string;
}

export default function LoginAppsPage() {
  useEffect(() => {
    document.title = 'Login to Gappsy Apps – Appbuilder, Proof & Analytics';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Choose your Gappsy app and log in to Gappsy Appbuilder, Proof or Analytics from one clean, central login hub.');
    }
  }, []);

  const apps: AppCard[] = [
    {
      title: 'Gappsy Appbuilder',
      subtitle: 'No-code mobile app builder for iOS & Android apps.',
      href: 'https://dashboard.gappsy.com/',
      ariaLabel: 'Login to Gappsy Appbuilder'
    },
    {
      title: 'Gappsy Proof',
      subtitle: 'Live social proof notifications that boost conversions.',
      href: 'https://proof.gappsy.com/login',
      ariaLabel: 'Login to Gappsy Proof'
    },
    {
      title: 'Gappsy Analytics',
      subtitle: 'Privacy-first analytics with heatmaps & session replays.',
      href: 'https://analytics.gappsy.com/login',
      ariaLabel: 'Login to Gappsy Analytics'
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-950 to-slate-900">
      <main className="mx-auto max-w-2xl px-4 py-12 sm:py-20">
        {/* Logo Section */}
        <div className="mb-4 flex justify-center sm:mb-6">
          <img
            src="/logos/gappsy-logo-white.webp"
            alt="Gappsy"
            className="h-16 w-auto sm:h-20"
          />
        </div>

        {/* Hero Section */}
        <section className="mb-8 text-center sm:mb-10">
          <h1 className="mb-3 text-3xl font-bold text-white sm:text-4xl">
            Choose your app
          </h1>
          <p className="text-base text-slate-300">
            Select the app you want to log into. You'll be redirected to the correct dashboard.
          </p>
        </section>

        {/* Go Back Button */}
        <div className="mb-10 flex justify-center sm:mb-14">
          <button
            onClick={() => {
              if (window.history.length > 1) {
                window.history.back();
              } else {
                window.location.href = '/';
              }
            }}
            className="w-full max-w-sm rounded-lg bg-indigo-600 px-8 py-4 text-base font-semibold text-white transition-all duration-200 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-offset-2 focus:ring-offset-slate-900 sm:text-lg"
            aria-label="Go back to previous page"
          >
            Go back
          </button>
        </div>

        {/* App Cards */}
        <section className="mx-auto w-full max-w-sm space-y-3 sm:max-w-md">
          {apps.map((app) => (
            <a
              key={app.title}
              href={app.href}
              aria-label={app.ariaLabel}
              className="group relative flex items-center overflow-hidden rounded-lg bg-white px-5 py-2 shadow-md transition-all duration-300 hover:shadow-xl hover:scale-105 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-offset-2 focus:ring-offset-slate-900 sm:px-6 sm:py-3"
            >
              <div className="min-w-0 flex-1">
                <h2 className="text-lg font-semibold text-slate-900 sm:text-xl">
                  {app.title}
                </h2>
                <p className="mt-1 text-sm text-slate-600">
                  {app.subtitle}
                </p>
              </div>

              <div className="ml-4 flex-shrink-0">
                <ChevronRight className="h-5 w-5 text-slate-400 transition-all duration-300 group-hover:translate-x-1 group-hover:text-slate-900 sm:h-6 sm:w-6" />
              </div>
            </a>
          ))}
        </section>
      </main>
    </div>
  );
}
