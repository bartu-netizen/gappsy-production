import type { ToolComparisonContent } from './types';

const ohmdVsPracticeBetterContent: ToolComparisonContent = {
  "verdict": "OhMD is a patient-communication platform centered on an AI voice agent (Nia) and secure texting that plugs into 85+ existing EHR systems, whereas Practice Better is a full EHR and practice-management system with its own scheduling, charting, billing, and client portal. They solve different problems and typically sit at different layers of a practice's tech stack rather than competing head-to-head.",
  "bestForToolA": "Medical practices and larger institutions - OhMD counts Dana-Farber and Memorial Sloan Kettering among its 1,200+ practices - that want to automate inbound patient calls and texting on top of an existing EHR, starting at $300/month for the Communicate plan.",
  "bestForToolB": "Independent health and wellness practitioners such as health coaches, nutritionists, and therapists who need a complete charting, scheduling, and billing system, with the option to start free on the Sprout plan or from $25/month billed annually on Starter.",
  "whoNeedsBoth": "A growing wellness practice could run Practice Better as its EHR and client-management system of record while separately evaluating an OhMD-style AI communication layer for phone and text volume - though OhMD's target market (1,200+ medical practices, including major cancer centers) suggests it's built more for hospital-scale EHR integrations than for Practice Better's wellness-practitioner audience.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "OhMD is purpose-built AI patient communication - voice agent Nia, two-way texting, call-to-text - that integrates with 85+ EHR systems rather than replacing them.",
      "toolB": "Practice Better is a full EHR/practice-management system of record with its own charting, scheduling, and client portal.",
      "whyItMatters": "Choosing between an EHR-agnostic communication layer and an all-in-one EHR determines whether the tool replaces or supplements existing practice software.",
      "benefitsWho": "Benefits practices that already have an EHR and need better communication (OhMD) versus practices without one that need a full system (Practice Better)."
    },
    {
      "title": "Pricing Floor",
      "toolA": "OhMD starts at $300/month for the Communicate plan.",
      "toolB": "Practice Better has a free Sprout plan and paid plans starting at $25/month (Starter, billed annually).",
      "whyItMatters": "The pricing floors differ by more than 10x, reflecting OhMD's focus on higher-volume medical practices versus Practice Better's broader wellness-practitioner market.",
      "benefitsWho": "Benefits budget-conscious solo wellness practitioners (Practice Better) versus larger medical practices with communication-automation budgets (OhMD)."
    },
    {
      "title": "AI Voice vs AI Charting",
      "toolA": "OhMD's AI voice agent (Nia) automatically answers, routes, and handles patient phone calls, available on the $500/month Automate plan with calling usage billed separately.",
      "toolB": "Practice Better's AI Charting Assistant generates clinical notes, billed at $0.60/hour with 600 minutes included free.",
      "whyItMatters": "The two AI features solve different pain points - phone call automation versus documentation time savings.",
      "benefitsWho": "Benefits practices with high call volume (OhMD's Nia) versus practitioners who spend significant time writing session notes (Practice Better's AI Charting Assistant)."
    },
    {
      "title": "EHR Integration Breadth",
      "toolA": "OhMD explicitly integrates with 85+ EHR systems.",
      "toolB": "Practice Better is not documented as integrating with external EHRs; it functions as its own EHR.",
      "whyItMatters": "A practice that wants to keep its current EHR and layer on communication tools needs broad EHR compatibility.",
      "benefitsWho": "Benefits practices with an established EHR that don't want to migrate records to a new system."
    },
    {
      "title": "Compliance Documentation",
      "toolA": "OhMD states a signed BAA and multi-factor authentication for HIPAA compliance.",
      "toolB": "Practice Better states HIPAA, PIPEDA, and GDPR compliance.",
      "whyItMatters": "Compliance certifications affect eligibility for practices handling protected health information across different jurisdictions.",
      "benefitsWho": "Benefits practices in Canada or the EU needing PIPEDA/GDPR coverage (Practice Better) versus US practices needing a documented BAA and MFA (OhMD)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Patient Communication",
      "rows": [
        {
          "feature": "AI voice / call automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OhMD's Nia is on the $500/month Automate plan"
        },
        {
          "feature": "Two-way texting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Voicemail transcription",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Secure client messaging",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Practice Better's client portal messaging"
        }
      ]
    },
    {
      "group": "Clinical & Practice Management",
      "rows": [
        {
          "feature": "Scheduling",
          "toolA": "limited",
          "toolB": "available",
          "note": "OhMD scheduling automation only on the Automate plan"
        },
        {
          "feature": "Clinical charting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Billing and payments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "EHR integration",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OhMD integrates with 85+ systems; Practice Better is its own EHR"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Practice Better's Sprout plan"
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "OhMD: $300/month; Practice Better: $25/month billed annually"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "API / extensibility",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OhMD Enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do OhMD and Practice Better do the same thing?",
      "answer": "No - OhMD is an AI patient-communication layer (voice and texting) that integrates with existing EHRs, while Practice Better is a full EHR and practice-management system."
    },
    {
      "question": "How much does each tool cost to start?",
      "answer": "OhMD starts at $300/month (Communicate plan); Practice Better has a free Sprout plan and paid plans from $25/month billed annually."
    },
    {
      "question": "Does Practice Better include an AI voice agent like OhMD's Nia?",
      "answer": "No, Practice Better's AI tool is an AI Charting Assistant for clinical notes ($0.60/hour), not a voice agent."
    },
    {
      "question": "Can OhMD work alongside an existing EHR?",
      "answer": "Yes, OhMD integrates with 85+ EHR systems rather than replacing them."
    },
    {
      "question": "Which tool is HIPAA compliant?",
      "answer": "Both document compliance - OhMD states a signed BAA and multi-factor authentication, and Practice Better states HIPAA, PIPEDA, and GDPR compliance."
    },
    {
      "question": "Who are the typical users of each platform?",
      "answer": "OhMD serves medical practices including large institutions like Dana-Farber and Memorial Sloan Kettering; Practice Better serves wellness practitioners such as health coaches, nutritionists, dietitians, and mental health professionals."
    }
  ]
};

export default ohmdVsPracticeBetterContent;
