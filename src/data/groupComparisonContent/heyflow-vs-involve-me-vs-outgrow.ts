import type { GroupComparisonContent } from './types';

const heyflowVsInvolveMeVsOutgrowContent: GroupComparisonContent = {
  "verdict": "Heyflow, involve.me, and Outgrow all build interactive, multi-step lead-generation funnels rather than plain single-page forms, making them a natural three-way comparison for marketing teams. Heyflow stands apart with built-in phone and OTP lead validation and native Meta and Google Ads integrations aimed at paid acquisition teams, involve.me leans on a large template library and email automation for budget-conscious marketers, and Outgrow differentiates through formula-based calculators and dedicated lead scoring for qualification.",
  "bestFor": {
    "heyflow": "Paid acquisition and performance marketing teams that need phone and OTP lead validation plus native Meta and Google Ads tracking",
    "involve-me": "Budget-conscious marketing teams that want a large template library and built-in email automation without a big upfront cost",
    "outgrow": "Demand-generation teams that need calculator-style formula logic and lead scoring to qualify prospects"
  },
  "highlights": [
    {
      "title": "Lead-quality validation built in",
      "description": "Heyflow filters out fake or low-quality submissions with phone number validation and one-time-passcode verification directly inside the funnel.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Native ad-platform integrations",
      "description": "Heyflow connects directly to Meta and Google Ads for improved ad-to-funnel conversion tracking, a capability neither competitor documents.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Largest template library",
      "description": "involve.me ships more than 300 templates covering quizzes, calculators, surveys, and giveaways.",
      "toolSlugs": [
        "involve-me"
      ]
    },
    {
      "title": "Formula-driven calculators and lead scoring",
      "description": "Outgrow's calculator logic is built from formulas and variables, paired with a dedicated lead-scoring engine to qualify prospects.",
      "toolSlugs": [
        "outgrow"
      ]
    },
    {
      "title": "Email automation baked into the funnel",
      "description": "involve.me can trigger a nurture email sequence the moment a visitor completes a funnel, without a separate automation tool.",
      "toolSlugs": [
        "involve-me"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Lead Generation and Personalization",
      "rows": [
        {
          "feature": "Conditional logic and branching",
          "statuses": {
            "heyflow": "available",
            "involve-me": "available",
            "outgrow": "available"
          }
        },
        {
          "feature": "Phone number or OTP lead validation",
          "statuses": {
            "heyflow": "available",
            "involve-me": "unavailable",
            "outgrow": "unavailable"
          }
        },
        {
          "feature": "Dedicated lead scoring for qualification",
          "statuses": {
            "heyflow": "not-documented",
            "involve-me": "limited",
            "outgrow": "available"
          },
          "note": "involve.me supports scored quizzes but not a dedicated scoring and segmentation engine like Outgrow's."
        }
      ]
    },
    {
      "group": "Marketing and Ads",
      "rows": [
        {
          "feature": "Native Meta or Google Ads integration",
          "statuses": {
            "heyflow": "available",
            "involve-me": "not-documented",
            "outgrow": "not-documented"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "heyflow": "available",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "Heyflow includes A/B testing from its Scale plan up; involve.me from its Scale plan up; Outgrow includes it as a core feature."
        }
      ]
    },
    {
      "group": "Content and Templates",
      "rows": [
        {
          "feature": "Pre-built template library",
          "statuses": {
            "heyflow": "available",
            "involve-me": "available",
            "outgrow": "available"
          }
        },
        {
          "feature": "Formula or variable-based calculators",
          "statuses": {
            "heyflow": "available",
            "involve-me": "available",
            "outgrow": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best suited for paid ad campaigns?",
      "answer": "Heyflow, because of its native Meta and Google Ads integrations and built-in phone and OTP lead validation, both aimed at improving lead quality for paid acquisition."
    },
    {
      "question": "Which tool filters out fake or low-quality leads most effectively?",
      "answer": "Heyflow, through its phone number validation and one-time-passcode verification steps built directly into the funnel builder."
    },
    {
      "question": "Which has the biggest template library?",
      "answer": "involve.me, with more than 300 pre-built templates for quizzes, calculators, surveys, and giveaways."
    },
    {
      "question": "Which is the most affordable to start with?",
      "answer": "involve.me's entry paid plan starts at $19 per month billed annually versus Heyflow's $22 per month, though Heyflow's free plan and involve.me's free plan cap monthly responses differently, at 10 and 50 respectively."
    },
    {
      "question": "Do all three support lead scoring?",
      "answer": "Outgrow has a dedicated lead-scoring engine, involve.me supports scored quizzes without a full qualification system, and Heyflow does not document a comparable scoring feature, focusing instead on validating lead quality at submission time."
    },
    {
      "question": "Which is best for European or GDPR-focused marketing teams?",
      "answer": "Heyflow, which is based in Hamburg, Germany and markets itself specifically toward GDPR-conscious DACH and European buyers."
    }
  ]
};

export default heyflowVsInvolveMeVsOutgrowContent;
