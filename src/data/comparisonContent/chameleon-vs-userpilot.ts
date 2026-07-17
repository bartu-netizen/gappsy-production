import type { ToolComparisonContent } from './types';

const chameleonVsUserpilotContent: ToolComparisonContent = {
  "verdict": "Chameleon and Userpilot start at a similar price point ($279/month vs. $299/month for roughly 2,000 tracked users) but package different priorities. Chameleon leads with AI-built guidance (Copilot) and flow-governance tooling (Ranger) reserved for its Pro and Growth tiers, while Userpilot bundles compliance certifications (SOC 2 Type 2, HIPAA, GDPR) into its entry Starter tier but gates session replay and mobile engagement behind paid add-ons. Neither is a clear winner — it depends on whether AI-assisted guidance creation or documented compliance and analytics depth at the entry tier matters more.",
  "bestForToolA": "Teams wanting AI-built in-app guidance (Copilot auto-builds experiences and runs analysis) plus automated flow governance (Ranger flags stale or broken flows) and are willing to move into the $750/month Pro tier to unlock them.",
  "bestForToolB": "Teams whose priority is documented compliance from day one — Userpilot's $299/month Starter plan explicitly includes SOC 2 Type 2, HIPAA, and GDPR compliance — combined with an AI agent (Lia) for analyzing data and automating in-app actions.",
  "whoNeedsBoth": "A team evaluating in-app onboarding platforms could run Chameleon's 14-day full-access trial (which includes Enterprise-level features like Copilot and Ranger) alongside Userpilot's free trial to directly compare AI-guidance building against Lia-driven analytics before committing to one platform's paid tier.",
  "keyDifferences": [
    {
      "title": "AI-assisted guidance creation",
      "toolA": "Copilot is Chameleon's AI tool for automatically building in-app guidance and running analysis, included from the Pro plan ($750/month) upward.",
      "toolB": "Lia is Userpilot's AI-powered agent for analyzing product data and automating in-app actions.",
      "whyItMatters": "Both document an AI agent, but Chameleon's Copilot is explicitly tied to building guidance experiences, while Userpilot's Lia is framed around data analysis and automation rather than guidance authoring.",
      "benefitsWho": "Teams that want AI to draft in-app flows directly may prefer Chameleon's Copilot; teams wanting AI-driven data analysis may prefer Userpilot's Lia."
    },
    {
      "title": "Flow governance and maintenance",
      "toolA": "Ranger automatically flags stale flows, broken elements, and inactive seats, included on the Growth tier ($1,250/month annual).",
      "toolB": "No equivalent governance/maintenance feature is documented.",
      "whyItMatters": "Teams running many in-app experiences over time may accumulate broken or stale flows; only Chameleon documents automated detection of this.",
      "benefitsWho": "Larger teams managing many concurrent in-app experiences that need ongoing upkeep."
    },
    {
      "title": "Product analytics depth by tier",
      "toolA": "Chameleon's core analytics is behavior tracking via Compass, with A/B testing and goals available from the Pro tier.",
      "toolB": "Event autocapture and custom dashboards are reserved for the Growth plan ($849/month) and above; the Starter plan does not include them.",
      "whyItMatters": "Buyers wanting deep product analytics at the entry tier will find neither tool includes it at the base price — Userpilot explicitly reserves it for Growth, while Chameleon's Startup tier doesn't document equivalent autocapture dashboards either.",
      "benefitsWho": "Teams budgeting for analytics need to plan for a mid-tier upgrade with either vendor."
    },
    {
      "title": "Session replay and add-ons",
      "toolA": "No session replay or paid add-on structure is documented for Chameleon.",
      "toolB": "Session replay is available as a paid add-on on the Growth plan, and mobile engagement is a separate paid add-on to email engagement.",
      "whyItMatters": "Userpilot's facts explicitly show extra costs for these features beyond the listed plan price, while Chameleon's tiers don't document an equivalent add-on structure.",
      "benefitsWho": "Budget planners who want to know the full cost of a feature set upfront."
    },
    {
      "title": "Compliance certification disclosure",
      "toolA": "Not documented for Chameleon.",
      "toolB": "The Starter plan explicitly includes SOC 2 Type 2, HIPAA, and GDPR compliance.",
      "whyItMatters": "Buyers in regulated industries needing documented compliance at the entry tier have a clear answer from Userpilot but not from Chameleon's facts.",
      "benefitsWho": "Healthcare, finance, and other regulated-industry product teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Guidance Building",
      "rows": [
        {
          "feature": "AI-assisted guidance creation",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon's Copilot (Pro+); Userpilot's Lia agent."
        },
        {
          "feature": "Governance/flow health monitoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chameleon's Ranger, Growth tier."
        },
        {
          "feature": "1:1 personalization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chameleon's Prism."
        },
        {
          "feature": "Guidance types (tours, tooltips, banners, checklists)",
          "toolA": "available",
          "toolB": "available",
          "note": "Userpilot: tooltips, banners, spotlights, flows."
        }
      ]
    },
    {
      "group": "Analytics & Feedback",
      "rows": [
        {
          "feature": "Behavior tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon's Compass; Userpilot's event autocapture (Growth+)."
        },
        {
          "feature": "NPS/CSAT surveys",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Userpilot: paid add-on on the Growth plan."
        },
        {
          "feature": "A/B testing & segmentation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon Startup: $279/month. Userpilot Starter: $299/month."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon: 14-day, full Enterprise access, no card. Userpilot: no card required."
        },
        {
          "feature": "Compliance certification on entry tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Userpilot Starter includes SOC 2 Type 2, HIPAA, GDPR."
        },
        {
          "feature": "Extra seat cost disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chameleon: $300/month per 5 seats on Pro."
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "CRM/support integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon: HubSpot, Salesforce, Slack, Linear. Userpilot: Salesforce, HubSpot, Zendesk, Intercom."
        },
        {
          "feature": "Data warehouse integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Chameleon: Snowflake. Userpilot: warehouse sync on Enterprise."
        },
        {
          "feature": "Mobile engagement",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Userpilot: paid add-on."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Chameleon offer a free trial?",
      "answer": "Yes, Chameleon offers a 14-day free trial with full Enterprise-level access and no credit card required."
    },
    {
      "question": "How is Chameleon priced?",
      "answer": "Chameleon's published plans (Startup, Pro, Growth) are priced by monthly tracked users (MTUs), starting at $279/month for the Startup plan at 2,000 MTUs; Enterprise pricing is custom."
    },
    {
      "question": "What is Copilot?",
      "answer": "Copilot is Chameleon's AI-powered tool for automatically building in-app guidance and running analysis."
    },
    {
      "question": "How much does Userpilot cost?",
      "answer": "The Starter plan is $299/month for up to 2,000 MAUs; the Growth plan starts from $849/month; Enterprise pricing is custom."
    },
    {
      "question": "What is Lia?",
      "answer": "Lia is Userpilot's AI-powered agent for analyzing product data and automating in-app actions."
    },
    {
      "question": "Is session replay included in Userpilot's base plan?",
      "answer": "No, session replay is available as a paid add-on on the Growth plan."
    }
  ]
};

export default chameleonVsUserpilotContent;
