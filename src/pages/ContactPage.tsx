import { useState, useEffect } from 'react';
import { Send, CheckCircle, AlertCircle, Loader } from 'lucide-react';

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

  if (status === 'success') {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center px-4">
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm px-8 py-12 max-w-md w-full text-center">
          <div className="w-14 h-14 rounded-full bg-emerald-100 flex items-center justify-center mx-auto mb-4">
            <CheckCircle className="w-7 h-7 text-emerald-600" />
          </div>
          <h2 className="text-xl font-bold text-slate-900 mb-2">Message Sent!</h2>
          <p className="text-slate-500 text-sm leading-relaxed">
            Thanks for reaching out. We'll get back to you as soon as possible.
          </p>
          <button
            onClick={() => setStatus('idle')}
            className="mt-6 text-sm text-blue-600 hover:text-blue-700 font-medium"
          >
            Send another message
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-slate-50">
      <div className="max-w-2xl mx-auto px-4 py-16">
        <div className="text-center mb-10">
          <h1 className="text-3xl font-bold text-slate-900 tracking-tight">Contact Us</h1>
          <p className="mt-3 text-slate-500 text-base leading-relaxed">
            Have a question or want to work with us? Send us a message and we'll get back to you.
          </p>
        </div>

        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm px-8 py-8">
          <form onSubmit={handleSubmit} className="space-y-5">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1.5">Full Name</label>
                <input
                  type="text"
                  value={fullName}
                  onChange={e => setFullName(e.target.value)}
                  required
                  placeholder="Jane Smith"
                  className="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400 placeholder:text-slate-400"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1.5">Email Address</label>
                <input
                  type="email"
                  value={email}
                  onChange={e => setEmail(e.target.value)}
                  required
                  placeholder="jane@company.com"
                  className="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400 placeholder:text-slate-400"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1.5">Subject</label>
              <input
                type="text"
                value={subject}
                onChange={e => setSubject(e.target.value)}
                required
                placeholder="How can we help?"
                className="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400 placeholder:text-slate-400"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1.5">Message</label>
              <textarea
                value={message}
                onChange={e => setMessage(e.target.value)}
                required
                rows={6}
                placeholder="Tell us what's on your mind..."
                className="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400 placeholder:text-slate-400 resize-none"
              />
            </div>

            {status === 'error' && (
              <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl px-4 py-3">
                <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0 mt-0.5" />
                <p className="text-sm text-red-700">{errorMsg}</p>
              </div>
            )}

            <button
              type="submit"
              disabled={status === 'loading'}
              className="w-full flex items-center justify-center gap-2 py-3 px-6 bg-blue-600 text-white text-sm font-semibold rounded-xl hover:bg-blue-700 disabled:opacity-60 transition-colors shadow-sm"
            >
              {status === 'loading'
                ? <><Loader className="w-4 h-4 animate-spin" /> Sending…</>
                : <><Send className="w-4 h-4" /> Send Message</>
              }
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
