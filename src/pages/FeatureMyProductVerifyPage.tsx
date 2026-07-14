import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Check, Loader2, Copy, ShieldCheck } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';
import OnboardingShell from '../components/featureMyProduct/onboarding/OnboardingShell';
import { vendorOwnershipVerify, vendorOnboarding } from '../lib/vendorOnboardingApi';

type Method = 'html_meta_tag' | 'dns_txt' | 'html_file';

interface TokenData {
  verified: boolean;
  website: string | null;
  meta_tag_snippet: string | null;
  dns_txt_record: { host: string; value: string } | null;
  html_file: { path: string; body: string } | null;
}

export default function FeatureMyProductVerifyPage() {
  const { token } = useParams<{ token: string }>();
  const [data, setData] = useState<TokenData | null>(null);
  const [loadState, setLoadState] = useState<'loading' | 'ready' | 'not_found' | 'expired'>('loading');
  const [method, setMethod] = useState<Method>('html_meta_tag');
  const [checking, setChecking] = useState(false);
  const [checkResult, setCheckResult] = useState<'idle' | 'fail' | 'success'>('idle');
  const [copied, setCopied] = useState<string | null>(null);

  useEffect(() => {
    if (!token) return;
    vendorOwnershipVerify.get(token).then((res) => {
      if (!res.ok) {
        setLoadState(res.error_code === 'expired' ? 'expired' : 'not_found');
        return;
      }
      setData(res);
      setLoadState('ready');
      if (res.verified) setCheckResult('success');
      if (res.onboarding_session_id) vendorOnboarding.trackEvent(res.onboarding_session_id, 'verification_started', { token });
    }).catch(() => setLoadState('not_found'));
  }, [token]);

  async function handleCheck() {
    if (!token || checking) return;
    setChecking(true);
    const res = await vendorOwnershipVerify.check(token, method);
    setChecking(false);
    setCheckResult(res.ok && res.verified ? 'success' : 'fail');
  }

  function copy(text: string, label: string) {
    navigator.clipboard?.writeText(text);
    setCopied(label);
    setTimeout(() => setCopied(null), 2000);
  }

  return (
    <>
      <EntitySEOTags title="Verify Ownership | Gappsy" description="Verify ownership of your featured listing." path={`/feature-my-product/verify/${token || ''}`} noindex />
      <OnboardingShell step={0}>
        <div className="flex-1 w-full max-w-md mx-auto px-5 sm:px-6 py-8">
          {loadState === 'loading' && (
            <div className="flex items-center justify-center py-16"><Loader2 className="w-6 h-6 text-[#7C3AED] animate-spin" /></div>
          )}

          {loadState === 'not_found' && (
            <div className="text-center py-16">
              <h1 className="text-xl font-bold text-[#0B1221]">Verification link not found</h1>
              <p className="mt-2 text-sm text-slate-500">Double-check the link, or contact support for a new one.</p>
            </div>
          )}

          {loadState === 'expired' && (
            <div className="text-center py-16">
              <h1 className="text-xl font-bold text-[#0B1221]">This link has expired</h1>
              <p className="mt-2 text-sm text-slate-500">Contact support and we'll send you a new verification link.</p>
            </div>
          )}

          {loadState === 'ready' && data && checkResult === 'success' && (
            <div>
              <div className="w-12 h-12 rounded-full bg-emerald-50 flex items-center justify-center mb-4"><Check className="w-6 h-6 text-emerald-500" /></div>
              <h1 className="text-2xl font-bold tracking-tight text-[#0B1221]">Ownership verified</h1>
              <p className="mt-2 text-[15px] text-slate-500 leading-relaxed">
                You're all set. Your featured listing will activate once our editorial team completes its eligibility review.
              </p>
            </div>
          )}

          {loadState === 'ready' && data && checkResult !== 'success' && (
            <div>
              <h1 className="text-2xl font-bold tracking-tight text-[#0B1221]">Verify ownership</h1>
              <p className="mt-2 text-[15px] text-slate-500 leading-relaxed">
                Prove you control <strong>{data.website}</strong> using one of the methods below.
              </p>

              <div className="mt-5 flex gap-2">
                {(['html_meta_tag', 'dns_txt', 'html_file'] as Method[]).map((m) => (
                  <button
                    key={m}
                    type="button"
                    onClick={() => { setMethod(m); setCheckResult('idle'); }}
                    className={`flex-1 px-3 py-2 rounded-lg text-xs font-semibold transition-colors ${method === m ? 'bg-[#4F46E5] text-white' : 'bg-slate-50 text-slate-500 hover:bg-slate-100'}`}
                  >
                    {m === 'html_meta_tag' ? 'Meta tag' : m === 'dns_txt' ? 'DNS TXT' : 'HTML file'}
                  </button>
                ))}
              </div>

              <div className="mt-4 rounded-xl bg-slate-50 border border-[#f1f3f5] p-4">
                {method === 'html_meta_tag' && data.meta_tag_snippet && (
                  <>
                    <p className="text-xs text-slate-500 mb-2">Add this to your homepage's <code>&lt;head&gt;</code>:</p>
                    <code className="block text-[12px] text-slate-700 break-all bg-white rounded-lg border border-slate-200 px-3 py-2">{data.meta_tag_snippet}</code>
                    <button type="button" onClick={() => copy(data.meta_tag_snippet!, 'meta')} className="mt-2 inline-flex items-center gap-1 text-xs font-medium text-[#4F46E5]"><Copy className="w-3 h-3" />{copied === 'meta' ? 'Copied' : 'Copy'}</button>
                  </>
                )}
                {method === 'dns_txt' && data.dns_txt_record && (
                  <>
                    <p className="text-xs text-slate-500 mb-2">Add a TXT record:</p>
                    <div className="space-y-1.5 text-[12px]">
                      <div className="bg-white rounded-lg border border-slate-200 px-3 py-2"><span className="text-slate-400">Host: </span><span className="text-slate-700 break-all">{data.dns_txt_record.host}</span></div>
                      <div className="bg-white rounded-lg border border-slate-200 px-3 py-2"><span className="text-slate-400">Value: </span><span className="text-slate-700 break-all">{data.dns_txt_record.value}</span></div>
                    </div>
                    <button type="button" onClick={() => copy(data.dns_txt_record!.value, 'dns')} className="mt-2 inline-flex items-center gap-1 text-xs font-medium text-[#4F46E5]"><Copy className="w-3 h-3" />{copied === 'dns' ? 'Copied' : 'Copy value'}</button>
                  </>
                )}
                {method === 'html_file' && data.html_file && (
                  <>
                    <p className="text-xs text-slate-500 mb-2">Publish a file at:</p>
                    <code className="block text-[12px] text-slate-700 break-all bg-white rounded-lg border border-slate-200 px-3 py-2">{data.website?.replace(/\/$/, '')}{data.html_file.path}</code>
                    <p className="text-xs text-slate-500 mt-2 mb-1">containing exactly:</p>
                    <code className="block text-[12px] text-slate-700 break-all bg-white rounded-lg border border-slate-200 px-3 py-2">{data.html_file.body}</code>
                  </>
                )}
              </div>

              {checkResult === 'fail' && (
                <p className="mt-3 text-[13px] text-red-600">We couldn't find it yet — DNS/publishing changes can take a few minutes. Try again shortly.</p>
              )}

              <button
                type="button"
                onClick={handleCheck}
                disabled={checking}
                className="mt-5 w-full flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] disabled:opacity-50 transition-opacity"
              >
                {checking && <Loader2 className="w-4 h-4 animate-spin" />}
                I've added it — check now
              </button>
              <p className="mt-3 flex items-center gap-1.5 text-xs text-slate-400"><ShieldCheck className="w-3.5 h-3.5" />Domain-email match alone is a signal, not proof — one of these methods is required.</p>
            </div>
          )}
        </div>
      </OnboardingShell>
    </>
  );
}
