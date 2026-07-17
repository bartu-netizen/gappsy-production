import type { ToolComparisonContent } from './types';

const healthieVsPracticeBetterContent: ToolComparisonContent = {
  "verdict": "Healthie is a tiered EHR priced by active-client count with AI Scribe and CMS 1500 insurance billing built in from its Essentials tier, while Practice Better leads with a genuinely free Sprout plan and pay-as-you-go AI charting at $0.60/hour, targeting a wide range of wellness practitioners from health coaches to naturopathic doctors. Both are HIPAA-compliant, full-featured EHR platforms, but they differ sharply on free-tier availability and how AI documentation is priced.",
  "bestForToolA": "US-based practices needing CMS 1500 insurance claims (via ClaimMD integration from $30/month) and wearable data integration with Google Fit, Apple Health, and Fitbit through Healthie Harbor.",
  "bestForToolB": "Practitioners wanting to start completely free on the Sprout plan (3 clients, 100MB storage) or pay only for AI charting time used at $0.60/hour with 600 minutes free, especially health coaches, nutritionists, dietitians, and personal trainers.",
  "whoNeedsBoth": "Not realistic - both are all-in-one EHR/practice-management platforms covering scheduling, charting, billing, and client portals, so a practitioner would run one as their system of record rather than both simultaneously.",
  "keyDifferences": [
    {
      "title": "Free Plan Availability",
      "toolA": "Healthie has no free plan, only a 14-day free trial with no credit card required.",
      "toolB": "Practice Better offers a free Sprout plan (3 clients, 100MB storage, basic scheduling, telehealth, messaging, client portal).",
      "whyItMatters": "A free tier lets small or just-starting practitioners use the software indefinitely at zero cost rather than a time-boxed trial.",
      "benefitsWho": "Benefits solo practitioners just starting out or testing the waters with a handful of clients."
    },
    {
      "title": "AI Charting Pricing Model",
      "toolA": "Healthie's AI Scribe is included as a named feature without a separate per-use price documented.",
      "toolB": "Practice Better's AI Charting Assistant is metered at $0.60/hour with 600 minutes included free.",
      "whyItMatters": "Usage-based AI pricing can be cheaper for light users but adds unpredictable cost for high-volume documentation.",
      "benefitsWho": "Benefits low-volume practitioners who want to pay only for the AI charting time they actually use."
    },
    {
      "title": "Entry-Tier Client Limits",
      "toolA": "Healthie's Core plan ($19/month) allows 10 active clients.",
      "toolB": "Practice Better's free Sprout plan allows 3 clients; the paid Starter plan ($25/month billed annually) allows 10 clients with 1GB storage.",
      "whyItMatters": "Client caps determine how quickly a growing practice must upgrade to a higher tier.",
      "benefitsWho": "Benefits practices estimating when they'll outgrow an entry-level plan."
    },
    {
      "title": "Team / Multi-Practitioner Scaling",
      "toolA": "Healthie's Group plan ($149+/month) adds team members at $50/month per clinician with a shared calendar and internal team chat.",
      "toolB": "Practice Better's Team plan ($155/month, $145 billed annually) includes 2 practitioners with additional practitioners scaling up to 200 at $50 each.",
      "whyItMatters": "Per-seat add-on pricing directly affects the cost of scaling a group practice.",
      "benefitsWho": "Benefits multi-practitioner clinics comparing per-seat costs as they add clinicians."
    },
    {
      "title": "Prescribing Capability",
      "toolA": "Not documented for Healthie.",
      "toolB": "Practice Better offers ePrescribe as a paid add-on at $49/month plus an onboarding fee.",
      "whyItMatters": "Electronic prescribing is required for practitioners who need to prescribe medication directly through the platform.",
      "benefitsWho": "Benefits medical doctors and nurse practitioners who need in-platform e-prescribing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Practice Better's Sprout plan: 3 clients, 100MB"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Healthie: 14 days; Practice Better: 14 days on paid plans, 30 days on Team"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Healthie: $19/month for 10 clients; Practice Better: $25/month billed annually for 10 clients"
        },
        {
          "feature": "Cancel-anytime / no contracts",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Clinical & AI Tools",
      "rows": [
        {
          "feature": "AI-assisted charting",
          "toolA": "available",
          "toolB": "available",
          "note": "Practice Better bills $0.60/hour with 600 minutes free"
        },
        {
          "feature": "Telehealth",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Wearable integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Healthie Harbor"
        },
        {
          "feature": "ePrescribe",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Practice Better: $49/month add-on plus onboarding fee"
        }
      ]
    },
    {
      "group": "Practice Growth Features",
      "rows": [
        {
          "feature": "Insurance billing (CMS 1500)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Healthie Essentials tier and up"
        },
        {
          "feature": "Client programs / courses",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fixed-date, evergreen, self-paced programs"
        },
        {
          "feature": "SMS reminders",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "750/month on Plus, 2,000/month on Team"
        },
        {
          "feature": "Multi-practitioner team plan",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either tool have a free plan?",
      "answer": "Practice Better offers a free Sprout plan (3 clients, 100MB storage); Healthie has no free plan, only a 14-day free trial."
    },
    {
      "question": "How is AI charting priced?",
      "answer": "Practice Better bills its AI Charting Assistant at $0.60/hour with 600 minutes free. Healthie includes AI Scribe as a feature without a separately documented per-use price."
    },
    {
      "question": "Which tool supports insurance claims?",
      "answer": "Healthie supports CMS 1500 forms from its Essentials tier ($49/month); this is not documented for Practice Better."
    },
    {
      "question": "Can I e-prescribe from either platform?",
      "answer": "Practice Better offers ePrescribe as a $49/month add-on plus an onboarding fee; this is not documented for Healthie."
    },
    {
      "question": "How do team / multi-practitioner costs compare?",
      "answer": "Healthie's Group plan adds clinicians at $50/month each; Practice Better's Team plan starts with 2 practitioners and scales up to 200 at $50 each."
    },
    {
      "question": "Which platform reports more users?",
      "answer": "Practice Better reports over 50,000 practitioners with a 4.7-star G2 rating from 250+ reviews; Healthie reports being trusted by 35,000 providers."
    }
  ]
};

export default healthieVsPracticeBetterContent;
