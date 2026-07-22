import type { GroupComparisonContent } from './types';

const filloutVsHeyflowVsInvolveMeContent: GroupComparisonContent = {
  "verdict": "Fillout, Heyflow, and involve.me are all no-code builders for interactive lead-capture experiences, but they specialize differently. Fillout is the broadest general-purpose form, survey, and quiz builder with native database syncs and unlimited seats on every plan. Heyflow is purpose-built for multi-step, ad-funnel lead generation with validation tools baked in. involve.me focuses on quizzes, calculators, and surveys built from a large template library, positioned as an interactive-funnel alternative to plain forms.",
  "bestFor": {
    "fillout": "Teams that want a flexible, general-purpose form and survey builder with native Notion and Airtable sync and unlimited seats",
    "heyflow": "Performance marketers running paid ad campaigns who need multi-step lead funnels with phone and OTP validation",
    "involve-me": "Teams building interactive quizzes, calculators, and surveys as lead-gen funnels using a large template library"
  },
  "highlights": [
    {
      "title": "Fillout offers unlimited seats on every plan, including free",
      "description": "Fillout's pricing scales only by monthly response volume, with unlimited team seats and unlimited forms on every tier, unlike Heyflow and involve.me, which cap users on lower plans.",
      "toolSlugs": [
        "fillout",
        "heyflow",
        "involve-me"
      ]
    },
    {
      "title": "Fillout syncs natively with Notion and Airtable",
      "description": "Fillout's two-way integration creates or updates Notion and Airtable records the instant a form is submitted, without needing Zapier or webhooks, a workflow neither Heyflow nor involve.me documents.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Heyflow validates leads before they hit your CRM",
      "description": "Heyflow includes phone number validation and OTP verification to filter out fake or low-quality submissions, plus native Meta and Google Ads integrations for tracking ad-to-funnel conversion.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "involve.me leads on templates and compliance",
      "description": "involve.me ships with 300-plus templates for quizzes, calculators, and surveys, and runs on SOC 2 Type II and GDPR-compliant infrastructure, appealing to larger, compliance-conscious teams.",
      "toolSlugs": [
        "involve-me"
      ]
    },
    {
      "title": "Free plan response caps vary widely",
      "description": "Fillout's free plan allows 1,000 responses per month, far more than Heyflow's 10 responses per month or involve.me's 50 submissions per month.",
      "toolSlugs": [
        "fillout",
        "heyflow",
        "involve-me"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan response cap",
          "statuses": {
            "fillout": "available",
            "heyflow": "limited",
            "involve-me": "limited"
          },
          "note": "Fillout: 1,000 responses/month. Heyflow: 10 responses/month. involve.me: 50 submissions/month."
        },
        {
          "feature": "Unlimited seats included",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "involve-me": "limited"
          },
          "note": "involve.me caps users per plan, from 1 seat on Start up to 5 on Scale."
        }
      ]
    },
    {
      "group": "Logic and Personalization",
      "rows": [
        {
          "feature": "Conditional logic and branching",
          "statuses": {
            "fillout": "available",
            "heyflow": "available",
            "involve-me": "available"
          }
        },
        {
          "feature": "Lead validation (phone/OTP)",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "involve-me": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Marketing and Integrations",
      "rows": [
        {
          "feature": "Native ad platform integrations",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "involve-me": "not-documented"
          }
        },
        {
          "feature": "Template library depth",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "involve-me": "available"
          },
          "note": "involve.me documents 300-plus templates; Heyflow offers conversion-optimized templates without a stated count."
        }
      ]
    },
    {
      "group": "Advanced Tools",
      "rows": [
        {
          "feature": "Built-in payments and e-signatures",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "involve-me": "not-documented"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "involve-me": "available"
          },
          "note": "Gated to the top-tier plans on both Heyflow and involve.me."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Fillout, Heyflow, and involve.me has the most generous free plan?",
      "answer": "Fillout, with 1,000 responses per month, compared to Heyflow's 10 responses per month and involve.me's 50 submissions per month."
    },
    {
      "question": "Which tool is built specifically for paid ad lead funnels?",
      "answer": "Heyflow, thanks to its phone and OTP lead validation and native Meta and Google Ads integrations for tracking ad-to-funnel conversion."
    },
    {
      "question": "Can I collect payments or signatures directly in the form?",
      "answer": "Yes, with Fillout, which has built-in payment collection and e-signature capture. This is not documented for Heyflow or involve.me."
    },
    {
      "question": "Which of these gives every team member a seat without extra cost?",
      "answer": "Fillout, which includes unlimited seats on every plan, including its free tier."
    },
    {
      "question": "Which has the largest built-in template library?",
      "answer": "involve.me, which documents more than 300 templates for quizzes, calculators, surveys, and giveaways."
    }
  ]
};

export default filloutVsHeyflowVsInvolveMeContent;
