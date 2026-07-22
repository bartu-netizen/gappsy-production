import type { ToolComparisonContent } from './types';

const cockpitCmsVsTinacmsContent: ToolComparisonContent = {
  "verdict": "Cockpit CMS and TinaCMS are both open-source, self-hostable headless CMS options, but they differ sharply in content storage and pricing structure. Cockpit CMS is a PHP-based CMS (MIT core) storing content in a self-hosted SQLite or MongoDB database, with REST and GraphQL APIs, and a one-time €299 Pro license (plus optional €99/year renewal) that unlocks addons like the Autopilot AI assistant and the Layouts & Pages visual builder. TinaCMS is a Git-backed CMS (Apache-2.0) that stores content as Markdown/MDX/JSON/YAML in your repository and includes visual, in-context editing even on its free Tina Cloud tier, with paid Team plans ($24-$249/month) unlocking editorial workflows for larger teams. The decision comes down to whether content should live in a database or in Git, and whether a one-time license or a recurring subscription fits better.",
  "bestForToolA": "Cockpit CMS suits developers who want content in a traditional database (SQLite or MongoDB) with REST and GraphQL access, and who prefer a one-time €299 license over an ongoing subscription.",
  "bestForToolB": "TinaCMS suits teams publishing to static site generators who want free, built-in visual in-context editing tied to Git version history, with the option to scale into paid editorial workflows as the team grows.",
  "whoNeedsBoth": "There's no common scenario for using both on the same project since they're competing headless CMS backends; a developer might evaluate both in parallel when choosing a CMS but would settle on one as the system of record.",
  "keyDifferences": [
    {
      "title": "Content Storage Model",
      "toolA": "Cockpit CMS stores content in a self-hosted SQLite or MongoDB database.",
      "toolB": "TinaCMS stores content directly in a Git repository as Markdown, MDX, JSON, or YAML.",
      "whyItMatters": "Database storage suits dynamic apps; Git storage suits static-site content that benefits from version control.",
      "benefitsWho": "Developers building database-driven apps (Cockpit) versus teams wanting content history tracked in Git (TinaCMS)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Cockpit's Pro tier is a one-time €299 fee per project, with an optional €99/year renewal to keep receiving updates.",
      "toolB": "TinaCMS's paid Team plans are recurring subscriptions, from $24/month ($290/year) up to $249/month for Business.",
      "whyItMatters": "One-time versus recurring pricing changes long-term cost projections significantly.",
      "benefitsWho": "Budget-conscious teams that prefer a one-time cost (Cockpit) versus teams comfortable with predictable monthly SaaS billing (TinaCMS)."
    },
    {
      "title": "Visual Editing Access",
      "toolA": "Cockpit's visual page builder (Layouts & Pages) is only available as part of the paid €299 Pro addon bundle.",
      "toolB": "TinaCMS's visual, in-context editing is included even on the free 2-user Tina Cloud tier.",
      "whyItMatters": "Free access to visual editing lowers the barrier for small teams or solo developers to try it.",
      "benefitsWho": "Small teams or individual developers wanting visual editing without any upfront cost (TinaCMS)."
    },
    {
      "title": "AI Content Assistance",
      "toolA": "Cockpit's Autopilot addon (paid Pro tier) provides AI-assisted content and image generation, plus AI-assisted translation via DeepL or LibreTranslate.",
      "toolB": "TinaCMS lists AI features as still in development on its Team Plus and Business plans.",
      "whyItMatters": "Availability of AI tooling today versus in development affects near-term workflow automation.",
      "benefitsWho": "Teams wanting AI content assistance now are better served by Cockpit's paid Autopilot addon."
    },
    {
      "title": "API Type",
      "toolA": "Cockpit offers both REST and GraphQL APIs.",
      "toolB": "TinaCMS's documented API is GraphQL-based, auto-generated for querying and mutating Git content.",
      "whyItMatters": "REST availability matters for integrations or legacy systems that don't support GraphQL.",
      "benefitsWho": "Teams integrating with REST-only tooling or legacy systems (Cockpit)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Model & Storage",
      "rows": [
        {
          "feature": "Backend content store",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit: SQLite/MongoDB; TinaCMS: Git-backed files"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in multi-language content with AI-assisted translation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cockpit: via DeepL or LibreTranslate"
        }
      ]
    },
    {
      "group": "Editing & Visual Tools",
      "rows": [
        {
          "feature": "Visual in-context/page editing",
          "toolA": "limited",
          "toolB": "available",
          "note": "Cockpit: only via paid Layouts & Pages Pro addon"
        },
        {
          "feature": "AI content assistant",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Cockpit: paid Autopilot addon; TinaCMS: AI features listed as in development"
        },
        {
          "feature": "Full-text search",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Cockpit: paid Detektivo (Meilisearch) addon"
        },
        {
          "feature": "Content revision history",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit: revert to previous versions; TinaCMS: via Git history"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit: MIT; TinaCMS: Apache-2.0"
        },
        {
          "feature": "Paid tier billing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit: one-time €299 (+€99/yr renewal); TinaCMS: recurring $24–$249/month"
        },
        {
          "feature": "Self-hosted without vendor account",
          "toolA": "available",
          "toolB": "available",
          "note": "Cockpit: no account required; TinaCMS: self-hostable backend as Tina Cloud alternative"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How do Cockpit and TinaCMS store content differently?",
      "answer": "Cockpit stores content in a self-hosted SQLite or MongoDB database. TinaCMS stores content as Markdown, MDX, JSON, or YAML directly in your Git repository."
    },
    {
      "question": "Which has cheaper long-term pricing?",
      "answer": "Cockpit's Pro tier is a one-time €299 fee per project, with an optional €99/year renewal for continued updates. TinaCMS's paid Team plans are recurring subscriptions starting at $24/month ($290/year)."
    },
    {
      "question": "Is visual page editing free on either?",
      "answer": "TinaCMS includes visual, in-context editing even on its free 2-user Tina Cloud tier. On Cockpit, the visual page builder (Layouts & Pages) requires the paid €299 Pro addon license."
    },
    {
      "question": "Do either offer AI content assistance?",
      "answer": "Cockpit's Autopilot is a paid Pro addon providing AI content and image generation. TinaCMS lists AI features as still in development on its paid Team Plus and Business plans, so they weren't fully available at time of review."
    },
    {
      "question": "Can both be fully self-hosted without a vendor cloud account?",
      "answer": "Yes. Cockpit requires no account at all and runs on your own PHP server. TinaCMS's Apache-2.0 backend can be self-hosted on any Express-compatible platform as an alternative to Tina Cloud."
    },
    {
      "question": "Which one supports REST APIs?",
      "answer": "Cockpit supports both REST and GraphQL APIs. TinaCMS's documented API is GraphQL-based only."
    }
  ]
};

export default cockpitCmsVsTinacmsContent;
