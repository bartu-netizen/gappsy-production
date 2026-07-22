import type { ToolComparisonContent } from './types';

const filevineVsHarveyContent: ToolComparisonContent = {
  "verdict": "Filevine and Harvey both layer AI onto legal work, but they solve different problems. Filevine is a cloud case management platform built on a structured legal graph of 40M+ cases, with firm-wide AI agents (LOIS) that can generate documents, assign tasks, and manage deadlines inside full matter workflows including depositions, eSignature (Vinesign), and medical record chronology. Harvey is a research, drafting, and document-review AI platform with modules like Assistant, Vault, Knowledge, and Agents, used by 60+ AmLaw 100 firms and certified to SOC2, ISO, GDPR, and CCPA standards. Filevine manages the matter; Harvey accelerates the legal analysis and drafting work happening inside it.",
  "bestForToolA": "Firms of any size -- Filevine serves 6,000+ clients and 100,000+ users -- that need a full case management system with document management, contract lifecycle tools, deposition scheduling, and built-in eSignature, plus a free trial to evaluate before committing.",
  "bestForToolB": "Large law firms and in-house legal teams, particularly AmLaw 100 firms, that need deep AI-assisted legal research, drafting, and document review with enterprise-grade security certifications (SOC2 II, ISO 27001/27701/42001) and multi-region deployment (US, EU, Australia).",
  "whoNeedsBoth": "A large litigation firm could run Filevine as its core case management system for matters, documents, billing-adjacent workflows, and depositions, while using Harvey for deep legal research, contract analysis, and AI-assisted drafting across those same matters -- Filevine does not document dedicated legal research tools, and Harvey does not document case or matter management.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Filevine is a case management platform: document management, contract lifecycle management, deposition scheduling and hosting, Vinesign eSignature, and medical record chronology, with AI agents (LOIS) layered on top.",
      "toolB": "Harvey is an AI research and drafting platform: Assistant for document analysis and drafting, Vault for secure document storage and bulk analysis, Knowledge for legal/regulatory/tax research, and Agents for autonomous workflow execution.",
      "whyItMatters": "A firm evaluating 'AI for legal work' needs to know whether it's buying a system of record for matters (Filevine) or an AI research/drafting layer (Harvey) -- they are not interchangeable.",
      "benefitsWho": "Litigation and case-heavy practices that need matter management (Filevine) versus firms wanting to accelerate research and drafting output (Harvey)."
    },
    {
      "title": "Access Model and Trial",
      "toolA": "Filevine offers a free trial so firms can evaluate the platform before subscribing, though exact pricing is custom-quoted after a sales conversation.",
      "toolB": "Harvey has no public free trial or self-serve signup; a demo request is required to get a quote.",
      "whyItMatters": "A self-serve trial lowers the barrier for smaller firms to test the product, while a demo-only model signals an enterprise sales motion.",
      "benefitsWho": "Smaller and mid-size firms wanting to try before they buy (Filevine) versus enterprise legal teams comfortable with a guided sales process (Harvey)."
    },
    {
      "title": "Customer Base and Scale",
      "toolA": "Filevine serves 6,000+ clients and 100,000+ users spanning practice areas from personal injury to immigration to government legal offices.",
      "toolB": "Harvey is used by 60+ AmLaw 100 firms and named enterprise customers such as Vinson & Elkins, Reed Smith, and A&O Shearman.",
      "whyItMatters": "Filevine's customer base spans firm sizes and practice areas broadly, while Harvey's named customers skew specifically toward large, elite law firms.",
      "benefitsWho": "Solo practitioners through large firms across many practice areas (Filevine) versus AmLaw 100-caliber firms (Harvey)."
    },
    {
      "title": "Security Certifications",
      "toolA": "Filevine does not publicly document specific security certifications on this data.",
      "toolB": "Harvey holds SOC2 II, ISO 27001, ISO 27701, and ISO 42001 certifications and supports GDPR and CCPA compliance, with SAML SSO and enterprise access controls.",
      "whyItMatters": "Enterprise legal and compliance teams often require named certifications during procurement, and Harvey publishes a specific, verifiable list.",
      "benefitsWho": "In-house legal and compliance teams at large enterprises with formal vendor security review processes."
    },
    {
      "title": "AI Scope: Case Data vs. Legal Domain Knowledge",
      "toolA": "Filevine's AI agents work across a structured legal graph built on 40M+ cases and can read/write directly into case data -- generating documents, assigning tasks, and managing deadlines.",
      "toolB": "Harvey's Knowledge module researches across legal, regulatory, and tax domains, and its Agents execute complex legal workflows end-to-end, but it is not documented as a system of record for firm case data.",
      "whyItMatters": "Filevine's AI is grounded in the firm's own case and matter data; Harvey's AI is grounded in broader legal, regulatory, and tax knowledge.",
      "benefitsWho": "Firms wanting AI that automates internal case operations (Filevine) versus firms wanting AI that accelerates external legal research and analysis (Harvey)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case & Matter Management",
      "rows": [
        {
          "feature": "Document management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Contract lifecycle management",
          "toolA": "available",
          "toolB": "limited",
          "note": "Harvey: Contract Intelligence extracts insights and accelerates review, not full lifecycle management"
        },
        {
          "feature": "eSignature",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Filevine: Vinesign"
        },
        {
          "feature": "Deposition scheduling and hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Medical record chronology",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Firm-wide, multi-matter AI agents",
          "toolA": "available",
          "toolB": "available",
          "note": "Filevine: LOIS; Harvey: Agents"
        },
        {
          "feature": "Legal, regulatory, and tax research",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey: Knowledge"
        },
        {
          "feature": "AI document drafting",
          "toolA": "available",
          "toolB": "available",
          "note": "Filevine: read/write AI actions; Harvey: Assistant"
        },
        {
          "feature": "Structured legal graph / large case dataset",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Filevine: 40M+ cases"
        }
      ]
    },
    {
      "group": "Access, Security & Pricing",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Harvey requires a demo request"
        },
        {
          "feature": "Published security certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey: SOC2 II, ISO 27001/27701/42001, GDPR, CCPA"
        },
        {
          "feature": "Mobile access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey Mobile"
        },
        {
          "feature": "Multi-region deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey: US, EU, Australia"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Filevine or Harvey publish pricing?",
      "answer": "Neither publishes pricing. Filevine custom-quotes packages after a demo, and Harvey requires a demo request to get a quote."
    },
    {
      "question": "Which tool offers a free trial?",
      "answer": "Filevine offers a free trial so firms can evaluate the platform before subscribing. Harvey has no public free trial or self-serve signup."
    },
    {
      "question": "Does Filevine include legal research tools like Harvey's Knowledge module?",
      "answer": "This is not documented for Filevine. Filevine's AI capabilities (LOIS) focus on case data, document generation, and task/deadline management rather than external legal research."
    },
    {
      "question": "Which tool has published security certifications?",
      "answer": "Harvey documents SOC2 II, ISO 27001, ISO 27701, and ISO 42001 certifications along with GDPR and CCPA compliance. Filevine does not publish equivalent certification details on this data."
    },
    {
      "question": "Who are the typical customers for each platform?",
      "answer": "Filevine serves 6,000+ clients and 100,000+ users across firm sizes and practice areas. Harvey is used by 60+ AmLaw 100 firms and named large firms such as Vinson & Elkins and A&O Shearman."
    },
    {
      "question": "Can Filevine and Harvey be used together?",
      "answer": "Their feature sets are complementary rather than overlapping -- Filevine manages matters and documents while Harvey handles research and drafting -- so a firm could plausibly run both, though this combined use case is not documented by either vendor."
    }
  ]
};

export default filevineVsHarveyContent;
