import type { ToolComparisonContent } from './types';

const hireezVsParaformContent: ToolComparisonContent = {
  "verdict": "hireEZ is a self-serve AI recruiting software layer that sources across 45+ external platforms, screens candidates with voice-based Conversational AI, and schedules interviews on top of an existing ATS like Workday, iCIMS, Greenhouse, or SAP, used by 70+ Fortune 500 companies per the vendor. Paraform is a marketplace connecting companies to a network of more than 10,000 specialized human recruiters, with custom AI agents assisting the recruiter-matching process and reporting a 98% satisfaction rate and 70% interview rate for placements. Neither publishes pricing, so the choice comes down to whether a team wants software it operates itself or access to a vetted human recruiter network.",
  "bestForToolA": "hireEZ fits companies that already run an ATS like Workday, iCIMS, Greenhouse, or SAP and want an AI layer for sourcing across 45+ external platforms, voice-based screening, and automated scheduling without replacing their existing system.",
  "bestForToolB": "Paraform fits companies that want to work with specialized human recruiters from a network of 10,000+, using AI to match recruiters to specific hiring needs, as used by clients including Palantir, Rippling, and Scale AI.",
  "whoNeedsBoth": "A large enterprise could use hireEZ as an ongoing AI sourcing-and-screening layer on top of its Workday or Greenhouse ATS for high-volume roles, while turning to Paraform's recruiter network for specialized searches — since hireEZ automates the sourcing/screening pipeline itself while Paraform connects companies to outside human recruiters for roles that benefit from specialized expertise.",
  "keyDifferences": [
    {
      "title": "Software Layer vs Recruiter Marketplace",
      "toolA": "hireEZ is self-serve AI software that companies run on top of their existing ATS (Workday, iCIMS, Greenhouse, SAP) to handle sourcing, screening, and scheduling.",
      "toolB": "Paraform is a marketplace connecting companies to a network of 10,000+ human recruiters, with AI used to match recruiters to roles rather than to automate recruiting tasks directly.",
      "whyItMatters": "One model keeps recruiting in-house with AI assistance; the other outsources recruiting to specialized third parties.",
      "benefitsWho": "In-house talent acquisition teams benefit from hireEZ; companies without dedicated recruiting capacity benefit from Paraform's outside network."
    },
    {
      "title": "AI Screening Depth",
      "toolA": "hireEZ includes Conversational AI screening — real-time, adaptive voice-based phone screening built into the platform.",
      "toolB": "Paraform does not document a comparable automated voice-screening capability; its AI is focused on matching recruiters to roles.",
      "whyItMatters": "Automated voice screening can filter high candidate volumes before human review, which is a different capability than recruiter matching.",
      "benefitsWho": "Teams with high application volume that want to automate initial phone screens benefit from hireEZ."
    },
    {
      "title": "Sourcing Reach",
      "toolA": "hireEZ's AI sourcing searches across 45+ external platforms plus a company's internal ATS data.",
      "toolB": "Paraform does not document a comparable automated multi-platform sourcing tool, relying instead on its network of specialized human recruiters to source candidates.",
      "whyItMatters": "Breadth of automated sourcing platforms affects how much manual candidate discovery a team needs to do.",
      "benefitsWho": "Recruiting teams wanting to automate wide-net candidate discovery benefit from hireEZ."
    },
    {
      "title": "Enterprise Adoption Evidence",
      "toolA": "hireEZ cites 70+ Fortune 500 companies as users, though the vendor's own materials note that performance metrics like time-to-fill reduction are vendor-reported and not independently verified.",
      "toolB": "Paraform names specific clients (Palantir, Rippling, Cognition AI, Scale AI) and reports quantified outcomes: a 98% satisfaction rate and 70% interview rate for placements.",
      "whyItMatters": "The type of evidence each vendor provides (customer count vs. named clients plus outcome rates) can factor differently into a buyer's confidence.",
      "benefitsWho": "Buyers doing reference checks may value Paraform's named client list and outcome percentages."
    },
    {
      "title": "Free Tools & Pricing Transparency",
      "toolA": "hireEZ publishes no pricing and offers no documented free tier; visitors must contact sales.",
      "toolB": "Paraform also publishes no pricing for companies, but additionally offers a free AI toolkit for recruiters (sourcing, matching, CRM, notetaking, scheduling) at no cost.",
      "whyItMatters": "A free toolkit for recruiters is a distinct value line that doesn't directly help hiring companies evaluate cost, but signals Paraform's dual-sided platform strategy.",
      "benefitsWho": "Independent and agency recruiters get direct value from Paraform's free toolkit regardless of hiring-company pricing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Screening",
      "rows": [
        {
          "feature": "AI candidate sourcing breadth",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "hireEZ: 45+ external platforms plus ATS data"
        },
        {
          "feature": "Voice-based AI screening",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "hireEZ's Conversational AI screening"
        },
        {
          "feature": "AI scheduling/interview booking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Human recruiter network",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Paraform: 10,000+ recruiters"
        }
      ]
    },
    {
      "group": "Platform Integration",
      "rows": [
        {
          "feature": "Works atop existing ATS (Workday, iCIMS, Greenhouse, SAP)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Talent CRM / pipeline nurturing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free AI toolkit for recruiters",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Back-office support (client comms, payments)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust & Scale Signals",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Named enterprise clients",
          "toolA": "available",
          "toolB": "available",
          "note": "hireEZ: 70+ Fortune 500 (vendor-reported); Paraform: Palantir, Rippling, Cognition AI, Scale AI"
        },
        {
          "feature": "Published placement outcome metrics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "98% satisfaction, 70% interview rate"
        },
        {
          "feature": "Hiring intelligence / market reporting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does hireEZ replace my existing ATS the way Paraform bypasses it?",
      "answer": "No, hireEZ operates as a layer on top of existing ATS systems such as Workday, iCIMS, Greenhouse, and SAP. Paraform doesn't require an ATS integration at all since it routes hiring through its recruiter network."
    },
    {
      "question": "Does either platform publish pricing?",
      "answer": "No, neither hireEZ nor Paraform publishes pricing for companies; both require direct contact to get a quote or engage recruiters."
    },
    {
      "question": "Which platform offers voice-based candidate screening?",
      "answer": "hireEZ includes Conversational AI screening, an adaptive voice-based phone screening tool. Paraform does not document a comparable automated screening feature."
    },
    {
      "question": "What evidence of results does each platform provide?",
      "answer": "hireEZ cites usage by 70+ Fortune 500 companies, noting its performance claims are vendor-reported. Paraform reports a 98% satisfaction rate and 70% interview rate for placements, with named clients like Palantir and Scale AI."
    },
    {
      "question": "Is there a free option with either tool?",
      "answer": "Paraform offers a free AI toolkit for recruiters (sourcing, matching, CRM, notetaking, scheduling). hireEZ does not document a free tier."
    },
    {
      "question": "How many external platforms does hireEZ search when sourcing candidates?",
      "answer": "hireEZ searches across more than 45 external platforms in addition to a company's internal ATS data."
    }
  ]
};

export default hireezVsParaformContent;
