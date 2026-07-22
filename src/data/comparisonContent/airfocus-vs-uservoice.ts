import type { ToolComparisonContent } from './types';

const airfocusVsUservoiceContent: ToolComparisonContent = {
  "verdict": "airfocus is an AI-powered prioritization and roadmapping platform for product teams deciding what to build next, with portfolio-level dependency tracking and OKRs. UserVoice is a customer intelligence platform that aggregates feedback from tools like Salesforce and Gong and uses AI to weight requests by revenue impact and flag early churn signals. airfocus decides and plans the roadmap; UserVoice tells you what customers actually need and how much it's worth.",
  "bestForToolA": "Product teams managing multi-product portfolios who need AI-assisted prioritization, OKR tracking, and dependency/risk detection across roadmaps, with AI agents that work alongside Claude and Copilot via an MCP server.",
  "bestForToolB": "Product, sales, and customer success teams that want to correlate customer feedback with deal size, expansion, and retention, and get churn signals that UserVoice states can surface 6-12 months before a customer leaves.",
  "whoNeedsBoth": "A product organization could run airfocus to manage its roadmap, OKRs, and prioritization decisions while feeding in UserVoice's revenue-weighted, churn-flagged feedback data as an input signal for what to prioritize next, though the facts don't document a native integration between the two, so feedback would need to be transferred manually.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "airfocus is a roadmapping, prioritization, and OKR platform built by Lucid Software.",
      "toolB": "UserVoice is a customer intelligence platform that aggregates feedback from multiple sources and weights it by revenue impact.",
      "whyItMatters": "Teams need to know whether they're buying a planning tool or a feedback-intelligence tool before comparing feature depth.",
      "benefitsWho": "Product managers deciding between a roadmap tool and a feedback-analytics tool."
    },
    {
      "title": "Revenue and Churn Correlation",
      "toolA": "airfocus surfaces feedback patterns and flags portfolio-level risks and blockers, but doesn't document revenue-weighting of feedback.",
      "toolB": "UserVoice explicitly correlates customer problems with deal size, expansion, and retention, and its churn signal detection is stated to flag risk 6-12 months before a customer churns.",
      "whyItMatters": "Tying feedback to revenue and churn risk helps teams prioritize the requests that most affect the bottom line.",
      "benefitsWho": "Customer success and revenue teams that need to quantify the financial stakes of product feedback."
    },
    {
      "title": "AI Agent Ecosystem",
      "toolA": "airfocus's AI agents work alongside external tools like Claude and Copilot via a dedicated MCP server, covering feedback triage and PRD co-authoring.",
      "toolB": "UserVoice's AI is used for internal theme detection and revenue weighting, with no documented MCP or external AI-agent integration.",
      "whyItMatters": "Teams already using AI coding/agent tools may want a product tool that plugs directly into that ecosystem.",
      "benefitsWho": "Product teams that use Claude or Copilot alongside their roadmap tool."
    },
    {
      "title": "Evaluation Path",
      "toolA": "airfocus offers no free trial; evaluating it requires booking a demo, though it offers discounted pricing for startups, nonprofits, and educational organizations.",
      "toolB": "UserVoice offers a 30-day hands-on trial via a guided demo workspace, letting a team test the product before committing.",
      "whyItMatters": "A hands-on trial period lowers the risk of committing to a platform sight unseen.",
      "benefitsWho": "Teams that prefer to test-drive software (favors UserVoice) versus teams comfortable with a guided sales demo (airfocus)."
    },
    {
      "title": "Source-System Integrations",
      "toolA": "airfocus documents core integrations at the Professional tier, reserving Jira Server, Azure DevOps Server, and Salesforce integrations for the Enterprise tier.",
      "toolB": "UserVoice documents deep integrations with Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps for pulling feedback signals in from across the business.",
      "whyItMatters": "Both tools depend on connecting to a company's existing CRM/support stack, so integration depth and tier gating matter for total cost.",
      "benefitsWho": "Enterprises with a Salesforce/Gainsight/Gong stack evaluating UserVoice's out-of-box connections versus airfocus's Enterprise-gated ones."
    }
  ],
  "featureMatrix": [
    {
      "group": "Prioritization & Roadmapping",
      "rows": [
        {
          "feature": "AI-powered prioritization",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "OKR tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "airfocus: Enterprise plan"
        },
        {
          "feature": "Portfolio roadmaps with dependency tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Risk/drift detection",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Feedback & Customer Intelligence",
      "rows": [
        {
          "feature": "Multi-source feedback aggregation",
          "toolA": "available",
          "toolB": "available",
          "note": "airfocus: branded portal; UserVoice: Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, Azure DevOps"
        },
        {
          "feature": "Revenue-weighted feedback",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Churn signal detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserVoice: flags risk 6-12 months early"
        },
        {
          "feature": "Role-specific dashboards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "product, sales, CS, support views"
        }
      ]
    },
    {
      "group": "AI & Integrations",
      "rows": [
        {
          "feature": "AI agents with external tool support (Claude/Copilot via MCP)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI theme detection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO/SCIM",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "airfocus: SAML SSO, SCIM on Enterprise"
        },
        {
          "feature": "Free hands-on trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "UserVoice: 30-day trial workspace"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is airfocus or UserVoice better for tying customer feedback to revenue?",
      "answer": "UserVoice is the tool built for this: it correlates feedback with deal size, expansion, and retention, and includes churn signal detection said to surface risk 6-12 months early. airfocus's feedback features focus more on portfolio-level roadmap risk than revenue correlation."
    },
    {
      "question": "Can I try airfocus for free?",
      "answer": "No, airfocus states it does not offer a free trial; evaluating it requires booking a demo."
    },
    {
      "question": "Can I try UserVoice for free?",
      "answer": "Yes, booking a demo sets up a guided workspace so a team can try UserVoice hands-on for 30 days."
    },
    {
      "question": "Does airfocus work with AI tools like Claude?",
      "answer": "Yes, airfocus includes AI agents and an MCP server that let it work alongside external AI tools like Claude and Copilot."
    },
    {
      "question": "What CRMs and support tools does UserVoice integrate with?",
      "answer": "UserVoice integrates with Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps."
    },
    {
      "question": "Who owns airfocus?",
      "answer": "airfocus is part of Lucid Software, a larger visual collaboration company."
    }
  ]
};

export default airfocusVsUservoiceContent;
