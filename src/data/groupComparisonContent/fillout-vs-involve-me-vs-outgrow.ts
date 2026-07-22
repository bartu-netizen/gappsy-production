import type { GroupComparisonContent } from './types';

const filloutVsInvolveMeVsOutgrowContent: GroupComparisonContent = {
  "verdict": "Fillout, involve.me, and Outgrow all fall under the no-code forms category, but they are built for different jobs. Fillout is a broad, general-purpose form and survey builder distinguished by native two-way sync to Notion and Airtable and unlimited seats on every tier, while involve.me and Outgrow are closer to each other, both centered on multi-step quizzes, calculators, and interactive funnels for marketing lead generation. Outgrow leans hardest into lead scoring for qualification, and involve.me counters with a larger template library and a more generous entry-level free plan.",
  "bestFor": {
    "fillout": "Teams that want a single form builder wired directly into Notion or Airtable without Zapier-style middleware",
    "involve-me": "Marketing teams and agencies that want a large template library of quizzes and calculators alongside an accessible free tier",
    "outgrow": "Demand-generation and growth marketing teams that need built-in lead scoring to qualify prospects as they complete interactive content"
  },
  "highlights": [
    {
      "title": "Native two-way database sync",
      "description": "Fillout creates or updates records directly in Notion or Airtable the instant a form is submitted, without relying on Zapier or webhooks.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Unlimited seats on every tier",
      "description": "Every Fillout plan, including the free one, includes unlimited team seats and unlimited forms, removing the per-seat cost common elsewhere in the category.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Built-in lead scoring",
      "description": "Outgrow assigns point values to answers so leads are automatically qualified and segmented as they complete a quiz or calculator.",
      "toolSlugs": [
        "outgrow"
      ]
    },
    {
      "title": "Largest template library",
      "description": "involve.me ships with more than 300 pre-built templates for quizzes, ROI calculators, NPS surveys, and giveaway forms.",
      "toolSlugs": [
        "involve-me"
      ]
    },
    {
      "title": "Broadest built-in feature set beyond forms",
      "description": "Fillout bundles payments, e-signatures, scheduling, and PDF generation directly into the form builder rather than requiring separate tools.",
      "toolSlugs": [
        "fillout"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building",
      "rows": [
        {
          "feature": "Conditional logic and branching",
          "statuses": {
            "fillout": "available",
            "involve-me": "available",
            "outgrow": "available"
          }
        },
        {
          "feature": "Native two-way database sync (no middleware)",
          "statuses": {
            "fillout": "available",
            "involve-me": "unavailable",
            "outgrow": "unavailable"
          }
        },
        {
          "feature": "Pre-built template library",
          "statuses": {
            "fillout": "not-documented",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "involve.me publishes 300-plus templates and Outgrow offers industry templates; Fillout does not document a comparable template library."
        }
      ]
    },
    {
      "group": "Lead Capture and Scoring",
      "rows": [
        {
          "feature": "Dedicated lead scoring for qualification",
          "statuses": {
            "fillout": "unavailable",
            "involve-me": "limited",
            "outgrow": "available"
          },
          "note": "involve.me supports scored quizzes but not a dedicated lead-scoring and segmentation engine like Outgrow's."
        },
        {
          "feature": "Payments and e-signature collection",
          "statuses": {
            "fillout": "available",
            "involve-me": "unavailable",
            "outgrow": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Team and Pricing Structure",
      "rows": [
        {
          "feature": "Unlimited seats on every paid tier",
          "statuses": {
            "fillout": "available",
            "involve-me": "not-documented",
            "outgrow": "not-documented"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "fillout": "not-documented",
            "involve-me": "available",
            "outgrow": "available"
          },
          "note": "involve.me includes A/B testing from the Scale plan up; Outgrow includes it as a core feature."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the best free plan?",
      "answer": "Fillout's free plan is the most generous, with 1,000 responses per month plus unlimited forms and seats, compared to involve.me's 50 submissions per month and Outgrow's 1,200 leads per year on its forms-only free tier."
    },
    {
      "question": "Which tool is best for teams already using Notion or Airtable?",
      "answer": "Fillout, because of its native two-way sync that creates or updates records in those tools without Zapier or other middleware."
    },
    {
      "question": "Which tool is best for qualifying leads automatically?",
      "answer": "Outgrow, which is built around a dedicated lead-scoring engine that segments prospects based on their answers to a quiz or calculator."
    },
    {
      "question": "Which has the largest ready-made template library?",
      "answer": "involve.me, which publishes more than 300 templates spanning quizzes, ROI calculators, NPS surveys, and giveaway forms."
    },
    {
      "question": "Do all three support conditional logic and branching?",
      "answer": "Yes, all three let a respondent's path change based on earlier answers, though the depth of that logic and how it's gated by plan differs across tools."
    },
    {
      "question": "Which has the cheapest entry-level paid plan?",
      "answer": "Outgrow's Freelancer Limited plan runs about $14 per month billed annually, just below Fillout's Starter at $15 per month, though Outgrow's cheapest tier covers fewer content types than Fillout's Starter plan."
    }
  ]
};

export default filloutVsInvolveMeVsOutgrowContent;
