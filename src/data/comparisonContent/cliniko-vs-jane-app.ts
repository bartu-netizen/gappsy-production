import type { ToolComparisonContent } from './types';

const clinikoVsJaneAppContent: ToolComparisonContent = {
  "verdict": "Cliniko is a straightforward scheduling, treatment-records, and invoicing platform priced simply by practitioner count with a 30-day free trial. Jane App is a broader clinic platform with built-in telehealth, an AI Scribe add-on, and a dedicated patient mobile app, priced in CAD with per-practitioner scaling and no free trial - only a demo account. Both target allied-health and wellness clinics but differ on trial policy, currency, and how much clinical/communication depth ships in the base plan.",
  "bestForToolA": "Solo or small allied-health practices that want simple, transparent USD pricing starting at $45/month for one practitioner and a full 30-day free trial before committing.",
  "bestForToolB": "Interdisciplinary clinics - physiotherapy, massage therapy, counselling, midwifery - that want built-in telehealth, an AI Scribe add-on, and a patient mobile app, starting at CAD $54/month.",
  "whoNeedsBoth": "Not realistic - both are direct competitors covering the same core practice-management functions (scheduling, records, billing), so a clinic would standardize on one system of record rather than run both in parallel.",
  "keyDifferences": [
    {
      "title": "Pricing Currency & Structure",
      "toolA": "Cliniko prices in USD by practitioner count: $45/month for 1 practitioner up to $395/month for 26-200 practitioners.",
      "toolB": "Jane App prices in CAD: Balance at $54/month (single practitioner, up to 20 appointments/month), Practice at $79/month (unlimited appointments), and Thrive at $99/month (advanced tools), with additional practitioners at variable cost.",
      "whyItMatters": "Currency and the scaling axis change total cost differently as a clinic adds practitioners or appointment volume.",
      "benefitsWho": "Benefits finance-conscious clinic owners comparing multi-year cost as headcount grows."
    },
    {
      "title": "Free Trial vs Demo",
      "toolA": "Cliniko offers a 30-day free trial.",
      "toolB": "Jane App does not offer a free trial; it provides a demo account through its support team instead.",
      "whyItMatters": "A hands-on trial period lets a practice test real workflows with its own data before paying.",
      "benefitsWho": "Benefits practices that want to fully test the software risk-free before switching systems."
    },
    {
      "title": "Telehealth & AI Documentation",
      "toolA": "Cliniko does not list telehealth or AI documentation among its documented features.",
      "toolB": "Jane App includes built-in telehealth video consultations and an AI Scribe add-on for generating clinical notes, priced at $15/month per opted-in practitioner.",
      "whyItMatters": "Telehealth and AI charting can materially cut admin time and expand service delivery to remote patients.",
      "benefitsWho": "Benefits practitioners who see patients virtually or want to reduce time spent writing clinical notes."
    },
    {
      "title": "SMS & Communication Costs",
      "toolA": "Cliniko bills SMS reminders separately at 10 cents per message.",
      "toolB": "Jane App includes automated email and SMS appointment reminders as a feature, with AI Scribe priced separately.",
      "whyItMatters": "Per-message SMS fees versus bundled reminders change ongoing communication costs depending on patient volume.",
      "benefitsWho": "Benefits high-volume clinics estimating monthly messaging spend."
    },
    {
      "title": "Support Model",
      "toolA": "Cliniko includes unlimited 24/7 chat and email support at every tier.",
      "toolB": "Jane App does not document an explicit unlimited or 24/7 support claim; users engage support to arrange demo access.",
      "whyItMatters": "Support responsiveness matters when technical issues affect daily patient scheduling.",
      "benefitsWho": "Benefits smaller practices without dedicated IT staff who need fast help resolving issues."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling & Records",
      "rows": [
        {
          "feature": "Appointment scheduling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Treatment / clinical records",
          "toolA": "available",
          "toolB": "limited",
          "note": "Jane's clinical documentation runs through the paid AI Scribe add-on"
        },
        {
          "feature": "Telehealth",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Patient mobile app",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Billing & Payments",
      "rows": [
        {
          "feature": "Invoicing and payments",
          "toolA": "available",
          "toolB": "available",
          "note": "Jane Payments is the named payment product"
        },
        {
          "feature": "Insurance billing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available as a Jane App add-on"
        },
        {
          "feature": "Built-in payment processing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Communication & Support",
      "rows": [
        {
          "feature": "SMS reminders",
          "toolA": "available",
          "toolB": "available",
          "note": "Cliniko charges 10 cents/message"
        },
        {
          "feature": "AI-assisted documentation",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Jane's AI Scribe add-on is $15/month per practitioner"
        },
        {
          "feature": "24/7 support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Third-party integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cliniko integrates with MailChimp and Xero"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper for a solo practitioner?",
      "answer": "Cliniko starts at $45/month USD for 1 practitioner while Jane App's Balance plan starts at CAD $54/month, so Cliniko's nominal entry price is lower, though currency conversion should be factored in."
    },
    {
      "question": "Does Jane App offer a free trial?",
      "answer": "No, Jane App does not offer a free trial; instead it provides access to a demo account through its support team."
    },
    {
      "question": "Does Cliniko offer telehealth?",
      "answer": "Telehealth is not documented among Cliniko's features, while Jane App includes it as a built-in capability."
    },
    {
      "question": "Is AI charting included in either tool?",
      "answer": "Jane App's AI Scribe is a paid add-on at $15/month per opted-in practitioner; Cliniko does not document any AI features."
    },
    {
      "question": "How is SMS messaging billed?",
      "answer": "Cliniko charges 10 cents per SMS message; Jane App includes automated SMS and email reminders as a feature."
    },
    {
      "question": "What types of practices does each tool serve?",
      "answer": "Jane App explicitly serves physiotherapy, massage therapy, counselling, and midwifery among other interdisciplinary clinics; Cliniko is positioned broadly for clinics and allied health practitioners."
    }
  ]
};

export default clinikoVsJaneAppContent;
