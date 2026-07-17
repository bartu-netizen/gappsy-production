import type { ToolComparisonContent } from './types';

const formbricksVsFormsortContent: ToolComparisonContent = {
  "verdict": "Formbricks is an open-source, self-hostable survey and experience-management platform with AI labeling/translation, entering paid tiers at $74/month. Formsort is a low-code, multi-step form builder aimed at product teams — with built-in A/B testing, data warehouse integrations, and HIPAA compliance for healthcare intake — entering paid tiers at a steeper $279/month. They solve different problems: feedback collection versus structured, conversion-optimized form flows.",
  "bestForToolA": "Teams that want an open-source, self-hostable survey platform for multi-channel feedback (web, email, in-app) with AI-assisted labeling and translation, at a lower paid entry price.",
  "bestForToolB": "Product teams building multi-step, data-driven forms — especially healthcare intake requiring HIPAA and a BAA — that need built-in A/B testing and integrations with BigQuery, Redshift, Postgres, Salesforce, Segment, or Amplitude.",
  "whoNeedsBoth": "A healthcare or fintech product organization might run Formsort for regulated, HIPAA-eligible intake and onboarding flows while using Formbricks separately to collect NPS and in-app feedback surveys from existing customers.",
  "keyDifferences": [
    {
      "title": "Open source and self-hosting",
      "toolA": "Fully open source with source code on GitHub and a self-hosting option instead of the cloud service.",
      "toolB": "Not documented — no mention of open source or self-hosting.",
      "whyItMatters": "Teams with data residency or vendor lock-in concerns may require the ability to self-host.",
      "benefitsWho": "Engineering-led teams and companies with strict data governance requirements."
    },
    {
      "title": "HIPAA compliance",
      "toolA": "Not documented — no HIPAA mention in the facts.",
      "toolB": "HIPAA compliance with a signed BAA available (Enterprise plan).",
      "whyItMatters": "Healthcare intake workflows legally require HIPAA-eligible tooling, which only Formsort offers here.",
      "benefitsWho": "Healthcare and insurance product teams collecting patient information."
    },
    {
      "title": "AI capabilities",
      "toolA": "AI-based feedback labeling and AI translations, available on Scale/Pro plans.",
      "toolB": "Explicitly states no AI capabilities are mentioned on the site.",
      "whyItMatters": "Teams wanting automated categorization of open-text survey responses or multi-language support get that only from Formbricks.",
      "benefitsWho": "Global teams running multi-language surveys or high response volumes needing automated tagging."
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "Pro plan starts at $74/month.",
      "toolB": "Pro plan starts at $279/month.",
      "whyItMatters": "The price gap is substantial once free-tier volume is exceeded, affecting budget-conscious teams differently.",
      "benefitsWho": "Smaller teams and startups sensitive to software spend."
    },
    {
      "title": "Data warehouse and A/B testing integrations",
      "toolA": "Not documented — no data warehouse or A/B testing integrations listed.",
      "toolB": "Native integrations with BigQuery, Postgres, Redshift, Salesforce, Segment, Google Analytics, Optimizely, and Amplitude, plus built-in A/B testing.",
      "whyItMatters": "Product and growth teams optimizing conversion need direct pipelines into analytics and warehouse tools.",
      "benefitsWho": "Growth and data teams running conversion experiments on forms."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building Blocks",
      "rows": [
        {
          "feature": "Multi-step / conditional logic",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting / open source",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Integrations",
      "rows": [
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Formsort offers a BAA on its Enterprise plan"
        },
        {
          "feature": "SOC 2",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Data warehouse integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Formsort: BigQuery, Postgres, Redshift"
        },
        {
          "feature": "EHR integration",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI feedback labeling / translation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Formsort's facts state no AI capabilities are mentioned on the site"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Formbricks: 250 responses/month; Formsort: 100 flow starts/month"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Formbricks Pro $74/month vs. Formsort Pro $279/month"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Formbricks' highest published tier is Scale ($325/mo); Formsort has a separate quote-based Enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Formbricks open source?",
      "answer": "Yes, Formbricks is fully open source with code available on GitHub, and it can be self-hosted."
    },
    {
      "question": "Does Formsort have a free plan?",
      "answer": "Yes, the Free plan supports unlimited users and forms with 100 flow starts/month, though it includes Formsort branding."
    },
    {
      "question": "Is Formsort HIPAA compliant?",
      "answer": "Yes, Formsort's Enterprise plan includes HIPAA compliance with a BAA."
    },
    {
      "question": "Does Formbricks offer AI features?",
      "answer": "Yes, the Pro plan includes AI translations and the Scale plan adds AI feedback labeling."
    },
    {
      "question": "What integrations does Formsort support?",
      "answer": "BigQuery, PostgreSQL, Redshift, Salesforce, Google Sheets, webhooks, Segment, Google Analytics, Optimizely, and Amplitude."
    },
    {
      "question": "How do Formbricks and Formsort compare on entry paid pricing?",
      "answer": "Formbricks Pro starts at $74/month, while Formsort Pro starts at $279/month."
    }
  ]
};

export default formbricksVsFormsortContent;
