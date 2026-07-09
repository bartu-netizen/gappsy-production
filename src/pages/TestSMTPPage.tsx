import { useState } from 'react';
import { Mail, CheckCircle, XCircle, Loader } from 'lucide-react';

export default function TestSMTPPage() {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<{ success: boolean; error?: string } | null>(null);

  const handleSendTest = async () => {
    setLoading(true);
    setResult(null);

    try {
      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const apiUrl = `${supabaseUrl}/functions/v1/smtp-test`;

      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      const data = await response.json();
      setResult(data);
    } catch (error) {
      setResult({
        success: false,
        error: error instanceof Error ? error.message : 'Unknown error'
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="max-w-md w-full">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="flex items-center justify-center mb-6">
            <div className="bg-indigo-50 p-4 rounded-full">
              <Mail className="w-8 h-8 text-indigo-600" />
            </div>
          </div>

          <h1 className="text-2xl font-bold text-gray-900 text-center mb-2">
            SMTP Test
          </h1>
          <p className="text-gray-600 text-center mb-8">
            Send a test email to verify SMTP configuration
          </p>

          <button
            onClick={handleSendTest}
            disabled={loading}
            className="w-full bg-indigo-600 hover:bg-indigo-700 disabled:bg-gray-400 text-white font-medium py-3 px-6 rounded-lg transition-colors flex items-center justify-center gap-2"
          >
            {loading ? (
              <>
                <Loader className="w-5 h-5 animate-spin" />
                Sending...
              </>
            ) : (
              <>
                <Mail className="w-5 h-5" />
                Send SMTP Test Email
              </>
            )}
          </button>

          {result && (
            <div className={`mt-6 p-4 rounded-lg ${result.success ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
              <div className="flex items-start gap-3">
                {result.success ? (
                  <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                ) : (
                  <XCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                )}
                <div>
                  <h3 className={`font-medium ${result.success ? 'text-green-900' : 'text-red-900'}`}>
                    {result.success ? 'Success!' : 'Error'}
                  </h3>
                  <p className={`text-sm mt-1 ${result.success ? 'text-green-700' : 'text-red-700'}`}>
                    {result.success
                      ? 'Test email sent successfully to bartu@gappsy.com'
                      : result.error || 'Failed to send test email'}
                  </p>
                </div>
              </div>
            </div>
          )}

          <div className="mt-6 pt-6 border-t border-gray-200">
            <h3 className="text-sm font-medium text-gray-900 mb-2">Test Details:</h3>
            <ul className="text-sm text-gray-600 space-y-1">
              <li><span className="font-medium">To:</span> bartu@gappsy.com</li>
              <li><span className="font-medium">Subject:</span> SMTP Test — Gappsy</li>
              <li><span className="font-medium">Message:</span> SMTP is working!</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
