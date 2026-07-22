import type { ToolComparisonContent } from './types';

const recruiterflowVsSeekoutContent: ToolComparisonContent = {
  "verdict": "Recruiterflow is an AI-native ATS+CRM built specifically for executive search firms and recruiting agencies, combining candidate pipelines with client/business-development CRM and multichannel outreach sequences. SeekOut is an agentic AI sourcing and screening platform built around searching 1 billion-plus candidate profiles and automating inbound evaluation, positioned more for in-house talent acquisition teams and integrating with existing ATS systems like Workday and Greenhouse. The choice largely comes down to whether you need a full agency ATS/CRM (Recruiterflow) or a sourcing and screening layer that plugs into an ATS you already have (SeekOut).",
  "bestForToolA": "Recruiterflow fits executive search firms and recruiting agencies wanting one platform for candidate pipelines, client CRM, and multichannel outreach, reporting 2,100+ search firms as users and a 4.8/5 rating on both G2 and Capterra.",
  "bestForToolB": "SeekOut fits in-house talent acquisition teams that need to search across 1B+ candidate profiles, screen with AI video interviews, and integrate with an existing ATS such as Workday, Greenhouse, iCIMS, or Lever.",
  "whoNeedsBoth": "A recruiting agency could run Recruiterflow as its core ATS/CRM for managing client relationships and candidate pipelines while using SeekOut's 1B+ profile search and AI screening as a sourcing layer to find and evaluate candidates before importing them into Recruiterflow.",
  "keyDifferences": [
    {
      "title": "Primary Buyer",
      "toolA": "Recruiterflow targets executive search firms, recruiting agencies, and staffing companies running client-facing business development.",
      "toolB": "SeekOut targets talent acquisition teams, with customers including DocuSign, Sony, and Microsoft, sourcing and screening candidates.",
      "whyItMatters": "The two are built around different day-to-day workflows: agency billing/CRM versus in-house sourcing.",
      "benefitsWho": "Agencies benefit from Recruiterflow's CRM angle; corporate TA teams benefit from SeekOut's sourcing scale."
    },
    {
      "title": "Candidate Database Scale",
      "toolA": "Recruiterflow's documented features focus on managing pipelines and sequences rather than a proprietary candidate database size.",
      "toolB": "SeekOut searches across 1 billion or more candidate profiles with context-aware AI search.",
      "whyItMatters": "Database scale determines how much external sourcing power is built in versus relying on a firm's own pipeline.",
      "benefitsWho": "Teams needing to source new candidates rather than manage existing pipelines benefit from SeekOut's 1B+ profile search."
    },
    {
      "title": "Pricing & Trial",
      "toolA": "Recruiterflow's Platform plan is $149/user/month with a separate custom-priced AIRA AI add-on tier, and no free trial is mentioned.",
      "toolB": "SeekOut's Core plan is $149/month billed annually (or $179/month monthly) with a 14-day free trial and no credit card required.",
      "whyItMatters": "A free trial lowers the risk of evaluating a platform before committing budget.",
      "benefitsWho": "Teams wanting to test before buying benefit from SeekOut's no-credit-card 14-day trial."
    },
    {
      "title": "AI Assistant Integration",
      "toolA": "Recruiterflow AI includes AIRA Notetaker for call summarization and AIRA Search for natural-language search within its own platform.",
      "toolB": "SeekOut MCP lets recruiters access SeekOut's data through external AI assistants including Claude, ChatGPT, Gemini, and Microsoft Copilot.",
      "whyItMatters": "SeekOut's MCP integration extends AI access beyond its own interface into general-purpose assistants.",
      "benefitsWho": "Teams already standardized on tools like Claude or ChatGPT benefit from SeekOut MCP's cross-assistant access."
    },
    {
      "title": "ATS Integration Breadth",
      "toolA": "Recruiterflow functions as its own combined ATS and CRM rather than integrating with a separate ATS.",
      "toolB": "SeekOut integrates with a broad list of external ATS systems including Workday, Greenhouse, iCIMS, Lever, Ashby, Avature, Beamery, Bullhorn, Gem, Jobvite, Phenom, SAP SuccessFactors, SmartRecruiters, and Talemetry.",
      "whyItMatters": "Organizations with an existing ATS need a sourcing tool that plugs in rather than replaces it.",
      "benefitsWho": "Enterprises with an established ATS benefit from SeekOut's wide integration list."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Search",
      "rows": [
        {
          "feature": "Large candidate database search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1B+ profiles"
        },
        {
          "feature": "Natural language search",
          "toolA": "available",
          "toolB": "available",
          "note": "Recruiterflow: AIRA Search; SeekOut: context-aware AI search"
        },
        {
          "feature": "Talent rediscovery from ATS",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Job change alerts",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Outreach & Screening",
      "rows": [
        {
          "feature": "Multichannel outreach sequences",
          "toolA": "available",
          "toolB": "available",
          "note": "Recruiterflow: email/LinkedIn/phone; SeekOut: AI multi-step campaigns"
        },
        {
          "feature": "AI video screening",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI call/meeting notetaking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AIRA Notetaker"
        },
        {
          "feature": "Same-day inbound applicant scoring",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Pricing",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SeekOut: 14-day, no credit card required"
        },
        {
          "feature": "Open API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "External ATS integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Workday, Greenhouse, iCIMS, Lever, Ashby, and more"
        },
        {
          "feature": "Cross-assistant AI access (MCP)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SeekOut MCP: Claude, ChatGPT, Gemini, Copilot"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much do Recruiterflow and SeekOut cost?",
      "answer": "Both start around $149/month, but structured differently: Recruiterflow's Platform plan is $149 per user per month, while SeekOut's Core plan is $149/month billed annually (or $179/month billed monthly)."
    },
    {
      "question": "Does SeekOut offer a free trial?",
      "answer": "Yes, the SeekOut Recruit Core plan includes a 14-day free trial with no credit card required."
    },
    {
      "question": "What is SeekOut MCP?",
      "answer": "SeekOut MCP lets recruiters access SeekOut's data through AI assistants such as Claude, ChatGPT, Gemini, and Microsoft Copilot."
    },
    {
      "question": "Does Recruiterflow include AI features?",
      "answer": "Yes, Recruiterflow AI includes a suite of built-in intelligent agents, AIRA Search for natural language search, and AIRA Notetaker, which automatically summarizes candidate calls."
    },
    {
      "question": "Who uses each platform?",
      "answer": "Recruiterflow reports 2,100+ search firms globally as users. SeekOut reports 750+ customers, including DocuSign, Sony, and Microsoft."
    },
    {
      "question": "What ATS systems does SeekOut integrate with?",
      "answer": "SeekOut integrates with Workday, Greenhouse, iCIMS, Lever, Ashby, Avature, Beamery, Bullhorn, Gem, Jobvite, Phenom, SAP SuccessFactors, SmartRecruiters, and Talemetry."
    }
  ]
};

export default recruiterflowVsSeekoutContent;
