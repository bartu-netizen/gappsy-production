import { useEffect } from 'react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';
import {
  Calendar,
  Lock,
  ShoppingCart,
  CreditCard,
  Tag,
  Gift,
  Utensils,
  Ticket,
  Monitor,
  Users,
  Radio,
  Bell,
  Mail,
  HelpCircle,
  FileText,
  MessageSquare,
  Share2,
  Store,
  MapPin,
  Cloud,
  Map
} from 'lucide-react';

export default function AppbuilderPage() {
  useEffect(() => {
    document.title = 'Native Mobile App Builder - Gappsy Appbuilder';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Build your no-code Android & iOS mobile app today. Simply drag & drop. Pay a one time fee and get Lifetime access. Hosting is included for free.');
    }
  }, []);

  return (
    <div className="app bg-white">
      <Top25Header stateSlug="" type="product" />

      <main className="overflow-x-hidden pt-4 sm:pt-28 lg:pt-32">
        {/* Hero Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-[42%_58%] gap-8 lg:gap-10 items-start lg:items-center mb-12">
            {/* Left Column - Text Content */}
            <div className="text-left order-1 lg:order-none">
              <div className="mb-6">
                <span className="inline-block bg-indigo-600 text-white text-sm font-semibold px-4 py-2 rounded-lg">
                  Lifetime Access • No Monthly Fees
                </span>
              </div>
              <h1 className="text-2xl sm:text-2xl md:text-3xl lg:text-3xl font-bold text-gray-900 leading-tight mb-5">
                <span className="text-indigo-600">Native Mobile App Builder.</span><br />
                Create a no-code Android & iOS mobile app.
              </h1>

              <p className="text-sm sm:text-base text-gray-600 mb-6 max-w-xl">
                Build your app today. Simply drag & drop. <strong>Pay a one time fee and get Lifetime access. Hosting is included for free.</strong>
              </p>

              <div className="mb-6 flex justify-center lg:justify-start">
                <img
                  src="/gappsy-appbuilder-replacing-.webp"
                  alt="Replaces bubble, Adalo, thunkable, appypie & more"
                  className="max-w-full h-auto"
                  style={{ maxWidth: '500px', width: '100%' }}
                />
              </div>

              <div className="w-full sm:w-auto">
                <a href="#pricing" className="w-full sm:w-auto inline-block text-center bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-600">
                  Get Lifetime Access →
                </a>
              </div>
            </div>

            {/* Right Column - Video */}
            <div className="w-full order-2 lg:order-none mt-8 lg:mt-0">
              <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
                <iframe
                  src="https://player.vimeo.com/video/466202056?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479"
                  className="absolute top-0 left-0 w-full h-full rounded-lg shadow-lg"
                  frameBorder="0"
                  allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"
                  referrerPolicy="strict-origin-when-cross-origin"
                  title="Build your own Mobile App with Gappsy!"
                ></iframe>
              </div>
            </div>
          </div>
        </div>

        {/* Build Advanced Section */}
        <div className="py-10 mt-10">
          <div className="py-8 sm:py-6 bg-gray-100 rounded-2xl">
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
              <div className="text-center px-2">
                <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-8">
                  Build <span className="text-indigo-600">advanced</span> mobile apps easily.
                </h2>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-4 gap-4 sm:gap-6 max-w-5xl mx-auto">
                <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-8 hover:shadow-xl transition text-center">
                  <div className="w-16 h-16 bg-indigo-600 bg-opacity-10 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span className="text-2xl sm:text-3xl font-bold text-indigo-600">1</span>
                  </div>
                  <h3 className="font-bold text-gray-900 mb-2">Get our Lifetime Deal</h3>
                </div>

                <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-8 hover:shadow-xl transition text-center">
                  <div className="w-16 h-16 bg-indigo-600 bg-opacity-10 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span className="text-2xl sm:text-3xl font-bold text-indigo-600">2</span>
                  </div>
                  <h3 className="font-bold text-gray-900 mb-2">Create a layout</h3>
                </div>

                <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-8 hover:shadow-xl transition text-center">
                  <div className="w-16 h-16 bg-indigo-600 bg-opacity-10 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span className="text-2xl sm:text-3xl font-bold text-indigo-600">3</span>
                  </div>
                  <h3 className="font-bold text-gray-900 mb-2">Add features</h3>
                </div>

                <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-8 hover:shadow-xl transition text-center">
                  <div className="w-16 h-16 bg-indigo-600 bg-opacity-10 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span className="text-2xl sm:text-3xl font-bold text-indigo-600">4</span>
                  </div>
                  <h3 className="font-bold text-gray-900 mb-2">Publish your app</h3>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Place for Lifelong Customers Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16">
          <div className="bg-[#F4F6FB] rounded-2xl p-8 sm:p-12 text-center">
            <p className="text-xs sm:text-sm text-gray-600 mb-3 uppercase tracking-wider font-semibold">
              People Spend 89% of their Daily Smartphone Usage on APPS
            </p>
            <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-2 leading-snug">
              The Place for Attracting, Nurturing & Maintain Lifelong
            </h2>
            <h3 className="text-xl sm:text-2xl md:text-3xl font-bold text-indigo-600 underline">
              Customers & Clients.
            </h3>
          </div>
        </div>

        {/* Subtitle */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-12">
          <div className="text-center">
            <p className="text-sm font-semibold text-indigo-600 uppercase tracking-wider">
              Flexible, advanced & modern.
            </p>
          </div>
        </div>

        {/* Features Header */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-8">
          <div className="text-center mb-12">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">
              The Gappsy Appbuilder Features.
            </h2>
          </div>
        </div>

        {/* Organization Features */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16">
          <div className="mb-12">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-8">Organization Features.</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3 flex-shrink-0">
                  <Calendar className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Appointment Planner</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Manage your appointments like a pro. Build Complex and efficient Appointment flow with admin management, manage multiple stores, services and providers from one place.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3 flex-shrink-0">
                  <Calendar className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Calendar</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Create an agenda that reflects users' about next events. Connect the calendar with any API, Facebook page, or Google Calendar. You can also Create your own custom events.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <Lock className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Content Lock</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Control your content Access. You can lock entire app or specific pages to members only membership through payment or via QR Code or even custom CSS to this text in the module Advanced settings.
              </p>
            </div>
          </div>
        </div>

        {/* Monetization Features */}
        <div className="py-12 mt-16 bg-gray-50">
          <div className="container mx-auto px-4 sm:px-6 lg:px-8">
            <div className="mb-12">
              <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-8">Monetization Features.</h2>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <ShoppingCart className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Mcommerce</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  The complete feature to sell online, from a single item to a chain of stores. Image recognition, scanner, shipping, stocks, reviews, checkout, notes, payment gateways - everything you need for selling your products is in your users' hands.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <CreditCard className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Loyalty Card</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Your very own loyalty program. In one app, you can add so many loyalty cards as you want. The user can get his points by scanning, for example, with each merchant having its own program. The user can get his points redeemed by personal or QR code. It's up to you.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Monitor className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">AdMob</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Monetize your app with ads. Just copy your ads ID from your Admob account and paste it in your app preferences. You can earn money through interstitial full screen ads or with classical banners.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Tag className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Discount</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Put the store logo inline with simple, high-performance discounts. Collect users data from your coupons are redeemed. Configure them to be used only once and/or available until a specific date.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Ticket className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">QR Coupons</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Whether to reward or attract your users or improve your newsletter opening by distributing your own QR Codes to your users. User just flash the code and they unlock the rewards in your application.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Utensils className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Meals</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  A nice and appealing way to display your menus. Create cards with photos, prices and descriptions.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Gift className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Scratch Card</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Use this to make your users win set rewards. Like in real life they just have to scratch to discover if they won or not. You can set the number or winners, the percentage of chance to win, and the games to be played once or multiple times.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Monitor className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Iframe</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Integrate iframe in your app. This could be useful, if you want a specific feature that Gappsy does not have. You could get that feature on your website, and then integrate that specific page on your website.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Users className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Invite-a-friend</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Referral system to grow your app user base. Reward users for referring their people to your app. Every app user automatically gets their own unique referral link that tracks every download of the app. You can automatically reward referrers with points.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Radio className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Radio</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Integrate your radio show into your app by simply filling in the link to your radio.
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Communication Features */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16">
          <div className="mb-12">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-8">Communication Features.</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <Bell className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Push Notifications</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Contact your users whenever you want and wherever the need arises. Not unlimited. Schedule your notifications to be sent on specific dates and times or to specific sections of Users even by geolocation.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <Mail className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Inbox</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Send private messages with rich content and attachments to your App users? private message system for users with texts, images and attachments right in the inbox.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <HelpCircle className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Quiz</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                So many Quiz apps available on the app store? Because it's fun! and now you can in a few clicks.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <FileText className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Forms</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Your content goes here. Edit or remove this text inline or in the module Content settings. You can also style every aspect of this content in the module Design settings and even apply custom CSS to this text in the module Advanced settings.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <MessageSquare className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Chat System</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                With this live-chat system, app users can chat 1-on-1 or in group chats.
              </p>
            </div>

            <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
              <div className="flex items-start mb-4">
                <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                  <Share2 className="w-6 h-6 text-indigo-600" />
                </div>
                <div>
                  <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Social Wall</h3>
                </div>
              </div>
              <p className="text-xs sm:text-sm text-gray-600">
                Your very own Social Media System. App users can post on the Social wall and respond to each others posts. They can like and comment on the posts.
              </p>
            </div>
          </div>
        </div>

        {/* Local Features */}
        <div className="py-12 mt-16 bg-gray-50">
          <div className="container mx-auto px-4 sm:px-6 lg:px-8">
            <div className="mb-12">
              <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-8">Local Features.</h2>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Store className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Marketplace</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Launch your own Craigslist-like app. With this feature, you can now add a local classified ads marketplace for your users to buy and sell. Like any marketplace seller can post their offer products to be purchased! just like craiglist.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <MapPin className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Places</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  If you need to create a directory of businesses, this feature is for you! Add useful information in your mobile app with a directory of nearby places and points of interest.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Cloud className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Weather</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  A simple and pleasant feature for your users. Let them look for the weather in their city and by default display the current weather in a specific country or city.
                </p>
              </div>

              <div className="bg-white border border-gray-200 rounded-2xl p-6 hover:shadow-lg transition">
                <div className="flex items-start mb-4">
                  <div className="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mr-3">
                    <Map className="w-6 h-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="font-bold text-sm sm:text-base text-gray-900 mb-1">Maps</h3>
                  </div>
                </div>
                <p className="text-xs sm:text-sm text-gray-600">
                  Let your users find their pets from anywhere in the world to the location you want. A feature which will guide them through the road to find a specific place to reach the appropriate path through Google Maps.
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Other Features */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-16">
          <div className="text-center">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-4">And many more features...</h2>
            <p className="text-base sm:text-lg md:text-xl text-gray-600 max-w-2xl mx-auto px-2">
              Build the perfect mobile app for your business with dozens of additional features and customization options.
            </p>
          </div>
        </div>

        {/* Integrations Section */}
        <div className="py-12 mt-16">
          <div className="py-8 sm:py-6 bg-gray-100 rounded-2xl">
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
              <div className="text-center mb-8">
                <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-3">
                  Easy setup & integration on <span className="text-indigo-600">any platform</span>.
                </h2>
                <p className="text-sm sm:text-base text-gray-600">
                  Connect your app with the tools you already use.
                </p>
              </div>

              <div className="mt-8 flex justify-center px-2">
                <img
                  src="/connect_your_app_section_logo's.webp"
                  alt="Connect your app with popular platforms"
                  className="max-w-full h-auto"
                  style={{ maxWidth: '750px', width: '100%' }}
                />
              </div>
            </div>
          </div>
        </div>

        {/* Customer Reviews Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-24 md:mt-32 mb-32 md:mb-24">
          <div className="text-center mb-16 px-2">
            <p className="text-xs sm:text-sm text-gray-600 mb-3">
              Just Some Businesses that have created their APPS without Knowing a Single Line of Code.
            </p>
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">
              Customer Reviews.
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-10 max-w-[1200px] mx-auto items-start px-2">
            {/* Greg Jasnikowski - BBG FIT */}
            <div className="review-card flex flex-col items-center text-center">
              <p className="review-role text-xs sm:text-sm text-gray-600 mb-2 h-5">Founder of BBG FIT.</p>
              <h3 className="review-name text-base sm:text-lg font-bold text-gray-900 mb-4 h-7">Greg Jasnikowski</h3>
              <img
                src="/logos/greg-jasnikowski-gappsy-appbuilder.jpeg"
                alt="BBG FIT Logo"
                className="review-logo h-[90px] w-[90px] object-contain mx-auto mb-4"
              />
              <div className="review-video-wrapper w-full max-w-[420px] mx-auto">
                <div className="relative w-full overflow-hidden rounded-xl shadow-lg" style={{ aspectRatio: '16 / 9' }}>
                  <iframe
                    src="https://player.vimeo.com/video/414529464?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479"
                    className="absolute top-0 left-0 w-full h-full"
                    frameBorder="0"
                    allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"
                    referrerPolicy="strict-origin-when-cross-origin"
                    title="Customer Review - Greg Jasnikowski - BBG FIT"
                  ></iframe>
                </div>
              </div>
            </div>

            {/* Jeff Douglas - Strange Soundz Radio */}
            <div className="review-card flex flex-col items-center text-center">
              <p className="review-role text-xs sm:text-sm text-gray-600 mb-2 h-5">Founder of Strange Soundz Radio.</p>
              <h3 className="review-name text-base sm:text-lg font-bold text-gray-900 mb-4 h-7">Jeff Douglas</h3>
              <img
                src="/logos/jeff-douglas-gappsy-appbuilder.png"
                alt="Strange Soundz Radio Logo"
                className="review-logo h-[90px] w-[90px] object-contain mx-auto mb-4"
              />
              <div className="review-video-wrapper w-full max-w-[420px] mx-auto">
                <div className="relative w-full overflow-hidden rounded-xl shadow-lg" style={{ aspectRatio: '16 / 9' }}>
                  <iframe
                    src="https://player.vimeo.com/video/414535999?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479"
                    className="absolute top-0 left-0 w-full h-full"
                    frameBorder="0"
                    allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"
                    referrerPolicy="strict-origin-when-cross-origin"
                    title="Customer Review - Jeff Douglas - Strange Soundz Radio"
                  ></iframe>
                </div>
              </div>
            </div>

            {/* Alston Antony - SaaS Pirate */}
            <div className="review-card flex flex-col items-center text-center">
              <p className="review-role text-xs sm:text-sm text-gray-600 mb-2 h-5">Founder of SaaS Pirate.</p>
              <h3 className="review-name text-base sm:text-lg font-bold text-gray-900 mb-4 h-7">Alston Antony.</h3>
              <img
                src="/logos/saaspirate-lifetime-deals-gappsy-appbuilder.jpg"
                alt="SaaS Pirate Logo"
                className="review-logo h-[90px] w-[90px] object-contain mx-auto mb-4"
              />
              <div className="review-video-wrapper w-full max-w-[420px] mx-auto">
                <div className="relative w-full overflow-hidden rounded-xl shadow-lg" style={{ aspectRatio: '16 / 9' }}>
                  <iframe
                    src="https://player.vimeo.com/video/414539842?h=65972e3197"
                    className="absolute top-0 left-0 w-full h-full"
                    frameBorder="0"
                    referrerPolicy="strict-origin-when-cross-origin"
                    allow="autoplay; fullscreen; picture-in-picture; clipboard-write; encrypted-media; web-share"
                    allowFullScreen
                    title="Customer Review - Alston Antony - SaaS Pirate"
                  ></iframe>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Pricing Section */}
        <div id="pricing" className="container mx-auto px-4 sm:px-6 lg:px-8 mt-64 md:mt-32">
          <div className="text-center mb-12 px-2">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-4">Simple, transparent pricing.</h2>
            <p className="text-sm sm:text-base text-gray-600">One-time payment. Lifetime access. No monthly fees.</p>
          </div>

          <div className="w-full sm:max-w-md sm:mx-auto px-2">
            <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-200">
              <div className="bg-gradient-to-br from-gray-800 to-gray-700 p-6 sm:p-8 text-white text-center">
                <h3 className="text-xl sm:text-2xl font-bold mb-4">Business Plan</h3>
                <div className="text-4xl sm:text-5xl font-bold mb-2">$747</div>
                <div className="text-sm sm:text-base text-[#E8ECFA]">One-time payment. No monthly fees.</div>
              </div>

              <div className="p-6 sm:p-8">
                <ul className="space-y-3 sm:space-y-4 mb-8">
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Build 1 iOS, 1 Android & 1 Web App
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Unlimited app downloads & users
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Unlimited Push Notifications a month
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Unlimited Birthday Push Notifications a month
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Unlimited usage of features
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Free hosting. No Storage limits.
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Access to Webhooks
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Place ads in your app and make money
                  </li>
                  <li className="flex items-center text-xs sm:text-sm text-gray-700">
                    <svg className="w-5 h-5 text-green-500 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd"/>
                    </svg>
                    Native website integration.
                  </li>
                </ul>

                <a href="https://gappsy.thrivecart.com/gappsy-appbuilder-business-plan/" target="_blank" rel="noopener noreferrer" className="block w-full bg-indigo-600 text-white text-center font-semibold py-2 sm:py-3 text-sm sm:text-base rounded-lg transition-all duration-200 hover:bg-indigo-600">
                  Get Started Now
                </a>
              </div>
            </div>
          </div>
        </div>

        {/* FAQ Section */}
        <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-20 md:mt-24">
          <div className="text-center mb-12 px-2">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-2 leading-snug">
              <span className="text-indigo-600">Answers</span> for your common <span className="text-indigo-600">questions</span>
            </h2>
          </div>

          <div className="w-full sm:max-w-3xl sm:mx-auto space-y-3 sm:space-y-4 px-2">
            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>How long does it take to create my app?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                You can create your own app within hours thanks to the layouts, features, content and other elements ready at your disposal with the Gappsy Appbuilder. It may take longer if you decide to explore the software further and explore the infinite customization possibilities it offers.
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>Can I earn money with my app?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                Yes, you can. There are several ways to make money with your own app.
                You can use our Google Admob plugin. This plugin allows you to get paid by Google for every user that is on your app. You can calculate how much you would earn by doing this here: https://www.passiveseincomecalculator.com/admob-revenue-calculator/
                <br /><br />
                You could also sell products to your users on the app with our integrated shop plugin.
                <br /><br />
                You could also try to find sponsors personally and ask them to pay you for a promotion on your app.
                Just like influencers on Instagram get paid to mention a company on their Instagram, you could get paid by adding a promotion picture or video of a company in your app.
                <br /><br />
                By the way, all the money that you earn through your app, is yours. You don't have to pay a percentage to us!
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>Can I edit my app after it has been published in the app stores?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                Yes, you can. That's what makes the Gappsy Appbuilder so powerful. You can edit your app even after it has been published in the app stores.
                You can edit it on the Gappsy platform and it will automatically update the app in the app stores and for the users that downloaded the app already.
                <br /><br />
                This doesn't work with some big changes like the background colour of the homescreen of your app or the icon of your app. You also need to republish your app if you want to change your icon layout and/or template of your app.
                <br /><br />
                If you paid for done-for-you publishing, then we will only publish your app once. So please before you decide to publish, make sure that you are satisfied with your layout, template, background image, splashscreen and app icon.
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>How long does it take for my app to be published in the app stores?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                After you submit your app to Apple and Android it can take 1–4 days to be approved by them.
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>Can you help me publish the app?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                Like explained before, you do need your own iOS and Android developer account. This will cost you $99 a year for Apple and $25 once for Android.
                <br /><br />
                We can help you publish your app on your developer accounts.
                We offer a service in which we do this for our clients.
                This service costs $497 (currently at a special deal at $197, you will be able to grab it on the checkout page).
                <br /><br />
                However if you just want to save that money, we will provide you with documentation on how you can publish the app on your own.
                <br /><br />
                More information on publishing here: https://gappsy.com/how-to-publish-your-app/
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>Do I have to pay to publish my app in the app stores?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                Unfortunately, yes… Apple wants every Mobile app to be published by its owner. So if you are building an app for your own Restaurant, you need to pay for a developer account for Apple and publish your own app with your own developer account.
                <br /><br />
                The yearly fee to have your own developer account for Apple is $100 a year.
                <br /><br />
                Because of these new rules we decided that it would be best if we did the same with the Android apps… so if you build an Android app and you want to publish it, you will need your own Android Developer account.
                <br /><br />
                The costs for an Android Developer account is just $25 once.
                There are no recurring costs for that!
              </p>
            </details>

            <details className="bg-white border border-gray-200 rounded-2xl p-4 sm:p-6 hover:shadow-md transition">
              <summary className="font-bold text-sm sm:text-base text-gray-900 cursor-pointer flex justify-between items-center gap-2">
                <span>Will my app get updated?</span>
                <svg className="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd"/>
                </svg>
              </summary>
              <p className="mt-4 text-sm sm:text-base text-gray-600">
                Yes! The Gappsy Appbuilder makes sure that your app stays up to date with the Apple and Android appstores. These automatic daily updates, are free of charge.
              </p>
            </details>
          </div>
        </div>

        <div className="my-12"></div>
      </main>

      <FooterWrapper />
    </div>
  );
}
