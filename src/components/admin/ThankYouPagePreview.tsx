import { useState, useRef, useEffect } from 'react';
import OtherAgencyCard from '../OtherAgencyCard';
import PostPaymentEditor from '../PostPaymentEditor';
import type { ThankYouTestData } from '../../utils/thankYouPageTestData';
import {
  getThankYouHeadline,
  getConfirmationMessage,
  getCustomizationMessage,
  requiresEditForm
} from '../../utils/productLabels';

interface ThankYouPagePreviewProps {
  testData: ThankYouTestData;
  selectedVariant: string;
  validationMode: 'ui-only' | 'dry-run' | 'live';
  onClose: () => void;
  isValidating?: boolean;
  dryRunResponse?: { valid: boolean; errors?: Record<string, string> };
}

interface ActivationResult {
  status: 'loading' | 'success' | 'error' | 'timeout';
  message?: string;
  errorType?: 'validation' | 'database' | 'timeout' | 'network' | 'unknown';
  timestamp?: string;
  details?: Record<string, unknown>;
}

interface RequestLog {
  timestamp: string;
  mode: string;
  action: string;
  details?: string;
}

const ACTIVATION_TIMEOUT_MS = 20000; // 20 seconds

export function ThankYouPagePreview({
  testData,
  selectedVariant,
  validationMode,
  onClose,
  isValidating = false,
  dryRunResponse
}: ThankYouPagePreviewProps) {
  const [showDebugPanel, setShowDebugPanel] = useState(false);
  const [showPreviewCollapsed, setShowPreviewCollapsed] = useState(false);
  const [activationResult, setActivationResult] = useState<ActivationResult | null>(null);
  const [requestLogs, setRequestLogs] = useState<RequestLog[]>([]);
  const mountedRef = useRef(true);
  const abortControllerRef = useRef<AbortController | null>(null);
  const timeoutIdRef = useRef<NodeJS.Timeout | null>(null);
  const editedAgencyNameRef = useRef<string>("");

  useEffect(() => {
    mountedRef.current = true;
    return () => {
      mountedRef.current = false;
      // Cleanup on unmount
      if (abortControllerRef.current) {
        abortControllerRef.current.abort();
      }
      if (timeoutIdRef.current) {
        clearTimeout(timeoutIdRef.current);
      }
    };
  }, []);

  const addLog = (action: string, details?: string) => {
    const log: RequestLog = {
      timestamp: new Date().toLocaleTimeString(),
      mode: validationMode,
      action,
      details
    };
    if (mountedRef.current) {
      setRequestLogs(prev => [...prev, log]);
    }
  };

  const getTitleByListingType = (): string => {
    return getThankYouHeadline(testData.productType);
  };

  const getConfirmationText = (): string => {
    return getConfirmationMessage(testData.productType);
  };

  const getCustomizationText = (): string => {
    return getCustomizationMessage(testData.productType);
  };

  const shouldShowEditForm = (): boolean => {
    return requiresEditForm(testData.productType);
  };

  const renderPaymentState = () => {
    if (testData.paymentState === 'pending') {
      return (
        <div className="text-center py-12">
          <div className="inline-block">
            <div className="animate-spin rounded-full h-12 w-12 border-4 border-slate-200 border-t-blue-500 mb-4" />
          </div>
          <h2 className="text-2xl font-bold text-slate-900 mb-2">Confirming your payment...</h2>
          <p className="text-slate-600">
            Please wait while we process your order. This typically takes just a few moments.
          </p>
        </div>
      );
    }

    if (testData.paymentState === 'failed') {
      return (
        <div className="text-center py-12 bg-red-50 rounded-lg border border-red-200 p-6">
          <h2 className="text-2xl font-bold text-red-900 mb-2">Payment Failed</h2>
          <p className="text-red-700 mb-4">
            Unfortunately, we couldn't process your payment. Please check your details and try
            again, or contact support if you need assistance.
          </p>
        </div>
      );
    }

    return null;
  };

  return (
    <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-lg max-w-4xl w-full max-h-[90vh] overflow-y-auto">
        <div className="sticky top-0 bg-white border-b border-slate-200 px-6 py-4 flex items-center justify-between">
          <div>
            <h2 className="text-lg font-bold text-slate-900">Thank-you Page Preview</h2>
            <p className="text-xs text-slate-600 mt-1">
              Variant: <span className="font-medium">{selectedVariant}</span>
              {' | Mode: '}
              <span className="font-medium">
                {validationMode === 'ui-only' && 'UI-Only'}
                {validationMode === 'dry-run' && 'Dry-run'}
                {validationMode === 'live' && 'Live'}
              </span>
            </p>
          </div>
          <button
            onClick={onClose}
            className="text-slate-500 hover:text-slate-700 font-bold text-xl"
          >
            ×
          </button>
        </div>

        <div className="p-6">
          {isValidating ? (
            <div className="flex justify-center py-12">
              <div className="text-center">
                <div className="animate-spin rounded-full h-8 w-8 border-4 border-slate-200 border-t-blue-500 mx-auto mb-3" />
                <p className="text-sm text-slate-600">Validating...</p>
              </div>
            </div>
          ) : (
            <>
              {dryRunResponse && validationMode === 'dry-run' && (
                <div
                  className={`mb-6 p-4 rounded border ${
                    dryRunResponse.valid
                      ? 'bg-green-50 border-green-200'
                      : 'bg-red-50 border-red-200'
                  }`}
                >
                  <p
                    className={`text-sm font-medium ${
                      dryRunResponse.valid ? 'text-green-900' : 'text-red-900'
                    }`}
                  >
                    {dryRunResponse.valid ? '✓ Validation passed' : '✗ Validation failed'}
                  </p>
                  {dryRunResponse.errors && Object.keys(dryRunResponse.errors).length > 0 && (
                    <ul className="text-sm text-red-800 mt-2 space-y-1">
                      {Object.entries(dryRunResponse.errors).map(([field, error]) => (
                        <li key={field}>
                          <span className="font-medium">{field}:</span> {error}
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              )}

              {renderPaymentState() || (
                <div className="space-y-8">
                  <div>
                    <h1 className="text-3xl font-bold text-slate-900 mb-2">
                      {getTitleByListingType()}
                    </h1>
                    <p className="text-slate-600">
                      {getConfirmationText()}
                    </p>
                  </div>

                  {shouldShowEditForm() && (
                    <>
                      <div>
                        <h2 className="text-lg font-semibold text-slate-900 mb-4">
                          Review & Update Your Listing
                        </h2>
                        <p className="text-slate-600 mb-4">
                          {getCustomizationText()}
                        </p>
                      </div>

                      <div>
                        <h3 className="text-sm font-semibold text-slate-900 mb-3">
                          Edit Your Listing
                        </h3>
                        <PostPaymentEditor
                        agencyId={testData.agencyId}
                        agencyName={testData.agencyName}
                        stateSlug={testData.stateSlug}
                        stateName={testData.state}
                        initialAgencyName={testData.agencyName}
                        initialIntro={testData.intro}
                        initialServices={testData.services}
                        initialWebsiteUrl={testData.websiteUrl}
                        onAgencyNameChange={(name) => { editedAgencyNameRef.current = name; }}
                        onSaveAndActivate={async (data) => {
                          setActivationResult({ status: 'loading' });
                          setRequestLogs([]);
                          addLog('Activation started', `Mode: ${validationMode}`);

                          try {
                            // Setup abort controller and timeout
                            abortControllerRef.current = new AbortController();

                            let timeoutTriggered = false;
                            timeoutIdRef.current = setTimeout(() => {
                              timeoutTriggered = true;
                              addLog('Timeout', `Request exceeded ${ACTIVATION_TIMEOUT_MS}ms`);
                              if (abortControllerRef.current) {
                                abortControllerRef.current.abort();
                              }
                            }, ACTIVATION_TIMEOUT_MS);

                            addLog('Request initiated', `Endpoint: listing-save-and-activate`);

                            const response = await fetch(
                              `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/listing-save-and-activate`,
                              {
                                method: 'POST',
                                headers: {
                                  'Content-Type': 'application/json',
                                  Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`
                                },
                                body: JSON.stringify({
                                  sessionId: testData.sessionId,
                                  intro: data.intro,
                                  services: data.services,
                                  websiteUrl: data.websiteUrl,
                                  agencyId: testData.agencyId,
                                  agencyName: editedAgencyNameRef.current || testData.agencyName,
                                  listingType: testData.listingType,
                                  dryRun: validationMode === 'dry-run'
                                }),
                                signal: abortControllerRef.current?.signal
                              }
                            );

                            if (timeoutIdRef.current) {
                              clearTimeout(timeoutIdRef.current);
                              timeoutIdRef.current = null;
                            }

                            if (timeoutTriggered) {
                              if (mountedRef.current) {
                                setActivationResult({
                                  status: 'timeout',
                                  errorType: 'timeout',
                                  message: 'Activation request timed out. The server may still be processing. Please check the debug panel / try again.',
                                  timestamp: new Date().toISOString()
                                });
                              }
                              addLog('Result', 'Timeout occurred');
                              return;
                            }

                            addLog('Response received', `Status: ${response.status}`);

                            const result = await response.json();

                            if (!mountedRef.current) return;

                            // Check for validation errors
                            if (result.errors) {
                              let errorType: 'validation' | 'database' | 'unknown' = 'unknown';
                              if (result.errors.database) {
                                errorType = 'database';
                              } else if (Object.keys(result.errors).some(k => ['intro', 'websiteUrl', 'services'].includes(k))) {
                                errorType = 'validation';
                              }

                              setActivationResult({
                                status: 'error',
                                errorType,
                                message: Object.values(result.errors)[0] as string || 'Activation failed',
                                details: result.errors,
                                timestamp: new Date().toISOString()
                              });
                              addLog('Result', `Error (${errorType}): ${Object.values(result.errors)[0]}`);
                              return;
                            }

                            // Success
                            if (mountedRef.current) {
                              setActivationResult({
                                status: 'success',
                                message: 'Listing activated successfully',
                                details: { listingId: result.listingId },
                                timestamp: new Date().toISOString()
                              });
                            }
                            addLog('Result', 'Success');
                          } catch (err) {
                            if (timeoutIdRef.current) {
                              clearTimeout(timeoutIdRef.current);
                              timeoutIdRef.current = null;
                            }

                            if (!mountedRef.current) return;

                            const isAborted = err instanceof Error && err.name === 'AbortError';
                            const isTimeout = isAborted && (err as DOMException).code === 20; // AbortError code

                            if (isTimeout) {
                              setActivationResult({
                                status: 'timeout',
                                errorType: 'timeout',
                                message: 'Activation request timed out. The server may still be processing. Please check the debug panel / try again.',
                                timestamp: new Date().toISOString()
                              });
                              addLog('Result', 'Aborted (timeout)');
                            } else if (isAborted) {
                              setActivationResult({
                                status: 'error',
                                errorType: 'network',
                                message: 'Request was cancelled.',
                                timestamp: new Date().toISOString()
                              });
                              addLog('Result', 'Aborted (cancelled)');
                            } else {
                              const message = err instanceof Error ? err.message : 'Unknown error occurred';
                              setActivationResult({
                                status: 'error',
                                errorType: 'network',
                                message: `${message}`,
                                timestamp: new Date().toISOString()
                              });
                              addLog('Result', `Error: ${message}`);
                            }
                          }
                        }}
                      />
                    </div>

                      <div className="border-t border-slate-200 pt-6">
                        <button
                          onClick={() => setShowPreviewCollapsed(!showPreviewCollapsed)}
                          className="text-sm font-medium text-slate-700 hover:text-slate-900 flex items-center gap-2"
                        >
                          <span>{showPreviewCollapsed ? '▶' : '▼'}</span>
                          {showPreviewCollapsed ? 'Show' : 'Hide'} listing preview
                        </button>

                        {!showPreviewCollapsed && (
                          <div className="mt-4">
                            <h3 className="text-sm font-semibold text-slate-900 mb-3">Preview</h3>
                            <OtherAgencyCard
                              agencyId={testData.agencyId}
                              name={testData.agencyName}
                              location={testData.location || testData.state}
                              stateName={testData.state}
                              stateSlug={testData.stateSlug}
                              intro={testData.intro}
                              services={testData.services}
                              hasCardVisualUpgrade={testData.hasCardVisualUpgrade}
                              disableCheckAvailability={true}
                              hideIntro={false}
                            />
                          </div>
                        )}
                      </div>
                    </>
                  )}

                  <div className="bg-blue-50 border border-blue-200 rounded p-4">
                    <p className="text-xs text-blue-900">
                      <span className="font-semibold">QA Mode:</span> This is a test environment.
                      No actual charges or listings are being created.
                    </p>
                  </div>
                </div>
              )}

              {activationResult && (
                <div className={`mt-6 p-4 rounded border ${
                  activationResult.status === 'success'
                    ? 'bg-green-50 border-green-200'
                    : activationResult.status === 'timeout'
                    ? 'bg-yellow-50 border-yellow-200'
                    : 'bg-red-50 border-red-200'
                }`}>
                  <div className="flex items-start gap-3">
                    <div className="flex-1">
                      <p className={`font-semibold ${
                        activationResult.status === 'success'
                          ? 'text-green-900'
                          : activationResult.status === 'timeout'
                          ? 'text-yellow-900'
                          : 'text-red-900'
                      }`}>
                        {activationResult.status === 'loading' && 'Activating...'}
                        {activationResult.status === 'success' && '✓ Activation succeeded'}
                        {activationResult.status === 'timeout' && '⏱ Activation timed out'}
                        {activationResult.status === 'error' && '✗ Activation failed'}
                      </p>
                      {activationResult.errorType && (
                        <p className="text-xs mt-1 opacity-75">
                          {activationResult.errorType === 'validation' && 'Validation error'}
                          {activationResult.errorType === 'database' && 'Database error'}
                          {activationResult.errorType === 'timeout' && 'Request timeout'}
                          {activationResult.errorType === 'network' && 'Network error'}
                          {activationResult.errorType === 'unknown' && 'Unknown error'}
                        </p>
                      )}
                      {activationResult.message && (
                        <p className={`text-sm mt-2 ${
                          activationResult.status === 'success'
                            ? 'text-green-800'
                            : activationResult.status === 'timeout'
                            ? 'text-yellow-800'
                            : 'text-red-800'
                        }`}>
                          {activationResult.message}
                        </p>
                      )}
                    </div>
                  </div>
                </div>
              )}

              <div className="mt-8 pt-6 border-t border-slate-200">
                <button
                  onClick={() => setShowDebugPanel(!showDebugPanel)}
                  className="text-xs text-slate-600 hover:text-slate-900 font-medium"
                >
                  {showDebugPanel ? '−' : '+'} Debug Panel {requestLogs.length > 0 && `(${requestLogs.length} events)`}
                </button>

                {showDebugPanel && (
                  <div className="mt-4 bg-slate-50 p-4 rounded border border-slate-200 space-y-4">
                    {requestLogs.length > 0 && (
                      <div>
                        <p className="text-xs font-semibold text-slate-700 mb-2">Request Lifecycle:</p>
                        <div className="bg-white p-3 rounded border border-slate-200 space-y-1 max-h-32 overflow-y-auto">
                          {requestLogs.map((log, idx) => (
                            <div key={idx} className="text-xs font-mono text-slate-600">
                              <span className="text-slate-400">{log.timestamp}</span>
                              {' '}
                              <span className="font-semibold text-slate-700">{log.action}</span>
                              {log.details && <span className="text-slate-500"> — {log.details}</span>}
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                    <div>
                      <p className="text-xs font-semibold text-slate-700 mb-1">Test Data:</p>
                      <pre className="text-xs text-slate-600 overflow-x-auto bg-white p-2 rounded border border-slate-200">
                        {JSON.stringify(testData, null, 2)}
                      </pre>
                    </div>
                    {dryRunResponse && (
                      <div>
                        <p className="text-xs font-semibold text-slate-700 mb-1">
                          Validation Response:
                        </p>
                        <pre className="text-xs text-slate-600 overflow-x-auto bg-white p-2 rounded border border-slate-200">
                          {JSON.stringify(dryRunResponse, null, 2)}
                        </pre>
                      </div>
                    )}
                    {activationResult && (
                      <div>
                        <p className="text-xs font-semibold text-slate-700 mb-1">
                          Activation Result:
                        </p>
                        <pre className="text-xs text-slate-600 overflow-x-auto bg-white p-2 rounded border border-slate-200">
                          {JSON.stringify(activationResult, null, 2)}
                        </pre>
                      </div>
                    )}
                  </div>
                )}
              </div>
            </>
          )}
        </div>

        <div className="border-t border-slate-200 px-6 py-4 flex justify-end gap-3">
          <button
            onClick={onClose}
            className="px-4 py-2 border border-slate-300 rounded font-medium text-slate-700 hover:bg-slate-50 transition-colors"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
}
