import type { ToolComparisonContent } from './types';

const seatableVsTeableContent: ToolComparisonContent = {
  "verdict": "SeaTable and Teable both combine a spreadsheet interface with database-level power, but they scale and deploy differently: Teable is explicitly Postgres-backed and documents row ceilings up to 1,000,000 rows on its Business plan plus AI features (AI fields, AI chat, a natural-language app builder, and the CuppyClaw agent) starting on the Free plan, while SeaTable emphasizes EU-hosted cloud infrastructure in certified German data centers, on-premises licensing including a permanently free 3-user tier, and built-in Python script execution. Teable's Community Edition is AGPL-3.0 with a separate proprietary Enterprise Edition; SeaTable's components are split across Apache 2.0, AGPLv3, and a proprietary dtable-server.",
  "bestForToolA": "SeaTable suits EU-regulated teams or small groups that want a permanently free 3-user on-premises license and built-in Python scripting for custom automations.",
  "bestForToolB": "Teable suits teams expecting to outgrow typical no-code row limits, since its Postgres backend supports up to 1,000,000 rows on the Business plan, and want AI-assisted app building (the CuppyClaw agent, AI fields) starting on the Free tier.",
  "whoNeedsBoth": "A distributed organization might run SeaTable on-premises in Germany for a dataset with strict EU-residency requirements, while using Teable's cloud AI app builder for a separate, larger-scale, less sensitive dataset that benefits from Postgres-level row capacity.",
  "keyDifferences": [
    {
      "title": "Underlying Database Engine & Scale",
      "toolA": "SeaTable's row ceilings top out at 50,000 rows on the Plus plan, rising to unlimited only on Enterprise or Dedicated Cloud tiers, without a named underlying database engine.",
      "toolB": "Teable is explicitly built on PostgreSQL, with documented row limits up to 250,000 (Pro) and 1,000,000 (Business).",
      "whyItMatters": "Teams anticipating large datasets need to know whether a platform's architecture is designed for scale or optimized for smaller, spreadsheet-sized data.",
      "benefitsWho": "Teams building data-heavy applications that expect to grow well beyond typical spreadsheet row counts."
    },
    {
      "title": "Licensing Clarity",
      "toolA": "SeaTable's codebase mixes Apache 2.0 (dtable-web, dtable-events, thumbnail-server), AGPLv3 (seaf-server), and a proprietary dtable-server component.",
      "toolB": "Teable's Community Edition is fully AGPL-3.0 licensed, with a separate proprietary Enterprise Edition for advanced features.",
      "whyItMatters": "A cleaner community/enterprise split makes it easier for procurement and engineering teams to understand exactly what's open source.",
      "benefitsWho": "Open-source-conscious engineering and procurement teams."
    },
    {
      "title": "AI Feature Depth",
      "toolA": "SeaTable frames AI as credit-metered AI-supported automations (12.5 credits/month on Free) plus an optional self-hosted AI server for GDPR compliance.",
      "toolB": "Teable includes AI fields, AI chat, a natural-language app builder, and a named AI agent called CuppyClaw, available starting on the Free plan.",
      "whyItMatters": "Named, purpose-built AI features (like an app builder or agent) suggest a different depth of AI integration than generic credit-metered automation.",
      "benefitsWho": "Teams that want to use AI to generate apps or interact conversationally with their data, not just automate rule-based tasks."
    },
    {
      "title": "Data Residency Positioning",
      "toolA": "SeaTable explicitly markets EU-hosted cloud in certified German data centers plus Dedicated Cloud with regional selection.",
      "toolB": "Teable's documented deployment options are Docker self-hosting or one-click deploys to Railway, Sealos, or Zeabur, without a stated EU-only hosted tier.",
      "whyItMatters": "Regulated industries or EU public-sector buyers need explicit data-location guarantees, not just self-hosting as an option.",
      "benefitsWho": "EU-based organizations with GDPR or data-sovereignty requirements."
    },
    {
      "title": "Formal Certifications",
      "toolA": "SeaTable's facts don't document formal ISO certifications, instead emphasizing German/EU data-center hosting.",
      "toolB": "Teable states ISO 9001 and ISO 27001 certifications on its site.",
      "whyItMatters": "Formal ISO certifications can matter for enterprise procurement and security review processes.",
      "benefitsWho": "Enterprise buyers running formal vendor security assessments."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Model & Views",
      "rows": [
        {
          "feature": "Grid/Kanban/Gallery/Calendar views",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Named Form view",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Timeline view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Direct SQL querying",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Documented underlying database engine",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Teable: PostgreSQL"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI credits on Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "SeaTable: 12.5/month; Teable: 200 credits + 100 automation runs"
        },
        {
          "feature": "Natural-language app builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Named AI agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Teable: CuppyClaw"
        },
        {
          "feature": "Built-in Python script execution",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Hosting, Licensing & Scale",
      "rows": [
        {
          "feature": "Self-hosting via Docker",
          "toolA": "available",
          "toolB": "available",
          "note": "Teable also offers Railway/Sealos/Zeabur one-click deploys"
        },
        {
          "feature": "Permanently free self-hosted tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SeaTable: free 3-user on-premises license"
        },
        {
          "feature": "EU-certified data center hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Formal ISO certification (9001/27001)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool handles larger datasets?",
      "answer": "Teable, whose Postgres backend supports up to 1,000,000 rows on the Business plan ($20/seat/month annual). SeaTable's row ceiling on its Plus plan is 50,000 rows, with unlimited rows only available on Enterprise or Dedicated Cloud."
    },
    {
      "question": "Is either platform better suited to EU data-residency requirements?",
      "answer": "SeaTable explicitly documents EU cloud hosting in certified German data centers and a Dedicated Cloud option with regional selection. Teable's facts don't document an equivalent EU-specific hosted tier."
    },
    {
      "question": "What AI capabilities differ between the two?",
      "answer": "Teable includes a named AI agent (CuppyClaw), AI chat, AI fields, and a natural-language app builder from the Free plan. SeaTable's AI features are framed as credit-metered AI-supported automations plus an optional self-hosted AI server for GDPR-compliant deployments."
    },
    {
      "question": "Which is more fully open source?",
      "answer": "Teable's Community Edition is entirely AGPL-3.0. SeaTable's codebase mixes Apache 2.0, AGPLv3, and a proprietary dtable-server component, so it isn't fully open source."
    },
    {
      "question": "Do both support custom data scripting?",
      "answer": "SeaTable has built-in Python script execution (100 to 1,000 runs/user/month depending on plan). Teable's automation is credit-metered without a documented general-purpose scripting layer."
    },
    {
      "question": "How do starting paid prices compare?",
      "answer": "Teable's Pro plan starts at $10/seat/month billed annually. SeaTable's Plus plan starts at €7/user/month billed annually."
    }
  ]
};

export default seatableVsTeableContent;
