import type { ToolComparisonContent } from './types';

const cannyVsZedaIoContent: ToolComparisonContent = {
  "verdict": "Canny and Zeda.io both help product teams turn customer feedback into prioritized roadmaps, but they differ sharply on price and feedback source: Canny starts free (up to 25 tracked users) and grows to $79/month for its Pro plan with AI Autopilot capturing feedback from calls and tickets, while Zeda.io has no free plan and starts at $499/month billed annually, positioning itself with named enterprise clients like Microsoft and PayPal. Both use AI to reduce manual feedback logging, but at very different price points and company scale.",
  "bestForToolA": "Startups and mid-market product teams that want a free or low-cost entry point ($0 to $79/month) with AI Autopilot to auto-capture feedback from Slack, Gong, Intercom, Salesforce, and HubSpot.",
  "bestForToolB": "Enterprise product teams with budget for a $499+/month annual commitment who want AI-driven insight generation, an Ask AI query tool, and dedicated migration support from tools like Canny itself.",
  "whoNeedsBoth": "There is no realistic case for running both — they serve the identical job (centralizing and prioritizing customer feedback), and Zeda.io explicitly offers migration support away from Canny, signaling they are positioned as direct substitutes rather than complements.",
  "keyDifferences": [
    {
      "title": "Entry-Level Pricing",
      "toolA": "Canny has a genuine free plan for up to 25 tracked users with unlimited feedback and Autopilot AI included, then $79/month (billed yearly) for the Pro plan.",
      "toolB": "Zeda.io has no free plan; its only published plan, Standard, starts at $499/month and requires annual billing.",
      "whyItMatters": "The roughly 6x price gap at entry level means the tools serve very different budget brackets, even though both are feedback-and-roadmap products.",
      "benefitsWho": "Early-stage or budget-constrained product teams benefit from Canny's free tier; well-funded enterprise teams may not view $499/month as a barrier."
    },
    {
      "title": "Feedback Capture Method",
      "toolA": "Canny's AI Autopilot automatically captures feedback from sales calls, support tickets, and conversations across integrations like Gong, Intercom, and Salesforce without manual entry.",
      "toolB": "Zeda.io centralizes feedback from Slack, Intercom, surveys, interviews, and other sources, then applies AI feedback analysis and an Opportunity Radar to surface patterns.",
      "whyItMatters": "Both automate capture, but Canny leans specifically on sales/support conversation mining (Gong, Salesforce, HubSpot) while Zeda.io leans on a broader mix of qualitative sources including interviews and surveys.",
      "benefitsWho": "Sales-led organizations with heavy call/ticket volume may prefer Canny's Autopilot; research-heavy product teams doing interviews and surveys may prefer Zeda.io's intake breadth."
    },
    {
      "title": "Prioritization Logic",
      "toolA": "Canny ranks feature requests by revenue impact and customer demand using its centralized feedback repository.",
      "toolB": "Zeda.io builds impact-first roadmaps and OKRs prioritized specifically by revenue and customer impact, plus a predictive Opportunity Radar.",
      "whyItMatters": "Both claim revenue-based prioritization, so the practical difference comes down to price and the surrounding toolset rather than the prioritization concept itself.",
      "benefitsWho": "Revenue-focused product teams at any company size, though the price point determines which is accessible."
    },
    {
      "title": "Migration Positioning",
      "toolA": "Canny does not document migration support from competing tools.",
      "toolB": "Zeda.io explicitly advertises migration support from ProductBoard, Aha!, airfocus, UserVoice, and Canny, plus a 90-day prorated refund guarantee if unsatisfied.",
      "whyItMatters": "Explicit migration support and a refund guarantee reduce the risk of switching, which matters for teams already invested in a competitor's data.",
      "benefitsWho": "Teams currently on Canny (or another listed tool) considering an upgrade path to Zeda.io."
    },
    {
      "title": "Enterprise-Tier Gating",
      "toolA": "Canny's Business tier (5,000+ tracked users, SSO, CRM integrations) is custom-priced and not published.",
      "toolB": "Zeda.io's published Standard plan already includes 5,000+ integrations via Zapier and AI-powered release notes; anything beyond Standard is demo-based and not detailed publicly.",
      "whyItMatters": "Both tools obscure pricing once you exceed the entry tier, so buyers scaling past the published plans should expect a sales conversation either way.",
      "benefitsWho": "Growing teams need to budget for an eventual custom-pricing conversation regardless of which tool they start with."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback Capture",
      "rows": [
        {
          "feature": "Free plan available",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Canny: free up to 25 tracked users"
        },
        {
          "feature": "AI auto-capture from calls/tickets",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canny's AI Autopilot"
        },
        {
          "feature": "Survey and interview intake",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CRM integrations (Salesforce, HubSpot)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canny Business tier for CRM integrations"
        }
      ]
    },
    {
      "group": "Prioritization & Roadmapping",
      "rows": [
        {
          "feature": "Revenue-based prioritization",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Predictive opportunity detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeda.io's Opportunity Radar"
        },
        {
          "feature": "Public roadmap",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public changelog",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Natural-language AI query (Ask AI)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Canny: $0-$79/mo; Zeda.io: $499/mo annual"
        },
        {
          "feature": "Monthly billing option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zeda.io requires annual commitment"
        },
        {
          "feature": "Refund guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeda.io: 90-day prorated refund"
        },
        {
          "feature": "Migration assistance from competitors",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Canny or Zeda.io cheaper?",
      "answer": "Canny is significantly cheaper at entry: it has a free plan for up to 25 tracked users and a $79/month Pro plan. Zeda.io has no free plan and starts at $499/month, billed annually only."
    },
    {
      "question": "Does Zeda.io let you migrate from Canny?",
      "answer": "Yes, Zeda.io explicitly states it offers migration support from Canny, along with ProductBoard, Aha!, airfocus, and UserVoice."
    },
    {
      "question": "Which tool has a free trial?",
      "answer": "Zeda.io offers a 14-day free trial. Canny doesn't need a trial for its entry tier since it has a genuinely free plan; free-trial terms for Canny's paid Pro/Business tiers are not documented."
    },
    {
      "question": "How does Canny's AI Autopilot differ from Zeda.io's AI features?",
      "answer": "Canny's AI Autopilot automatically captures feedback from sales calls and support tickets via integrations like Gong and Intercom. Zeda.io's AI includes automatic feedback analysis across more source types (including surveys and interviews) plus Ask AI, a natural-language query tool over the feedback dataset."
    },
    {
      "question": "Can I get a refund if Zeda.io doesn't work out?",
      "answer": "Zeda.io states a 90-day refund guarantee with a prorated refund if you're unsatisfied. A comparable refund policy is not documented for Canny."
    },
    {
      "question": "Does either tool require an annual contract?",
      "answer": "Zeda.io's Standard plan requires annual billing with no monthly option. Canny's Pro plan is priced at $79/month when billed yearly, but a monthly option exists at roughly $95/month."
    }
  ]
};

export default cannyVsZedaIoContent;
