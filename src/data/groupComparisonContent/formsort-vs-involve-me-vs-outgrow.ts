import type { GroupComparisonContent } from './types';

const formsortVsInvolveMeVsOutgrowContent: GroupComparisonContent = {
  "verdict": "Formsort, involve.me, and Outgrow all build multi-step, logic-driven forms, but they serve different buyers. Formsort is a low-code platform purpose-built for long, branching eligibility and intake flows in healthcare, fintech, and other regulated industries, complete with a HIPAA-compliant Enterprise tier, while involve.me and Outgrow are no-code marketing tools aimed at turning website visitors into qualified leads through quizzes, calculators, and scored surveys. Between the two marketing-focused tools, involve.me leans on a large template library and a more generous free tier, while Outgrow differentiates on formula-driven calculator logic and lead scoring aimed squarely at demand-generation teams. Teams building regulated, high-stakes qualification flows should look to Formsort; marketers building lead-gen quizzes and calculators will find involve.me or Outgrow a better fit.",
  "bestFor": {
    "formsort": "Healthcare, fintech, and other regulated teams that need HIPAA-compliant, low-code, multi-step eligibility and intake flows with real-time calculations.",
    "involve-me": "Marketing teams and agencies that want a large template library and a generous free tier for building quiz- and calculator-driven lead funnels.",
    "outgrow": "Demand-generation and growth marketers who want formula-driven calculators and built-in lead scoring to qualify leads before they reach a CRM."
  },
  "highlights": [
    {
      "title": "Formsort is built for regulated, branching eligibility flows",
      "description": "A HIPAA-compliant Enterprise tier and real-time calculation engine make Formsort a fit for healthcare and fintech qualification screens.",
      "toolSlugs": [
        "formsort"
      ]
    },
    {
      "title": "involve.me pairs a large template library with a generous free tier",
      "description": "Over 300 templates and a free plan supporting 2 live funnels give marketers a fast start before paying.",
      "toolSlugs": [
        "involve-me"
      ]
    },
    {
      "title": "Outgrow focuses on lead scoring and calculator logic",
      "description": "Point-based lead scoring and formula-driven calculators help demand-generation teams qualify leads before they reach a CRM.",
      "toolSlugs": [
        "outgrow"
      ]
    },
    {
      "title": "All three support conditional branching logic",
      "description": "Formsort, involve.me, and Outgrow each let the questions or outcomes a respondent sees change based on earlier answers.",
      "toolSlugs": [
        "formsort",
        "involve-me",
        "outgrow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier and Compliance",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "formsort": "available",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "Formsort allows 100 flow starts/month, involve.me 2 funnels/50 submissions, Outgrow 1,200 leads/year for forms only"
        },
        {
          "feature": "HIPAA compliance",
          "statuses": {
            "formsort": "available",
            "involve-me": "unavailable",
            "outgrow": "unavailable"
          },
          "note": "Formsort's HIPAA option is available on its Enterprise plan"
        }
      ]
    },
    {
      "group": "Logic and Testing",
      "rows": [
        {
          "feature": "Conditional/branching logic",
          "statuses": {
            "formsort": "available",
            "involve-me": "available",
            "outgrow": "available"
          }
        },
        {
          "feature": "Real-time calculations",
          "statuses": {
            "formsort": "available",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "Formsort computes eligibility/cost values mid-flow; involve.me and Outgrow offer pricing and formula-driven calculators"
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "formsort": "available",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "Formsort from Pro, involve.me from Scale"
        }
      ]
    },
    {
      "group": "Lead and Payment Tools",
      "rows": [
        {
          "feature": "Lead scoring",
          "statuses": {
            "formsort": "not-documented",
            "involve-me": "not-documented",
            "outgrow": "available"
          }
        },
        {
          "feature": "Native Stripe payments",
          "statuses": {
            "formsort": "available",
            "involve-me": "not-documented",
            "outgrow": "not-documented"
          },
          "note": "Formsort's Stripe collection is available from the Pro plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three form builders is HIPAA-compliant?",
      "answer": "Formsort is the only one with a documented HIPAA-compliant option, available on its Enterprise plan for healthcare, insurance, and other regulated intake flows."
    },
    {
      "question": "Is Formsort a good fit for a marketing quiz or lead magnet?",
      "answer": "It can build one, but Formsort is purpose-built for complex, multi-step branching flows like eligibility screening rather than the marketing-first templates and lead scoring that involve.me and Outgrow are optimized for."
    },
    {
      "question": "Which tool has the largest template library?",
      "answer": "involve.me, with more than 300 pre-built templates covering quizzes, ROI calculators, NPS surveys, and giveaways."
    },
    {
      "question": "Which tool includes lead scoring out of the box?",
      "answer": "Outgrow, which assigns point values to answers so leads can be automatically qualified and segmented before reaching a CRM; this is not a documented feature of Formsort or involve.me."
    },
    {
      "question": "How do the free plans compare across all three?",
      "answer": "Formsort's free plan allows up to 100 flow starts per month, involve.me's free plan allows 2 live funnels with 50 monthly submissions, and Outgrow's free plan is limited to forms and surveys only, capped at 1,200 leads per year."
    }
  ]
};

export default formsortVsInvolveMeVsOutgrowContent;
