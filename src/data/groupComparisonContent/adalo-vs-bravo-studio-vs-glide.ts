import type { GroupComparisonContent } from './types';

const adaloVsBravoStudioVsGlideContent: GroupComparisonContent = {
  "verdict": "Adalo, Bravo Studio, and Glide all promise a no-code path to a real working app, but they start from different inputs: Adalo from a drag-and-drop canvas, Bravo Studio from an existing Figma design, and Glide from a spreadsheet or data source. Adalo is the most direct route to native App Store and Play Store publishing, Bravo Studio is best when a polished design already exists and native compilation matters, and Glide excels at turning operational data into a usable mobile-first tool quickly. None fully substitutes for custom development on complex apps, and the right pick depends heavily on what a team already has: a design file, a spreadsheet, or neither.",
  "bestFor": {
    "adalo": "Founders who want a classic drag-and-drop builder with a built-in database and direct App Store and Play Store publishing.",
    "bravo-studio": "Designers and teams that already have a polished Figma file and want to compile it into a real native app, including AI-native builds via Bravo MCP.",
    "glide": "Operations teams that want to turn an existing spreadsheet into a mobile-friendly internal tool or business app fast."
  },
  "highlights": [
    {
      "title": "Bravo Studio is the only one built around a Figma-first workflow",
      "description": "Bravo Studio converts an existing Figma design directly into a compiled native app, a fundamentally different starting point from Adalo's visual canvas or Glide's spreadsheet import.",
      "toolSlugs": [
        "bravo-studio"
      ]
    },
    {
      "title": "Glide's AI Agent and Adalo's Ada both generate app scaffolding from plain language",
      "description": "Both platforms let users describe an app and get an initial layout or data schema generated automatically, lowering the barrier for non-technical founders to get a working first draft.",
      "toolSlugs": [
        "glide",
        "adalo"
      ]
    },
    {
      "title": "Adalo publishes to the app stores directly; Glide's output is mobile-first web",
      "description": "Adalo apps can be submitted to the Apple App Store and Google Play Store from within the platform, while Glide's apps are optimized for mobile browsers rather than compiled native app store submissions.",
      "toolSlugs": [
        "adalo",
        "glide"
      ]
    },
    {
      "title": "Bravo Studio bundles Stripe and RevenueCat monetization natively",
      "description": "Bravo Studio integrates Stripe for one-time payments and RevenueCat for in-app subscriptions directly into its builder, a level of native monetization tooling not documented for Glide.",
      "toolSlugs": [
        "bravo-studio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "App Building Approach",
      "rows": [
        {
          "feature": "Native iOS and Android app store publishing",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "glide": "not-documented"
          },
          "note": "Glide's output is a mobile-friendly web app rather than a compiled app store submission."
        },
        {
          "feature": "AI-generated app scaffolding from a prompt",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "glide": "available"
          },
          "note": "Bravo Studio's Bravo MCP AI-native builder is still in beta as of 2026."
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
            "bravo-studio": "not-documented",
            "glide": "available"
          },
          "note": "Bravo Studio relies on connected external sources such as Firebase, Supabase, Airtable, or Xano rather than its own hosted database."
        },
        {
          "feature": "External data source connections (Sheets, Airtable, Firebase, etc.)",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "glide": "available"
          }
        },
        {
          "feature": "Native payment or subscription monetization tools",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "glide": "not-documented"
          },
          "note": "Adalo connects to Stripe through its integrations; Bravo Studio has native Stripe and RevenueCat support built in."
        }
      ]
    },
    {
      "group": "Team and Pricing",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "glide": "available"
          }
        },
        {
          "feature": "Multi-editor team collaboration",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "not-documented",
            "glide": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three actually publishes apps to the app stores?",
      "answer": "Adalo and Bravo Studio both publish native apps to the Apple App Store and Google Play Store. Glide's apps are mobile-first web apps rather than compiled native app store submissions."
    },
    {
      "question": "What's the main difference between Adalo and Bravo Studio?",
      "answer": "Adalo starts from its own drag-and-drop visual canvas, while Bravo Studio starts from an existing Figma design file and compiles it into a native app, which suits teams that already have a design ready."
    },
    {
      "question": "Can I build an app from a spreadsheet with any of these tools?",
      "answer": "Glide is built specifically around turning Google Sheets, Airtable, or Excel data into an app. Adalo and Bravo Studio can connect to external data sources too, but neither is designed around a spreadsheet-first workflow the way Glide is."
    },
    {
      "question": "Do any of them use AI to generate the app for me?",
      "answer": "Yes. Adalo's Ada assistant and Glide's AI Agent both generate initial app layouts and data structures from a plain-language description, and Bravo Studio's Bravo MCP feature (in beta) lets users build apps conversationally from AI chat tools."
    },
    {
      "question": "Which has the cheapest paid plan?",
      "answer": "Bravo Studio's Solo plan starts at $22/month, below Adalo's Starter plan at $36/month. Glide's Free plan covers small internal tools, but its first paid tier, Business, starts much higher at $199/month."
    }
  ]
};

export default adaloVsBravoStudioVsGlideContent;
