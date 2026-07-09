import { Component, ErrorInfo, ReactNode } from 'react';

interface Props {
  children: ReactNode;
  fallback?: ReactNode;
}

interface State {
  hasError: boolean;
  error: Error | null;
  errorInfo: ErrorInfo | null;
}

class ErrorBoundary extends Component<Props, State> {
  public state: State = {
    hasError: false,
    error: null,
    errorInfo: null,
  };

  public static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error, errorInfo: null };
  }

  public componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error('React Error Boundary caught an error:', error);
    console.error('Component Stack:', errorInfo.componentStack);
    this.setState({ error, errorInfo });
  }

  private handleReload = () => {
    window.location.href = '/';
  };

  private handleRefresh = () => {
    window.location.reload();
  };

  private copyDebugInfo = () => {
    const { error, errorInfo } = this.state;
    const info = [
      `URL: ${window.location.href}`,
      `Error: ${error?.name}: ${error?.message}`,
      `Stack:\n${error?.stack ?? '(none)'}`,
      `Component Stack:\n${errorInfo?.componentStack ?? '(none)'}`,
    ].join('\n\n');
    navigator.clipboard?.writeText(info).catch(() => {});
  };

  public render() {
    if (!this.state.hasError) return this.props.children;

    if (this.props.fallback !== undefined) {
      return this.props.fallback;
    }

    const isDev = import.meta.env.DEV;
    const isDebug = typeof window !== 'undefined' && new URLSearchParams(window.location.search).get('debug') === '1';
    const showDetails = isDev || isDebug;
    const { error, errorInfo } = this.state;

    return (
      <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', backgroundColor: '#f9fafb', padding: '20px' }}>
        <div style={{ maxWidth: '640px', width: '100%', backgroundColor: '#ffffff', borderRadius: '12px', boxShadow: '0 4px 6px rgba(0,0,0,0.1)', padding: '40px', textAlign: 'center' }}>
          <div style={{ width: '64px', height: '64px', backgroundColor: '#FEE2E2', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 24px' }}>
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#DC2626" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <circle cx="12" cy="12" r="10" />
              <line x1="12" y1="8" x2="12" y2="12" />
              <line x1="12" y1="16" x2="12.01" y2="16" />
            </svg>
          </div>

          <h1 style={{ fontSize: '24px', fontWeight: 600, color: '#111827', marginBottom: '12px' }}>Something went wrong</h1>

          {showDetails && error ? (
            <div style={{ textAlign: 'left', marginBottom: '24px' }}>
              <div style={{ backgroundColor: '#FEF2F2', border: '1px solid #FECACA', borderRadius: '8px', padding: '16px', marginBottom: '12px' }}>
                <p style={{ fontSize: '13px', fontWeight: 700, color: '#991B1B', marginBottom: '6px' }}>
                  {error.name}: {error.message}
                </p>
                <pre style={{ fontSize: '11px', color: '#7F1D1D', overflow: 'auto', maxHeight: '180px', whiteSpace: 'pre-wrap', wordBreak: 'break-all', margin: 0 }}>
                  {error.stack?.split('\n').slice(0, 20).join('\n') ?? ''}
                </pre>
              </div>
              {errorInfo?.componentStack && (
                <div style={{ backgroundColor: '#FFF7ED', border: '1px solid #FED7AA', borderRadius: '8px', padding: '16px', marginBottom: '12px' }}>
                  <p style={{ fontSize: '12px', fontWeight: 700, color: '#92400E', marginBottom: '6px' }}>Component Stack</p>
                  <pre style={{ fontSize: '11px', color: '#78350F', overflow: 'auto', maxHeight: '160px', whiteSpace: 'pre-wrap', margin: 0 }}>
                    {errorInfo.componentStack.trim().split('\n').slice(0, 20).join('\n')}
                  </pre>
                </div>
              )}
              <p style={{ fontSize: '11px', color: '#6B7280' }}>Route: {window.location.pathname}</p>
            </div>
          ) : (
            <p style={{ fontSize: '16px', color: '#6B7280', lineHeight: 1.6, marginBottom: '32px' }}>
              We encountered an unexpected error while loading this page. Please try refreshing or return to the home page.
            </p>
          )}

          <div style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
            <button
              onClick={this.handleRefresh}
              style={{ backgroundColor: '#1E293B', color: '#fff', padding: '10px 22px', borderRadius: '8px', border: 'none', fontSize: '15px', fontWeight: 500, cursor: 'pointer' }}
            >
              Refresh Page
            </button>
            <button
              onClick={this.handleReload}
              style={{ backgroundColor: '#fff', color: '#374151', padding: '10px 22px', borderRadius: '8px', border: '2px solid #D1D5DB', fontSize: '15px', fontWeight: 500, cursor: 'pointer' }}
            >
              Go to Home
            </button>
            {showDetails && (
              <button
                onClick={this.copyDebugInfo}
                style={{ backgroundColor: '#fff', color: '#374151', padding: '10px 22px', borderRadius: '8px', border: '2px solid #D1D5DB', fontSize: '15px', fontWeight: 500, cursor: 'pointer' }}
              >
                Copy Debug Info
              </button>
            )}
          </div>

        </div>
      </div>
    );
  }
}

export default ErrorBoundary;
