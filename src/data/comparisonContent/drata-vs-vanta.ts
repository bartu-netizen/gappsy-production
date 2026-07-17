import type { ToolComparisonContent } from './types';

const drataVsVantaContent: ToolComparisonContent = {
  "verdict": "Drata and Vanta are both AI-assisted GRC platforms with quote-based pricing, but they disclose different things — Vanta publishes its founding year, headquarters, a 400+ integration count, a 16,000+ customer figure, and four named plan tiers, while Drata states a smaller customer base (8,500+) and a distinct AI feature for discovering and governing AI agents inside a company's own environment that Vanta's facts don't describe.",
  "bestForToolA": "Teams specifically concerned with governing AI agents operating inside their own environment (Drata's agent governance and discovery feature) alongside standard SOC 2/ISO 27001 automation.",
  "bestForToolB": "Teams that want more visible platform structure before a sales call — named tiers, a stated integration count, and disclosed founding/HQ details — plus an AI agent that drafts policies directly.",
  "whoNeedsBoth": "Buyers running a competitive GRC RFP naturally evaluate both, since neither publishes actual prices and the meaningful differences (integration counts, AI feature framing, company scale) only surface once both vendors provide quotes.",
  "keyDifferences": [
    {
      "title": "Company transparency",
      "toolA": "Founding year and headquarters are not stated.",
      "toolB": "Founded in 2018, headquartered in San Francisco with additional offices in New York, Sydney, Dublin, and London.",
      "whyItMatters": "Disclosed company details can matter for vendor due diligence and long-term stability assessment.",
      "benefitsWho": "Procurement teams performing vendor background checks (Vanta)."
    },
    {
      "title": "Stated customer base",
      "toolA": "States 8,500+ global customers with a 4.8/5.0 G2 rating.",
      "toolB": "States 16,000+ customers across startups, mid-market, and enterprise.",
      "whyItMatters": "Customer scale can be a proxy for market traction and platform maturity.",
      "benefitsWho": "Buyers weighing social proof and platform adoption (Vanta, based on stated figures)."
    },
    {
      "title": "Integration ecosystem",
      "toolA": "Integration list is not detailed on the homepage.",
      "toolB": "States 400+ tool integrations explicitly.",
      "whyItMatters": "A documented integration count helps buyers gauge compatibility with their existing stack upfront.",
      "benefitsWho": "IT/security teams assessing integration fit before a sales call (Vanta)."
    },
    {
      "title": "Distinct AI features",
      "toolA": "AI questionnaire assistance plus Agent governance that discovers and governs AI agents operating in enterprise environments.",
      "toolB": "Vanta AI Agent drafts policies, completes questionnaires, and flags compliance issues.",
      "whyItMatters": "One AI feature set focuses on governing AI agents as a security risk; the other focuses on automating GRC busywork directly.",
      "benefitsWho": "Security teams worried about shadow AI agent risk (Drata) vs. teams wanting AI to handle policy drafting and questionnaires (Vanta)."
    },
    {
      "title": "Published plan structure",
      "toolA": "No pricing_plans are listed; the site directs to a demo or contact-sales flow.",
      "toolB": "Publishes four named tiers — Essentials, Plus, Professional, Enterprise — each with distinct feature sets, even though prices are quote-based.",
      "whyItMatters": "Seeing a named tier structure with feature deltas helps buyers scope requirements before talking to sales.",
      "benefitsWho": "Buyers who want to self-serve their initial evaluation (Vanta)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compliance Automation",
      "rows": [
        {
          "feature": "Continuous control monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-framework support",
          "toolA": "available",
          "toolB": "available",
          "note": "Drata: 9 named; Vanta: 9+ named, plus 15+ more"
        },
        {
          "feature": "Trust Center (public compliance page)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Third-party risk management",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-drafted questionnaire responses",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agent for policy drafting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI governance of AI agents (discovery/policy enforcement)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Company & Scale",
      "rows": [
        {
          "feature": "Founded year disclosed",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Customer base size stated",
          "toolA": "available",
          "toolB": "available",
          "note": "Drata: 8,500+; Vanta: 16,000+"
        },
        {
          "feature": "Integration count stated",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published plan tiers",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Public starting price",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Drata and Vanta publish pricing?",
      "answer": "No — both require contacting sales. Vanta's four tiers (Essentials, Plus, Professional, Enterprise) are all quote-based, and Drata's site directs visitors to a demo or contact-sales flow without published plans."
    },
    {
      "question": "How many customers does each claim?",
      "answer": "Drata states 8,500+ global customers with a 4.8/5.0 G2 rating; Vanta states 16,000+ customers across startups, mid-market, and enterprise."
    },
    {
      "question": "What frameworks do they support?",
      "answer": "Drata supports SOC 2, ISO 27001, ISO 42001, GDPR, HIPAA, PCI DSS, DORA, FedRAMP, and CMMC; Vanta supports SOC 2, ISO 27001, HIPAA, GDPR, HITRUST, NIST AI RMF, ISO 42001, FedRAMP, CMMC, and 15+ other frameworks."
    },
    {
      "question": "Do they offer AI features?",
      "answer": "Both do, differently — Drata uses AI agents to draft security questionnaire responses and to discover and govern AI agents operating in a company's environment; Vanta's AI Agent drafts policies, completes questionnaires, and flags compliance issues."
    },
    {
      "question": "When was each company founded?",
      "answer": "Vanta was founded in 2018 and is headquartered in San Francisco (with additional offices in New York, Sydney, Dublin, and London); Drata's founding year and headquarters are not stated in the available facts."
    }
  ]
};

export default drataVsVantaContent;
