import type { ToolComparisonContent } from './types';

const heyflowVsOutgrowContent: ToolComparisonContent = {
  "verdict": "Heyflow is a paid-only, no-code funnel builder built around native server-side ad tracking (Meta, TikTok, Google, LinkedIn, Bing), phone-level lead validation, and in-flow payments and booking — starting at $45/month with no free plan. Outgrow is a freemium platform spanning quizzes, calculators, chatbots, and assessments with 1000+ templates, starting free and scaling through published tiers from $14/month. The tradeoff is tracking/conversion depth versus content-type breadth and pricing transparency.",
  "bestForToolA": "Performance marketers running paid campaigns who need native server-side conversion tracking across major ad platforms and want to collect Stripe payments, e-signatures, or bookings inside the same funnel.",
  "bestForToolB": "Teams that want to start free and build a wide range of interactive content — quizzes, calculators, chatbots, assessments — from a large template library, scaling through clearly published monthly tiers.",
  "whoNeedsBoth": "An agency running paid-ad lead-gen funnels for clients may use Heyflow for tracking-heavy ad campaigns while using Outgrow to build calculators and assessments for organic and content-marketing lead generation.",
  "keyDifferences": [
    {
      "title": "Native ad tracking",
      "toolA": "Built-in server-side tracking for Meta CAPI, TikTok, Google Ads, LinkedIn, and Bing.",
      "toolB": "Not documented — no ad-platform tracking integrations are mentioned.",
      "whyItMatters": "Paid-media teams need accurate conversion tracking as browser-side tracking degrades; only Heyflow addresses this directly.",
      "benefitsWho": "Performance marketing and growth teams running paid acquisition."
    },
    {
      "title": "Phone-level lead validation",
      "toolA": "HLR and SMS OTP verification of phone numbers submitted through a flow.",
      "toolB": "Not documented.",
      "whyItMatters": "Businesses paying for leads by volume need to filter out invalid phone numbers before they're billed or routed to sales.",
      "benefitsWho": "Lead-gen businesses in verticals like insurance, home services, or finance."
    },
    {
      "title": "Free plan availability",
      "toolA": "No free plan — pricing_model is Paid, starting at $45/month (a free test is mentioned but no ongoing free tier).",
      "toolB": "Free Forms/Surveys tier with 100 leads/month and 4 content pieces, no credit card required.",
      "whyItMatters": "Teams wanting to trial the product without payment can only do so on Outgrow.",
      "benefitsWho": "Budget-constrained teams and solo marketers evaluating tools before committing spend."
    },
    {
      "title": "Content-type breadth",
      "toolA": "Focused on interactive multi-step funnels and lead-gen forms.",
      "toolB": "Supports quizzes, calculators, chatbots, surveys, polls, forms, and assessments across 1000+ templates.",
      "whyItMatters": "Teams needing a wide range of interactive content formats beyond lead-gen funnels get more variety from Outgrow.",
      "benefitsWho": "Content marketing teams building varied interactive experiences."
    },
    {
      "title": "In-flow payments and booking",
      "toolA": "Collects Stripe payments, e-signatures, and Calendly-style appointment bookings without leaving the funnel.",
      "toolB": "Native integrations connect to payment platforms, but in-flow e-signatures and booking aren't described.",
      "whyItMatters": "Businesses that want to close a transaction (payment, signed agreement, booked call) in one flow need Heyflow's combined feature set.",
      "benefitsWho": "Sales-led businesses converting leads directly into paid or booked outcomes."
    }
  ],
  "featureMatrix": [
    {
      "group": "Funnel & Content Building",
      "rows": [
        {
          "feature": "No-code builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Template library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Outgrow offers 1000+ templates"
        },
        {
          "feature": "Content type variety (quizzes/calculators/chatbots)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Heyflow is focused on funnels/forms rather than the broader content types Outgrow supports"
        },
        {
          "feature": "Branching / conditional logic",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Lead Gen & Tracking",
      "rows": [
        {
          "feature": "Native server-side ad tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Phone-level lead validation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "In-flow payments & e-signatures",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Outgrow's native integrations connect to payment platforms but don't describe in-flow e-signatures/booking"
        },
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Heyflow: free test per FAQ; Outgrow: 7-day Business trial, no credit card"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Heyflow have a free plan?",
      "answer": "There's no ongoing free plan; a free test is available and paid plans start from $45/month."
    },
    {
      "question": "Does Outgrow have a free plan?",
      "answer": "Yes, the Forms/Surveys tier is free with 100 leads/month and 4 content pieces."
    },
    {
      "question": "Does Heyflow support ad tracking?",
      "answer": "Yes, native server-side tracking for Meta CAPI, TikTok, Google Ads, LinkedIn, and Bing."
    },
    {
      "question": "Can Heyflow collect payments?",
      "answer": "Yes, Heyflow supports Stripe payments, e-signatures, and appointment booking directly within a funnel."
    },
    {
      "question": "Where is Outgrow based?",
      "answer": "Outgrow lists its headquarters in Florida, USA."
    },
    {
      "question": "Is there a free trial for Outgrow?",
      "answer": "Yes, a 7-day trial of the Business plan is offered without requiring a credit card."
    }
  ]
};

export default heyflowVsOutgrowContent;
