import type { GroupComparisonContent } from './types';

const insightlyVsKeapVsZendeskSellContent: GroupComparisonContent = {
  "verdict": "Insightly, Keap, and Zendesk Sell all pair a sales pipeline with automation, but they solve different problems for different budgets. Insightly is the pick for teams that want a CRM and post-sale project delivery in one connected system, Keap is built for solo entrepreneurs and small service businesses that want marketing automation, invoicing, and payments bundled with the CRM, and Zendesk Sell is the lighter, mobile-first sales CRM that shines when a team already runs Zendesk Support and wants shared customer context. None of the three is a universal winner; the right choice depends on whether the buyer needs project handoff, marketing depth, or support integration most.",
  "bestFor": {
    "insightly": "Small and mid-sized businesses that need to hand a closed deal directly into a tracked delivery project without switching tools.",
    "keap": "Solopreneurs, coaches, and small service businesses that want CRM, email/SMS marketing automation, and invoicing bundled into one platform.",
    "zendesk-sell": "Sales teams, especially field reps, that want a straightforward mobile CRM and already use or plan to use Zendesk Support."
  },
  "highlights": [
    {
      "title": "Only Insightly turns deals into projects natively",
      "description": "Insightly is the only one of the three with built-in project management that lets a sales team move a won deal straight into a trackable delivery project inside the same platform.",
      "toolSlugs": [
        "insightly"
      ]
    },
    {
      "title": "Keap goes deepest on marketing automation and invoicing",
      "description": "Keap layers a visual multi-step email and SMS automation engine, landing pages, appointment scheduling, and quotes/invoicing/payments on top of its CRM, going further into marketing and billing than the other two.",
      "toolSlugs": [
        "keap"
      ]
    },
    {
      "title": "Zendesk Sell has the strongest field-sales mobile app",
      "description": "Zendesk Sell's mobile CRM includes geolocation features so field reps can see nearby prospects, log calls, and update deals on the go, and it can share data with Zendesk Support for full customer context.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    },
    {
      "title": "Keap is priced well above the other two",
      "description": "Keap starts around $249/month for two user licenses, compared to Insightly's $29/user/month and Zendesk Sell's $19/user/month entry tiers, making Keap a bigger commitment for very small teams.",
      "toolSlugs": [
        "keap",
        "insightly",
        "zendesk-sell"
      ]
    },
    {
      "title": "API and automation both require an upgrade",
      "description": "Insightly gates REST API access and workflow automation behind its Professional tier, while Zendesk Sell reserves prospecting, forecasting, and advanced automation for its Growth tier and above, so entry-level plans on both are more limited than they first appear.",
      "toolSlugs": [
        "insightly",
        "zendesk-sell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM",
      "rows": [
        {
          "feature": "Kanban-style sales pipeline",
          "statuses": {
            "insightly": "available",
            "keap": "available",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Lead assignment and routing",
          "statuses": {
            "insightly": "limited",
            "keap": "available",
            "zendesk-sell": "available"
          },
          "note": "Insightly requires the Professional tier or above for lead assignment and routing."
        },
        {
          "feature": "Native mobile apps (iOS and Android)",
          "statuses": {
            "insightly": "available",
            "keap": "available",
            "zendesk-sell": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and marketing",
      "rows": [
        {
          "feature": "Workflow automation",
          "statuses": {
            "insightly": "limited",
            "keap": "available",
            "zendesk-sell": "limited"
          },
          "note": "Insightly requires Professional tier or above; Zendesk Sell's advanced automation is on Professional and Enterprise plans."
        },
        {
          "feature": "Email/SMS marketing automation",
          "statuses": {
            "insightly": "unavailable",
            "keap": "available",
            "zendesk-sell": "unavailable"
          }
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "zendesk-sell": "not-documented"
          },
          "note": "Insightly offers an AI Copilot for email summaries and replies on Professional and Enterprise tiers."
        }
      ]
    },
    {
      "group": "Delivery and integration",
      "rows": [
        {
          "feature": "Native project management",
          "statuses": {
            "insightly": "available",
            "keap": "unavailable",
            "zendesk-sell": "unavailable"
          }
        },
        {
          "feature": "Invoicing and payment collection",
          "statuses": {
            "insightly": "unavailable",
            "keap": "available",
            "zendesk-sell": "unavailable"
          }
        },
        {
          "feature": "REST API and webhooks",
          "statuses": {
            "insightly": "limited",
            "keap": "not-documented",
            "zendesk-sell": "not-documented"
          },
          "note": "Insightly's API and webhooks require the Professional tier or above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs is cheapest to start with?",
      "answer": "Zendesk Sell has the lowest entry price at around $19 per user per month for the Sell Team plan, followed by Insightly's Plus plan at $29 per user per month. Keap starts around $249 per month for two user licenses, which is a much larger jump because it bundles marketing automation and invoicing from the start."
    },
    {
      "question": "Which tool is best if my team needs to manage projects after closing a deal?",
      "answer": "Insightly is the clear choice here since it natively converts a won deal into a trackable delivery project inside the same platform, a capability neither Keap nor Zendesk Sell offers."
    },
    {
      "question": "Does any of these three include email and SMS marketing automation?",
      "answer": "Keap is the only one of the three built around marketing automation, with a visual builder for multi-step, behavior-triggered email and SMS sequences. Insightly and Zendesk Sell focus on pipeline and sales activity rather than marketing campaigns."
    },
    {
      "question": "Is Zendesk Sell worth it if I don't already use Zendesk Support?",
      "answer": "Zendesk Sell works as a standalone sales CRM even without Zendesk Support, offering pipeline management, email tracking, sequences, forecasting, and a strong mobile app. The added benefit of shared customer service history only applies to teams that also run Zendesk Support."
    },
    {
      "question": "Why is Keap so much more expensive than Insightly or Zendesk Sell?",
      "answer": "Keap's pricing bundles CRM, marketing automation, landing pages, appointment scheduling, and invoicing/payments into a smaller number of higher-priced plans, and most new Pro and Max customers must also purchase a one-time Kickstart onboarding package, which adds to the effective starting cost compared to Insightly's or Zendesk Sell's per-seat entry tiers."
    },
    {
      "question": "Which CRM has the most capable mobile app for field sales reps?",
      "answer": "Zendesk Sell is widely praised for its mobile CRM, which includes geolocation features that let field reps see nearby prospects in addition to logging calls and updating deals, a capability not described for Insightly or Keap's mobile apps."
    }
  ]
};

export default insightlyVsKeapVsZendeskSellContent;
