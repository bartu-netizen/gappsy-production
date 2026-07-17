import type { ToolComparisonContent } from './types';

const ahaVsNoltContent: ToolComparisonContent = {
  "verdict": "Aha! is a comprehensive product management suite spanning strategy, roadmapping, discovery, ideas, whiteboards, and delivery coordination, priced from $74.59/user/month with add-on modules like Discovery and Builder. Nolt is a focused feedback board and roadmap tool for collecting and prioritizing user feedback, priced per board starting at $29/month with unlimited users on every plan. Aha! suits teams needing an end-to-end product management system, while Nolt suits teams that specifically need a public-facing feedback and voting board with lighter roadmap communication.",
  "bestForToolA": "Aha! fits product teams that want strategy-through-delivery tooling in one suite, including roadmaps, customer interview management (Discovery), idea collection, whiteboarding, and an AI assistant (Elle), and can absorb per-user pricing starting at $74.59/month.",
  "bestForToolB": "Nolt fits teams that primarily need a public or private feedback board with voting, commenting, and a shareable roadmap, at a flat per-board price with unlimited users included even on the cheapest $29/month Essential plan.",
  "whoNeedsBoth": "A product team could use Aha! internally for strategic roadmapping and delivery coordination while embedding Nolt as the external-facing feedback board customers use to submit and vote on ideas that eventually feed into Aha!'s roadmap.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Aha! prices per user, starting at $74.59/user/month for Premium and rising to $149/user/month for Enterprise+.",
      "toolB": "Nolt prices per board rather than per user, with unlimited users, content, and admins on every plan, starting at $29/month for one board (Essential).",
      "whyItMatters": "Per-user pricing scales with team size while per-board pricing scales with the number of feedback boards, so costs grow very differently depending on team structure.",
      "benefitsWho": "Larger teams with many contributors benefit from Nolt's unlimited-user model; teams wanting broader functionality accept Aha!'s per-user cost."
    },
    {
      "title": "Scope of Functionality",
      "toolA": "Aha! covers the full product lifecycle: Roadmaps, Discovery (customer interviews), Ideas, Whiteboards, Builder (AI prototyping), and Develop/Teamwork for engineering delivery.",
      "toolB": "Nolt focuses specifically on feedback boards and roadmap communication, without discovery, whiteboarding, or delivery-tracking modules.",
      "whyItMatters": "Teams needing broader strategic and delivery tooling outgrow a feedback-board-only tool.",
      "benefitsWho": "Full product teams managing strategy through delivery benefit from Aha!'s breadth; teams that just need feedback collection avoid paying for unused modules with Nolt."
    },
    {
      "title": "AI Features",
      "toolA": "Aha! includes the Elle AI assistant built into the platform plus Aha! Builder for AI-powered prototype and application creation.",
      "toolB": "Nolt's documented feature list does not mention AI capabilities.",
      "whyItMatters": "AI assistance can speed up roadmap drafting, prototyping, and idea triage.",
      "benefitsWho": "Teams wanting AI-accelerated product work benefit from Aha!'s Elle assistant and Builder."
    },
    {
      "title": "Free Access",
      "toolA": "Aha! has no free plan, offering only a 30-day free trial; Enterprise and Enterprise+ plans include free reviewer/viewer seats.",
      "toolB": "Nolt also has no free plan, but offers a 10-day free trial of the Pro plan with no credit card required.",
      "whyItMatters": "Neither is free long-term, but trial length and read-only-seat policies affect who can access the tool without paying.",
      "benefitsWho": "Large organizations needing many read-only stakeholders benefit from Aha!'s free viewer/reviewer seats on Enterprise plans."
    },
    {
      "title": "Integration Depth",
      "toolA": "Aha! includes 40+ tool integrations even on the entry Premium plan.",
      "toolB": "Nolt's integrations are split by tier: Slack, Discord, GitHub, and Trello on the $29/month Essential plan, with Zapier, Intercom, Microsoft Teams, Linear, Monday, Asana, and Jira reserved for the $69/month Pro plan.",
      "whyItMatters": "Gated integrations can force an upgrade just to connect commonly used tools like Jira or Zapier.",
      "benefitsWho": "Teams needing Jira or Zapier connections from day one benefit from knowing Nolt requires the pricier Pro tier for those."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback & Ideation",
      "rows": [
        {
          "feature": "Public feedback boards",
          "toolA": "available",
          "toolB": "available",
          "note": "Aha!: Aha! Ideas"
        },
        {
          "feature": "Voting/commenting on ideas",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Shareable roadmap",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Customer interview management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha! Discovery"
        }
      ]
    },
    {
      "group": "Product Delivery",
      "rows": [
        {
          "feature": "Engineering workflow management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Aha! Develop and Teamwork"
        },
        {
          "feature": "Whiteboarding",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI prototyping/app creation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Aha! Builder"
        },
        {
          "feature": "Built-in AI assistant",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Elle"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both offer trials only, no free plan"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Aha!: 30 days; Nolt: 10-day Pro trial, no credit card"
        },
        {
          "feature": "Unlimited users on entry plan",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Zapier integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nolt Pro plan only ($69/month)"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Aha! have a free plan?",
      "answer": "No public free plan is offered; Aha! provides a 30-day free trial instead."
    },
    {
      "question": "Does Nolt have a free plan?",
      "answer": "No, Nolt has no free plan; new boards start with a 10-day free trial of the Pro plan and no credit card is required."
    },
    {
      "question": "How much does each cost to start?",
      "answer": "Aha! starts at $74.59/user/month for the Premium plan, while Nolt starts at $29/month per board for the Essential plan."
    },
    {
      "question": "Does Aha! include AI features?",
      "answer": "Yes, it includes the Elle AI assistant and Aha! Builder, an AI-powered prototype and application creation tool."
    },
    {
      "question": "What integrations does Nolt's cheapest plan include?",
      "answer": "The Essential plan includes Slack, Discord, GitHub, and Trello; integrations like Jira, Linear, and Zapier require the $69/month Pro plan."
    },
    {
      "question": "Are viewer and reviewer seats free on Aha!?",
      "answer": "Yes, on the Enterprise and Enterprise+ plans, read-only users (reviewers and viewers) are free."
    }
  ]
};

export default ahaVsNoltContent;
