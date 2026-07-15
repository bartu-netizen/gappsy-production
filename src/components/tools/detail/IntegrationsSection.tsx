import { Plug } from 'lucide-react';
import type { IntegrationItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

// Real logos for the well-known SaaS products/platforms that show up as
// integrations across many tools' pages — reuses the same favicon-service
// trick already used for tools.logo sitewide, just keyed off a name/slug
// lookup since integration_logo is unpopulated for every row in the DB
// today. Deliberately a short, curated allowlist rather than a generic
// "${slug}.com" guess: some tool_integrations rows are actually scraped nav
// links (e.g. "Blog", "Skip to main content") rather than real products, and
// guessing a domain for those would show a wrong/misleading logo. Anything
// not in this list keeps the plain plug icon, same as before.
const INTEGRATION_DOMAINS: Record<string, string> = {
  'google drive': 'drive.google.com',
  'dropbox': 'dropbox.com',
  'slack': 'slack.com',
  'hubspot': 'hubspot.com',
  'mailchimp': 'mailchimp.com',
  'notion': 'notion.com',
  'jira': 'atlassian.com',
  'zoom': 'zoom.us',
  'storybook': 'storybook.js.org',
  'github': 'github.com',
  'figma': 'figma.com',
  'canva': 'canva.com',
  'zapier': 'zapier.com',
  'facebook': 'facebook.com',
  'instagram': 'instagram.com',
  'youtube': 'youtube.com',
  'linkedin': 'linkedin.com',
  'tiktok': 'tiktok.com',
  'twitter / x': 'x.com',
  'twitter': 'x.com',
  'x (twitter)': 'x.com',
  'pinterest': 'pinterest.com',
  'threads': 'threads.net',
  'bluesky': 'bsky.app',
  'mastodon': 'joinmastodon.org',
  'onedrive': 'onedrive.live.com',
  'unsplash': 'unsplash.com',
  'buffer': 'buffer.com',
  'google business profile': 'business.google.com',
};

function normalizeKey(value: string): string {
  return value.trim().toLowerCase().replace(/[-_]+/g, ' ');
}

function faviconFor(name: string, slug: string | null): string | null {
  const domain = INTEGRATION_DOMAINS[normalizeKey(slug || '')] || INTEGRATION_DOMAINS[normalizeKey(name || '')];
  return domain ? `https://www.google.com/s2/favicons?domain=${domain}&sz=128` : null;
}

export default function IntegrationsSection({ toolName, integrations }: { toolName: string; integrations: IntegrationItem[] }) {
  if (integrations.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow="Integrations" title={`${toolName} integrations`} />
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3">
        {integrations.map((integration) => {
          const logoSrc = integration.integration_logo || faviconFor(integration.integration_name, integration.integration_slug);
          return (
          <Card key={integration.id} hoverLift className="p-4 flex items-center gap-3">
            {logoSrc ? (
              <img src={logoSrc} alt={integration.integration_name} className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
            ) : (
              <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 shrink-0">
                <Plug className="w-4 h-4" />
              </div>
            )}
            <div className="min-w-0">
              <p className="font-medium text-[#0B1221] text-[13.5px] truncate">{integration.integration_name}</p>
              {integration.description && <p className="text-[12px] text-slate-500 truncate">{integration.description}</p>}
            </div>
          </Card>
          );
        })}
      </div>
    </section>
  );
}
