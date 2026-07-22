import type { ToolComparisonContent } from './types';

const bullhornVsManatalContent: ToolComparisonContent = {
  "verdict": "Bullhorn and Manatal both serve staffing/recruiting agencies with an ATS and CRM, but they sit at opposite ends of company maturity and pricing transparency: Bullhorn is a 26-year-old (founded 2000) enterprise-scale platform with quote-only pricing and a Middle Office payroll module, while Manatal is a lower-cost, published-pricing platform ($15/user/month to start) with a 14-day free trial and an AI Interviewer add-on. The gap is less about feature parity and more about scale, cost, and how much of the price you can see before talking to sales.",
  "bestForToolA": "Best for established staffing agencies needing payroll/worker payment processing (Middle Office), 300+ marketplace integrations, and a platform used by 80% of the world's largest staffing firms — worth the quote-only sales process for that scale.",
  "bestForToolB": "Best for smaller or growing agencies that want transparent starting pricing ($15/user/month), a 14-day free trial with no credit card, and an AI Interviewer for automated video interviews as a paid add-on.",
  "whoNeedsBoth": "A large staffing firm running Bullhorn for enterprise ATS/CRM/payroll at the parent level might still see smaller subsidiary teams or newly acquired agencies running on Manatal until they're migrated onto the parent platform, given the cost and complexity gap between the two.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Bullhorn publishes no pricing; its pricing page directs prospects to contact sales.",
      "toolB": "Manatal publishes annual-billing prices: $15/user/month (Professional), $35/user/month (Enterprise), $55/user/month (Enterprise Plus), with monthly billing at $19/$39/$59.",
      "whyItMatters": "Published pricing lets smaller agencies self-serve a budget decision without a sales cycle.",
      "benefitsWho": "Small and mid-size agencies with limited procurement bandwidth benefit from Manatal's published pricing and free trial."
    },
    {
      "title": "Payroll for staffing",
      "toolA": "Bullhorn's Middle Office module explicitly handles payroll and worker payment processing.",
      "toolB": "Manatal's feature list does not include payroll or worker payment processing.",
      "whyItMatters": "Staffing agencies (as opposed to typical in-house recruiting teams) often need to pay contractors/temps directly, which requires payroll functionality.",
      "benefitsWho": "Staffing and contracting agencies that place temporary workers and need to run payroll for them."
    },
    {
      "title": "Company maturity and scale",
      "toolA": "Bullhorn was founded in 2000, is headquartered in Boston, and states it serves 10,000+ customers globally, used by 80% of the world's largest staffing firms.",
      "toolB": "Manatal's founding year and headquarters are not disclosed in the facts provided.",
      "whyItMatters": "A longer, disclosed track record and larger customer base can matter for risk-averse enterprise procurement.",
      "benefitsWho": "Large staffing firms doing vendor due diligence that weighs company longevity and market share."
    },
    {
      "title": "AI-powered video interviewing",
      "toolA": "Bullhorn's Amplify AI suite includes Chat, Digital Workers, and Search & Match AI — no automated video interviewing feature is documented.",
      "toolB": "Manatal's AI Interviewer conducts automated video interviews 24/7 for unlimited candidates, available as a paid add-on across all plans.",
      "whyItMatters": "Automated video interviewing can help high-volume screening, particularly for agencies filling many similar roles at once.",
      "benefitsWho": "High-volume staffing desks that need to screen many candidates quickly via automated video interviews."
    },
    {
      "title": "Free trial availability",
      "toolA": "Bullhorn does not list a free trial; pricing requires contacting sales directly.",
      "toolB": "Manatal offers a 14-day free trial with no credit card required.",
      "whyItMatters": "A no-commitment trial lowers the barrier to hands-on evaluation before purchase.",
      "benefitsWho": "Smaller agencies or individual recruiters wanting to test the product before any sales conversation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core ATS/CRM",
      "rows": [
        {
          "feature": "Applicant tracking system",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Recruitment CRM",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Kanban-style pipeline board",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Recruitment workflow automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Manatal: available on Enterprise plan and above."
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI search/match",
          "toolA": "available",
          "toolB": "available",
          "note": "Bullhorn: Amplify AI Suite. Manatal: AI recommendations."
        },
        {
          "feature": "Automated AI video interviewing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Manatal AI Interviewer, paid add-on."
        },
        {
          "feature": "AI-driven candidate profile enrichment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Manatal builds profiles from 20+ social platforms."
        },
        {
          "feature": "'Digital Workers' automation agents",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing, Payroll & Access",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Manatal: $15/user/month (Professional, annual)."
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Manatal: 14 days, no credit card."
        },
        {
          "feature": "Payroll / worker payment processing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bullhorn Middle Office module."
        },
        {
          "feature": "Job board sourcing reach",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Manatal integrates with 2,500+ job boards."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Bullhorn or Manatal?",
      "answer": "Manatal publishes starting prices from $15/user/month (Professional, annual billing). Bullhorn doesn't publish pricing at all and requires contacting sales."
    },
    {
      "question": "Does Bullhorn handle payroll for staffing agencies?",
      "answer": "Yes — Bullhorn's Middle Office module handles payroll and worker payment processing. This isn't a documented Manatal feature."
    },
    {
      "question": "Does Manatal offer a free trial?",
      "answer": "Yes, a 14-day free trial with no credit card required. Bullhorn does not list a free trial."
    },
    {
      "question": "What is Manatal's AI Interviewer?",
      "answer": "It conducts automated video interviews 24/7 for unlimited candidates, available as a paid add-on across Manatal's plans."
    },
    {
      "question": "How long has each company been in business?",
      "answer": "Bullhorn was founded in 2000 and is headquartered in Boston, with 10,000+ customers globally. Manatal's founding year and headquarters are not disclosed in the facts available."
    }
  ]
};

export default bullhornVsManatalContent;
