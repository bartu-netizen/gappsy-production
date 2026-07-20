import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Send, CheckCircle, AlertCircle, Loader, Mail, Clock } from 'lucide-react';

const SUPABASE_URL     = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

function getUTMParams(): Record<string, string | null> {
  try {
    const p = new URLSearchParams(window.location.search);
    return {
      utm_source:   p.get('utm_source'),
      utm_medium:   p.get('utm_medium'),
      utm_campaign: p.get('utm_campaign'),
      utm_term:     p.get('utm_term'),
      utm_content:  p.get('utm_content'),
    };
  } catch { return {}; }
}

export default function ContactPage() {
  const [fullName, setFullName] = useState('');
  const [email,    setEmail]    = useState('');
  const [subject,  setSubject]  = useState('');
  const [message,  setMessage]  = useState('');
  const [status,   setStatus]   = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
  const [errorMsg, setErrorMsg] = useState('');

  const [pageContext, setPageContext] = useState<Record<string, string | null>>({});

  useEffect(() => {
    setPageContext({
      page_url:    window.location.href,
      page_path:   window.location.pathname,
      referrer_url: document.referrer || null,
      ...getUTMParams(),
    });
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!fullName.trim() || !email.trim() || !subject.trim() || !message.trim()) return;

    setStatus('loading');
    setErrorMsg('');

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/contact-submit`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
        },
        body: JSON.stringify({
          full_name: fullName.trim(),
          email:     email.trim(),
          subject:   subject.trim(),
          message:   message.trim(),
          ...pageContext,
        }),
      });

      const data = await res.json();

      if (!data.ok) {
        throw new Error(data.error ?? 'Submission failed');
      }

      setStatus('success');
      setFullName(''); setEmail(''); setSubject(''); setMessage('');
    } catch (err) {
      setStatus('error');
      setErrorMsg(err instanceof Error ? err.message : 'Something went wrong. Please try again.');
    }
  };

  return (
    <div className="min-h-screen bg-[#0A1735] flex flex-col relative overflow-hidden">
      <div
        className="pointer-events-none absolute inset-0 opacity-60"
        style={{ background: 'radial-gradient(60% 50% at 50% 0%, rgba(79,71,230,0.2), transparent)' }}
        aria-hidden="true"
      />

      <header className="flex items-center justify-center pt-6 lg:pt-8 pb-2 relative">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-9 lg:h-10 w-auto" />
        </Link>
      </header>

      <main className="flex-1 flex items-start justify-center px-4 pt-4 lg:pt-6 pb-10 relative">
        <div className="w-full max-w-sm lg:max-w-3xl">
          {status === 'success' ? (
            <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)] text-center max-w-sm mx-auto">
              <div className="w-11 h-11 rounded-2xl bg-[#EEF0FE] flex items-center justify-center mx-auto mb-4">
                <CheckCircle className="w-5 h-5 text-[#0A1735]" />
              </div>
              <h1 className="text-lg font-bold text-[#0B1221]">Message sent!</h1>
              <p className="text-sm text-slate-500 mt-1.5 mb-5 leading-relaxed">
                Thanks for reaching out — we'll get back to you as soon as possible.
              </p>
              <button
                onClick={() => setStatus('idle')}
                className="inline-flex items-center justify-center gap-1.5 w-full bg-[#0A1735] hover:bg-[#1B2E5C] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all"
              >
                Send another message
              </button>
            </div>
          ) : (
            <div className="lg:flex lg:justify-center lg:gap-6 lg:items-start">
              <div className="w-full max-w-sm lg:max-w-md">
                <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)]">
                  <h1 className="text-xl font-bold text-[#0B1221] tracking-tight">Contact us</h1>
                  <p className="text-[13px] text-slate-500 mt-1.5 mb-6 leading-relaxed">
                    Have a question or want to work with us? Send us a message and we'll get back to you.
                  </p>

                  <form onSubmit={handleSubmit} className="space-y-3.5">
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3.5">
                      <div>
                        <label className="block text-xs font-semibold text-slate-600 mb-1.5">Full Name</label>
                        <input
                          type="text"
                          value={fullName}
                          onChange={e => setFullName(e.target.value)}
                          required
                          placeholder="Jane Smith"
                          className="w-full h-11 rounded-xl border border-slate-200 px-3.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow"
                        />
                      </div>
                      <div>
                        <label className="block text-xs font-semibold text-slate-600 mb-1.5">Email Address</label>
                        <input
                          type="email"
                          value={email}
                          onChange={e => setEmail(e.target.value)}
                          required
                          placeholder="jane@company.com"
                          className="w-full h-11 rounded-xl border border-slate-200 px-3.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow"
                        />
                      </div>
                    </div>

                    <div>
                      <label className="block text-xs font-semibold text-slate-600 mb-1.5">Subject</label>
                      <input
                        type="text"
                        value={subject}
                        onChange={e => setSubject(e.target.value)}
                        required
                        placeholder="How can we help?"
                        className="w-full h-11 rounded-xl border border-slate-200 px-3.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow"
                      />
                    </div>

                    <div>
                      <label className="block text-xs font-semibold text-slate-600 mb-1.5">Message</label>
                      <textarea
                        value={message}
                        onChange={e => setMessage(e.target.value)}
                        required
                        rows={5}
                        placeholder="Tell us what's on your mind..."
                        className="w-full rounded-xl border border-slate-200 px-3.5 py-2.5 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow resize-none"
                      />
                    </div>

                    {status === 'error' && (
                      <div className="flex items-start gap-2 bg-red-50 border border-red-100 rounded-xl px-3.5 py-2.5">
                        <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0 mt-0.5" />
                        <p className="text-[13px] text-red-600">{errorMsg}</p>
                      </div>
                    )}

                    <button
                      type="submit"
                      disabled={status === 'loading'}
                      className="w-full inline-flex items-center justify-center gap-1.5 bg-[#0A1735] hover:bg-[#1B2E5C] text-white px-5 py-3 rounded-xl font-semibold text-sm transition-all disabled:opacity-60 mt-1"
                    >
                      {status === 'loading'
                        ? <><Loader className="w-4 h-4 animate-spin" /> Sending…</>
                        : <><Send className="w-4 h-4" /> Send Message</>
                      }
                    </button>
                  </form>
                </div>
              </div>

              <div className="w-full max-w-sm lg:max-w-[280px] mt-4 lg:mt-0 space-y-3">
                <a
                  href="mailto:support@gappsy.com"
                  className="flex items-center gap-3 rounded-2xl bg-white p-4 shadow-[0_12px_28px_rgba(0,0,0,0.18)] hover:shadow-[0_16px_36px_rgba(0,0,0,0.24)] transition-shadow"
                >
                  <div className="w-10 h-10 shrink-0 rounded-xl bg-[#EEF0FE] flex items-center justify-center">
                    <Mail className="w-5 h-5 text-[#0A1735]" aria-hidden="true" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-[13px] font-bold text-[#0B1221] leading-tight">Prefer email?</p>
                    <p className="text-[12px] text-slate-500 leading-tight mt-0.5">support@gappsy.com</p>
                  </div>
                </a>

                <div className="rounded-2xl bg-white/5 border border-white/10 backdrop-blur-sm p-4">
                  <div className="flex items-center gap-2 text-white/80">
                    <Clock className="w-4 h-4 shrink-0" aria-hidden="true" />
                    <p className="text-[13px] font-semibold">Fast response time</p>
                  </div>
                  <p className="text-[13px] text-white/50 leading-relaxed mt-1.5">
                    We typically reply within one business day.
                  </p>
                </div>
              </div>
            </div>
          )}

          <p className="text-center mt-6">
            <Link to="/" className="text-[13px] text-white/50 hover:text-white/80 transition-colors">← Back to Gappsy</Link>
          </p>
        </div>
      </main>
    </div>
  );
}
