import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Search, Building2, ChevronRight, ArrowLeft, Mail, CheckCircle } from 'lucide-react';
import FooterWrapper from '../components/FooterWrapper';
import YourAgencySEO from '../components/YourAgencySEO';

export default function YourAgencyNotFoundPage() {
  const navigate = useNavigate();
  const [agencyName, setAgencyName] = useState('');
  const [website, setWebsite] = useState('');
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!agencyName.trim()) return;
    setSubmitted(true);
  };

  return (
    <>
      <YourAgencySEO
        title="Agency not found | Gappsy"
        description="We didn't find your agency in our directory. Submit your agency to get listed across our Top-25 state pages."
        canonical="https://gappsy.com/your-agency/not-found"
        noindex={true}
      />

      <div className="min-h-screen flex flex-col bg-slate-50">
        <header className="w-full border-b border-slate-100 bg-white sticky top-0 z-40">
          <div className="max-w-4xl mx-auto px-4 h-14 flex items-center gap-3">
            <button
              onClick={() => navigate('/your-agency')}
              className="flex items-center gap-1.5 text-sm text-slate-500 hover:text-slate-800 transition-colors"
            >
              <ArrowLeft className="w-4 h-4" />
              Back to search
            </button>
            <span className="text-slate-200">|</span>
            <Link to="/">
              <img
                src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png"
                alt="Gappsy"
                className="h-7 w-auto"
              />
            </Link>
          </div>
        </header>

        <main className="flex-1 max-w-lg mx-auto w-full px-4 py-12">
          {submitted ? (
            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-8 text-center">
              <div className="w-14 h-14 rounded-full bg-emerald-100 flex items-center justify-center mx-auto mb-5">
                <CheckCircle className="w-7 h-7 text-emerald-600" />
              </div>
              <h1 className="text-xl font-bold text-slate-900 mb-2">Thanks! We've got your request.</h1>
              <p className="text-sm text-slate-500 mb-6 leading-relaxed">
                We'll review{' '}
                <span className="font-semibold text-slate-700">{agencyName}</span> and add it to the
                relevant state directories within 1–2 business days.
              </p>
              <div className="flex flex-col gap-3">
                <Link
                  to="/your-agency"
                  className="inline-flex items-center justify-center gap-2 bg-slate-900 hover:bg-slate-800 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors"
                >
                  <Search className="w-4 h-4" />
                  Search again later
                </Link>
                <Link
                  to="/activation/upgrade"
                  className="inline-flex items-center justify-center gap-2 text-sm font-semibold text-blue-600 hover:text-blue-700 border border-blue-200 px-5 py-2.5 rounded-xl transition-colors"
                >
                  Upgrade to Top 25
                  <ChevronRight className="w-4 h-4" />
                </Link>
              </div>
            </div>
          ) : (
            <>
              {/* Empty state */}
              <div className="text-center mb-8">
                <div className="w-16 h-16 rounded-2xl bg-slate-100 flex items-center justify-center mx-auto mb-5">
                  <Building2 className="w-8 h-8 text-slate-400" />
                </div>
                <h1 className="text-2xl font-bold text-slate-900 mb-2">
                  We didn't find your agency
                </h1>
                <p className="text-sm text-slate-500 leading-relaxed max-w-sm mx-auto">
                  Your agency may not be in our index yet, or the name might be spelled differently.
                  Try searching again, or submit below to get listed.
                </p>
              </div>

              {/* Try search again */}
              <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 mb-5">
                <p className="text-xs font-semibold text-slate-500 uppercase tracking-widest mb-3">
                  Try searching again
                </p>
                <Link
                  to="/your-agency"
                  className="flex items-center gap-3 group hover:bg-slate-50 -mx-2 px-2 py-2 rounded-xl transition-colors"
                >
                  <div className="w-9 h-9 rounded-xl bg-blue-50 group-hover:bg-blue-100 flex items-center justify-center shrink-0 transition-colors">
                    <Search className="w-4 h-4 text-blue-500" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold text-slate-800">Search by agency name</p>
                    <p className="text-xs text-slate-400">Try a variation or abbreviated name</p>
                  </div>
                  <ChevronRight className="w-4 h-4 text-slate-300 group-hover:text-slate-500 transition-colors" />
                </Link>
              </div>

              {/* Submit form */}
              <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                <div className="flex items-center gap-2 mb-4">
                  <Mail className="w-4 h-4 text-blue-500" />
                  <p className="text-sm font-semibold text-slate-700">Submit your agency for listing</p>
                </div>
                <p className="text-xs text-slate-400 mb-5 leading-relaxed">
                  We'll add your agency to the relevant state directories within 1–2 business days.
                  It's free to appear in the Other Agencies section.
                </p>

                <form onSubmit={handleSubmit} className="space-y-4">
                  <div>
                    <label className="block text-xs font-semibold text-slate-600 mb-1.5">
                      Agency name <span className="text-red-400">*</span>
                    </label>
                    <input
                      type="text"
                      value={agencyName}
                      onChange={(e) => setAgencyName(e.target.value)}
                      placeholder="Acme Marketing Agency"
                      required
                      className="w-full px-4 py-2.5 rounded-xl border border-slate-200 text-sm text-slate-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold text-slate-600 mb-1.5">
                      Website
                    </label>
                    <input
                      type="text"
                      value={website}
                      onChange={(e) => setWebsite(e.target.value)}
                      placeholder="acmemarketing.com"
                      className="w-full px-4 py-2.5 rounded-xl border border-slate-200 text-sm text-slate-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                  <button
                    type="submit"
                    className="w-full flex items-center justify-center gap-2 bg-slate-900 hover:bg-slate-800 text-white text-sm font-semibold px-5 py-3 rounded-xl transition-colors"
                  >
                    Submit agency
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </form>

                <p className="text-xs text-slate-400 mt-4 text-center">
                  Already listed?{' '}
                  <Link to="/activation/upgrade" className="text-blue-600 hover:underline">
                    Upgrade to Top 25
                  </Link>
                </p>
              </div>
            </>
          )}
        </main>

        <FooterWrapper />
      </div>
    </>
  );
}
