import type { ToolComparisonContent } from './types';

const drchronoVsSimplepracticeContent: ToolComparisonContent = {
  "verdict": "DrChrono and SimplePractice both bundle EHR, scheduling, billing, and telehealth into one platform, but they are built for different corners of healthcare. DrChrono is a general medical EHR aimed at physician-led practices that need controlled substance e-prescribing (EPCS), tiered billing options up to a fully outsourced revenue cycle management service, and an open API with an app marketplace for connecting labs and specialty tools. Its native iPad and iPhone charting app is built specifically for point-of-care documentation. SimplePractice is purpose-built for therapists, counselors, dietitians, and other behavioral health and wellness professionals, with published per-clinician pricing starting at 49 dollars a month, documentation templates tailored to behavioral health, and an optional AI note-taking add-on. Where DrChrono leans on custom quotes and a steeper setup process in exchange for medical-specialty depth and billing flexibility, SimplePractice trades some of that depth and open API access for transparent pricing and a gentler learning curve aimed at solo and small group wellness practices. Neither tool is a strict upgrade over the other. The right choice depends on whether a practice is diagnosing and prescribing for medical conditions across specialties, or delivering talk therapy and wellness services where documentation, scheduling, and client communication matter more than complex medical billing and controlled substance prescribing.",
  "bestForToolA": "DrChrono fits physician-led medical practices that need controlled substance e-prescribing (EPCS), specialty-specific charting, and the option to outsource billing through a full revenue cycle management tier.",
  "bestForToolB": "SimplePractice fits therapists, counselors, dietitians, and other wellness professionals who want transparent per-clinician pricing, behavioral health documentation templates, and built-in telehealth without a medical billing learning curve.",
  "whoNeedsBoth": "A multi-specialty group that includes both medical providers and behavioral health or wellness clinicians could reasonably run DrChrono for the medical side and SimplePractice for the therapy or wellness side rather than forcing both into one platform.",
  "keyDifferences": [
    {
      "title": "Primary specialty focus",
      "toolA": "Built as a general medical EHR for physician-led practices across specialties, with charting, e-prescribing, and billing centered on medical care.",
      "toolB": "Built specifically for therapists, counselors, dietitians, and other behavioral health and wellness professionals, with documentation templates tailored to those fields.",
      "whyItMatters": "A tool designed around a different specialty workflow can leave gaps in documentation, coding, or prescribing that matter every day, not just occasionally.",
      "benefitsWho": "Physicians and medical specialists benefit from DrChrono, while therapists and wellness practitioners benefit from SimplePractice."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Pricing is custom-quoted per provider per month across three tiers, with no published rate on the website.",
      "toolB": "Pricing is published, starting at 49 dollars per month per clinician on the Starter plan and rising to 99 dollars on the Plus plan.",
      "whyItMatters": "Published pricing lets a solo practitioner budget immediately, while custom quotes require a sales conversation before knowing the real cost.",
      "benefitsWho": "Small practices and solo clinicians who want to compare costs quickly benefit from SimplePractice's published pricing, while larger practices open to negotiating a custom package may prefer DrChrono's tiered quote model."
    },
    {
      "title": "Controlled substance e-prescribing",
      "toolA": "Includes e-prescribing of controlled substances (EPCS) as a built-in capability within the clinical chart.",
      "toolB": "Documented pricing notes mention e-prescribing as an add-on that increases plan cost, but EPCS support specifically is not documented.",
      "whyItMatters": "Practices that prescribe controlled medications need EPCS support confirmed rather than assumed, since this is a regulated capability.",
      "benefitsWho": "Prescribing physicians benefit from DrChrono's documented EPCS support."
    },
    {
      "title": "Billing depth and outsourced revenue cycle management",
      "toolA": "Offers claim scrubbing and submission on mid-tier plans plus a top Elite tier where DrChrono's own billing team handles full-service revenue cycle management.",
      "toolB": "Offers real-time eligibility checks, electronic claim submission, invoicing, and superbills, but no documented option to outsource the entire billing and collections process to the vendor.",
      "whyItMatters": "Practices that want to hand off collections entirely rather than manage claims in-house need a vendor that documents that service.",
      "benefitsWho": "Medical practices wanting outsourced billing benefit from DrChrono, while practices comfortable handling their own claims and invoicing can rely on SimplePractice's built-in tools."
    },
    {
      "title": "Native tablet-optimized charting",
      "toolA": "Provides a native iPad and iPhone app for charting, scheduling, and e-prescribing at the point of care.",
      "toolB": "Provides iOS and Android mobile apps for clinicians and clients, without a documented tablet-specific charting design.",
      "whyItMatters": "A tablet-first charting experience matters more in exam-room workflows where a clinician documents while examining a patient.",
      "benefitsWho": "Clinicians who chart during in-person exams benefit from DrChrono's iPad-native design, while clinicians and clients who mostly need phone-based scheduling and messaging are covered by SimplePractice's broader mobile coverage."
    },
    {
      "title": "Open API and third-party integrations",
      "toolA": "Publishes an open API and maintains an app marketplace for connecting labs, imaging, and other specialty systems.",
      "toolB": "Documented as having limited flexibility for practices wanting deep customization or open API integrations.",
      "whyItMatters": "Practices relying on specialty diagnostic equipment or external lab systems need direct integration options rather than workarounds.",
      "benefitsWho": "Practices needing lab or imaging integrations benefit from DrChrono, while practices with simpler, self-contained workflows are not limited by SimplePractice's narrower integration options."
    },
    {
      "title": "AI-assisted documentation",
      "toolA": "Supports dictation and speech-to-text for faster note-taking, without a documented generative note-drafting feature.",
      "toolB": "Offers an optional AI Note Taker add-on that drafts session documentation from audio.",
      "whyItMatters": "Speech-to-text transcribes what is said, while an AI note drafting tool goes a step further and organizes it into a note format, changing how much editing a clinician does afterward.",
      "benefitsWho": "Clinicians wanting drafted notes rather than raw transcription benefit from SimplePractice's AI Note Taker add-on."
    },
    {
      "title": "Free access options",
      "toolA": "Offers a no-cost base plan with limited scheduling and charting functionality, though full EHR, e-prescribing, and billing require a paid plan.",
      "toolB": "Offers a free trial period rather than a permanent free plan, with all tiers requiring payment afterward.",
      "whyItMatters": "A permanent limited free plan lets a practice keep using the core product indefinitely at no cost, while a trial has a hard cutoff.",
      "benefitsWho": "Practices wanting an indefinite no-cost option benefit from DrChrono's free base plan, while practices fine committing after a trial period can move straight into SimplePractice's paid tiers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Clinical documentation",
      "rows": [
        {
          "feature": "Customizable specialty templates",
          "toolA": "available",
          "toolB": "available",
          "note": "DrChrono templates are specialty-configurable per provider; SimplePractice templates are tailored to behavioral health and wellness."
        },
        {
          "feature": "Dictation and speech-to-text",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI-assisted note drafting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Offered as a paid add-on on SimplePractice."
        }
      ]
    },
    {
      "group": "Prescribing",
      "rows": [
        {
          "feature": "Standard e-prescribing",
          "toolA": "available",
          "toolB": "limited",
          "note": "SimplePractice pricing notes reference e-prescribing as an add-on that increases plan cost."
        },
        {
          "feature": "E-prescribing of controlled substances (EPCS)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Scheduling and patient engagement",
      "rows": [
        {
          "feature": "Online self-scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "Via OnPatient portal on DrChrono."
        },
        {
          "feature": "Automated appointment reminders",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Client or patient portal",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Secure messaging",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Telehealth",
      "rows": [
        {
          "feature": "Built-in video visits",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Group telehealth sessions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on SimplePractice's Plus plan."
        }
      ]
    },
    {
      "group": "Billing and insurance",
      "rows": [
        {
          "feature": "Insurance eligibility verification",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Electronic claim submission",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Full-service outsourced revenue cycle management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DrChrono's Elite tier only."
        },
        {
          "feature": "Online bill payment and superbills",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile and platform",
      "rows": [
        {
          "feature": "iOS mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Android mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native tablet-optimized charting interface",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Integrations and API",
      "rows": [
        {
          "feature": "Open API for custom integrations",
          "toolA": "available",
          "toolB": "limited",
          "note": ""
        },
        {
          "feature": "Third-party app marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Practice management",
      "rows": [
        {
          "feature": "Multi-clinician group practice management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Reporting and analytics dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": "SimplePractice analytics dashboard is on higher-tier plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, DrChrono or SimplePractice?",
      "answer": "SimplePractice publishes its pricing starting at 49 dollars per month per clinician, while DrChrono requires a custom quote per provider per month, so there is no direct published price to compare, though DrChrono's documented cons note additional add-on and revenue cycle management fees that can add to total cost."
    },
    {
      "question": "Is SimplePractice or DrChrono better for therapists?",
      "answer": "SimplePractice is better for therapists, counselors, dietitians, and other wellness professionals because its documentation templates, pricing, and workflow are built specifically for behavioral health and wellness practices, while DrChrono is built as a general medical EHR."
    },
    {
      "question": "Does DrChrono support e-prescribing of controlled substances?",
      "answer": "Yes, DrChrono includes built-in e-prescribing of controlled substances (EPCS) as part of its clinical charting features, letting clinicians send both standard and controlled-substance prescriptions from the chart."
    },
    {
      "question": "Can SimplePractice handle full medical billing and revenue cycle management the way DrChrono does?",
      "answer": "Not based on documented features. SimplePractice offers insurance eligibility checks, electronic claim submission, invoicing, and superbills, but it does not document a full-service, outsourced revenue cycle management option the way DrChrono's Elite tier does."
    },
    {
      "question": "Does either DrChrono or SimplePractice have a free plan?",
      "answer": "DrChrono offers a no-cost base plan with limited scheduling and charting functionality, while SimplePractice offers a free trial period rather than a permanent free tier, so DrChrono is the one with an ongoing free option."
    },
    {
      "question": "Which tool has a native iPad app for charting?",
      "answer": "DrChrono has a native iPad and iPhone app built for charting, scheduling, and e-prescribing at the point of care, while SimplePractice offers iOS and Android apps without a documented tablet-specific charting design."
    }
  ]
};

export default drchronoVsSimplepracticeContent;
