import type { GroupComparisonContent } from './types';

const filloutVsHeyflowVsOutgrowContent: GroupComparisonContent = {
  "verdict": "Fillout, Heyflow, and Outgrow all let non-developers build interactive lead-capture experiences, but the target differs. Fillout is the broadest general-purpose form, survey, and quiz builder with native database syncs and unlimited seats. Heyflow is purpose-built for multi-step ad-funnel lead generation with phone and OTP validation. Outgrow specializes in gamified interactive content, including quizzes, calculators, and chatbots, with built-in lead scoring aimed at demand-generation marketers.",
  "bestFor": {
    "fillout": "Teams needing a flexible, general-purpose form and survey builder with native Notion and Airtable sync and unlimited seats",
    "heyflow": "Performance marketers running paid campaigns who need multi-step lead funnels with phone and OTP validation",
    "outgrow": "Demand-generation marketers who want quizzes, calculators, and chatbots with built-in lead scoring to qualify leads automatically"
  },
  "highlights": [
    {
      "title": "Outgrow scores and qualifies leads automatically",
      "description": "Outgrow assigns point values to user answers so leads are automatically qualified and segmented, a lead scoring capability that is not documented for either Fillout or Heyflow.",
      "toolSlugs": [
        "outgrow"
      ]
    },
    {
      "title": "Fillout syncs natively with Notion and Airtable, on unlimited seats",
      "description": "Fillout's two-way Notion and Airtable sync updates records the instant a form is submitted, and every pricing tier, including free, includes unlimited team seats.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Heyflow validates leads for paid traffic",
      "description": "Heyflow's phone number validation and OTP verification filter out low-quality submissions, paired with native Meta and Google Ads integrations built for paid acquisition campaigns.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Outgrow spans the widest range of content types",
      "description": "Outgrow supports quizzes, calculators, assessments, polls, and chatbots, a broader interactive-content range than the form-and-quiz focus of Fillout or the funnel focus of Heyflow.",
      "toolSlugs": [
        "outgrow"
      ]
    },
    {
      "title": "Branding removal and advanced logic are paid-tier features on all three",
      "description": "Fillout, Heyflow, and Outgrow each reserve branding removal and their most advanced logic or integration features for mid-to-upper pricing tiers.",
      "toolSlugs": [
        "fillout",
        "heyflow",
        "outgrow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan cap",
          "statuses": {
            "fillout": "available",
            "heyflow": "limited",
            "outgrow": "limited"
          },
          "note": "Fillout: 1,000 responses/month. Heyflow: 10 responses/month. Outgrow's free tier is forms and surveys only, capped at 1,200 leads per year."
        },
        {
          "feature": "Unlimited seats included",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "outgrow": "unavailable"
          },
          "note": "Outgrow's plans cap users explicitly, from 1 user on Freelancer tiers up to 10 on Business."
        }
      ]
    },
    {
      "group": "Lead Intelligence",
      "rows": [
        {
          "feature": "Lead scoring",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "not-documented",
            "outgrow": "available"
          }
        },
        {
          "feature": "Conditional logic and branching",
          "statuses": {
            "fillout": "available",
            "heyflow": "available",
            "outgrow": "available"
          }
        }
      ]
    },
    {
      "group": "Marketing Integrations",
      "rows": [
        {
          "feature": "Native ad platform or CRM integrations",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "outgrow": "available"
          },
          "note": "Heyflow names Meta and Google Ads specifically; Outgrow documents connections to CRM, email marketing, and ad platforms generally."
        },
        {
          "feature": "Content type variety beyond forms",
          "statuses": {
            "fillout": "limited",
            "heyflow": "available",
            "outgrow": "available"
          },
          "note": "Fillout centers on forms, surveys, and quizzes; Heyflow adds calculators and product finders; Outgrow spans quizzes, calculators, assessments, polls, and chatbots."
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
            "outgrow": "not-documented"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "outgrow": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool automatically scores and qualifies leads?",
      "answer": "Outgrow, which assigns point values to user answers so leads are automatically qualified and segmented, a feature not documented for Fillout or Heyflow."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "Fillout, with 1,000 responses per month, versus Heyflow's 10 responses per month and Outgrow's free tier, which is limited to forms and surveys with up to 1,200 leads per year."
    },
    {
      "question": "Which is best for paid ad campaigns that need verified leads?",
      "answer": "Heyflow, due to its phone number validation, OTP verification, and native Meta and Google Ads integrations."
    },
    {
      "question": "Which supports the widest range of interactive content types?",
      "answer": "Outgrow, which spans quizzes, calculators, assessments, polls, and chatbots, beyond the form-and-quiz focus of Fillout or the funnel focus of Heyflow."
    },
    {
      "question": "Can I collect payments directly in any of these tools?",
      "answer": "Yes with Fillout, which has built-in payment collection and e-signature capture. This is not documented for Heyflow or Outgrow."
    },
    {
      "question": "Do any of the three include unlimited team seats?",
      "answer": "Only Fillout, whose pricing scales by response volume rather than seats, so every plan includes unlimited team members."
    }
  ]
};

export default filloutVsHeyflowVsOutgrowContent;
