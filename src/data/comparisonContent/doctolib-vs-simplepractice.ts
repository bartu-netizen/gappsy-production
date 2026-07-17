import type { ToolComparisonContent } from './types';

const doctolibVsSimplepracticeContent: ToolComparisonContent = {
  "verdict": "Doctolib and SimplePractice both sit in healthcare scheduling but at different depths and in different regions. Doctolib is a France-based (Levallois-Perret) patient booking and video consultation platform covering 30+ specialties across France, Germany, and Italy, with no documented clinical charting or billing features. SimplePractice, founded in 2012 and based in Santa Monica, California, is a full US practice management and EHR system built specifically for therapists and wellness professionals, bundling scheduling, insurance billing, clinical documentation, and telehealth with published per-clinician pricing.",
  "bestForToolA": "Patients and healthcare providers in France, Germany, or Italy who want a public, multi-specialty directory for booking appointments and holding video consultations.",
  "bestForToolB": "US-based therapists, counselors, dietitians, and other wellness professionals who need scheduling, insurance billing, clinical documentation, and telehealth combined in one system, starting at $49/month per clinician on the Starter plan.",
  "whoNeedsBoth": "There is no realistic single-practice scenario for using both -- they serve different regions and different depths of functionality. A multinational wellness organization might use SimplePractice for its US clinicians and separately list its European providers on Doctolib, but the facts show no integration between the two.",
  "keyDifferences": [
    {
      "title": "Practice Management Depth",
      "toolA": "Doctolib's documented features focus on booking, a specialist directory, and video consultations, with no clinical documentation, billing, or payment processing features listed.",
      "toolB": "SimplePractice includes clinical documentation templates for behavioral health and wellness fields, insurance billing and claims, integrated payment processing, and group practice management.",
      "whyItMatters": "A therapist choosing software to run their entire practice needs documentation and billing, not just booking.",
      "benefitsWho": "US clinicians who need one system to handle the full client lifecycle from intake to billing."
    },
    {
      "title": "Target Market and Geography",
      "toolA": "Doctolib operates in France, Germany, and Italy and is B Corp certified.",
      "toolB": "SimplePractice is US-focused, built around US insurance and regulatory workflows, founded in 2012 in Santa Monica, California.",
      "whyItMatters": "Regulatory and insurance workflows differ significantly by country, so a platform built for one market rarely transfers cleanly to another.",
      "benefitsWho": "Practices confirming their software matches their country's insurance and compliance requirements."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Doctolib's pricing model and starting price are not published in the available facts.",
      "toolB": "SimplePractice publishes tiered pricing: Starter at $49/month per clinician, Essential at $79/month, and Plus at $99/month, each with clearly listed included features.",
      "whyItMatters": "Published tiered pricing lets buyers self-serve a budget estimate without a sales call.",
      "benefitsWho": "Solo practitioners and small practices comparing costs before committing."
    },
    {
      "title": "AI Features",
      "toolA": "No AI features are documented for Doctolib.",
      "toolB": "SimplePractice offers an AI Note Taker add-on that drafts session documentation from audio to speed up clinical note writing.",
      "whyItMatters": "AI-assisted documentation can meaningfully cut the administrative time clinicians spend after each session.",
      "benefitsWho": "Busy clinicians who want to reduce time spent on progress notes."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "No free trial is documented for Doctolib.",
      "toolB": "SimplePractice's pricing model is listed as \"Paid (free trial available),\" letting practices test scheduling, billing, and documentation before subscribing.",
      "whyItMatters": "A free trial lowers the risk of committing to a new practice management system sight unseen.",
      "benefitsWho": "Clinicians evaluating whether SimplePractice fits their workflow before paying."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling & Booking",
      "rows": [
        {
          "feature": "Online self-scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Video / telehealth consultations",
          "toolA": "available",
          "toolB": "available",
          "note": "SimplePractice's telehealth is HIPAA-compliant and built in"
        },
        {
          "feature": "Specialist/provider directory",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Doctolib covers 30+ specialties"
        },
        {
          "feature": "Automated appointment reminders",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Clinical & Billing",
      "rows": [
        {
          "feature": "Clinical documentation templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Insurance billing and claims",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Integrated payment processing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI note-taking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SimplePractice offers this as a paid add-on"
        }
      ]
    },
    {
      "group": "Company & Access",
      "rows": [
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Published pricing tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SimplePractice: $49/$79/$99 per clinician/month"
        },
        {
          "feature": "B Corp certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Multi-country operation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SimplePractice's cons note it is US-regulatory focused"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Doctolib an EHR like SimplePractice?",
      "answer": "No. Doctolib's documented features center on appointment booking, a specialist directory, and video consultations, with no clinical documentation or EHR functionality listed. SimplePractice is a full practice management and EHR system."
    },
    {
      "question": "How much does SimplePractice cost?",
      "answer": "SimplePractice has three published tiers: Starter at $49/month per clinician, Essential at $79/month, and Plus at $99/month, each adding more features like custom treatment plans and analytics."
    },
    {
      "question": "Does Doctolib publish its pricing?",
      "answer": "No, based on the available facts, Doctolib's pricing model and starting price are not published."
    },
    {
      "question": "Which tool is better for US therapists specifically?",
      "answer": "SimplePractice, since it is built around US insurance billing workflows and includes documentation templates tailored to behavioral health and wellness professions, which Doctolib does not document."
    },
    {
      "question": "Does Doctolib support telehealth?",
      "answer": "Yes, Doctolib offers video consultations directly through its platform alongside in-person appointment booking."
    },
    {
      "question": "Does SimplePractice include AI features?",
      "answer": "Yes -- an optional AI Note Taker add-on drafts session documentation from audio recordings to speed up clinical note writing."
    }
  ]
};

export default doctolibVsSimplepracticeContent;
