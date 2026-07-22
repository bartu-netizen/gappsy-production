import type { ToolComparisonContent } from './types';

const cockpitCmsVsPubliiContent: ToolComparisonContent = {
  "verdict": "Cockpit CMS and Publii solve very different publishing problems despite both being free and open source. Cockpit CMS is a self-hosted, PHP-based headless CMS (MIT core) that exposes REST and GraphQL APIs for developers building custom frontends, with role-based permissions for multi-user teams and advanced tooling (AI assistant, full-text search, visual page builder) gated behind a one-time €299 Pro license. Publii is a GPL-3.0 desktop application (Windows, macOS, Linux) that generates static websites with no server required, bundling SEO structured data, sitemaps, and GDPR/CCPA cookie-consent tooling into its free core, but with no built-in multi-user collaboration. The right fit depends on whether you need an API-driven backend for a custom app (Cockpit) or a zero-server static site with built-in SEO/compliance tooling for a single publisher (Publii).",
  "bestForToolA": "Cockpit CMS suits developers building custom, API-driven frontends who need multi-user role-based permissions and are willing to pay a one-time €299 Pro license for advanced tooling.",
  "bestForToolB": "Publii suits solo bloggers or small site owners who want a free, no-server static site generator with built-in SEO and GDPR/CCPA compliance tooling, deployed to platforms like GitHub Pages or Netlify.",
  "whoNeedsBoth": "There's no realistic scenario for combining them on one site, since Cockpit powers dynamic API-driven applications while Publii outputs static sites directly. An organization could use Cockpit as an app backend while separately maintaining an unrelated static marketing microsite in Publii, but that's two independent projects, not an integration.",
  "keyDifferences": [
    {
      "title": "Server Requirement",
      "toolA": "Cockpit CMS requires a self-hosted PHP 7.3+ server with SQLite or MongoDB and Apache with mod_rewrite.",
      "toolB": "Publii is a desktop app that generates static site files with no server required to run the CMS itself.",
      "whyItMatters": "Server requirements affect ongoing hosting cost, security maintenance, and technical overhead.",
      "benefitsWho": "Publishers who want to avoid managing any backend server (Publii) versus developers who want a live API backend (Cockpit)."
    },
    {
      "title": "API for Custom Frontends",
      "toolA": "Cockpit exposes REST and GraphQL APIs compatible with Next.js, React, Vue, Svelte, PHP, and Node.js.",
      "toolB": "Publii does not offer an API since it generates static site files directly rather than serving content dynamically.",
      "whyItMatters": "An API is required for building a custom, app-like frontend separate from the CMS itself.",
      "benefitsWho": "Developers building custom applications that consume content via API (Cockpit)."
    },
    {
      "title": "Multi-User Collaboration",
      "toolA": "Cockpit includes fine-grained, role-based permissions for multiple user roles.",
      "toolB": "Publii's cons explicitly note no built-in multi-user/team collaboration.",
      "whyItMatters": "Teams with multiple contributors need role-based access controls to manage who can edit or publish.",
      "benefitsWho": "Teams with multiple editors or content contributors (Cockpit)."
    },
    {
      "title": "Built-In SEO & Compliance Tooling",
      "toolA": "Cockpit's SEO tools ship inside the paid Layouts & Pages Pro addon (part of the €299 license).",
      "toolB": "Publii includes SEO structured data, Open Graph tags, auto-generated XML sitemaps, and GDPR/CCPA cookie-banner and Google Consent Mode v2 support in its free core.",
      "whyItMatters": "Free, built-in SEO and compliance tooling reduces setup work and cost for smaller publishers.",
      "benefitsWho": "Solo bloggers or small businesses that want compliance tooling without paying extra (Publii)."
    },
    {
      "title": "Pricing to Unlock Advanced Features",
      "toolA": "Cockpit's advanced tooling (AI assistant, search, visual builder, sync) requires the one-time €299 Pro license.",
      "toolB": "Publii's core is entirely free under GPL-3.0; only optional premium marketplace themes and plugins cost extra.",
      "whyItMatters": "Determines whether advanced features are truly free or gated behind a paid license.",
      "benefitsWho": "Budget-conscious solo publishers wanting maximum functionality at zero cost (Publii)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture & Deployment",
      "rows": [
        {
          "feature": "Requires a self-hosted server",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Cockpit needs PHP 7.3+/Apache; Publii is a desktop app with no server"
        },
        {
          "feature": "REST/GraphQL API for custom frontends",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Generates static site output",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Deploy targets (GitHub Pages, Netlify, S3, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Editing & Content Tools",
      "rows": [
        {
          "feature": "Multi-user roles/permissions",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Content revisions/version history",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Visual page builder",
          "toolA": "limited",
          "toolB": "available",
          "note": "Cockpit: paid Layouts & Pages addon; Publii: built-in post editors with galleries, video, code highlighting"
        },
        {
          "feature": "Built-in multi-language content",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "SEO, Compliance & Pricing",
      "rows": [
        {
          "feature": "Built-in SEO structured data/sitemaps",
          "toolA": "limited",
          "toolB": "available",
          "note": "Cockpit: paid Pro addon only"
        },
        {
          "feature": "GDPR/CCPA compliance tooling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Publii: cookie banner + Google Consent Mode v2"
        },
        {
          "feature": "Fully free core with no required license",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit core is free; advanced addons cost €299"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Publii need a server to run, unlike Cockpit?",
      "answer": "Correct. Publii is a desktop app (Windows, macOS, Linux) that generates static sites deployed to targets like GitHub Pages, Netlify, or S3, with no server needed. Cockpit requires a self-hosted PHP 7.3+ server with SQLite or MongoDB."
    },
    {
      "question": "Which is better for teams rather than solo publishers?",
      "answer": "Cockpit supports role-based permissions for multiple users. Publii's cons explicitly note it has no built-in multi-user/team collaboration."
    },
    {
      "question": "Is SEO tooling free on both?",
      "answer": "Publii includes SEO structured data, Open Graph tags, and auto-generated sitemaps in its free core. Cockpit's equivalent SEO tools ship inside the paid Layouts & Pages Pro addon (€299 one-time)."
    },
    {
      "question": "Does either handle GDPR/cookie compliance out of the box?",
      "answer": "Publii includes an advanced cookie banner and Google Consent Mode v2 support built in. This isn't documented as a Cockpit feature."
    },
    {
      "question": "Which costs more to unlock full features?",
      "answer": "Cockpit's advanced tooling (AI assistant, search, visual builder, sync) requires the €299 one-time Pro license. Publii's core is entirely free under GPL-3.0, with only optional premium marketplace themes and plugins costing extra."
    },
    {
      "question": "Can Cockpit power a custom frontend the way an API-driven CMS does?",
      "answer": "Yes. Cockpit exposes REST and GraphQL APIs for custom frontends built with Next.js, React, Vue, Svelte, PHP, or Node.js. Publii does not offer an API since it directly generates static site files instead."
    }
  ]
};

export default cockpitCmsVsPubliiContent;
