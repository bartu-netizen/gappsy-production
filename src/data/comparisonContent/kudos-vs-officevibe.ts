import type { ToolComparisonContent } from './types';

const kudosVsOfficevibeContent: ToolComparisonContent = {
  "verdict": "Kudos is a dedicated recognition-and-rewards platform built around points, awards, nominations, and milestone e-cards, with named enterprise clients like DHL and Vanderbilt University. Officevibe treats recognition as one feature within a broader pulse-survey and anonymous-feedback engagement platform, with AI tools built for interpreting survey data and drafting manager responses.",
  "bestForToolA": "Organizations wanting a rewards-driven recognition program with points redemption, structured awards and nominations, and incentive challenges as the primary engagement mechanism.",
  "bestForToolB": "Managers wanting pulse surveys and anonymous feedback with AI-generated highlights and recommended actions, with recognition cards as a secondary feature.",
  "whoNeedsBoth": "A company could run Officevibe for its core pulse surveys and anonymous feedback loop while using Kudos as a dedicated rewards engine for points-based recognition and milestone celebrations, since Kudos doesn't document survey capability and Officevibe doesn't document a points/redemption system.",
  "keyDifferences": [
    {
      "title": "Core Product Focus",
      "toolA": "Kudos is purpose-built for recognition and rewards, with its entire feature set - peer feed, points, awards, nominations, incentive programs - centered on that use case.",
      "toolB": "Officevibe treats recognition as one feature (Good Vibes Recognition Cards) within a broader engagement-survey platform.",
      "whyItMatters": "A recognition-first tool goes deeper on rewards mechanics than a survey tool that includes recognition as an add-on.",
      "benefitsWho": "Teams whose primary goal is a structured recognition and rewards program."
    },
    {
      "title": "Points-Based Rewards System",
      "toolA": "Kudos has a dedicated Rewards Programs feature with redeemable points.",
      "toolB": "Officevibe's recognition is card-based social recognition without a documented points or redemption system.",
      "whyItMatters": "Redeemable rewards give recognition tangible value beyond a social acknowledgment.",
      "benefitsWho": "Companies that want recognition tied to redeemable incentives, not just social visibility."
    },
    {
      "title": "Survey and Feedback Capability",
      "toolA": "Kudos's feature list does not include pulse or custom surveys.",
      "toolB": "Officevibe has dedicated pulse & custom surveys plus anonymous feedback as core features.",
      "whyItMatters": "Survey data is essential for tracking engagement trends over time, separate from recognition activity.",
      "benefitsWho": "HR teams needing ongoing sentiment tracking, not just recognition."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Kudos has an AI Recognition Assistant that suggests recognition to give.",
      "toolB": "Officevibe has AI-Powered Highlights, AI-Generated Recommended Actions, and Feedback Reply Assistance, oriented toward interpreting survey data and drafting responses.",
      "whyItMatters": "The two tools apply AI to different jobs - prompting recognition versus interpreting feedback.",
      "benefitsWho": "Managers who want AI nudges to recognize employees (Kudos) versus AI help analyzing survey results (Officevibe)."
    },
    {
      "title": "Company Transparency and Client Base",
      "toolA": "Kudos discloses a Canadian headquarters and names enterprise clients including DHL, ENGIE, MU Health Care, and Vanderbilt University.",
      "toolB": "Officevibe does not disclose headquarters but reports reaching 70,000+ leaders worldwide as part of Workleap Technologies Inc.",
      "whyItMatters": "Named client lists and disclosed HQ location can factor into vendor due diligence.",
      "benefitsWho": "Procurement teams evaluating vendor stability and reference customers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer recognition feed",
          "toolA": "available",
          "toolB": "available",
          "note": "Officevibe: Good Vibes cards"
        },
        {
          "feature": "Points-based rewards redemption",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Awards & nominations management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Milestone/anniversary e-cards",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Incentive programs & challenges",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Engagement & Feedback",
      "rows": [
        {
          "feature": "Pulse/custom surveys",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Anonymous feedback collection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "1-on-1 conversation tools",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Dedicated culture 'Spaces'",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Platform Details",
      "rows": [
        {
          "feature": "AI recognition suggestions",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-generated action recommendations",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-drafted feedback replies",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Kudos offer engagement surveys like Officevibe?",
      "answer": "Not documented. Kudos's public feature set centers on recognition, rewards, and milestones rather than pulse surveys or anonymous feedback."
    },
    {
      "question": "Which has a points-based rewards system?",
      "answer": "Kudos, through its Rewards Programs tied to recognition points. Officevibe's Good Vibes cards are recognition-focused but don't document a redemption system."
    },
    {
      "question": "How do the AI features differ?",
      "answer": "Kudos's AI Recognition Assistant suggests recognition to give. Officevibe's AI features (Highlights, Recommended Actions, Reply Assistance) focus on interpreting survey data and drafting manager responses."
    },
    {
      "question": "Where is each company based?",
      "answer": "Kudos describes itself as Canadian. Officevibe does not disclose headquarters but is a Workleap Technologies Inc. product."
    },
    {
      "question": "Is pricing published for either platform?",
      "answer": "No, both Kudos and Officevibe require a demo request to get pricing."
    },
    {
      "question": "Which named enterprise clients does each report?",
      "answer": "Kudos lists DHL, ENGIE, MU Health Care, and Vanderbilt University. Officevibe reports reach of 70,000+ leaders worldwide without naming specific clients."
    }
  ]
};

export default kudosVsOfficevibeContent;
