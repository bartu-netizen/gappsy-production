import type { ToolComparisonContent } from './types';

const harvestVsTogglTrackContent: ToolComparisonContent = {
  "verdict": "Harvest and Toggl Track both start free and both track time, but they are built for different jobs. Harvest is a time tracking platform with real invoicing and expense tracking built in from the free tier, aimed at freelancers and small agencies that need to bill clients directly out of the same tool they use to log hours. Toggl Track is built around effortless, cross-platform capture of time across web, mobile, and desktop, plus a wide integration footprint of 100+ connected tools, aimed at teams that already run their invoicing, project management, and billing elsewhere and just need frictionless tracking that plugs into that stack. If billing clients directly from the time tracker matters most, Harvest's free plan gives more out of the box, though it caps out at two projects. If plugging time data into an existing toolchain across many devices matters most, Toggl Track's integration breadth and cross-platform reach are the stronger fit, though its own free tier is capped by user count rather than project count. Neither tool is a strict upgrade over the other. The choice comes down to whether invoicing or integration breadth is the priority, and larger teams needing SSO will pay a premium either way, just on different tiers.",
  "bestForToolA": "Harvest is the better fit for freelancers, consultants, and small agencies who want to track time and send real invoices with expense tracking from the same free plan, without adding a separate billing tool.",
  "bestForToolB": "Toggl Track is the better fit for teams already using many other productivity and project tools who want frictionless, automated time capture across web, mobile, and desktop that plugs into that existing stack via 100+ integrations.",
  "whoNeedsBoth": "An agency that invoices clients through Harvest but has team members embedded in client workflows built around other tools might run Toggl Track for capture and integrations while keeping Harvest as the invoicing system of record.",
  "keyDifferences": [
    {
      "title": "Invoicing and expense tracking",
      "toolA": "Harvest includes real invoicing and expense tracking starting on its free plan",
      "toolB": "Toggl Track's provided facts do not document built-in invoicing or expense tracking",
      "whyItMatters": "For freelancers and small businesses that bill clients directly, having invoicing built into the time tracker removes the need for a separate billing tool",
      "benefitsWho": "Freelancers and small agencies that want to invoice straight out of their time tracker benefit from Harvest here"
    },
    {
      "title": "Integration breadth",
      "toolA": "Harvest documents integrations with Asana and Slack",
      "toolB": "Toggl Track documents 100 plus integrations across productivity and project tools",
      "whyItMatters": "Teams with a large or varied software stack need a time tracker that connects to whatever they already use, not just a couple of named apps",
      "benefitsWho": "Larger or more tool-diverse teams benefit from Toggl Track's broader integration ecosystem"
    },
    {
      "title": "Free plan structure",
      "toolA": "Harvest's free plan is capped at 1 seat and 2 projects but includes full invoicing and expense tracking",
      "toolB": "Toggl Track's free plan is capped by a limited number of users",
      "whyItMatters": "The shape of a free tier cap determines whether a solo user or a small team can realistically run their whole workflow on it for free",
      "benefitsWho": "Solo freelancers with few simultaneous projects benefit from Harvest's structure, while very small teams may prefer Toggl Track's user-based cap"
    },
    {
      "title": "Cross-platform automated tracking",
      "toolA": "Harvest's provided facts do not document automated tracking across web, mobile, and desktop apps",
      "toolB": "Toggl Track explicitly offers time tracking across web, mobile, and desktop apps",
      "whyItMatters": "Field teams and people switching devices throughout the day need tracking that follows them without manual re-entry",
      "benefitsWho": "Mobile or multi-device workers benefit from Toggl Track's cross-platform coverage"
    },
    {
      "title": "Profitability analysis",
      "toolA": "Harvest's provided facts do not document a dedicated profitability analysis feature",
      "toolB": "Toggl Track offers profitability analysis on its Premium tier",
      "whyItMatters": "Agencies pricing projects need visibility into whether billed hours are actually profitable against cost",
      "benefitsWho": "Agencies and project-based businesses on Toggl Track Premium benefit from built-in profitability insight"
    },
    {
      "title": "SSO tier and price",
      "toolA": "Harvest offers SAML-based SSO on its Enterprise tier at 14 dollars per seat per month",
      "toolB": "Toggl Track offers SSO on its Premium tier at 18 dollars per user per month",
      "whyItMatters": "Organizations with identity provider requirements need to know which tier and price unlocks SSO before rolling the tool out company-wide",
      "benefitsWho": "IT-managed teams needing SSO get it at a lower per-seat price on Harvest Enterprise than on Toggl Track Premium"
    },
    {
      "title": "Entry-level paid plan pricing",
      "toolA": "Harvest's Teams plan is 9 dollars per seat per month",
      "toolB": "Toggl Track's Starter plan is 9 dollars per user per month",
      "whyItMatters": "The two tools price their first paid tier identically, so the deciding factor becomes which set of Starter or Teams features matters more, not raw cost",
      "benefitsWho": "Budget-conscious small teams find the entry cost equivalent between the two, so the tiebreaker is feature fit rather than price"
    },
    {
      "title": "Top-tier plan pricing model",
      "toolA": "Harvest's Enterprise tier is a fixed 14 dollars per seat per month",
      "toolB": "Toggl Track's Enterprise tier is custom pricing",
      "whyItMatters": "Fixed enterprise pricing is easier to budget for upfront, while custom pricing usually means negotiation and added capabilities beyond the standard tiers",
      "benefitsWho": "Cost-predictable budgeting favors Harvest, while organizations needing negotiated terms or added support may prefer engaging Toggl Track's custom Enterprise process"
    },
    {
      "title": "Core product focus",
      "toolA": "Harvest centers on time tracking paired with invoicing and expense tracking",
      "toolB": "Toggl Track centers on time tracking paired with broad integrations and profitability reporting",
      "whyItMatters": "The core focus signals which adjacent workflow, billing versus tool ecosystem connectivity, each product is optimized to support",
      "benefitsWho": "Businesses that bill clients directly benefit from Harvest's focus, while businesses centered on a broader software stack benefit from Toggl Track's focus"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Time Tracking",
      "rows": [
        {
          "feature": "Time tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated tracking across web, mobile, and desktop",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stated explicitly for Toggl Track"
        },
        {
          "feature": "Billable rates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stated explicitly for Toggl Track"
        }
      ]
    },
    {
      "group": "Invoicing and Expense Management",
      "rows": [
        {
          "feature": "Invoicing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from Harvest's free tier"
        },
        {
          "feature": "Expense tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from Harvest's free tier"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Asana integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Slack integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Overall integration breadth",
          "toolA": "limited",
          "toolB": "available",
          "note": "Toggl Track documents 100 plus integrations versus two named integrations for Harvest"
        }
      ]
    },
    {
      "group": "Reporting and Profitability",
      "rows": [
        {
          "feature": "Project profitability analysis",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Toggl Track Premium"
        }
      ]
    },
    {
      "group": "Security and Access Control",
      "rows": [
        {
          "feature": "SAML-based SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Harvest Enterprise tier and Toggl Track Premium tier respectively"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Harvest caps at 1 seat and 2 projects; Toggl Track caps at a limited number of users"
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Harvest Teams at 9 dollars per seat per month; Toggl Track Starter at 9 dollars per user per month"
        },
        {
          "feature": "Enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Harvest Enterprise at 14 dollars per seat per month fixed; Toggl Track Enterprise is custom pricing"
        }
      ]
    },
    {
      "group": "Platform Availability",
      "rows": [
        {
          "feature": "Web app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Desktop app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Harvest or Toggl Track?",
      "answer": "Their entry paid tiers are priced the same at 9 dollars per seat or user per month, Harvest Teams versus Toggl Track Starter, but Harvest's free plan includes invoicing and expense tracking while Toggl Track's free plan is capped by number of users, and Harvest's Enterprise tier is a fixed 14 dollars per seat per month versus Toggl Track's custom-priced Enterprise tier."
    },
    {
      "question": "Does Harvest include invoicing like Toggl Track does?",
      "answer": "Harvest includes real invoicing and expense tracking starting on its free plan, while Toggl Track's documented facts do not confirm built-in invoicing, so teams needing invoicing directly from the time tracker are better served by Harvest."
    },
    {
      "question": "Which tool has more integrations, Harvest or Toggl Track?",
      "answer": "Toggl Track documents 100 plus integrations, while Harvest documents specific integrations with Asana and Slack, making Toggl Track the broader choice for teams with a varied software stack."
    },
    {
      "question": "Can Toggl Track track time across mobile and desktop like Harvest?",
      "answer": "Toggl Track explicitly supports automated time tracking across web, mobile, and desktop apps, while Harvest's provided facts do not document cross-platform automated tracking specifically."
    },
    {
      "question": "Does either tool offer single sign-on for larger teams?",
      "answer": "Yes, both offer SAML-based single sign-on, Harvest on its Enterprise tier at 14 dollars per seat per month and Toggl Track on its Premium tier at 18 dollars per user per month."
    },
    {
      "question": "Is Harvest or Toggl Track better for tracking project profitability?",
      "answer": "Toggl Track documents a dedicated profitability analysis feature on its Premium tier, while Harvest's provided facts do not document an equivalent profitability analysis feature."
    }
  ]
};

export default harvestVsTogglTrackContent;
