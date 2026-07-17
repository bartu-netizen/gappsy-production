import type { ToolComparisonContent } from './types';

const mendIoVsVeracodeContent: ToolComparisonContent = {
  "verdict": "Mend.io and Veracode are both enterprise application security platforms combining SCA, SAST, and AI-assisted remediation, but they differ in disclosed pricing and product breadth. Mend.io publishes transparent per-developer annual pricing (up to $1,000/developer/year for AppSec) and has expanded into dedicated AI model/agent security with its Mend AI product, while Veracode discloses no public pricing at all and instead emphasizes platform breadth — SAST, DAST, SCA, container security, and Penetration Testing as a Service (PTaaS) — plus a reported 1.1% false-positive rate and a scale claim of 1.5M+ applications scanned. Buyers who want upfront pricing and dedicated AI governance tooling should look closely at Mend.io; buyers who want an all-in-one platform including PTaaS and are prepared for a custom sales process should look at Veracode.",
  "bestForToolA": "Mend.io fits teams that want transparent per-developer pricing and dedicated AI-BOM, Shadow AI discovery, and automated AI red teaming alongside traditional SCA and SAST, used by enterprises like Microsoft, Google, Vodafone, Yahoo, and Siemens.",
  "bestForToolB": "Veracode fits enterprises that want one platform spanning SAST, DAST, SCA, container security, and Penetration Testing as a Service (PTaaS) together, with AI-powered remediation via its Fix feature and a documented 1.1% false-positive rate.",
  "whoNeedsBoth": "A large enterprise with both a mature application portfolio and emerging AI product lines might run Veracode for its broad SAST/DAST/SCA/PTaaS coverage across existing applications while adding Mend.io's Mend AI product specifically for AI-BOM discovery and automated red teaming of newer AI models and agents that Veracode's documented feature set doesn't specifically address.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Mend.io publishes specific per-developer annual pricing: up to $1,000/developer/year for Mend AppSec, up to $300/developer/year for Mend AI, and up to $250/developer/year for Mend Renovate Enterprise.",
      "toolB": "Veracode does not publish pricing; organizations must contact sales or request a demo for a custom quote, and no free trial is stated on the site.",
      "whyItMatters": "Published pricing lets buyers budget-screen a vendor early; fully custom pricing extends the sales cycle before cost is known.",
      "benefitsWho": "Procurement and finance teams doing early vendor comparison benefit from Mend.io's published price points."
    },
    {
      "title": "AI Security Product Depth",
      "toolA": "Mend.io has a dedicated Mend AI product covering AI-BOM and Shadow AI discovery, automated AI red teaming, and system prompt hardening, priced separately up to $300/developer/year.",
      "toolB": "Veracode's Fix feature uses AI to automate remediation of flagged vulnerabilities, but its documented features do not include a dedicated AI model/agent discovery or red-teaming product comparable to Mend AI.",
      "whyItMatters": "Securing AI models and agents themselves (not just using AI to fix code) is an emerging, distinct requirement for organizations deploying AI features.",
      "benefitsWho": "Teams specifically needing to govern AI models, agents, and shadow AI usage benefit from Mend.io's dedicated Mend AI product."
    },
    {
      "title": "Penetration Testing",
      "toolA": "Mend.io's documented features do not include a penetration testing service; DAST and API security testing are available only as separate, custom-priced add-ons.",
      "toolB": "Veracode offers Penetration Testing as a Service (PTaaS) bundled with Security Labs and eLearning modules for developer training as part of its platform.",
      "whyItMatters": "Access to human-led penetration testing alongside automated scanning provides a different layer of assurance that automated tools alone don't fully replicate.",
      "benefitsWho": "Organizations needing compliance-driven penetration testing as part of their AppSec program benefit from Veracode's built-in PTaaS offering."
    },
    {
      "title": "Reported Scale & Accuracy",
      "toolA": "Mend.io states it is used by large enterprises including Microsoft, Google, Vodafone, Yahoo, and Siemens, without a published false-positive rate or applications-scanned figure.",
      "toolB": "Veracode reports a 1.1% false-positive rate and states it has scanned over 1.5M applications and 471T+ lines of code, with 148M+ flaws fixed.",
      "whyItMatters": "Concrete accuracy and scale metrics help buyers gauge scanner reliability and reduce time spent triaging false positives.",
      "benefitsWho": "Security teams concerned about alert fatigue from false positives may weigh Veracode's specifically documented 1.1% false-positive rate."
    },
    {
      "title": "Dependency Automation",
      "toolA": "Mend Renovate automates dependency updates at scale with Merge Confidence ratings and workflows, available as a standalone Enterprise product up to $250/developer/year.",
      "toolB": "Veracode's documented features do not include an automated dependency-update product comparable to Mend Renovate; its SCA feature identifies vulnerabilities in dependencies but automated patching isn't detailed.",
      "whyItMatters": "Automated dependency patching reduces manual remediation work after vulnerable open-source components are identified.",
      "benefitsWho": "Engineering teams with large dependency trees benefit from Mend Renovate's automated update workflows, a capability not documented for Veracode."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core AppSec Testing",
      "rows": [
        {
          "feature": "SAST",
          "toolA": "available",
          "toolB": "available",
          "note": "Mend.io High-accuracy SAST; Veracode SAST"
        },
        {
          "feature": "SCA (dependency scanning)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "DAST",
          "toolA": "limited",
          "toolB": "available",
          "note": "Mend.io offers DAST as a separate add-on; Veracode includes it as a core capability"
        },
        {
          "feature": "Container security",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Veracode Container Security"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-powered remediation suggestions",
          "toolA": "available",
          "toolB": "available",
          "note": "Mend.io AI-powered fix suggestions; Veracode Fix"
        },
        {
          "feature": "Dedicated AI-BOM / Shadow AI discovery",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mend AI product"
        },
        {
          "feature": "Automated AI red teaming",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mend AI product"
        },
        {
          "feature": "Automated dependency updates",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mend Renovate"
        }
      ]
    },
    {
      "group": "Services & Pricing",
      "rows": [
        {
          "feature": "Penetration Testing as a Service",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Veracode PTaaS"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Mend.io: up to $1000/dev/year; Veracode: custom quote only"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither documents a free trial"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Mend.io pricing compare to Veracode?",
      "answer": "Mend.io publishes specific per-developer annual pricing (up to $1,000/developer/year for AppSec, up to $300/developer/year for Mend AI, up to $250/developer/year for Mend Renovate Enterprise). Veracode publishes no pricing at all and requires contacting sales or requesting a demo for a custom quote."
    },
    {
      "question": "Does Veracode offer penetration testing?",
      "answer": "Yes, Veracode includes Penetration Testing as a Service (PTaaS) alongside Security Labs and eLearning modules for developer training. Mend.io's documented features do not include a penetration testing service."
    },
    {
      "question": "Which tool has stronger AI security governance features?",
      "answer": "Mend.io has a dedicated Mend AI product for AI-BOM and Shadow AI discovery, automated AI red teaming, and system prompt hardening. Veracode's AI capability, called Fix, focuses on automating remediation of flagged vulnerabilities rather than discovering or red-teaming AI models themselves."
    },
    {
      "question": "What false-positive rate does Veracode report?",
      "answer": "Veracode states a 1.1% false-positive rate on its website, along with having scanned over 1.5M applications and 471T+ lines of code, with 148M+ flaws fixed. Mend.io does not publish a comparable false-positive figure."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "No. Mend.io's website offers a 'Schedule a Demo' option rather than a free trial or free plan, and Veracode's site similarly states no free trial information."
    },
    {
      "question": "Which enterprises use Mend.io and Veracode?",
      "answer": "Mend.io lists Microsoft, Google, Vodafone, Yahoo, and Siemens as enterprise customers. Veracode lists Sitecore, Unisys, BMW, and Garmin as customers, per its site."
    }
  ]
};

export default mendIoVsVeracodeContent;
