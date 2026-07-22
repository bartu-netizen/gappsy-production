import type { ToolComparisonContent } from './types';

const carepatronVsHalaxyContent: ToolComparisonContent = {
  "verdict": "Carepatron is a globally positioned practice management and EHR platform (100,000+ clinicians across 120+ countries) with a free plan and flat monthly paid tiers up to $39/month. Halaxy's core practice management platform is entirely free with unlimited use, but it is built around Australian funding bodies (Medicare, DVA, NDIS) and monetizes through per-credit add-ons like SMS, e-scripts, and AI Scribe. The decision largely comes down to region: Halaxy's free-forever model suits Australian practitioners needing rebate processing, while Carepatron's flat pricing and broader country coverage suit practitioners anywhere else.",
  "bestForToolA": "Carepatron fits health practitioners outside Australia, or those wanting flat predictable monthly pricing ($31-$39/month) and AI scribe included free on every plan rather than billed per credit.",
  "bestForToolB": "Halaxy fits Australian health practitioners who need free, unlimited core practice management plus built-in Medicare, DVA, and NDIS rebate processing, and who are comfortable with pay-as-you-go credits for add-ons like SMS and e-scripts.",
  "whoNeedsBoth": "There's no realistic scenario for using both together since they compete directly as practice management/EHR systems for the same practitioner; a practice would select one as its system of record for scheduling, records, and billing.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Carepatron's free plan is entirely free with flat monthly pricing on paid tiers (Plus $31/month, Advanced $39/month).",
      "toolB": "Halaxy's core platform (scheduling, patient records, invoicing, reporting) is free forever with unlimited use, but add-ons like SMS, rebates, e-scripts, and AI Scribe are billed per credit at roughly AUD $0.15-$0.22 each.",
      "whyItMatters": "A practice's total cost depends heavily on how much it relies on add-on features, since Halaxy's model can grow with usage while Carepatron's paid tiers are flat.",
      "benefitsWho": "Practices with heavy add-on usage (SMS reminders, e-scripts) may prefer Carepatron's flat pricing for predictability, while low-add-on practices benefit from Halaxy's free core."
    },
    {
      "title": "Regional Focus",
      "toolA": "Carepatron reports serving 100,000+ clinicians in 120+ countries across 24 languages, without documenting region-specific rebate processing.",
      "toolB": "Halaxy is built around Australian funding bodies, explicitly processing Medicare, DVA, and NDIS rebates.",
      "whyItMatters": "Practitioners billing Australian government funding schemes need software with native rebate processing.",
      "benefitsWho": "Australian practitioners benefit from Halaxy's built-in Medicare/DVA/NDIS support; practitioners in other countries benefit from Carepatron's broader documented international reach."
    },
    {
      "title": "Clinical Tools and Templates",
      "toolA": "Carepatron's documented features don't quantify a specific clinical tools/templates library.",
      "toolB": "Halaxy documents over 700 clinical tools and templates included free as part of its core platform.",
      "whyItMatters": "Practitioners wanting ready-made clinical templates benefit from a quantified, included library.",
      "benefitsWho": "Practitioners wanting extensive built-in clinical templates benefit from Halaxy's documented 700+ tool library."
    },
    {
      "title": "Payment Processing Costs",
      "toolA": "Carepatron's payment processing fee structure is not documented in the available facts.",
      "toolB": "Halaxy explicitly documents a payment processing fee of 1.5%-1.9% plus a flat fee per transaction.",
      "whyItMatters": "Practices processing many patient payments need clarity on transaction fees to estimate true cost.",
      "benefitsWho": "Practices wanting upfront transparency on payment fees can rely on Halaxy's documented rates; Carepatron's aren't specified in these facts."
    },
    {
      "title": "API and White-Label Access",
      "toolA": "Carepatron's Advanced plan ($39/month) includes white labeling but doesn't separately document API access.",
      "toolB": "Halaxy gates both API access and white-label branding behind a paid Subscription tier starting at 25 credits/month.",
      "whyItMatters": "Practices wanting to integrate Halaxy or Carepatron programmatically need to know whether API access is available and at what cost.",
      "benefitsWho": "Developer-supported practices building custom integrations benefit from Halaxy's documented (paid) API access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier Depth",
      "rows": [
        {
          "feature": "Unlimited clients/patients on free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Unlimited practitioners/locations on free tier",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted clinical notes on free tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Carepatron: included free; Halaxy: AI Scribe billed per credit"
        }
      ]
    },
    {
      "group": "Billing & Rebates",
      "rows": [
        {
          "feature": "Funding body rebate processing (Medicare/DVA/NDIS)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Clinical invoicing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Documented payment processing fee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Halaxy: 1.5%-1.9% + flat fee"
        }
      ]
    },
    {
      "group": "Practice & Compliance",
      "rows": [
        {
          "feature": "White-label branding",
          "toolA": "available",
          "toolB": "available",
          "note": "Carepatron: Advanced plan, $39/mo; Halaxy: Subscription tier, from 25 credits/mo"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Halaxy: paid Subscription tier"
        },
        {
          "feature": "Named compliance certifications",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Carepatron: HIPAA, SOC 2, PIPEDA, GDPR"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Halaxy really free to use?",
      "answer": "Yes, Halaxy's core platform, including scheduling, patient records, invoicing, and reporting, is free with no credit card required. Add-ons like SMS, rebates, e-scripts, and AI Scribe are billed per credit."
    },
    {
      "question": "How does Halaxy's credit-based pricing work?",
      "answer": "Optional features are billed on a pay-as-you-go basis at roughly AUD $0.15-$0.22 per credit, and a paid Subscription tier starting at 25 credits/month unlocks white-label branding and API access."
    },
    {
      "question": "Does Carepatron support Australian Medicare/DVA/NDIS rebates?",
      "answer": "This is not documented in Carepatron's available features; Halaxy explicitly processes Medicare, DVA, and NDIS rebates."
    },
    {
      "question": "Which has more free AI features?",
      "answer": "Carepatron includes its AI scribe & note taker free on every plan, including the free tier. Halaxy's AI Scribe is billed per credit rather than included free."
    },
    {
      "question": "Do both charge for payment processing?",
      "answer": "Halaxy documents a fee of 1.5%-1.9% plus a flat fee per transaction. Carepatron's payment processing fee structure isn't documented in the available facts."
    },
    {
      "question": "Which is better suited for practitioners outside Australia?",
      "answer": "Carepatron reports broader international reach (100,000+ clinicians in 120+ countries), while Halaxy's rebate features are specifically built around Australian funding bodies."
    }
  ]
};

export default carepatronVsHalaxyContent;
