import type { ToolComparisonContent } from './types';

const productplanVsSavioContent: ToolComparisonContent = {
  "verdict": "ProductPlan is a visual roadmapping platform with AI-moderated customer research (adaptive survey follow-ups and a Research Agent for plain-language Q&A over research data), priced entirely through custom demos with no public rates. Savio is a feedback-aggregation tool that centralizes feature requests from Slack, HubSpot, Intercom, Zendesk, Salesforce, and Help Scout, then ranks them by revenue impact (requesters, ARR, opportunity value, MRR), with published pricing starting at $39/month (Essential) and a 14-day free trial. They solve adjacent but different problems: ProductPlan builds and shares the roadmap itself, while Savio feeds prioritization decisions into whatever roadmap tool a team already uses.",
  "bestForToolA": "ProductPlan fits teams that want visual, portfolio-level roadmaps with unlimited free viewers and AI-moderated customer research surveys, and are comfortable engaging via a demo since no pricing is published.",
  "bestForToolB": "Savio fits teams that want to centralize feature requests from tools like Slack, HubSpot, Intercom, Zendesk, Salesforce, and Help Scout, and prioritize by revenue data (ARR, MRR, opportunity value), starting at a published $39/month with a 14-day free trial.",
  "whoNeedsBoth": "A SaaS product team could use Savio to aggregate and rank feature requests by ARR and MRR pulled from HubSpot or Salesforce (available on Savio's $249/month Business tier), then push the prioritized list into ProductPlan to build and share the resulting visual roadmap across the organization, since Savio documents dev-tool status sync (Jira, Linear, Shortcut) rather than its own roadmap-presentation layer.",
  "keyDifferences": [
    {
      "title": "Core Focus",
      "toolA": "ProductPlan is a visual roadmapping platform, with AI-moderated customer research as a supporting capability.",
      "toolB": "Savio is a feedback-aggregation and prioritization tool that centralizes feature requests from six-plus support/CRM tools and ranks them by revenue impact.",
      "whyItMatters": "Teams need to know whether they're buying a roadmap-presentation tool or a feedback-intake-and-prioritization tool.",
      "benefitsWho": "Teams that need to communicate a visual roadmap org-wide benefit from ProductPlan; teams drowning in scattered feature requests benefit from Savio."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "ProductPlan publishes no pricing; every tier requires booking a demo.",
      "toolB": "Savio publishes exact tiered pricing: Essential $39/month, Professional $79/month, Business $249/month, and custom Enterprise.",
      "whyItMatters": "Published pricing allows self-serve budget planning without a sales call.",
      "benefitsWho": "Smaller teams or those in early evaluation stages benefit from Savio's published pricing."
    },
    {
      "title": "Revenue-Based Prioritization",
      "toolA": "ProductPlan documents customizable prioritization frameworks generally, without explicitly tying them to CRM revenue data.",
      "toolB": "Savio explicitly sorts feature requests by number of requesters, total ARR, opportunity value, and account MRR pulled from connected CRM data.",
      "whyItMatters": "Revenue-weighted prioritization directly ties product decisions to business impact, which matters for teams accountable to sales and CS.",
      "benefitsWho": "Product teams reporting to revenue-focused stakeholders benefit from Savio's ARR/MRR-based ranking."
    },
    {
      "title": "Free Trial",
      "toolA": "ProductPlan offers no free trial or free plan.",
      "toolB": "Savio offers a 14-day free trial with no credit card required.",
      "whyItMatters": "A trial period lets a team validate fit before any purchasing conversation.",
      "benefitsWho": "Self-serve evaluators benefit from Savio's no-commitment trial."
    },
    {
      "title": "Integration Depth by Tier",
      "toolA": "ProductPlan's only native integration is Jira, available without a documented tier restriction; other tools require its API.",
      "toolB": "Savio gates CRM integrations (HubSpot, Salesforce) to its $249/month Business tier, with Zendesk, Jira, and Shortcut available on the $79/month Professional tier.",
      "whyItMatters": "Tier-gated integrations mean the effective cost of getting the integrations you need may be higher than the entry price suggests.",
      "benefitsWho": "Teams needing HubSpot or Salesforce feedback sync should budget for Savio's Business tier; teams needing only Jira sync can use ProductPlan's cheaper native path."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback & Prioritization",
      "rows": [
        {
          "feature": "Centralized multi-channel feedback collection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Savio: Slack, HubSpot, Intercom, Zendesk, Salesforce, Help Scout"
        },
        {
          "feature": "Revenue-based prioritization (ARR/MRR)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-moderated customer research surveys",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public customer voting boards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Savio: $39/$79/$249/custom"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Savio: 14-day, no credit card"
        },
        {
          "feature": "Unlimited free non-paid/non-admin users",
          "toolA": "available",
          "toolB": "available",
          "note": "ProductPlan: unlimited viewers; Savio: unlimited free non-admin users"
        },
        {
          "feature": "Published entry price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Savio: $39/month (Essential)"
        }
      ]
    },
    {
      "group": "Integrations & Roadmapping",
      "rows": [
        {
          "feature": "Native Jira integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Savio's Jira sync is on the Professional tier ($79/month) and above"
        },
        {
          "feature": "CRM integrations (HubSpot, Salesforce)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Savio Business tier, $249/month"
        },
        {
          "feature": "Visual roadmap timelines",
          "toolA": "available",
          "toolB": "available",
          "note": "ProductPlan's core product; Savio includes roadmaps from 1 (Essential) to unlimited (Business)"
        },
        {
          "feature": "Dev tool status sync back to CRM",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Savio syncs Jira/Linear/Shortcut status into HubSpot/Salesforce"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does ProductPlan publish pricing the way Savio does?",
      "answer": "No, ProductPlan requires booking a demo for every tier and publishes no rates. Savio publishes exact pricing: $39/month (Essential), $79/month (Professional), $249/month (Business), with custom Enterprise pricing."
    },
    {
      "question": "Which tool ties feature requests to revenue?",
      "answer": "Savio explicitly sorts feature requests by number of requesters, total ARR, opportunity value, and account MRR using CRM data. ProductPlan documents general prioritization frameworks without an explicit revenue-tie feature."
    },
    {
      "question": "Does Savio integrate with HubSpot and Salesforce?",
      "answer": "Yes, but only on Savio's $249/month Business tier; the Essential and Professional tiers do not include HubSpot or Salesforce CRM integrations."
    },
    {
      "question": "Is there a free trial for either tool?",
      "answer": "Savio offers a 14-day free trial with no credit card required. ProductPlan does not document a free trial."
    },
    {
      "question": "How is each tool priced per user?",
      "answer": "ProductPlan charges only for active editors, with unlimited free viewers, but doesn't publish the per-editor rate. Savio's Essential plan includes 1 paid user for $39/month, with additional users at $23/month."
    },
    {
      "question": "What does ProductPlan's Research Agent do that Savio doesn't?",
      "answer": "ProductPlan's Research Agent lets users ask plain-language questions about AI-moderated customer research survey data. Savio doesn't document a comparable research-survey or Q&A feature; its focus is aggregating and ranking existing feature requests from support and CRM tools."
    }
  ]
};

export default productplanVsSavioContent;
