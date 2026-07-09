import { useEffect } from 'react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';

export default function PublishServicePage() {
  useEffect(() => {
    document.title = 'App Publish Service - Gappsy';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Done-for-you app publishing service for iOS and Android. We handle all the technical steps to publish your app in both app stores.');
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
              Gappsy App Publish Service
            </h1>

            {/* Description Paragraphs */}
            <div className="max-w-3xl mx-auto space-y-4">
              <p className="text-base sm:text-lg text-gray-600">
                You don't want to take all the steps to publish your app in the iOS and Android app store? Not a problem. We can do all of it for you.
              </p>
              <p className="text-base sm:text-lg text-gray-600">
                With this service you still need to create the app yourself. We will publish the app in the App Stores for you under your Developer accounts.
              </p>
            </div>
          </div>
        </div>

        {/* Pricing Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-72">
          <div className="w-full sm:max-w-2xl sm:mx-auto px-2">
            <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-200">
              <div className="bg-gradient-to-br from-gray-800 to-gray-700 p-6 sm:p-8 text-white text-center">
                <h2 className="text-xl sm:text-2xl font-bold mb-4">App Publish Service</h2>
                <div className="text-4xl sm:text-5xl font-bold mb-2">$600</div>
                <div className="text-sm sm:text-base text-[#E8ECFA]">One-time fee</div>
              </div>

              <div className="p-6 sm:p-8">
                <ul className="space-y-3 sm:space-y-4 mb-8">
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Publishing your app in the iOS store</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Publishing your app in the Android Playstore</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Creating all the necessary certificates and files</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Apple now requires all publishers to use their own Apple developer account (costs $99/year). You must have your own active Apple developer account.</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>You also need your own Android developer account ($25 one-time fee).</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>If you change core elements of your app (icon, background, app descriptions, or add/remove Gappsy plugins), republishing may be required.</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>Apple or Android may require you to republish your app once a year.</span>
                  </li>
                  <li className="flex items-start text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span>We will publish your app in both the iOS App Store and Android Playstore one time. If you need republishing later, we can give you a discount.</span>
                  </li>
                </ul>

                <a
                  href="https://gappsy.thrivecart.com/done-for-you-publishing/"
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
