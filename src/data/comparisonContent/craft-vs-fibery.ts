import type { ToolComparisonContent } from './types';

const craftVsFiberyContent: ToolComparisonContent = {
  "verdict": "Craft and Fibery are both freemium docs/whiteboard tools with AI baked in, but they target different scales of work: Craft is an individual-first notes and docs app that syncs across a person's own devices, with Family/Team plans that bundle multiple individual accounts, while Fibery is a multi-user, database-driven work platform built for teams to structure and automate connected work across up to 10 free users and beyond. Choosing between them comes down to whether you need personal writing space or a shared relational workspace.",
  "bestForToolA": "Best for an individual who wants a polished personal notes/docs app with tasks, calendar, whiteboards, and AI writing assistance across their own devices — Craft was recognized as Apple's Mac App of the Year and an Apple Design Awards finalist.",
  "bestForToolB": "Best for a team that needs relational databases, multiple views (Table, Board, Gantt, Timeline, etc.), and automations to connect work items across projects, with Fibery AI included on every tier including the free plan.",
  "whoNeedsBoth": "A founder or team lead who personally drafts and organizes notes in Craft for quick individual writing, while the team tracks structured, cross-linked project work in Fibery, may use both tools for their respective strengths rather than force one tool to do both jobs.",
  "keyDifferences": [
    {
      "title": "Core data model",
      "toolA": "Craft is built around docs — rich document creation/editing with tasks and calendar embedded inside documents.",
      "toolB": "Fibery is built around relational databases as the core structural building block, with Table, Board, Gallery, List, Timeline, Gantt, Calendar, Report, Map, Feed, Form, and Dashboard views on top.",
      "whyItMatters": "A document-first model suits writing and personal knowledge management; a database-first model suits structured, cross-referenced project and product work.",
      "benefitsWho": "Writers and note-takers benefit from Craft's doc-centric approach; product/ops teams tracking linked records (tasks, features, bugs) benefit from Fibery's relational model."
    },
    {
      "title": "Team collaboration model",
      "toolA": "Craft's Family plan bundles 2-6 individual Plus accounts and its Team plan bundles up to 10, described as shared spaces for bundled individual accounts.",
      "toolB": "Fibery's Free plan directly supports up to 10 users plus 10 guests, with Standard/Pro/Enterprise tiers priced per user and Enterprise requiring a minimum of 25 paid users.",
      "whyItMatters": "Fibery is architected from the ground up for larger, per-seat team collaboration; Craft's team support is framed as bundling individual accounts.",
      "benefitsWho": "Growing teams beyond 10 people, especially those needing 25+ seats, are better served by Fibery's per-user Enterprise structure."
    },
    {
      "title": "AI availability by plan",
      "toolA": "Craft's Free plan includes only 15 AI credits, and even the paid Plus plan caps AI credits at 50/month.",
      "toolB": "Fibery AI is included on the Free plan and all paid tiers without a stated credit cap in the facts provided.",
      "whyItMatters": "Credit-capped AI usage can limit how much a user relies on AI writing help in daily work.",
      "benefitsWho": "Heavy AI users may find Craft's credit caps limiting compared to Fibery's inclusion of AI across every tier."
    },
    {
      "title": "Automation depth",
      "toolA": "Craft's feature list does not include a dedicated automation or formula engine.",
      "toolB": "Fibery offers automations and formulas, including JavaScript automations on Pro plans and unlimited automations/integrations on Enterprise.",
      "whyItMatters": "Custom automation logic (including code-level automations) enables more complex workflow logic than a docs app typically supports.",
      "benefitsWho": "Operations and product teams building custom workflows across linked records benefit from Fibery's automation depth."
    },
    {
      "title": "Platform support",
      "toolA": "Craft's tags list web-app, iOS, and Mac, with no stated Android support.",
      "toolB": "Fibery is tagged as a web-app without iOS/Mac/Android tags listed in the facts provided.",
      "whyItMatters": "Native mobile/desktop app availability affects how usable a tool is offline or on a phone.",
      "benefitsWho": "Users who want a native Mac/iOS experience may lean toward Craft; those fine with a web-based tool across devices aren't limited by Fibery's format."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Structure",
      "rows": [
        {
          "feature": "Rich document editing",
          "toolA": "available",
          "toolB": "available",
          "note": "Fibery via Docs & whiteboards feature."
        },
        {
          "feature": "Relational databases",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multiple structured views (Board, Gantt, Timeline, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Whiteboards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Task management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI writing/analysis assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft caps AI credits (15 free, 50/month on Plus); Fibery AI included without a stated cap."
        },
        {
          "feature": "Custom automations/formulas",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "JavaScript-level automations",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Fibery Pro plan and above."
        }
      ]
    },
    {
      "group": "Pricing & Team Scale",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft free: 1,500 blocks, 1GB storage, 15 AI credits. Fibery free: up to 10 users + 10 guests, 10 databases, AI included."
        },
        {
          "feature": "Multi-user team plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft bundles up to 10 individual Plus accounts; Fibery prices per user with Enterprise requiring 25+ users."
        },
        {
          "feature": "SSO / SCIM provisioning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fibery Enterprise tier only."
        },
        {
          "feature": "Startup/nonprofit discount program",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fibery offers 6 months free Pro for companies under 42 employees, plus nonprofit/education/Ukraine discounts."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Craft or Fibery free?",
      "answer": "Both have free plans. Craft's free plan includes 1,500 blocks of content, 1GB storage, and 15 AI credits. Fibery's free plan supports up to 10 users plus 10 guests, 10 databases, and includes AI features."
    },
    {
      "question": "Which tool is built for teams versus individuals?",
      "answer": "Craft is framed around individual accounts, with Family and Team plans bundling multiple individual Plus accounts. Fibery is built for direct multi-user collaboration, supporting up to 10 users on its free plan and per-user pricing beyond that."
    },
    {
      "question": "Does either tool use relational databases?",
      "answer": "Fibery's core structure is relational databases with multiple views (Table, Board, Gantt, Timeline, and more). Craft is document-centric and does not list a relational database feature."
    },
    {
      "question": "Is AI included on the free plan for both?",
      "answer": "Yes for both, though Craft's free plan caps AI usage at 15 credits, and its paid Plus plan caps AI at 50 credits/month. Fibery AI is included on the free plan and all paid tiers without a stated cap in the facts."
    },
    {
      "question": "Does Fibery offer startup or nonprofit discounts?",
      "answer": "Yes — Fibery offers 6 months of the Pro plan free for companies under 42 employees, plus 50% discounts for non-profit, educational, and Ukrainian organizations, and free access for open-source projects."
    },
    {
      "question": "What automation options does each tool offer?",
      "answer": "Fibery includes automations and formulas, with JavaScript-level automations available on Pro plans and above. Craft's documented features do not include a custom automation or formula engine."
    }
  ]
};

export default craftVsFiberyContent;
