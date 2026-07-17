import type { ToolComparisonContent } from './types';

const icimsVsSmartrecruitersContent: ToolComparisonContent = {
  "verdict": "iCIMS and SmartRecruiters are both AI-driven enterprise talent acquisition platforms with large integration marketplaces, but they differ in pricing transparency and AI branding: SmartRecruiters publishes a starting price for its entry Essential plan ($14,995) and names its AI layer Winston Intelligence, while iCIMS keeps all pricing behind a demo request and brands its AI as Coalesce, with an explicit Responsible AI certification program. Both serve large enterprises, so the decision often comes down to procurement fit and integration needs rather than a clear capability gap.",
  "bestForToolA": "Best for large enterprises that specifically need iCIMS' 800+ integration marketplace, Coalesce AI for matching/personalization/sourcing, and a documented Responsible AI/bias-mitigation certification — iCIMS states it serves roughly 25% of Fortune 500 companies.",
  "bestForToolB": "Best for organizations that want at least partial pricing transparency to start evaluation (the $14,995 Essential plan), native SAP SuccessFactors integration, and a named AI layer (Winston) spanning sourcing, matching, and hiring.",
  "whoNeedsBoth": "Large enterprises comparing ATS vendors during a formal RFP process will likely need to request quotes and demos from both, since neither publishes full pricing and both target similar large-employer use cases.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "iCIMS publishes no pricing at all; a demo request is required for any quote.",
      "toolB": "SmartRecruiters publishes a starting price for its Essential plan ($14,995), though Professional, High Volume, and Complete tiers remain quote-only.",
      "whyItMatters": "Even partial public pricing gives buyers an anchor point for budgeting before entering a sales process.",
      "benefitsWho": "Procurement and finance teams doing early-stage vendor shortlisting benefit from SmartRecruiters' partial pricing disclosure."
    },
    {
      "title": "AI branding and scope",
      "toolA": "iCIMS' Coalesce AI is described as purpose-built for candidate matching, personalization, and sourcing.",
      "toolB": "SmartRecruiters' Winston Intelligence is described as an AI layer automating candidate matching, screening, and hiring assistance across the platform.",
      "whyItMatters": "Both apply AI to matching, but Winston's description explicitly extends into hiring assistance, while Coalesce's is framed around candidate discovery and personalization.",
      "benefitsWho": "TA teams prioritizing AI-assisted matching should compare each platform's specific AI documentation for their exact workflow needs."
    },
    {
      "title": "Responsible AI certification",
      "toolA": "iCIMS states it operates a Responsible AI program with independent certification for fairness and bias mitigation.",
      "toolB": "No responsible-AI certification program is documented for SmartRecruiters.",
      "whyItMatters": "As AI-driven candidate screening faces increasing regulatory scrutiny, a documented bias-mitigation certification can matter for compliance reviews.",
      "benefitsWho": "Enterprises in regulated industries or with strong DEI compliance requirements around AI hiring tools."
    },
    {
      "title": "ERP/HR system integration depth",
      "toolA": "iCIMS offers 800+ integrations across job boards, HR/payroll systems, background check providers, and assessment tools.",
      "toolB": "SmartRecruiters offers a 200+ integration marketplace plus a native SAP SuccessFactors integration specifically called out.",
      "whyItMatters": "iCIMS has a larger raw integration count, but SmartRecruiters explicitly names native SAP SuccessFactors support, which matters for SAP-based HR stacks.",
      "benefitsWho": "Enterprises already running SAP SuccessFactors may value SmartRecruiters' named native integration; those needing breadth across many system types may value iCIMS' larger count."
    },
    {
      "title": "Company scale disclosure",
      "toolA": "iCIMS states it serves 4,400+ companies across 200 countries, including about 25% of Fortune 500 companies.",
      "toolB": "SmartRecruiters names specific enterprise customers (McDonald's, KPMG, Visa) but doesn't disclose an aggregate customer count in the facts provided.",
      "whyItMatters": "Aggregate customer/country figures versus named marquee customers give different kinds of social proof during vendor evaluation.",
      "benefitsWho": "Buyers weighing market penetration data (iCIMS) versus recognizable reference customers (SmartRecruiters) in their vendor comparison."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Matching",
      "rows": [
        {
          "feature": "AI candidate matching",
          "toolA": "available",
          "toolB": "available",
          "note": "iCIMS: Coalesce AI. SmartRecruiters: Winston Intelligence / AI Talent Matching Engine."
        },
        {
          "feature": "AI-powered candidate screening",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SmartRecruiters: available on High Volume tier and above."
        },
        {
          "feature": "Responsible AI / bias-mitigation certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Conversational AI chatbot",
          "toolA": "available",
          "toolB": "available",
          "note": "iCIMS: digital chatbot assistant. SmartRecruiters: conversational AI chatbot (Attract), full chat available High Volume tier+."
        }
      ]
    },
    {
      "group": "Core ATS Features",
      "rows": [
        {
          "feature": "Configurable applicant tracking workflows",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated sourcing / candidate nurture",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Career site builder / employer branding",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dynamic/high-volume scheduling",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Integrations",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SmartRecruiters Essential: $14,995."
        },
        {
          "feature": "Integration marketplace size",
          "toolA": "available",
          "toolB": "available",
          "note": "iCIMS: 800+. SmartRecruiters: 200+."
        },
        {
          "feature": "Native SAP SuccessFactors integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Founding year / headquarters disclosed",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does iCIMS or SmartRecruiters publish pricing?",
      "answer": "SmartRecruiters publishes a starting price for its Essential plan ($14,995), while its higher tiers are quote-only. iCIMS publishes no pricing at all and requires a demo request."
    },
    {
      "question": "What are iCIMS' and SmartRecruiters' AI layers called?",
      "answer": "iCIMS' AI is called Coalesce, purpose-built for candidate matching, personalization, and sourcing. SmartRecruiters' AI is called Winston Intelligence, automating matching, screening, and hiring assistance."
    },
    {
      "question": "Does either platform have a responsible-AI certification?",
      "answer": "iCIMS states it operates a Responsible AI program with independent certification for fairness and bias mitigation. This isn't documented for SmartRecruiters."
    },
    {
      "question": "How many integrations does each platform offer?",
      "answer": "iCIMS lists 800+ integrations across job boards, HR/payroll, background checks, and assessments. SmartRecruiters lists a 200+ integration marketplace plus a native SAP SuccessFactors integration."
    },
    {
      "question": "How many companies use each platform?",
      "answer": "iCIMS states it serves 4,400+ companies across 200 countries, including about 25% of Fortune 500 companies. SmartRecruiters names enterprise customers including McDonald's, KPMG, and Visa without disclosing an aggregate count."
    }
  ]
};

export default icimsVsSmartrecruitersContent;
