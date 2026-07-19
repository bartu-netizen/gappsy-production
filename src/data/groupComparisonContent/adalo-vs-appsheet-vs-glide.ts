import type { GroupComparisonContent } from './types';

const adaloVsAppsheetVsGlideContent: GroupComparisonContent = {
  "verdict": "Adalo, AppSheet, and Glide all let non-developers turn data into a working app, but they optimize for different starting points. Adalo is the closest thing to a true native-app design tool, publishing straight to the App Store and Google Play; AppSheet leans on Google's Workspace ecosystem and Zero Trust governance for enterprise operational apps; and Glide is built around the fastest possible path from an existing spreadsheet to a mobile-friendly app, now accelerated further with AI-generated layouts. The right pick depends less on raw capability and more on where your data and audience already live.",
  "bestFor": {
    "adalo": "Founders and agencies who want to design and publish real native iOS and Android apps without hiring developers.",
    "appsheet": "Teams already inside Google Workspace who need governed, enterprise-grade operational apps built from existing data sources.",
    "glide": "Operations and internal-tools teams who want to turn an existing spreadsheet into a mobile-friendly app fast, with AI-assisted generation."
  },
  "highlights": [
    {
      "title": "Native app store publishing",
      "description": "Adalo compiles projects to native iOS and Android apps and can publish directly to the Apple App Store and Google Play Store from a single project, something the other two do not offer in the same way.",
      "toolSlugs": [
        "adalo"
      ]
    },
    {
      "title": "Enterprise governance built on Google's ecosystem",
      "description": "AppSheet ships Zero Trust security controls and deep connections into Google Workspace and Microsoft 365, plus Gemini-powered app creation, making it the most enterprise-ready of the three.",
      "toolSlugs": [
        "appsheet"
      ]
    },
    {
      "title": "Fastest spreadsheet-to-app on-ramp",
      "description": "Glide is purpose-built to point at a Google Sheet, Airtable base, or Excel file and generate a working, mobile-first app, with Glide Tables removing the row limits of relying on an external spreadsheet.",
      "toolSlugs": [
        "glide"
      ]
    },
    {
      "title": "AI-assisted app generation across the board",
      "description": "All three now offer AI tooling that speeds up building a first draft: Adalo's Ada assistant, AppSheet's Gemini-powered app creation, and Glide's Glide AI or Glide Agent, which can generate a layout and data schema from a plain-language description.",
      "toolSlugs": [
        "adalo",
        "appsheet",
        "glide"
      ]
    },
    {
      "title": "Very different pricing models",
      "description": "AppSheet charges per user per month regardless of how many apps you build, while Adalo and Glide price around tiers of published apps, records, and editors, each with a usable free entry point except AppSheet.",
      "toolSlugs": [
        "adalo",
        "appsheet",
        "glide"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core App Building",
      "rows": [
        {
          "feature": "Native App Store publishing (iOS/Android)",
          "statuses": {
            "adalo": "available",
            "appsheet": "not-documented",
            "glide": "unavailable"
          },
          "note": "Glide apps run as mobile-friendly web apps rather than being submitted to app stores."
        },
        {
          "feature": "Visual drag-and-drop canvas editor",
          "statuses": {
            "adalo": "available",
            "appsheet": "limited",
            "glide": "limited"
          },
          "note": "AppSheet and Glide auto-generate a starting layout from your data that you then customize, rather than starting from a blank canvas."
        }
      ]
    },
    {
      "group": "Data and Integrations",
      "rows": [
        {
          "feature": "Built-in hosted database",
          "statuses": {
            "adalo": "available",
            "appsheet": "not-documented",
            "glide": "available"
          },
          "note": "Adalo offers a hosted Postgres database; Glide offers native Glide Tables."
        },
        {
          "feature": "External data source connections (Sheets, Airtable, SQL)",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "glide": "available"
          }
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI app generation from a text prompt",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "glide": "available"
          }
        },
        {
          "feature": "AI extraction from unstructured content (audio, images, text)",
          "statuses": {
            "adalo": "not-documented",
            "appsheet": "not-documented",
            "glide": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "adalo": "available",
            "appsheet": "unavailable",
            "glide": "available"
          },
          "note": "AppSheet's published pricing starts at $5/user/month with no free production tier."
        },
        {
          "feature": "Per-user pricing model",
          "statuses": {
            "adalo": "unavailable",
            "appsheet": "available",
            "glide": "limited"
          },
          "note": "Glide's Business plan includes 30 users, then charges per additional user."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for building a native mobile app for the App Store?",
      "answer": "Adalo, since it explicitly compiles to native iOS and Android apps and can publish them directly to the Apple App Store and Google Play Store from a paid plan."
    },
    {
      "question": "Can I build a production app on AppSheet without paying?",
      "answer": "No. AppSheet's published pricing starts at $5 per user per month across its Starter, Core, and Enterprise Plus tiers, with no standalone free production plan listed."
    },
    {
      "question": "Do Adalo, AppSheet, and Glide all use AI to help build apps?",
      "answer": "Yes. Adalo has an AI assistant called Ada, AppSheet uses Gemini for AI-powered app creation, and Glide has Glide AI (also called the Glide Agent) for generating layouts and schemas from a plain-language description."
    },
    {
      "question": "Which tool is best if I already have a Google Sheet or Airtable base?",
      "answer": "Glide is built specifically around converting an existing Google Sheet, Airtable base, or Excel file into a working app, though AppSheet also connects to those same sources with a more enterprise-oriented feature set."
    },
    {
      "question": "Is any of these especially suited to large enterprise deployments?",
      "answer": "AppSheet, since it is backed by Google Cloud and Workspace and includes Zero Trust security and governance controls aimed at enterprise IT requirements."
    },
    {
      "question": "What is the main pricing difference between the three?",
      "answer": "AppSheet charges strictly per user per month, while Adalo and Glide price around tiers of published apps, records, and editors, and both offer a free entry point that AppSheet does not."
    }
  ]
};

export default adaloVsAppsheetVsGlideContent;
