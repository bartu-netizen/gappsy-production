import type { ToolComparisonContent } from './types';

const openprojectVsPlanviewContent: ToolComparisonContent = {
  "verdict": "OpenProject is an open-source project management tool with Gantt charts and agile boards, publishing exact per-user pricing and offering a genuinely free, self-hostable Community Edition. Planview is an enterprise portfolio and work management suite that connects corporate strategy, projects, products, and resources for large organizations, but publishes no pricing at all across its Team, Enterprise, and Enterprise Plus tiers. The two operate at different altitudes: OpenProject at the project/task execution level, Planview at the strategic-portfolio level with resource capacity planning across many concurrent initiatives.",
  "bestForToolA": "Teams wanting an open-source, self-hostable project management tool with Gantt charts, agile boards, and a Team Planner at a transparent, published per-user price, including organizations that need a genuinely free Community Edition.",
  "bestForToolB": "Large enterprises needing to connect corporate strategy, project and product portfolios, and resource capacity across many concurrent initiatives, with integrations into delivery tools like Jira, Azure DevOps, and Power BI.",
  "whoNeedsBoth": "A large enterprise could run Planview at the strategic-portfolio level to prioritize and fund initiatives and manage resource capacity across the organization, while individual delivery teams execute day-to-day tasks and Gantt schedules in self-hosted OpenProject, with status rolling up into Planview's executive reporting.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "OpenProject publishes exact pricing: Community free, Basic €5.95/user/month, Professional €10.95/user/month, Premium €15.95/user/month, and custom Corporate pricing.",
      "toolB": "Planview publishes no pricing at all; Team, Enterprise, and Enterprise Plus tiers are all listed as 'Contact for pricing.'",
      "whyItMatters": "Published per-user pricing lets buyers budget without a sales call, while fully quote-based pricing requires direct engagement before any cost estimate.",
      "benefitsWho": "Self-serve buyers and smaller organizations that want cost clarity upfront."
    },
    {
      "title": "Free / Open-Source Tier",
      "toolA": "OpenProject's Community Edition is free, open source under GPL v3, self-hostable, with no minimum user count.",
      "toolB": "Planview has no documented free tier; all listed plans require contacting sales.",
      "whyItMatters": "A genuinely free, unlimited-user open-source option removes cost as a barrier to adoption entirely.",
      "benefitsWho": "Budget-constrained teams and organizations wanting to avoid vendor lock-in."
    },
    {
      "title": "Strategic Portfolio Scope",
      "toolA": "OpenProject's features operate at the project/task level: Gantt charts, agile boards, a Team Planner, and time/cost reporting, without a documented strategic-portfolio layer.",
      "toolB": "Planview includes Strategic Portfolio Management and Product Portfolio Management to connect corporate strategy and investment decisions to funded initiatives.",
      "whyItMatters": "Enterprises managing dozens of initiatives need visibility into how work maps to business strategy, not just individual project schedules.",
      "benefitsWho": "Executives and portfolio managers overseeing many concurrent initiatives across a large organization."
    },
    {
      "title": "Resource & Capacity Management",
      "toolA": "OpenProject documents a Team Planner for visualizing workload and time/cost tracking, but no dedicated capacity-management feature.",
      "toolB": "Planview has dedicated Resource & Capacity Management to spot over- or under-utilization of people across many concurrent projects.",
      "whyItMatters": "Formal capacity management prevents overallocation across a large portfolio of simultaneous initiatives.",
      "benefitsWho": "Resource managers at large organizations juggling many projects and teams at once."
    },
    {
      "title": "Minimum Team Size & Scale Fit",
      "toolA": "OpenProject's paid tiers require a minimum of 25 users (Basic/Professional) or 100+ (Premium), with a €1/user surcharge on monthly Cloud Basic billing, while Community has no minimum at all.",
      "toolB": "Planview's own FAQ states it is built for large and midsize enterprises with complex portfolios, and that small teams needing simple task tracking are usually better served by lighter tools.",
      "whyItMatters": "Neither tool is optimized for very small teams on its paid tiers, but the free OpenProject Community Edition gives small teams a genuine entry point Planview doesn't offer.",
      "benefitsWho": "Very small teams are better served by OpenProject's free Community Edition than by either tool's enterprise-oriented paid tiers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Project & Portfolio Management",
      "rows": [
        {
          "feature": "Gantt charts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Agile/Kanban boards",
          "toolA": "available",
          "toolB": "available",
          "note": "Planview: Lean-Agile Delivery Boards"
        },
        {
          "feature": "Strategic portfolio management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Resource & capacity management",
          "toolA": "limited",
          "toolB": "available",
          "note": "OpenProject: Team Planner only"
        },
        {
          "feature": "Product portfolio management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Time tracking & cost reporting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OpenProject Community, GPL v3, no user minimum"
        },
        {
          "feature": "Published per-user pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenProject: 14-day trial"
        }
      ]
    },
    {
      "group": "Enterprise & AI Features",
      "rows": [
        {
          "feature": "AI-assisted insights",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Planview Copilot"
        },
        {
          "feature": "Jira / Azure DevOps integrations",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Executive roll-up reporting/dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OpenProject free to use?",
      "answer": "Yes, the Community Edition is free and open source under GPL v3, with no minimum user count and self-hosting support."
    },
    {
      "question": "Does Planview publish its pricing?",
      "answer": "No, all of Planview's tiers (Team, Enterprise, Enterprise Plus) are listed as 'Contact for pricing' with no published rates."
    },
    {
      "question": "Which tool handles enterprise strategic portfolio planning?",
      "answer": "Planview, through its Strategic Portfolio Management and Product Portfolio Management features, which connect corporate strategy and investment decisions to funded initiatives. OpenProject does not document a comparable strategic-portfolio layer."
    },
    {
      "question": "Does OpenProject integrate with Jira or Azure DevOps like Planview?",
      "answer": "This is not documented. OpenProject's listed integrations are Nextcloud, GitHub, GitLab, OneDrive/SharePoint, and XWiki, while Planview explicitly connects with Jira, Azure DevOps, Microsoft Teams, Slack, and Power BI."
    },
    {
      "question": "Does either tool offer AI features?",
      "answer": "Planview does, under the Planview Copilot branding, to surface portfolio insights and reduce manual reporting. OpenProject does not document any AI features."
    },
    {
      "question": "Is OpenProject or Planview better for a small team?",
      "answer": "OpenProject's free Community Edition has no user minimum, making it more accessible to small teams. Planview's own FAQ states it's built for large and midsize enterprises, and that small teams needing simple task tracking are usually better served by lighter tools."
    }
  ]
};

export default openprojectVsPlanviewContent;
