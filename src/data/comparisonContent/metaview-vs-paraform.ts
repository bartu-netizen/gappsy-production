import type { ToolComparisonContent } from './types';

const metaviewVsParaformContent: ToolComparisonContent = {
  "verdict": "Metaview is self-serve agentic AI software — Sourcing Agent, Application review, Notetaker, and the autonomous coworker Fillmore — that companies run themselves on top of their existing ATS, with published tiered pricing from a free tier up to $300/month per user. Paraform is a marketplace connecting companies to a network of more than 10,000 specialized human recruiters, using custom AI agents to match recruiters to roles and offering white-glove support, but publishing no pricing for the companies that hire through it. One replaces recruiting tasks with AI directly; the other augments a human recruiter network with AI matching.",
  "bestForToolA": "Metaview fits companies that want to run AI sourcing and screening themselves on top of an existing ATS like Ashby, Greenhouse, Lever, Gem, or SmartRecruiters, starting with a free tier of 100 sourced profiles per month.",
  "bestForToolB": "Paraform fits companies that want access to a network of 10,000+ specialized human recruiters with AI-assisted matching and white-glove support, as used by clients including Palantir, Rippling, Cognition AI, and Scale AI.",
  "whoNeedsBoth": "A fast-growing company could use Metaview's Sourcing Agent for high-volume, lower-seniority roles it can screen with AI, while turning to Paraform's recruiter network for specialized or hard-to-fill roles where Paraform reports a 70% interview rate for placements — since Metaview automates sourcing directly while Paraform routes hiring through vetted human recruiters.",
  "keyDifferences": [
    {
      "title": "Recruiting Model",
      "toolA": "Metaview is self-serve agentic AI software that companies operate themselves, including a Sourcing Agent and the autonomous Fillmore coworker, on top of their own ATS.",
      "toolB": "Paraform is a recruiter marketplace connecting companies to a network of 10,000+ specialized human recruiters, with custom AI agents assisting the matching process rather than performing recruiting tasks directly.",
      "whyItMatters": "Software-driven automation and human-recruiter marketplaces solve hiring differently, with different levels of human judgment involved.",
      "benefitsWho": "Teams wanting full control over automated sourcing benefit from Metaview; teams wanting specialized human expertise benefit from Paraform."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Metaview publishes tiered pricing: Free (100 profiles/month), Pro ($100/month per user, 200 profiles), Max ($300/month per user, unlimited), and custom Enterprise.",
      "toolB": "Paraform publishes no pricing for companies using the platform; its pricing model is not documented.",
      "whyItMatters": "Published pricing lets buyers estimate cost without a sales call, while custom pricing requires direct negotiation.",
      "benefitsWho": "Budget-conscious teams that want to self-serve and estimate costs upfront benefit from Metaview's published tiers."
    },
    {
      "title": "Free Offering Audience",
      "toolA": "Metaview's free tier (Sourcing Agent Free) is aimed at hiring companies, giving them 100 sourced profiles per month at no cost.",
      "toolB": "Paraform's free offering is a free AI toolkit for recruiters themselves — covering sourcing, candidate matching, CRM, note-taking, and scheduling — not a free tier for hiring companies.",
      "whyItMatters": "Understanding who the free tier is built for clarifies which side of the transaction each product primarily serves.",
      "benefitsWho": "Hiring companies get direct value from Metaview's free tier; independent or agency recruiters get direct value from Paraform's free toolkit."
    },
    {
      "title": "Performance Metrics",
      "toolA": "Metaview does not document comparable placement-outcome statistics in its published materials.",
      "toolB": "Paraform reports a 98% satisfaction rate and a 70% interview rate for placements made through its network.",
      "whyItMatters": "Outcome metrics help buyers gauge the effectiveness of a recruiting model before committing.",
      "benefitsWho": "Buyers evaluating recruiter-network quality benefit from Paraform's published outcome statistics."
    },
    {
      "title": "Named Client Base",
      "toolA": "Metaview's facts do not name specific customers.",
      "toolB": "Paraform names specific enterprise clients including Palantir, Rippling, Cognition AI, and Scale AI.",
      "whyItMatters": "Named reference customers can help build buyer confidence during evaluation.",
      "benefitsWho": "Enterprise buyers doing vendor reference checks benefit from Paraform's named client list."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Matching Model",
      "rows": [
        {
          "feature": "Self-serve AI sourcing agent",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Metaview's Sourcing Agent; Paraform is recruiter-driven"
        },
        {
          "feature": "Human recruiter network",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Paraform: 10,000+ recruiters"
        },
        {
          "feature": "AI-assisted recruiter-to-role matching",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Paraform's custom AI agents learn from each hiring cycle"
        },
        {
          "feature": "Autonomous candidate outreach",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Metaview's Fillmore"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published company pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Metaview: Free/$100/$300/custom"
        },
        {
          "feature": "Free tier for hiring companies",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Metaview: 100 profiles/month free"
        },
        {
          "feature": "Free tools for recruiters",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Paraform's free AI toolkit for recruiters"
        },
        {
          "feature": "ATS integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Metaview: Ashby, Greenhouse, Lever, Gem, SmartRecruiters"
        }
      ]
    },
    {
      "group": "Support & Outcomes",
      "rows": [
        {
          "feature": "Dedicated talent strategist support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Paraform's white-glove support"
        },
        {
          "feature": "Back-office/payment handling between parties",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published placement outcome metrics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "98% satisfaction, 70% interview rate"
        },
        {
          "feature": "Enterprise security features (audit trails, compliance alerts)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Metaview and Paraform?",
      "answer": "Metaview is self-serve AI recruiting software companies operate themselves on top of their existing ATS. Paraform is a marketplace connecting companies to a network of 10,000+ human recruiters, using AI to assist matching rather than to source and screen directly."
    },
    {
      "question": "Does either platform publish pricing?",
      "answer": "Metaview publishes tiered pricing from a free tier up to $300/month per user, plus custom Enterprise. Paraform does not publish pricing for companies using the platform."
    },
    {
      "question": "Is either tool free to try?",
      "answer": "Metaview offers a free Sourcing Agent tier covering the first 100 profiles sourced per month. Paraform offers a free AI toolkit, but it's built for recruiters, not for companies evaluating the platform."
    },
    {
      "question": "Which has stronger reported placement outcomes?",
      "answer": "Paraform reports a 98% satisfaction rate and a 70% interview rate for placements. Metaview does not publish comparable outcome statistics."
    },
    {
      "question": "What ATS platforms does Metaview integrate with?",
      "answer": "Metaview integrates with Ashby, Greenhouse, Lever, Gem, and SmartRecruiters. Paraform's ATS integration details are not documented."
    },
    {
      "question": "What companies use Paraform?",
      "answer": "Paraform's stated clients include Palantir, Rippling, Cognition AI, Scale AI, Thomson Reuters, and Basis."
    }
  ]
};

export default metaviewVsParaformContent;
