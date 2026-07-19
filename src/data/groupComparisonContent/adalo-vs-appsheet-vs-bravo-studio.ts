import type { GroupComparisonContent } from './types';

const adaloVsAppsheetVsBravoStudioContent: GroupComparisonContent = {
  "verdict": "Adalo, AppSheet, and Bravo Studio all promise real native iOS and Android apps without hand-written code, but they start from different inputs and suit different builders. Adalo is a from-scratch drag-and-drop canvas best for founders designing an app's UI directly. AppSheet builds apps around existing spreadsheets or databases and is deeply tied to Google Workspace and Gemini AI, making it a natural fit for internal business apps. Bravo Studio instead converts an existing Figma design into a real native app, appealing most to designers and teams that already have a polished UI ready to ship.",
  "bestFor": {
    "adalo": "Non-technical founders designing an app's screens and logic directly on a blank canvas, without an existing spreadsheet or design file",
    "appsheet": "Teams already using Google Workspace or existing spreadsheets and databases who want to turn that data into a working app fast",
    "bravo-studio": "Designers and product teams that already have a Figma design and want to ship it as a real native app without rebuilding the UI"
  },
  "highlights": [
    {
      "title": "Adalo's Ada generates screens from prompts",
      "description": "Adalo's built-in AI assistant, Ada, can generate and edit app screens or logic from natural-language prompts directly inside its drag-and-drop canvas.",
      "toolSlugs": [
        "adalo"
      ]
    },
    {
      "title": "AppSheet is Google-backed and Gemini-powered",
      "description": "AppSheet, owned by Google since 2020, uses Gemini to turn a natural-language description or an existing spreadsheet into a working app, with deep integrations into Google Workspace, Salesforce, and SQL databases.",
      "toolSlugs": [
        "appsheet"
      ]
    },
    {
      "title": "Bravo Studio starts from Figma, not a blank canvas",
      "description": "Bravo Studio's core workflow converts an existing Figma design into a functioning native app, and its newer Bravo MCP feature lets users build apps conversationally from inside Claude, ChatGPT, or Cursor.",
      "toolSlugs": [
        "bravo-studio"
      ]
    },
    {
      "title": "Free tiers differ sharply across the three",
      "description": "Adalo and Bravo Studio both offer a free tier for prototyping before paying, while AppSheet's published pricing starts at $5 per user per month with no documented free tier.",
      "toolSlugs": [
        "adalo",
        "bravo-studio",
        "appsheet"
      ]
    },
    {
      "title": "Publishing to app stores requires a paid plan on Adalo and Bravo Studio",
      "description": "Both Adalo and Bravo Studio gate app store submission behind a paid plan, meaning their free tiers are for prototyping and testing rather than shipping.",
      "toolSlugs": [
        "adalo",
        "bravo-studio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building and Design",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "adalo": "available",
            "appsheet": "unavailable",
            "bravo-studio": "available"
          },
          "note": "AppSheet's published pricing starts at $5/user/month with no documented free tier."
        },
        {
          "feature": "AI-assisted app generation",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bravo-studio": "available"
          },
          "note": "Bravo Studio's AI builder (Bravo MCP) is still in beta as of 2026."
        },
        {
          "feature": "Design-first workflow (starts from an existing UI file)",
          "statuses": {
            "adalo": "unavailable",
            "appsheet": "unavailable",
            "bravo-studio": "available"
          }
        }
      ]
    },
    {
      "group": "Data and Backend",
      "rows": [
        {
          "feature": "Built-in hosted database",
          "statuses": {
            "adalo": "available",
            "appsheet": "not-documented",
            "bravo-studio": "not-documented"
          },
          "note": "AppSheet and Bravo Studio both connect to external data sources (spreadsheets, Airtable, Firebase, Supabase, Xano) rather than shipping their own hosted database."
        },
        {
          "feature": "Offline app support",
          "statuses": {
            "adalo": "not-documented",
            "appsheet": "available",
            "bravo-studio": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Publishing and Monetization",
      "rows": [
        {
          "feature": "Native iOS and Android publishing",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bravo-studio": "available"
          },
          "note": "Requires a paid plan on Adalo and Bravo Studio."
        },
        {
          "feature": "Built-in payment or subscription monetization",
          "statuses": {
            "adalo": "available",
            "appsheet": "not-documented",
            "bravo-studio": "available"
          },
          "note": "Adalo connects to Stripe via integrations; Bravo Studio integrates Stripe for payments and RevenueCat for subscriptions."
        }
      ]
    },
    {
      "group": "Enterprise",
      "rows": [
        {
          "feature": "Enterprise security and governance controls",
          "statuses": {
            "adalo": "not-documented",
            "appsheet": "available",
            "bravo-studio": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need an existing design to use Adalo, AppSheet, or Bravo Studio?",
      "answer": "Only Bravo Studio requires one: it converts an existing Figma file into a native app. Adalo and AppSheet both let you start from a blank canvas or a spreadsheet instead."
    },
    {
      "question": "Which is the best fit if I already use Google Sheets or Workspace?",
      "answer": "AppSheet, since it is built by Google and integrates directly with Google Workspace, Google Sheets, and other business data sources like Salesforce and SQL databases."
    },
    {
      "question": "Is there a genuinely free plan among these three?",
      "answer": "Adalo and Bravo Studio both offer a free tier for prototyping, though publishing to app stores requires upgrading. AppSheet's published pricing starts at $5 per user per month with no documented free tier."
    },
    {
      "question": "Can I build an app just by chatting with an AI?",
      "answer": "Bravo Studio's Bravo MCP feature (beta as of 2026) lets you build a native app conversationally from inside AI tools like Claude, ChatGPT, or Cursor. Adalo's Ada and AppSheet's Gemini integration also generate app elements from prompts, but within their own builder interfaces."
    },
    {
      "question": "Which of the three handles in-app payments?",
      "answer": "Adalo connects to Stripe through its integrations, and Bravo Studio has native Stripe and RevenueCat support for one-time payments and subscriptions. Payment handling is not documented for AppSheet."
    }
  ]
};

export default adaloVsAppsheetVsBravoStudioContent;
