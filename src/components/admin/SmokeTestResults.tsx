import { CheckCircle, AlertCircle, Clock } from 'lucide-react';

interface SmokeTestResult {
  success: boolean;
  passed: boolean;
  errors?: Record<string, string>;
  warnings?: string[];
  testResults?: {
    validationPassed: boolean;
    validationErrors?: Record<string, string>;
    dbWriteResult?: string;
    listingId?: string;
    timestamp: string;
    testAgencyId: string;
  };
}

interface SmokeTestResultsProps {
  result: SmokeTestResult | null;
  isLoading?: boolean;
  onClose?: () => void;
}

export function SmokeTestResults({ result, isLoading, onClose }: SmokeTestResultsProps) {
  if (isLoading) {
    return (
      <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
        <div className="flex items-center gap-3">
          <Clock className="text-blue-600 animate-spin" size={20} />
          <div>
            <h3 className="font-semibold text-blue-900">Running smoke test...</h3>
            <p className="text-sm text-blue-700">This typically takes 2-5 seconds</p>
          </div>
        </div>
      </div>
    );
  }

  if (!result) {
    return null;
  }

  const isPassed = result.passed;

  // Determine error type
  let errorType = 'Unknown error';
  if (result.errors) {
    if (result.errors.database) {
      errorType = 'Database error detected';
    } else if (result.errors.network) {
      errorType = 'Network error detected';
    } else {
      errorType = 'Validation errors detected';
    }
  }

  return (
    <div className={`rounded-lg p-4 border-2 ${
      isPassed
        ? 'bg-green-50 border-green-200'
        : 'bg-red-50 border-red-200'
    }`}>
      <div className="flex items-start justify-between mb-4">
        <div className="flex items-center gap-3">
          {isPassed ? (
            <CheckCircle className="text-green-600 flex-shrink-0" size={24} />
          ) : (
            <AlertCircle className="text-red-600 flex-shrink-0" size={24} />
          )}
          <div>
            <h3 className={`font-semibold ${isPassed ? 'text-green-900' : 'text-red-900'}`}>
              {isPassed ? 'Smoke Test Passed' : 'Smoke Test Failed'}
            </h3>
            <p className={`text-sm ${isPassed ? 'text-green-700' : 'text-red-700'}`}>
              {isPassed
                ? 'The live activation flow is working correctly'
                : errorType}
            </p>
          </div>
        </div>
        {onClose && (
          <button
            onClick={onClose}
            className="text-slate-400 hover:text-slate-600"
          >
            ×
          </button>
        )}
      </div>

      {result.testResults && (
        <div className="space-y-3 mb-4">
          <div className="grid grid-cols-2 gap-3 text-sm">
            <div>
              <span className="text-slate-600">Test ID:</span>
              <div className="font-mono text-xs bg-white px-2 py-1 rounded border border-slate-200 mt-1 break-all">
                {result.testResults.testAgencyId}
              </div>
            </div>
            <div>
              <span className="text-slate-600">Timestamp:</span>
              <div className="font-mono text-xs bg-white px-2 py-1 rounded border border-slate-200 mt-1">
                {new Date(result.testResults.timestamp).toLocaleString()}
              </div>
            </div>
          </div>

          <div className="bg-white rounded border border-slate-200 p-3">
            <h4 className="text-sm font-semibold text-slate-900 mb-2">Test Results</h4>
            <dl className="space-y-2 text-sm">
              <div className="flex justify-between">
                <dt className="text-slate-600">Validation:</dt>
                <dd className={result.testResults.validationPassed ? 'text-green-600 font-medium' : 'text-red-600 font-medium'}>
                  {result.testResults.validationPassed ? '✓ Passed' : '✗ Failed'}
                </dd>
              </div>
              <div className="flex justify-between">
                <dt className="text-slate-600">Database Write:</dt>
                <dd className={result.testResults.dbWriteResult === 'Success' ? 'text-green-600 font-medium' : 'text-red-600 font-medium'}>
                  {result.testResults.dbWriteResult || 'N/A'}
                </dd>
              </div>
              {result.testResults.listingId && (
                <div className="flex justify-between">
                  <dt className="text-slate-600">Listing ID:</dt>
                  <dd className="text-slate-900 font-mono text-xs">{result.testResults.listingId}</dd>
                </div>
              )}
            </dl>
          </div>
        </div>
      )}

      {result.errors && Object.keys(result.errors).length > 0 && (
        <div className="bg-white rounded border border-red-200 p-3 mb-4">
          <h4 className="text-sm font-semibold text-red-900 mb-2">
            {Object.keys(result.errors).includes('database') ? 'Database Errors' : 'Validation Errors'}
          </h4>
          <ul className="space-y-2">
            {Object.entries(result.errors).map(([field, error]) => (
              <li key={field} className="text-sm">
                <span className="font-medium text-red-900">{field}:</span>
                <span className="text-red-700 ml-2">{error}</span>
              </li>
            ))}
          </ul>
        </div>
      )}

      {result.warnings && result.warnings.length > 0 && (
        <div className="bg-yellow-50 rounded border border-yellow-200 p-3">
          <h4 className="text-sm font-semibold text-yellow-900 mb-2">Warnings</h4>
          <ul className="space-y-1 text-sm text-yellow-800">
            {result.warnings.map((warning, i) => (
              <li key={i}>• {warning}</li>
            ))}
          </ul>
        </div>
      )}

      {isPassed && (
        <div className="bg-green-100 rounded border border-green-300 p-3 text-sm text-green-900">
          <strong>What this means:</strong> The activation validator, database write path, and slot logic all work correctly. The real thank-you page activation flow is production-ready.
        </div>
      )}
    </div>
  );
}
