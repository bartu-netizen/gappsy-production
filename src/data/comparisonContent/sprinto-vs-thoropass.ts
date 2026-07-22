import type { ToolComparisonContent } from './types';

const sprintoVsThoropassContent: ToolComparisonContent = {
  "verdict": "Sprinto and Thoropass both automate compliance work, but they bundle different things around it — Sprinto pairs its automation software with built-in lightweight MDM, 200+ integrations, and 1:1 expert guidance, while Thoropass pairs its software with an in-house licensed CPA audit firm and CREST-accredited penetration testing, so the audit itself happens under the same roof.",
  "bestForToolA": "Teams that want an ease-of-use-rated compliance dashboard with built-in device management (MDM) and hands-on 1:1 guidance, while using a separate external auditor.",
  "bestForToolB": "Teams that want to consolidate the formal audit itself (via Thoropass's affiliated CPA firm, Laika Compliance, LLC) and penetration testing alongside compliance software, rather than coordinating a separate audit firm.",
  "whoNeedsBoth": "Organizations juggling multiple frameworks sometimes run Sprinto for day-to-day control monitoring while engaging Thoropass specifically for the formal audit and penetration test deliverables auditors require.",
  "keyDifferences": [
    {
      "title": "Audit delivery model",
      "toolA": "Software plus 1:1 expert guidance; no mention of an owned or affiliated CPA firm performing the audit.",
      "toolB": "Bundles a licensed CPA audit firm (Laika Compliance, LLC) directly into the platform.",
      "whyItMatters": "Determines whether the actual attestation audit is performed in-house or must be sourced separately.",
      "benefitsWho": "Teams wanting a single vendor for both software and the audit itself (Thoropass)."
    },
    {
      "title": "Device management",
      "toolA": "Includes built-in lightweight Mobile Device Management (MDM).",
      "toolB": "No MDM capability documented.",
      "whyItMatters": "Reduces the need for a separate device management tool if MDM needs are basic.",
      "benefitsWho": "Small IT teams wanting to consolidate tooling (Sprinto)."
    },
    {
      "title": "Security testing services",
      "toolA": "Not documented.",
      "toolB": "Offers in-house CREST-accredited penetration testing and vulnerability scanning.",
      "whyItMatters": "Having pentesting under the same vendor can simplify audit evidence collection.",
      "benefitsWho": "Compliance teams needing pentest reports as part of their audit package (Thoropass)."
    },
    {
      "title": "Stated integration count",
      "toolA": "States 200+ integrations for continuous compliance risk visibility.",
      "toolB": "No specific integration count stated.",
      "whyItMatters": "A documented integration count signals breadth of automated evidence collection sources.",
      "benefitsWho": "Teams with a wide existing tool stack needing broad connector coverage (Sprinto)."
    },
    {
      "title": "Support model",
      "toolA": "Includes 1:1 expert guidance and 24/7 assistance as a stated feature.",
      "toolB": "No comparable guided-support feature documented; its differentiator is the bundled CPA firm instead.",
      "whyItMatters": "Hands-on guided support vs. audit-firm access represent different kinds of help during certification.",
      "benefitsWho": "First-time compliance teams wanting hand-holding through the process (Sprinto)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compliance Automation",
      "rows": [
        {
          "feature": "Continuous control/evidence monitoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Sprinto: 1M+ checks/month"
        },
        {
          "feature": "Multi-framework support",
          "toolA": "available",
          "toolB": "available",
          "note": "Thoropass names 9 frameworks plus 30+ more"
        },
        {
          "feature": "Policy templates",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Audit & Security Testing",
      "rows": [
        {
          "feature": "In-house/affiliated CPA audit firm",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Laika Compliance, LLC"
        },
        {
          "feature": "Penetration testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Vulnerability scanning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Support & Extras",
      "rows": [
        {
          "feature": "Built-in device management (MDM)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "1:1 / 24-7 expert guidance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Stated integration count",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Sprinto: 200+"
        }
      ]
    },
    {
      "group": "Trust & Pricing",
      "rows": [
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Customer/trust signal",
          "toolA": "available",
          "toolB": "available",
          "note": "Sprinto: #1 ease-of-use on G2, 900+ customers; Thoropass: 1,000+ organizations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What does each platform automate?",
      "answer": "Sprinto automates SOC 2 and other compliance work, evaluating over 1 million compliance checks monthly; Thoropass combines a licensed CPA audit firm (Laika Compliance, LLC) with AI-assisted software covering SOC 2, ISO 27001, and 30+ other frameworks end-to-end."
    },
    {
      "question": "Does either include device management?",
      "answer": "Sprinto includes a built-in lightweight Mobile Device Management (MDM) capability; Thoropass's facts don't mention an MDM feature."
    },
    {
      "question": "Does either offer penetration testing?",
      "answer": "Thoropass offers CREST-accredited penetration testing with audit-ready reporting; Sprinto's facts don't describe a penetration testing feature."
    },
    {
      "question": "How many integrations does Sprinto support?",
      "answer": "Sprinto supports 200+ integrations for continuous compliance risk visibility; Thoropass's facts don't state a specific integration count."
    },
    {
      "question": "Is pricing public for either platform?",
      "answer": "No — neither publishes pricing. Sprinto's site doesn't list specific plans, and Thoropass pricing varies by frameworks pursued, audit scope, company size, and required services as a tailored quote."
    }
  ]
};

export default sprintoVsThoropassContent;
