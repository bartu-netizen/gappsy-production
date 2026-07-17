import type { ToolComparisonContent } from './types';

const asanaVsPlankaContent: ToolComparisonContent = {
  "verdict": "Asana is a hosted work management platform with list, board, timeline, and calendar views of the same tasks, plus AI Studio and modular enterprise add-ons, priced per user starting at $10.99/month on the Starter plan. Planka is an open-source Kanban board tool that can be fully self-hosted for free, or run on Planka's own hosted infrastructure starting around €13/month base plus per-user fees, with a paid Pro tier unlocking branding and additional views. The two suit different scales of team and different appetites for self-hosting versus managed SaaS.",
  "bestForToolA": "Asana fits teams that need to view the same work as lists, boards, timelines, and calendars interchangeably, and that want AI Studio and add-ons like Timesheets & Budgets or Compliance Management without switching platforms.",
  "bestForToolB": "Planka fits small teams or technical organizations that want a free, self-hosted Kanban board with real-time sync and OIDC single sign-on, or that are comfortable paying a modest per-user hosted fee instead of Asana's per-user SaaS pricing.",
  "whoNeedsBoth": "A software team might self-host Planka for engineering's day-to-day Kanban board (leveraging its REST API and self-hosted control) while using Asana company-wide for cross-functional project timelines and AI Studio reporting that Planka does not offer.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "Asana is a hosted SaaS product with no self-hosted option.",
      "toolB": "Planka offers a free, self-hosted Community edition deployable via Docker, source available on GitHub, as well as managed hosted plans.",
      "whyItMatters": "Self-hosting gives full infrastructure control and can avoid per-user SaaS costs, at the expense of needing to operate the server yourself.",
      "benefitsWho": "Engineering teams with DevOps capacity benefit from Planka's self-hosted option; teams that want zero infrastructure responsibility benefit from Asana's fully managed SaaS."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Asana's free Personal plan is capped at 2 users, making it unusable for real team collaboration without upgrading.",
      "toolB": "Planka's Community Self-Hosted edition is free with no user cap, though it lacks calendar/map views, recurring cards, and custom branding, and its license prohibits cross-company use.",
      "whyItMatters": "A 2-user cap forces small teams into a paid plan almost immediately, while a feature-limited-but-unlimited-users free tier can support a full team at zero cost.",
      "benefitsWho": "Small teams on a budget benefit from Planka's free self-hosted tier over Asana's 2-user free cap."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Asana charges per user per month: $10.99 (Starter) or $24.99 (Advanced), billed annually, plus custom Enterprise pricing.",
      "toolB": "Planka's hosted plans combine a monthly base fee with per-user pricing, e.g. Community Hosted at €13.00/month base plus €2.60-2.90/user/month (minimum 5 users), or Pro Hosted at €42.50/month base plus €8.50-9.40/user/month.",
      "whyItMatters": "Base-plus-per-user pricing can be cheaper than pure per-seat pricing for larger teams, but the comparison depends on team size and which features are needed.",
      "benefitsWho": "Larger self-hosted teams may find Planka's base-fee structure more predictable, while Asana's flat per-user rate is simpler to estimate for smaller headcounts."
    },
    {
      "title": "AI and Enterprise Add-Ons",
      "toolA": "Asana includes AI Studio (with a monthly credit allowance) on paid tiers, plus modular add-ons like AI Teammates, Timesheets & Budgets, Compliance Management, and Permissions Management available on any plan.",
      "toolB": "Planka's documented feature set does not include AI features; its Pro tier instead adds custom branding, calendar and map views, and recurring cards.",
      "whyItMatters": "Teams that want AI-assisted work management or granular enterprise controls without jumping to a top-tier plan need a platform that offers them as add-ons.",
      "benefitsWho": "Larger organizations needing compliance or AI-assisted workflows benefit from Asana's modular add-on model, which Planka does not offer."
    },
    {
      "title": "Authentication and API Access",
      "toolA": "Asana's authentication and API details are not specified in the available facts.",
      "toolB": "Planka supports OIDC-based single sign-on and a documented REST API with a Swagger UI reference plus community Python and PHP SDKs.",
      "whyItMatters": "Documented SSO and API access matter for teams that need to integrate a Kanban tool into an existing identity and tooling stack.",
      "benefitsWho": "Technical teams building custom integrations benefit from Planka's documented REST API and OIDC support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Task Management",
      "rows": [
        {
          "feature": "List/board/timeline/calendar views",
          "toolA": "available",
          "toolB": "limited",
          "note": "Planka is Kanban-board-centric; calendar/map views are Pro-only"
        },
        {
          "feature": "Kanban boards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time board synchronization",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Recurring cards",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Planka: Pro tier only"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Asana Personal capped at 2 users; Planka Community Self-Hosted has no user cap"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Starter $10.99/user/mo vs Planka Community Hosted ~€13/mo base + €2.60-2.90/user"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Enterprise/custom plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Planka Enterprise requires minimum 1000 users"
        }
      ]
    },
    {
      "group": "AI & Enterprise Controls",
      "rows": [
        {
          "feature": "AI feature set",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Asana AI Studio on paid tiers"
        },
        {
          "feature": "Compliance/permissions add-ons",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Planka supports OIDC-based SSO"
        },
        {
          "feature": "Custom branding",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Planka: Pro tier only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Asana or Planka cheaper for a small team?",
      "answer": "Planka's Community Self-Hosted edition is free with no user limit if you're willing to self-host, while Asana's free Personal plan is capped at 2 users, so real team use on Asana requires the $10.99/user/month Starter plan."
    },
    {
      "question": "Does Planka have AI features like Asana's AI Studio?",
      "answer": "No, Planka's documented feature set does not include AI tooling; Asana includes AI Studio with a monthly credit allowance on its Starter plan and above."
    },
    {
      "question": "Can Planka be self-hosted?",
      "answer": "Yes, Planka's Community edition is free, open source, and deployable via Docker on your own server; Asana has no self-hosted option."
    },
    {
      "question": "Does Asana support single sign-on?",
      "answer": "SSO is not specified in Asana's documented facts here, while Planka explicitly supports OIDC-based single sign-on."
    },
    {
      "question": "What does Planka's Pro tier add over the free Community edition?",
      "answer": "Pro adds custom branding (logo, colors, login page), worker and guest roles, calendar and map views, cross-company use rights, and recurring cards, none of which are in the free Community Self-Hosted edition."
    },
    {
      "question": "Which tool offers more views of the same task data?",
      "answer": "Asana explicitly offers list, board, timeline, and calendar views of the same underlying tasks; Planka is primarily a Kanban board, with calendar and map views reserved for its Pro tier."
    }
  ]
};

export default asanaVsPlankaContent;
