import type { ToolComparisonContent } from './types';

const carepatronVsTheranestContent: ToolComparisonContent = {
  "verdict": "Carepatron is a broad practice management and EHR platform with a genuine ongoing free plan (unlimited clients, telehealth, AI scribe) and published paid pricing, serving health practitioners generally across 120+ countries. TheraNest is a mental-health-focused EHR with a 21-day free trial, an AI Session Assistant for progress notes, and explicit multi-location practice support, but no published subscription pricing and now operates under parent company Ensora Health. The right fit depends on whether you want an always-free multi-specialty tool with transparent pricing or a mental-health-specific platform with multi-location support you'd need to price via inquiry.",
  "bestForToolA": "Carepatron fits behavioral health, medical, allied health, and wellness practitioners who want to start on a permanent free plan with unlimited clients, AI scribe, and telehealth, and see published upgrade pricing ($31-$39/month).",
  "bestForToolB": "TheraNest fits solo and group mental health practices (therapists, counselors, psychiatrists, marriage/family therapists) needing multi-location management and automated insurance billing, and willing to request pricing directly rather than see it published.",
  "whoNeedsBoth": "There's no realistic scenario for using both together since they compete directly as EHR/practice management systems for the same client base; a mental health practice would pick one as its system of record rather than run parallel EHRs.",
  "keyDifferences": [
    {
      "title": "Free Plan vs. Free Trial",
      "toolA": "Carepatron offers an ongoing free plan with unlimited clients, telehealth, 1GB storage, a client portal, automated payments, and AI scribe & note taker, with no credit card required and no contract term.",
      "toolB": "TheraNest offers only a 21-day free trial with no published ongoing free tier.",
      "whyItMatters": "Practices wanting to use core EHR features indefinitely at no cost need a genuine free plan, which only Carepatron documents.",
      "benefitsWho": "Solo practitioners or small practices testing an EHR long-term without paying benefit from Carepatron's permanent free plan."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Carepatron publishes plan pricing: Plus at $31/month and Advanced at $39/month (regular pricing, with promotional discounts sometimes applied).",
      "toolB": "TheraNest's subscription pricing is not published on its product page, requiring direct inquiry.",
      "whyItMatters": "Buyers comparing EHR costs upfront can budget more easily with published pricing.",
      "benefitsWho": "Practices wanting to compare costs without a sales call benefit from Carepatron's published pricing."
    },
    {
      "title": "Insurance Billing Automation",
      "toolA": "Carepatron's billing and claims feature covers invoicing, payment processing, and insurance claim management, with e-prescribe available as a separate paid add-on ($39/month per user).",
      "toolB": "TheraNest explicitly documents 'Automated insurance billing' as a named feature that handles insurance claims processing automatically.",
      "whyItMatters": "Practices that rely heavily on insurance billing may prefer a platform that names automated claims processing explicitly.",
      "benefitsWho": "Mental health practices with high insurance claim volume benefit from TheraNest's explicitly automated insurance billing."
    },
    {
      "title": "Company Structure",
      "toolA": "Carepatron's founding year, headquarters, and company details are not disclosed on the site, with no indication of a recent ownership change.",
      "toolB": "TheraNest now operates under parent company Ensora Health, and its original theranest.com domain redirects to ensorahealth.com.",
      "whyItMatters": "Buyers evaluating long-term vendor stability may want to understand recent ownership or branding changes.",
      "benefitsWho": "Practices concerned about brand continuity should factor in TheraNest's transition under the Ensora Health umbrella."
    },
    {
      "title": "Multi-Location Practice Support",
      "toolA": "Carepatron documents Group telehealth and Group scheduling & notes on its Plus plan but doesn't name multi-location management explicitly.",
      "toolB": "TheraNest explicitly documents 'Multi-location management' for organizations operating across multiple practice locations.",
      "whyItMatters": "Group practices with multiple physical offices need software that explicitly supports multi-location administration.",
      "benefitsWho": "Multi-location group mental health practices benefit from TheraNest's named multi-location feature."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Practice Management",
      "rows": [
        {
          "feature": "Online/intelligent scheduling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Client portal",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Secure messaging",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-location management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Documentation",
      "rows": [
        {
          "feature": "AI-generated clinical notes",
          "toolA": "available",
          "toolB": "available",
          "note": "Carepatron: AI Scribe on all plans incl. free; TheraNest: AI Session Assistant"
        },
        {
          "feature": "Treatment plan management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Reporting and analytics dashboards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TheraNest names built-in reports for tracking practice performance"
        }
      ]
    },
    {
      "group": "Billing & Access",
      "rows": [
        {
          "feature": "Ongoing free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "TheraNest offers a 21-day trial only"
        },
        {
          "feature": "Published subscription pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated insurance billing/claims",
          "toolA": "available",
          "toolB": "available",
          "note": "TheraNest names this as fully automated"
        },
        {
          "feature": "ePrescribe",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Carepatron add-on, $39/month per user"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Carepatron or TheraNest have a permanent free plan?",
      "answer": "Carepatron has an ongoing free plan with unlimited clients, telehealth, and AI scribe. TheraNest only offers a 21-day free trial, with no permanent free tier documented."
    },
    {
      "question": "How much does each cost?",
      "answer": "Carepatron publishes Plus at $31/month and Advanced at $39/month. TheraNest does not publish subscription pricing on its product page."
    },
    {
      "question": "Do both use AI for clinical notes?",
      "answer": "Yes, Carepatron includes an AI Scribe & note taker on every plan including free, and TheraNest includes an AI Session Assistant that generates automated progress notes."
    },
    {
      "question": "Is TheraNest still an independent company?",
      "answer": "TheraNest now operates as a product under parent company Ensora Health, and its original domain redirects to ensorahealth.com."
    },
    {
      "question": "Which supports multi-location group practices?",
      "answer": "TheraNest explicitly documents multi-location management. Carepatron supports group telehealth and group scheduling on its Plus plan but doesn't name multi-location management as a specific feature."
    },
    {
      "question": "Are both HIPAA compliant?",
      "answer": "Yes, Carepatron states it is HIPAA, SOC 2, PIPEDA, and GDPR compliant, and TheraNest is HITRUST certified and HIPAA compliant."
    }
  ]
};

export default carepatronVsTheranestContent;
