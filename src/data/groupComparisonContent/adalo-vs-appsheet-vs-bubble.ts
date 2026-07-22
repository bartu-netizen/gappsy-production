import type { GroupComparisonContent } from './types';

const adaloVsAppsheetVsBubbleContent: GroupComparisonContent = {
  "verdict": "Adalo, AppSheet, and Bubble are all no-code app builders, but they optimize for different outcomes: Adalo focuses on publishing native iOS and Android apps from a drag-and-drop builder, AppSheet leans on Google's ecosystem to turn spreadsheets and data sources into business apps and automations, and Bubble is the most full-stack option, combining a database, visual workflow engine, and plugin marketplace for complex web applications. All three now include AI-assisted building to speed up initial app creation. The right pick depends on whether the priority is a native mobile app, a Google Workspace-connected business tool, or a highly customizable full-stack web app.",
  "bestFor": {
    "adalo": "Builders who specifically want to publish a true native iOS and Android app without writing code, and who can start free while prototyping",
    "appsheet": "Teams already inside Google Workspace who want to turn spreadsheets or databases into mobile and web business apps and automations with per-user pricing",
    "bubble": "Builders who need a full-stack web application with a custom database, complex workflows, and a large plugin ecosystem, and who may extend it with custom code later"
  },
  "highlights": [
    {
      "title": "Only Adalo and Bubble offer a perpetual free plan",
      "description": "Adalo and Bubble both let builders start on a $0 plan to prototype before paying, while AppSheet's published pricing starts at $5 per user per month with no free tier documented.",
      "toolSlugs": [
        "adalo",
        "bubble",
        "appsheet"
      ]
    },
    {
      "title": "AI-assisted building is now standard across all three",
      "description": "Adalo's Ada assistant, AppSheet's AI-powered app creation, and Bubble's AI-assisted building all aim to lower the barrier to producing a first working app from a prompt or description.",
      "toolSlugs": [
        "adalo",
        "appsheet",
        "bubble"
      ]
    },
    {
      "title": "Native app store publishing is Adalo's core strength",
      "description": "Adalo is built specifically around publishing to the iOS and Android app stores, while AppSheet ships offline-capable mobile apps and Bubble is primarily a web-first full-stack builder.",
      "toolSlugs": [
        "adalo"
      ]
    },
    {
      "title": "Bubble goes furthest into full-stack complexity",
      "description": "Bubble combines a built-in database, a visual workflow engine, custom code and API connectors, and a large plugin marketplace, giving it more backend depth than Adalo or AppSheet, at the cost of a steeper learning curve.",
      "toolSlugs": [
        "bubble"
      ]
    },
    {
      "title": "AppSheet is the deepest Google Workspace integration",
      "description": "AppSheet is built by Google and integrates most tightly with Google and Microsoft business tools, which neither Adalo nor Bubble specifically target.",
      "toolSlugs": [
        "appsheet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building and Design",
      "rows": [
        {
          "feature": "Native mobile app store publishing",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bubble": "limited"
          },
          "note": "Bubble is primarily a web-first full-stack builder rather than a native app-store publishing tool"
        },
        {
          "feature": "Built-in or hosted database",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bubble": "available"
          }
        },
        {
          "feature": "AI-assisted app building",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bubble": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and Extensibility",
      "rows": [
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "adalo": "not-documented",
            "appsheet": "available",
            "bubble": "available"
          }
        },
        {
          "feature": "Custom code or API connectors",
          "statuses": {
            "adalo": "not-documented",
            "appsheet": "limited",
            "bubble": "available"
          },
          "note": "AppSheet offers broad integrations but does not document custom code support the way Bubble does"
        }
      ]
    },
    {
      "group": "Access and Ecosystem",
      "rows": [
        {
          "feature": "Plugin or integration marketplace",
          "statuses": {
            "adalo": "available",
            "appsheet": "available",
            "bubble": "available"
          }
        },
        {
          "feature": "Perpetual free plan",
          "statuses": {
            "adalo": "available",
            "appsheet": "unavailable",
            "bubble": "available"
          },
          "note": "AppSheet's published pricing starts at $5 per user per month with no free tier documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Adalo, AppSheet, or Bubble is best for building a native mobile app?",
      "answer": "Adalo is built specifically around publishing native iOS and Android apps from a drag-and-drop builder, while AppSheet also produces offline-capable mobile apps; Bubble is primarily a web-first full-stack builder."
    },
    {
      "question": "Does AppSheet have a free plan like Adalo and Bubble?",
      "answer": "No, AppSheet's published pricing starts at $5 per user per month on its Starter tier, while Adalo and Bubble both offer a $0 free plan for prototyping before you pay."
    },
    {
      "question": "Which tool is most suited to teams already using Google Workspace?",
      "answer": "AppSheet, since it is built by Google and integrates most deeply with Google and Microsoft business tools, letting teams turn existing spreadsheets and data sources into apps and automations."
    },
    {
      "question": "Which platform is best for a complex, full-stack web application?",
      "answer": "Bubble, because it combines a built-in database, a visual workflow engine, a large plugin marketplace, and custom code and API connectors for teams that outgrow simpler no-code builders."
    },
    {
      "question": "Do all three tools offer AI-assisted app creation?",
      "answer": "Yes, Adalo has an AI assistant called Ada, AppSheet offers AI-powered app creation, and Bubble includes AI-assisted building, all aimed at generating a starting app faster."
    }
  ]
};

export default adaloVsAppsheetVsBubbleContent;
