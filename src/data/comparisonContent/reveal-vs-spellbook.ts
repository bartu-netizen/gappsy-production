import type { ToolComparisonContent } from './types';

const revealVsSpellbookContent: ToolComparisonContent = {
  "verdict": "Reveal, founded in 2008, is an AI-driven eDiscovery platform spanning a multi-product suite (Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold) built for document review, analytics, and legal holds during litigation and investigations. Spellbook is an AI legal copilot that lives inside Microsoft Word and handles contract review, drafting, comparison, and Q&A for transactional legal work, used by 4,500+ legal teams across 80+ countries. They serve different stages of legal work — discovery and litigation versus contract drafting and negotiation — rather than competing head-to-head.",
  "bestForToolA": "Corporate legal departments, law firms, ALSPs, government agencies, or educational institutions running large-scale litigation or investigations that need collection through trial presentation across a connected multi-product suite.",
  "bestForToolB": "In-house counsel and outside lawyers doing contract drafting, review, and negotiation who want an AI copilot embedded directly in Microsoft Word, with a 7-day free trial to test it before committing.",
  "whoNeedsBoth": "A law firm's litigation group could use Reveal for eDiscovery on active cases while its transactional group uses Spellbook for contract drafting and negotiation — the same organization, but two different practice areas using tools built for different stages of legal work rather than overlapping functions.",
  "keyDifferences": [
    {
      "title": "Core Legal Workflow",
      "toolA": "Reveal covers the full discovery lifecycle from collection through trial presentation, including AI-powered document review, advanced analytics, and legal hold automation.",
      "toolB": "Spellbook covers the contract lifecycle inside Word: Review (redlining and risk flagging), Draft, Compare (benchmarking against thousands of agreements), Ask (cited Q&A), Playbooks, and Associate for multi-document workflows.",
      "whyItMatters": "Litigation/discovery and contract drafting are distinct legal workflows with different data, deadlines, and stakeholders.",
      "benefitsWho": "Litigation support teams (Reveal) versus transactional and commercial legal teams (Spellbook)."
    },
    {
      "title": "Product Structure",
      "toolA": "Reveal is a multi-product suite that includes the core Reveal platform, Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold.",
      "toolB": "Spellbook is a single Word add-in organized around named modules (Review, Draft, Compare, Ask, Playbooks, Associate).",
      "whyItMatters": "A multi-product suite may require more evaluation to identify the right components, while a single add-in has a simpler adoption path.",
      "benefitsWho": "Larger legal departments needing modular discovery tools versus smaller teams wanting one tool that plugs into an existing Word workflow."
    },
    {
      "title": "Trial and Access",
      "toolA": "The facts do not mention a free trial or free plan for Reveal; pricing and access require contacting sales.",
      "toolB": "Spellbook offers a 7-day free trial for lawyers and legal teams.",
      "whyItMatters": "A free trial lowers the barrier to evaluating fit before committing budget, which matters for smaller teams or individual practitioners.",
      "benefitsWho": "Solo practitioners and smaller firms wanting to test the product before a purchase decision."
    },
    {
      "title": "Compliance and Data Handling",
      "toolA": "The facts don't cite specific compliance certifications for Reveal, though it serves government agencies and cites industry awards.",
      "toolB": "Spellbook is SOC 2 Type II, GDPR, CCPA, and PIPEDA compliant, and offers Zero Data Retention options.",
      "whyItMatters": "Legal teams handling sensitive client data often require documented compliance certifications as part of procurement.",
      "benefitsWho": "Legal and IT security teams running vendor due diligence, particularly firms with strict client data-handling requirements."
    },
    {
      "title": "Company Maturity",
      "toolA": "Reveal was founded in 2008 and states $300M in customer cost savings using the platform.",
      "toolB": "Spellbook's founding year isn't documented, but it reports usage by 4,500+ legal teams across 80+ countries.",
      "whyItMatters": "Longevity and adoption metrics both signal market validation, just through different data points.",
      "benefitsWho": "Buyers weighing vendor stability alongside breadth of current adoption."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workflow",
      "rows": [
        {
          "feature": "eDiscovery / document collection and review",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Legal hold automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Contract drafting inside Word",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Contract benchmarking/comparison",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spellbook's Compare feature"
        },
        {
          "feature": "Trial presentation tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Via Trial Director in the Reveal suite"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-powered document review",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Generative AI models included",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI cited Q&A over documents",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spellbook's Ask feature"
        },
        {
          "feature": "AI multi-document agent workflows",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spellbook's Associate"
        }
      ]
    },
    {
      "group": "Trust & Access",
      "rows": [
        {
          "feature": "Free trial available",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Spellbook offers a 7-day free trial"
        },
        {
          "feature": "SOC 2 Type II / GDPR / CCPA compliance stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Zero Data Retention option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Reveal and Spellbook direct competitors?",
      "answer": "Not really. Reveal focuses on eDiscovery and litigation support (document review, analytics, legal holds), while Spellbook focuses on contract drafting and review inside Microsoft Word. They serve different stages of legal work."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Spellbook offers a 7-day free trial for lawyers and legal teams. The facts don't mention any free trial or free plan for Reveal, which requires contacting sales."
    },
    {
      "question": "Which tool is better for litigation?",
      "answer": "Reveal is purpose-built for litigation and investigations, covering the full discovery lifecycle from collection through trial presentation across its multi-product suite (Logikcull, Trial Director, Brainspace, Onna, Reveal Hold). Spellbook does not document litigation or discovery features."
    },
    {
      "question": "Does Spellbook work outside of Microsoft Word?",
      "answer": "The facts describe Spellbook as running as an add-in inside Microsoft Word, with additional integrations to email, Slack, and Salesforce, but Word is its primary interface."
    },
    {
      "question": "What compliance certifications does each platform have?",
      "answer": "Spellbook is documented as SOC 2 Type II, GDPR, CCPA, and PIPEDA compliant with Zero Data Retention options. The facts don't list specific compliance certifications for Reveal."
    },
    {
      "question": "How long has each company been in business?",
      "answer": "Reveal was founded in 2008. Spellbook's founding year is not documented in the facts, though it reports being used by 4,500+ legal teams in 80+ countries."
    }
  ]
};

export default revealVsSpellbookContent;
