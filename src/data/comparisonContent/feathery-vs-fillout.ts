import type { ToolComparisonContent } from './types';

const featheryVsFilloutContent: ToolComparisonContent = {
  "verdict": "Feathery is purpose-built for financial services workflows — document intelligence, e-signatures, and HIPAA compliance — but its Growth and Business tiers are entirely quote-based. Fillout is a general-purpose form/quiz/survey builder with published fixed pricing ($15/$40/$75/month) and no per-seat charges on any plan, but it doesn't offer Feathery's document intelligence or HIPAA compliance. The right fit depends on whether the use case is regulated financial workflows or general-purpose form building.",
  "bestForToolA": "Financial services companies — registered investment advisors, broker-dealers, banks, insurance carriers and brokers — that need document intelligence, e-signatures, and HIPAA-eligible compliance for client onboarding workflows.",
  "bestForToolB": "Teams that want a general-purpose form, quiz, or survey builder with transparent, fixed-price tiers and no per-seat charges, even as they add team members.",
  "whoNeedsBoth": "A fintech company might use Fillout for public-facing marketing surveys and lead-gen forms while using Feathery for regulated client onboarding, document intelligence, and e-signature workflows in its back office.",
  "keyDifferences": [
    {
      "title": "Industry focus",
      "toolA": "Positioned specifically for financial services — RIAs, broker-dealers, banks, insurance carriers and brokers.",
      "toolB": "General-purpose form, quiz, and survey builder with no stated industry focus.",
      "whyItMatters": "Feathery's feature set (document intelligence, HIPAA) is tailored to regulated workflows that Fillout doesn't target.",
      "benefitsWho": "Compliance and operations teams in regulated financial industries versus general marketing/ops teams."
    },
    {
      "title": "Document intelligence & e-signatures",
      "toolA": "Document Templates & eSignatures plus Document Intelligence extracting structured data at a stated 98%+ accuracy.",
      "toolB": "Not documented — Fillout's facts describe form/quiz/survey building, not document extraction or e-signatures.",
      "whyItMatters": "Workflows requiring signed documents and automated data extraction need Feathery's capabilities.",
      "benefitsWho": "Teams handling contracts, applications, or onboarding paperwork."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Growth and Business plans are custom, quote-based — no published prices beyond the free tier.",
      "toolB": "Starter ($15/mo), Pro ($40/mo), and Business ($75/mo) all have published fixed prices.",
      "whyItMatters": "Teams that need to budget without a sales call will find Fillout's pricing easier to evaluate upfront.",
      "benefitsWho": "Self-serve buyers and smaller teams without a procurement process."
    },
    {
      "title": "HIPAA compliance",
      "toolA": "Growth/Business plans include HIPAA and GDPR compliance.",
      "toolB": "Not documented — no HIPAA compliance is mentioned.",
      "whyItMatters": "Healthcare-adjacent financial workflows (e.g., insurance intake) may require HIPAA-eligible tooling.",
      "benefitsWho": "Insurance and healthcare-adjacent finance teams."
    },
    {
      "title": "Per-seat charges",
      "toolA": "Free plan includes unlimited seats; paid tier seat costs aren't detailed.",
      "toolB": "Explicitly states no per-seat charges on any plan.",
      "whyItMatters": "Growing teams want certainty that adding users won't increase cost.",
      "benefitsWho": "Teams anticipating headcount growth."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Building",
      "rows": [
        {
          "feature": "Conditional logic",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Drag-and-drop builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Feathery emphasizes pixel-perfect forms but doesn't use the term drag-and-drop"
        },
        {
          "feature": "Free plan forms",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Document Tools",
      "rows": [
        {
          "feature": "AI assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Feathery's Robin builds/deploys workflows from natural language; Fillout offers AI form/quiz/survey creation plus Google Forms import"
        },
        {
          "feature": "Document intelligence / eSignatures",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Meeting/audio intelligence",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Enterprise",
      "rows": [
        {
          "feature": "HIPAA compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Both gate SSO to a custom-quote tier"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Published fixed pricing on paid tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Feathery's Growth/Business are quote-based; Fillout publishes $15/$40/$75"
        },
        {
          "feature": "No per-seat charges",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free plan submission volume",
          "toolA": "available",
          "toolB": "available",
          "note": "Feathery: 500/month; Fillout: 1,000/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Feathery have a free plan?",
      "answer": "Yes, the Free plan includes unlimited questions, seats, pages, and conditions, with 500 monthly submissions and 5 live forms."
    },
    {
      "question": "Does Fillout have a free plan?",
      "answer": "Yes, Fillout's Free plan includes 1,000 responses/month with unlimited forms, seats, and questions."
    },
    {
      "question": "Is Feathery's paid pricing public?",
      "answer": "No, the Growth and Business plans require contacting sales for a custom quote."
    },
    {
      "question": "What is Fillout's starting paid price?",
      "answer": "The Starter plan is $15/month ($180/year billed annually) for 2,000 responses/month."
    },
    {
      "question": "Does Feathery support e-signatures?",
      "answer": "Yes, through its Document Templates & eSignatures feature."
    },
    {
      "question": "Does Fillout charge per seat?",
      "answer": "No, Fillout states there are no per-seat charges on any plan."
    }
  ]
};

export default featheryVsFilloutContent;
