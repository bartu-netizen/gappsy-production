import type { ToolComparisonContent } from './types';

const ambitionVsSalesCookieContent: ToolComparisonContent = {
  "verdict": "Ambition is a performance orchestration and coaching platform built around real-time leaderboards and structured coaching cadences, priced transparently at $45-$75/user/month, while Sales Cookie is a commission calculation platform focused on accurate, transparent payout tracking with claw-back and true-up handling. These solve different problems - motivating and coaching reps versus calculating what they're paid - so the choice depends on which gap you're trying to close.",
  "bestForToolA": "Sales leaders who want real-time leaderboards, coaching orchestration, and performance intelligence with transparent per-user pricing, such as the Dallas Mavericks and T-Mobile per Ambition's cited customers.",
  "bestForToolB": "Sales teams that need automated, accurate commission calculation with claw-back, true-up, and multi-currency support, and want to start with a no-credit-card free trial.",
  "whoNeedsBoth": "A RevOps team could realistically run Sales Cookie to calculate and pay commissions accurately while using Ambition separately to drive leaderboard-based motivation and coaching cadences on the sales floor - the two address non-overlapping parts of the sales performance stack.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Ambition is a performance orchestration platform built around real-time leaderboards, coaching orchestration, and performance intelligence (risk detection, forecasting).",
      "toolB": "Sales Cookie is a commission calculation platform built around claw-backs, true-ups, manager overrides, and multi-currency payout tracking.",
      "whyItMatters": "These tools solve fundamentally different problems, so buyers shouldn't treat them as interchangeable options for the same need.",
      "benefitsWho": "Buyers scoping whether they need a coaching/motivation tool or a commission calculation tool."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Ambition publishes exact per-user pricing across three tiers: $45/user/month (Starter), $65/user/month (Pro), and $75/user/month (Enterprise).",
      "toolB": "Sales Cookie does not publish pricing tiers or exact costs on its website.",
      "whyItMatters": "Published pricing lets buyers budget without a sales call, while opaque pricing requires direct outreach.",
      "benefitsWho": "Budget-conscious buyers who want upfront cost clarity before engaging sales."
    },
    {
      "title": "Contract Commitment",
      "toolA": "Ambition's standard contracts are structured with a two-year annual term.",
      "toolB": "Sales Cookie's contract terms aren't documented, but it offers a free trial with instant access and no credit card required.",
      "whyItMatters": "A multi-year contract requirement is a much bigger commitment than a free, no-obligation trial.",
      "benefitsWho": "Organizations wary of long lock-in periods versus those ready to commit to a multi-year coaching platform."
    },
    {
      "title": "AI Feature Cost Structure",
      "toolA": "Ambition's Agentic AI (context-aware performance recommendations) is available as a paid add-on on top of base per-user pricing.",
      "toolB": "Sales Cookie's AI-powered commission administration (AI-assisted queries) is listed as a core feature rather than a separate add-on.",
      "whyItMatters": "Whether AI is bundled or billed separately affects total cost of ownership.",
      "benefitsWho": "Budget planners estimating the full cost of AI-enabled features before signing."
    },
    {
      "title": "Validation Signal",
      "toolA": "Ambition cites named customers including the Dallas Mavericks and T-Mobile, plus recognition as a Notable Vendor in Forrester's Revenue Enablement Landscape Report Q1 2026.",
      "toolB": "Sales Cookie's validation centers on integration breadth (Salesforce, HubSpot, NetSuite, QuickBooks, and others) rather than named customers or analyst reports.",
      "whyItMatters": "Brand-name customer references and integration ecosystem breadth are different kinds of proof points.",
      "benefitsWho": "Buyers weighing recognizable customer logos against a documented list of supported integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Real-time Leaderboards",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Coaching Orchestration (1:1s, cadences)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Commission Calculation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Claw-back / True-up Handling",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Intelligence",
      "rows": [
        {
          "feature": "Agentic / Context-aware AI Recommendations",
          "toolA": "limited",
          "toolB": "available",
          "note": "Ambition's is a paid add-on; Sales Cookie's is core"
        },
        {
          "feature": "Risk Detection & Forecasting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ambition's Performance Intelligence"
        },
        {
          "feature": "AI-Assisted Query / Data Management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sales Cookie's AI-powered commission administration"
        }
      ]
    },
    {
      "group": "Buying Experience",
      "rows": [
        {
          "feature": "Published Per-User Pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Ambition: $45-$75/user/month"
        },
        {
          "feature": "Free Trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "No credit card required"
        },
        {
          "feature": "Salesforce Integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Included in all Ambition tiers"
        },
        {
          "feature": "SSO / SAML",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included in all Ambition tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Ambition and Sales Cookie solving the same problem?",
      "answer": "No. Ambition is a performance orchestration and coaching platform built around leaderboards and coaching cadences, while Sales Cookie is a commission calculation platform focused on accurate payout tracking with claw-back and true-up handling."
    },
    {
      "question": "How much does Ambition cost compared to Sales Cookie?",
      "answer": "Ambition publishes tiered per-user pricing: $45/user/month (Starter), $65/user/month (Pro), and $75/user/month (Enterprise). Sales Cookie does not publish pricing tiers or exact costs."
    },
    {
      "question": "Does Sales Cookie offer leaderboards like Ambition?",
      "answer": "Sales Cookie's documented features focus on commission calculation, claw-backs, true-ups, and payout visibility. Real-time leaderboards are not documented as a Sales Cookie feature."
    },
    {
      "question": "Which tool has a free trial?",
      "answer": "Sales Cookie offers a free trial with instant access and no credit card required. Ambition's facts don't document a free trial option."
    },
    {
      "question": "Is Ambition's AI included in the base price?",
      "answer": "No, Ambition's Agentic AI (context-aware recommendations) is an add-on beyond the base per-user pricing tiers."
    },
    {
      "question": "What is Ambition's typical contract length?",
      "answer": "Ambition's standard contracts are structured on a two-year annual term."
    }
  ]
};

export default ambitionVsSalesCookieContent;
