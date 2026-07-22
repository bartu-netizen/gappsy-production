import type { ToolComparisonContent } from './types';

const nolocoVsWewebContent: ToolComparisonContent = {
  "verdict": "Noloco and WeWeb are both freemium no-code builders with AI assistants, but they diverge on ownership and pricing clarity. Noloco publishes a clear tiered pricing ladder (Free, $99/month Pro, $213/month Business, custom Enterprise) and 40+ named integrations, but doesn't document code export. WeWeb, founded in 2019 and headquartered in Paris, exports production-ready Vue.js code for self-hosting and documents SOC2/HIPAA/GDPR compliance support, but its detailed dollar pricing isn't consistently published on its main site.",
  "bestForToolA": "Teams that want a clear, published pricing ladder to budget against (Free through $213/month Business plan), a large named integration catalog (40+ tools including Airtable, Slack, HubSpot, and Stripe), and a nonprofit discount (50% off any paid plan).",
  "bestForToolB": "Teams that need full code ownership — the ability to export production-ready Vue.js code and self-host it outside the platform — plus documented SOC2/HIPAA/GDPR compliance support and Figma-based design import.",
  "whoNeedsBoth": "A team could reasonably use Noloco to build fast internal tools (a CRM, project tracker, or client portal connected to existing data) while using WeWeb for a customer-facing or public app they want to eventually export and self-host outside either platform — the two serve documented use cases (internal connected apps vs. exportable public apps) that don't fully overlap.",
  "keyDifferences": [
    {
      "title": "Code export and ownership",
      "toolA": "Noloco's Interface Builder is a hosted, point-and-click app creation tool; code export is not documented.",
      "toolB": "WeWeb explicitly outputs production-ready Vue.js Single Page Applications that can be exported and self-hosted.",
      "whyItMatters": "Code export means an organization isn't permanently locked into the platform's hosting, which matters for long-term vendor risk and technical ownership.",
      "benefitsWho": "Technical teams or agencies that want an exit path from the no-code platform itself."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Noloco publishes a full tiered pricing ladder: Free, Pro ($99/month), Business ($213/month), and custom Enterprise.",
      "toolB": "WeWeb's detailed dollar pricing is not consistently published on its main site; pricing lives on a separate, frequently-updated subdomain per the facts available.",
      "whyItMatters": "Published, stable pricing lets a buyer budget without contacting sales, while pricing that lives on a separately-maintained page is harder to compare at a glance.",
      "benefitsWho": "Budget-conscious teams that want to self-serve a cost estimate before engaging with either vendor."
    },
    {
      "title": "Customer proof points and scale",
      "toolA": "Noloco is used by 1,000+ professional services firms, per its documented facts.",
      "toolB": "WeWeb is used by large companies including PwC, L'Oreal, and Carrefour.",
      "whyItMatters": "The customer profile referenced (volume of professional-services firms vs. named large enterprises) signals different typical buyer sizes.",
      "benefitsWho": "Buyers looking for validation from companies similar in size or industry to their own."
    },
    {
      "title": "Compliance documentation",
      "toolA": "Noloco's facts do not document specific compliance certifications.",
      "toolB": "WeWeb documents SOC2, HIPAA, and GDPR compliance support.",
      "whyItMatters": "Documented compliance frameworks matter for teams in regulated industries or handling health/financial data.",
      "benefitsWho": "Security and compliance reviewers evaluating vendor risk."
    },
    {
      "title": "Integration count vs. named data sources",
      "toolA": "Noloco documents 40+ integrations by name, including Airtable, Google Sheets, Slack, HubSpot, and Stripe.",
      "toolB": "WeWeb documents three specific database integrations: Airtable, Xano, and Supabase, plus Figma import for design.",
      "whyItMatters": "A larger named integration catalog (Noloco) suggests broader out-of-the-box connectivity, while WeWeb's shorter list is focused specifically on backend data sources and design tooling.",
      "benefitsWho": "Teams that need to connect many disparate business tools (Noloco) versus teams building from a specific backend and design pipeline (WeWeb)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Noloco: 3 team seats, 7 client seats, 2,000 rows. WeWeb: free tiers referenced among Seat/Hosting plans."
        },
        {
          "feature": "Published detailed pricing",
          "toolA": "available",
          "toolB": "limited",
          "note": "WeWeb's detailed pricing lives on a separate subdomain and isn't consistently published on the main site."
        },
        {
          "feature": "Nonprofit / discount pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Noloco: 50% off any paid plan for nonprofits."
        }
      ]
    },
    {
      "group": "Build & Export",
      "rows": [
        {
          "feature": "AI app generation from prompts",
          "toolA": "available",
          "toolB": "available",
          "note": "Noloco: Nola AI assistant. WeWeb: AI Assistant generates apps, pages, databases, and logic."
        },
        {
          "feature": "Code export / self-hosting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Figma design import",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Data & Access",
      "rows": [
        {
          "feature": "Named integration count",
          "toolA": "available",
          "toolB": "limited",
          "note": "Noloco: 40+ named. WeWeb: 3 database integrations documented (Airtable, Xano, Supabase)."
        },
        {
          "feature": "Granular table/record/field-level permissions",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC2 / HIPAA / GDPR compliance support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Noloco have a free plan?",
      "answer": "Yes. The Free plan includes 3 team seats, 7 client seats, and 2,000 rows, with no credit card required."
    },
    {
      "question": "Can I export code from WeWeb?",
      "answer": "Yes. WeWeb outputs production-ready Vue.js Single Page Applications that can be self-hosted."
    },
    {
      "question": "Where is WeWeb headquartered?",
      "answer": "Paris, France. WeWeb was founded in 2019."
    },
    {
      "question": "What integrations does Noloco support?",
      "answer": "40+ integrations, including Airtable, Google Sheets, Zapier, Slack, HubSpot, Stripe, and QuickBooks."
    },
    {
      "question": "What databases does WeWeb connect to?",
      "answer": "Airtable, Xano, and Supabase, among other data sources."
    },
    {
      "question": "Does Noloco offer a nonprofit discount?",
      "answer": "Yes. Non-profits get a 50% discount on any paid plan."
    }
  ]
};

export default nolocoVsWewebContent;
