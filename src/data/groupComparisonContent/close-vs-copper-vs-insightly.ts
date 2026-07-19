import type { GroupComparisonContent } from './types';

const closeVsCopperVsInsightlyContent: GroupComparisonContent = {
  "verdict": "These three CRMs solve the same core small/mid-size sales problem in very different ways: Close is built around native calling and texting for outbound-heavy teams, Copper is built around automatic activity capture for teams that live inside Gmail and Google Calendar, and Insightly is built around carrying a deal past the close into a tracked delivery project. None is a strict upgrade over the others, so the right pick depends on whether your bottleneck is dialing volume, manual data entry, or handoff to post-sale work.",
  "bestFor": {
    "close": "Outbound-heavy sales teams and solo founders who want native calling, SMS, and an AI call assistant built into the CRM instead of bolting on a separate dialer tool.",
    "copper": "Google Workspace-native teams, agencies, and relationship-driven B2B sellers who want a CRM that auto-captures Gmail and Calendar activity with minimal manual entry.",
    "insightly": "Small and mid-sized businesses that need to manage both the sales pipeline and post-sale project delivery inside one connected system."
  },
  "highlights": [
    {
      "title": "Close is the only one built around native calling and texting",
      "description": "Close bundles calling, SMS, and email natively, including a Power Dialer and, on its top Scale plan, a Predictive Dialer that auto-dials multiple numbers per rep, a capability neither Copper nor Insightly documents.",
      "toolSlugs": [
        "close"
      ]
    },
    {
      "title": "Copper's edge is automatic Gmail and Calendar activity capture",
      "description": "Copper is purpose-built to live inside Google Workspace, automatically logging emails, calls, and calendar events against the correct contact without manual data entry, which neither Close nor Insightly is designed around.",
      "toolSlugs": [
        "copper"
      ]
    },
    {
      "title": "Insightly is the only one with native post-sale project management",
      "description": "Insightly lets a won deal convert directly into a trackable delivery project inside the same platform, a differentiator that neither Close nor Copper documents.",
      "toolSlugs": [
        "insightly"
      ]
    },
    {
      "title": "AI assistants appear in two of the three, not Copper",
      "description": "Close ships an AI assistant called Chloe for call summaries and follow-up drafting, and Insightly offers an AI Copilot on its Professional tier and above; Copper's available data does not document an AI assistant feature.",
      "toolSlugs": [
        "close",
        "insightly",
        "copper"
      ]
    },
    {
      "title": "API access is gated differently across the three",
      "description": "Close's open API and Copper's API/app marketplace are available on their respective base paid tiers, while Insightly's REST API and webhooks require upgrading to its $49/user/month Professional tier or higher.",
      "toolSlugs": [
        "insightly",
        "close",
        "copper"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Communication and Calling",
      "rows": [
        {
          "feature": "Native built-in calling/dialer",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "insightly": "not-documented"
          },
          "note": "Close includes a Power Dialer and a Predictive Dialer on its top tier; neither Copper nor Insightly documents a built-in dialer."
        },
        {
          "feature": "Native SMS",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "insightly": "not-documented"
          }
        },
        {
          "feature": "Deep email client integration",
          "statuses": {
            "close": "available",
            "copper": "available",
            "insightly": "available"
          },
          "note": "Copper's Gmail-native integration is the deepest of the three, automatically logging email threads against contacts."
        }
      ]
    },
    {
      "group": "Automation, AI and Integrations",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "insightly": "available"
          },
          "note": "Insightly's AI Copilot requires the Professional tier or above."
        },
        {
          "feature": "Workflow / sequence automation",
          "statuses": {
            "close": "available",
            "copper": "available",
            "insightly": "available"
          },
          "note": "Close's Workflows require the Growth tier or above; Insightly's workflow automation requires Professional or above."
        },
        {
          "feature": "Native Google Workspace integration",
          "statuses": {
            "close": "not-documented",
            "copper": "available",
            "insightly": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform Extensibility and Pricing",
      "rows": [
        {
          "feature": "Native project management",
          "statuses": {
            "close": "unavailable",
            "copper": "unavailable",
            "insightly": "available"
          }
        },
        {
          "feature": "REST API access",
          "statuses": {
            "close": "available",
            "copper": "available",
            "insightly": "limited"
          },
          "note": "Insightly's API and webhooks are limited to the Professional tier and above; Close's and Copper's API access is available on their base paid tiers."
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "close": "unavailable",
            "copper": "unavailable",
            "insightly": "unavailable"
          },
          "note": "All three offer only time-limited free trials (14 days each), not a permanent free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has the lowest entry price?",
      "answer": "Close's Solo plan starts at $9/user/month, undercutting Copper's Basic plan at $23/user/month and Insightly's Plus plan at $29/user/month. Close's Solo tier is capped at 10,000 leads and lacks team collaboration features, though."
    },
    {
      "question": "Which CRM is best if my team lives in Gmail all day?",
      "answer": "Copper, since it's built specifically for native Google Workspace integration, automatically logging Gmail and Calendar activity against CRM records with minimal manual entry."
    },
    {
      "question": "Do any of these offer a free-forever plan?",
      "answer": "No. All three offer only time-limited free trials, 14 days each, with no permanent free tier."
    },
    {
      "question": "Which CRM should I pick if I need to manage delivery work after the deal closes?",
      "answer": "Insightly, since it's the only one of the three with native project management that lets a won deal convert directly into a tracked delivery project in the same system."
    },
    {
      "question": "Which one has built-in calling and texting?",
      "answer": "Only Close bundles native calling and SMS directly into the product, including Power and Predictive Dialers for outbound call volume; Copper and Insightly don't document built-in calling or texting."
    },
    {
      "question": "Is Insightly still the same company it used to be?",
      "answer": "In July 2024, Insightly was acquired by private equity firm Crest Rock Partners and merged with the landing-page tool Unbounce, and the product now operates as 'Insightly CRM by Unbounce.' The core CRM and pricing tiers described here remain in place under that new ownership."
    }
  ]
};

export default closeVsCopperVsInsightlyContent;
