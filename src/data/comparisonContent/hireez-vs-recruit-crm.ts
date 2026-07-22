import type { ToolComparisonContent } from './types';

const hireezVsRecruitCrmContent: ToolComparisonContent = {
  "verdict": "hireEZ is an AI sourcing, screening, and scheduling layer that sits on top of an existing ATS (Workday, iCIMS, Greenhouse, SAP) without replacing it, aimed at enterprise talent acquisition teams that already have an ATS in place; Recruit CRM is a full standalone ATS and CRM built specifically for recruitment agencies, bundling AI sourcing, resume parsing, and candidate matching alongside pipeline management, job multiposting, and native mobile apps. hireEZ augments an existing system of record; Recruit CRM is the system of record itself, purpose-built for agency workflows.",
  "bestForToolA": "hireEZ fits enterprise talent acquisition teams that already run an ATS like Workday, iCIMS, Greenhouse, or SAP and want to add AI sourcing across 45+ external platforms, conversational AI screening, and automated scheduling without migrating systems — it's used by 70+ Fortune 500 companies per the vendor.",
  "bestForToolB": "Recruit CRM fits recruitment agencies that need a complete, agency-specific ATS/CRM with AI agents for resume formatting and candidate submissions, a Kanban pipeline view, and job multiposting to 5,000+ job boards, offered with an unlimited free trial.",
  "whoNeedsBoth": "There's no realistic overlap scenario — hireEZ is explicitly designed to sit on top of an ATS rather than be one, while Recruit CRM is itself a full ATS, so a buyer would choose Recruit CRM as their system of record or hireEZ as a sourcing layer on top of a different ATS, not typically both together.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "An AI sourcing/screening/scheduling layer that works on top of an existing ATS.",
      "toolB": "A complete ATS and CRM in its own right, replacing the need for a separate system.",
      "whyItMatters": "Buyers need to know whether they're adding a layer to their current stack or replacing it entirely.",
      "benefitsWho": "Benefits enterprise TA teams with an established ATS (hireEZ) vs. agencies needing a full system (Recruit CRM)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "No public pricing at all; requires contacting sales.",
      "toolB": "Pricing page lists Pro, Business, and Enterprise plans without dollar figures, but documents monthly/annual billing with up to 20% annual savings and an unlimited free trial.",
      "whyItMatters": "Neither publishes exact prices, but Recruit CRM at least documents plan structure and trial terms upfront.",
      "benefitsWho": "Benefits buyers wanting to see plan tiers and trial terms before a sales call (Recruit CRM)."
    },
    {
      "title": "AI Sourcing Reach",
      "toolA": "Searches across 45+ external platforms plus internal ATS data.",
      "toolB": "Sources via natural-language LinkedIn queries and a Chrome extension capturing profiles from LinkedIn, Xing, Gmail, and Outlook.",
      "whyItMatters": "The breadth and mechanism of AI sourcing differs — hireEZ aggregates across many external platforms, Recruit CRM focuses on LinkedIn/Xing/email capture.",
      "benefitsWho": "Benefits teams wanting the widest possible external sourcing net (hireEZ) vs. those wanting deep LinkedIn-centric capture tools (Recruit CRM)."
    },
    {
      "title": "Mobile Access",
      "toolA": "No native mobile apps documented.",
      "toolB": "Offers native mobile apps for both Android and iOS.",
      "whyItMatters": "Recruiters working in the field or between meetings benefit from dedicated mobile apps.",
      "benefitsWho": "Benefits agency recruiters who need to manage candidates on the go."
    },
    {
      "title": "Screening & Scheduling",
      "toolA": "Includes conversational AI phone screening and an AI scheduler for automated interview booking.",
      "toolB": "Does not document AI-driven phone screening or automated interview scheduling as features.",
      "whyItMatters": "Teams wanting AI to handle screening calls and scheduling logistics need hireEZ's specific capabilities.",
      "benefitsWho": "Benefits high-volume enterprise recruiting teams wanting to automate screening and scheduling steps."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Product",
      "rows": [
        {
          "feature": "Standalone ATS/pipeline management",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Recruit CRM's Kanban pipeline view"
        },
        {
          "feature": "Works on top of existing ATS",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Job board multiposting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "5,000+ job boards"
        },
        {
          "feature": "Talent CRM/pipeline nurturing",
          "toolA": "available",
          "toolB": "available",
          "note": "Recruit CRM's deal pipelines"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI sourcing",
          "toolA": "available",
          "toolB": "available",
          "note": "hireEZ: 45+ platforms; Recruit CRM: LinkedIn natural-language queries"
        },
        {
          "feature": "AI candidate matching",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Conversational AI phone screening",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI resume parsing/formatting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI scheduling/interview booking",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Trial",
      "rows": [
        {
          "feature": "Native mobile apps (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Unlimited, no time limit, restricted premium features"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Recruit CRM lists plan structure without dollar figures"
        },
        {
          "feature": "Integration count",
          "toolA": "available",
          "toolB": "available",
          "note": "hireEZ: 45+ sourcing platforms; Recruit CRM: 1,000+ integrations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does hireEZ replace my existing ATS?",
      "answer": "No, hireEZ works on top of ATS platforms like Workday, iCIMS, Greenhouse, and SAP rather than replacing them; Recruit CRM, by contrast, is itself a full ATS/CRM."
    },
    {
      "question": "Which offers a free trial?",
      "answer": "Recruit CRM offers an unlimited free trial with no time limit, though some premium features are restricted; hireEZ does not document a trial."
    },
    {
      "question": "Which has native mobile apps?",
      "answer": "Recruit CRM offers native iOS and Android apps; this isn't documented for hireEZ."
    },
    {
      "question": "Is pricing public for either?",
      "answer": "No — both require contacting sales or don't display dollar figures; Recruit CRM at least lists its Pro/Business/Enterprise plan structure."
    },
    {
      "question": "Which offers AI phone screening?",
      "answer": "hireEZ includes conversational AI phone screening that adapts in real time; this isn't documented for Recruit CRM."
    },
    {
      "question": "How many job boards can each post to?",
      "answer": "Recruit CRM supports posting to 5,000+ job boards; hireEZ doesn't document job board posting, focusing instead on sourcing across 45+ external platforms."
    }
  ]
};

export default hireezVsRecruitCrmContent;
