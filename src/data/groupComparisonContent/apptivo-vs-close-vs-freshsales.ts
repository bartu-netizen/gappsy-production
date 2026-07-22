import type { GroupComparisonContent } from './types';

const apptivoVsCloseVsFreshsalesContent: GroupComparisonContent = {
  "verdict": "These three CRMs suit different sales motions. Apptivo is the broadest, bundling help desk, field service, and campaign management alongside its CRM for SMBs that want one platform instead of several point tools. Close is built around native calling, with Power and Predictive Dialers that make it the strongest fit for outbound-heavy sales teams, but it has no free plan. Freshsales sits in between, adding Freddy AI lead scoring and tying into the broader Freshworks suite for teams that value AI-assisted prioritization at a moderate price point.",
  "bestFor": {
    "apptivo": "SMBs that want a single, lower-cost platform covering CRM plus help desk, field service, and campaigns, or that need industry-specific configurations, without buying separate point tools.",
    "close": "Outbound-heavy sales teams and solo founders who want native calling, SMS, and Power or Predictive Dialers built directly into the CRM instead of bolting on a separate dialer.",
    "freshsales": "Sales teams already invested in the Freshworks ecosystem, such as Freshdesk or Freshservice users, or that want AI-driven lead scoring and forecasting (Freddy AI) at a lower price than Salesforce."
  },
  "highlights": [
    {
      "title": "Close is the only one with a Predictive Dialer for high-volume outbound calling",
      "description": "Close's top Scale plan auto-dials multiple numbers simultaneously and connects reps only to answered calls, a capability neither Apptivo nor Freshsales documents.",
      "toolSlugs": [
        "close"
      ]
    },
    {
      "title": "Apptivo is the only true all-in-one business suite of the three",
      "description": "Apptivo bundles help desk, field service, and campaign management alongside its CRM, letting SMBs replace multiple point tools with one subscription, while Close and Freshsales's marketing capability is a separate product.",
      "toolSlugs": [
        "apptivo"
      ]
    },
    {
      "title": "Close and Freshsales both ship a dedicated AI assistant, Apptivo does not document one",
      "description": "Close's Chloe summarizes calls and drafts follow-ups, and Freshsales' Freddy AI scores leads by conversion likelihood starting on its Pro tier; the provided Apptivo data has no comparable AI feature.",
      "toolSlugs": [
        "close",
        "freshsales",
        "apptivo"
      ]
    },
    {
      "title": "Close has no permanent free plan",
      "description": "Apptivo and Freshsales both let very small teams start at $0, while Close offers only a 14-day free trial before its Solo plan kicks in at $9/user/month.",
      "toolSlugs": [
        "close",
        "apptivo",
        "freshsales"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM and Communication",
      "rows": [
        {
          "feature": "Built-in phone / calling",
          "statuses": {
            "apptivo": "not-documented",
            "close": "available",
            "freshsales": "available"
          },
          "note": "Close bundles a Power Dialer and Predictive Dialer; Freshsales includes a built-in phone from its Free plan onward."
        },
        {
          "feature": "Built-in SMS / texting",
          "statuses": {
            "apptivo": "not-documented",
            "close": "available",
            "freshsales": "available"
          },
          "note": "Freshsales adds SMS and WhatsApp support starting on its Growth tier."
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "apptivo": "available",
            "close": "unavailable",
            "freshsales": "available"
          },
          "note": "Close offers only a 14-day free trial, not a permanent free plan."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI assistant or AI lead scoring",
          "statuses": {
            "apptivo": "not-documented",
            "close": "available",
            "freshsales": "available"
          },
          "note": "Close's Chloe AI summarizes calls and drafts follow-ups; Freshsales' Freddy AI scores leads by conversion likelihood starting on its Pro tier."
        },
        {
          "feature": "Multi-step outreach automation or sequences",
          "statuses": {
            "apptivo": "limited",
            "close": "available",
            "freshsales": "available"
          },
          "note": "Apptivo documents general lead and opportunity automation but not a dedicated multi-step outreach sequence builder; Close's Workflows and Freshsales' sales sequences are purpose-built for this."
        }
      ]
    },
    {
      "group": "Breadth and Customization",
      "rows": [
        {
          "feature": "Bundled help desk, field service, or marketing modules",
          "statuses": {
            "apptivo": "available",
            "close": "unavailable",
            "freshsales": "unavailable"
          },
          "note": "Freshsales' marketing capability is sold separately as Freshmarketer rather than bundled in."
        },
        {
          "feature": "No-code custom apps or modules",
          "statuses": {
            "apptivo": "available",
            "close": "not-documented",
            "freshsales": "limited"
          },
          "note": "Freshsales' custom modules are available only on its Enterprise tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has native calling built in without extra tools?",
      "answer": "Close and Freshsales both include a built-in phone; the provided Apptivo data does not document a built-in dialer for its Sales CRM."
    },
    {
      "question": "Which is the only true all-in-one business suite, not just a CRM?",
      "answer": "Apptivo, since it bundles Help Desk, Field Service, and Campaigns modules alongside the CRM itself."
    },
    {
      "question": "Does any of these have a permanent free plan?",
      "answer": "Apptivo and Freshsales both offer free tiers, for 1 user and 3 users respectively. Close does not, offering only a 14-day free trial."
    },
    {
      "question": "Which tool has a dedicated AI assistant?",
      "answer": "Close has Chloe, an AI assistant for call summaries and follow-ups. Freshsales has Freddy AI for lead scoring and forecasting starting on its Pro tier. The provided Apptivo data does not document a comparable AI assistant."
    },
    {
      "question": "Are calling minutes included in the subscription price?",
      "answer": "Close bills calling minutes and SMS on top of its subscription, at roughly $0.02 per minute. Freshsales' built-in phone and Apptivo's plans do not detail separate usage-based calling charges in the provided data."
    }
  ]
};

export default apptivoVsCloseVsFreshsalesContent;
