import type { ToolComparisonContent } from './types';

const clioVsMycaseContent: ToolComparisonContent = {
  "verdict": "Clio and MyCase both start at the same price point of $39 per user per month billed annually, and both are cloud-based legal practice management platforms covering case management, billing, and client communication. The real difference is depth versus simplicity. Clio is the older, larger platform, built out with dedicated trust accounting, automated document generation through Clio Draft, and a documented marketplace of 200 plus integrations, but its full intake and CRM capability (Clio Grow) only arrives at the $129 per user per month Complete tier. MyCase, built from the ground up for solo and small firm workflows, bundles lead and client intake into its $99 per user per month Advanced plan, a lower ceiling than Clio's top tier, and adds a built in court rules calendaring feature that automatically populates deadlines by jurisdiction, something not documented for Clio. Firms that need formal trust accounting, heavy document automation, or a large integration ecosystem are better served by Clio. Firms that want a simpler, lower-cost path to intake tools and automated court deadline tracking may find MyCase's structure a better fit. Neither has a permanent free plan, so budget-conscious solo attorneys should compare what each entry tier actually includes rather than assuming price parity means feature parity.",
  "bestForToolA": "Clio fits firms that want dedicated trust accounting, automated court-form generation through Clio Draft, and access to a large third-party integration marketplace, even if that means paying more for the top tier to unlock intake and CRM.",
  "bestForToolB": "MyCase fits solo and small firms that want client intake bundled at a lower top-tier price point and value built in court rules calendaring for automatically tracking jurisdiction-specific deadlines.",
  "whoNeedsBoth": "A firm evaluating vendors during a transition, or one that wants to compare trust accounting workflows against LawPay-based payment processing before migrating historical billing data, could reasonably trial both during their respective free trial periods before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Company origin and headquarters",
      "toolA": "Founded in 2008 and headquartered in Vancouver, Canada",
      "toolB": "Founded in 2010 and headquartered in Pasadena, California, USA",
      "whyItMatters": "Firms with data residency preferences or that want a vendor aligned with a specific country's legal market context may weigh headquarters location when comparing support and compliance posture.",
      "benefitsWho": "US-based solo and small firms may lean toward a US-headquartered vendor, while firms with Canadian operations may find Clio's origins relevant"
    },
    {
      "title": "Entry-tier pricing",
      "toolA": "EasyStart plan starts at $39 per user per month billed annually, including time and expense tracking, billing, case management, and Outlook and Gmail integration",
      "toolB": "Basic plan starts at $39 per user per month billed annually, including case and document management, calendaring, client portal, and basic invoicing",
      "whyItMatters": "Both tools share the same entry price, so the deciding factor is what is actually included at that price rather than the sticker price itself",
      "benefitsWho": "Budget-conscious solo attorneys benefit from comparing feature lists at the $39 tier rather than assuming the tools are equivalent"
    },
    {
      "title": "Top-tier price ceiling",
      "toolA": "Complete plan reaches $129 per user per month and includes Clio Grow client intake and CRM, automated intake forms, and referral source reporting",
      "toolB": "Advanced plan tops out at $99 per user per month and includes lead and client intake tools, advanced reporting, and priority support",
      "whyItMatters": "MyCase reaches full intake and reporting capability at a lower top-tier price than Clio does",
      "benefitsWho": "Growing firms that need intake and CRM but want to control per-user cost may find MyCase's ceiling more predictable"
    },
    {
      "title": "Trust accounting",
      "toolA": "Lists a dedicated Trust Accounting feature built to help firms track client retainer funds under IOLTA and similar compliance rules",
      "toolB": "Supports trust-accounting-compliant transactions through its LawPay integration rather than a standalone trust accounting feature",
      "whyItMatters": "Firms handling client retainers directly inside the platform may need explicit, built in trust accounting tools rather than relying on a third-party payment integration",
      "benefitsWho": "Firms with strict IOLTA compliance needs benefit from Clio's dedicated trust accounting tools"
    },
    {
      "title": "Document automation versus court calendaring",
      "toolA": "Clio Draft automatically generates court forms and templated documents from matter data",
      "toolB": "Court Rules Calendaring automatically calculates and populates key deadlines and hearing dates based on jurisdiction and case type",
      "whyItMatters": "Each tool automates a different part of litigation workflow, so the better fit depends on whether a firm's biggest time drain is drafting paperwork or tracking deadlines",
      "benefitsWho": "Document-heavy practices benefit from Clio Draft, while litigation-heavy practices tracking court deadlines benefit from MyCase's calendaring automation"
    },
    {
      "title": "Client intake and CRM bundling",
      "toolA": "Client intake and CRM live in a separate product, Clio Grow, included only at the Complete tier",
      "toolB": "Lead and client intake tools are built into the core product and included at the Advanced tier",
      "whyItMatters": "How intake is packaged affects both cost and how integrated the intake workflow feels with the rest of the platform",
      "benefitsWho": "Firms focused on growing their client pipeline may prefer MyCase's more integrated approach to intake"
    },
    {
      "title": "Integration ecosystem breadth",
      "toolA": "Documents 200 plus integrations available through its app marketplace at the Essentials tier and above, including Outlook, Gmail, and QuickBooks",
      "toolB": "Documents integration with LawPay for payments plus unspecified additional integrations for accounting and document workflows depending on plan",
      "whyItMatters": "A firm already using a specific set of third-party tools needs to know whether its stack is supported before committing",
      "benefitsWho": "Firms with an established software stack of email, calendaring, and accounting tools benefit from Clio's documented breadth of integrations"
    },
    {
      "title": "API access",
      "toolA": "Tagged as offering API access",
      "toolB": "No API access is documented in the available facts",
      "whyItMatters": "Firms that want to build custom integrations or connect internal tools need confirmed API availability",
      "benefitsWho": "Firms with in-house development resources or custom workflow needs benefit from Clio's documented API access"
    },
    {
      "title": "Reporting and analytics tier gating",
      "toolA": "Matter profitability analytics and staff workload management are reserved for the Advanced tier at $99 per user per month",
      "toolB": "Reporting appears at the Pro tier at $79 per user per month, with advanced reporting added at the $99 per user per month Advanced tier",
      "whyItMatters": "Firms that need profitability or productivity reporting early in their growth should check which tier unlocks it rather than assuming it comes standard",
      "benefitsWho": "Smaller firms watching cost benefit from MyCase surfacing some reporting one tier lower than Clio does"
    }
  ],
  "featureMatrix": [
    {
      "group": "Case and Matter Management",
      "rows": [
        {
          "feature": "Centralized matter record for documents, contacts, and tasks",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Task and workflow assignment",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented as part of Matter and Case Management for Clio and as a dedicated Task and Workflow Management feature for MyCase"
        },
        {
          "feature": "Automated court deadline and hearing date calendaring by jurisdiction",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MyCase's Court Rules Calendaring feature"
        }
      ]
    },
    {
      "group": "Billing and Payments",
      "rows": [
        {
          "feature": "Time and expense tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Online invoicing and payments",
          "toolA": "available",
          "toolB": "available",
          "note": "MyCase processes payments through its LawPay integration"
        },
        {
          "feature": "Dedicated trust accounting feature",
          "toolA": "available",
          "toolB": "limited",
          "note": "MyCase supports trust-accounting-compliant transactions via LawPay rather than a standalone feature"
        }
      ]
    },
    {
      "group": "Client Communication",
      "rows": [
        {
          "feature": "Client portal with secure messaging",
          "toolA": "available",
          "toolB": "available",
          "note": "Included in MyCase Basic plan at $39 per user per month"
        },
        {
          "feature": "Online invoice payment for clients",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Client Intake and CRM",
      "rows": [
        {
          "feature": "Lead capture and intake forms",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio Grow included only at the Complete tier ($129 per user per month); MyCase included at the Advanced tier ($99 per user per month)"
        },
        {
          "feature": "Referral source reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented for Clio Complete tier"
        }
      ]
    },
    {
      "group": "Document Management and Automation",
      "rows": [
        {
          "feature": "Document storage and organization by matter",
          "toolA": "available",
          "toolB": "available",
          "note": "For Clio this is documented under Matter and Case Management rather than a standalone feature title"
        },
        {
          "feature": "Version tracking and reusable templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MyCase's dedicated Document Management feature; also reflected in MyCase's templates tag"
        },
        {
          "feature": "Automated generation of court forms and templated documents",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clio Draft"
        }
      ]
    },
    {
      "group": "Reporting and Analytics",
      "rows": [
        {
          "feature": "Billing and matter profitability reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio at Advanced tier; MyCase at Pro and Advanced tiers"
        },
        {
          "feature": "Staff utilization or productivity tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio's staff workload management versus MyCase's staff productivity data"
        }
      ]
    },
    {
      "group": "Platform and Integrations",
      "rows": [
        {
          "feature": "Native iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Third-party integration marketplace",
          "toolA": "available",
          "toolB": "limited",
          "note": "Clio documents 200 plus integrations; MyCase documents LawPay plus unspecified accounting and document integrations"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Trial",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Clio or MyCase cheaper?",
      "answer": "Both start at the same entry price of $39 per user per month billed annually, but their top tiers diverge, with Clio's Complete plan reaching $129 per user per month for full intake and CRM versus MyCase's Advanced plan topping out at $99 per user per month for a comparable feature set."
    },
    {
      "question": "Does Clio or MyCase have better trust accounting support?",
      "answer": "Clio lists a dedicated Trust Accounting feature built for IOLTA and similar compliance rules, while MyCase supports trust-accounting-compliant transactions through its LawPay integration rather than a standalone trust accounting feature."
    },
    {
      "question": "Can MyCase generate court forms automatically like Clio?",
      "answer": "This is not documented for MyCase; MyCase's confirmed automation is Court Rules Calendaring, which auto-populates deadlines and hearing dates, whereas Clio Draft is the feature documented for automated document and court-form generation."
    },
    {
      "question": "Which is better for solo attorneys, Clio or MyCase?",
      "answer": "Both are positioned for solo and small firms with entry plans starting at $39 per user per month, so the choice comes down to whether a solo attorney values Clio's dedicated trust accounting and document automation or MyCase's lower-cost path to intake tools and built in court deadline calendaring."
    },
    {
      "question": "Does Clio or MyCase offer a free plan?",
      "answer": "Neither offers a permanent free plan; both provide a free trial period before requiring a paid subscription."
    },
    {
      "question": "Which has more integrations, Clio or MyCase?",
      "answer": "Clio documents a larger integration ecosystem, citing 200 plus integrations through its app marketplace including Outlook, Gmail, and QuickBooks, while MyCase's documented integrations center on LawPay for payments plus unspecified additional accounting and document workflow integrations."
    }
  ]
};

export default clioVsMycaseContent;
