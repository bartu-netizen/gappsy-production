import type { GroupComparisonContent } from './types';

const adaloVsBravoStudioVsBubbleContent: GroupComparisonContent = {
  "verdict": "Adalo, Bravo Studio, and Bubble are all no-code app builders, but they start from different places and target different app types. Adalo is a drag-and-drop, mobile-first builder with its own hosted database and an AI assistant for common screens. Bravo Studio's differentiator is converting an existing Figma design into a real native app, including building conversationally through its Bravo MCP integration with AI chat tools. Bubble is the deepest of the three, offering a true full-stack builder with its own relational database and visual workflow engine, better suited to complex web applications than native mobile apps.",
  "bestFor": {
    "adalo": "Non-technical founders who want a drag-and-drop builder to design and publish native iOS and Android apps without starting from a Figma file.",
    "bravo-studio": "Designers and teams with an existing Figma design who want to convert it directly into a real native app, including building it conversationally through Bravo MCP.",
    "bubble": "Founders and teams building complex, full-stack web applications like marketplaces or SaaS products that need a built-in database and detailed backend workflow logic."
  },
  "highlights": [
    {
      "title": "Figma-First Workflow",
      "description": "Bravo Studio uniquely converts an existing Figma design directly into a working native app, rather than starting from a blank canvas.",
      "toolSlugs": [
        "bravo-studio"
      ]
    },
    {
      "title": "Full-Stack Web App Depth",
      "description": "Bubble's built-in relational database and visual workflow engine give it the deepest backend logic capability of the three, closer to a true full-stack builder.",
      "toolSlugs": [
        "bubble"
      ]
    },
    {
      "title": "AI-Assisted Building Across All Three",
      "description": "Adalo's Ada assistant, Bravo Studio's Bravo MCP, and Bubble's AI-assisted building tools all let users generate or edit app structure from prompts.",
      "toolSlugs": [
        "adalo",
        "bravo-studio",
        "bubble"
      ]
    },
    {
      "title": "Native Mobile Publishing Focus",
      "description": "Adalo and Bravo Studio are both centered on shipping native iOS and Android apps to the app stores, while Bubble is primarily a web-first builder.",
      "toolSlugs": [
        "adalo",
        "bravo-studio"
      ]
    },
    {
      "title": "Free Tier for Prototyping Before Paying",
      "description": "All three offer a free plan or trial for building and testing before a published app or production deployment requires payment.",
      "toolSlugs": [
        "adalo",
        "bravo-studio",
        "bubble"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "App Building Approach",
      "rows": [
        {
          "feature": "Figma design import",
          "statuses": {
            "adalo": "unavailable",
            "bravo-studio": "available",
            "bubble": "unavailable"
          }
        },
        {
          "feature": "Built-in hosted database",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "unavailable",
            "bubble": "available"
          },
          "note": "Bravo Studio connects to external data sources like Airtable, Firebase, Supabase, and Xano rather than offering its own database."
        },
        {
          "feature": "AI-assisted app building",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "bubble": "available"
          }
        }
      ]
    },
    {
      "group": "Publishing and Backend",
      "rows": [
        {
          "feature": "Native iOS and Android app store publishing",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "bubble": "not-documented"
          },
          "note": "Available on paid tiers for Adalo and Bravo Studio; Bubble is primarily a web application builder."
        },
        {
          "feature": "Custom code and API extensibility",
          "statuses": {
            "adalo": "not-documented",
            "bravo-studio": "not-documented",
            "bubble": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Monetization",
      "rows": [
        {
          "feature": "Built-in payment monetization (Stripe or similar)",
          "statuses": {
            "adalo": "available",
            "bravo-studio": "available",
            "bubble": "available"
          },
          "note": "Bravo Studio also adds RevenueCat for in-app subscriptions."
        },
        {
          "feature": "Free plan allows production/published deployment",
          "statuses": {
            "adalo": "unavailable",
            "bravo-studio": "unavailable",
            "bubble": "unavailable"
          },
          "note": "All three reserve published or live deployment for paid plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can convert an existing Figma design into an app?",
      "answer": "Bravo Studio is the one built around this workflow: designers create screens in Figma and Bravo compiles the design into a working native app. Adalo and Bubble both use their own in-app visual builders instead."
    },
    {
      "question": "Can I publish a free app to the App Store with any of these tools?",
      "answer": "No. All three reserve published, production-ready app deployment for paid plans; their free tiers are intended for prototyping and testing only."
    },
    {
      "question": "Which is best for building complex web apps rather than mobile apps?",
      "answer": "Bubble is the strongest fit for complex web applications, given its built-in relational database and visual workflow engine designed for full-stack logic. Adalo and Bravo Studio are more centered on native mobile app publishing."
    },
    {
      "question": "Do all three offer AI-assisted app building?",
      "answer": "Yes. Adalo has an AI assistant called Ada, Bravo Studio has Bravo MCP for building apps conversationally from AI chat tools, and Bubble includes its own AI-assisted building tools."
    },
    {
      "question": "Which tool has its own built-in database versus relying on external sources?",
      "answer": "Adalo and Bubble both include a built-in hosted database. Bravo Studio instead connects to external data sources like Airtable, Firebase, Supabase, or Xano rather than hosting its own."
    },
    {
      "question": "Is Bravo MCP available on Bravo Studio's free plan?",
      "answer": "No, based on the provided pricing details, Bravo MCP access is part of the paid Solo plan, not the free Starter plan."
    }
  ]
};

export default adaloVsBravoStudioVsBubbleContent;
