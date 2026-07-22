import { useEffect } from 'react';
import { Code2 } from 'lucide-react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';

export default function GappsyProofPage() {
  useEffect(() => {
    document.title = 'Increase Trust with Social Proof Popups - Gappsy Proof';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Increase conversions and site growth with Gappsy Proof social proof notifications. GDPR, CCPA, and PECR compliant. Display real-time activity to build trust with your visitors.');
    }
  }, []);

  return (
    <div className="app bg-white">
      <Top25Header stateSlug="" type="product" />

      <main className="overflow-x-hidden pt-4 sm:pt-28 lg:pt-32">
        {/* Hero Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-10 items-center max-w-[1400px] mx-auto mb-12">
            {/* Left Column - Text Content */}
            <div className="text-left">
              <div className="mb-2">
                <span className="inline-block bg-indigo-600 text-white text-sm font-semibold px-4 py-2 rounded-lg">
                  GDPR, CCPA, and PECR compliant
                </span>
              </div>
              <h1 className="text-2xl md:text-3xl lg:text-4xl font-bold text-gray-900 leading-tight mb-6">
                <span className="text-indigo-600">Increase Trust</span> with<br />Social Proof Popups.
              </h1>

              <p className="text-xl text-gray-600 mb-2 flex items-center">
                <svg className="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd"/>
                </svg>
                <span><strong>935 notifications created </strong>by our users.</span>
              </p>

              <p className="text-xl text-gray-600 mb-2 flex items-center">
                <svg className="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd"/>
                </svg>
                <span><strong>707K displayed notifications </strong>across the web.</span>
              </p>

              <p className="text-xl text-gray-600 mb-8 flex items-center">
                <svg className="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd"/>
                </svg>
                <span>Trusted by <strong>783 happy customers</strong>.</span>
              </p>

              <div className="mt-5">
                <a href="#pricing" className="inline-block bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-600">
                  Get started →
                </a>
              </div>
            </div>

            {/* Right Column - Image */}
            <div className="flex items-center justify-center">
              <img
                src="/assets/gappsy_proof_-_notifications_-_.png"
                alt="Social proof popup examples including flash sale, newsletter signup, live visitor counter, product reviews, emoji feedback, cookie notification, coupon code, and support chat widgets"
                className="w-full h-auto"
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 16px rgba(0,0,0,0.08)'
                }}
              />
            </div>
          </div>
        </div>

        {/* Three Steps Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-12 md:mt-10">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-xl transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-16 h-16 bg-gray-100 rounded-2xl flex items-center justify-center mr-4">
                  <Code2 className="w-8 h-8 text-gray-700" />
                </div>
                <div>
                  <h2 className="text-xl font-bold mb-2">Install pixel</h2>
                  <p className="text-gray-600 m-0">With just one line of code</p>
                </div>
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-xl transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-16 h-16 bg-gray-100 rounded-2xl flex items-center justify-center mr-4">
                  <svg className="w-8 h-8 text-gray-700" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clipRule="evenodd"/>
                  </svg>
                </div>
                <div>
                  <h2 className="text-xl font-bold mb-2">Create widgets</h2>
                  <p className="text-gray-600 m-0">Setup & customize them</p>
                </div>
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-8 hover:shadow-xl transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-16 h-16 bg-gray-100 rounded-2xl flex items-center justify-center mr-4">
                  <svg className="w-8 h-8 text-gray-700" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                  </svg>
                </div>
                <div>
                  <h2 className="text-xl font-bold mb-2">Display popups</h2>
                  <p className="text-gray-600 m-0">Easily increase social proof</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Easy Integration Section */}
        <div className="py-10 mt-16 md:mt-10">
          <div className="py-6 bg-gray-100 rounded-2xl">
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
              <div className="text-center">
                <h2 className="text-3xl font-bold text-gray-900 mb-3">Easy setup & integration on <span className="text-indigo-600">any website</span>.</h2>
                <p className="text-gray-600">
                  <svg className="inline w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clipRule="evenodd"/>
                  </svg>
                  Copy and paste <span className="font-bold">one line of code</span> into your website.
                </p>
              </div>

              <div className="mt-8 flex justify-center">
                <img
                  src="/images/gappsy-proof/integration_gappsy_proof.webp"
                  alt="Gappsy Proof integrations with major website platforms including Shopify, WordPress, WooCommerce, Wix, Magento, Google Tag Manager, PrestaShop, BigCommerce, Laravel, and Vue Storefront"
                  className="max-w-full h-auto"
                  style={{ maxWidth: 'min(100%, 750px)', width: '100%', paddingLeft: '12px', paddingRight: '12px', boxSizing: 'border-box' }}
                />
              </div>
            </div>
          </div>
        </div>

        {/* Notification Types Grid */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-20 md:mt-16">
          <div className="text-center mb-8">
            <h2 className="text-3xl font-bold text-gray-900 mb-3">Notification preview</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              { name: 'Informational', icon: 'ℹ️', color: 'bg-pink-100 text-pink-600', desc: 'Fully customizable informational message for your users.' },
              { name: 'Coupon', icon: '🎫', color: 'bg-red-100 text-red-600', desc: 'The best way to let your users know that you are running a sale.' },
              { name: 'Live Counter', icon: '🌍', color: 'bg-rose-100 text-rose-600', desc: 'Display online visitors counter on your site to create more trust.' },
              { name: 'Email Collector', icon: '✉️', color: 'bg-red-100 text-red-600', desc: 'Easily collect emails and generate leads from your users.' },
              { name: 'Conversions', icon: '💰', color: 'bg-orange-100 text-orange-600', desc: 'Improve social proof by displaying recent conversions.' },
              { name: 'Conversions Counter', icon: '💬', color: 'bg-orange-100 text-orange-600', desc: 'Display the number of recent conversions.' },
              { name: 'Video', icon: '🎥', color: 'bg-amber-100 text-amber-600', desc: 'Easily display a small widget with an informative YouTube video.' },
              { name: 'Audio', icon: '🔊', color: 'bg-yellow-100 text-yellow-600', desc: 'Embed a simple and nice looking audio player widget.' },
              { name: 'Social Share', icon: '🔗', color: 'bg-lime-100 text-lime-600', desc: 'Let others share your website and generate social proof.' },
              { name: 'Reviews', icon: '⭐', color: 'bg-green-100 text-green-600', desc: 'Display a review/testimonial from your clients to create social proof.' },
              { name: 'Emoji Feedback', icon: '😊', color: 'bg-emerald-100 text-emerald-600', desc: 'An interactive way for your users to give you feedback about your site.' },
              { name: 'Cookie Notification', icon: '🍪', color: 'bg-teal-100 text-teal-600', desc: 'Notify your users that you are using cookies on your site.' },
              { name: 'Score Feedback', icon: '🔢', color: 'bg-cyan-100 text-cyan-600', desc: 'The easiest way for your users to give you a score feedback.' },
              { name: 'Request Collector', icon: '👤', color: 'bg-sky-100 text-sky-600', desc: 'Collecting leads has never been easier with the request collector.' },
              { name: 'Countdown Collector', icon: '⏰', color: 'bg-[#E8ECFA] text-indigo-600', desc: 'Create urgency with a countdown timer for lead generation.' },
              { name: 'Custom HTML', icon: '💻', color: 'bg-indigo-100 text-indigo-600', desc: 'Write your own fully-personalized & customizable notification widget.' },
            ].map((notification, index) => (
              <div key={index} className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className={`flex-shrink-0 w-12 h-12 ${notification.color} rounded-xl flex items-center justify-center mr-3`}>
                    <span className="text-2xl">{notification.icon}</span>
                  </div>
                  <div>
                    <div className="font-bold text-gray-900 mb-1">{notification.name}</div>
                  </div>
                </div>
                <p className="text-sm text-gray-600">{notification.desc}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Integrations Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-28 md:mt-24">
          <div className="bg-white border border-gray-200 rounded-2xl p-8 shadow-sm">
            <div className="text-center mb-8">
              <h2 className="text-3xl font-bold text-gray-900 mb-3">Notifications for your conversions 🔔</h2>
              <p className="text-gray-600">Countless notification integrations for when your visitors submit data through your widgets.</p>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-5 gap-6">
              <div className="bg-gray-100 rounded-2xl p-6 text-center hover:shadow-md transition">
                <div className="text-3xl mb-2">📡</div>
                <div className="font-semibold text-gray-900">Webhook</div>
              </div>
              <div className="bg-gray-100 rounded-2xl p-6 text-center hover:shadow-md transition">
                <div className="text-3xl mb-2">💬</div>
                <div className="font-semibold text-gray-900">Slack</div>
              </div>
              <div className="bg-gray-100 rounded-2xl p-6 text-center hover:shadow-md transition">
                <div className="text-3xl mb-2">🎮</div>
                <div className="font-semibold text-gray-900">Discord</div>
              </div>
              <div className="bg-gray-100 rounded-2xl p-6 text-center hover:shadow-md transition">
                <div className="text-3xl mb-2">📨</div>
                <div className="font-semibold text-gray-900">Telegram</div>
              </div>
              <div className="bg-gray-100 rounded-2xl p-6 text-center hover:shadow-md transition">
                <div className="text-3xl mb-2">🏢</div>
                <div className="font-semibold text-gray-900">Microsoft Teams</div>
              </div>
            </div>
          </div>
        </div>

        {/* API Developer Section */}
        <div className="py-12 mt-20 md:mt-16">
          <div className="container mx-auto px-4 sm:px-6 lg:px-8">
            <div className="grid md:grid-cols-2 gap-12 items-center">
              <div>
                <div className="text-sm font-semibold text-indigo-600 uppercase mb-3">API SYSTEM</div>
                <h2 className="text-3xl font-bold text-gray-900 mb-4">Developer ready</h2>
                <p className="text-gray-600 mb-6">Fully featured & easy to use API system for developers.</p>

                <div className="grid grid-cols-2 gap-4 mb-6">
                  <div>
                    <div className="text-sm text-gray-600 mb-2">
                      <svg className="inline w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                      </svg>
                      Campaigns
                    </div>
                    <div className="text-sm text-gray-600 mb-2">
                      <svg className="inline w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                      </svg>
                      Campaign notifications
                    </div>
                  </div>
                  <div>
                    <div className="text-sm text-gray-600 mb-2">
                      <svg className="inline w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                      </svg>
                      Notification handlers
                    </div>
                    <div className="text-sm text-gray-600 mb-2">
                      <svg className="inline w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                      </svg>
                      Custom domains
                    </div>
                  </div>
                </div>
              </div>

              <div>
                <div className="bg-gray-900 text-white rounded-2xl p-6 font-mono text-sm">
                  <div className="text-green-400">curl --request POST \</div>
                  <div className="text-green-400">--url 'https://www.gappsy.com/proof/api/campaigns' \</div>
                  <div className="text-green-400">--header 'Authorization: Bearer <span className="text-[#E8ECFA]">{'{'}api_key{'}'}</span>' \</div>
                  <div className="text-green-400">--header 'Content-Type: multipart/form-data' \</div>
                  <div className="text-green-400">--form 'name=<span className="text-[#E8ECFA]">Example</span>' \</div>
                  <div className="text-green-400">--form 'domain=<span className="text-[#E8ECFA]">example.com</span>' \</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Testimonials Section */}
        <div className="py-16 bg-[#F4F6FB] mt-20 md:mt-16">
          <div className="container mx-auto px-4 sm:px-6 lg:px-8">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-bold text-gray-900 mb-2">Why people love us ✓</h2>
            </div>

            <div className="grid md:grid-cols-3 gap-8">
              <div className="bg-white border border-gray-200 rounded-2xl p-8 shadow-sm hover:shadow-lg transition">
                <div className="mb-4">
                  <div className="font-bold text-gray-900">Andrea Wilson</div>
                  <div className="text-sm text-gray-600">Editor, Writer's Weekly</div>
                </div>
                <p className="text-gray-600">
                  <span className="text-2xl text-gray-400">"</span>
                  This platform completely transformed the way we manage our workflows. It's intuitive, fast, and has saved our team countless hours every week.
                  <span className="text-2xl text-gray-400">"</span>
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-8 shadow-sm hover:shadow-lg transition">
                <div className="mb-4">
                  <div className="font-bold text-gray-900">George Parker</div>
                  <div className="text-sm text-gray-600">Founder, BrightPath Solutions</div>
                </div>
                <p className="text-gray-600">
                  <span className="text-2xl text-gray-400">"</span>
                  I was skeptical at first, but within days, I saw how much more productive our team became. The support team is also incredibly responsive.
                  <span className="text-2xl text-gray-400">"</span>
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-8 shadow-sm hover:shadow-lg transition">
                <div className="mb-4">
                  <div className="font-bold text-gray-900">Calvin Mitchell</div>
                  <div className="text-sm text-gray-600">CEO, FlowWorks Inc.</div>
                </div>
                <p className="text-gray-600">
                  <span className="text-2xl text-gray-400">"</span>
                  We've tried multiple tools before, but nothing comes close to this. The onboarding was smooth, and our entire team was up and running in no time.
                  <span className="text-2xl text-gray-400">"</span>
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Pricing Section - MODIFIED FOR LIFETIME ONLY */}
        <div id="pricing" className="container mx-auto px-4 sm:px-6 lg:px-8 mt-32 md:mt-32">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Simple, transparent pricing.</h2>
            <p className="text-gray-600">Choose the plan that is right for you and your budget.</p>
          </div>

          <div className="max-w-md mx-auto">
            <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-200">
              <div className="bg-gradient-to-br from-gray-800 to-gray-700 p-8 text-white text-center">
                <h3 className="text-2xl font-bold mb-4">Lifetime Access</h3>
                <div className="text-5xl font-bold mb-2">$287</div>
                <div className="text-[#E8ECFA]">One-time payment. No monthly fees.</div>
              </div>

              <div className="p-8">
                <ul className="space-y-4 mb-8">
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <strong>Unlimited</strong>&nbsp;Campaigns
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <strong>Unlimited</strong>&nbsp;Notifications
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    <strong>Unlimited</strong>&nbsp;impressions
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    All notifications enabled
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    No ads
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Removable branding
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Custom branding
                  </li>
                  <li className="flex items-center text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    API access
                  </li>
                </ul>

                <a href="https://gappsy.thrivecart.com/gappsy-proof-lifetime-plan/" target="_blank" rel="noopener noreferrer" className="block w-full bg-indigo-600 text-white text-center font-semibold py-2 rounded-lg transition-all duration-200 hover:bg-indigo-600">
                  Choose plan
                </a>
              </div>
            </div>
          </div>
        </div>

        {/* FAQ Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-28 md:mt-24">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-2">
              <span className="text-indigo-600">Answers</span> for your common <span className="text-indigo-600">questions</span>
            </h2>
          </div>

          <div className="max-w-3xl mx-auto space-y-4">
            {[
              { question: 'How do I get started?', answer: 'Simply sign up for an account and follow the onboarding steps. You\'ll be ready to use the platform in just a few minutes.' },
              { question: 'Do you offer customer support?', answer: 'Yes, our support team is available 24/7 via email and live chat. We aim to respond to all inquiries within a few hours.' },
              { question: 'Is my data secure?', answer: 'We take data security seriously. All information is encrypted and backed up regularly to ensure your data is safe and protected.' },
              { question: 'Will I need technical skills to use this?', answer: 'Not at all. Our platform is designed to be user-friendly, with no coding required to get started.' },
              { question: 'What makes this different from other tools?', answer: 'We focus on simplicity and performance. Our platform is lightweight, easy to use, and designed to help you achieve results faster.' },
            ].map((faq, index) => (
              <details key={index} className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-md transition">
                <summary className="font-bold text-gray-900 cursor-pointer flex justify-between items-center">
                  <span>{faq.question}</span>
                  <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                  </svg>
                </summary>
                <p className="mt-4 text-gray-600">{faq.answer}</p>
              </details>
            ))}
          </div>
        </div>

        <div className="my-12"></div>
      </main>

      <FooterWrapper />
    </div>
  );
}
