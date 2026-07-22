import type { ToolComparisonContent } from './types';

const meetedgarVsRecurpostContent: ToolComparisonContent = {
  "verdict": "MeetEdgar and RecurPost both center on recycling evergreen content rather than one-off posting, but at very different price points. MeetEdgar starts at $29.99/month with its Inky AI assistant and a 30-day free trial across 10 networks; RecurPost starts far lower at $9/month, was founded in 2016, and pairs its recurring content library with ChatGPT integration, AI image generation, and password-free client approval links. Teams prioritizing a lower entry cost and client-approval workflows will lean toward RecurPost; those wanting a longer trial window and MeetEdgar's specific automation-run capacity may prefer MeetEdgar.",
  "bestForToolA": "Teams wanting a 30-day trial period to fully test evergreen content recycling and Inky's AI captions and hashtags before committing, especially with higher weekly automation-run allowances (up to 1,000 on the EDGAR plan).",
  "bestForToolB": "Budget-conscious teams or agencies wanting a low $9/month entry price, ChatGPT-powered post composition, and client approval links that don't require sharing account passwords.",
  "whoNeedsBoth": "An agency managing both a low-budget client roster (RecurPost's $9/month entry) and higher-volume accounts needing MeetEdgar's larger weekly automation allowances might use both depending on account size.",
  "keyDifferences": [
    {
      "title": "Entry pricing",
      "toolA": "Starts at $29.99/month (Eddie plan).",
      "toolB": "Starts at $9/month (Starter plan).",
      "whyItMatters": "A significant price gap at entry changes accessibility for solo users and small businesses.",
      "benefitsWho": "Budget-constrained solo users and small teams."
    },
    {
      "title": "AI assistant",
      "toolA": "Uses a proprietary AI assistant, Inky, for captions and hashtags, metered at 15-50 credits/month depending on plan.",
      "toolB": "Integrates with ChatGPT for post composition, plus AI image generation.",
      "whyItMatters": "RecurPost's ChatGPT integration may appeal to teams already familiar with that model; MeetEdgar's Inky is a proprietary, credit-metered assistant.",
      "benefitsWho": "Teams with a preference for a named in-house assistant versus ChatGPT-based composition."
    },
    {
      "title": "Client-facing approval workflow",
      "toolA": "Facts don't describe a client approval-link feature.",
      "toolB": "Offers password-free account connections with shareable approval links for clients.",
      "whyItMatters": "Agencies serving external clients need a way for clients to review posts without sharing login credentials.",
      "benefitsWho": "Agencies managing client sign-off without exposing account passwords."
    },
    {
      "title": "Founding year transparency",
      "toolA": "Founding year not documented in available facts.",
      "toolB": "Founded in 2016.",
      "whyItMatters": "Some buyers weigh company longevity during vendor selection.",
      "benefitsWho": "Procurement teams doing vendor due diligence."
    },
    {
      "title": "White-label reporting",
      "toolA": "Facts don't mention white-label reporting.",
      "toolB": "Includes white-label reports, reserved for the Agency tier and above.",
      "whyItMatters": "Agencies presenting branded reports to clients need this capability, which RecurPost documents at higher tiers.",
      "benefitsWho": "Agencies delivering client-facing branded reports."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Automation",
      "rows": [
        {
          "feature": "Evergreen content recycling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted composition",
          "toolA": "available",
          "toolB": "available",
          "note": "Inky (15-50 credits/month) vs. ChatGPT integration + AI image generation."
        },
        {
          "feature": "Bulk CSV import",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Social inbox",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Client & Team Workflows",
      "rows": [
        {
          "feature": "Client approval links (no password sharing)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "White-label reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Agency tier and above."
        },
        {
          "feature": "Social account limits at entry tier",
          "toolA": "available",
          "toolB": "available",
          "note": "5 accounts (Eddie) vs. 2 accounts (Starter)."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial length",
          "toolA": "available",
          "toolB": "available",
          "note": "30 days vs. 14 days."
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "$29.99/month vs. $9/month."
        },
        {
          "feature": "Platforms supported",
          "toolA": "available",
          "toolB": "available",
          "note": "10 networks each."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free trial for MeetEdgar?",
      "answer": "Yes, 30 days with no payment required upfront."
    },
    {
      "question": "What does Inky do?",
      "answer": "Inky is MeetEdgar's AI assistant that generates captions and hashtags for posts."
    },
    {
      "question": "Is there a free trial for RecurPost?",
      "answer": "Yes, 14 days with no credit card required."
    },
    {
      "question": "When was RecurPost founded?",
      "answer": "2016."
    },
    {
      "question": "Does RecurPost use AI?",
      "answer": "Yes, ChatGPT integration for post composition and AI image generation."
    },
    {
      "question": "Which platforms does MeetEdgar support?",
      "answer": "TikTok, Facebook, Instagram, LinkedIn, Pinterest, Google Business Profile, X/Twitter, Threads, YouTube Shorts, and Bluesky."
    }
  ]
};

export default meetedgarVsRecurpostContent;
