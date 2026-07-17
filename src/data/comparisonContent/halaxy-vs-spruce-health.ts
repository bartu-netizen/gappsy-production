import type { ToolComparisonContent } from './types';

const halaxyVsSpruceHealthContent: ToolComparisonContent = {
  "verdict": "Halaxy is a free, Australia-oriented practice management platform covering scheduling, patient records, clinical invoicing, and Medicare/DVA/NDIS rebates, monetized through per-credit add-ons. Spruce Health is a paid, US-focused HIPAA-compliant communications platform built around secure messaging, texting, video visits, e-fax, and VoIP, charged at a flat $24-$49 per user per month with effectively unlimited usage. They serve different core jobs: Halaxy runs the back-office practice, while Spruce runs patient and team communications.",
  "bestForToolA": "Halaxy fits an Australian health practitioner who wants a free, unlimited core practice management system with built-in Medicare, DVA, and NDIS rebate processing, clinical invoicing, and 700+ clinical templates.",
  "bestForToolB": "Spruce Health fits a US-based healthcare team that wants a HIPAA-compliant communications hub for secure messaging, two-way texting, video visits, e-fax, and VoIP with a HIPAA BAA included, starting at $24/user/month with effectively unlimited usage.",
  "whoNeedsBoth": "An Australian practice with US-facing telehealth or communications needs, or any practice wanting to pair free Australian-focused practice management with a dedicated US-style HIPAA communications layer, could plausibly run Halaxy for scheduling/records/rebates alongside Spruce for messaging, texting, video, and e-fax, since the two tools cover largely non-overlapping functions.",
  "keyDifferences": [
    {
      "title": "Core Focus",
      "toolA": "Halaxy is a practice management/EHR-adjacent platform covering scheduling, patient records, clinical invoicing, and rebate processing.",
      "toolB": "Spruce Health is a HIPAA-compliant communications platform covering secure messaging, texting, video telehealth, e-fax, and VoIP, not a scheduling or billing system.",
      "whyItMatters": "Buyers need to know whether they're evaluating a back-office practice system or a patient/team communications tool, since they solve different jobs.",
      "benefitsWho": "Practices needing appointment and billing infrastructure benefit from Halaxy; practices needing communications infrastructure benefit from Spruce."
    },
    {
      "title": "Pricing Model",
      "toolA": "Halaxy's core platform is free with pay-per-credit add-ons (roughly AUD $0.15-$0.22 per credit) for SMS, rebates, e-scripts, and AI Scribe.",
      "toolB": "Spruce charges a flat per-user monthly fee ($24 Basic or $49 Communicator) with effectively unlimited usage and no per-text, per-call, or per-fax charges.",
      "whyItMatters": "Teams with high communication volume may prefer Spruce's flat unlimited pricing, while low-volume Australian practices benefit from Halaxy's free core plus pay-as-you-go add-ons.",
      "benefitsWho": "High-volume communicators benefit from Spruce's flat unlimited-usage pricing; low-add-on-usage Australian practices benefit from Halaxy's free core."
    },
    {
      "title": "Communications Depth",
      "toolA": "Halaxy's documented telehealth is built into appointment scheduling, without named e-fax, VoIP, or team task management features.",
      "toolB": "Spruce documents e-fax, a VoIP phone system with IVR (Communicator plan), AI voicemail transcription, and internal team messaging with task assignment.",
      "whyItMatters": "Teams needing a dedicated medical phone number, fax, or call routing need communications-specific features that only Spruce documents.",
      "benefitsWho": "Healthcare teams needing fax, phone routing, or internal task management benefit from Spruce's communications feature depth."
    },
    {
      "title": "Clinical Practice Management Depth",
      "toolA": "Halaxy documents clinical invoicing, Medicare/DVA/NDIS rebate processing, financial reporting, and 700+ clinical tools/templates.",
      "toolB": "Spruce's documented features don't include clinical invoicing, rebate processing, or clinical templates, only general 'digital payments' collection.",
      "whyItMatters": "Practices needing billing and clinical documentation tools in the same platform need Halaxy's practice management depth, since Spruce doesn't document these.",
      "benefitsWho": "Practices wanting billing and clinical records handled in the same tool benefit from Halaxy's practice management features."
    },
    {
      "title": "Geographic and Regulatory Framing",
      "toolA": "Halaxy is built around Australian funding bodies (Medicare, DVA, NDIS).",
      "toolB": "Spruce is framed around US HIPAA compliance, with a Business Associate Agreement (BAA) included on both the Basic and Communicator plans.",
      "whyItMatters": "Regulatory and funding-body alignment differs by country, so practitioners should match the tool to their operating region.",
      "benefitsWho": "US-based healthcare teams needing HIPAA BAAs benefit from Spruce; Australian practitioners needing Medicare/DVA/NDIS support benefit from Halaxy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Communication Tools",
      "rows": [
        {
          "feature": "Secure messaging",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Video telehealth",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "E-fax",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Two-way SMS texting",
          "toolA": "available",
          "toolB": "available",
          "note": "Halaxy: per-credit add-on; Spruce: flat pricing plus a one-time $19.50 registration fee"
        },
        {
          "feature": "VoIP phone system",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spruce Communicator plan, $49/user/month"
        }
      ]
    },
    {
      "group": "Practice Management",
      "rows": [
        {
          "feature": "Clinical invoicing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Funding body rebate processing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Medicare, DVA, NDIS"
        },
        {
          "feature": "Clinical tools/templates library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Halaxy: 700+ included free"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free core plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Spruce starts at $24/user/month"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spruce: 14 days, no credit card"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Halaxy: paid Subscription tier; Spruce: Communicator plan only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Halaxy free while Spruce Health is not?",
      "answer": "Halaxy's core practice management platform is free with unlimited use, while Spruce Health is paid starting at $24/user/month, though it offers a 14-day free trial."
    },
    {
      "question": "Does Halaxy include e-fax or VoIP like Spruce?",
      "answer": "No, Halaxy's documented features don't include e-fax or a VoIP phone system; Spruce documents both, with VoIP available on its Communicator plan."
    },
    {
      "question": "Does Spruce Health handle Medicare/insurance rebates?",
      "answer": "This isn't documented in Spruce's feature set. Halaxy explicitly processes Medicare, DVA, and NDIS rebates."
    },
    {
      "question": "How is Spruce Health priced?",
      "answer": "Spruce charges $24/user/month for Basic and $49/user/month for Communicator, with effectively unlimited texting, calling, and faxing included, plus a one-time $19.50 SMS registration fee."
    },
    {
      "question": "Which is better for a solo Australian practitioner vs. a US healthcare team?",
      "answer": "Halaxy's free core platform and Medicare/DVA/NDIS rebate support fit Australian practitioners, while Spruce's HIPAA BAA and US-focused communications tools fit US healthcare teams."
    },
    {
      "question": "Do both offer API access?",
      "answer": "Yes, Halaxy offers API access on its paid Subscription tier (from 25 credits/month), and Spruce offers API access only on its Communicator plan ($49/user/month)."
    }
  ]
};

export default halaxyVsSpruceHealthContent;
