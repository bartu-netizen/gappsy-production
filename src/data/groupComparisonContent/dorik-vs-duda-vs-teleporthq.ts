import type { GroupComparisonContent } from './types';

const dorikVsDudaVsTeleporthqContent: GroupComparisonContent = {
  "verdict": "Dorik, Duda, and TeleportHQ are all hosted, AI-assisted website builders with agency-friendly options, which makes them a genuinely comparable trio. Dorik stands out for a usable free plan and budget-friendly pricing, Duda leans hardest into agency client management and white-label depth, and TeleportHQ differentiates on exporting clean, multi-framework code for developer-led teams.",
  "bestFor": {
    "dorik": "Budget-conscious solo entrepreneurs and small agencies who want a genuinely usable free plan plus affordable white-label reselling",
    "duda": "Agencies managing many client sites that need the deepest client-management, white-label, and AI toolset",
    "teleporthq": "Developers who want AI-assisted design that exports clean, framework-native code in React, Vue, Next.js, or Angular"
  },
  "highlights": [
    {
      "title": "Free tier generosity varies widely",
      "description": "Dorik's free plan includes a custom domain and up to 200 blog posts, TeleportHQ's free plan caps out at 3 projects and 10 code exports, and Duda has no permanent free tier at all, only a 14-day trial.",
      "toolSlugs": [
        "dorik",
        "teleporthq",
        "duda"
      ]
    },
    {
      "title": "Code export approach differs",
      "description": "TeleportHQ exports across multiple frameworks including React, Vue, Next.js, and Angular, Dorik exports the underlying HTML and CSS on paid plans, and Duda only exposes code access starting on its Team tier.",
      "toolSlugs": [
        "teleporthq",
        "dorik",
        "duda"
      ]
    },
    {
      "title": "White-label reselling is a Dorik and Duda strength",
      "description": "Both Dorik and Duda offer a white-label dashboard for agencies reselling sites under their own brand, while TeleportHQ does not document a white-label option.",
      "toolSlugs": [
        "dorik",
        "duda"
      ]
    },
    {
      "title": "All three bake in AI generation",
      "description": "Dorik, Duda, and TeleportHQ each include AI-assisted website or page generation from a prompt or business description, though Duda pairs it with an AI SEO Assistant that the other two don't document.",
      "toolSlugs": [
        "dorik",
        "duda",
        "teleporthq"
      ]
    },
    {
      "title": "Entry pricing spans a wide range",
      "description": "TeleportHQ's paid tier starts around $9 per editor per month, Duda's Basic plan starts at $19/month, and Dorik's Personal plan starts at $29/month, though Dorik's free plan is the most feature-complete of the three.",
      "toolSlugs": [
        "teleporthq",
        "duda",
        "dorik"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Content",
      "rows": [
        {
          "feature": "AI website or page generation",
          "statuses": {
            "dorik": "available",
            "duda": "available",
            "teleporthq": "available"
          }
        },
        {
          "feature": "Built-in CMS for blog or dynamic content",
          "statuses": {
            "dorik": "available",
            "duda": "not-documented",
            "teleporthq": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Code & Export",
      "rows": [
        {
          "feature": "Code access or export",
          "statuses": {
            "dorik": "available",
            "duda": "limited",
            "teleporthq": "available"
          },
          "note": "Duda's code access is limited to Team plans and above rather than a full standalone export."
        },
        {
          "feature": "Multi-framework code export",
          "statuses": {
            "dorik": "unavailable",
            "duda": "unavailable",
            "teleporthq": "available"
          },
          "note": "Dorik exports HTML/CSS only; TeleportHQ additionally supports React, Vue, Next.js, and Angular."
        }
      ]
    },
    {
      "group": "Agency & Collaboration",
      "rows": [
        {
          "feature": "White-label dashboard",
          "statuses": {
            "dorik": "available",
            "duda": "available",
            "teleporthq": "not-documented"
          }
        },
        {
          "feature": "Team collaboration",
          "statuses": {
            "dorik": "available",
            "duda": "available",
            "teleporthq": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Permanent free tier",
          "statuses": {
            "dorik": "available",
            "duda": "unavailable",
            "teleporthq": "available"
          },
          "note": "Duda offers only a 14-day free trial, not a lasting free plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is cheapest to start with?",
      "answer": "Dorik and TeleportHQ both offer permanent free plans, while Duda has no free tier and starts at $19/month after its 14-day trial. TeleportHQ's paid tier then starts lower, around $9 per editor per month, versus Dorik's $29/month Personal plan."
    },
    {
      "question": "Does Dorik lock me into its platform long term?",
      "answer": "No. Dorik offers HTML and CSS code export on its paid plans, which lets users move a finished site elsewhere if needed."
    },
    {
      "question": "Is TeleportHQ a good fit for agencies reselling websites to clients?",
      "answer": "It's less built for that than Dorik or Duda. TeleportHQ doesn't document a white-label option, while both Dorik and Duda offer dedicated white-label dashboards for agency reselling."
    },
    {
      "question": "Which tool has the most extensive AI feature set?",
      "answer": "All three include AI website generation, but Duda goes further with a dedicated AI SEO Assistant and an AI Connector built on the Model Context Protocol on higher tiers."
    },
    {
      "question": "Can I white-label any of these tools for my clients?",
      "answer": "Yes for Dorik and Duda, both of which offer a white-label dashboard. TeleportHQ does not document a white-label capability."
    }
  ]
};

export default dorikVsDudaVsTeleporthqContent;
