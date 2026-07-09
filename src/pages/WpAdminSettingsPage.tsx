import { useState } from 'react';
import { Key, Copy, Check, RefreshCw, AlertCircle, Info } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

export default function WpAdminSettingsPage() {
  const [newSecret, setNewSecret] = useState('');
  const [showSecret, setShowSecret] = useState(false);
  const [copied, setCopied] = useState(false);

  const generateRandomSecret = () => {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789';
    const length = 32;
    let result = '';
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  };

  const handleGenerateSecret = () => {
    const secret = generateRandomSecret();
    setNewSecret(secret);
    setShowSecret(true);
    setCopied(false);
    localStorage.setItem('admin_import_secret', secret);
  };

  const handleCopySecret = async () => {
    if (newSecret) {
      await navigator.clipboard.writeText(newSecret);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    }
  };

  return (
    <WpAdminLayout title="Settings & Secrets" subtitle="Manage import secrets and system configuration">
      <div className="bg-white rounded-xl border border-slate-200 p-6 sm:p-8 space-y-8">
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-6">
              <div className="flex gap-3">
                <Info className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <div className="flex-1">
                  <h3 className="font-semibold text-blue-900 mb-2">About Import Secrets</h3>
                  <p className="text-sm text-blue-800 leading-relaxed">
                    The <strong>ADMIN_IMPORT_SECRET</strong> is required for state JSON imports and bulk logo uploads.
                    Generate a secret below, then add it to your Bolt Backend Secret Keys to activate it.
                  </p>
                </div>
              </div>
            </div>

            <div className="space-y-4">
              <h2 className="text-xl font-bold text-gray-900">Generate Import Secret</h2>
              <p className="text-gray-600">
                Generate a secure random secret for state imports.
              </p>

              <button
                onClick={handleGenerateSecret}
                className="flex items-center gap-2 px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-colors font-medium"
              >
                <RefreshCw className="w-4 h-4" />
                Generate New Secret
              </button>

              {newSecret && showSecret && (
                <div className="mt-6 space-y-4">
                  <div className="bg-gray-50 border border-gray-300 rounded-lg p-4">
                    <div className="flex items-start justify-between gap-4 mb-3">
                      <div className="flex-1">
                        <label className="block text-sm font-semibold text-gray-700 mb-2">
                          Your New Secret
                        </label>
                        <div className="flex items-center gap-2">
                          <code className="flex-1 px-4 py-3 bg-white border border-gray-300 rounded-lg font-mono text-sm break-all">
                            {newSecret}
                          </code>
                          <button
                            onClick={handleCopySecret}
                            className="flex items-center gap-2 px-4 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-colors flex-shrink-0"
                          >
                            {copied ? (
                              <>
                                <Check className="w-4 h-4 text-green-600" />
                                <span className="text-sm font-medium">Copied!</span>
                              </>
                            ) : (
                              <>
                                <Copy className="w-4 h-4" />
                                <span className="text-sm font-medium">Copy</span>
                              </>
                            )}
                          </button>
                        </div>
                      </div>
                    </div>

                    <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                      <div className="flex gap-2">
                        <AlertCircle className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
                        <div className="flex-1">
                          <p className="text-sm font-semibold text-yellow-900 mb-1">
                            Action Required
                          </p>
                          <p className="text-sm text-yellow-800">
                            Copy the secret below and add it to your Bolt Backend Secret Keys as <strong>ADMIN_IMPORT_SECRET</strong>.
                            Once configured, it will work immediately for all admin tools.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="bg-white border border-gray-300 rounded-lg p-6">
                    <h3 className="text-lg font-bold text-gray-900 mb-4">
                      Setup Instructions
                    </h3>
                    <ol className="space-y-4 text-sm text-gray-700">
                      <li className="flex gap-3">
                        <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xs">
                          1
                        </span>
                        <div className="flex-1">
                          <p className="font-semibold mb-1">Copy the secret above</p>
                          <p className="text-gray-600">Click the "Copy" button to copy the secret to your clipboard.</p>
                        </div>
                      </li>
                      <li className="flex gap-3">
                        <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xs">
                          2
                        </span>
                        <div className="flex-1">
                          <p className="font-semibold mb-1">Add to Bolt Backend Secret Keys</p>
                          <p className="text-gray-600 mb-2">
                            In your Bolt project backend, navigate to <strong>Secret Keys</strong> and add:
                          </p>
                          <div className="bg-gray-50 rounded p-2 font-mono text-xs">
                            Key: <strong>ADMIN_IMPORT_SECRET</strong><br />
                            Value: <em>(paste the secret you copied)</em>
                          </div>
                        </div>
                      </li>
                      <li className="flex gap-3">
                        <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xs">
                          3
                        </span>
                        <div className="flex-1">
                          <p className="font-semibold mb-1">Use in admin tools</p>
                          <p className="text-gray-600">
                            Paste this same secret into:
                          </p>
                          <ul className="list-disc list-inside mt-1 space-y-1 text-gray-600">
                            <li><strong>/admin/logo-upload</strong> - Bulk logo upload tool</li>
                            <li><strong>/admin/import</strong> - State JSON import tool</li>
                          </ul>
                        </div>
                      </li>
                    </ol>
                  </div>
                </div>
              )}
            </div>

            <div className="border-t pt-8">
              <h2 className="text-xl font-bold text-gray-900 mb-4">How It Works</h2>
              <div className="bg-gray-50 rounded-lg p-6 space-y-3">
                <div className="flex items-start gap-3">
                  <Key className="w-5 h-5 text-gray-400 flex-shrink-0 mt-0.5" />
                  <div className="flex-1">
                    <p className="text-sm font-medium text-gray-700 mb-1">Environment Variable</p>
                    <code className="text-sm bg-white px-3 py-1.5 rounded border border-gray-200 inline-block">
                      ADMIN_IMPORT_SECRET
                    </code>
                  </div>
                </div>
                <div className="text-sm text-gray-600 pl-8">
                  <p>
                    The edge functions read this value from Bolt Backend Secret Keys.
                    Admin tools send the secret you enter via <strong>x-admin-secret</strong> header.
                    If they match, authentication succeeds.
                  </p>
                </div>
              </div>
            </div>
      </div>
    </WpAdminLayout>
  );
}
