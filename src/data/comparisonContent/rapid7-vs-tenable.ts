import type { ToolComparisonContent } from './types';

const rapid7VsTenableContent: ToolComparisonContent = {
  "verdict": "Rapid7 and Tenable both serve enterprise security teams managing exposure across large environments, but they emphasize different models: Rapid7's Command platform centers on managed, human-led services — 24/7 MDR, SOC, digital forensics — layered with exposure management and SIEM, while Tenable centers on its own scanning technology (Nessus) and the Tenable One exposure management platform, with published starting prices for specific products. Organizations wanting a managed security operations partner may lean toward Rapid7; those wanting to run vulnerability scanning themselves with clearer entry pricing may lean toward Tenable.",
  "bestForToolA": "Best for organizations that want a managed, human-led security operations partner — Rapid7's MDR product includes 24x7 XDR monitoring, remediation, and digital forensics/incident response performed by Rapid7's own experts, unified with exposure management and SIEM under its Command platform.",
  "bestForToolB": "Best for organizations that want to run their own vulnerability scanning with published pricing to plan around — Tenable's Nessus scanner (Professional at $4,790/year, Expert at $6,790/year) and Tenable One Vulnerability Management (from $3,500/year for 100 assets) give a starting point that Rapid7 doesn't publish.",
  "whoNeedsBoth": "Large security teams sometimes contract a managed detection/response provider like Rapid7 for 24/7 monitoring while separately licensing Tenable's Nessus or Tenable One for their own internal vulnerability scanning program — the two can function as complementary services rather than direct substitutes.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Rapid7 does not publish pricing on its site; prospective customers must contact sales for a quote across its entire product line.",
      "toolB": "Tenable publishes starting prices for specific products — Tenable One Vulnerability Management at $3,500/year (100 assets), Nessus Professional at $4,790/year, and Nessus Expert at $6,790/year — though full Tenable One platform pricing beyond the base tier isn't fully itemized.",
      "whyItMatters": "Buyers who need a ballpark budget number before engaging sales get more self-service information from Tenable than Rapid7.",
      "benefitsWho": "Budget owners and procurement teams doing early-stage vendor comparison."
    },
    {
      "title": "Managed services vs. self-run scanning",
      "toolA": "Rapid7's Managed Detection and Response (MDR) provides 24x7 XDR monitoring, remediation, and digital forensics/incident response delivered by Rapid7's own experts.",
      "toolB": "Tenable's facts emphasize scanning and platform products (Nessus, Tenable One, OT Security, Web App Scanning) rather than a managed, analyst-staffed response service.",
      "whyItMatters": "Teams without an in-house 24/7 SOC may need Rapid7's managed layer, while teams with their own analysts may only need Tenable's scanning technology.",
      "benefitsWho": "Security teams deciding whether to outsource monitoring or keep it in-house."
    },
    {
      "title": "Product line breadth",
      "toolA": "Rapid7's Command platform spans MDR, Exposure Management, Attack Surface Management, Next-Gen SIEM, CNAPP, Vulnerability Management, and Application Security.",
      "toolB": "Tenable's product line includes Tenable One (unified exposure management), Hexa AI agentic orchestration, Nessus, Cloud Security/CNAPP, OT Security, and Web App Scanning/Patch Management.",
      "whyItMatters": "Both vendors cover multiple domains, so the choice depends on which specific domains — e.g., OT security vs. managed SIEM — matter most to the buyer.",
      "benefitsWho": "Security architects mapping tools to specific attack surfaces (cloud, OT, identity)."
    },
    {
      "title": "Company history disclosure",
      "toolA": "Rapid7's founding year and headquarters are not stated in the available facts.",
      "toolB": "Tenable states it was founded in 2002.",
      "whyItMatters": "A stated multi-decade track record vs. undisclosed company history can matter for buyers weighing vendor stability and longevity.",
      "benefitsWho": "Enterprise procurement and vendor-risk assessment teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Capabilities",
      "rows": [
        {
          "feature": "Managed Detection and Response (MDR)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Vulnerability scanning",
          "toolA": "available",
          "toolB": "available",
          "note": "Tenable via Nessus"
        },
        {
          "feature": "Cloud security (CNAPP)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "OT/industrial security",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Next-gen SIEM",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-driven orchestration",
          "toolA": "available",
          "toolB": "available",
          "note": "Tenable: Hexa AI"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tenable One VM $3,500/year; Nessus from $4,790/year"
        },
        {
          "feature": "Custom/quote-based enterprise pricing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-year pricing discount",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Company Transparency",
      "rows": [
        {
          "feature": "Founding year stated",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Headquarters stated",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Customer scale figure stated",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Rapid7: 11,000+ organizations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Rapid7 pricing publicly listed?",
      "answer": "No, Rapid7 does not publish pricing on its site; prospective customers must contact sales for a quote."
    },
    {
      "question": "What is Tenable One?",
      "answer": "Tenable One is the company's flagship AI-powered exposure management platform, unifying visibility across infrastructure, cloud, identity, OT, and AI environments."
    },
    {
      "question": "How much does Nessus cost?",
      "answer": "Nessus Professional is priced at $4,790/year and Nessus Expert at $6,790/year."
    },
    {
      "question": "Does Rapid7 use AI?",
      "answer": "Yes, Rapid7 markets its platform as AI-powered with an AI engine supporting its security operations alongside human analysts."
    },
    {
      "question": "When was Tenable founded?",
      "answer": "Tenable was founded in 2002."
    },
    {
      "question": "Who uses Rapid7?",
      "answer": "Rapid7 states it serves more than 11,000 global organizations, including customers in finance, transportation, entertainment, and manufacturing."
    }
  ]
};

export default rapid7VsTenableContent;
