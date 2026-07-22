import type { ToolComparisonContent } from './types';

const janeAppVsLumaHealthContent: ToolComparisonContent = {
  "verdict": "Jane App is a per-practitioner clinic management platform covering scheduling, telehealth, billing, and a patient app, built for individual and small multidisciplinary health/wellness practices, with transparent pricing starting at CAD $54/month. Luma Health is an enterprise operational AI platform that automates patient access, engagement, intake, and payments at scale for larger healthcare organizations, integrating deeply with major EHRs like Epic and Oracle Health, with pricing available only through sales. They serve different scales of healthcare business: small practices needing an all-in-one clinic system versus large health systems needing EHR-integrated automation.",
  "bestForToolA": "Jane App fits solo and small-group practitioners such as physiotherapists, massage therapists, counsellors, and midwives who want transparent per-practitioner pricing and built-in scheduling, telehealth, and payments without needing EHR integration.",
  "bestForToolB": "Luma Health fits larger healthcare organizations already running systems like Epic, Oracle Health, or Athenahealth that need to automate patient access, engagement, and payments across an existing EHR rather than replace their clinic-management system.",
  "whoNeedsBoth": "A larger clinic group could run Jane App as its day-to-day per-practitioner scheduling and booking system while an affiliated hospital network or larger care partner separately uses Luma Health to automate referrals and patient outreach across its own EHR — this reflects two organizations of different scale rather than one buyer combining both for the same clinic.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Jane App publishes per-practitioner pricing: Balance at CAD $54/month, Practice at CAD $79/month, and Thrive at CAD $99/month.",
      "toolB": "Luma Health does not publish pricing; it requires contacting sales.",
      "whyItMatters": "Transparent pricing lets small practices budget without a sales call.",
      "benefitsWho": "Solo practitioners and small clinics comparing costs upfront benefit from Jane App's published pricing."
    },
    {
      "title": "EHR Integration Depth",
      "toolA": "Jane App's documented feature set centers on its own built-in scheduling, telehealth, and billing rather than third-party EHR connections.",
      "toolB": "Luma Health integrates with major EHRs including Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech.",
      "whyItMatters": "Organizations already invested in an EHR need a tool that layers on top of it rather than replacing it.",
      "benefitsWho": "Large health systems with an established EHR benefit from Luma Health's integration list."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Jane App offers an AI Scribe add-on for clinical documentation, priced separately at $15/month per opted-in practitioner.",
      "toolB": "Luma Health's AI core, Spark, coordinates agentic automation across access, engagement, intake, and payments, including two-way AI translation for patient communication.",
      "whyItMatters": "The scope of AI differs: one assists note-taking, the other automates entire operational workflows.",
      "benefitsWho": "Practices wanting lighter AI note assistance benefit from Jane App's AI Scribe; large organizations wanting broad workflow automation benefit from Luma Health's Spark."
    },
    {
      "title": "Target Organization Size",
      "toolA": "Jane App is built for individual and small multidisciplinary practices, with pricing scaling by added practitioners.",
      "toolB": "Luma Health is built primarily for larger healthcare organizations, reporting 1,000+ healthcare organizations as customers, including Banner Health and UAMS.",
      "whyItMatters": "Product design and pricing complexity differ significantly by organization scale.",
      "benefitsWho": "Small independent clinics benefit from Jane App's simpler per-practitioner scale; large health systems benefit from Luma Health's enterprise scale."
    },
    {
      "title": "Trial Access",
      "toolA": "Jane App does not offer a free trial but provides a demo account through its support team.",
      "toolB": "Luma Health does not mention a free trial or free plan.",
      "whyItMatters": "Evaluating before purchase reduces buying risk.",
      "benefitsWho": "Prospective Jane App customers benefit from the ability to explore a demo account before committing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling & Patient Access",
      "rows": [
        {
          "feature": "Online booking and scheduling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Telehealth",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Intake forms",
          "toolA": "available",
          "toolB": "available",
          "note": "Luma Health: Agentic Intake"
        },
        {
          "feature": "Automated appointment reminders",
          "toolA": "available",
          "toolB": "available",
          "note": "Luma Health via Agentic Engagement messaging"
        },
        {
          "feature": "Patient mobile app",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Billing & Payments",
      "rows": [
        {
          "feature": "Built-in payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Jane: Jane Payments; Luma: Agentic Payments"
        },
        {
          "feature": "Insurance eligibility/prior authorization",
          "toolA": "available",
          "toolB": "available",
          "note": "Jane: add-on billing/insurance; Luma: Agentic Payments"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Jane starts at CAD $54/mo; Luma requires sales contact"
        }
      ]
    },
    {
      "group": "AI & Integration",
      "rows": [
        {
          "feature": "AI clinical documentation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AI Scribe add-on, $15/mo per practitioner"
        },
        {
          "feature": "EHR integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Epic, Oracle Health, Athenahealth, and more"
        },
        {
          "feature": "No-code workflow builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Jane offers a demo account instead"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Jane App offer a free trial?",
      "answer": "No, Jane App does not offer a free trial; instead it provides access to a demo account through its community and support team."
    },
    {
      "question": "Is Luma Health's pricing public?",
      "answer": "No, pricing is not disclosed on the website and requires contacting sales."
    },
    {
      "question": "What EHRs does Luma Health integrate with?",
      "answer": "Luma Health integrates with Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech."
    },
    {
      "question": "How much does Jane App cost?",
      "answer": "Plans start at CAD $54/month for the Balance plan, with Practice at CAD $79/month and Thrive at CAD $99/month."
    },
    {
      "question": "Does Jane App include AI features?",
      "answer": "Yes, an AI Scribe add-on assists with generating clinical notes, priced at $15/month per opted-in practitioner."
    },
    {
      "question": "Who is Luma Health built for?",
      "answer": "Larger healthcare organizations; Luma Health reports being trusted by 1,000+ healthcare organizations, including Banner Health and UAMS."
    }
  ]
};

export default janeAppVsLumaHealthContent;
