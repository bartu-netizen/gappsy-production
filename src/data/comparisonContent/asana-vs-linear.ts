import type { ToolComparisonContent } from './types';

const asanaVsLinearContent: ToolComparisonContent = {
  "verdict": "Asana and Linear both fall under the project management umbrella, but they serve different jobs. Asana is a general-purpose work management platform: the same underlying tasks can be viewed as a list, board, timeline, or calendar, which suits marketing, operations, and cross-functional teams that need flexible views without duplicating data. Its enterprise capabilities, such as AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management, are offered as add-ons to any plan rather than locked behind a full Enterprise tier, giving smaller teams a path to selectively add advanced functionality. Linear is purpose-built for software engineering teams that need speed and structure: issue tracking, sprint-like cycles, projects and initiatives, and native Git and PR integrations that connect issues to branches, commits, and pull requests. Its free plan supports unlimited members but caps teams and issue volume, while features like private teams, guest access, Linear Insights analytics, and AI-assisted triage require its Business tier or above. Neither tool is objectively better: Asana fits teams managing varied work across departments who want flexible views, while Linear fits engineering-focused teams that want a fast, opinionated workflow tied directly into their codebase. The right choice depends on whether the work being tracked is general project work or software development work.",
  "bestForToolA": "Asana is the better fit for cross-functional teams across marketing, operations, and general project work who need the same tasks viewable as lists, boards, timelines, and calendars, and who want enterprise add-ons like Compliance Management or Timesheets and Budgets without committing to a full Enterprise plan.",
  "bestForToolB": "Linear is the better fit for software engineering teams that want a fast, keyboard-driven issue tracker with native Git and PR integrations, sprint-like cycles, and a triage inbox for incoming bug reports.",
  "whoNeedsBoth": "Organizations where product and engineering teams use Linear for issue tracking and cycles while marketing, operations, or leadership use Asana for broader project and initiative tracking would reasonably run both tools rather than standardizing on one.",
  "keyDifferences": [
    {
      "title": "Core use case",
      "toolA": "Asana is a general work management platform with list, board, timeline, and calendar views for tracking any kind of project.",
      "toolB": "Linear is an issue tracker built specifically for software teams, centered on issues, cycles, projects, and initiatives.",
      "whyItMatters": "Choosing a tool built for the wrong kind of work means fighting the tool's structure instead of benefiting from it.",
      "benefitsWho": "General and cross-functional teams benefit from Asana's flexibility, while software engineering teams benefit from Linear's opinionated, engineering-specific workflow."
    },
    {
      "title": "Free plan limits",
      "toolA": "Asana's free Personal plan is capped at 2 users.",
      "toolB": "Linear's free plan allows unlimited members but caps the account at up to 2 teams and up to 250 issues.",
      "whyItMatters": "Free plan limits determine whether a small team can actually collaborate without paying immediately.",
      "benefitsWho": "Small teams with more than 2 people benefit from Linear's higher free-user ceiling, though heavy issue volume will still push them toward a paid tier."
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "Asana's Starter plan is $10.99 per user per month, billed annually.",
      "toolB": "Linear's Basic plan is $10 per user per month, billed annually.",
      "whyItMatters": "Per-seat pricing compounds quickly for larger teams, so even a small per-seat gap matters at scale.",
      "benefitsWho": "Budget-conscious teams of any size benefit from comparing these near-identical entry price points against what each tier actually includes."
    },
    {
      "title": "Task view flexibility",
      "toolA": "Asana lets teams view the same underlying tasks as a list, board, timeline, or calendar without duplicating data.",
      "toolB": "Linear's documented structure centers on cycles, projects, and initiatives rather than multiple interchangeable task views.",
      "whyItMatters": "Teams with varied reporting needs, such as showing timelines to executives and boards to contributors, need view flexibility.",
      "benefitsWho": "Teams that report progress in different formats to different stakeholders benefit from Asana's multi-view setup."
    },
    {
      "title": "AI feature availability",
      "toolA": "Asana's AI Studio is included on paid tiers, Starter and above, with a monthly AI credit allowance.",
      "toolB": "Linear's AI-assisted triage, which helps summarize, deduplicate, and route incoming issues, is available on paid tiers.",
      "whyItMatters": "AI features are often a deciding factor for teams evaluating recurring subscription costs.",
      "benefitsWho": "Teams that want AI help with day-to-day work benefit from either tool once on a paid plan, though the use case differs: general work assistance for Asana versus issue triage for Linear."
    },
    {
      "title": "Native Git and PR integration",
      "toolA": "Asana's provided facts do not document a native Git or pull request integration.",
      "toolB": "Linear links issues directly to branches, commits, and pull requests across GitHub, GitLab, and similar providers, with automatic status updates.",
      "whyItMatters": "Engineering teams rely on issue-to-code linkage to avoid manually updating ticket status.",
      "benefitsWho": "Software development teams benefit most from Linear's native Git integration."
    },
    {
      "title": "Enterprise features as add-ons versus bundled tiers",
      "toolA": "Asana offers AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management as add-ons available to any plan.",
      "toolB": "Linear bundles its advanced admin and security features, such as SAML/SCIM, dedicated support, and advanced admin controls, inside its Enterprise tier.",
      "whyItMatters": "Add-on pricing lets smaller teams selectively pay for one enterprise capability, while tier-bundled features require a full upgrade to access any of them.",
      "benefitsWho": "Mid-sized teams that need one enterprise capability without a full Enterprise contract benefit from Asana's add-on model."
    },
    {
      "title": "Cross-platform native apps",
      "toolA": "Asana's provided facts do not document native desktop or mobile apps.",
      "toolB": "Linear offers native desktop apps for Mac and Windows plus mobile apps for iOS and Android.",
      "whyItMatters": "Native apps affect performance and offline reliability compared with browser-only access.",
      "benefitsWho": "Teams that want a consistent native experience across devices benefit from Linear's documented cross-platform apps."
    },
    {
      "title": "Self-hosting and on-premise deployment",
      "toolA": "Asana's provided facts do not address self-hosted or on-premise deployment.",
      "toolB": "Linear explicitly does not offer a self-hosted or on-premise deployment option.",
      "whyItMatters": "Organizations with strict data-residency or compliance requirements need to know upfront whether on-premise deployment is even possible.",
      "benefitsWho": "Teams without strict data-residency requirements are unaffected, but this rules out Linear for organizations that require self-hosting."
    }
  ],
  "featureMatrix": [
    {
      "group": "Views and workflow structure",
      "rows": [
        {
          "feature": "Multiple task views (list, board, timeline, calendar)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Linear's documented structure centers on cycles and projects rather than interchangeable multi-view boards."
        },
        {
          "feature": "Sprint-like recurring cycles",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Visual roadmaps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Dedicated triage inbox for incoming issues",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI features",
      "rows": [
        {
          "feature": "AI assistance included on paid tiers",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana's AI Studio is on Starter and above; Linear's AI-assisted triage requires a paid tier."
        },
        {
          "feature": "Monthly AI credit allowance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Engineering and developer integrations",
      "rows": [
        {
          "feature": "Native Git and PR integration (GitHub, GitLab)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Public API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Third-party integrations (Slack, Figma, Zendesk, and similar tools)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Analytics and reporting",
      "rows": [
        {
          "feature": "Built-in analytics (throughput, cycle time, workload trends)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linear Insights; requires Business tier or above."
        }
      ]
    },
    {
      "group": "Platform availability",
      "rows": [
        {
          "feature": "Native desktop apps (Mac, Windows)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native mobile apps (iOS, Android)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise and admin controls",
      "rows": [
        {
          "feature": "Modular enterprise add-ons (AI Teammates, Timesheets and Budgets, Compliance Management, Permissions Management)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as add-ons to any Asana plan."
        },
        {
          "feature": "SAML/SCIM and advanced security",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Enterprise tier only."
        },
        {
          "feature": "Private teams and guest access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Business tier and above."
        },
        {
          "feature": "Self-hosted or on-premise deployment",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Explicitly listed as a Linear limitation."
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Asana's free Personal plan is capped at 2 users; Linear's free plan allows unlimited members but caps teams and issues."
        },
        {
          "feature": "Entry-level paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Starter is $10.99/user/month; Linear Basic is $10/user/month, both billed annually."
        },
        {
          "feature": "Custom enterprise pricing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Asana or Linear?",
      "answer": "Both offer free plans and similarly priced entry paid tiers, with Asana's Starter plan at $10.99 per user per month versus Linear's Basic plan at $10 per user per month, but Linear's free plan allows unlimited members while Asana's free Personal plan is capped at just 2 users, making Linear the more accessible free option for small teams."
    },
    {
      "question": "Is Linear good for non-technical teams?",
      "answer": "No, Linear's documented features center on issue tracking, cycles, and Git integrations for software engineering teams, and its own listed limitations state it isn't designed for non-technical departments such as marketing, sales, or HR, so Asana's broader task views make it the better fit there."
    },
    {
      "question": "Can Asana do what Linear does?",
      "answer": "Not fully based on the documented facts: Asana's verified feature set centers on task views (list, board, timeline, calendar) and AI Studio, but it doesn't document Linear's engineering-specific features like native Git and PR linking, sprint-like cycles, or a triage inbox."
    },
    {
      "question": "Does Linear have a free plan?",
      "answer": "Yes, Linear's Free plan includes unlimited members, up to 2 teams, up to 250 issues, and core issue tracking, projects, and cycles."
    },
    {
      "question": "Does Asana include AI features on all plans?",
      "answer": "No, Asana's AI Studio is included on paid tiers starting with Starter and above, with a monthly AI credit allowance, and is not part of the free Personal plan."
    },
    {
      "question": "Which tool has better Git integration?",
      "answer": "Linear documents native Git and PR integrations that link issues to branches, commits, and pull requests across GitHub, GitLab, and similar providers, while Asana's verified facts don't document a comparable native Git integration."
    }
  ]
};

export default asanaVsLinearContent;
