import type { ToolComparisonContent } from './types';

const doctolibVsTheranestContent: ToolComparisonContent = {
  "verdict": "Doctolib and TheraNest both serve healthcare, but from opposite sides of the relationship. Doctolib, headquartered in Levallois-Perret, France, is a patient-facing platform for finding and booking appointments across 30+ medical specialties in France, Germany, and Italy, with video consultations and mobile apps. TheraNest, now under parent company Ensora Health, is a practice-management EHR built specifically for mental health practitioners, with AI-assisted progress notes, automated insurance billing, and a 21-day free trial. Doctolib is where patients discover and book providers; TheraNest is the back-office system those providers (specifically therapists) run their practice on.",
  "bestForToolA": "Doctolib fits patients in France, Germany, or Italy searching for and booking appointments across 30+ medical specialties, or healthcare providers in those markets wanting a booking and video-consultation platform to reach patients.",
  "bestForToolB": "TheraNest fits solo mental health practitioners and group therapy practices needing an EHR with AI-assisted session notes, automated insurance billing, a client portal, and HIPAA/HITRUST-compliant secure messaging, with a 21-day free trial to evaluate it.",
  "whoNeedsBoth": "A therapy practice with a presence in a Doctolib market (France, Germany, or Italy) could use Doctolib as its patient-facing booking channel to attract new clients, while running TheraNest as its internal EHR and practice-management system for session notes, insurance billing, and HIPAA-compliant client records — the two would serve the front-of-house and back-office needs of the same practice.",
  "keyDifferences": [
    {
      "title": "Primary User",
      "toolA": "Doctolib is patient-facing: patients search for providers and book appointments directly, with video consultations available.",
      "toolB": "TheraNest is practitioner-facing: it's an EHR and practice-management system that therapists and clinics use to run session notes, billing, and scheduling.",
      "whyItMatters": "Doctolib is a discovery/booking channel, while TheraNest is internal operational software — buyers evaluating one aren't necessarily evaluating the other for the same purpose.",
      "benefitsWho": "Patients and the general public benefit from Doctolib's booking interface; therapy practice owners and clinicians benefit from TheraNest's practice-management tools."
    },
    {
      "title": "Specialty Focus",
      "toolA": "Doctolib's directory spans 30+ medical specialties, including general practitioners, dentists, pediatricians, gynecologists, dermatologists, and cardiologists.",
      "toolB": "TheraNest is built specifically for mental health practitioners: therapists, counselors, psychiatrists, and marriage/family therapists.",
      "whyItMatters": "A general medical directory serves broad healthcare discovery, while a specialty EHR is purpose-built for one field's workflows, like therapy session notes and treatment plans.",
      "benefitsWho": "General practice patients and providers benefit from Doctolib's broad specialty coverage; mental health clinicians benefit from TheraNest's therapy-specific workflows."
    },
    {
      "title": "Geographic Availability",
      "toolA": "Doctolib operates in France, Germany, and Italy, per its documented facts, with limited availability elsewhere.",
      "toolB": "TheraNest's documented facts do not specify a geographic restriction, and it operates under parent company Ensora Health with a redirect from theranest.com to ensorahealth.com.",
      "whyItMatters": "Geographic coverage is a hard eligibility filter for patients or providers outside Doctolib's three supported countries.",
      "benefitsWho": "Providers and patients in France, Germany, or Italy benefit from Doctolib; TheraNest's availability is not documented as geographically restricted."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Doctolib's documented facts do not mention AI-specific features.",
      "toolB": "TheraNest includes an AI Session Assistant that generates automated progress notes from therapy sessions.",
      "whyItMatters": "AI-assisted note generation directly reduces clinician administrative time after each session, a specific documented pain point for therapists.",
      "benefitsWho": "Individual therapists wanting to reduce documentation time benefit from TheraNest's AI Session Assistant."
    },
    {
      "title": "Compliance and Billing",
      "toolA": "Doctolib is B Corp certified but its documented facts do not mention HIPAA/insurance billing automation, consistent with its focus on the European patient-booking market rather than US-style insurance workflows.",
      "toolB": "TheraNest is HITRUST certified and HIPAA compliant, with automated insurance claims processing built in.",
      "whyItMatters": "US-style automated insurance billing and HIPAA/HITRUST certification are specific requirements for American mental health practices that a booking platform like Doctolib does not address.",
      "benefitsWho": "US-based therapy practices handling insurance claims benefit from TheraNest's automated billing and HIPAA/HITRUST compliance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Patient-Facing Booking",
      "rows": [
        {
          "feature": "Online appointment booking for patients",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Video consultations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Multi-specialty provider directory",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Doctolib: 30+ specialties"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Practice Management (EHR)",
      "rows": [
        {
          "feature": "AI-assisted progress notes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated insurance billing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Client portal (intake forms, appointment requests)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "HIPAA/HITRUST compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-location practice management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Secure practitioner-client messaging",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Access & Trust",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "TheraNest: 21-day free trial"
        },
        {
          "feature": "Published subscription pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither publishes pricing"
        },
        {
          "feature": "B Corp certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Geographic market restriction",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Doctolib: France, Germany, Italy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Doctolib and TheraNest competitors?",
      "answer": "No. Doctolib is a patient-facing appointment booking platform across 30+ medical specialties in France, Germany, and Italy. TheraNest is a practice-management EHR built specifically for mental health practitioners. They serve different sides of the healthcare relationship."
    },
    {
      "question": "Is TheraNest available outside the US?",
      "answer": "TheraNest's documented facts do not specify a geographic restriction, unlike Doctolib, which explicitly operates in France, Germany, and Italy."
    },
    {
      "question": "Does Doctolib offer a free trial like TheraNest?",
      "answer": "TheraNest documents a 21-day free trial. Doctolib's documented facts do not mention a free trial, and its pricing for practitioners is not published on the site at all."
    },
    {
      "question": "Which tool is HIPAA compliant?",
      "answer": "TheraNest is HITRUST certified and HIPAA compliant, with automated insurance claims processing. Doctolib's documented facts do not mention HIPAA compliance; it is B Corp certified and operates primarily in European markets with different regulatory frameworks."
    },
    {
      "question": "Does either platform use AI?",
      "answer": "TheraNest includes an AI Session Assistant that generates automated progress notes from therapy sessions. Doctolib's documented facts do not mention AI features."
    },
    {
      "question": "Could a therapy practice use both Doctolib and TheraNest?",
      "answer": "Yes, if the practice operates in France, Germany, or Italy: Doctolib could serve as the patient-facing booking and video-consultation channel, while TheraNest runs the practice's internal EHR, session notes, and insurance billing."
    }
  ]
};

export default doctolibVsTheranestContent;
