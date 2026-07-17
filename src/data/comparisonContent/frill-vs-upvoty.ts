import type { ToolComparisonContent } from './types';

const frillVsUpvotyContent: ToolComparisonContent = {
  "verdict": "Frill and Upvoty are both embeddable customer feedback and roadmap platforms, but they gate different things at the entry tier — Frill caps ideas volume (50) and surveys (1) on its $25/month Startup plan while bundling SSO and API access on every paid tier, whereas Upvoty's cheaper $15/month Power plan gives unlimited boards and tracked users plus custom domain, branding, and SSO immediately, but limits accounts to a single project until the $49/month Hyper plan. Frill leans into structured feedback tooling (priority matrix, surveys, changelog) while Upvoty leans into AI-assisted triage (Merge AI duplicate detection) and multi-language support.",
  "bestForToolA": "Frill fits teams that want built-in NPS/CSAT surveys and a benefit-vs-cost priority matrix alongside their feedback board, with SSO and API included on every paid plan starting at $25/month.",
  "bestForToolB": "Upvoty fits teams that want the cheapest entry point ($15/month) with unlimited boards and tracked users, custom domain, and SSO already included, plus AI-based duplicate-post detection (Merge AI).",
  "whoNeedsBoth": "There's no realistic scenario for running both — they serve the same core function of a public feedback board, roadmap, and changelog, so a team would pick one rather than pay for two overlapping tools.",
  "keyDifferences": [
    {
      "title": "Entry-Tier Pricing",
      "toolA": "Frill's Startup plan is $25/month for 50 ideas and 1 survey.",
      "toolB": "Upvoty's Power plan is $15/month for 1 project with unlimited boards, unlimited tracked users, custom domain, branding, and SSO.",
      "whyItMatters": "Budget-conscious teams get more capability at Upvoty's lower entry price.",
      "benefitsWho": "Benefits early-stage startups watching every dollar."
    },
    {
      "title": "Duplicate Detection",
      "toolA": "Not documented as a Frill feature.",
      "toolB": "Merge AI automatically detects duplicate feedback posts.",
      "whyItMatters": "High-volume boards need automated dedup to avoid noisy, fragmented backlogs.",
      "benefitsWho": "Benefits teams with large, active user bases submitting many overlapping requests."
    },
    {
      "title": "Surveys",
      "toolA": "Frill includes NPS, CSAT, polls, and open feedback surveys, from 1 survey on Startup up to unlimited on the $49/month Business plan.",
      "toolB": "Not documented as an Upvoty feature.",
      "whyItMatters": "Teams wanting quantitative sentiment data beyond voting need survey tooling.",
      "benefitsWho": "Benefits product teams running structured research alongside qualitative requests."
    },
    {
      "title": "Multi-Project Support",
      "toolA": "Frill's plans scale by ideas/survey volume rather than a distinct 'projects' concept.",
      "toolB": "Capped at 1 project on the Power and Super plans; unlimited projects require the $49/month Hyper plan.",
      "whyItMatters": "Companies managing multiple distinct products need to know exactly when multi-project support kicks in.",
      "benefitsWho": "Benefits agencies or companies running several separate products or brands."
    },
    {
      "title": "Language Support",
      "toolA": "Not documented.",
      "toolB": "Supports 20+ languages for feedback boards.",
      "whyItMatters": "Global or multi-region companies need localized boards their customers can actually use.",
      "benefitsWho": "Benefits international companies serving non-English-speaking customers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback & Roadmap",
      "rows": [
        {
          "feature": "Ideas/voting board",
          "toolA": "available",
          "toolB": "available",
          "note": "Frill: 50 ideas on Startup"
        },
        {
          "feature": "Public roadmap",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Changelog",
          "toolA": "available",
          "toolB": "available",
          "note": "Upvoty's automated changelog notifies voters"
        },
        {
          "feature": "Surveys (NPS/CSAT/polls)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI duplicate detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Upvoty's Merge AI"
        },
        {
          "feature": "Priority matrix (benefit vs. cost)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automated voter notification when a feature ships",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Upvoty's changelog auto-notifies voters"
        }
      ]
    },
    {
      "group": "Branding & Access",
      "rows": [
        {
          "feature": "Custom domain",
          "toolA": "available",
          "toolB": "available",
          "note": "Frill: Growth tier $149/mo+; Upvoty: Power tier $15/mo"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include it on all paid tiers"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include it starting on entry paid tier"
        },
        {
          "feature": "Multi-language board support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "20+ languages"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper to start?",
      "answer": "Upvoty's Power plan is $15/month vs. Frill's Startup plan at $25/month."
    },
    {
      "question": "Which has AI duplicate detection?",
      "answer": "Upvoty's Merge AI automatically flags duplicate feedback posts; this isn't documented for Frill."
    },
    {
      "question": "Which includes surveys?",
      "answer": "Frill includes NPS, CSAT, poll, and open feedback surveys starting on its Startup plan; surveys aren't documented for Upvoty."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes, both offer a 14-day free trial with no credit card required."
    },
    {
      "question": "Which supports multiple projects at the entry price?",
      "answer": "Neither at the cheapest tier — Frill doesn't use a 'projects' model, and Upvoty requires its $49/month Hyper plan for unlimited projects."
    },
    {
      "question": "Which supports more languages?",
      "answer": "Upvoty documents support for 20+ languages on its feedback boards; language support isn't documented for Frill."
    }
  ]
};

export default frillVsUpvotyContent;
