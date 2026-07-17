import type { ToolComparisonContent } from './types';

const brexVsRampContent: ToolComparisonContent = {
  "verdict": "Brex and Ramp both offer no-personal-guarantee corporate cards plus expense, bill pay, and travel tools, but they are built for slightly different buyers. Brex leans on its startup and venture-backed heritage, gating its most useful spend-management, bill pay, and travel features behind a sales conversation once a company outgrows the free Essentials tier, while including a rewards marketplace on card spend. Ramp puts more of its platform behind a genuinely free plan, including unlimited cards, expense management, basic accounts payable, treasury, and core accounting automation, then charges a transparent per-user fee for AI-driven review, procurement, and deeper ERP integrations. Ramp also documents dedicated treasury and AI automation features that Brex's published facts do not address, while Brex documents a rewards program that Ramp's facts do not mention. Card underwriting for both depends on company cash and financial history rather than founder credit, so neither is a strong fit for pre-revenue or non-US-incorporated businesses. Choose Brex if the rewards marketplace and an established startup-focused platform matter most; choose Ramp if a fully-featured free plan and transparent paid pricing for AI and automation matter more. This is a fit question, not a universal winner.",
  "bestForToolA": "Brex fits venture-backed US startups and scaling tech companies that want a no-personal-guarantee card, a rewards marketplace on spend, and are comfortable contacting sales for advanced spend management, bill pay, and travel features.",
  "bestForToolB": "Ramp fits finance teams that want unlimited cards, expense management, basic accounts payable, and treasury features on a genuinely free plan, with transparent per-user pricing when they need AI-driven automation or procurement.",
  "whoNeedsBoth": "Companies going through a merger or acquisition may inherit both platforms from combined entities, and finance teams running a side-by-side vendor evaluation before standardizing on one will reasonably operate both during that trial period.",
  "keyDifferences": [
    {
      "title": "Depth of the free plan",
      "toolA": "Brex's Free/Essentials tier covers the card, basic expense management and receipt capture, mobile access, and core reporting, with advanced spend controls, travel, and bill pay reserved for paid tiers",
      "toolB": "Ramp's Free plan already includes unlimited cards, expense management, basic accounts payable with OCR, treasury features, vendor management, and fundamental accounting automation at $0",
      "whyItMatters": "How much functionality is actually usable before paying anything affects total cost for early-stage teams with tight budgets",
      "benefitsWho": "Cash-conscious startups and small finance teams benefit more from Ramp's broader free tier"
    },
    {
      "title": "Paid plan pricing transparency",
      "toolA": "Brex's Premium and Enterprise tiers are both listed as Contact sales with no published price",
      "toolB": "Ramp's Plus tier has a published starting price of 15 dollars per user per month plus a platform fee, with Enterprise at custom pricing",
      "whyItMatters": "Buyers who want to budget without a sales call can plan around Ramp's published rate more easily",
      "benefitsWho": "Procurement and finance teams that prefer self-serve pricing evaluation benefit from Ramp's transparency"
    },
    {
      "title": "AI-driven automation",
      "toolA": "Brex's documented features do not describe a dedicated AI product for anomaly detection or policy checks",
      "toolB": "Ramp Intelligence is a named AI feature covering policy checks, anomaly detection, and auto-classification, expanded further with auto-coded line items on the Plus plan",
      "whyItMatters": "Teams trying to cut manual transaction review time will weigh whether AI-assisted coding and anomaly flags are built in",
      "benefitsWho": "Finance teams processing high transaction volume benefit from Ramp's AI automation"
    },
    {
      "title": "Treasury and cash management",
      "toolA": "Brex's provided facts do not document a treasury or cash management product",
      "toolB": "Ramp Treasury lets businesses hold and move funds alongside card and payables activity as a named feature",
      "whyItMatters": "Consolidating cash management with spend tools can reduce the number of separate banking relationships a finance team maintains",
      "benefitsWho": "Businesses wanting to unify cash holding with card and AP activity benefit from Ramp"
    },
    {
      "title": "Procurement workflows",
      "toolA": "Brex's documented feature set does not include a dedicated procurement or purchase-request product",
      "toolB": "Ramp offers procurement as an add-on with purchase-request workflows and vendor management, available on paid plans",
      "whyItMatters": "Companies with formal purchasing approval chains need this before a purchase is made, not just expense tracking after the fact",
      "benefitsWho": "Mid-size teams with structured purchasing processes benefit from Ramp's procurement add-on"
    },
    {
      "title": "Rewards program",
      "toolA": "Brex includes a rewards program where card spend earns points redeemable through a rewards marketplace",
      "toolB": "Ramp's documented facts do not mention a rewards or points program",
      "whyItMatters": "For companies with significant monthly card spend, earning redeemable rewards adds ongoing value on top of the core platform",
      "benefitsWho": "High-spend teams that value redeemable perks benefit from Brex's rewards marketplace"
    },
    {
      "title": "International and local-currency support",
      "toolA": "Brex is primarily built for US-incorporated companies, which limits fit for international businesses",
      "toolB": "Ramp's Enterprise plan documents local-currency card issuing across 30 plus countries, though this is limited to that top tier",
      "whyItMatters": "Companies with entities or spend outside the US need a platform that can actually issue and settle cards in local currency",
      "benefitsWho": "Multinational businesses on an Enterprise budget benefit from Ramp's local-currency issuing"
    },
    {
      "title": "Accounting and ERP integration breadth",
      "toolA": "Brex syncs with QuickBooks, NetSuite, and Xero",
      "toolB": "Ramp syncs with QuickBooks, Xero, Sage Intacct, and NetSuite on standard tiers, adding Workday and Oracle integrations on Enterprise",
      "whyItMatters": "Companies already running Sage Intacct, Workday, or Oracle need native integration rather than manual export and import",
      "benefitsWho": "Mid-market and enterprise finance teams on those ERP systems benefit from Ramp's wider documented integration list"
    },
    {
      "title": "Company maturity and headquarters",
      "toolA": "Brex was founded in 2017 and is headquartered in San Francisco, California",
      "toolB": "Ramp was founded in 2019 and is headquartered in New York City, New York",
      "whyItMatters": "Some buyers weigh vendor track record and regional presence when evaluating a financial platform they will depend on long term",
      "benefitsWho": "Buyers prioritizing a longer operating history may lean toward Brex, while those with no regional preference will not find this decisive"
    },
    {
      "title": "Underwriting basis for card limits",
      "toolA": "Brex explicitly markets no personal guarantee, basing card limits on company cash balance and spending activity",
      "toolB": "Ramp's own documented cons note that card underwriting and limits depend on business financial history, which can be restrictive for pre-revenue companies",
      "whyItMatters": "Pre-revenue or newly funded companies with little financial history need to know upfront whether they will qualify for meaningful card limits",
      "benefitsWho": "Newly funded startups with strong cash reserves but limited financial history may find Brex's cash-based model more accessible"
    }
  ],
  "featureMatrix": [
    {
      "group": "Card and Spend Controls",
      "rows": [
        {
          "feature": "Corporate charge card with no personal guarantee",
          "toolA": "available",
          "toolB": "available",
          "note": "Both base card limits on company cash and financial activity rather than personal credit"
        },
        {
          "feature": "Real-time spend limits and policies",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Virtual cards",
          "toolA": "available",
          "toolB": "available",
          "note": "Ramp documents unlimited physical and virtual cards on its Free plan"
        },
        {
          "feature": "Rewards program on card spend",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Brex has a rewards marketplace; Ramp's facts do not mention a rewards program"
        }
      ]
    },
    {
      "group": "Expense Management",
      "rows": [
        {
          "feature": "Automated receipt capture and matching",
          "toolA": "available",
          "toolB": "available",
          "note": "Ramp specifies SMS, email, Slack, and mobile app capture channels"
        },
        {
          "feature": "Mobile app for receipts and approvals",
          "toolA": "available",
          "toolB": "available",
          "note": "iOS and Android for both"
        },
        {
          "feature": "Employee out-of-pocket reimbursements",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Brex explicitly lists reimbursements as a feature; Ramp's facts do not confirm this"
        }
      ]
    },
    {
      "group": "Accounts Payable and Procurement",
      "rows": [
        {
          "feature": "Bill pay and accounts payable automation",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "OCR-based invoice processing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Ramp specifically documents OCR invoice processing; Brex's facts do not specify OCR"
        },
        {
          "feature": "Procurement and purchase-request workflows",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Ramp offers this as a paid add-on; Brex's facts do not mention procurement"
        }
      ]
    },
    {
      "group": "Accounting and ERP Integrations",
      "rows": [
        {
          "feature": "QuickBooks, Xero, NetSuite sync",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Sage Intacct integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listed among Ramp's expanded integrations on the Plus plan"
        },
        {
          "feature": "Workday and Oracle integration",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Ramp documents these on its Enterprise plan only"
        }
      ]
    },
    {
      "group": "Travel and Treasury",
      "rows": [
        {
          "feature": "Business travel booking within policy",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Business cash and treasury management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Ramp Treasury is a named feature; Brex's facts do not document this"
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-driven policy checks and anomaly detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Ramp Intelligence is a named feature; Brex's facts do not mention AI-specific tooling"
        },
        {
          "feature": "Auto-coded transaction line items",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Ramp's Plus plan"
        }
      ]
    },
    {
      "group": "Platform and Global Reach",
      "rows": [
        {
          "feature": "Free entry-level plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Ramp's free plan documents more included functionality than Brex's Free/Essentials tier"
        },
        {
          "feature": "Fit for international companies",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Brex is primarily built for US-incorporated companies; Ramp offers local-currency cards across 30 plus countries only on Enterprise"
        },
        {
          "feature": "Custom user roles and multi-level approvals",
          "toolA": "limited",
          "toolB": "available",
          "note": "Brex ties advanced controls to Premium or Enterprise contact-sales tiers; Ramp documents custom roles on its Plus plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Brex or Ramp?",
      "answer": "Both start with a free plan, but Ramp's free tier documents more included functionality such as unlimited cards, basic accounts payable, and treasury features, while Brex reserves advanced spend management, travel, and bill pay for paid tiers priced only through contacting sales; Ramp also publishes its paid Plus price at 15 dollars per user per month plus a platform fee, whereas Brex's paid pricing is not published."
    },
    {
      "question": "Do Brex and Ramp both require a personal guarantee for the corporate card?",
      "answer": "Neither requires a personal guarantee; Brex explicitly markets no personal guarantee based on company cash and spend activity, and Ramp's card underwriting similarly depends on business financial history rather than a founder's personal credit."
    },
    {
      "question": "Which has better AI features, Brex or Ramp?",
      "answer": "Based on documented facts, Ramp has the more explicit AI offering through Ramp Intelligence, which covers policy checks, anomaly detection, and auto-classification, while Brex's published feature set does not describe a dedicated AI product."
    },
    {
      "question": "Can Ramp do everything Brex does?",
      "answer": "Not entirely; Ramp documents treasury management, procurement, and AI-driven automation that Brex's facts do not mention, but Brex documents a rewards program and employee reimbursement handling that Ramp's facts do not confirm, so the two overlap heavily without being identical."
    },
    {
      "question": "Which is better for a company outside the US or with international operations?",
      "answer": "Neither is a strong general fit, since Brex is primarily built for US-incorporated companies with no documented international card issuing, while Ramp only documents local-currency card issuing across 30 plus countries on its higher-cost Enterprise plan."
    },
    {
      "question": "Are Brex and Ramp both free to start?",
      "answer": "Yes, both offer a free entry plan with no monthly fee, though Ramp's free plan documents a broader set of included features, including basic accounts payable and treasury tools, compared to Brex's Free/Essentials tier which focuses on the card, basic expense management, and core reporting."
    }
  ]
};

export default brexVsRampContent;
