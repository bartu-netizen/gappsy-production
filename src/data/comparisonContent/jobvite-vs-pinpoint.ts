import type { ToolComparisonContent } from './types';

const jobviteVsPinpointContent: ToolComparisonContent = {
  "verdict": "Jobvite and Pinpoint are both quote-only AI-enabled ATS platforms with no public pricing, but they differ in how their AI is packaged and how their compliance credentials are documented: Jobvite sells AI (candidate matching, AI Interview Companion) as add-on modules on top of a core ATS and is backed by Employ Inc. (which also owns JazzHR and Lever), while Pinpoint bundles a suite of named AI tools (Hiring Copilot, Match Score, Notetaker) more tightly into its core product and lists specific security certifications (ISO 27001, ISO 42001, SOC 2, GDPR).",
  "bestForToolA": "Best for buyers who want a modular pricing approach — paying only for the ATS modules they need (Onboarding, AI Companion, Recruitment Marketing) — and who value being part of the Employ Inc. family alongside JazzHR and Lever.",
  "bestForToolB": "Best for buyers who want a broader AI toolset built into the core ATS (Hiring Copilot, Match Score, Candidate Filters, Criteria Checklist, Notetaker) plus documented ISO 27001, ISO 42001, SOC 2, and GDPR certifications, and who value strong third-party ratings (G2 4.8/5, Capterra 4.8/5).",
  "whoNeedsBoth": "An enterprise TA function evaluating multiple ATS vendors for compliance-sensitive procurement would need to request demos and quotes from both, since neither publishes pricing and both require direct vendor engagement to compare total cost.",
  "keyDifferences": [
    {
      "title": "AI tool breadth",
      "toolA": "Jobvite offers AI candidate matching (with match explanations) and an AI Interview Companion for structured interviews.",
      "toolB": "Pinpoint documents five named AI tools: AI Hiring Copilot, AI Match Score, AI Candidate Filters, AI Criteria Checklist, and an AI Notetaker.",
      "whyItMatters": "A broader, more granular set of named AI tools can mean more specific automation coverage across the hiring workflow (filtering, note-taking, scoring) rather than matching alone.",
      "benefitsWho": "Recruiting teams wanting AI assistance at multiple discrete steps of the hiring process, not just candidate matching."
    },
    {
      "title": "Security/compliance certifications documented",
      "toolA": "Jobvite's facts don't list specific security certifications.",
      "toolB": "Pinpoint documents ISO 27001, ISO 42001, SOC 2, and GDPR certification.",
      "whyItMatters": "Documented certifications matter for security reviews, especially ISO 42001 which specifically covers AI management systems.",
      "benefitsWho": "Enterprises with formal security/compliance review requirements for new HR tech vendors."
    },
    {
      "title": "Pricing model structure",
      "toolA": "Jobvite uses a modular, quote-based model where customers add modules like Onboarding or AI Companion to a core ATS.",
      "toolB": "Pinpoint's facts describe quote-only pricing without documenting a modular add-on structure.",
      "whyItMatters": "A modular pricing structure can let buyers control cost by only paying for modules they actually need.",
      "benefitsWho": "Cost-conscious buyers who want to start with a core ATS and add specific modules later as needs grow."
    },
    {
      "title": "Company backing and ownership",
      "toolA": "Jobvite is part of Employ Inc., which also owns JazzHR and Lever.",
      "toolB": "No parent company or ownership structure is documented for Pinpoint in the facts provided.",
      "whyItMatters": "Vendor ownership and portfolio context can matter for roadmap and long-term product-support considerations.",
      "benefitsWho": "Buyers who factor vendor ownership and portfolio stability into procurement decisions."
    },
    {
      "title": "Integration ecosystem",
      "toolA": "Jobvite's facts don't document a specific integration count or named integration partners.",
      "toolB": "Pinpoint documents 100+ native integrations including Slack, LinkedIn, Indeed, Rippling, BambooHR, Checkr, DocuSign, and Microsoft Teams, plus an open API.",
      "whyItMatters": "Specifically named integrations make it easier to confirm compatibility with an existing HR tech stack before buying.",
      "benefitsWho": "Teams already using tools like BambooHR, Rippling, or Checkr who want confirmed native integration support."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Hiring Tools",
      "rows": [
        {
          "feature": "AI candidate matching",
          "toolA": "available",
          "toolB": "available",
          "note": "Jobvite includes match explanations; Pinpoint calls this AI Match Score."
        },
        {
          "feature": "AI interview assistance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Jobvite: AI Interview Companion."
        },
        {
          "feature": "AI meeting/interview notetaker",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI candidate filtering / criteria checklist",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Core ATS & Workflow",
      "rows": [
        {
          "feature": "Applicant tracking system",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Career sites",
          "toolA": "available",
          "toolB": "available",
          "note": "Pinpoint's are described as multilingual and branded."
        },
        {
          "feature": "Recruitment marketing / employer branding",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Onboarding module",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Analytics dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Jobvite: 60+ dashboards/reports. Pinpoint: executive dashboards, time-to-hire metrics."
        }
      ]
    },
    {
      "group": "Compliance, Integrations & Pricing",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Named security/compliance certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pinpoint: ISO 27001, ISO 42001, SOC 2, GDPR."
        },
        {
          "feature": "Documented integration count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pinpoint: 100+ native integrations plus open API."
        },
        {
          "feature": "Modular add-on pricing structure",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Jobvite and Pinpoint publish pricing?",
      "answer": "No — neither publishes pricing on-site. Both require a custom quote request."
    },
    {
      "question": "What AI tools does each platform include?",
      "answer": "Jobvite offers AI candidate matching with match explanations and an AI Interview Companion. Pinpoint offers AI Hiring Copilot, AI Match Score, AI Candidate Filters, AI Criteria Checklist, and an AI Notetaker."
    },
    {
      "question": "Which platform has documented security certifications?",
      "answer": "Pinpoint documents ISO 27001, ISO 42001, SOC 2, and GDPR certification. Specific certifications aren't listed among Jobvite's facts."
    },
    {
      "question": "Who owns Jobvite?",
      "answer": "Jobvite is part of Employ Inc., which also owns JazzHR and Lever."
    },
    {
      "question": "How many integrations does Pinpoint offer?",
      "answer": "Pinpoint lists 100+ native integrations, including Slack, LinkedIn, Indeed, Rippling, BambooHR, Checkr, DocuSign, and Microsoft Teams, plus an open API."
    },
    {
      "question": "Is Jobvite's pricing modular?",
      "answer": "Yes — Jobvite uses a modular, quote-based model where customers add modules like Onboarding or the AI Companion to a core ATS."
    }
  ]
};

export default jobviteVsPinpointContent;
