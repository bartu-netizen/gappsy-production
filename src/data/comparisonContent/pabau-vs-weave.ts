import type { ToolComparisonContent } from './types';

const pabauVsWeaveContent: ToolComparisonContent = {
  "verdict": "Pabau is a clinical practice management system built for medical, aesthetic, and wellness clinics that need charting, prescriptions, telehealth, and billing in one place, starting at £50/month with no per-patient fees. Weave is a communications-first platform centered on an AI Receptionist that automates inbound calls and texts, appointment reminders, and payments for healthcare and small business front desks, starting at $199/month. They overlap on scheduling and payments but diverge sharply on whether the core job is clinical documentation or front-desk communication.",
  "bestForToolA": "Medical, aesthetic, and wellness practices that need digital charting, prescriptions, telehealth, and insurance billing alongside scheduling, and want the entry-level Starter plan (1 user, up to 100 patients) at £50/month with no per-patient fees.",
  "bestForToolB": "Healthcare or small business front desks that are overwhelmed by missed calls and texts and want an AI Receptionist plus AI-assisted review responses, accessible via web, desktop, and mobile apps starting at $199/month.",
  "whoNeedsBoth": "A dental or medical group could run Pabau as its clinical and billing system of record while using Weave as the communications layer that answers calls, sends reminders, and manages online reviews — the facts don't document any native integration between them, so this would mean operating two separate systems rather than a connected workflow.",
  "keyDifferences": [
    {
      "title": "Clinical Depth vs Communications Focus",
      "toolA": "Pabau includes digital forms, charting, labs, prescriptions, telehealth, and before/after photos as core clinical tools.",
      "toolB": "Weave's feature set centers on calls, texts, scheduling reminders, and payments; the facts do not document clinical charting, prescriptions, or telehealth capabilities.",
      "whyItMatters": "A clinic that needs to document patient care electronically requires charting and prescribing tools that only one of these platforms documents.",
      "benefitsWho": "Clinicians and practice managers who need a single system of record for patient care, not just scheduling and communication."
    },
    {
      "title": "AI Receptionist vs AI Clinical Agents",
      "toolA": "Pabau's AI agents include a scribe agent for clinical notes, a prescribing agent with safety checks, and a letters agent.",
      "toolB": "Weave's AI Receptionist handles inbound voice calls and text messages automatically, and an AI Response Assistant helps manage customer reviews.",
      "whyItMatters": "Both tools use AI, but for very different jobs — one automates clinical documentation, the other automates front-desk contact.",
      "benefitsWho": "Practices should match the AI investment to their bigger pain point: clinical note-taking burden versus missed-call and review-response volume."
    },
    {
      "title": "Entry Pricing",
      "toolA": "Pabau's published Starter plan is £50/month for 1 user and up to 100 patients, with no per-patient fees on any tier.",
      "toolB": "Weave's Pro plan starts at $199/month; Elite and Ultimate tiers are not publicly priced and require contacting sales.",
      "whyItMatters": "The entry price gap is significant and matters for solo practitioners or very small clinics evaluating budget.",
      "benefitsWho": "Budget-conscious solo or small-team practices comparing upfront monthly cost."
    },
    {
      "title": "Payments and Billing",
      "toolA": "Pabau offers point-of-sale via Pabau Pay, invoicing, and insurance billing alongside quotes.",
      "toolB": "Weave supports text-to-pay and buy-now-pay-later options for patient payments.",
      "whyItMatters": "Practices that bill insurance need insurance billing support, which is only documented for one of these platforms.",
      "benefitsWho": "Practices that handle insurance claims as part of their revenue cycle, versus cash-pay or small businesses wanting flexible payment methods."
    },
    {
      "title": "Mobile Access",
      "toolA": "Pabau GO is a dedicated iPhone and iPad app for managing the practice on the go; no Android app is mentioned in the facts.",
      "toolB": "Weave is accessible via web browser, a desktop app, and mobile apps, without a specific iOS/Android breakdown documented.",
      "whyItMatters": "Staff who work off-site or move between exam rooms need reliable mobile access to the tool they use most.",
      "benefitsWho": "Multi-room clinics and mobile practitioners who rely on tablet or phone access during patient visits."
    }
  ],
  "featureMatrix": [
    {
      "group": "Clinical & Scheduling",
      "rows": [
        {
          "feature": "Digital charting and clinical forms",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pabau includes labs, prescriptions, and before/after photos"
        },
        {
          "feature": "Online booking and scheduling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Telehealth",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Waitlist and class booking management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Communications & AI",
      "rows": [
        {
          "feature": "AI receptionist for calls/texts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI clinical scribe agent",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Missed-call text automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted review response management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Internal team chat",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Payments & Access",
      "rows": [
        {
          "feature": "Point-of-sale payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Pabau Pay vs Weave text-to-pay/BNPL"
        },
        {
          "feature": "Insurance billing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No per-patient fees",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dedicated mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": "Pabau GO is iOS-only; Weave lists a general mobile app"
        },
        {
          "feature": "Published entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "£50/month vs $199/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Pabau cheaper than Weave?",
      "answer": "Pabau's published Starter plan is £50/month for 1 user, while Weave's Pro plan starts at $199/month. Both have higher tiers (Pabau's Solo through Enterprise, Weave's Elite and Ultimate) that require a custom quote."
    },
    {
      "question": "Does Weave offer clinical charting like Pabau?",
      "answer": "The facts do not document clinical charting, prescriptions, or telehealth for Weave; its feature set is built around communications, scheduling reminders, and payments rather than clinical documentation."
    },
    {
      "question": "Which tool has an AI receptionist?",
      "answer": "Weave's AI Receptionist automatically handles inbound voice calls and text messages. Pabau's AI agents instead focus on clinical work: a scribe agent for notes, a prescribing agent with safety checks, and a letters agent."
    },
    {
      "question": "Does Pabau charge per patient?",
      "answer": "No. Pabau states there are no per-patient fees on any pricing tier; pricing is based on the number of logged-in users."
    },
    {
      "question": "Is there a mobile app for either platform?",
      "answer": "Pabau offers Pabau GO for iPhone and iPad. Weave is described as accessible via web browser, desktop app, and mobile app, though the facts don't specify iOS versus Android support."
    },
    {
      "question": "Can insurance be billed through Weave?",
      "answer": "The facts don't document insurance billing for Weave. Pabau explicitly includes insurance billing as part of its payments and billing tools."
    }
  ]
};

export default pabauVsWeaveContent;
