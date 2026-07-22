import { useEffect } from 'react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';

export default function AnalyticsPage() {
  useEffect(() => {
    document.title = 'All-in-One Web Analytics - Analytics Platform';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Track your users journey, replay sessions, collect heatmaps and more. All-in-one web analytics with no monthly fees. One-time payment.');
    }
  }, []);

  return (
    <div className="app bg-white">
      <Top25Header stateSlug="" type="product" />

      <main className="overflow-x-hidden pt-4 sm:pt-28 lg:pt-32">
        {/* Hero Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-10 items-center max-w-[1400px] mx-auto mb-12 lg:mb-12 sm:mb-8">
            {/* Left Column - Text Content */}
            <div className="text-left order-2 lg:order-1">
              <h1 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4">
                All-in-one web analytics.
              </h1>

              <p className="text-lg md:text-xl lg:text-2xl font-semibold leading-tight mb-4 lg:mb-6 text-indigo-600">
                Track your users journey, replay sessions, collect heatmaps & more.
              </p>

              <p className="text-base md:text-lg text-gray-700 mb-6 lg:mb-8 leading-relaxed">
                Start analysing your website today. <strong>No monthly fees. Just a one time payment.</strong>
              </p>

              {/* Replaces Section with Logo */}
              <div className="mb-6 lg:mb-8">
                <img
                  src="/logos/gappsy-analytics-replacing-.png"
                  alt="Replaces Hotjar, LogRocket, mouseflow, smartlook and more"
                  className="h-12 md:h-16 object-contain"
                />
              </div>

              <div>
                <a href="https://gappsy.thrivecart.com/gappsy-analytics-plan/" target="_blank" rel="noopener noreferrer" className="inline-block text-white px-6 py-3 rounded-lg text-sm md:text-base font-semibold transition-all duration-200 bg-indigo-600 hover:bg-indigo-700">
                  BUY LIFETIME DEAL →
                </a>
              </div>
            </div>

            {/* Right Column - Image */}
            <div className="flex items-center justify-center order-1 lg:order-2 mb-8 lg:mb-0 mt-6 sm:mt-0">
              <img
                src="/assets/hero.webp"
                alt="Web analytics dashboard showing pageviews, sessions, visitors, and traffic charts"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>
          </div>
        </div>

        {/* Three Features Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8">
            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-indigo-100 rounded-xl flex items-center justify-center mr-3">
                  <svg className="w-6 h-6 text-indigo-600" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10.5 1.5H5.75A2.75 2.75 0 003 4.25v11.5A2.75 2.75 0 005.75 18.5h8.5a2.75 2.75 0 002.75-2.75V8m-10-6.5v5m5-5v5m-8 4h12m-12 3h12"/>
                  </svg>
                </div>
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">Tracking modes</h3>
                  <p className="text-gray-600 text-sm">Lightweight & advanced anonymized behaviour tracking</p>
                </div>
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-indigo-100 rounded-xl flex items-center justify-center mr-3">
                  <svg className="w-6 h-6 text-indigo-600" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M5 2a1 1 0 011-1h8a1 1 0 011 1v14a1 1 0 01-1 1H6a1 1 0 01-1-1V2zm3 2h2v2H8V4zm0 4h2v2H8V8zm-2 6h8v2H6v-2z" clipRule="evenodd"/>
                  </svg>
                </div>
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">We respect your data</h3>
                  <p className="text-gray-600 text-sm">Yours always. Deletable anytime.</p>
                </div>
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-indigo-100 rounded-xl flex items-center justify-center mr-3">
                  <svg className="w-6 h-6 text-indigo-600" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M5.293 9.707a1 1 0 010-1.414l4-4a1 1 0 111.414 1.414L7.414 8l3.293 3.293a1 1 0 11-1.414 1.414l-4-4z" clipRule="evenodd"/>
                  </svg>
                </div>
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">Private, safe & compliant</h3>
                  <p className="text-gray-600 text-sm">We respect all modern privacy and tracking regulations.</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Visitors History Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Text Content */}
            <div className="text-left order-2 lg:order-1">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  VISITORS
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-3 lg:mb-4">
                Visitors history
              </h2>

              <p className="text-base md:text-lg text-gray-600 leading-relaxed">
                Fully anonymized history of visitors. Get to know when your visitors come back and what they are doing.
              </p>
            </div>

            {/* Right Column - Image */}
            <div className="flex items-center justify-center order-1 lg:order-2 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-visitors.webp"
                alt="Visitors analytics dashboard showing visitor information and session details"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>
          </div>
        </div>

        {/* Visitor Behaviour Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Image */}
            <div className="flex items-center justify-center order-2 lg:order-1 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-session_events.webp"
                alt="Session events tracking showing all user interactions and page events"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>

            {/* Right Column - Text Content */}
            <div className="text-left order-1 lg:order-2">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  VISITOR BEHAVIOUR
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-3 lg:mb-4">
                Understand your users
              </h2>

              <p className="text-base md:text-lg text-gray-600 leading-relaxed">
                Check each visitors journey on your site without infringing their privacy.
              </p>
            </div>
          </div>
        </div>

        {/* Realtime Visitor Analytics Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Text Content */}
            <div className="text-left order-2 lg:order-1">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  LIVE INFO
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4 lg:mb-6">
                Realtime visitor analytics
              </h2>

              <ul className="space-y-2 md:space-y-3 text-sm md:text-base text-gray-600">
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>See in real-time who is on your site</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Live sessions</span>
                </li>
              </ul>
            </div>

            {/* Right Column - Image */}
            <div className="flex items-center justify-center order-1 lg:order-2 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-realtime.webp"
                alt="Realtime visitor analytics dashboard showing live user activity"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>
          </div>
        </div>

        {/* Privacy Friendly Heatmaps Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Image */}
            <div className="flex items-center justify-center order-2 lg:order-1 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-heatmaps.webp"
                alt="Privacy friendly heatmaps showing click patterns and user behavior visualization"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>

            {/* Right Column - Text Content */}
            <div className="text-left order-1 lg:order-2">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  HEATMAPS
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4 lg:mb-6">
                Privacy friendly heatmaps
              </h2>

              <ul className="space-y-2 md:space-y-3 text-sm md:text-base text-gray-600">
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>See exactly where visitors click</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Scroll & attention heatmaps</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Fully encrypted</span>
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* Session Recording Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Text Content */}
            <div className="text-left order-2 lg:order-1">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  SESSION RECORDING
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4 lg:mb-6">
                Record & replay visitors sessions
              </h2>

              <ul className="space-y-2 md:space-y-3 text-sm md:text-base text-gray-600">
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Record every interaction</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Automatically replay details</span>
                </li>
              </ul>
            </div>

            {/* Right Column - Image */}
            <div className="flex items-center justify-center order-1 lg:order-2 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-recordings.webp"
                alt="Session recording and replay showing user interaction details"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>
          </div>
        </div>

        {/* Outbound Clicks Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Image */}
            <div className="flex items-center justify-center order-2 lg:order-1 mb-6 lg:mb-0 mt-4 sm:mt-0">
              <img
                src="/assets/gappsy-analytics-outbound_clicks.webp"
                alt="Outbound clicks tracking showing external link clicks and traffic destinations"
                className="w-full h-auto max-w-full"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>

            {/* Right Column - Text Content */}
            <div className="text-left order-1 lg:order-2">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  OUTBOUND CLICKS
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4 lg:mb-6">
                Track outbound link clicks
              </h2>

              <ul className="space-y-2 md:space-y-3 text-sm md:text-base text-gray-600">
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Track all outbound clicks</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Most clicked external sites</span>
                </li>
                <li className="flex items-start">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-100 text-indigo-600 text-xs font-bold mr-3 mt-0.5 flex-shrink-0">✓</span>
                  <span>Recent collected data entry</span>
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* API System Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-10 items-center max-w-[1400px] mx-auto">
            {/* Left Column - Text Content */}
            <div className="text-left order-2 lg:order-1">
              <div className="mb-3 lg:mb-4">
                <span className="inline-block text-indigo-600 text-xs md:text-sm font-semibold uppercase tracking-wider">
                  API SYSTEM
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-4 lg:mb-6">
                Developer ready
              </h2>

              <p className="text-base md:text-lg text-gray-600 mb-4 lg:mb-6 leading-relaxed">
                Fully featured & easy to use API system for developers.
              </p>

              <ul className="space-y-2 md:space-y-3">
                <li className="flex items-center text-sm md:text-base text-gray-600">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-green-100 mr-3 flex-shrink-0">
                    <svg className="w-3 h-3 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                  </span>
                  <span>Websites</span>
                </li>
                <li className="flex items-center text-sm md:text-base text-gray-600">
                  <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-green-100 mr-3 flex-shrink-0">
                    <svg className="w-3 h-3 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                  </span>
                  <span>Website statistics</span>
                </li>
              </ul>
            </div>

            {/* Right Column - Code Block */}
            <div className="flex items-center justify-center order-1 lg:order-2 mb-6 lg:mb-0 mt-4 sm:mt-0 w-full">
              <pre className="bg-gray-900 text-gray-100 p-4 md:p-6 rounded-lg overflow-x-auto w-full text-xs md:text-sm leading-relaxed font-mono" style={{ boxShadow: '0 4px 16px rgba(0,0,0,0.2)' }}>
                <code>{`curl --request POST \\
  --url 'https://www.gappsy.com/demo/api/campaigns' \\
  --header 'Authorization: Bearer `}<span style={{ color: '#60a5fa' }}>{`{api_key}`}</span>{`' \\
  --header 'Content-Type: multipart/form-data' \\
  --form 'name=`}<span style={{ color: '#34d399' }}>{`Example`}</span>{`' \\
  --form 'domain=`}<span style={{ color: '#34d399' }}>{`example.com`}</span>{`' \\`}</code>
              </pre>
            </div>
          </div>
        </div>

        {/* Pricing Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16 md:mt-20 lg:mt-20 mb-16 md:mb-20 lg:mb-20">
          <div className="max-w-[1400px] mx-auto">
            <div className="text-center mb-8 md:mb-12">
              <h2 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 mb-3 md:mb-4">
                Simple, transparent pricing.
              </h2>
              <p className="text-base md:text-lg text-gray-600">
                One-time payment. Lifetime access. No monthly fees.
              </p>
            </div>

            <div className="max-w-md mx-auto">
              <div className="bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-xl transition">
                {/* Header */}
                <div className="bg-gray-800 text-white px-6 py-6 md:py-8 text-center">
                  <h3 className="text-xl md:text-2xl font-bold mb-3 md:mb-4">Analytics Plan</h3>
                  <div className="text-4xl md:text-5xl font-bold mb-2">$497</div>
                  <p className="text-gray-300 text-xs md:text-sm">One-time payment. No monthly fees.</p>
                </div>

                {/* Features List */}
                <div className="px-6 py-6 md:py-8 space-y-3 md:space-y-4">
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">Use Gappsy Analytics on 1 website</span>
                  </div>
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">250,000 visitors a month</span>
                  </div>
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">25,000 heatmaps</span>
                  </div>
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">25,000 session replays</span>
                  </div>
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">25,000 goals a month</span>
                  </div>
                  <div className="flex items-start">
                    <svg className="w-5 h-5 text-green-500 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <span className="text-sm md:text-base text-gray-700">Everything is hosted on our servers for free</span>
                  </div>

                  <a href="https://gappsy.thrivecart.com/gappsy-analytics-plan/" target="_blank" rel="noopener noreferrer" className="block w-full mt-4 md:mt-6 text-white py-2 md:py-3 rounded-lg font-semibold transition-all duration-200 text-sm md:text-base text-center" style={{ backgroundColor: '#0A1735' }} onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#0A1735'} onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#0A1735'}>
                    Get Started Now
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* FAQ Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-20 md:mt-28 lg:mt-28 mb-16 md:mb-20 lg:mb-20">
          <div className="text-center mb-8 md:mb-12">
            <h2 className="text-2xl md:text-3xl lg:text-3xl font-bold text-gray-900 mb-1 md:mb-2">
              Answers for your common questions
            </h2>
          </div>

          <div className="max-w-3xl mx-auto space-y-3 md:space-y-4">
            {[
              { question: 'What is Gappsy Analytics?', answer: 'A simple, privacy-first web analytics platform with session replays, heatmaps, and visitor behavior insights.' },
              { question: 'Do I have to pay monthly fees?', answer: 'No — you pay once for lifetime access. There are no monthly subscriptions.' },
              { question: 'Can I track multiple websites?', answer: 'Yes — you can track multiple websites with your single lifetime plan.' },
              { question: 'Is my data private?', answer: 'Yes — we never sell your data. You fully own your analytics and can delete everything at any time.' },
              { question: 'How difficult is the setup?', answer: 'Setup is simple. Copy and paste one lightweight tracking script into your website, and analytics start instantly.' },
              { question: 'Can I replay visitor sessions?', answer: 'Yes — you can replay user sessions to see clicks, scrolls, interactions, and user behavior in detail.' },
              { question: 'Does it support real-time analytics?', answer: 'Yes — you can see real-time visitors, device types, locations, and the pages they are on at that exact moment.' },
              { question: 'Does it include heatmaps?', answer: 'Yes — heatmaps are included so you can visually understand which parts of your website get the most attention.' },
              { question: 'Is this better than Google Analytics?', answer: 'Gappsy Analytics focuses on simplicity, privacy, lifetime access, and visual insights like sessions and heatmaps that Google Analytics does not provide in the same way.' },
            ].map((faq, index) => (
              <details key={index} className="bg-white border border-gray-200 rounded-2xl p-4 md:p-6 hover:shadow-md transition">
                <summary className="font-bold text-sm md:text-base text-gray-900 cursor-pointer flex justify-between items-start gap-3">
                  <span className="text-left">{faq.question}</span>
                  <svg className="w-5 h-5 text-gray-500 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                  </svg>
                </summary>
                <p className="mt-3 md:mt-4 text-sm md:text-base text-gray-600 leading-relaxed">{faq.answer}</p>
              </details>
            ))}
          </div>
        </div>

        <div className="my-8 md:my-12"></div>
      </main>

      <FooterWrapper />
    </div>
  );
}
