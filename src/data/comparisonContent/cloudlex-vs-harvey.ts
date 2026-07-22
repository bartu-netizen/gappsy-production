import type { ToolComparisonContent } from './types';

const cloudlexVsHarveyContent: ToolComparisonContent = {
  "verdict": "CloudLex is a case management system purpose-built for personal injury law firms, tracking intake through settlement with its Lexee AI layered on top for demand drafting and medical summaries. Harvey is a broader AI platform for legal research, drafting, contract review, and autonomous agent workflows, used by AmLaw 100 firms and in-house legal teams across practice areas rather than a single niche. One manages the case lifecycle; the other augments legal analysis and drafting work.",
  "bestForToolA": "Personal injury firms that need a system of record for intake, matters, deadlines, medical records, and settlements, plus optional add-on paralegal services like a 24/7 bilingual call center.",
  "bestForToolB": "Large firms and in-house legal teams that want AI-driven research, contract intelligence, and autonomous agents across research and drafting work, backed by SOC2 II, ISO 27001/27701/42001 certifications and multi-region (US/EU/Australia) hosting.",
  "whoNeedsBoth": "A personal injury firm handling mixed practice areas could use CloudLex as its case management system of record for PI matters while using Harvey for broader legal research or contract review work that falls outside personal injury and outside what Lexee AI covers.",
  "keyDifferences": [
    {
      "title": "Practice Area Focus",
      "toolA": "CloudLex is built specifically for personal injury law firms, covering intake, matter management, medical records, and settlement tracking.",
      "toolB": "Harvey serves law firms and in-house legal teams broadly, with no documented specialization in a single practice area.",
      "whyItMatters": "A tool built for one practice area can model that workflow (e.g. settlement demands) far more precisely than a general-purpose tool.",
      "benefitsWho": "Personal injury attorneys and paralegals who want workflows already mapped to their case type."
    },
    {
      "title": "Case/Matter Management vs. AI-First Platform",
      "toolA": "CloudLex centers on matter management, with AI (Lexee) as an add-on for drafting and summarization within cases already tracked in the system.",
      "toolB": "Harvey has no documented case or matter management functionality; its features (Assistant, Vault, Knowledge, Agents) center on AI-driven research, drafting, and document review.",
      "whyItMatters": "Firms need to know whether a tool replaces their case management system or only augments legal work performed elsewhere.",
      "benefitsWho": "Firms deciding whether they need a system of record (CloudLex) versus an AI research/drafting layer (Harvey)."
    },
    {
      "title": "Human Service Add-Ons",
      "toolA": "CloudLex offers optional paralegal services including records retrieval, chronologies, document indexing, and a 24/7 bilingual call center.",
      "toolB": "Harvey's documented offering is software and AI only, with no human paralegal or call center services listed.",
      "whyItMatters": "Smaller PI firms may need staffing support alongside software, not just tooling.",
      "benefitsWho": "Smaller personal injury practices that want outsourced intake or records-retrieval support."
    },
    {
      "title": "Target Customer Scale",
      "toolA": "CloudLex serves personal injury practices without a documented size skew; pricing is not published.",
      "toolB": "Harvey's named customers are large firms (60+ AmLaw 100 firms, Vinson & Elkins, Reed Smith, A&O Shearman), and its positioning skews enterprise.",
      "whyItMatters": "Enterprise-oriented AI platforms often carry enterprise-level pricing and procurement requirements.",
      "benefitsWho": "Large law firms and enterprise in-house legal teams evaluating Harvey; independent and small PI firms evaluating CloudLex."
    },
    {
      "title": "Security Certifications and Regions",
      "toolA": "CloudLex documents Azure hosting with encryption and multi-factor authentication, but no named third-party certifications.",
      "toolB": "Harvey documents SOC2 II, ISO 27001, ISO 27701, ISO 42001, GDPR, and CCPA certifications, with US, EU, and Australia hosting regions and SAML SSO.",
      "whyItMatters": "Enterprise legal buyers often require formal certifications before approving a vendor.",
      "benefitsWho": "Compliance and IT security teams at large firms vetting AI vendors."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case/Matter Management",
      "rows": [
        {
          "feature": "Intake management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CloudLex: shareable intake forms, one-click lead-to-matter conversion"
        },
        {
          "feature": "Matter/case tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Document management & search",
          "toolA": "available",
          "toolB": "available",
          "note": "Harvey's Vault: secure storage, organization, bulk analysis"
        },
        {
          "feature": "Deadline/calendar tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Settlement management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Demand drafting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CloudLex: Lexee AI"
        },
        {
          "feature": "Legal research",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey's Knowledge feature"
        },
        {
          "feature": "Autonomous agent workflows",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey Agents"
        },
        {
          "feature": "Contract intelligence/review",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Intake chatbot",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Security & Access",
      "rows": [
        {
          "feature": "SOC2/ISO certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC2 II, ISO 27001, 27701, 42001"
        },
        {
          "feature": "Multi-region hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "US, EU, Australia"
        },
        {
          "feature": "SAML SSO",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Harvey Mobile"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CloudLex or Harvey better for a personal injury law firm?",
      "answer": "CloudLex is purpose-built for personal injury practice, handling intake through settlement in one system. Harvey doesn't document case management functionality at all, so a PI firm would still need a system like CloudLex even if it also used Harvey for broader legal research."
    },
    {
      "question": "Does either tool publish pricing?",
      "answer": "No. Neither CloudLex nor Harvey lists pricing publicly; both require contacting sales or requesting a demo to get a quote."
    },
    {
      "question": "Does CloudLex include AI features?",
      "answer": "Yes, CloudLex's Lexee AI handles demand drafting, medical record summaries, intake chatbots, and case Q&A within the case management platform."
    },
    {
      "question": "Which tool is used by large AmLaw 100 firms?",
      "answer": "Harvey is used by 60+ AmLaw 100 firms and named enterprise customers like Vinson & Elkins, Reed Smith, and A&O Shearman. CloudLex's facts don't cite comparable large-firm customer names."
    },
    {
      "question": "Does CloudLex offer human support services beyond software?",
      "answer": "Yes, CloudLex offers optional paralegal services including records retrieval, case chronologies, document indexing, and a 24/7 bilingual call center. Harvey's documented offering is software/AI only."
    },
    {
      "question": "Is there a free trial for either tool?",
      "answer": "No. Neither CloudLex nor Harvey documents a free trial or self-serve signup; both require going through a sales or demo process."
    }
  ]
};

export default cloudlexVsHarveyContent;
