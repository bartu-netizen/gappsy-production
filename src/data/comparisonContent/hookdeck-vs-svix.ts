import type { ToolComparisonContent } from './types';

const hookdeckVsSvixContent: ToolComparisonContent = {
  "verdict": "Hookdeck is built primarily around receiving, transforming, and routing inbound webhooks (with Outpost as its open-source outbound add-on) and layers on access-control security like SSO/SCIM/RBAC/MFA at higher tiers; Svix is purpose-built for outbound webhook delivery with an embeddable customer portal and broader regulatory compliance, and its free tier offers more volume and longer retention than Hookdeck's.",
  "bestForToolA": "Teams that need to receive, transform, and route inbound webhooks from third parties, with local CLI debugging and MCP-based AI coding-tool integration.",
  "bestForToolB": "Teams sending webhooks to their own customers who need an embeddable, white-labelable self-service portal and HIPAA/PCI-DSS-level compliance documentation.",
  "whoNeedsBoth": "Platforms that receive webhooks from upstream vendors via Hookdeck's event gateway while using Svix to deliver their own outbound webhooks to end customers through its embeddable portal.",
  "keyDifferences": [
    {
      "title": "Primary webhook direction",
      "toolA": "An event gateway focused on receiving, transforming, and routing inbound webhooks, with Outpost as a separate open-source component for outbound delivery.",
      "toolB": "A webhooks-as-a-service platform built specifically for sending and managing outbound webhooks to customers, with automatic retries and monitoring.",
      "whyItMatters": "Teams mainly consuming webhooks from third parties versus teams mainly sending webhooks to their own customers have different core needs, and each tool is architected around a different direction.",
      "benefitsWho": "Platform teams deciding which side of the webhook flow to standardize on."
    },
    {
      "title": "Embeddable customer-facing portal",
      "toolA": "No equivalent customer-facing self-service portal is documented.",
      "toolB": "Offers an embeddable customer portal, unbranded/white-label on the Professional plan, letting end customers manage their own webhook subscriptions inside your app.",
      "whyItMatters": "Companies that want their own customers to self-manage webhook settings without building that UI get it out of the box with Svix.",
      "benefitsWho": "SaaS platforms exposing webhook configuration to their own end customers."
    },
    {
      "title": "Free tier volume and retention",
      "toolA": "Developer plan: 10,000 events/month with only 3-day retention.",
      "toolB": "Free plan: 50,000 messages/month with 30-day payload retention, no credit card required.",
      "whyItMatters": "Svix's free tier is materially more generous on both message volume and retention window, which matters for debugging delivery issues after the fact.",
      "benefitsWho": "Early-stage teams evaluating on the free tier who need longer lookback for debugging."
    },
    {
      "title": "Compliance breadth vs. access-control security",
      "toolA": "Lists SOC 2 Type II plus SSO, SCIM, RBAC, and MFA as enterprise security options.",
      "toolB": "Lists SOC 2 Type II, HIPAA, PCI-DSS, GDPR, and CCPA compliance.",
      "whyItMatters": "Svix documents broader regulatory compliance certifications, while Hookdeck emphasizes access-control and identity security features at higher tiers.",
      "benefitsWho": "Regulated industries (healthcare, payments) needing HIPAA/PCI-DSS documentation versus enterprises needing SSO/SCIM/RBAC for identity governance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Inbound webhook gateway (receive/transform/route)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Outbound webhook delivery",
          "toolA": "available",
          "toolB": "available",
          "note": "Hookdeck delivers this via its open-source Outpost component."
        },
        {
          "feature": "Automatic retries",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Embeddable customer portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Local debugging CLI",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Svix's free tier includes more monthly volume and longer retention."
        },
        {
          "feature": "SOC 2 Type II certified",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Security",
      "rows": [
        {
          "feature": "HIPAA / PCI-DSS compliance stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO / SCIM / RBAC / MFA options",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MCP server for AI coding tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Hookdeck free to use?",
      "answer": "Yes, the Developer plan is free forever with 10,000 events/month."
    },
    {
      "question": "How much do paid Hookdeck plans cost?",
      "answer": "Team starts at $39/month and Growth starts at $499/month; Enterprise is custom."
    },
    {
      "question": "What is Outpost?",
      "answer": "Outpost is Hookdeck's open-source product for outbound webhook delivery to customers."
    },
    {
      "question": "Is Svix free to start?",
      "answer": "Yes, the Free plan includes 50,000 messages/month with no credit card required."
    },
    {
      "question": "How much does Svix's paid plan cost?",
      "answer": "The Professional plan starts at $490/month for 50,000 messages/month with a higher SLA and throughput."
    },
    {
      "question": "What compliance certifications does Svix have?",
      "answer": "SOC 2 Type II, HIPAA, PCI-DSS, GDPR, and CCPA."
    }
  ]
};

export default hookdeckVsSvixContent;
