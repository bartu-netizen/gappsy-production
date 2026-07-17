import type { ToolComparisonContent } from './types';

const ninoxVsStackerContent: ToolComparisonContent = {
  "verdict": "Ninox and Stacker both use AI to generate no-code applications, but they're structured for different pricing habits and different audiences. Ninox is a compliance-documented (ISO 27001, GDPR, ISO 9001), German-hosted database platform founded in 2014 in Berlin, priced per user/seat (€25-€40/month) with an indefinitely free plan for up to 5 users. Stacker is a credit-based platform ($50/month for 250 credits, no per-seat charges) built around white-labeled customer portals and 2,000+ integrations, but its facts don't document founding year, headquarters, or compliance certifications.",
  "bestForToolA": "Teams that need documented compliance certifications (ISO 27001, GDPR, ISO 9001) and data hosted in Germany, that prefer per-user seat pricing over credit consumption, and that want an indefinitely free plan for small teams (up to 5 users) rather than a time-limited trial.",
  "bestForToolB": "Teams that need unlimited, white-labeled customer-facing portals with custom domains, that want AI able to restructure an entire existing app (not just generate templates), and that need broad third-party connectivity (2,000+ integrations) without per-seat pricing.",
  "whoNeedsBoth": "A company that needs an internally governed, compliance-hosted system of record (Ninox, for German-hosted, ISO-certified data) alongside a client-facing portal layer with white-labeled branding and custom domains (Stacker, which documents unlimited customer portals that Ninox does not) could reasonably run Ninox as the backend of record and Stacker as the external-facing layer.",
  "keyDifferences": [
    {
      "title": "Pricing structure: per-seat vs. credit-based",
      "toolA": "Ninox charges per user/month (€25 Team, €40 Business, billed annually), with storage and record limits scaling per user.",
      "toolB": "Stacker charges $50/month for 250 credits on its Standard plan with no per-seat charges, scaling up to $2,000/month for heavier usage.",
      "whyItMatters": "Per-seat pricing is predictable as headcount is known in advance, while credit-based pricing can flex with usage but is harder to forecast, as Stacker's own documentation acknowledges.",
      "benefitsWho": "Finance teams that need predictable per-user budgeting (Ninox) versus teams with fluctuating usage that don't want to pay per seat (Stacker)."
    },
    {
      "title": "Compliance and hosting documentation",
      "toolA": "Ninox documents ISO 27001, GDPR, and ISO 9001 compliance with German-hosted data centers, plus a founding year (2014) and headquarters (Berlin).",
      "toolB": "Stacker's facts do not document any compliance certifications, founding year, or headquarters.",
      "whyItMatters": "Documented certifications and a known legal entity/location matter for procurement and data-residency reviews, particularly for regulated industries.",
      "benefitsWho": "Compliance and IT security teams performing vendor due diligence."
    },
    {
      "title": "Customer-facing portals",
      "toolA": "Ninox's documented views are internal record-management views (table, form, chart, kanban, maps, calendar); no customer-facing portal feature is documented.",
      "toolB": "Stacker explicitly offers white-labeled, unlimited customer portals with custom domains, even on the Standard plan.",
      "whyItMatters": "A dedicated customer portal feature signals the platform is designed for external-facing use, not just internal data management.",
      "benefitsWho": "Teams building client-facing applications rather than purely internal databases."
    },
    {
      "title": "Integration breadth",
      "toolA": "Ninox's documented integrations are Gmail and Outlook (Workplace collaboration); broader third-party connectivity is not documented.",
      "toolB": "Stacker documents connections to 2,000+ third-party tools.",
      "whyItMatters": "A large integration catalog reduces the need for custom connectors when building apps that pull from multiple existing systems.",
      "benefitsWho": "Teams that need to connect many external tools rather than working primarily from data entered directly into the platform."
    },
    {
      "title": "Depth of AI editing",
      "toolA": "Ninox's AI-assisted app building generates apps from user descriptions; advanced AI prompts are gated to the Business plan and above.",
      "toolB": "Stacker's AI can redesign layouts, add features, and restructure entire existing applications on request, and can generate custom code components.",
      "whyItMatters": "The ability to have AI modify an already-built app (not just generate it once) changes how iterative the build process can be.",
      "benefitsWho": "Teams that expect to iterate heavily on an app's structure after initial creation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Trial",
      "rows": [
        {
          "feature": "Indefinite free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Ninox: up to 5 users, no credit card, no time limit."
        },
        {
          "feature": "Free trial with credits",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stacker: $100 in credits, no credit card required."
        },
        {
          "feature": "Credit-based usage pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Ninox is per-seat priced; Stacker is credit-consumption priced."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Natural-language app generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI can restructure/redesign an existing app",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Advanced AI prompts gated by plan tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ninox: Business plan and above."
        }
      ]
    },
    {
      "group": "Portals & Customer-Facing Access",
      "rows": [
        {
          "feature": "White-labeled customer portals",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom domains",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ninox: from Team plan."
        }
      ]
    },
    {
      "group": "Compliance & Integrations",
      "rows": [
        {
          "feature": "ISO / GDPR certification documented",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Third-party integrations",
          "toolA": "limited",
          "toolB": "available",
          "note": "Ninox: Gmail/Outlook documented; Stacker: 2,000+."
        },
        {
          "feature": "REST API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ninox: tiered API call limits by plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Ninox have a free plan?",
      "answer": "Yes. The Free plan supports up to 5 users, 5,000 records, and 100 MB storage indefinitely, with no credit card required."
    },
    {
      "question": "Does Stacker offer a free trial?",
      "answer": "Yes. New users get $100 in credits with no credit card required."
    },
    {
      "question": "Where is Ninox headquartered?",
      "answer": "Berlin, Germany. Ninox was founded in 2014."
    },
    {
      "question": "How does Stacker's pricing work?",
      "answer": "It's credit-based: the Standard plan is $50/month for 250 credits, with higher credit tiers available up to $2,000/month, and no per-seat charges."
    },
    {
      "question": "Does Stacker charge per user?",
      "answer": "No. Stacker states there are no per-seat charges on its Standard plan."
    },
    {
      "question": "What compliance certifications does Ninox have?",
      "answer": "ISO 27001, GDPR, and ISO 9001, with data hosted in German data centers."
    }
  ]
};

export default ninoxVsStackerContent;
