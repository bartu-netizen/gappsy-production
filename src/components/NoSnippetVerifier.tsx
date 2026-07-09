import { useEffect, useState } from 'react';

/**
 * VERIFICATION COMPONENT - Shows data-nosnippet element count + NEW global checks
 *
 * Only visible when ?verify=1 is in the URL
 * Use this to prove data-nosnippet attributes are in the live DOM
 *
 * CHECKS:
 * - hasPageZone: #page-nosnippet-zone wrapper (global)
 * - hasTop25Zone: #top25-nosnippet-zone wrapper (nested)
 * - agencyCardCount: Number of agency cards in Top 25
 * - leakCount: Text content outside data-nosnippet (should be 0)
 *
 * Usage: Add ?verify=1 to any state page URL
 * Example: /marketing-agencies-in-new-jersey-united-states/?verify=1
 */
export default function NoSnippetVerifier() {
  const [show, setShow] = useState(false);
  const [totalNosnippetElements, setTotalNosnippetElements] = useState(0);
  const [hasPageZone, setHasPageZone] = useState(false);
  const [hasTop25Zone, setHasTop25Zone] = useState(false);
  const [agencyCardCount, setAgencyCardCount] = useState(0);
  const [leakCount, setLeakCount] = useState(0);
  const [leakSamples, setLeakSamples] = useState<Array<{text: string, selector: string}>>([]);

  useEffect(() => {
    // Check for ?verify=1 in URL
    const urlParams = new URLSearchParams(window.location.search);
    const shouldShow = urlParams.get('verify') === '1';
    setShow(shouldShow);

    if (!shouldShow) return;

    // Helper: Check if element is inside data-nosnippet
    const isInsideNosnippet = (node: Node): boolean => {
      let current = node.parentElement;
      while (current) {
        if (current.hasAttribute('data-nosnippet')) return true;
        current = current.parentElement;
      }
      return false;
    };

    // Helper: Get selector for element
    const getSelector = (element: Element | null): string => {
      if (!element) return 'unknown';
      if (element.id) return `#${element.id}`;
      if (element.className && typeof element.className === 'string') {
        const classes = element.className.split(' ').filter(c => c.length > 0).slice(0, 2).join('.');
        return `${element.tagName.toLowerCase()}${classes ? '.' + classes : ''}`;
      }
      return element.tagName.toLowerCase();
    };

    // Count data-nosnippet elements after React hydration
    const checkInterval = setInterval(() => {
      const nosnippetElements = document.querySelectorAll('[data-nosnippet]');
      const pageZoneElement = document.querySelector('#page-nosnippet-zone[data-nosnippet]');
      const top25ZoneElement = document.querySelector('#top25-nosnippet-zone[data-nosnippet]');
      const agencyCards = document.querySelectorAll('#top25-nosnippet-zone .agency-card');

      setTotalNosnippetElements(nosnippetElements.length);
      setHasPageZone(!!pageZoneElement);
      setHasTop25Zone(!!top25ZoneElement);
      setAgencyCardCount(agencyCards.length);

      // LEAK DETECTOR: Find text nodes outside data-nosnippet
      const leaks: Array<{text: string, selector: string}> = [];
      const walker = document.createTreeWalker(
        document.body,
        NodeFilter.SHOW_TEXT,
        {
          acceptNode: (node: Node) => {
            // Ignore if inside data-nosnippet
            if (isInsideNosnippet(node)) return NodeFilter.FILTER_REJECT;

            const parent = node.parentElement;

            // Allow if inside H1 (page title is OK)
            if (parent?.closest('h1')) return NodeFilter.FILTER_ACCEPT;

            // Ignore if inside breadcrumbs/nav/header (usually short UI text)
            if (parent?.closest('nav, header, [role="navigation"]')) return NodeFilter.FILTER_REJECT;

            // Ignore scripts, styles, hidden elements
            if (parent?.closest('script, style, [hidden], [aria-hidden="true"]')) {
              return NodeFilter.FILTER_REJECT;
            }

            // Check if visible
            if (parent && window.getComputedStyle(parent).display === 'none') {
              return NodeFilter.FILTER_REJECT;
            }

            return NodeFilter.FILTER_ACCEPT;
          }
        }
      );

      let node: Node | null;
      while ((node = walker.nextNode()) && leaks.length < 10) {
        const text = node.textContent?.trim() || '';
        // Only count meaningful text (>= 40 chars, not just whitespace)
        if (text.length >= 40 && /\w/.test(text)) {
          leaks.push({
            text: text.substring(0, 100) + (text.length > 100 ? '...' : ''),
            selector: getSelector(node.parentElement)
          });
        }
      }

      setLeakCount(leaks.length);
      setLeakSamples(leaks);

      // Log to console for verification
      if (nosnippetElements.length > 0) {
        const logData: any = {
          totalNosnippetElements: nosnippetElements.length,
          hasPageZone: !!pageZoneElement,
          hasTop25Zone: !!top25ZoneElement,
          agencyCardCount: agencyCards.length,
          leakCount: leaks.length,
          nosnippetElementDetails: Array.from(nosnippetElements).slice(0, 5).map(el => ({
            tag: el.tagName,
            id: el.id || 'no-id',
            className: typeof el.className === 'string' ? el.className.substring(0, 50) : 'no-class',
            ariaLabel: el.getAttribute('aria-label') || 'none'
          }))
        };

        if (leaks.length > 0) {
          console.warn('⚠️ SNIPPET LEAKS DETECTED:', leaks);
          logData.leakSamples = leaks;
        }

        console.log(leaks.length === 0 ? '✅ NOSNIPPET VERIFICATION:' : '❌ NOSNIPPET VERIFICATION (WITH LEAKS):', logData);
      }
    }, 1000);

    // Clear interval after 5 checks
    setTimeout(() => clearInterval(checkInterval), 5000);

    return () => clearInterval(checkInterval);
  }, []);

  if (!show) return null;

  const allPassed = hasPageZone && hasTop25Zone && agencyCardCount >= 20 && totalNosnippetElements > 20 && leakCount === 0;

  return (
    <div
      data-nosnippet
      style={{
        position: 'fixed',
        bottom: '20px',
        right: '20px',
        background: allPassed ? '#10b981' : '#ef4444',
        color: 'white',
        padding: '16px 20px',
        borderRadius: '12px',
        boxShadow: '0 4px 12px rgba(0, 0, 0, 0.3)',
        zIndex: 9999,
        fontFamily: 'monospace',
        fontSize: '13px',
        maxWidth: '360px',
        border: '2px solid rgba(255, 255, 255, 0.2)'
      }}
    >
      <div style={{ fontWeight: 'bold', marginBottom: '8px', fontSize: '14px' }}>
        {allPassed ? '✅ ALL CHECKS PASSED' : (leakCount > 0 ? `❌ LEAK DETECTED: ${leakCount}` : '⚠️ CHECKS INCOMPLETE')}
      </div>
      <div style={{ display: 'grid', gridTemplateColumns: 'auto 1fr', gap: '4px 8px', fontSize: '12px' }}>
        <div>Total nosnippet:</div>
        <div style={{ fontWeight: 'bold' }}>{totalNosnippetElements}</div>

        <div>hasPageZone:</div>
        <div style={{ fontWeight: 'bold' }}>{hasPageZone ? '✅ true' : '❌ false'}</div>

        <div>hasTop25Zone:</div>
        <div style={{ fontWeight: 'bold' }}>{hasTop25Zone ? '✅ true' : '❌ false'}</div>

        <div>agencyCardCount:</div>
        <div style={{ fontWeight: 'bold' }}>{agencyCardCount}</div>

        <div>leakCount:</div>
        <div style={{ fontWeight: 'bold', color: leakCount === 0 ? '#86efac' : '#fca5a5' }}>{leakCount}</div>
      </div>
      {leakCount > 0 && (
        <div style={{
          marginTop: '8px',
          paddingTop: '8px',
          borderTop: '1px solid rgba(255, 255, 255, 0.3)',
          fontSize: '11px'
        }}>
          <div style={{ fontWeight: 'bold', marginBottom: '4px' }}>Leak Samples (first 3):</div>
          {leakSamples.slice(0, 3).map((leak, i) => (
            <div key={i} style={{ marginBottom: '6px', opacity: 0.9 }}>
              <div style={{ fontWeight: 'bold', fontSize: '10px' }}>{leak.selector}</div>
              <div style={{ fontSize: '10px', opacity: 0.8 }}>{leak.text}</div>
            </div>
          ))}
        </div>
      )}
      <div style={{
        marginTop: '8px',
        paddingTop: '8px',
        borderTop: '1px solid rgba(255, 255, 255, 0.3)',
        fontSize: '11px',
        opacity: 0.9
      }}>
        Open DevTools Console for details
      </div>
    </div>
  );
}
