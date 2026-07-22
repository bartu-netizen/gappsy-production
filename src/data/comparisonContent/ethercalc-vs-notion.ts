import type { ToolComparisonContent } from './types';

const ethercalcVsNotionContent: ToolComparisonContent = {
  "verdict": "EtherCalc is a free, open-source, self-hostable spreadsheet built for real-time collaborative editing, shared simply by sending a URL. Notion is a much broader, freemium AI workspace where databases are one of many connected content types alongside docs, wikis, and project management. Choose based on whether you need a dedicated spreadsheet or a full connected workspace with database views built in.",
  "bestForToolA": "EtherCalc fits technical users who want a free, self-hostable, real-time collaborative spreadsheet with a REST API and XLSX import/export, deployable via Docker Compose or Cloudflare Workers.",
  "bestForToolB": "Notion fits teams that want spreadsheet-like database views (table, board, calendar, timeline) embedded inside a broader connected workspace with AI-assisted writing and Q&A, from a Free plan up to $20 per member/month for Business.",
  "whoNeedsBoth": "A technical team could run quick, disposable collaborative calculations in a self-hosted EtherCalc instance (sharing just a URL) while keeping their structured, long-lived project data and documentation in Notion's databases and pages.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "EtherCalc is a dedicated spreadsheet application focused solely on real-time collaborative editing of tabular, formula-based data.",
      "toolB": "Notion is a general workspace combining block-based pages, flexible databases, docs, and project management, with spreadsheet-like table views as one feature among many.",
      "whyItMatters": "A single-purpose spreadsheet is simpler and faster to spin up for pure number-crunching, while a general workspace suits teams organizing many types of content together.",
      "benefitsWho": "Users who just need a shared spreadsheet benefit from EtherCalc's focus; teams wanting spreadsheets connected to docs and tasks benefit from Notion."
    },
    {
      "title": "Pricing",
      "toolA": "EtherCalc is free and open source with no pricing plans documented.",
      "toolB": "Notion is freemium: Free, then Plus at $10 per member/month, Business at $20 per member/month, and custom Enterprise pricing.",
      "whyItMatters": "A zero-cost tool removes budget considerations entirely, while per-seat SaaS pricing scales with team size.",
      "benefitsWho": "Cost-sensitive technical users benefit from EtherCalc; teams that value a broader feature set may accept Notion's per-seat pricing."
    },
    {
      "title": "Collaboration Model",
      "toolA": "EtherCalc's collaboration model is simple: share the spreadsheet's URL, and anyone with the link can edit it together in real time.",
      "toolB": "Notion's collaboration is workspace-based, with member roles, permissions, and admin controls scaling up through Business and Enterprise tiers.",
      "whyItMatters": "URL-based sharing is fast and frictionless for ad hoc collaboration, while workspace-based permissions suit organizations needing access control.",
      "benefitsWho": "Ad hoc collaborators benefit from EtherCalc's simplicity; organizations needing structured permissions benefit from Notion."
    },
    {
      "title": "Deployment",
      "toolA": "EtherCalc can be self-hosted via Docker Compose without requiring Redis or other external services, or deployed to Cloudflare Workers as an alternative.",
      "toolB": "Notion is a fully hosted SaaS workspace with no self-hosting option documented.",
      "whyItMatters": "Self-hosting gives full control over where spreadsheet data lives, which matters for teams with data-residency or privacy requirements.",
      "benefitsWho": "Technical teams wanting infrastructure control benefit from EtherCalc; teams that prefer a fully managed service benefit from Notion."
    },
    {
      "title": "AI Features",
      "toolA": "EtherCalc does not document any AI features.",
      "toolB": "Notion includes AI-assisted writing, Q&A over a team's own Notion content, and configurable AI Custom Agents.",
      "whyItMatters": "AI-assisted content creation and search are relevant to broader knowledge work, not to a tool focused purely on spreadsheet calculations.",
      "benefitsWho": "Teams wanting AI-assisted work benefit from Notion; this dimension doesn't apply to EtherCalc's focused use case."
    }
  ],
  "featureMatrix": [
    {
      "group": "Spreadsheet & Data",
      "rows": [
        {
          "feature": "Real-time collaborative spreadsheet editing",
          "toolA": "available",
          "toolB": "limited",
          "note": "EtherCalc: dedicated spreadsheet; Notion: database table views, not a formula-driven spreadsheet"
        },
        {
          "feature": "XLSX import/export",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Flexible database views (table/board/calendar/timeline)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted writing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI Q&A over your own content",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Configurable AI agents",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "EtherCalc: fully free; Notion: Free plan then $10-$20/member/month"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "EtherCalc: Docker Compose or Cloudflare Workers"
        },
        {
          "feature": "URL-based instant sharing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Admin/permission controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Notion Business/Enterprise tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is EtherCalc a replacement for Notion's databases?",
      "answer": "Not exactly. EtherCalc is a dedicated, formula-capable spreadsheet, while Notion's database views are structured records that can be displayed as a table, board, calendar, or timeline within a broader workspace — they're not documented as a formula-driven spreadsheet."
    },
    {
      "question": "Which tool is free?",
      "answer": "EtherCalc is completely free and open source with no pricing plans. Notion has a Free plan but paid tiers start at $10 per member/month for Plus."
    },
    {
      "question": "Can I self-host EtherCalc or Notion?",
      "answer": "EtherCalc can be self-hosted via Docker Compose or deployed to Cloudflare Workers. Notion does not document a self-hosting option — it's SaaS only."
    },
    {
      "question": "How do I collaborate on an EtherCalc spreadsheet?",
      "answer": "You share the spreadsheet's URL with others, and they can edit it together in real time — no accounts or permissions system is documented beyond that."
    },
    {
      "question": "Does EtherCalc have AI features?",
      "answer": "No AI features are documented for EtherCalc. Notion includes AI-assisted writing, Q&A over your workspace content, and configurable AI Custom Agents."
    },
    {
      "question": "Can EtherCalc and Notion be used together?",
      "answer": "Yes — a team could use a self-hosted EtherCalc instance for quick, shareable calculations while keeping structured, long-term project data and documentation organized in Notion."
    }
  ]
};

export default ethercalcVsNotionContent;
