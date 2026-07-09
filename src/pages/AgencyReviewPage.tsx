import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { AlertCircle, CheckCircle, XCircle, Building2, MapPin, Users, Globe, TrendingUp, Shield, Calendar, FileText, Target, MessageSquare, ExternalLink, Briefcase, Tag } from 'lucide-react';
import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';
import AgencyReviewSEO from '../components/AgencyReviewSEO';
import AvailabilityModal from '../AvailabilityModal';
import { supabase } from '../lib/supabase';
import { formatLastUpdated } from '../utils/formatLastUpdated';
import { getStateListingUrl } from '../utils/stateListingUrl';

interface AgencyReview {
  id: string;
  agency_name: string;
  agency_slug: string;
  state_name: string;
  state_slug: string;
  city: string | null;
  website_url: string | null;
  agency_type: string;
  services_offered: string[];
  target_clients: string | null;
  geographic_reach: string | null;
  is_top_25_ranked: boolean;
  evaluation_status: string | null;
  headquarters: string | null;
  case_studies_status: string;
  pricing_transparency: string;
  team_information: string;
  independent_recognition: string;
  local_presence: string;
  concerns: string[];
  strengths: string[];
  risk_factors: string[];
  fit_for: string[];
  entity_signals: string[];
  about_description: string | null;
  last_updated: string;
  change_log: any[];
  review_type: string | null;
}

export default function AgencyReviewPage() {
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const [agency, setAgency] = useState<AgencyReview | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [isAvailabilityModalOpen, setIsAvailabilityModalOpen] = useState(false);

  useEffect(() => {
    async function fetchAgencyReview() {
      if (!agencySlug) {
        setError('No agency specified');
        setLoading(false);
        return;
      }

      const { data, error: fetchError } = await supabase
        .from('agency_reviews')
        .select('*')
        .eq('agency_slug', agencySlug)
        .maybeSingle();

      if (fetchError) {
        setError('Failed to load agency review');
        console.error(fetchError);
      } else if (!data) {
        setError('Agency not found');
      } else if (data.is_published === false) {
        setError('Agency not found');
      } else {
        setAgency(data);
      }

      setLoading(false);
    }

    fetchAgencyReview();
  }, [agencySlug]);

  useEffect(() => {
    if (agency && !agency.review_type) {
      console.error(`[CRITICAL] Missing review_type for agency review page: ${agency.agency_slug}`);
      if (import.meta.env.DEV) {
        throw new Error(`review_type is required for agency review pages. Missing for: ${agency.agency_slug}`);
      }
    }
    if (agency && agency.review_type === 'negative' && agency.website_url) {
      console.warn(`[INFO] Website link blocked on negative review page: ${agency.agency_slug}`);
    }
  }, [agency]);

  if (loading) {
    return (
      <div className="app bg-white min-h-screen">
        <Top25Header stateSlug="" type="product" />
        <main className="container mx-auto px-4 py-20 text-center">
          <div className="animate-pulse">Loading agency review...</div>
        </main>
      </div>
    );
  }

  if (error || !agency) {
    return (
      <div className="app bg-white min-h-screen">
        <Top25Header stateSlug="" type="product" />
        <main className="container mx-auto px-4 py-20 text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Agency Not Found</h1>
          <p className="text-gray-600 mb-8">{error || 'This agency review is not available.'}</p>
          <Link to="/marketing-agencies" className="inline-block bg-indigo-600 text-white px-5 sm:px-6 py-2.5 sm:py-3 rounded-lg text-sm sm:text-base hover:bg-indigo-700 transition whitespace-nowrap">
            Browse All Agencies
          </Link>
        </main>
      </div>
    );
  }

  const lastUpdatedDate = formatLastUpdated(agency.last_updated);

  const servicesDisplay = Array.isArray(agency.services_offered)
    ? agency.services_offered.join(', ')
    : agency.services_offered || 'Marketing services';

  return (
    <div className="app bg-white scroll-smooth">
      <AgencyReviewSEO agency={agency} />
      <Top25Header stateSlug={agency.state_slug} type="state" isReviewPage={true} isPositiveReview={agency.is_top_25_ranked} />

      <main className="overflow-x-hidden">

        {/* 1. HERO SECTION - SPLIT LAYOUT */}
        <section className="bg-white">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-8 sm:py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
            <div className="grid items-start gap-8 lg:grid-cols-[1.6fr_0.9fr]">

              {/* LEFT COLUMN - Main Content */}
              <div className="space-y-4 sm:space-y-6">
                <h1 className="text-2xl sm:text-3xl md:text-4xl font-bold tracking-tight text-gray-900 leading-tight">
                  {agency.agency_name} Reviews & Independent Analysis
                </h1>

                <p className="text-base sm:text-lg text-gray-600 leading-relaxed">
                  An independent evaluation of {agency.agency_name}, a marketing agency headquartered in {agency.city || agency.state_name}, {agency.state_name}.
                </p>

                {/* Status Badge - STRICTLY review_type driven */}
                {agency.review_type === 'positive' ? (
                  <div className="inline-flex items-center gap-1.5 sm:gap-2 px-3 sm:px-4 py-1.5 sm:py-2 rounded-lg border bg-green-50 text-green-700 border-green-300">
                    <CheckCircle className="w-4 h-4 sm:w-5 sm:h-5 flex-shrink-0 text-green-600" />
                    <span className="text-xs sm:text-sm font-medium leading-snug">
                      {agency.evaluation_status || `Ranked in the Top 25 marketing agencies in ${agency.state_name}`}
                    </span>
                  </div>
                ) : agency.review_type === 'negative' ? (
                  <div className="inline-flex items-center gap-1.5 sm:gap-2 px-3 sm:px-4 py-1.5 sm:py-2 rounded-lg border bg-red-50 text-red-700 border-red-300">
                    <AlertCircle className="w-4 h-4 sm:w-5 sm:h-5 flex-shrink-0 text-red-600" />
                    <span className="text-xs sm:text-sm font-medium leading-snug">
                      Not ranked among the Top 25 marketing agencies in {agency.state_name}
                    </span>
                  </div>
                ) : null}

                {/* Primary CTA */}
                <div className="pt-2">
                  {agency.review_type === 'negative' ? (
                    <Link
                      to={`/marketing-agencies-in-${agency.state_slug}-united-states/`}
                      className="inline-flex items-center justify-center bg-indigo-600 text-white px-4 sm:px-6 py-2.5 sm:py-3 rounded-lg text-sm sm:text-base font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                    >
                      See better {agency.state_name} agencies
                    </Link>
                  ) : (
                    <button
                      onClick={() => setIsAvailabilityModalOpen(true)}
                      className="inline-flex items-center justify-center bg-indigo-600 text-white px-4 sm:px-6 py-2.5 sm:py-3 rounded-lg text-sm sm:text-base font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                    >
                      Check Availability
                    </button>
                  )}
                </div>
              </div>

              {/* RIGHT COLUMN - Agency Overview Card */}
              <div className="rounded-2xl border border-slate-200 bg-white p-4 sm:p-5 shadow-sm lg:max-w-sm">
                <h2 className="text-xs font-semibold uppercase tracking-wide text-slate-600">Agency overview</h2>

                <div className="mt-3 sm:mt-4 grid gap-2.5 sm:gap-3 sm:grid-cols-2 lg:grid-cols-1">

                  {/* Headquarters */}
                  <div className="flex items-start gap-1.5 sm:gap-2">
                    <MapPin className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                    <div>
                      <div className="text-[11px] uppercase tracking-wide text-slate-500">Headquarters</div>
                      <div className="text-sm font-medium text-slate-900">
                        {agency.city ? `${agency.city}, ${agency.state_name}` : agency.state_name}
                      </div>
                    </div>
                  </div>

                  {/* Founded */}
                  <div className="flex items-start gap-1.5 sm:gap-2">
                    <Calendar className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                    <div>
                      <div className="text-[11px] uppercase tracking-wide text-slate-500">Founded</div>
                      <div className="text-sm font-medium text-slate-900">Not disclosed</div>
                    </div>
                  </div>

                  {/* Team Size */}
                  <div className="flex items-start gap-1.5 sm:gap-2">
                    <Users className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                    <div>
                      <div className="text-[11px] uppercase tracking-wide text-slate-500">Team size</div>
                      <div className="text-sm font-medium text-slate-900">Not disclosed</div>
                    </div>
                  </div>

                  {/* Target Clients */}
                  <div className="flex items-start gap-1.5 sm:gap-2">
                    <Briefcase className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                    <div>
                      <div className="text-[11px] uppercase tracking-wide text-slate-500">Target clients</div>
                      <div className="text-sm font-medium text-slate-900">
                        {agency.target_clients || 'Varies by project'}
                      </div>
                    </div>
                  </div>

                  {/* Primary Services */}
                  <div className="flex items-start gap-1.5 sm:gap-2 sm:col-span-2 lg:col-span-1">
                    <Tag className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                    <div className="flex-1 min-w-0">
                      <div className="text-[11px] uppercase tracking-wide text-slate-500">Primary services</div>
                      <div className="text-sm font-medium text-slate-900 mt-1">
                        {agency.services_offered && agency.services_offered.length > 0 ? (
                          <div className="flex flex-wrap gap-1 sm:gap-1.5">
                            {agency.services_offered.slice(0, 3).map((service, idx) => (
                              <span key={idx} className="inline-block px-1.5 sm:px-2 py-0.5 bg-slate-100 text-slate-700 rounded text-[10px] sm:text-xs whitespace-nowrap">
                                {service}
                              </span>
                            ))}
                            {agency.services_offered.length > 3 && (
                              <span className="inline-block px-1.5 sm:px-2 py-0.5 text-slate-600 text-[10px] sm:text-xs whitespace-nowrap">
                                +{agency.services_offered.length - 3} more
                              </span>
                            )}
                          </div>
                        ) : (
                          'Not specified'
                        )}
                      </div>
                    </div>
                  </div>

                  {/* Website / Fit Check */}
                  {agency.review_type !== 'negative' && (
                    <div className="flex items-start gap-1.5 sm:gap-2 sm:col-span-2 lg:col-span-1">
                      <Globe className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-slate-500 mt-0.5 flex-shrink-0" />
                      <div className="min-w-0">
                        <div className="text-[11px] uppercase tracking-wide text-slate-500">
                          {!agency.is_top_25_ranked ? 'Check fit' : 'Website'}
                        </div>
                        <div className="text-xs sm:text-sm font-medium text-slate-900">
                          {agency.website_url ? (
                            <a
                              href={agency.website_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-flex items-center gap-1 text-indigo-600 hover:text-indigo-700 text-xs"
                            >
                              Visit site
                              <ExternalLink className="w-3 h-3" />
                            </a>
                          ) : (
                            'Not listed'
                          )}
                        </div>
                      </div>
                    </div>
                  )}

                </div>
              </div>

            </div>
          </div>
        </section>

        {/* TABLE OF CONTENTS */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 bg-gray-50 mt-10 sm:mt-12">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <nav className="bg-white border border-gray-200 rounded-xl p-6 md:p-8 shadow-sm" aria-label="Table of Contents">
                <h2 className="text-xl font-bold text-gray-900 mb-6">Table of Contents</h2>
                <ul className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3 md:gap-y-4">
                  {[
                    { id: 'overview', label: 'Overview' },
                    { id: 'public-signals', label: 'Public Signals Reviewed' },
                    ...(agency.concerns && agency.concerns.length > 0 ? [{ id: 'concerns', label: 'Concerns & Red Flags' }] : []),
                    ...(agency.strengths && agency.strengths.length > 0 ? [{ id: 'strengths', label: 'What They Do Well' }] : []),
                    { id: 'comparison', label: 'Comparison vs Top 25 Agencies' },
                    ...(agency.risk_factors && agency.risk_factors.length > 0 ? [{ id: 'risk-factors', label: 'Risk Factors Before Hiring' }] : []),
                    ...(agency.fit_for && agency.fit_for.length > 0 ? [{ id: 'fit-for', label: 'Who This Agency May Be a Fit For' }] : []),
                    { id: 'final-verdict', label: 'Final Verdict' },
                    ...(!agency.is_top_25_ranked ? [{ id: 'better-alternatives', label: 'Better Alternatives' }] : []),
                    { id: 'faq', label: 'Frequently Asked Questions' },
                    ...(agency.about_description ? [{ id: 'about', label: 'About the Agency' }] : []),
                    { id: 'methodology', label: 'Review Methodology' },
                    { id: 'reviewed-by', label: 'Reviewed By Gappsy' }
                  ].map((item) => (
                    <li key={item.id}>
                      <a
                        href={`#${item.id}`}
                        className="text-gray-700 hover:text-indigo-600 hover:underline transition-colors flex items-center gap-2 py-2 md:py-1.5 text-sm md:text-base"
                      >
                        <span className="text-indigo-600">→</span>
                        {item.label}
                      </a>
                    </li>
                  ))}
                </ul>
              </nav>
            </div>
          </div>
        </section>

        {/* Visual Separator */}
        <div className="h-px bg-gray-200"></div>

        {/* 2. LAST UPDATED & CHANGE LOG */}
        {lastUpdatedDate && (
        <section id="overview" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-12 md:py-16">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <div className="bg-slate-50 border border-slate-200 rounded-xl p-6 md:p-8">
                <div className="flex items-start gap-3">
                  <AlertCircle className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <div className="flex-1">
                    <p className="text-sm font-semibold text-blue-900 mb-2">
                      Last Updated: {lastUpdatedDate}
                    </p>
                    <p className="text-sm text-blue-700">
                      This review is based on publicly available information as of {lastUpdatedDate}.
                      We update our reviews regularly and when significant changes occur.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        )}

        {/* 3. PLATFORM CONTEXT */}
        <section className="py-8 sm:py-12 md:py-16">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <div className="bg-slate-50 border-l-4 border-indigo-600 rounded-xl p-6 md:p-8">
                <h2 className="text-xl font-bold text-gray-900 mb-4">
                  Part of the Gappsy Marketing Agency Directory
                </h2>
                <div className="space-y-4">
                  <p className="text-gray-700">
                    This review is part of Gappsy's independent evaluation of marketing agencies across the United States.
                    We analyze agencies based on publicly available information, comparing them against our Top 25 agencies
                    in {agency.state_name}.
                  </p>
                  <p className="text-sm text-gray-600">
                    <strong>Not affiliated:</strong> Gappsy is not affiliated with {agency.agency_name}.
                    This is an independent assessment. Agencies cannot pay to improve their ranking or remove factual reviews.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* NEW: WHY PEOPLE SEARCH FOR REVIEWS */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Why People Search for {agency.agency_name} Reviews
              </h2>
              <div className="bg-white border border-gray-200 rounded-xl p-6 md:p-8 shadow-sm">
                <p className="text-gray-700 mb-6">
                  Users typically search for reviews of {agency.agency_name} for the following reasons:
                </p>
                <ul className="space-y-4">
                  <li className="flex items-start gap-3">
                    <div className="w-6 h-6 bg-indigo-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <span className="text-indigo-600 text-sm font-bold">1</span>
                    </div>
                    <p className="text-gray-700 flex-1">
                      <strong>Evaluating trust and credibility</strong> before hiring a {servicesDisplay.split(',')[0]?.trim() || 'marketing'} agency in {agency.state_name}
                    </p>
                  </li>
                  <li className="flex items-start gap-3">
                    <div className="w-6 h-6 bg-indigo-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <span className="text-indigo-600 text-sm font-bold">2</span>
                    </div>
                    <p className="text-gray-700 flex-1">
                      <strong>Comparing options</strong> between {agency.agency_name} and other agencies in {agency.city || agency.state_name}
                    </p>
                  </li>
                  <li className="flex items-start gap-3">
                    <div className="w-6 h-6 bg-indigo-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <span className="text-indigo-600 text-sm font-bold">3</span>
                    </div>
                    <p className="text-gray-700 flex-1">
                      <strong>Looking for transparency</strong> regarding pricing, case studies, and verified results
                    </p>
                  </li>
                  <li className="flex items-start gap-3">
                    <div className="w-6 h-6 bg-indigo-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <span className="text-indigo-600 text-sm font-bold">4</span>
                    </div>
                    <p className="text-gray-700 flex-1">
                      <strong>Determining fit</strong> — assessing whether {agency.agency_name} matches their business size, industry, and marketing needs
                    </p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        {/* NEW: SEARCH INTENT MATCH EXPLANATION */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <div className="bg-white border-l-4 border-blue-500 rounded-xl p-6 md:p-8 shadow-sm">
                <h3 className="text-lg font-bold text-gray-900 mb-3">
                  What This Review Helps You Decide
                </h3>
                <p className="text-gray-700">
                  This page is designed to help users searching for <strong>"{agency.agency_name} reviews"</strong>,
                  <strong> "should you hire {agency.agency_name}"</strong>, or <strong>"{agency.agency_name} alternatives"</strong> make
                  an informed decision. Our evaluation is based on publicly available information, independent comparison benchmarks
                  against Top 25 agencies in {agency.state_name}, and standardized evaluation criteria applied consistently
                  across all {agency.city ? `${agency.city}, ` : ''}{agency.state_name} marketing agencies as of {lastUpdatedDate}.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* 4. AGENCY AT A GLANCE */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
              {agency.agency_name} at a Glance
            </h2>

              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6">
                <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-shadow">
                  <div className="flex items-start gap-3">
                    <div className="w-10 h-10 bg-indigo-100 rounded-lg flex items-center justify-center flex-shrink-0">
                      <Building2 className="w-5 h-5 text-indigo-600" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-gray-500 mb-1">Headquarters</p>
                      <p className="text-base font-semibold text-gray-900">
                        {agency.headquarters || `${agency.city || agency.state_name}`}
                      </p>
                    </div>
                  </div>
                </div>

                {agency.geographic_reach && (
                  <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div className="flex items-start gap-3">
                      <div className="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <Globe className="w-5 h-5 text-green-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-gray-500 mb-1">Geographic Reach</p>
                        <p className="text-base font-semibold text-gray-900">
                          {agency.geographic_reach}
                        </p>
                      </div>
                    </div>
                  </div>
                )}

                <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-shadow">
                  <div className="flex items-start gap-3">
                    <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0">
                      <Users className="w-5 h-5 text-blue-600" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-gray-500 mb-1">Target Clients</p>
                      <p className="text-base font-semibold text-gray-900">
                        {agency.target_clients || 'Small to mid-sized businesses'}
                      </p>
                    </div>
                  </div>
                </div>

                {agency.services_offered && agency.services_offered.length > 0 && (
                  <div className="bg-white border border-gray-200 rounded-xl p-6 md:col-span-2 lg:col-span-3 shadow-sm hover:shadow-md transition-shadow">
                    <div className="flex items-start gap-3">
                      <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <TrendingUp className="w-5 h-5 text-purple-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-gray-500 mb-3">Services Offered</p>
                        <div className="flex flex-wrap gap-2">
                          {agency.services_offered.map((service, idx) => (
                            <span
                              key={idx}
                              className="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-700"
                            >
                              {service}
                            </span>
                          ))}
                        </div>
                      </div>
                    </div>
                  </div>
                )}

                <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-shadow">
                  <div className="flex items-start gap-3">
                    <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                      agency.is_top_25_ranked ? 'bg-green-100' : 'bg-yellow-100'
                    }`}>
                      {agency.is_top_25_ranked ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertCircle className="w-5 h-5 text-yellow-600" />
                      )}
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-gray-500 mb-1">Gappsy Ranking</p>
                      <p className="text-base font-semibold text-gray-900">
                        {agency.is_top_25_ranked ? `Top 25 in ${agency.state_name}` : 'Not Ranked'}
                      </p>
                    </div>
                  </div>
                </div>

                {agency.review_type !== 'negative' && (
                  <div className="bg-white border border-gray-200 rounded-xl p-6 md:col-span-2 shadow-sm hover:shadow-md transition-shadow">
                    <div className="flex items-start gap-3">
                      <div className="w-10 h-10 bg-indigo-50 rounded-lg flex items-center justify-center flex-shrink-0">
                        <Target className="w-5 h-5 text-indigo-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-gray-500 mb-1">Check Availability</p>
                        <button
                          onClick={() => setIsAvailabilityModalOpen(true)}
                          className="text-base font-semibold text-indigo-600 hover:text-indigo-700 text-left underline decoration-dotted underline-offset-2"
                        >
                          Check if {agency.agency_name} is available for your project
                        </button>
                      </div>
                    </div>
                  </div>
                )}

                {agency.website_url && agency.review_type !== 'negative' && (
                  <div className="bg-white border border-gray-200 rounded-xl p-6 md:col-span-2 shadow-sm hover:shadow-md transition-shadow">
                    <div className="flex items-start gap-3">
                      <div className="w-10 h-10 bg-gray-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <Globe className="w-5 h-5 text-gray-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-gray-500 mb-1">Website</p>
                        <a
                          href={agency.website_url}
                          target="_blank"
                          rel="nofollow noopener noreferrer"
                          className="text-base font-semibold text-indigo-600 hover:text-indigo-700 break-all"
                        >
                          {agency.website_url.replace(/^https?:\/\//, '').replace(/\/$/, '')}
                        </a>
                      </div>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>
        </section>

        {/* AVAILABILITY CHECK CTA - POSITIVE ONLY */}
        {agency.review_type === 'positive' && (
          <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gradient-to-b from-white to-gray-50">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-3xl mx-auto text-center">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-3">
                  Is {agency.agency_name} available for your project?
                </h2>
                <p className="text-gray-600 text-base md:text-lg mb-8">
                  Tell us about your needs and we'll check their availability.
                </p>
                <button
                  onClick={() => setIsAvailabilityModalOpen(true)}
                  className="inline-flex items-center justify-center gap-2 px-5 sm:px-8 py-3 sm:py-4 bg-indigo-600 text-white rounded-lg text-sm sm:text-base font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                >
                  Check Availability
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </button>
              </div>
            </div>
          </section>
        )}

        {/* Availability Modal - all review types; context drives routing */}
        <AvailabilityModal
          isOpen={isAvailabilityModalOpen}
          onClose={() => setIsAvailabilityModalOpen(false)}
          agencyName={agency.agency_name}
          stateName={agency.state_name}
          agencyId={agency.id}
          stateSlug={agency.state_slug}
          agencySlug={agency.agency_slug}
          agencyWebsite={agency.website_url || undefined}
          reviewContext={{
            pageType: 'review',
            reviewSlug: agency.agency_slug,
            sentiment: (agency.review_type === 'negative' ? 'negative' : 'positive') as 'positive' | 'negative',
            agencySlug: agency.agency_slug,
            stateSlug: agency.state_slug,
            agencySource: agency.is_top_25_ranked ? 'top25' : 'other',
          }}
        />

        {/* 5. ENTITY SIGNALS REVIEWED */}
        <section id="public-signals" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
              Public Signals We Reviewed
            </h2>
              <p className="text-gray-600 mb-8">
                Our evaluation of {agency.agency_name} is based on the following publicly available information
                as of {lastUpdatedDate}:
              </p>

              <div className="bg-white border border-gray-200 rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-shadow">
                <div className="divide-y divide-gray-200">
                <div className="p-5 flex items-start gap-4">
                  <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                    (() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.case_studies_status?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none')) {
                          return 'bg-red-50';
                        }
                        if (status.includes('limited') || status.includes('minimal')) {
                          return 'bg-yellow-50';
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.case_studies_status?.toLowerCase().includes('extensive') ||
                        agency.case_studies_status?.toLowerCase().includes('public') ||
                        agency.case_studies_status?.toLowerCase().includes('portfolio')
                          ? 'bg-green-100' : 'bg-amber-100';
                    })()
                  }`}>
                    {(() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.case_studies_status?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none')) {
                          return <XCircle className="w-5 h-5 text-red-700" />;
                        }
                        if (status.includes('limited') || status.includes('minimal')) {
                          return <AlertCircle className="w-5 h-5 text-yellow-700" />;
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.case_studies_status?.toLowerCase().includes('extensive') ||
                        agency.case_studies_status?.toLowerCase().includes('public') ||
                        agency.case_studies_status?.toLowerCase().includes('portfolio') ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertCircle className="w-5 h-5 text-amber-600" />
                      );
                    })()}
                  </div>
                  <div className="flex-1">
                    <p className="font-semibold text-gray-900 mb-1">Case Studies & Portfolio</p>
                    <p className="text-sm text-gray-600">
                      {agency.case_studies_status || 'No public case studies documented'}
                    </p>
                  </div>
                </div>

                <div className="p-5 flex items-start gap-4">
                  <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                    (() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.pricing_transparency?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none') || status.includes('unavailable')) {
                          return 'bg-red-50';
                        }
                        if (status.includes('limited') || status.includes('minimal')) {
                          return 'bg-yellow-50';
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                        agency.pricing_transparency?.toLowerCase().includes('published') ||
                        agency.pricing_transparency?.toLowerCase().includes('clear')
                          ? 'bg-green-100' : 'bg-amber-100';
                    })()
                  }`}>
                    {(() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.pricing_transparency?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none') || status.includes('unavailable')) {
                          return <XCircle className="w-5 h-5 text-red-700" />;
                        }
                        if (status.includes('limited') || status.includes('minimal')) {
                          return <AlertCircle className="w-5 h-5 text-yellow-700" />;
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                        agency.pricing_transparency?.toLowerCase().includes('published') ||
                        agency.pricing_transparency?.toLowerCase().includes('clear') ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertCircle className="w-5 h-5 text-amber-600" />
                      );
                    })()}
                  </div>
                  <div className="flex-1">
                    <p className="font-semibold text-gray-900 mb-1">Pricing Transparency</p>
                    <p className="text-sm text-gray-600">
                      {agency.pricing_transparency || 'Pricing information not publicly available'}
                    </p>
                  </div>
                </div>

                <div className="p-5 flex items-start gap-4">
                  <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                    (() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.team_information?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none')) {
                          return 'bg-red-50';
                        }
                        if (status.includes('limited') || status.includes('minimal') || status.includes('visibility')) {
                          return 'bg-yellow-50';
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.team_information?.toLowerCase().includes('available') ||
                        agency.team_information?.toLowerCase().includes('public') ||
                        agency.team_information?.toLowerCase().includes('directory') ||
                        agency.team_information?.toLowerCase().includes('full') ||
                        agency.team_information?.toLowerCase().includes('team')
                          ? 'bg-green-100' : 'bg-amber-100';
                    })()
                  }`}>
                    {(() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.team_information?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none')) {
                          return <XCircle className="w-5 h-5 text-red-700" />;
                        }
                        if (status.includes('limited') || status.includes('minimal') || status.includes('visibility')) {
                          return <AlertCircle className="w-5 h-5 text-yellow-700" />;
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.team_information?.toLowerCase().includes('available') ||
                        agency.team_information?.toLowerCase().includes('public') ||
                        agency.team_information?.toLowerCase().includes('directory') ||
                        agency.team_information?.toLowerCase().includes('full') ||
                        agency.team_information?.toLowerCase().includes('team') ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertCircle className="w-5 h-5 text-amber-600" />
                      );
                    })()}
                  </div>
                  <div className="flex-1">
                    <p className="font-semibold text-gray-900 mb-1">Team Information</p>
                    <p className="text-sm text-gray-600">
                      {agency.team_information || 'Team credentials not publicly disclosed'}
                    </p>
                  </div>
                </div>

                <div className="p-5 flex items-start gap-4">
                  <div className={`w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 ${
                    (() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.independent_recognition?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none') || status.includes('minimal')) {
                          return 'bg-red-50';
                        }
                        if (status.includes('limited')) {
                          return 'bg-yellow-50';
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.independent_recognition?.toLowerCase().includes('award') ||
                        agency.independent_recognition?.toLowerCase().includes('recognition') ||
                        agency.independent_recognition?.toLowerCase().includes('clutch') ||
                        agency.independent_recognition?.toLowerCase().includes('rated') ||
                        agency.independent_recognition?.toLowerCase().includes('multiple') ||
                        agency.independent_recognition?.toLowerCase().includes('industry')
                          ? 'bg-green-100' : 'bg-amber-100';
                    })()
                  }`}>
                    {(() => {
                      if (agency.review_type === 'negative') {
                        const status = agency.independent_recognition?.toLowerCase() || '';
                        if (status.includes('not') || status.includes('no ') || status.includes('none') || status.includes('minimal')) {
                          return <XCircle className="w-5 h-5 text-red-700" />;
                        }
                        if (status.includes('limited')) {
                          return <AlertCircle className="w-5 h-5 text-yellow-700" />;
                        }
                      }
                      return agency.is_top_25_ranked ||
                        agency.independent_recognition?.toLowerCase().includes('award') ||
                        agency.independent_recognition?.toLowerCase().includes('recognition') ||
                        agency.independent_recognition?.toLowerCase().includes('clutch') ||
                        agency.independent_recognition?.toLowerCase().includes('rated') ||
                        agency.independent_recognition?.toLowerCase().includes('multiple') ||
                        agency.independent_recognition?.toLowerCase().includes('industry') ? (
                        <CheckCircle className="w-5 h-5 text-green-600" />
                      ) : (
                        <AlertCircle className="w-5 h-5 text-amber-600" />
                      );
                    })()}
                  </div>
                  <div className="flex-1">
                    <p className="font-semibold text-gray-900 mb-1">Independent Recognition</p>
                    <p className="text-sm text-gray-600">
                      {agency.independent_recognition || 'No verifiable third-party awards or recognition found'}
                    </p>
                  </div>
                </div>

                {agency.entity_signals && agency.entity_signals.length > 0 && (
                  <div className="p-5 bg-gray-50">
                    <p className="font-semibold text-gray-900 mb-3">Additional Signals Reviewed:</p>
                    <ul className="space-y-2">
                      {agency.entity_signals.map((signal, idx) => (
                        <li key={idx} className="flex items-start gap-2 text-sm text-gray-700">
                          <span className="text-indigo-600 font-bold">•</span>
                          <span>{signal}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* NEW: LOCAL MARKET CONTEXT */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Local Market Context: {agency.state_name} Marketing Landscape
              </h2>
              <div className="bg-white border border-gray-200 rounded-xl p-6 md:p-8 shadow-sm">
                <p className="text-gray-700 mb-6">
                  To properly evaluate {agency.agency_name}, it's important to understand the competitive marketing
                  landscape in {agency.state_name} as of {lastUpdatedDate}.
                </p>

                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold text-gray-900 mb-3">
                      Typical Agency Characteristics in {agency.state_name}
                    </h3>
                    <ul className="space-y-3 text-gray-700">
                      <li className="flex items-start gap-3">
                        <span className="text-indigo-600 font-bold">•</span>
                        <span>
                          Most established marketing agencies in {agency.state_name} maintain public case studies,
                          transparent pricing frameworks, and verifiable client testimonials
                        </span>
                      </li>
                      <li className="flex items-start gap-3">
                        <span className="text-indigo-600 font-bold">•</span>
                        <span>
                          The average agency in {agency.city || agency.state_name} typically serves {agency.target_clients || 'small to mid-sized businesses'}
                          with team sizes ranging from 5-50 employees
                        </span>
                      </li>
                      <li className="flex items-start gap-3">
                        <span className="text-indigo-600 font-bold">•</span>
                        <span>
                          Common expectations include responsive communication, documented processes, and clear reporting structures
                        </span>
                      </li>
                    </ul>
                  </div>

                  <div className="pt-4 border-t border-gray-200">
                    <h3 className="text-lg font-semibold text-gray-900 mb-3">
                      How {agency.agency_name} Compares to the {agency.state_name} Average
                    </h3>
                    <p className="text-gray-700">
                      Based on publicly available information as of {lastUpdatedDate}, {agency.agency_name}
                      {agency.is_top_25_ranked
                        ? ' demonstrates characteristics that distinguish it among the top marketing agencies in ' + agency.state_name
                        : ' does not currently rank among the Top 25 marketing agencies in ' + agency.state_name}.
                      {!agency.is_top_25_ranked && ' This assessment is based on factors including transparency, documentation quality, and publicly verifiable results compared to benchmark standards.'}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* 6. CONCERNS & RED FLAGS */}
        {agency.concerns && agency.concerns.length > 0 && (
          <section id="concerns" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-red-50/30">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Concerns About {agency.agency_name} (as of {lastUpdatedDate})
              </h2>
                <p className="text-gray-600 mb-8">
                  Based on our review of publicly available information, we identified the following concerns
                  that potential clients should be aware of:
                </p>

                <div className="bg-red-50 border border-red-200 rounded-xl p-6 md:p-8 shadow-sm">
                <div className="flex items-start gap-3 mb-4">
                  <AlertCircle className="w-6 h-6 text-red-600 flex-shrink-0 mt-0.5" />
                  <p className="font-semibold text-red-900">
                    Transparency & Credibility Issues
                  </p>
                </div>

                <ul className="space-y-3">
                  {agency.concerns.map((concern, idx) => (
                    <li key={idx} className="flex items-start gap-3">
                      <span className="inline-block w-6 h-6 bg-red-600 text-white rounded-full flex items-center justify-center flex-shrink-0 text-sm font-bold">
                        {idx + 1}
                      </span>
                      <p className="text-gray-800 flex-1 pt-0.5">{concern}</p>
                    </li>
                  ))}
                </ul>

                <div className="mt-6 pt-6 border-t border-red-200">
                  <p className="text-sm text-red-800">
                    <strong>Important:</strong> These concerns are based on publicly available information as of {lastUpdatedDate}.
                    If {agency.agency_name} has addressed these issues, we encourage them to make that information publicly available.
                  </p>
                </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* 7. WHAT THEY DO WELL */}
        {agency.strengths && agency.strengths.length > 0 && (
          <section id="strengths" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-green-50/30">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                {agency.is_top_25_ranked ? `Why ${agency.agency_name} Stands Out` : `What ${agency.agency_name} Does Well`}
              </h2>
                <p className="text-gray-600 mb-8">
                  {agency.is_top_25_ranked
                    ? `Based on our independent evaluation, here are the key strengths that set ${agency.agency_name} apart:`
                    : `To provide a balanced assessment, here are the positive signals and strengths we identified:`
                  }
                </p>

                <div className="bg-green-50 border border-green-200 rounded-xl p-6 md:p-8 shadow-sm">
                <div className="flex items-start gap-3 mb-4">
                  <CheckCircle className="w-6 h-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <p className="font-semibold text-green-900">
                    Identified Strengths
                  </p>
                </div>

                <ul className="space-y-3">
                  {agency.strengths.map((strength, idx) => (
                    <li key={idx} className="flex items-start gap-3">
                      <span className="inline-block w-6 h-6 bg-green-600 text-white rounded-full flex items-center justify-center flex-shrink-0 text-sm font-bold">
                        ✓
                      </span>
                      <p className="text-gray-800 flex-1 pt-0.5">{strength}</p>
                    </li>
                  ))}
                </ul>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* NEW: HOW AGENCY DIFFERS FROM OTHERS IN STATE */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                How {agency.agency_name} Differs From Other Agencies in {agency.state_name}
              </h2>
              <p className="text-gray-600 mb-8">
                Based on publicly available information as of {lastUpdatedDate}, here are key differentiators
                that set {agency.agency_name} apart from the average marketing agency in {agency.state_name}:
              </p>

              <div className="bg-white border border-gray-200 rounded-xl overflow-hidden shadow-sm">
                <div className="divide-y divide-gray-200">
                  <div className="p-6">
                    <h3 className="font-semibold text-gray-900 mb-2 flex items-center gap-2">
                      <Building2 className="w-5 h-5 text-indigo-600" />
                      Agency Size & Structure
                    </h3>
                    <p className="text-gray-700">
                      {agency.team_size_range
                        ? `With ${agency.team_size_range}, ${agency.agency_name} is ${
                            agency.team_size_range.includes('50+') ? 'larger' : 'similarly sized or smaller'
                          } compared to most agencies in ${agency.state_name}.`
                        : `Team size information for ${agency.agency_name} is not publicly disclosed, which differs from typical agencies in ${agency.state_name} that share this information.`}
                    </p>
                  </div>

                  <div className="p-6">
                    <h3 className="font-semibold text-gray-900 mb-2 flex items-center gap-2">
                      <Shield className="w-5 h-5 text-indigo-600" />
                      Transparency & Documentation
                    </h3>
                    <p className="text-gray-700">
                      {agency.case_studies_status?.toLowerCase().includes('extensive') ||
                       agency.case_studies_status?.toLowerCase().includes('public')
                        ? `${agency.agency_name} maintains stronger documentation standards compared to the average agency in ${agency.state_name}.`
                        : `${agency.agency_name} provides less public documentation than typical Top 25 agencies in ${agency.state_name}, which usually maintain extensive case studies and client testimonials.`}
                    </p>
                  </div>

                  <div className="p-6">
                    <h3 className="font-semibold text-gray-900 mb-2 flex items-center gap-2">
                      <Globe className="w-5 h-5 text-indigo-600" />
                      Geographic Focus
                    </h3>
                    <p className="text-gray-700">
                      {agency.geographic_reach
                        ? `${agency.agency_name} operates with ${agency.geographic_reach.toLowerCase()}, ${
                            agency.geographic_reach.toLowerCase().includes('national') || agency.geographic_reach.toLowerCase().includes('global')
                              ? 'which indicates broader reach than most local agencies in ' + agency.state_name
                              : 'reflecting a more locally-focused approach compared to multi-state agencies in ' + agency.state_name
                          }.`
                        : `${agency.agency_name} has not publicly specified its geographic reach, unlike most established agencies in ${agency.state_name}.`}
                    </p>
                  </div>

                  <div className="p-6">
                    <h3 className="font-semibold text-gray-900 mb-2 flex items-center gap-2">
                      <Target className="w-5 h-5 text-indigo-600" />
                      Service Specialization
                    </h3>
                    <p className="text-gray-700">
                      {agency.services_offered && Array.isArray(agency.services_offered) && agency.services_offered.length > 0
                        ? `${agency.agency_name} offers ${agency.services_offered.length} service${agency.services_offered.length > 1 ? 's' : ''}, ${
                            agency.services_offered.length > 5
                              ? 'indicating a full-service approach similar to larger agencies'
                              : 'reflecting a more specialized focus than typical full-service agencies'
                          } in ${agency.state_name}.`
                        : `Service offerings for ${agency.agency_name} are not comprehensively documented, which differs from standard practice among established ${agency.state_name} agencies.`}
                    </p>
                  </div>
                </div>
              </div>

              <div className="mt-6 bg-blue-50 border border-blue-200 rounded-xl p-6">
                <p className="text-sm text-blue-900">
                  <strong>Important Note:</strong> These comparisons are based on publicly available information and
                  are relative to the average marketing agency in {agency.state_name}, not specifically to Top 25 agencies.
                  Missing information reflects what is not publicly disclosed as of {lastUpdatedDate}.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* 8. COMPARISON VS TOP 25 */}
        <section id="comparison" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                How {agency.agency_name} Compares to {agency.is_top_25_ranked ? 'the Average' : 'Top 25 Agencies in'} {agency.state_name} {agency.is_top_25_ranked ? 'Marketing Agency' : ''}
              </h2>
              <p className="text-gray-600 mb-8">
                {agency.is_top_25_ranked
                  ? `Here's how ${agency.agency_name} compares to the average marketing agency in ${agency.state_name}:`
                  : `Here's how ${agency.agency_name} measures up against the average Top 25 agency in ${agency.state_name}:`
                }
              </p>

              {/* Desktop Table */}
              <div className="hidden md:block bg-white border border-gray-200 rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-shadow">
                <div className="overflow-x-auto">
                  <table className="w-full min-w-[600px]">
                  <thead className="bg-gray-50 border-b border-gray-200">
                    <tr>
                      <th className="text-left px-6 py-4 text-sm font-semibold text-gray-900">
                        Evaluation Criteria
                      </th>
                      <th className="text-left px-6 py-4 text-sm font-semibold text-gray-900">
                        {agency.agency_name}
                      </th>
                      <th className="text-left px-6 py-4 text-sm font-semibold text-gray-900">
                        {agency.is_top_25_ranked ? `Avg ${agency.state_name} Agency` : 'Avg. Top 25 Agency'}
                      </th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-200">
                    <tr>
                      <td className="px-6 py-4 text-sm font-medium text-gray-900">
                        Case Studies & Portfolio
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.case_studies_status?.toLowerCase().includes('extensive') ||
                          agency.case_studies_status?.toLowerCase().includes('public')
                            ? 'bg-green-100 text-green-800'
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {agency.case_studies_status?.toLowerCase().includes('extensive') ||
                           agency.case_studies_status?.toLowerCase().includes('public')
                            ? <CheckCircle className="w-3 h-3" />
                            : <AlertCircle className="w-3 h-3" />
                          }
                          {agency.case_studies_status?.toLowerCase().includes('extensive') ||
                           agency.case_studies_status?.toLowerCase().includes('public')
                            ? 'Available' : 'Limited'
                          }
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.is_top_25_ranked
                            ? 'bg-amber-100 text-amber-800'
                            : 'bg-green-100 text-green-800'
                        }`}>
                          {agency.is_top_25_ranked ? <AlertCircle className="w-3 h-3" /> : <CheckCircle className="w-3 h-3" />}
                          {agency.is_top_25_ranked ? 'Limited or Inconsistent' : 'Extensive'}
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm font-medium text-gray-900">
                        Pricing Transparency
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                          agency.pricing_transparency?.toLowerCase().includes('published')
                            ? 'bg-green-100 text-green-800'
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                           agency.pricing_transparency?.toLowerCase().includes('published')
                            ? <CheckCircle className="w-3 h-3" />
                            : <AlertCircle className="w-3 h-3" />
                          }
                          {agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                           agency.pricing_transparency?.toLowerCase().includes('published')
                            ? 'Clear' : 'Opaque'
                          }
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.is_top_25_ranked
                            ? 'bg-red-100 text-red-800'
                            : 'bg-green-100 text-green-800'
                        }`}>
                          {agency.is_top_25_ranked ? <AlertCircle className="w-3 h-3" /> : <CheckCircle className="w-3 h-3" />}
                          {agency.is_top_25_ranked ? 'Often Opaque' : 'Published'}
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm font-medium text-gray-900">
                        Team Information
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.team_information?.toLowerCase().includes('available') ||
                          agency.team_information?.toLowerCase().includes('public') ||
                          agency.team_information?.toLowerCase().includes('directory')
                            ? 'bg-green-100 text-green-800'
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {agency.team_information?.toLowerCase().includes('available') ||
                           agency.team_information?.toLowerCase().includes('public') ||
                           agency.team_information?.toLowerCase().includes('directory')
                            ? <CheckCircle className="w-3 h-3" />
                            : <AlertCircle className="w-3 h-3" />
                          }
                          {agency.team_information?.toLowerCase().includes('available') ||
                           agency.team_information?.toLowerCase().includes('public') ||
                           agency.team_information?.toLowerCase().includes('directory')
                            ? 'Public & Structured' : 'Limited'
                          }
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.is_top_25_ranked
                            ? 'bg-amber-100 text-amber-800'
                            : 'bg-green-100 text-green-800'
                        }`}>
                          {agency.is_top_25_ranked ? <AlertCircle className="w-3 h-3" /> : <CheckCircle className="w-3 h-3" />}
                          {agency.is_top_25_ranked ? 'Limited Visibility' : 'Full Directory'}
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm font-medium text-gray-900">
                        Independent Recognition
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.independent_recognition?.toLowerCase().includes('award') ||
                          agency.independent_recognition?.toLowerCase().includes('recognition') ||
                          agency.independent_recognition?.toLowerCase().includes('multiple')
                            ? 'bg-green-100 text-green-800'
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {agency.independent_recognition?.toLowerCase().includes('award') ||
                           agency.independent_recognition?.toLowerCase().includes('recognition') ||
                           agency.independent_recognition?.toLowerCase().includes('multiple')
                            ? <CheckCircle className="w-3 h-3" />
                            : <AlertCircle className="w-3 h-3" />
                          }
                          {agency.independent_recognition?.toLowerCase().includes('award') ||
                           agency.independent_recognition?.toLowerCase().includes('recognition') ||
                           agency.independent_recognition?.toLowerCase().includes('multiple')
                            ? 'Verified & Ranked' : 'Minimal'
                          }
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium ${
                          agency.is_top_25_ranked
                            ? 'bg-red-100 text-red-800'
                            : 'bg-green-100 text-green-800'
                        }`}>
                          {agency.is_top_25_ranked ? <AlertCircle className="w-3 h-3" /> : <CheckCircle className="w-3 h-3" />}
                          {agency.is_top_25_ranked ? 'Rare or None' : 'Multiple Awards'}
                        </span>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
              </div>

              {/* Mobile Card Layout */}
              <div className="md:hidden space-y-3">
                {/* Case Studies & Portfolio */}
                <div className="bg-white border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                  <div className="px-3 py-2.5 bg-gray-50 border-b border-gray-200">
                    <h3 className="text-xs font-semibold text-gray-900">Case Studies & Portfolio</h3>
                  </div>
                  <div className="grid grid-cols-2 gap-2 p-3">
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.agency_name}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.case_studies_status?.toLowerCase().includes('extensive') ||
                        agency.case_studies_status?.toLowerCase().includes('public')
                          ? 'bg-green-100 text-green-800'
                          : 'bg-red-100 text-red-800'
                      }`}>
                        {agency.case_studies_status?.toLowerCase().includes('extensive') ||
                         agency.case_studies_status?.toLowerCase().includes('public')
                          ? <CheckCircle className="w-2.5 h-2.5" />
                          : <AlertCircle className="w-2.5 h-2.5" />
                        }
                        {agency.case_studies_status?.toLowerCase().includes('extensive') ||
                         agency.case_studies_status?.toLowerCase().includes('public')
                          ? 'Available' : 'Limited'
                        }
                      </span>
                    </div>
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.is_top_25_ranked ? `Avg ${agency.state_name}` : 'Avg Top 25'}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.is_top_25_ranked
                          ? 'bg-amber-100 text-amber-800'
                          : 'bg-green-100 text-green-800'
                      }`}>
                        {agency.is_top_25_ranked ? <AlertCircle className="w-2.5 h-2.5" /> : <CheckCircle className="w-2.5 h-2.5" />}
                        {agency.is_top_25_ranked ? 'Limited' : 'Extensive'}
                      </span>
                    </div>
                  </div>
                </div>

                {/* Pricing Transparency */}
                <div className="bg-white border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                  <div className="px-3 py-2.5 bg-gray-50 border-b border-gray-200">
                    <h3 className="text-xs font-semibold text-gray-900">Pricing Transparency</h3>
                  </div>
                  <div className="grid grid-cols-2 gap-2 p-3">
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.agency_name}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                        agency.pricing_transparency?.toLowerCase().includes('published')
                          ? 'bg-green-100 text-green-800'
                          : 'bg-red-100 text-red-800'
                      }`}>
                        {agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                         agency.pricing_transparency?.toLowerCase().includes('published')
                          ? <CheckCircle className="w-2.5 h-2.5" />
                          : <AlertCircle className="w-2.5 h-2.5" />
                        }
                        {agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                         agency.pricing_transparency?.toLowerCase().includes('published')
                          ? 'Clear' : 'Opaque'
                        }
                      </span>
                    </div>
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.is_top_25_ranked ? `Avg ${agency.state_name}` : 'Avg Top 25'}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.is_top_25_ranked
                          ? 'bg-red-100 text-red-800'
                          : 'bg-green-100 text-green-800'
                      }`}>
                        {agency.is_top_25_ranked ? <AlertCircle className="w-2.5 h-2.5" /> : <CheckCircle className="w-2.5 h-2.5" />}
                        {agency.is_top_25_ranked ? 'Opaque' : 'Published'}
                      </span>
                    </div>
                  </div>
                </div>

                {/* Team Information */}
                <div className="bg-white border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                  <div className="px-3 py-2.5 bg-gray-50 border-b border-gray-200">
                    <h3 className="text-xs font-semibold text-gray-900">Team Information</h3>
                  </div>
                  <div className="grid grid-cols-2 gap-2 p-3">
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.agency_name}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.team_information?.toLowerCase().includes('available') ||
                        agency.team_information?.toLowerCase().includes('public')
                          ? 'bg-green-100 text-green-800'
                          : 'bg-red-100 text-red-800'
                      }`}>
                        {agency.team_information?.toLowerCase().includes('available') ||
                         agency.team_information?.toLowerCase().includes('public')
                          ? <CheckCircle className="w-2.5 h-2.5" />
                          : <AlertCircle className="w-2.5 h-2.5" />
                        }
                        {agency.team_information?.toLowerCase().includes('available') ||
                         agency.team_information?.toLowerCase().includes('public')
                          ? 'Public' : 'Limited'
                        }
                      </span>
                    </div>
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.is_top_25_ranked ? `Avg ${agency.state_name}` : 'Avg Top 25'}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.is_top_25_ranked
                          ? 'bg-amber-100 text-amber-800'
                          : 'bg-green-100 text-green-800'
                      }`}>
                        {agency.is_top_25_ranked ? <AlertCircle className="w-2.5 h-2.5" /> : <CheckCircle className="w-2.5 h-2.5" />}
                        {agency.is_top_25_ranked ? 'Limited' : 'Full'}
                      </span>
                    </div>
                  </div>
                </div>

                {/* Independent Recognition */}
                <div className="bg-white border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                  <div className="px-3 py-2.5 bg-gray-50 border-b border-gray-200">
                    <h3 className="text-xs font-semibold text-gray-900">Independent Recognition</h3>
                  </div>
                  <div className="grid grid-cols-2 gap-2 p-3">
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.agency_name}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.independent_recognition?.toLowerCase().includes('award') ||
                        agency.independent_recognition?.toLowerCase().includes('recognition')
                          ? 'bg-green-100 text-green-800'
                          : 'bg-red-100 text-red-800'
                      }`}>
                        {agency.independent_recognition?.toLowerCase().includes('award') ||
                         agency.independent_recognition?.toLowerCase().includes('recognition')
                          ? <CheckCircle className="w-2.5 h-2.5" />
                          : <AlertCircle className="w-2.5 h-2.5" />
                        }
                        {agency.independent_recognition?.toLowerCase().includes('award') ||
                         agency.independent_recognition?.toLowerCase().includes('recognition')
                          ? 'Verified' : 'None Found'
                        }
                      </span>
                    </div>
                    <div>
                      <div className="text-[10px] font-medium text-gray-600 mb-1.5">{agency.is_top_25_ranked ? `Avg ${agency.state_name}` : 'Avg Top 25'}</div>
                      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-medium whitespace-nowrap ${
                        agency.is_top_25_ranked
                          ? 'bg-red-100 text-red-800'
                          : 'bg-green-100 text-green-800'
                      }`}>
                        {agency.is_top_25_ranked ? <AlertCircle className="w-2.5 h-2.5" /> : <CheckCircle className="w-2.5 h-2.5" />}
                        {agency.is_top_25_ranked ? 'Rare' : 'Multiple'}
                      </span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="mt-6 bg-blue-50 border border-blue-200 rounded-xl p-4 sm:p-6">
                <p className="text-xs sm:text-sm text-blue-900">
                  <strong>Note:</strong> This comparison reflects publicly available information across marketing agencies operating in {agency.state_name}.
                </p>
              </div>

              {!agency.is_top_25_ranked && (
                <div className="mt-8 bg-indigo-50 border border-indigo-200 rounded-xl p-6 md:p-8">
                  <p className="text-sm text-indigo-900 font-medium mb-4">
                    💡 Looking for agencies with stronger transparency signals?
                  </p>
                  <Link
                    to={getStateListingUrl(agency.state_slug)}
                    className="inline-block bg-indigo-600 text-white px-5 sm:px-6 py-2.5 sm:py-3 rounded-lg text-sm sm:text-base font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                  >
                    <span className="hidden sm:inline">View Top 25 Agencies in {agency.state_name}</span>
                    <span className="inline sm:hidden">View Top 25 {agency.state_name} Agencies</span>
                  </Link>
                </div>
              )}
            </div>
          </div>
        </section>

        {/* OUR RECOMMENDATION - POSITIVE REVIEWS ONLY */}
        {agency.review_type === 'positive' && (
          <section id="recommendation" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-12 md:py-16 lg:py-20 bg-green-50/20">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                  Our Recommendation
                </h2>

                <div className="bg-gradient-to-br from-green-50 to-emerald-50 border-2 border-green-200 rounded-xl p-6 md:p-8 shadow-sm">
                  <div className="flex items-start gap-4 mb-6">
                    <div className="w-12 h-12 bg-green-600 rounded-xl flex items-center justify-center flex-shrink-0">
                      <CheckCircle className="w-7 h-7 text-white" />
                    </div>
                    <div className="flex-1">
                      <h3 className="text-lg sm:text-xl font-bold text-green-900 mb-3">
                        {agency.agency_name} is a Strong Choice for {agency.state_name} Businesses
                      </h3>
                      <p className="text-sm sm:text-base text-gray-800 leading-relaxed mb-4">
                        Based on publicly available information and independent evaluation, {agency.agency_name} stands out as a strong choice for businesses in {agency.state_name}.
                      </p>
                      <p className="text-sm sm:text-base text-gray-800 leading-relaxed">
                        {agency.agency_name} is ranked <strong className="text-green-900">{agency.evaluation_status?.match(/#(\d+)/)?.[1] || '2'}</strong> in Gappsy's Top 25 Marketing Agencies in {agency.state_name}, reflecting consistent performance, clear positioning, and strong public trust signals.
                      </p>
                    </div>
                  </div>

                  <div className="border-t border-green-200 pt-6">
                    <p className="text-sm font-medium text-green-900 mb-4">
                      Key reasons for our positive evaluation:
                    </p>
                    <ul className="grid sm:grid-cols-2 gap-3">
                      {agency.strengths && agency.strengths.length > 0 ? (
                        agency.strengths.slice(0, 4).map((strength, idx) => (
                          <li key={idx} className="flex items-start gap-2 text-sm text-gray-800">
                            <CheckCircle className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                            <span>{strength}</span>
                          </li>
                        ))
                      ) : (
                        <>
                          <li className="flex items-start gap-2 text-sm text-gray-800">
                            <CheckCircle className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                            <span>Strong public-facing portfolio</span>
                          </li>
                          <li className="flex items-start gap-2 text-sm text-gray-800">
                            <CheckCircle className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                            <span>Clear service positioning</span>
                          </li>
                          <li className="flex items-start gap-2 text-sm text-gray-800">
                            <CheckCircle className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                            <span>Independent verification</span>
                          </li>
                          <li className="flex items-start gap-2 text-sm text-gray-800">
                            <CheckCircle className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                            <span>Proven market presence</span>
                          </li>
                        </>
                      )}
                    </ul>
                  </div>

                  <div className="mt-6 pt-6 border-t border-green-200">
                    <button
                      onClick={() => setIsAvailabilityModalOpen(true)}
                      className="w-full sm:w-auto inline-flex items-center justify-center bg-green-600 text-white px-6 py-3 rounded-lg text-sm sm:text-base font-semibold hover:bg-green-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                    >
                      Check Availability
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* 9. RISK FACTORS */}
        {agency.risk_factors && agency.risk_factors.length > 0 && (
          <section id="risk-factors" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-yellow-50/30">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Risk Factors to Consider Before Hiring {agency.agency_name}
              </h2>
                <p className="text-gray-600 mb-8">
                  Based on our analysis, potential clients should carefully evaluate these risk factors:
                </p>

                <div className="bg-yellow-50 border border-yellow-200 rounded-xl p-6 md:p-8 shadow-sm">
                <div className="flex items-start gap-3 mb-4">
                  <Shield className="w-6 h-6 text-yellow-600 flex-shrink-0 mt-0.5" />
                  <p className="font-semibold text-yellow-900">
                    Evaluate These Risks
                  </p>
                </div>

                <div className="space-y-4">
                  {agency.risk_factors.map((risk, idx) => (
                    <div key={idx} className="bg-white border border-yellow-200 rounded-lg p-4">
                      <div className="flex items-start gap-3">
                        <span className="inline-block w-6 h-6 bg-yellow-600 text-white rounded-full flex items-center justify-center flex-shrink-0 text-xs font-bold">
                          !
                        </span>
                        <p className="text-gray-800 flex-1">{risk}</p>
                      </div>
                    </div>
                  ))}
                </div>

                <div className="mt-6 pt-6 border-t border-yellow-200">
                  <p className="text-sm text-yellow-800 mb-4">
                    <strong>Due Diligence Recommendations:</strong>
                  </p>
                  <ul className="text-sm text-yellow-800 space-y-2">
                    <li className="flex items-start gap-2">
                      <span>•</span>
                      <span>Request detailed case studies and client references</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span>•</span>
                      <span>Ask for written guarantees and clear deliverables</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span>•</span>
                      <span>Verify all claims independently before signing contracts</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span>•</span>
                      <span>Consider consulting with multiple agencies before deciding</span>
                    </li>
                  </ul>
                </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* 10. WHO THIS AGENCY MAY FIT */}
        {agency.fit_for && agency.fit_for.length > 0 && (
          <section id="fit-for" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Who {agency.agency_name} {agency.is_top_25_ranked ? 'Is Best Suited For' : 'May Be a Fit For'}
              </h2>
                <p className="text-gray-600 mb-8">
                  {agency.is_top_25_ranked
                    ? `${agency.agency_name} is particularly well-suited for:`
                    : `Despite the concerns noted above, ${agency.agency_name} may be suitable for certain specific use cases:`
                  }
                </p>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6">
                  {agency.fit_for.map((fit, idx) => (
                    <div key={idx} className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div className="flex items-start gap-3">
                      <div className="w-8 h-8 bg-indigo-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <CheckCircle className="w-5 h-5 text-indigo-600" />
                      </div>
                      <p className="text-gray-800 flex-1">{fit}</p>
                    </div>
                  </div>
                ))}
                </div>

                {!agency.is_top_25_ranked && (
                  <div className="mt-8 bg-blue-50 border border-blue-200 rounded-xl p-6 md:p-8">
                    <p className="text-sm text-blue-900 font-medium mb-3">
                      ℹ️ Our Recommendation
                    </p>
                    <p className="text-sm text-blue-800">
                      Before committing to {agency.agency_name}, we recommend requesting detailed proposals from
                      at least 2-3 agencies, including those from our{' '}
                      <Link
                        to={`/marketing-agencies-in-${agency.state_slug}-united-states/`}
                        className="font-semibold underline hover:text-blue-900"
                      >
                        Top 25 list in {agency.state_name}
                      </Link>
                      , to ensure you're making an informed decision.
                    </p>
                  </div>
                )}
              </div>
            </div>
          </section>
        )}

        {/* 11. FINAL VERDICT */}
        {agency.review_type && (agency.review_type === 'positive' || agency.review_type === 'negative') && (
          <section id="final-verdict" className="scroll-mt-28 md:scroll-mt-32 py-16 md:py-20 lg:py-24 bg-gray-50">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <div className={`border-l-4 rounded-xl p-8 md:p-10 shadow-sm ${
                agency.review_type === 'positive'
                  ? 'bg-green-50 border-green-600'
                  : 'bg-red-50 border-red-600'
              }`}>
                  <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                    Final Verdict: Should You Hire {agency.agency_name}?
                  </h2>

                  <div className="space-y-6">
                    {agency.review_type === 'positive' ? (
                      <>
                        <p className="text-lg text-gray-800">
                          <strong className="text-green-700">✓ Ranked Among Top 25:</strong> {agency.agency_name} has earned
                          a position in our Top 25 marketing agencies in {agency.state_name} based on strong transparency signals,
                          proven results, and public credibility indicators.
                        </p>
                        <p className="text-gray-700">
                          Our evaluation found that {agency.agency_name} demonstrates the key qualities we look for:
                          documented case studies, transparent operations, verifiable team credentials, and independent recognition.
                        </p>
                        <p className="text-gray-700">
                          Based on our evaluation, {agency.agency_name} appears to be a strong option for {agency.state_name} businesses.
                          If you're interested, you can reach out directly via their website or check availability above.
                        </p>
                        <div className="pt-4 space-y-3">
                          {agency.website_url ? (
                            <a
                              href={agency.website_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-block bg-green-600 text-white px-5 sm:px-8 py-3 sm:py-4 rounded-lg text-sm sm:text-base font-semibold hover:bg-green-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                            >
                              Visit {agency.agency_name} Website
                            </a>
                          ) : (
                            <button
                              onClick={() => setIsAvailabilityModalOpen(true)}
                              className="inline-block bg-green-600 text-white px-5 sm:px-8 py-3 sm:py-4 rounded-lg text-sm sm:text-base font-semibold hover:bg-green-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                            >
                              Check Availability
                            </button>
                          )}
                          <div>
                            <Link
                              to={`/marketing-agencies-in-${agency.state_slug}-united-states/`}
                              className="text-sm text-gray-600 hover:text-indigo-600 underline"
                            >
                              Compare other Top 25 {agency.state_name} agencies
                            </Link>
                          </div>
                        </div>
                      </>
                    ) : (
                      <>
                        <p className="text-lg text-gray-800">
                          <strong className="text-red-700">⚠ Not Ranked:</strong> Based on publicly available information
                          as of {lastUpdatedDate}, {agency.agency_name} does not meet our criteria for Top 25 ranking in {agency.state_name}.
                        </p>
                        <p className="text-gray-700">
                          Our evaluation identified significant gaps in transparency, credibility signals, and public documentation.
                          While this doesn't necessarily mean {agency.agency_name} provides poor service, it does mean potential
                          clients have limited ability to verify claims or assess quality before engaging.
                        </p>
                        <p className="text-gray-700">
                          Based on our evaluation, we recommend exploring agencies with stronger public credibility signals
                          and documented track records before making a decision.
                        </p>
                        <div className="pt-4">
                          <Link
                            to={`/marketing-agencies-in-${agency.state_slug}-united-states/`}
                            className="inline-block bg-indigo-600 text-white px-5 sm:px-8 py-3 sm:py-4 rounded-lg text-sm sm:text-base font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md whitespace-nowrap"
                          >
                            See better {agency.state_name} agencies
                          </Link>
                        </div>
                      </>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* 12. BETTER ALTERNATIVES (TOP 25 BLOCK) */}
        {!agency.is_top_25_ranked && (
          <section id="better-alternatives" className="scroll-mt-28 md:scroll-mt-32 py-16 md:py-20 lg:py-24">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <div className="bg-gradient-to-br from-indigo-600 to-indigo-700 rounded-xl p-8 md:p-10 lg:p-12 text-white shadow-xl">
                  <h2 className="text-xl sm:text-2xl md:text-3xl font-bold mb-4 sm:mb-6">
                    Looking for Better Options?
                  </h2>
                  <p className="text-indigo-100 text-lg mb-8">
                    We've identified 25 marketing agencies in {agency.state_name} with stronger transparency signals,
                    proven track records, and verified credentials.
                  </p>

                  <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 md:gap-6 mb-10">
                  <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 border border-white/20">
                    <p className="text-3xl font-bold mb-1">25</p>
                    <p className="text-sm text-indigo-100">Top-Ranked Agencies</p>
                  </div>
                  <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 border border-white/20">
                    <p className="text-3xl font-bold mb-1">100%</p>
                    <p className="text-sm text-indigo-100">Verified Credentials</p>
                  </div>
                  <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 border border-white/20">
                    <p className="text-3xl font-bold mb-1">Free</p>
                    <p className="text-sm text-indigo-100">Comparison Tool</p>
                  </div>
                  </div>

                  <div className="pt-2">
                    <Link
                      to={getStateListingUrl(agency.state_slug)}
                      className="inline-block bg-white text-indigo-600 px-5 sm:px-8 py-3 sm:py-4 rounded-lg font-bold text-base sm:text-lg hover:bg-indigo-50 transition shadow-lg hover:shadow-xl whitespace-nowrap"
                    >
                      <span className="hidden sm:inline">Browse Top 25 Agencies in {agency.state_name} →</span>
                      <span className="inline sm:hidden">Browse Top 25 {agency.state_name} Agencies</span>
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* NEW: VISITOR REPORTS & COMMUNITY SIGNALS */}
        <section className="py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                Visitor Reports & Community Signals
              </h2>

              <div className="bg-white border border-gray-200 rounded-xl p-6 md:p-8 shadow-sm">
                <div className="flex items-start gap-4 mb-6">
                  <div className="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center flex-shrink-0">
                    <MessageSquare className="w-6 h-6 text-yellow-600" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-gray-900 mb-2">
                      Community Feedback About {agency.agency_name}
                    </h3>
                    <p className="text-gray-600">
                      We welcome community input to maintain accurate, up-to-date reviews. All submissions are
                      manually reviewed before publication.
                    </p>
                  </div>
                </div>

                <div className="bg-gray-50 border border-gray-200 rounded-xl p-6 mb-6">
                  <div className="flex items-center justify-between mb-4">
                    <div>
                      <p className="text-sm font-medium text-gray-500">Current Status</p>
                      <p className="text-2xl font-bold text-gray-900">
                        {agency.visitor_reports_count || 0} Reports Submitted
                      </p>
                    </div>
                    <div className={`px-4 py-2 rounded-lg ${
                      agency.visitor_reports_count && agency.visitor_reports_count > 0
                        ? 'bg-green-100 text-green-800'
                        : 'bg-gray-200 text-gray-600'
                    }`}>
                      <p className="text-sm font-semibold">
                        {agency.visitor_reports_count && agency.visitor_reports_count > 0
                          ? 'Under Review'
                          : 'No Reports Yet'}
                      </p>
                    </div>
                  </div>

                  {(!agency.visitor_reports_count || agency.visitor_reports_count === 0) && (
                    <p className="text-sm text-gray-600">
                      No verified visitor reports have been published for {agency.agency_name} as of {lastUpdatedDate}.
                      Be the first to contribute community feedback.
                    </p>
                  )}
                </div>

                <div className="bg-blue-50 border-l-4 border-blue-500 rounded-lg p-6 mb-6">
                  <h4 className="font-semibold text-blue-900 mb-2">
                    What You Can Report
                  </h4>
                  <ul className="space-y-2 text-sm text-blue-800">
                    <li className="flex items-start gap-2">
                      <span className="text-blue-600 font-bold">•</span>
                      <span>Outdated or incorrect information about {agency.agency_name}</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="text-blue-600 font-bold">•</span>
                      <span>Your experience working with this agency (concerns only, not promotional content)</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <span className="text-blue-600 font-bold">•</span>
                      <span>Verifiable changes to agency status, services, or credentials</span>
                    </li>
                  </ul>
                </div>

                <div className="text-center">
                  <Link
                    to={`/contact?subject=Report about ${encodeURIComponent(agency.agency_name)}`}
                    className="inline-flex items-center gap-2 bg-indigo-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-indigo-700 transition shadow-sm hover:shadow-md"
                  >
                    <MessageSquare className="w-5 h-5" />
                    Submit a Concern or Correction
                  </Link>
                  <p className="text-sm text-gray-500 mt-4">
                    All submissions are reviewed manually before publication. We do not publish promotional content.
                  </p>
                </div>
              </div>

              <div className="mt-6 bg-yellow-50 border border-yellow-200 rounded-xl p-6">
                <p className="text-sm text-yellow-900">
                  <strong>Important:</strong> All visitor reports are labeled as "Unverified Community Feedback" and
                  are published only after manual review. Gappsy does not independently verify community-submitted information.
                  Our official review of {agency.agency_name} is based on publicly available information as of {lastUpdatedDate}.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* 13. FAQ SECTION */}
        <section id="faq" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
              Frequently Asked Questions About {agency.agency_name}
            </h2>

              <div className="space-y-4 md:space-y-6">
                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                  <span>Is {agency.agency_name} legit?</span>
                  <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                  </svg>
                </summary>
                <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                  <p className="text-gray-700">
                    Based on our review of publicly available information as of {lastUpdatedDate}, we found {
                      agency.is_top_25_ranked
                        ? `that ${agency.agency_name} demonstrates strong credibility signals including verified case studies, transparent pricing, and independent recognition. They rank among our Top 25 agencies in ${agency.state_name}.`
                        : `limited public credibility signals for ${agency.agency_name}. We recommend requesting detailed references and comparing them with agencies from our Top 25 list before making a decision.`
                    }
                  </p>
                </div>
                </details>

                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                  <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                    <span>How much does {agency.agency_name} cost?</span>
                    <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </summary>
                  <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <p className="text-gray-700">
                      {agency.pricing_transparency?.toLowerCase().includes('transparent') ||
                       agency.pricing_transparency?.toLowerCase().includes('published')
                        ? `${agency.agency_name} publishes pricing information: ${agency.pricing_transparency}. Contact them directly for current rates and custom quotes.`
                        : `${agency.agency_name} does not publicly disclose pricing information. You'll need to contact them directly for quotes. We recommend getting proposals from multiple agencies to compare value.`
                      }
                    </p>
                  </div>
                </details>

                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                  <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                    <span>What are the best alternatives to {agency.agency_name}?</span>
                    <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </summary>
                  <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <p className="text-gray-700 mb-3">
                      We've identified 25 top-performing marketing agencies in {agency.state_name} with verified credentials
                      and proven track records. These agencies demonstrate strong transparency, documented results, and independent recognition.
                    </p>
                    <Link
                      to={`/marketing-agencies-in-${agency.state_slug}-united-states/`}
                      className="inline-block text-indigo-600 hover:text-indigo-700 font-semibold underline"
                    >
                      View all Top 25 alternatives →
                    </Link>
                  </div>
                </details>

                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                  <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                    <span>Does {agency.agency_name} have case studies?</span>
                    <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </summary>
                  <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <p className="text-gray-700">
                      {agency.case_studies_status || 'We did not find publicly available case studies or portfolio work as of our last review.'}
                      {!agency.case_studies_status?.toLowerCase().includes('extensive') &&
                       !agency.case_studies_status?.toLowerCase().includes('public') && (
                        <span> We recommend requesting detailed case studies and client references directly from the agency before engaging.</span>
                      )}
                    </p>
                  </div>
                </details>

                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                  <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                    <span>Is {agency.agency_name} ranked in the Top 25?</span>
                    <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </summary>
                  <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <p className="text-gray-700">
                      {agency.is_top_25_ranked
                        ? `Yes, ${agency.agency_name} is ranked among the Top 25 marketing agencies in ${agency.state_name} based on our evaluation of transparency, proven results, and credibility signals.`
                        : `No, ${agency.agency_name} is not currently ranked in our Top 25 marketing agencies in ${agency.state_name}. Our rankings are based on publicly verifiable information including case studies, pricing transparency, team credentials, and independent recognition.`
                      }
                    </p>
                  </div>
                </details>

                <details className="bg-white border border-gray-200 rounded-xl overflow-hidden group shadow-sm hover:shadow-md transition-shadow">
                <summary className="px-6 py-4 cursor-pointer font-semibold text-gray-900 hover:bg-gray-50 transition flex items-center justify-between">
                  <span>How was this {agency.agency_name} review created?</span>
                  <svg className="w-5 h-5 text-gray-500 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                  </svg>
                </summary>
                <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                  <p className="text-gray-700">
                    This review is based on our independent analysis of publicly available information about {agency.agency_name},
                    including their website, case studies, pricing transparency, team credentials, third-party reviews, and industry
                    recognition. We do not accept payment to improve rankings or remove factual reviews. See our full methodology below.
                  </p>
                </div>
                </details>
              </div>
            </div>
          </div>
        </section>

        {/* 14. ABOUT THE AGENCY */}
        {agency.about_description && (
          <section id="about" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20">
            <div className="max-w-7xl mx-auto px-4 md:px-6">
              <div className="max-w-5xl mx-auto">
                <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
                About {agency.agency_name}
              </h2>

                <div className="prose prose-lg max-w-none">
                  <div className="bg-white border border-gray-200 rounded-xl p-6 md:p-8 shadow-sm">
                  {agency.about_description.split('\n\n').map((paragraph, idx) => (
                    <p key={idx} className="text-gray-700 mb-4 last:mb-0">
                      {paragraph}
                    </p>
                  ))}
                </div>

                  {agency.review_type !== 'negative' && (
                    <div className="mt-6 bg-indigo-50 border border-indigo-200 rounded-xl p-6">
                      <p className="text-sm text-gray-600 mb-3">
                        <strong>Check Availability:</strong>
                      </p>
                      <button
                        onClick={() => setIsAvailabilityModalOpen(true)}
                        className="text-indigo-600 hover:text-indigo-700 font-medium underline decoration-dotted underline-offset-2"
                      >
                        Check if {agency.agency_name} is available for your project
                      </button>
                      <p className="text-xs text-gray-500 mt-3">
                        Tell us about your needs and we'll check their availability.
                      </p>
                    </div>
                  )}

                  {agency.website_url && agency.review_type !== 'negative' && (
                    <div className="mt-6 bg-gray-50 border border-gray-200 rounded-xl p-6">
                    <p className="text-sm text-gray-600 mb-3">
                      <strong>Official Website:</strong>
                    </p>
                    <a
                      href={agency.website_url}
                      target="_blank"
                      rel="nofollow noopener noreferrer"
                      className="text-indigo-600 hover:text-indigo-700 font-medium break-all"
                    >
                      {agency.website_url}
                    </a>
                    <p className="text-xs text-gray-500 mt-3">
                      Note: This is an external link. Gappsy is not affiliated with {agency.agency_name}.
                    </p>
                  </div>
                  )}
                </div>
              </div>
            </div>
          </section>
        )}

        {/* 15. METHODOLOGY & SOURCES */}
        <section id="methodology" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-gray-900 mb-4 sm:mb-6 md:mb-8">
              Our Review Methodology
            </h2>

              <div className="bg-white border border-gray-200 rounded-xl p-8 md:p-10 shadow-sm">
                <div className="prose prose-lg max-w-none">
                  <p className="text-gray-700 mb-6">
                  This review of {agency.agency_name} was created using Gappsy's independent agency evaluation methodology,
                  which analyzes publicly available information across multiple dimensions:
                </p>

                <h3 className="text-xl font-bold text-gray-900 mt-6 mb-3">Data Sources</h3>
                <ul className="space-y-2 mb-6">
                  <li className="flex items-start gap-2 text-gray-700">
                    <span className="text-indigo-600 font-bold">•</span>
                    <span><strong>Agency Website:</strong> Public portfolio, case studies, team pages, pricing information</span>
                  </li>
                  <li className="flex items-start gap-2 text-gray-700">
                    <span className="text-indigo-600 font-bold">•</span>
                    <span><strong>Third-Party Review Platforms:</strong> Clutch, Google Business, Trustpilot, G2</span>
                  </li>
                  <li className="flex items-start gap-2 text-gray-700">
                    <span className="text-indigo-600 font-bold">•</span>
                    <span><strong>Industry Recognition:</strong> Awards, certifications, platform partnerships</span>
                  </li>
                  <li className="flex items-start gap-2 text-gray-700">
                    <span className="text-indigo-600 font-bold">•</span>
                    <span><strong>Public Business Records:</strong> State registrations, BBB listings, professional associations</span>
                  </li>
                  <li className="flex items-start gap-2 text-gray-700">
                    <span className="text-indigo-600 font-bold">•</span>
                    <span><strong>Social Proof:</strong> LinkedIn profiles, social media presence, published content</span>
                  </li>
                </ul>

                <h3 className="text-xl font-bold text-gray-900 mt-6 mb-3">Ranking Criteria</h3>
                <p className="text-gray-700 mb-4">
                  Agencies are evaluated across five key dimensions to determine Top 25 ranking:
                </p>
                <ol className="space-y-3 mb-6">
                  <li className="flex items-start gap-3 text-gray-700">
                    <span className="inline-flex items-center justify-center w-6 h-6 bg-indigo-600 text-white rounded-full text-sm font-bold flex-shrink-0">1</span>
                    <div>
                      <strong>Transparency & Documentation (30%):</strong> Case studies, portfolio, pricing, process documentation
                    </div>
                  </li>
                  <li className="flex items-start gap-3 text-gray-700">
                    <span className="inline-flex items-center justify-center w-6 h-6 bg-indigo-600 text-white rounded-full text-sm font-bold flex-shrink-0">2</span>
                    <div>
                      <strong>Team Credentials (25%):</strong> Public team directory, leadership experience, certifications
                    </div>
                  </li>
                  <li className="flex items-start gap-3 text-gray-700">
                    <span className="inline-flex items-center justify-center w-6 h-6 bg-indigo-600 text-white rounded-full text-sm font-bold flex-shrink-0">3</span>
                    <div>
                      <strong>Independent Recognition (20%):</strong> Third-party awards, platform ratings, media mentions
                    </div>
                  </li>
                  <li className="flex items-start gap-3 text-gray-700">
                    <span className="inline-flex items-center justify-center w-6 h-6 bg-indigo-600 text-white rounded-full text-sm font-bold flex-shrink-0">4</span>
                    <div>
                      <strong>Client Testimonials (15%):</strong> Verified reviews, case study endorsements, reference availability
                    </div>
                  </li>
                  <li className="flex items-start gap-3 text-gray-700">
                    <span className="inline-flex items-center justify-center w-6 h-6 bg-indigo-600 text-white rounded-full text-sm font-bold flex-shrink-0">5</span>
                    <div>
                      <strong>Local Presence (10%):</strong> Physical office, local market knowledge, community involvement
                    </div>
                  </li>
                </ol>

                <div className="bg-blue-50 border border-blue-200 rounded-lg p-6 mt-6">
                  <p className="text-sm text-blue-900 font-semibold mb-2">
                    Last Reviewed: {lastUpdatedDate}
                  </p>
                  <p className="text-sm text-blue-800">
                    We review agencies quarterly or when significant changes occur. Information is current as of the date listed above.
                  </p>
                </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* 17. REVIEWER / PUBLISHER AUTHORITY */}
        <section id="reviewed-by" className="scroll-mt-28 md:scroll-mt-32 py-8 sm:py-8 sm:py-12 md:py-16 lg:py-20 bg-gray-50">
          <div className="max-w-7xl mx-auto px-4 md:px-6">
            <div className="max-w-5xl mx-auto">
              <div className="bg-gradient-to-br from-gray-50 to-gray-100 border border-gray-200 rounded-xl p-8 md:p-10 shadow-sm">
              <div className="flex flex-col sm:flex-row items-start gap-6">
                <div className="hidden sm:block w-16 h-16 bg-indigo-600 rounded-lg flex-shrink-0 flex items-center justify-center">
                  <Shield className="w-8 h-8 text-white" />
                </div>
                <div className="flex-1">
                  <h3 className="text-xl font-bold text-gray-900 mb-3">
                    Reviewed by the Gappsy Research Team
                  </h3>
                  <p className="text-gray-700 mb-4">
                    Gappsy is an independent marketing agency directory and review platform. Since 2024,
                    we've evaluated hundreds of marketing agencies across all 50 U.S. states, helping businesses
                    find credible partners with verified credentials.
                  </p>
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-4">
                    <div>
                      <p className="text-2xl font-bold text-indigo-600">500+</p>
                      <p className="text-xs text-gray-600">Agencies Reviewed</p>
                    </div>
                    <div>
                      <p className="text-2xl font-bold text-indigo-600">50</p>
                      <p className="text-xs text-gray-600">States Covered</p>
                    </div>
                    <div>
                      <p className="text-2xl font-bold text-indigo-600">100%</p>
                      <p className="text-xs text-gray-600">Independent</p>
                    </div>
                    <div>
                      <p className="text-2xl font-bold text-indigo-600">Monthly</p>
                      <p className="text-xs text-gray-600">Updates</p>
                    </div>
                  </div>
                  <div className="flex flex-wrap gap-3">
                    <Link
                      to="/about"
                      className="text-sm text-indigo-600 hover:text-indigo-700 font-semibold underline"
                    >
                      About Gappsy
                    </Link>
                    <Link
                      to="/editorial-policy"
                      className="text-sm text-indigo-600 hover:text-indigo-700 font-semibold underline"
                    >
                      Editorial Policy
                    </Link>
                    <Link
                      to="/contact"
                      className="text-sm text-indigo-600 hover:text-indigo-700 font-semibold underline"
                    >
                      Contact Us
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
        </section>

      </main>

      <FooterWrapper />
    </div>
  );
}
