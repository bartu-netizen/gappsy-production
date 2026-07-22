import type { GroupComparisonContent } from './types';

const celoxisVsHiveVsSmartsheetContent: GroupComparisonContent = {
  "verdict": "Celoxis, Hive, and Smartsheet all offer Gantt-based project scheduling, but they differ in interface philosophy and deployment. Celoxis is the only one offering on-premise deployment and the deepest PMO-style forecasting, Hive is the most accessible with a free tier and native AI assistant, and Smartsheet leans on a familiar spreadsheet-style interface plus WorkApps and Data Shuttle for building lightweight apps and automating data pipelines at scale. The right fit depends on deployment requirements, budget, and how much your team already thinks in spreadsheets.",
  "bestFor": {
    "celoxis": "Mid-size and large PMOs that need the option of on-premise or cloud deployment along with deep what-if scenario forecasting and trend analysis.",
    "hive": "Smaller or creative teams that want a flexible, chat-and-AI-native work management tool with a genuinely free starting tier.",
    "smartsheet": "Large organizations already comfortable working in spreadsheets that want to layer in Gantt scheduling, workflow automation, and lightweight no-code apps without learning a new interface."
  },
  "highlights": [
    {
      "title": "Celoxis is the only one with an on-premise option",
      "description": "Celoxis can run as self-managed on-premise software on Linux and PostgreSQL in addition to the cloud, a deployment path not documented for Hive or Smartsheet.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Hive is the only one with a free plan and native AI",
      "description": "Hive's Free plan covers up to 10 workspace members at no cost and includes a native AI Assistant on paid tiers starting at $5/user/month; neither is documented for Celoxis or Smartsheet.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Smartsheet's spreadsheet-native interface and app-building tools",
      "description": "Smartsheet is built around a familiar grid interface used by roughly 85 percent of Fortune 500 companies, and its Business tier adds WorkApps for building lightweight no-code applications and Data Shuttle for automating recurring data imports and exports, neither of which is documented for Celoxis or Hive.",
      "toolSlugs": [
        "smartsheet"
      ]
    },
    {
      "title": "Smartsheet went private in 2025",
      "description": "Smartsheet was acquired by Vista Equity Partners and Blackstone for roughly $8.4 billion in a deal that closed in January 2025, making it privately held despite its long history as a public NYSE-listed company, a contrast with Celoxis's two-decade independent operating history and Hive's venture-backed status.",
      "toolSlugs": [
        "smartsheet",
        "celoxis",
        "hive"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "On-premise / self-hosted deployment option",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "smartsheet": "unavailable"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "smartsheet": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Interface and Scheduling",
      "rows": [
        {
          "feature": "Spreadsheet-style grid interface",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "smartsheet": "available"
          },
          "note": "Hive offers a spreadsheet-style table view among several project views; Smartsheet's entire interface is built around the spreadsheet grid."
        },
        {
          "feature": "Gantt chart view",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "smartsheet": "available"
          },
          "note": "Celoxis documents critical-path highlighting on its Gantt view; Smartsheet generates Gantt views automatically from sheet data."
        }
      ]
    },
    {
      "group": "Collaboration and AI",
      "rows": [
        {
          "feature": "Native team chat",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "smartsheet": "not-documented"
          }
        },
        {
          "feature": "AI assistant",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "smartsheet": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and App Building",
      "rows": [
        {
          "feature": "No-code custom app building",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "not-documented",
            "smartsheet": "available"
          },
          "note": "Smartsheet's WorkApps feature is available on its Business plan and above."
        },
        {
          "feature": "Automated data import/export pipelines",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "not-documented",
            "smartsheet": "available"
          },
          "note": "Smartsheet's Data Shuttle is available on its Business plan and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Celoxis, Hive, and Smartsheet can be deployed on-premise?",
      "answer": "Only Celoxis. It supports both cloud-hosted and self-managed on-premise deployment on Linux and PostgreSQL, while Hive and Smartsheet are documented as cloud-only SaaS products."
    },
    {
      "question": "Which has a free plan?",
      "answer": "Hive has a Free plan for up to 10 workspace members. Celoxis requires a minimum of five full-access users with no free tier, and Smartsheet's cheapest tier, Pro, starts at $9/user/month with no free plan documented."
    },
    {
      "question": "Which is best for teams that already think in spreadsheets?",
      "answer": "Smartsheet, since its entire interface is built around a familiar spreadsheet-style grid, layered with Gantt charts, dashboards, and automation on top."
    },
    {
      "question": "Can any of these build custom no-code apps?",
      "answer": "Smartsheet's WorkApps, available on its Business plan and above, lets teams build lightweight custom applications on top of sheet data. This isn't documented for Celoxis or Hive."
    },
    {
      "question": "Does Celoxis or Smartsheet have an AI assistant like Hive's?",
      "answer": "Not according to the provided data. Hive is the only one of the three with a documented native AI Assistant."
    },
    {
      "question": "Is Smartsheet still a public company?",
      "answer": "No. Smartsheet was taken private in January 2025 after an approximately $8.4 billion acquisition by Vista Equity Partners and Blackstone, even though it previously traded on the NYSE under the ticker SMAR."
    }
  ]
};

export default celoxisVsHiveVsSmartsheetContent;
