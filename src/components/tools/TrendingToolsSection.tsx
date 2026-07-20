import { useEffect, useState } from 'react';
import ToolCardRow from './detail/ToolCardRow';
import type { ToolCardData } from '../ToolCard';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

// Real page-view data, not a fabricated "trending" list — see
// trending-tools edge function for the tiered fallback (today → this
// week → rating-sorted) it uses when raw traffic is too thin for a
// meaningful daily ranking, and why the label always matches which tier
// actually produced the result. Reuses ToolCardRow (same component behind
// "Recently updated tools" on this same page) rather than a bespoke card,
// so it reads as one consistent row style, not a bolted-on widget.
export default function TrendingToolsSection() {
  const [tools, setTools] = useState<ToolCardData[]>([]);
  const [label, setLabel] = useState('Trending today');

  useEffect(() => {
    let cancelled = false;
    fetch(`${SUPABASE_URL}/functions/v1/trending-tools`, {
      headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
    })
      .then((res) => res.json())
      .then((data) => {
        if (cancelled || !data?.ok) return;
        setTools(data.tools || []);
        if (data.label) setLabel(data.label);
      })
      .catch(() => {});
    return () => {
      cancelled = true;
    };
  }, []);

  return <ToolCardRow eyebrow="Right now" title={label} tools={tools} minToShow={3} />;
}
