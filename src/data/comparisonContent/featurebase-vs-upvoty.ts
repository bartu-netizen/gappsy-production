import type { ToolComparisonContent } from './types';

const featurebaseVsUpvotyContent: ToolComparisonContent = {
  "verdict": "Featurebase is a broader customer support and feedback platform combining an omnichannel inbox (in-app, Slack, Discord, email), an AI support agent (Fibi), and feedback/roadmap tools, with a free single-seat plan; Upvoty is a focused feedback board and roadmap tool with AI-based duplicate detection (Merge AI) but no support inbox and no free plan. Featurebase suits teams that want to combine support ticketing with feedback collection in one product; Upvoty suits teams that only need a public feedback/roadmap surface without a full support suite.",
  "bestForToolA": "Featurebase fits support-and-product teams that want a free single-seat inbox to start, then AI-assisted ticket resolution (Fibi, at $0.49 per resolution) and feedback tooling together, from $29/seat/month.",
  "bestForToolB": "Upvoty fits teams that just need a dedicated feedback board and roadmap without a support inbox, starting at $15/month with no per-seat AI usage fees.",
  "whoNeedsBoth": "A team already standardized on another support tool could run Upvoty separately as a lightweight, low-cost public roadmap — but for most buyers this would be redundant, since Featurebase's own Feedback hub already covers voting and roadmap functionality.",
  "keyDifferences": [
    {
      "title": "Support Inbox",
      "toolA": "Unifies in-app, Slack, Discord, and email conversations in one omnichannel inbox, included on the free plan.",
      "toolB": "No support inbox; purely feedback boards and a roadmap.",
      "whyItMatters": "Teams evaluating an all-in-one vs. point solution need to know whether ticketing is bundled in.",
      "benefitsWho": "Benefits small support teams wanting to consolidate tools into one product."
    },
    {
      "title": "Free Plan",
      "toolA": "Free plan for 1 seat with live chat, unified inbox, and mobile app access (no AI support).",
      "toolB": "No free plan; the cheapest tier is $15/month, with a 14-day free trial.",
      "whyItMatters": "Solo founders or very small teams may need a genuine $0 entry point.",
      "benefitsWho": "Benefits bootstrapped startups and solo operators."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Fibi AI agent for automated ticket resolution ($0.49/resolution, Growth tier and above), plus AI feedback prioritization and an AI Copilot.",
      "toolB": "Merge AI for duplicate feedback-post detection only.",
      "whyItMatters": "The depth of AI usage differs sharply — Featurebase's AI touches support conversations, Upvoty's touches only feedback triage.",
      "benefitsWho": "Benefits teams wanting AI to reduce support ticket volume, not just clean up a feedback board."
    },
    {
      "title": "Pricing Model",
      "toolA": "Per-seat pricing ($29-$99/seat/month) plus $0.49 per AI resolution.",
      "toolB": "Flat per-project pricing ($15-$49/month) with no per-seat or usage fees.",
      "whyItMatters": "Growing support teams pay more per seat on Featurebase, while Upvoty's cost stays flat regardless of team size.",
      "benefitsWho": "Benefits larger support teams that prefer predictable flat pricing (Upvoty) vs. teams comfortable with usage-based AI billing (Featurebase)."
    },
    {
      "title": "Compliance",
      "toolA": "Reports SOC 2, GDPR, and CCPA compliance.",
      "toolB": "Not documented.",
      "whyItMatters": "Enterprise buyers with security review requirements need documented compliance certifications.",
      "benefitsWho": "Benefits mid-market and enterprise buyers with procurement security checklists."
    }
  ],
  "featureMatrix": [
    {
      "group": "Support & Inbox",
      "rows": [
        {
          "feature": "Omnichannel inbox (Slack/Discord/email/in-app)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Live chat",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Featurebase: included on Free plan"
        },
        {
          "feature": "AI-native help center/docs",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Workflows/SLA automation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Featurebase: Professional tier and above"
        }
      ]
    },
    {
      "group": "Feedback & Roadmap",
      "rows": [
        {
          "feature": "Public feedback/voting board",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Public roadmap",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Changelog",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI duplicate detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Upvoty's Merge AI"
        }
      ]
    },
    {
      "group": "AI & Compliance",
      "rows": [
        {
          "feature": "AI support agent",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Featurebase's Fibi, Growth tier+, $0.49/resolution"
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Featurebase: 1 seat, no AI"
        },
        {
          "feature": "SOC 2/GDPR/CCPA compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API/MCP/Webhooks",
          "toolA": "available",
          "toolB": "available",
          "note": "Featurebase: Professional tier+; Upvoty: Power tier+"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either have a free plan?",
      "answer": "Featurebase does, offering 1 seat with live chat and a unified inbox (no AI support); Upvoty has no free plan, only a 14-day trial."
    },
    {
      "question": "Which includes a support inbox?",
      "answer": "Featurebase unifies Slack, Discord, email, and in-app conversations in one inbox; Upvoty has no support inbox at all."
    },
    {
      "question": "How is AI priced on Featurebase?",
      "answer": "Featurebase charges $0.49 per AI resolution in addition to its per-seat monthly pricing."
    },
    {
      "question": "Which has duplicate feedback detection?",
      "answer": "Upvoty's Merge AI automatically detects duplicate posts; this isn't documented for Featurebase."
    },
    {
      "question": "Which is cheaper for a small team?",
      "answer": "Upvoty's flat $15/month vs. Featurebase's $29/seat/month Growth plan, though Featurebase's Free plan covers 1 seat at $0."
    },
    {
      "question": "Does either offer startup discounts?",
      "answer": "Featurebase offers an 86% discount plus a year of free Fibi AI for startups under 2 years old with fewer than 6 employees; this isn't documented for Upvoty."
    }
  ]
};

export default featurebaseVsUpvotyContent;
