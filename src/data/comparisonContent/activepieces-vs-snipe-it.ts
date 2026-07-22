import type { ToolComparisonContent } from './types';

const activepiecesVsSnipeItContent: ToolComparisonContent = {
  "verdict": "Activepieces is a paid workflow automation platform for connecting SaaS apps across HR, finance, marketing, and sales, priced per active flow. Snipe-IT is open-source IT asset management software for tracking hardware, licenses, and inventory, free to self-host or available as managed cloud hosting from $39.99/month. They serve different functions in a company's stack — process automation versus asset tracking — rather than competing directly.",
  "bestForToolA": "Business operations teams that want to automate cross-app processes such as onboarding or lead routing, paying per active flow starting at $5/month.",
  "bestForToolB": "IT teams that need to track hardware, software licenses, and inventory, with the option to self-host free under AGPL-3.0 with unlimited users and assets, or pay $39.99+/month for managed cloud hosting with a 99.99% SLA.",
  "whoNeedsBoth": "An IT department could run Snipe-IT to track its asset inventory while using Activepieces to automate related notification workflows, such as routing new-hire equipment requests through Gmail — though no native integration between the two is documented.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "A workflow and business process automation platform connecting SaaS apps.",
      "toolB": "An IT asset tracking and inventory management system.",
      "whyItMatters": "Buyers searching for one rarely need the other; they solve unrelated operational problems.",
      "benefitsWho": "Clarifies the choice for anyone accidentally comparing these as substitutes."
    },
    {
      "title": "Pricing Structure",
      "toolA": "$5 per active flow/month (Standard), with a custom-priced Ultimate plan on an annual contract.",
      "toolB": "Free if self-hosted (unlimited users/assets); managed cloud hosting tiers run $39.99/month (Basic), $99.99/month (Small Business), and $249.99/month (Dedicated Small).",
      "whyItMatters": "Snipe-IT lets budget-limited IT teams start at zero cost, while Activepieces has no documented free tier.",
      "benefitsWho": "Smaller IT teams and nonprofits benefit from Snipe-IT's free self-hosted option."
    },
    {
      "title": "Licensing & Self-Hosting",
      "toolA": "Self-hosted deployment is offered, but no free or open-source license is documented for Activepieces overall.",
      "toolB": "AGPL-3.0 open source, self-hostable with unlimited users and assets at no cost.",
      "whyItMatters": "Open-source licensing gives Snipe-IT users full source access and no per-flow cost ceiling.",
      "benefitsWho": "IT teams comfortable maintaining their own servers benefit most from Snipe-IT's AGPL-3.0 self-hosted model."
    },
    {
      "title": "API & Integration Depth",
      "toolA": "Integrates via a prebuilt \"pieces\" library, such as Gmail; a general public API is not documented in the facts available.",
      "toolB": "Documents a REST API specifically built for custom integrations and automation.",
      "whyItMatters": "Teams building custom tooling around asset data need a documented API, which Snipe-IT explicitly provides.",
      "benefitsWho": "Developers building custom asset-management integrations benefit from Snipe-IT's REST API."
    },
    {
      "title": "Security & Compliance Features",
      "toolA": "Documents \"enterprise governance controls\" for larger organizations without further specifics.",
      "toolB": "Documents specific security controls: bcrypt password hashing, brute-force prevention, two-factor authentication, and HTTPS-only cookies.",
      "whyItMatters": "Concrete, named security controls are easier for IT/security teams to evaluate against compliance requirements.",
      "benefitsWho": "Security-conscious IT teams benefit from Snipe-IT's explicitly documented security controls."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Business workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "IT asset/inventory tracking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Customizable record/asset types",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AGPL-3.0, unlimited users/assets"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Snipe-IT from $39.99/month"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Snipe-IT uses flat monthly hosting tiers"
        }
      ]
    },
    {
      "group": "API & Security",
      "rows": [
        {
          "feature": "Documented REST API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Two-factor authentication",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AP Ultimate plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Snipe-IT free?",
      "answer": "Yes if self-hosted — it's AGPL-3.0 open source with unlimited users and assets. Managed cloud hosting starts at $39.99/month."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "Does Snipe-IT have an API?",
      "answer": "Yes, a documented REST API for custom integrations and automation."
    },
    {
      "question": "Can Activepieces automate IT asset workflows like Snipe-IT?",
      "answer": "Not directly — Activepieces is a general workflow automation tool with prebuilt \"pieces\" integrations like Gmail; it isn't purpose-built asset-tracking software the way Snipe-IT is."
    },
    {
      "question": "How big is the Snipe-IT community?",
      "answer": "14,100+ GitHub stars, 291 releases, and 330+ contributors."
    },
    {
      "question": "What does Snipe-IT's highest published hosting tier cost?",
      "answer": "Dedicated Hosting (Small) is $249.99/month or $2,499.99/year, with larger dedicated tiers available."
    }
  ]
};

export default activepiecesVsSnipeItContent;
