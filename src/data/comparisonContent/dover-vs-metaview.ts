import type { ToolComparisonContent } from './types';

const doverVsMetaviewContent: ToolComparisonContent = {
  "verdict": "Dover provides its own free, full-featured ATS with unlimited users and jobs, plus a marketplace connecting startups to vetted human fractional recruiters at transparent cost-per-hire. Metaview is an agentic AI layer — Sourcing Agent, Application review, Notetaker, and the autonomous coworker Fillmore — that plugs into existing ATS platforms like Ashby, Greenhouse, Lever, Gem, and SmartRecruiters rather than replacing them. Dover is the choice for a company without an ATS at all; Metaview is the choice for a company that already has an ATS and wants AI agents layered on top of it.",
  "bestForToolA": "Dover fits startups (seed through Series C+) that don't yet have an ATS and want a free one with unlimited users and jobs, plus optional access to fractional recruiters at transparent cost-per-hire.",
  "bestForToolB": "Metaview fits teams that already run an ATS like Ashby, Greenhouse, Lever, Gem, or SmartRecruiters and want autonomous AI agents — Sourcing Agent, Application review, Notetaker, and Fillmore — layered on top, starting with a free tier of 100 sourced profiles per month.",
  "whoNeedsBoth": "A startup could adopt Dover as its free core ATS for job postings and candidate tracking, then use Metaview's Sourcing Agent Free tier to autonomously source the first 100 candidate profiles per month, since Metaview integrates with third-party ATS platforms rather than providing its own applicant tracking system.",
  "keyDifferences": [
    {
      "title": "Core Value Proposition",
      "toolA": "Dover pairs a free, full ATS (unlimited users, jobs, and job-board postings) with a marketplace of vetted fractional recruiters.",
      "toolB": "Metaview is an agentic AI layer — Sourcing Agent, Application review, Notetaker, and the autonomous coworker Fillmore — that integrates with existing ATS platforms including Ashby, Greenhouse, Lever, Gem, and SmartRecruiters.",
      "whyItMatters": "Companies without any ATS need a full system; companies with an ATS already need only the AI layer on top.",
      "benefitsWho": "Startups with no existing ATS benefit from Dover; teams with an established ATS benefit from Metaview's add-on model."
    },
    {
      "title": "Free Tier Scope",
      "toolA": "Dover's Free ATS is unlimited in scope: unlimited users, unlimited jobs, and posting to 100+ job boards at no cost.",
      "toolB": "Metaview's Sourcing Agent Free tier is capped at the first 100 profiles sourced per month, with infinite concurrent searches.",
      "whyItMatters": "The breadth of a free tier determines how long a team can operate without paying.",
      "benefitsWho": "Cash-constrained early-stage startups get more runway from Dover's uncapped free ATS."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Dover's Premium ATS tier is a flat $199/month regardless of team size.",
      "toolB": "Metaview prices Sourcing Agent Pro at $100/month per user (200 profiles/month) and Sourcing Agent Max at $300/month per user (unlimited profiles); its full Agentic Recruiting Platform is custom Enterprise pricing.",
      "whyItMatters": "Flat pricing is more predictable for larger teams, while per-user pricing scales cost with headcount.",
      "benefitsWho": "Larger hiring teams may prefer Dover's flat fee; solo recruiters or small teams may prefer Metaview's lower per-user entry point."
    },
    {
      "title": "Human Marketplace vs Autonomous Agents",
      "toolA": "Dover connects companies with vetted human fractional recruiters through its marketplace, with transparent, upfront cost-per-hire pricing shown before engagement.",
      "toolB": "Metaview's Fillmore is an autonomous AI coworker that finds, contacts, and schedules screening calls with candidates without a human recruiter marketplace.",
      "whyItMatters": "Some hiring needs call for human judgment from a specialized recruiter, while others can be automated end-to-end by AI agents.",
      "benefitsWho": "Companies hiring for specialized or senior roles may prefer Dover's human recruiter marketplace; high-volume sourcing benefits from Metaview's automation."
    },
    {
      "title": "ATS Integration Approach",
      "toolA": "Dover provides its own free ATS rather than integrating with outside applicant tracking systems.",
      "toolB": "Metaview integrates with Ashby, Greenhouse, Lever, Gem, and SmartRecruiters, and does not document a standalone ATS of its own.",
      "whyItMatters": "Teams that already invested in an ATS don't want to migrate data to adopt a new AI layer.",
      "benefitsWho": "Teams with an existing ATS investment benefit from Metaview's integrate-not-replace model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "Free ATS",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dover: $0, unlimited jobs/users"
        },
        {
          "feature": "Third-party ATS integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Metaview integrates with Ashby, Greenhouse, Lever, Gem, SmartRecruiters"
        },
        {
          "feature": "Job board posting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dover posts to 100+ boards"
        },
        {
          "feature": "Job posting/careers content generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Dover: AI-generated job content; Metaview: Job posts feature"
        }
      ]
    },
    {
      "group": "AI Sourcing & Screening",
      "rows": [
        {
          "feature": "Autonomous candidate sourcing agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Metaview's Sourcing Agent and Fillmore"
        },
        {
          "feature": "AI applicant scoring/review",
          "toolA": "available",
          "toolB": "available",
          "note": "Dover Premium; Metaview's Application review"
        },
        {
          "feature": "AI notetaking",
          "toolA": "available",
          "toolB": "available",
          "note": "Dover Premium; Metaview's Notetaker"
        },
        {
          "feature": "Autonomous interview scheduling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Metaview's Fillmore"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier scope",
          "toolA": "available",
          "toolB": "limited",
          "note": "Dover: unlimited, $0; Metaview: capped at 100 profiles/month"
        },
        {
          "feature": "Human recruiter marketplace",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Enterprise security features (audit trails, compliance alerts)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Per-user pricing beyond free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Dover: flat $199/mo; Metaview: $100-$300/mo per user"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Dover replace the need for an ATS integration like Metaview offers?",
      "answer": "Yes, Dover provides its own free ATS with unlimited users and jobs, while Metaview does not offer a standalone ATS — it integrates with existing platforms like Ashby, Greenhouse, Lever, Gem, and SmartRecruiters."
    },
    {
      "question": "What does Metaview's free tier include?",
      "answer": "The Sourcing Agent Free tier includes the first 100 profiles sourced per month at no cost, with infinite concurrent searches."
    },
    {
      "question": "How is Dover's Premium ATS priced?",
      "answer": "Dover's Premium ATS is a flat $199/month regardless of team size, adding unlimited free LinkedIn and X job posts, AI applicant scoring, AI note-taking, and premium support."
    },
    {
      "question": "How is Metaview's Sourcing Agent priced beyond the free tier?",
      "answer": "Sourcing Agent Pro is $100/month per user for 200 profiles sourced per month; Sourcing Agent Max is $300/month per user for unlimited profiles; Enterprise is custom."
    },
    {
      "question": "Does Dover include an autonomous AI coworker like Metaview's Fillmore?",
      "answer": "No, Dover's AI features are applicant scoring and AI-generated job content; it does not document an autonomous outreach-and-scheduling agent comparable to Metaview's Fillmore."
    },
    {
      "question": "Which tool includes a human recruiter marketplace?",
      "answer": "Dover includes a marketplace of vetted fractional recruiters with transparent cost-per-hire pricing. Metaview does not document a human recruiter marketplace."
    }
  ]
};

export default doverVsMetaviewContent;
