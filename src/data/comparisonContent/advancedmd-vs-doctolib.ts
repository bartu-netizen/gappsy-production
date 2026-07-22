import type { ToolComparisonContent } from './types';

const advancedmdVsDoctolibContent: ToolComparisonContent = {
  "verdict": "AdvancedMD and Doctolib both touch healthcare scheduling, but they serve different layers of the system. AdvancedMD, founded in 1999 and based in South Jordan, Utah, is a US-focused practice management, certified EHR, and medical billing suite built for independent practices and billing companies managing revenue cycle operations. Doctolib, headquartered in Levallois-Perret, France, is a patient-facing appointment booking and video consultation platform covering 30+ medical specialties across France, Germany, and Italy. One is back-office clinical and financial infrastructure for US providers; the other is a European patient discovery and scheduling layer.",
  "bestForToolA": "US-based independent practices and medical billing companies that need certified EHR, claims scrubbing, and revenue cycle management, especially billing services managing multiple client practices from one account.",
  "bestForToolB": "Patients and providers in France, Germany, or Italy who want a public specialist directory for booking appointments and holding video consultations across 30+ medical specialties.",
  "whoNeedsBoth": "A healthcare group operating in both the US and Europe could run AdvancedMD for its American clinics' EHR and billing needs while listing its European locations on Doctolib for patient booking, though the two systems are not documented as integrating with each other.",
  "keyDifferences": [
    {
      "title": "Geographic Market",
      "toolA": "AdvancedMD is US-focused, headquartered in South Jordan, Utah, and built around US insurance and regulatory billing workflows.",
      "toolB": "Doctolib is headquartered in Levallois-Perret, France, and operates across France, Germany, and Italy.",
      "whyItMatters": "Neither product's documented workflows are built for markets outside their home region, which narrows the realistic buyer pool for each.",
      "benefitsWho": "Practices choosing a platform aligned to their country's insurance and regulatory environment."
    },
    {
      "title": "Core Function",
      "toolA": "AdvancedMD combines practice management, a certified EHR with specialty templates and e-prescribing, and medical billing with claims scrubbing and denial management.",
      "toolB": "Doctolib centers on online appointment booking, a specialist directory, and video consultations rather than clinical charting or billing.",
      "whyItMatters": "Buyers looking for a full clinical and financial system of record need very different depth than buyers looking for a patient booking front door.",
      "benefitsWho": "Practice administrators deciding between back-office software (AdvancedMD) and patient acquisition/scheduling tools (Doctolib)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "AdvancedMD uses custom, quote-based pricing, but publicly cited starting points run from roughly $429/provider/month (practice management + billing) up to about $729/provider/month (practice management + EHR), plus encounter-based billing at $0.87-$2.17 per claim.",
      "toolB": "Doctolib's pricing model and starting price are not published at all in the available facts.",
      "whyItMatters": "Even directional pricing benchmarks help buyers budget before entering a sales conversation.",
      "benefitsWho": "Finance teams trying to estimate cost before a vendor call."
    },
    {
      "title": "Billing and Revenue Cycle Management",
      "toolA": "AdvancedMD includes claims scrubbing, clearinghouse submission, denial management, and dedicated support for billing companies managing multiple client practices from one account.",
      "toolB": "No billing, claims, or revenue cycle management features are documented for Doctolib.",
      "whyItMatters": "Revenue cycle management is a distinct capability that determines whether a platform can replace a practice's billing workflow, not just its scheduling.",
      "benefitsWho": "Medical billing companies and practices that need claims and collections handled inside the same system as scheduling."
    },
    {
      "title": "Company Background",
      "toolA": "AdvancedMD, founded in 1999, has changed ownership multiple times -- Francisco Partners (2008), ADP (2011), Global Payments (2018), and Francisco Partners again in 2024.",
      "toolB": "Doctolib is B Corp certified, a distinction tied to social and environmental performance standards.",
      "whyItMatters": "Ownership history and certifications can signal stability or values alignment that some buyers weigh in vendor selection.",
      "benefitsWho": "Procurement teams performing vendor due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Clinical & Practice Management",
      "rows": [
        {
          "feature": "Certified EHR",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AdvancedMD offers this as an add-on module"
        },
        {
          "feature": "Appointment scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "E-prescribing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Specialist directory (30+ specialties)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Billing & Revenue",
      "rows": [
        {
          "feature": "Medical billing / claims scrubbing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Insurance eligibility verification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Multi-client billing company support",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "AdvancedMD is custom-quoted; Doctolib publishes no pricing information at all"
        }
      ]
    },
    {
      "group": "Patient-Facing Tools",
      "rows": [
        {
          "feature": "Patient portal / online intake",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Video consultations / telemedicine",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-country availability",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Doctolib operates in France, Germany, and Italy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between AdvancedMD and Doctolib?",
      "answer": "AdvancedMD is a US practice management, EHR, and medical billing suite for providers and billing companies. Doctolib is a European patient-facing appointment booking and video consultation platform. They serve different parts of the healthcare workflow in different regions."
    },
    {
      "question": "Does AdvancedMD handle medical billing?",
      "answer": "Yes -- it includes claims scrubbing, clearinghouse submission, denial management, and collections tracking, plus support for billing companies managing many client practices from one account."
    },
    {
      "question": "Does Doctolib include an EHR?",
      "answer": "No EHR or clinical documentation features are documented for Doctolib; its documented functionality centers on appointment booking, a specialist directory, and video consultations."
    },
    {
      "question": "How much does AdvancedMD cost?",
      "answer": "Pricing is custom and quote-based, but publicly cited starting points run roughly $429/provider/month for practice management plus billing, up to about $729/provider/month for practice management plus EHR; encounter-based billing runs about $0.87-$2.17 per claim."
    },
    {
      "question": "Is Doctolib available in the United States?",
      "answer": "No -- based on available facts, Doctolib operates in France, Germany, and Italy, not the US."
    },
    {
      "question": "Do both platforms offer telehealth or video visits?",
      "answer": "Yes. AdvancedMD offers native video visits that document and bill the encounter inside the same patient chart, and Doctolib offers video consultations directly through its platform."
    }
  ]
};

export default advancedmdVsDoctolibContent;
