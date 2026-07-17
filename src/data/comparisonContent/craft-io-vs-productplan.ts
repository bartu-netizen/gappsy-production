import type { ToolComparisonContent } from './types';

const craftIoVsProductplanContent: ToolComparisonContent = {
  "verdict": "Craft.io publishes exact tiered pricing starting at $19/editor/month (annual, Starter) with a 14-day free trial, built-in Guru AI for epic summaries and release notes, and native integrations spanning Jira, Azure DevOps, GitHub, GitLab, Confluence, Figma, and Salesforce. ProductPlan publishes no pricing at all — every tier requires booking a demo — and focuses its AI on customer research: AI-moderated surveys with adaptive follow-up questions and a Research Agent that answers plain-language questions about research data, backed by a stated scale of 1,000+ customers and 860,000 roadmaps built. Both use a similar unlimited-free-viewer, paid-editor billing model, but they diverge sharply on pricing transparency and what their AI is built to do.",
  "bestForToolA": "Craft.io fits teams that want published, predictable pricing from $19/editor/month, a self-serve 14-day free trial, and Guru AI for automating epic summaries and release notes from the entry tier.",
  "bestForToolB": "ProductPlan fits teams that specifically need AI-moderated customer research — adaptive follow-up survey questions and a Research Agent for querying research data in plain language — and are comfortable engaging with sales via a demo rather than self-serve signup.",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously as core roadmapping tools — both serve as the primary system for building and sharing product roadmaps, so a team would pick one rather than maintain the same roadmap data in two places.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Craft.io publishes exact prices: Starter at $19-24/editor/month, Pro at $79-99/editor/month, with custom Enterprise pricing.",
      "toolB": "ProductPlan publishes no pricing at all; every tier, including its entry-level plan, requires booking a demo.",
      "whyItMatters": "Published pricing lets teams self-serve a purchase decision, while custom pricing requires a sales conversation before any cost estimate.",
      "benefitsWho": "Teams that want to evaluate cost without a sales call benefit from Craft.io's published pricing."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "Craft.io offers a 14-day free trial with no credit card required.",
      "toolB": "ProductPlan documents no free trial or free plan.",
      "whyItMatters": "A no-commitment trial lowers the barrier to testing a tool before purchase.",
      "benefitsWho": "Self-serve buyers who want to try before engaging sales benefit from Craft.io."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Craft.io's Guru AI focuses on generating epic summaries, release notes, and go-to-market briefs.",
      "toolB": "ProductPlan's AI focuses on customer research: AI-moderated surveys with adaptive follow-up questions, plus a Research Agent that answers plain-language questions about the resulting research data.",
      "whyItMatters": "The two AI tools automate different parts of the product workflow — documentation output versus customer research synthesis.",
      "benefitsWho": "Teams heavy on customer research and interviews benefit from ProductPlan's Research Agent; teams focused on shipping documentation benefit from Craft.io's Guru AI."
    },
    {
      "title": "Native Integration Breadth",
      "toolA": "Craft.io documents a wide native integration list: Jira, Azure DevOps, GitHub, GitLab, Confluence, Figma, and Salesforce.",
      "toolB": "ProductPlan's native integration is limited to Jira specifically, with other tools requiring its API.",
      "whyItMatters": "A broader native integration list reduces the need for custom API work to connect a roadmap tool to the rest of the product stack.",
      "benefitsWho": "Teams using multiple dev and design tools benefit from Craft.io's broader native integration list."
    },
    {
      "title": "Published Scale & Social Proof",
      "toolA": "Craft.io does not document comparable aggregate usage statistics in its published materials.",
      "toolB": "ProductPlan states 1,000+ customers, 23M+ initiatives planned, 860K roadmaps built, and a 4.3/5 rating on G2 (per the company's own site).",
      "whyItMatters": "Aggregate usage numbers can serve as a proxy for platform maturity and adoption during vendor evaluation.",
      "benefitsWho": "Buyers weighing vendor stability and adoption benefit from ProductPlan's published scale figures."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ProductPlan requires a demo for all tiers"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Craft.io: 14-day, no credit card"
        },
        {
          "feature": "Unlimited free viewers",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Editor-based billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Both price only active editors, not viewers"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI epic/release note generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft.io's Guru AI"
        },
        {
          "feature": "AI-moderated customer research surveys",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI Q&A over research data (Research Agent)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI included at entry tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft.io's Guru AI is on Starter; ProductPlan's AI tier availability isn't documented"
        }
      ]
    },
    {
      "group": "Integrations & Roadmapping",
      "rows": [
        {
          "feature": "Native Jira integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Design tool integrations (Figma, Adobe XD, etc.)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft.io Pro plan and above"
        },
        {
          "feature": "Portfolio-level roadmap visibility",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft.io: Portfolio management (Enterprise); ProductPlan: Portfolio visibility"
        },
        {
          "feature": "Milestone-based launch planning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does ProductPlan publish its pricing like Craft.io does?",
      "answer": "No, ProductPlan requires booking a demo for every tier and publishes no prices. Craft.io publishes exact prices, from $19/editor/month (Starter, annual) to $99/editor/month (Pro, monthly), with custom Enterprise pricing."
    },
    {
      "question": "Which tool has a free trial?",
      "answer": "Craft.io offers a 14-day free trial with no credit card required. ProductPlan does not document a free trial or free plan."
    },
    {
      "question": "What does ProductPlan's Research Agent do?",
      "answer": "It's an AI feature that lets users ask questions about customer research data and get answers in plain language, built on top of ProductPlan's AI-moderated research surveys."
    },
    {
      "question": "Does Craft.io include AI features from its cheapest plan?",
      "answer": "Yes, Craft.io's Guru AI, which automates epic summaries, release notes, and go-to-market briefs, is included even on the entry-level Starter plan."
    },
    {
      "question": "How many companies use ProductPlan?",
      "answer": "ProductPlan states it has more than 1,000 customers, with over 23 million initiatives planned and 860,000 roadmaps built on the platform."
    },
    {
      "question": "Which tool has broader native integrations?",
      "answer": "Craft.io documents native integrations with Jira, Azure DevOps, GitHub, GitLab, Confluence, Figma, and Salesforce. ProductPlan's native integration is limited to Jira, with other tools requiring its API."
    }
  ]
};

export default craftIoVsProductplanContent;
