type MetricName = 'LCP' | 'FCP' | 'CLS' | 'TTFB' | 'FID' | 'INP';

interface PerfEntry {
  name: MetricName;
  value: number;
  rating: 'good' | 'needs-improvement' | 'poor';
}

const thresholds: Record<MetricName, [number, number]> = {
  LCP: [2500, 4000],
  FCP: [1800, 3000],
  CLS: [0.1, 0.25],
  TTFB: [800, 1800],
  FID: [100, 300],
  INP: [200, 500],
};

function rate(name: MetricName, value: number): PerfEntry['rating'] {
  const [good, poor] = thresholds[name];
  if (value <= good) return 'good';
  if (value <= poor) return 'needs-improvement';
  return 'poor';
}

function log(entry: PerfEntry) {
  const color = entry.rating === 'good' ? '#0c6' : entry.rating === 'needs-improvement' ? '#fa0' : '#e33';
  const unit = entry.name === 'CLS' ? '' : 'ms';
  const val = entry.name === 'CLS' ? entry.value.toFixed(3) : Math.round(entry.value);
  console.log(
    `%c[Perf] ${entry.name}: ${val}${unit} (${entry.rating})`,
    `color:${color};font-weight:bold`
  );
}

export function initPerfObserver() {
  if (typeof window === 'undefined' || !('PerformanceObserver' in window)) return;

  try {
    const lcpObserver = new PerformanceObserver((list) => {
      const entries = list.getEntries();
      const last = entries[entries.length - 1];
      if (last) {
        const value = last.startTime;
        log({ name: 'LCP', value, rating: rate('LCP', value) });
      }
    });
    lcpObserver.observe({ type: 'largest-contentful-paint', buffered: true });

    const fcpObserver = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        if (entry.name === 'first-contentful-paint') {
          log({ name: 'FCP', value: entry.startTime, rating: rate('FCP', entry.startTime) });
        }
      }
    });
    fcpObserver.observe({ type: 'paint', buffered: true });

    let clsValue = 0;
    const clsObserver = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        if (!(entry as any).hadRecentInput) {
          clsValue += (entry as any).value;
        }
      }
    });
    clsObserver.observe({ type: 'layout-shift', buffered: true });

    const navObserver = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        const nav = entry as PerformanceNavigationTiming;
        if (nav.responseStart) {
          log({ name: 'TTFB', value: nav.responseStart, rating: rate('TTFB', nav.responseStart) });
        }
      }
    });
    navObserver.observe({ type: 'navigation', buffered: true });

    window.addEventListener('visibilitychange', () => {
      if (document.visibilityState === 'hidden' && clsValue > 0) {
        log({ name: 'CLS', value: clsValue, rating: rate('CLS', clsValue) });
      }
    }, { once: true });
  } catch {
    // PerformanceObserver not supported for some entry types
  }
}
