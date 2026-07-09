import { useEffect } from 'react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';

export default function DoneForYouAppCreationPage() {
  useEffect(() => {
    document.title = 'Done-for-You App Creation Service | Gappsy';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Let Gappsy build your app for you. Our Done-for-You App Creation service delivers a complete app using the Gappsy Builder for a one-time fee.');
    }
  }, []);

  return (
    <div className="app bg-white">
      <Top25Header stateSlug="" type="product" />

      <main className="overflow-x-hidden pt-4 sm:pt-12 lg:pt-14 pb-96">
        {/* Hero Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            {/* Badge */}
            <div className="mb-6">
              <span className="inline-block bg-indigo-600 text-white text-sm font-semibold px-4 py-2 rounded-lg">
                Done-for-you
              </span>
            </div>

            {/* Title */}
            <h1 className="text-2xl sm:text-3xl md:text-4xl font-bold text-gray-900 mb-6">
              Gappsy Done-for-You App Creation
            </h1>

            {/* Description Paragraphs */}
            <div className="max-w-3xl mx-auto space-y-4">
              <p className="text-base sm:text-lg text-gray-600">
                Don't want to build your app yourself? No problem.
              </p>
              <p className="text-base sm:text-lg text-gray-600">
                With our Done-for-You App Creation service, we build your entire app for you using the Gappsy Builder. You don't have to do anything.
              </p>
              <p className="text-base sm:text-lg text-gray-600">
                This service is ideal if you want a complete app without spending time on setup or configuration.
              </p>
            </div>
          </div>
        </div>

        {/* Pricing Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-72">
          <div className="w-full sm:max-w-2xl sm:mx-auto px-2">
            <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-200">
              <div className="bg-gradient-to-br from-gray-800 to-gray-700 p-6 sm:p-8 text-white text-center">
                <h2 className="text-xl sm:text-2xl font-bold mb-4">Done-for-You App Creation</h2>
                <div className="text-4xl sm:text-5xl font-bold mb-2">$997</div>
                <div className="text-sm sm:text-base text-[#E8ECFA]">One-time fee</div>
              </div>

              <div className="p-6 sm:p-8">
                <ul className="space-y-3 sm:space-y-4 mb-6">
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>We build your app from scratch using the Gappsy App Builder</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>No custom code, custom features, or custom layouts</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Only existing Gappsy Builder functionality is used</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>You must already have access to the Gappsy App Builder</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>This fee is on top of your Gappsy App Builder license</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>You don't have to do anything — we handle everything</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>No refunds on this done-for-you service</span>
                  </li>
                </ul>

                <p className="text-xs text-gray-500 mb-8">
                  This service does not include custom development or feature requests outside the Gappsy Builder.
                </p>

                <a
                  href="https://gappsy.thrivecart.com/done-for-you-app-creation/"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block w-full bg-indigo-600 text-white text-center font-semibold py-2 sm:py-3 text-sm sm:text-base rounded-lg transition-all duration-200 hover:bg-indigo-600"
                >
                  Buy now
                </a>
              </div>
            </div>
          </div>
        </div>
      </main>

      <FooterWrapper />
    </div>
  );
}
