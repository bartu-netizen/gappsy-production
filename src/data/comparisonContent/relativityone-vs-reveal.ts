import type { ToolComparisonContent } from './types';

const relativityoneVsRevealContent: ToolComparisonContent = {
  "verdict": "RelativityOne is a legal data platform whose company states 25 years of operation, centered on the Relativity aiR generative AI suite (five named products spanning review, privilege, case strategy, and data breach response) plus integrations with outside AI tools like Claude, ChatGPT, and Gemini. Reveal, founded in 2008, is built as an explicit multi-product suite — combining the core Reveal platform with Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold — to cover the full discovery lifecycle from collection through trial presentation, and states $300M in customer cost savings. Both serve law firms and enterprise legal departments, but they differ in whether AI is delivered as named point-products (RelativityOne) or as one layer within a broader acquired-product suite (Reveal).",
  "bestForToolA": "RelativityOne fits large enterprises, AmLaw 200 firms, and government agencies that want the five-part Relativity aiR generative AI suite plus native integrations with Claude, ChatGPT, and Gemini.",
  "bestForToolB": "Reveal fits legal teams that want a single vendor covering the entire discovery lifecycle — including legal hold automation (Reveal Hold) and trial presentation (Trial Director) — under one multi-product suite with a company history dating to 2008.",
  "whoNeedsBoth": "A corporate legal department could use RelativityOne's aiR for Privilege and Case Strategy on active enterprise litigation while relying on Reveal's Legal Hold automation and Trial Director for the hold-to-trial workflow on a separate matter, since neither vendor documents that its own suite covers both legal hold automation and a named trial-presentation product.",
  "keyDifferences": [
    {
      "title": "Company History & Product Structure",
      "toolA": "RelativityOne's company states it has been operating for 25 years, delivered as a single platform with the aiR suite layered on top.",
      "toolB": "Reveal was founded in 2008 and is explicitly built as a multi-product suite: the core Reveal platform plus Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold.",
      "whyItMatters": "Buyers choosing between a unified platform and an acquired multi-product suite need to know how many separate tools they'll be managing.",
      "benefitsWho": "Legal ops teams deciding whether to standardize on one interface (RelativityOne) or adopt a suite of specialized products (Reveal)."
    },
    {
      "title": "Generative AI Product Depth",
      "toolA": "RelativityOne names five distinct aiR products — Assist, Review, Privilege, Case Strategy, and Data Breach Response — plus integrations with Claude, ChatGPT, and Gemini.",
      "toolB": "Reveal documents AI-powered document review and reusable generative AI models as platform-wide capabilities, without breaking them into as many named sub-products.",
      "whyItMatters": "Teams evaluating AI maturity may weigh how granularly a vendor has productized specific AI workflows like privilege review or breach response.",
      "benefitsWho": "Enterprise legal teams that need AI purpose-built for specific workflows like privilege screening or data breach response."
    },
    {
      "title": "Trial Presentation Tools",
      "toolA": "RelativityOne does not document a dedicated trial-presentation product in its feature list.",
      "toolB": "Reveal's suite includes Trial Director, a named product for trial presentation, as part of its multi-product lineup.",
      "whyItMatters": "Litigators who need courtroom-ready presentation tools benefit from a vendor that names this explicitly rather than folding it into general case-strategy AI.",
      "benefitsWho": "Trial teams preparing evidence presentations for courtroom use."
    },
    {
      "title": "Legal Hold Automation",
      "toolA": "RelativityOne does not document a dedicated legal hold automation feature.",
      "toolB": "Reveal includes legal hold automation directly, backed by the dedicated Reveal Hold product within its suite.",
      "whyItMatters": "Organizations managing frequent litigation holds need automated tools to track custodian acknowledgment and preservation obligations.",
      "benefitsWho": "Corporate legal departments and compliance teams managing recurring litigation holds."
    },
    {
      "title": "Published Impact Claims",
      "toolA": "RelativityOne does not publish a comparable aggregate cost-savings figure in its materials.",
      "toolB": "Reveal states its platform has driven $300M in customer cost savings, alongside multiple industry awards cited on its site.",
      "whyItMatters": "Quantified savings claims can factor into ROI justification during procurement, though both remain vendor-reported.",
      "benefitsWho": "Procurement teams building a business case for eDiscovery spend."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Review",
      "rows": [
        {
          "feature": "Named generative AI product suite",
          "toolA": "available",
          "toolB": "available",
          "note": "RelativityOne: 5 named aiR products; Reveal: 'Generative AI models' described more broadly"
        },
        {
          "feature": "Third-party AI integrations (Claude, ChatGPT, Gemini)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Advanced data visualization/analytics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Reveal's Advanced analytics"
        },
        {
          "feature": "Privilege review AI",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "RelativityOne's aiR for Privilege"
        }
      ]
    },
    {
      "group": "Discovery Lifecycle Coverage",
      "rows": [
        {
          "feature": "Legal hold automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Reveal Hold"
        },
        {
          "feature": "Trial presentation tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trial Director"
        },
        {
          "feature": "Data breach response workflow",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "RelativityOne's aiR for Data Breach Response"
        },
        {
          "feature": "Case strategy AI support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Company & Trust Signals",
      "rows": [
        {
          "feature": "Founding year disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Reveal founded 2008"
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "RelativityOne: Chicago, IL"
        },
        {
          "feature": "Public cost-savings figures",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Reveal states $300M in customer savings"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "When was each company founded?",
      "answer": "Reveal was founded in 2008. RelativityOne's exact founding year isn't published, but the company states it has been operating for 25 years."
    },
    {
      "question": "Does either platform publish pricing?",
      "answer": "No, neither RelativityOne nor Reveal publishes pricing; both require contacting sales."
    },
    {
      "question": "Which platform includes legal hold automation?",
      "answer": "Reveal documents legal hold automation directly, supported by its Reveal Hold product. RelativityOne does not document a dedicated legal hold feature."
    },
    {
      "question": "Which platform integrates with outside AI tools like ChatGPT?",
      "answer": "RelativityOne documents integrations with Claude, ChatGPT, and Gemini. Reveal does not document third-party AI integrations."
    },
    {
      "question": "Who uses each platform?",
      "answer": "RelativityOne is used by AmLaw 200 firms, Fortune 500 corporations, and government agencies. Reveal serves corporate legal departments, law firms, legal service providers (ALSPs), government, and education."
    },
    {
      "question": "Does Reveal include trial presentation tools?",
      "answer": "Yes, Reveal's suite includes Trial Director for trial presentation, which is not a documented feature of RelativityOne."
    }
  ]
};

export default relativityoneVsRevealContent;
