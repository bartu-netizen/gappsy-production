import type { ToolComparisonContent } from './types';

const involveMeVsScoreappContent: ToolComparisonContent = {
  "verdict": "involve.me combines native payment collection (Stripe, PayPal, Mollie), a built-in CRM, and 55+ integrations into interactive funnels starting at $19/month. ScoreApp focuses on AI-generated scorecards and quizzes with personalized dynamic results, deep integration into external CRMs (HubSpot, Salesforce, Keap), and a 14-day money-back guarantee, starting at $39/month. The choice depends on whether payments need to happen inside the funnel and whether a built-in CRM or integration with an existing one is preferred.",
  "bestForToolA": "Teams wanting to collect payments directly inside interactive funnels and consolidate lead scoring, email automation, and CRM functions in one platform without a separate CRM subscription.",
  "bestForToolB": "Coaches and consultants building lead-qualifying scorecards or assessments who already run an external CRM (HubSpot, Salesforce, Keap, Insightly, Mailchimp, or Kit) and want a money-back guarantee on paid plans.",
  "whoNeedsBoth": "An agency serving multiple clients might use involve.me for a client that wants payment-collecting funnels and a self-contained CRM, while using ScoreApp for a different client whose lead-scoring quiz needs to plug into an existing HubSpot or Salesforce instance.",
  "keyDifferences": [
    {
      "title": "Native payment collection",
      "toolA": "Accepts payments directly in funnels via Stripe, PayPal, or Mollie.",
      "toolB": "Not documented — no payment collection feature is mentioned.",
      "whyItMatters": "Businesses that want to sell directly through a quiz or funnel need native payments, which only involve.me documents.",
      "benefitsWho": "E-commerce and service businesses selling through interactive funnels."
    },
    {
      "title": "Built-in CRM vs. external CRM integrations",
      "toolA": "Includes a built-in CRM storing contact records with mapped properties and dynamic segments.",
      "toolB": "Integrates with external CRMs — HubSpot, Salesforce, Keap, Insightly, Mailchimp, and Kit — rather than offering its own.",
      "whyItMatters": "Teams without an existing CRM may prefer involve.me's all-in-one approach, while teams with an established CRM stack may prefer ScoreApp's integration-first model.",
      "benefitsWho": "Small teams without a CRM versus organizations already invested in a specific CRM."
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Start plan begins at $19/month.",
      "toolB": "Starter plan begins at $39/month.",
      "whyItMatters": "involve.me's lower entry price may suit budget-conscious teams testing paid features.",
      "benefitsWho": "Smaller businesses and solo operators evaluating cost."
    },
    {
      "title": "Free tier limits",
      "toolA": "Free plan allows 50 submissions or 500 visits per month with no credit card required.",
      "toolB": "Free plan is capped at 1 live scorecard and 10 responses per month.",
      "whyItMatters": "involve.me's free tier supports meaningfully higher volume for testing before upgrading.",
      "benefitsWho": "Teams wanting to validate a funnel or quiz at higher volume before paying."
    },
    {
      "title": "Money-back guarantee",
      "toolA": "Not documented — no guarantee is mentioned.",
      "toolB": "Offers a 14-day money-back guarantee on paid plans.",
      "whyItMatters": "A stated guarantee reduces the risk of committing to a paid plan.",
      "benefitsWho": "Buyers who want a safety net before committing budget."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Funnel Building",
      "rows": [
        {
          "feature": "AI-assisted creation",
          "toolA": "available",
          "toolB": "available",
          "note": "involve.me: conversational AI funnel builder; ScoreApp: AI scorecard & quiz generation"
        },
        {
          "feature": "Drag-and-drop editor",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "available",
          "note": "involve.me on the Scale plan; ScoreApp on the Pro plan"
        }
      ]
    },
    {
      "group": "Leads, CRM & Payments",
      "rows": [
        {
          "feature": "Native payment collection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in CRM",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ScoreApp relies on external CRM integrations instead"
        },
        {
          "feature": "CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "involve.me: 55+ integrations; ScoreApp: HubSpot, Salesforce, Keap, Insightly, Mailchimp, Kit"
        },
        {
          "feature": "Automated email follow-ups",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "involve.me $19/month vs. ScoreApp $39/month"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free plan for involve.me?",
      "answer": "Yes, involve.me offers a free plan with up to 50 submissions or 500 visits per month and no credit card required."
    },
    {
      "question": "Is ScoreApp free?",
      "answer": "Yes, a free plan offers 1 live scorecard and up to 10 responses per month."
    },
    {
      "question": "Can I collect payments through involve.me?",
      "answer": "Yes, native integrations with Stripe, PayPal, and Mollie let you collect payments directly in funnels."
    },
    {
      "question": "Does ScoreApp integrate with a CRM?",
      "answer": "Yes, direct integrations include HubSpot, Salesforce, Keap, Insightly, Mailchimp, and Kit."
    },
    {
      "question": "Is there a money-back guarantee with ScoreApp?",
      "answer": "Yes, ScoreApp offers a 14-day money-back guarantee."
    },
    {
      "question": "When was involve.me founded?",
      "answer": "involve.me was founded in 2019."
    }
  ]
};

export default involveMeVsScoreappContent;
