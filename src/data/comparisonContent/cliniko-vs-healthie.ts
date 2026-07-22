import type { ToolComparisonContent } from './types';

const clinikoVsHealthieContent: ToolComparisonContent = {
  "verdict": "Cliniko is a scheduling, records, and billing platform priced simply by practitioner headcount, while Healthie is a fuller EHR built around active-client-count tiers with AI Scribe, telehealth/group webinars, wearable integrations, and insurance billing (CMS 1500 forms) available on its higher tiers. The two price along different axes - practitioners for Cliniko, active clients for Healthie - which changes which tool is cheaper depending on a practice's shape.",
  "bestForToolA": "Allied-health clinics with a fixed practitioner count that want simple per-practitioner USD pricing starting at $45/month and unlimited 24/7 support without navigating client-count tiers.",
  "bestForToolB": "Solo practitioners or growing practices wanting an entry price as low as $19/month for 10 active clients, plus AI Scribe, telehealth/group webinars, and wearable data integration through Healthie Harbor.",
  "whoNeedsBoth": "Not realistic - both are full practice-management/EHR systems covering scheduling, records, and billing, so a practice would standardize on one system of record rather than operate two overlapping platforms.",
  "keyDifferences": [
    {
      "title": "Pricing Basis",
      "toolA": "Cliniko is priced by practitioner count: $45/month for 1 practitioner up to $395/month for 26-200 practitioners.",
      "toolB": "Healthie is priced by active client count and feature tier: $19/month Core (10 clients) up to $149+/month Group (unlimited clients, $50/month per added clinician).",
      "whyItMatters": "A practice with few practitioners but many clients, or vice versa, will see very different costs depending on which pricing axis the vendor uses.",
      "benefitsWho": "Benefits practices doing careful cost modeling based on whether their bottleneck is practitioner count or client volume."
    },
    {
      "title": "Free Trial Length",
      "toolA": "Cliniko offers a 30-day free trial.",
      "toolB": "Healthie offers a 14-day free trial with no credit card required.",
      "whyItMatters": "A longer trial gives more time to validate workflows with real patients before switching systems.",
      "benefitsWho": "Benefits practices wanting extended hands-on evaluation time."
    },
    {
      "title": "AI Clinical Documentation",
      "toolA": "No AI documentation feature is documented for Cliniko.",
      "toolB": "Healthie includes an AI Scribe as a named feature for clinical documentation.",
      "whyItMatters": "AI-assisted charting can significantly reduce time spent writing notes after each session.",
      "benefitsWho": "Benefits busy solo practitioners and clinicians who want to cut documentation time."
    },
    {
      "title": "Insurance & Billing Depth",
      "toolA": "Cliniko offers invoicing and payments only; no CMS 1500 or insurance-specific billing is documented.",
      "toolB": "Healthie includes CMS 1500 forms and ClaimMD integration (from $30/month) starting at the Essentials tier, $49/month.",
      "whyItMatters": "Practices that bill insurance directly need CMS 1500 support, which not every practice-management tool includes.",
      "benefitsWho": "Benefits US-based practices that bill insurance and need claims form support built in."
    },
    {
      "title": "Wearable & Health Data Integration",
      "toolA": "Not documented for Cliniko.",
      "toolB": "Healthie integrates with Google Fit, Apple Health, and Fitbit through the Healthie Harbor marketplace.",
      "whyItMatters": "Wearable integration lets providers track patient activity and health data between visits.",
      "benefitsWho": "Benefits health coaches, dietitians, and wellness providers who use activity or biometric data in care plans."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Practice Management",
      "rows": [
        {
          "feature": "Scheduling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Client / treatment records",
          "toolA": "available",
          "toolB": "available",
          "note": "Cliniko: treatment records; Healthie: charting and documentation"
        },
        {
          "feature": "Client portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listed on Healthie's Core plan"
        }
      ]
    },
    {
      "group": "Clinical & AI Tools",
      "rows": [
        {
          "feature": "Telehealth",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Includes group webinars on Healthie"
        },
        {
          "feature": "AI-assisted documentation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Healthie's AI Scribe"
        },
        {
          "feature": "Wearable integrations",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Healthie Harbor: Google Fit, Apple Health, Fitbit"
        },
        {
          "feature": "Group messaging / webinars",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Essentials tier and up"
        }
      ]
    },
    {
      "group": "Billing & Compliance",
      "rows": [
        {
          "feature": "Invoicing and payments",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Insurance claims (CMS 1500)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Essentials tier and up"
        },
        {
          "feature": "SMS reminders",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cliniko charges 10 cents/message"
        },
        {
          "feature": "HIPAA / SOC 2 compliance stated",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stated on all Healthie plans"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has the lower starting price?",
      "answer": "Healthie starts at $19/month for 10 active clients versus Cliniko's $45/month for 1 practitioner, but the two aren't directly comparable since they price along different axes - clients versus practitioners."
    },
    {
      "question": "How long are the free trials?",
      "answer": "Cliniko offers a 30-day free trial; Healthie offers a 14-day free trial with no credit card required."
    },
    {
      "question": "Does Cliniko include AI features?",
      "answer": "AI features are not documented for Cliniko. Healthie includes an AI Scribe for clinical documentation."
    },
    {
      "question": "Which tool supports insurance claims billing?",
      "answer": "Healthie supports CMS 1500 forms and ClaimMD integration starting at the Essentials tier ($49/month); insurance billing is not documented for Cliniko."
    },
    {
      "question": "Does either tool integrate with wearables?",
      "answer": "Healthie integrates with Google Fit, Apple Health, and Fitbit via Healthie Harbor; this is not documented for Cliniko."
    },
    {
      "question": "How many providers report using each platform?",
      "answer": "Healthie states it is trusted by 35,000 providers. Cliniko doesn't publish a provider count but notes it donates 2% of subscription revenue to charity."
    }
  ]
};

export default clinikoVsHealthieContent;
