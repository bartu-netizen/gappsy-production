import type { GroupComparisonContent } from './types';

const filloutVsHeyflowVsPaperformContent: GroupComparisonContent = {
  "verdict": "Fillout, Heyflow, and Paperform all let non-developers build forms without code, but they optimize for different jobs. Fillout leans on native two-way Notion and Airtable sync and unlimited seats at every price point, making it the natural pick for ops-minded teams that need a form wired directly into a database. Heyflow is built specifically for multi-step, conversion-optimized lead funnels with phone and OTP validation, favoring paid-acquisition marketers over general form builders. Paperform's document-style editor and built-in calculation engine make it the strongest choice when a form also needs to sell something, quote a price, or double as a landing page.",
  "bestFor": {
    "fillout": "Teams that want forms natively synced to Notion or Airtable without Zapier-style middleware, with unlimited seats even on the free plan.",
    "heyflow": "Performance marketing and growth teams running paid lead-generation campaigns that need multi-step, conversion-optimized funnels with lead-quality validation.",
    "paperform": "Small businesses, coaches, and agencies that want a form to double as a landing page, order form, or quote calculator with built-in payments."
  },
  "highlights": [
    {
      "title": "Native database sync without middleware",
      "description": "Fillout writes directly to Notion and Airtable the moment a form is submitted, avoiding the latency and extra cost of automation platforms that Heyflow and Paperform typically rely on for CRM-style syncing.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Funnels built for paid acquisition",
      "description": "Heyflow's conditional logic, phone and OTP verification, and native Meta and Google Ads integrations are purpose-built for filtering low-quality leads coming from paid campaigns, a use case the other two tools do not target directly.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Forms that double as sellable pages",
      "description": "Paperform's document-style editor and Excel-like calculation engine let a single form act as a landing page, product page, and quote generator, backed by five payment gateways on every paid plan.",
      "toolSlugs": [
        "paperform"
      ]
    },
    {
      "title": "Free tier generosity varies widely",
      "description": "Fillout's free plan allows 1,000 monthly responses with unlimited seats and forms, far more room than Heyflow's 10-response free cap or Paperform's 30-submission limit, making Fillout the easiest to trial at real usage volumes.",
      "toolSlugs": [
        "fillout",
        "heyflow",
        "paperform"
      ]
    },
    {
      "title": "Unlimited seats versus per-user pricing",
      "description": "Fillout includes unlimited team seats on every tier, while Paperform caps users per plan (1 on Essentials, rising with each tier) and Heyflow's plans are priced around response volume rather than seats.",
      "toolSlugs": [
        "fillout",
        "paperform"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Plans and Access",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "fillout": "available",
            "heyflow": "limited",
            "paperform": "limited"
          },
          "note": "Fillout allows 1,000 responses/month free; Heyflow caps free use at 10 responses/month and Paperform at 30 submissions/month."
        },
        {
          "feature": "Unlimited seats on paid tiers",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "paperform": "unavailable"
          },
          "note": "Paperform's plans cap named users per tier (1 to 5+), while Fillout includes unlimited seats at every price point."
        }
      ]
    },
    {
      "group": "Form Building and Data",
      "rows": [
        {
          "feature": "Native two-way Notion or Airtable sync",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "paperform": "not-documented"
          }
        },
        {
          "feature": "Conditional branching logic",
          "statuses": {
            "fillout": "available",
            "heyflow": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Custom domain hosting",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "paperform": "available"
          },
          "note": "Fillout requires its Business plan; Paperform requires its Business tier and above."
        }
      ]
    },
    {
      "group": "Monetization and Lead Quality",
      "rows": [
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "fillout": "available",
            "heyflow": "not-documented",
            "paperform": "available"
          },
          "note": "Paperform supports five payment gateways on all paid plans."
        },
        {
          "feature": "Calculation or quoting engine",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Phone or OTP lead validation",
          "statuses": {
            "fillout": "not-documented",
            "heyflow": "available",
            "paperform": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Fillout, Heyflow, and Paperform is cheapest to start with?",
      "answer": "Fillout has the most generous free plan, offering 1,000 monthly responses with unlimited forms and seats at no cost. Paperform's free plan is capped at 30 submissions per month, and Heyflow's free plan allows only 10 responses per month before an upgrade is needed."
    },
    {
      "question": "Which tool is best for syncing forms to Notion or Airtable?",
      "answer": "Fillout is built around native, two-way sync with Notion and Airtable, updating records directly without Zapier or webhooks. Heyflow and Paperform rely on standard integrations rather than a native two-way database connection."
    },
    {
      "question": "Which is best for paid ad lead-generation funnels?",
      "answer": "Heyflow is purpose-built for this use case, with multi-step conversion funnels, phone and OTP verification to filter fake leads, and native Meta and Google Ads integrations for tracking ad performance."
    },
    {
      "question": "Can any of these tools collect payments directly in the form?",
      "answer": "Paperform supports five payment gateways, including Stripe and PayPal, on all paid plans. Fillout also supports payment collection as a built-in feature. Heyflow's provided feature set does not document native payment collection."
    },
    {
      "question": "Do all three offer a free plan?",
      "answer": "Yes. Fillout's free plan allows 1,000 responses per month, Heyflow's allows 10 responses per month, and Paperform's allows 30 submissions per month, all with no credit card required to start."
    },
    {
      "question": "Which tool is best for a form that also needs to act as a landing or product page?",
      "answer": "Paperform's document-style editor is designed for this, letting users combine text, media, and payment blocks inline so the form itself can function as a full page rather than a simple field list."
    }
  ]
};

export default filloutVsHeyflowVsPaperformContent;
