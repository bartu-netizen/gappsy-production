import type { GroupComparisonContent } from './types';

const capsuleCrmVsHubspotCrmVsTeamgateContent: GroupComparisonContent = {
  "verdict": "Capsule CRM, HubSpot CRM, and Teamgate all offer usable free tiers for small teams, but they solve different problems. HubSpot pairs an unlimited-user free CRM with the deepest integration ecosystem and a frictionless path into paid marketing and service tools, Capsule leans into simplicity and AI-assisted contact enrichment for small businesses that do not want a dedicated CRM administrator, and Teamgate differentiates with native calling and SMS built directly into its sales workflow. Teams that expect to eventually need marketing automation will find HubSpot's free-to-paid continuity hard to beat, while teams that just need a lightweight, fast-to-configure pipeline tool may prefer Capsule or Teamgate.",
  "bestFor": {
    "capsule-crm": "Small businesses and agencies that want an easy-to-set-up CRM with sales pipelines and project boards, plus optional AI enrichment starting at the Growth tier.",
    "hubspot-crm": "Teams of any size that want a genuinely free, unlimited-user CRM with a seamless upgrade path into marketing and service automation.",
    "teamgate": "Small sales teams that want built-in calling, SMS, and transparent per-user pricing without adopting a larger, more expensive platform."
  },
  "highlights": [
    {
      "title": "HubSpot's free tier has no user cap",
      "description": "Unlike most competitors, HubSpot CRM's free plan supports unlimited users with contact, company, and deal records at no cost.",
      "toolSlugs": [
        "hubspot-crm"
      ]
    },
    {
      "title": "Capsule adds AI enrichment starting mid-tier",
      "description": "From the Growth plan up, Capsule automatically fills in company and contact details and generates AI summaries of records and activity.",
      "toolSlugs": [
        "capsule-crm"
      ]
    },
    {
      "title": "Teamgate bakes calling and SMS into the CRM",
      "description": "Teamgate's Team plan and above include in-app dialing and text messaging directly inside the pipeline, without a separate phone add-on.",
      "toolSlugs": [
        "teamgate"
      ]
    },
    {
      "title": "All three offer a genuine free starting point",
      "description": "Capsule, HubSpot CRM, and Teamgate each let a small team run basic contact and pipeline management for zero dollars before committing to a paid plan.",
      "toolSlugs": [
        "capsule-crm",
        "hubspot-crm",
        "teamgate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "Sales pipeline management",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Permanent free tier",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          },
          "note": "Capsule caps free at 2 users/250 contacts, HubSpot allows unlimited users, Teamgate caps free at 2 users/500 contacts"
        },
        {
          "feature": "REST API access",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "Workflow automation",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          },
          "note": "Capsule requires Growth tier, HubSpot requires Starter tier, Teamgate requires Team tier"
        },
        {
          "feature": "AI-powered enrichment or summaries",
          "statuses": {
            "capsule-crm": "available",
            "hubspot-crm": "not-documented",
            "teamgate": "unavailable"
          },
          "note": "Capsule's AI enrichment and summaries are available from the Growth plan"
        }
      ]
    },
    {
      "group": "Sales Tools",
      "rows": [
        {
          "feature": "In-app calling and SMS",
          "statuses": {
            "capsule-crm": "not-documented",
            "hubspot-crm": "not-documented",
            "teamgate": "available"
          },
          "note": "Teamgate includes calling and SMS from the Team plan"
        },
        {
          "feature": "Lead scoring",
          "statuses": {
            "capsule-crm": "not-documented",
            "hubspot-crm": "available",
            "teamgate": "available"
          },
          "note": "HubSpot's predictive lead scoring is an Enterprise feature; Teamgate's is available on Growth"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a genuinely free plan among Capsule CRM, HubSpot CRM, and Teamgate?",
      "answer": "Yes, all three offer a free tier, though the limits differ: HubSpot CRM allows unlimited users, Capsule caps its free plan at 2 users and 250 contacts, and Teamgate caps its free Starter plan at 2 users and 500 contacts."
    },
    {
      "question": "Which of the three includes built-in calling and texting?",
      "answer": "Teamgate is the only one of the three that bundles in-app calling and SMS directly into its paid tiers, starting on the Team plan at $39.90 per user per month."
    },
    {
      "question": "Does any of these CRMs include AI features?",
      "answer": "Capsule CRM adds AI business and contact enrichment plus AI-generated summaries starting on its Growth plan; comparable AI capabilities are not documented for HubSpot CRM or Teamgate."
    },
    {
      "question": "Which CRM is the cheapest way to add multiple sales pipelines?",
      "answer": "Teamgate's Team plan, at $39.90 per user per month, includes 3 customizable pipelines, while Capsule requires its $36 per user per month Growth plan and HubSpot requires paying for Starter or higher."
    },
    {
      "question": "Can I upgrade without losing my data on any of these platforms?",
      "answer": "HubSpot CRM is explicitly built so upgrading to a paid Hub carries forward all contacts, deals, and activity history without a migration; Capsule and Teamgate also upgrade in place, though this specific no-migration guarantee is most prominently documented for HubSpot."
    }
  ]
};

export default capsuleCrmVsHubspotCrmVsTeamgateContent;
