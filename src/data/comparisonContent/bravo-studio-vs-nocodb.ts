import type { ToolComparisonContent } from './types';

const bravoStudioVsNocodbContent: ToolComparisonContent = {
  "verdict": "Bravo Studio is a no-code/AI mobile-app builder that converts Figma design files into real native iOS and Android apps via a React Native build engine, with plans starting at $22/month (Solo) after a free Learn plan capped at 15 screens per app. NocoDB is a no-code database platform that turns spreadsheets or existing Postgres/MySQL databases into a collaborative, spreadsheet-style app with multiple views (Grid, Gallery, Form, Kanban, Calendar) and auto-generated REST APIs, priced from $12/seat/month (Plus, annual) with a free, unlimited-seat self-hosted Community Edition. They address different layers of a no-code stack — the app front end versus the underlying database backend.",
  "bestForToolA": "Designers and teams with an existing Figma file who want to turn it into a real native mobile app without writing code, including those who want to build via Claude, Cursor, or ChatGPT through Bravo MCP.",
  "bestForToolB": "Teams that want to turn spreadsheets or an existing SQL database into a collaborative app with multiple views and auto-generated REST APIs, especially those wanting a genuinely free, unlimited-seat self-hosted option.",
  "whoNeedsBoth": "A team could build a mobile app's UI from Figma using Bravo Studio while using NocoDB as the backend data source connected via REST or GraphQL — Bravo Studio's own documented backend connections include REST and GraphQL data sources, making this a realistic pairing rather than a forced one.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Bravo Studio builds native mobile app front ends by converting Figma design files into React Native code.",
      "toolB": "NocoDB builds spreadsheet-style database backends/apps from existing spreadsheets or SQL databases.",
      "whyItMatters": "The two tools operate at different layers of an app stack, so the choice depends on whether the need is the visual app itself or the underlying data layer.",
      "benefitsWho": "Designers turning mockups into apps need Bravo Studio; teams organizing structured data need NocoDB."
    },
    {
      "title": "Free Plan Depth",
      "toolA": "Bravo Studio's free Learn plan allows unlimited app projects but caps each app at 15 screens.",
      "toolB": "NocoDB's free self-hosted Community Edition has unlimited records, storage, and seats, while its free cloud plan caps at 1,000 records and 1GB storage.",
      "whyItMatters": "Screen caps versus record/storage caps affect different kinds of projects — a simple app versus a growing dataset.",
      "benefitsWho": "Teams needing an unlimited-scale free option benefit from NocoDB's self-hosted Community Edition; those prototyping small apps benefit from Bravo Studio's unlimited free projects."
    },
    {
      "title": "AI-Native Building",
      "toolA": "Bravo Studio's Bravo MCP lets you build apps from Claude, Cursor, or ChatGPT via the Model Context Protocol, included on the Solo plan.",
      "toolB": "NocoDB's AI features (single- and multi-provider AI options) are reserved for its Business and Scale paid tiers.",
      "whyItMatters": "Access to AI-native building tools at a lower price point matters for teams already using AI coding assistants.",
      "benefitsWho": "Teams already working in Claude, Cursor, or ChatGPT benefit from Bravo Studio's MCP access on its entry paid plan."
    },
    {
      "title": "Starting Price",
      "toolA": "Bravo Studio's Solo plan starts at $22/month.",
      "toolB": "NocoDB's Plus (Cloud) plan starts at $12/seat/month billed annually ($15/seat/month monthly).",
      "whyItMatters": "Entry price points differ enough to matter for budget-conscious individuals or small teams choosing where to start.",
      "benefitsWho": "Cost-sensitive individual builders may prefer NocoDB's lower entry price if a database app is the goal."
    },
    {
      "title": "Licensing",
      "toolA": "Bravo Studio's licensing model is not documented as open source.",
      "toolB": "NocoDB's self-hosted Community Edition moved from AGPLv3 to the Sustainable Use License — a source-available license rather than an OSI-approved open-source license, which drew criticism from parts of the self-hosting community.",
      "whyItMatters": "Licensing terms affect what a business can legally do with the self-hosted code, especially for competing commercial use.",
      "benefitsWho": "Teams with strict open-source licensing requirements should review NocoDB's Sustainable Use License terms carefully."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building Capability",
      "rows": [
        {
          "feature": "Figma-to-native-app conversion",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Spreadsheet-to-app conversion",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Live device preview",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bravo Vision"
        },
        {
          "feature": "Multiple data views (Grid/Gallery/Form/Kanban/Calendar)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Data & Backend",
      "rows": [
        {
          "feature": "Connect to existing SQL database (Postgres/MySQL)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Backend data connections (Convex/REST/GraphQL)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "NocoDB generates its own REST APIs rather than connecting to external Convex/GraphQL sources"
        },
        {
          "feature": "Auto-generated REST APIs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-native build access via MCP (Claude/Cursor/ChatGPT)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bravo MCP, Solo plan"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Bravo Studio Learn plan (unlimited projects, 15 screens); NocoDB Free Cloud (3 seats/1,000 records) plus free self-hosted Community Edition"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Docker or binary installers"
        },
        {
          "feature": "Starting paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Bravo Studio $22/month (Solo) vs NocoDB $12/seat/month annual (Plus)"
        },
        {
          "feature": "App store publishing (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Bravo Studio require coding knowledge?",
      "answer": "No — it converts Figma designs into native apps using an AI-driven build engine, no code required."
    },
    {
      "question": "Is NocoDB free?",
      "answer": "Yes — a free cloud plan (3 editor seats, 1,000 records) and a free, self-hosted Community Edition are both available."
    },
    {
      "question": "Can NocoDB connect to an existing database?",
      "answer": "Yes, to an existing Postgres or MySQL database instead of requiring data migration."
    },
    {
      "question": "What is Bravo MCP?",
      "answer": "An AI-native builder that lets you build apps from Claude, Cursor, or ChatGPT via the Model Context Protocol, included on the Solo plan."
    },
    {
      "question": "What license does NocoDB's self-hosted edition use?",
      "answer": "The Sustainable Use License, a source-available license, after the project moved away from AGPLv3."
    },
    {
      "question": "Do Bravo Studio and NocoDB solve the same problem?",
      "answer": "No — Bravo Studio builds native mobile app front ends from Figma designs, while NocoDB builds spreadsheet-style database backends/apps; Bravo Studio's documented backend connections include REST and GraphQL, so the two can be combined."
    }
  ]
};

export default bravoStudioVsNocodbContent;
