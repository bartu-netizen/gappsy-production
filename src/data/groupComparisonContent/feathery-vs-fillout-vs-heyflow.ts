import type { GroupComparisonContent } from './types';

const featheryVsFilloutVsHeyflowContent: GroupComparisonContent = {
  "verdict": "Feathery, Fillout, and Heyflow all build forms, but for different jobs. Feathery is a developer-first, low-code platform with a React and JavaScript SDK and deep identity and payments integrations, increasingly focused on financial services intake; Fillout is a no-code builder distinguished by native two-way sync with Notion and Airtable and unlimited seats on every tier, including free; and Heyflow specializes in multi-step, ad-driven lead funnels with built-in phone and OTP validation for filtering fake leads. Teams building product or account-opening flows will lean toward Feathery, general-purpose no-code teams connected to Notion or Airtable will prefer Fillout, and performance marketers running paid lead-gen campaigns will get the most from Heyflow's funnel-specific tooling.",
  "bestFor": {
    "feathery": "Product and engineering teams that need pixel-perfect, embeddable forms with deep identity, payment, and compliance integrations for regulated workflows.",
    "fillout": "No-code teams that want unlimited seats on every plan and native two-way sync with Notion or Airtable without automation middleware.",
    "heyflow": "Performance marketers running paid lead-generation campaigns who need multi-step funnels with phone and OTP lead validation."
  },
  "highlights": [
    {
      "title": "Feathery targets developers and regulated industries",
      "description": "A React and JavaScript SDK plus native Plaid, Alloy, and LexisNexis identity checks make Feathery a fit for fintech and insurance intake flows.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Fillout gives every plan unlimited seats",
      "description": "Even Fillout's free tier includes unlimited forms and unlimited team seats, with pricing scaling only by monthly response volume.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Heyflow is purpose-built for paid lead-gen funnels",
      "description": "Phone and OTP verification plus native Meta and Google Ads integrations help Heyflow filter fake leads and track ad-to-funnel conversion.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Free tiers vary dramatically in generosity",
      "description": "Feathery allows 500 monthly submissions, Fillout allows 1,000 responses with unlimited forms, and Heyflow's free plan is capped at just 10 responses per month.",
      "toolSlugs": [
        "feathery",
        "fillout",
        "heyflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Access and Pricing",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "feathery": "available",
            "fillout": "available",
            "heyflow": "available"
          },
          "note": "Feathery allows 500 submissions/5 forms, Fillout 1,000 responses, Heyflow just 10 responses/month"
        },
        {
          "feature": "Unlimited seats on every plan",
          "statuses": {
            "feathery": "unavailable",
            "fillout": "available",
            "heyflow": "not-documented"
          },
          "note": "Feathery's free tier is limited to 1 seat"
        }
      ]
    },
    {
      "group": "Logic and Validation",
      "rows": [
        {
          "feature": "Developer SDK (React/JavaScript embed)",
          "statuses": {
            "feathery": "available",
            "fillout": "not-documented",
            "heyflow": "not-documented"
          }
        },
        {
          "feature": "Phone/OTP lead validation",
          "statuses": {
            "feathery": "not-documented",
            "fillout": "not-documented",
            "heyflow": "available"
          }
        },
        {
          "feature": "Native A/B testing",
          "statuses": {
            "feathery": "available",
            "fillout": "not-documented",
            "heyflow": "available"
          },
          "note": "Feathery from Growth, Heyflow from Scale"
        }
      ]
    },
    {
      "group": "Integrations and Branding",
      "rows": [
        {
          "feature": "Native two-way database sync (Notion/Airtable)",
          "statuses": {
            "feathery": "not-documented",
            "fillout": "available",
            "heyflow": "not-documented"
          }
        },
        {
          "feature": "Custom branding/white-label",
          "statuses": {
            "feathery": "available",
            "fillout": "available",
            "heyflow": "available"
          },
          "note": "All three gate full branding removal behind a paid tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three form builders is best for developers?",
      "answer": "Feathery, since it ships a React and JavaScript SDK for embedding forms directly into web and mobile applications with programmatic control over styling and logic, a capability Fillout and Heyflow do not document."
    },
    {
      "question": "Which tool syncs natively with Notion or Airtable?",
      "answer": "Fillout is the only one of the three with documented native, two-way sync to Notion and Airtable that creates or updates records without Zapier or webhooks."
    },
    {
      "question": "Which tool is built specifically for lead-generation funnels?",
      "answer": "Heyflow, which is designed around multi-step, ad-driven lead funnels with phone number and OTP verification to filter out fake submissions, plus native Meta and Google Ads integrations."
    },
    {
      "question": "Do all three offer a free plan?",
      "answer": "Yes, though the limits differ significantly: Feathery's free plan allows 500 monthly submissions and 5 live forms, Fillout's free plan allows 1,000 responses with unlimited forms and seats, and Heyflow's free plan is capped at just 10 responses per month."
    },
    {
      "question": "Which tool has unlimited seats on every pricing tier?",
      "answer": "Fillout, whose free, Starter, Pro, and Business plans all include unlimited team seats and unlimited forms, with pricing scaling only by monthly response volume."
    }
  ]
};

export default featheryVsFilloutVsHeyflowContent;
