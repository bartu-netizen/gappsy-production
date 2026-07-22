import type { GroupComparisonContent } from './types';

const _8x8VsAircallVsOpenphoneContent: GroupComparisonContent = {
  "verdict": "All three are cloud business phone systems, but they diverge in scope and buyer size. 8x8 is the broadest, bundling UCaaS, CCaaS, and CPaaS for large or global organizations, though its pricing gets more quote-based at higher tiers. Aircall focuses on sales and support teams that live inside a CRM, offering deep integrations and AI call coaching, though its 3-license minimum raises the effective entry price. OpenPhone is the simplest and most affordable option for small teams that want shared numbers, texting, and AI call summaries without contact-center overhead, though its 2025 rebrand to Quo has created some naming confusion. No single tool is the best choice for every team size.",
  "bestFor": {
    "8x8": "Organizations that want one vendor for phone, video, a full contact center, and communications APIs rather than stitching together separate point solutions.",
    "aircall": "Sales and support teams that live inside a CRM or help desk and want deep native integrations plus AI-assisted call coaching.",
    "openphone": "Startups and small teams that want a modern, shared-inbox phone system with simple per-user pricing and no contact-center complexity."
  },
  "highlights": [
    {
      "title": "One vendor, three product lines",
      "description": "8x8 combines phone, contact center, video meetings, and developer communication APIs under a single platform, unlike Aircall and OpenPhone which focus specifically on business phone and calling.",
      "toolSlugs": [
        "8x8"
      ]
    },
    {
      "title": "Built for CRM-centric sales and support teams",
      "description": "Aircall's 250+ integrations and live AI call coaching and sentiment analysis are aimed at teams that spend their day working inside a CRM or help desk.",
      "toolSlugs": [
        "aircall"
      ]
    },
    {
      "title": "Shared inbox for small teams",
      "description": "OpenPhone's collaborative shared number model and low published starting price make it the most startup-friendly of the three.",
      "toolSlugs": [
        "openphone"
      ]
    },
    {
      "title": "AI is now standard across all three",
      "description": "8x8's AI-assisted contact-center agent tools, Aircall's live coaching and autonomous AI-led voice agents, and OpenPhone's Sona AI agent all layer AI onto core calling.",
      "toolSlugs": [
        "8x8",
        "aircall",
        "openphone"
      ]
    },
    {
      "title": "Minimum license counts differ",
      "description": "Aircall requires a 3-license minimum on Essentials (25 for its Custom tier), while 8x8 and OpenPhone publish per-user pricing without a stated seat minimum.",
      "toolSlugs": [
        "aircall"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Phone Features",
      "rows": [
        {
          "feature": "Unlimited US and Canada calling",
          "statuses": {
            "8x8": "available",
            "aircall": "available",
            "openphone": "available"
          }
        },
        {
          "feature": "Native video meetings",
          "statuses": {
            "8x8": "available",
            "aircall": "not-documented",
            "openphone": "not-documented"
          },
          "note": "8x8 video meetings scale up to 500 participants on higher tiers."
        },
        {
          "feature": "Shared collaborative team inbox",
          "statuses": {
            "8x8": "limited",
            "aircall": "available",
            "openphone": "available"
          },
          "note": "8x8 offers team messaging, but not the shared-number inbox model that Aircall and OpenPhone are built around."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI voice agent for inbound calls",
          "statuses": {
            "8x8": "limited",
            "aircall": "available",
            "openphone": "available"
          }
        },
        {
          "feature": "Automatic call transcription and summaries",
          "statuses": {
            "8x8": "not-documented",
            "aircall": "available",
            "openphone": "available"
          }
        }
      ]
    },
    {
      "group": "Platform Scope",
      "rows": [
        {
          "feature": "Dedicated contact center (CCaaS) product",
          "statuses": {
            "8x8": "available",
            "aircall": "unavailable",
            "openphone": "unavailable"
          }
        },
        {
          "feature": "Developer communications APIs (CPaaS)",
          "statuses": {
            "8x8": "available",
            "aircall": "unavailable",
            "openphone": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Native CRM and help desk integrations",
          "statuses": {
            "8x8": "available",
            "aircall": "available",
            "openphone": "available"
          },
          "note": "Aircall publishes the widest count at 250+; 8x8 and OpenPhone list Salesforce and HubSpot among named integrations."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the lowest starting price?",
      "answer": "Both 8x8's Express plan and OpenPhone's Starter plan list around $15 per user per month, while Aircall's Essentials plan starts around $30 per user per month with a 3-license minimum, making it the priciest entry point of the three."
    },
    {
      "question": "Which tool is best if I need a full contact center, not just a phone system?",
      "answer": "8x8 is the only one of the three offering a dedicated Contact Center as a Service product alongside its phone system, plus a Communications Platform as a Service for building custom messaging and voice features."
    },
    {
      "question": "Does OpenPhone still exist, or has it become Quo?",
      "answer": "OpenPhone rebranded to Quo in late 2025, but it is the same company and underlying phone-system technology; the OpenPhone name and product line continue to be referenced as OpenPhone and Quo interchangeably."
    },
    {
      "question": "Which tool has the deepest CRM integrations?",
      "answer": "Aircall lists 250+ integrations including Salesforce, HubSpot, Zendesk, Shopify, and Microsoft Teams, the widest published integration count among the three."
    },
    {
      "question": "Are these tools suitable for very small teams?",
      "answer": "OpenPhone is the most startup-friendly, with no stated seat minimum and a 7-day free trial. Aircall requires a 3-license minimum on Essentials, and 8x8's most flexible pricing generally favors teams large enough to negotiate directly with sales."
    },
    {
      "question": "Which tool offers AI-assisted calling features?",
      "answer": "All three now include some AI layer: 8x8 has AI-assisted agent tools within its contact center, Aircall offers live call coaching, sentiment analysis, and autonomous AI-led voice agents, and OpenPhone has its Sona AI agent plus AI-generated call summaries."
    }
  ]
};

export default _8x8VsAircallVsOpenphoneContent;
