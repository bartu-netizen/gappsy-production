import type { ToolComparisonContent } from './types';

const orderCoVsTradogramContent: ToolComparisonContent = {
  "verdict": "Order.co is an AI-powered procurement and spend management platform centered on automated catalog sourcing, AP reconciliation (citing up to 80% reduction in manual work), and virtual cards with budget enforcement, but it publishes no pricing and requires a sales demo. Tradogram is an all-in-one procurement platform with transparent published pricing from a free Basic plan up through a $425/month Premium tier, covering purchase orders, RFQs/RFPs, approval workflows, and inventory control, plus iOS and Android apps. The core difference is AI-driven automation depth and virtual-card spend controls (Order.co) versus pricing transparency and a genuine free entry point (Tradogram).",
  "bestForToolA": "Mid-market to enterprise finance and procurement teams that want AI-driven catalog sourcing, automated AP reconciliation, and virtual cards with built-in budget enforcement, and are willing to go through a sales demo for pricing.",
  "bestForToolB": "Smaller teams or individual users who want to start free on the Basic plan (1 user, 5 transactions/month) and scale into transparent, published pricing with iOS and Android mobile app access.",
  "whoNeedsBoth": "Unlikely — both are full procurement platforms covering overlapping requisition-to-payment workflows (purchase orders, approvals, reconciliation), so an organization would typically standardize on one system of record rather than running two procurement platforms in parallel.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Order.co publishes no pricing at all; a demo is required to get a quote.",
      "toolB": "Tradogram publishes exact tiered pricing: a free Basic plan, PRO at $225/month, PREMIUM at $425/month (10 user minimum), and a custom-quoted Enterprise tier (20 user minimum).",
      "whyItMatters": "Published pricing lets smaller teams evaluate cost quickly without a sales process, while custom pricing often signals a platform built for larger, negotiated enterprise deals.",
      "benefitsWho": "Smaller procurement teams and budget-conscious buyers who want to self-serve pricing information."
    },
    {
      "title": "Free Plan Availability",
      "toolA": "No free tier is documented for Order.co.",
      "toolB": "Tradogram offers a genuine free Basic plan (1 user, 5 transactions/month) with no time limit.",
      "whyItMatters": "A true free plan lets very small teams or solo buyers use core purchasing tools indefinitely at no cost.",
      "benefitsWho": "Solo operators or very small businesses with low transaction volume."
    },
    {
      "title": "AI-Driven Automation",
      "toolA": "Order.co AI covers catalog management, supplier sourcing, approval workflows, order tracking, and payment processing, plus an AI Command Center currently in beta for a centralized procurement view.",
      "toolB": "Tradogram's feature set (POs, RFQs/RFPs, approval workflows, budget tracking, inventory control) is not described as AI-driven in the facts.",
      "whyItMatters": "Teams prioritizing automation of sourcing and reconciliation work specifically need AI capabilities that only one of these platforms documents.",
      "benefitsWho": "Procurement teams handling high transaction volume who want AI to reduce manual sourcing and reconciliation work."
    },
    {
      "title": "Payment and Spend Controls",
      "toolA": "Order.co issues virtual cards with built-in budget and policy controls, plus AP automation citing up to an 80% reduction in manual reconciliation tasks and average hard-dollar savings of around 5% (up to 10% in some categories).",
      "toolB": "Tradogram supports invoice reconciliation via 3-way matching between orders, receipts, and invoices, without virtual card issuance mentioned in the facts.",
      "whyItMatters": "Virtual card issuance with policy enforcement is a distinct spend-control mechanism beyond invoice matching, useful for controlling purchases at the point of sale.",
      "benefitsWho": "Finance teams wanting proactive spend controls rather than after-the-fact invoice reconciliation alone."
    },
    {
      "title": "Mobile Access",
      "toolA": "The facts don't document mobile app support for Order.co.",
      "toolB": "Tradogram offers iOS and Android mobile apps.",
      "whyItMatters": "Field or warehouse staff who need to approve or track purchases away from a desktop benefit from dedicated mobile apps.",
      "benefitsWho": "Distributed teams or operations staff who need mobile access to approve purchase requests."
    }
  ],
  "featureMatrix": [
    {
      "group": "Procurement Workflow",
      "rows": [
        {
          "feature": "Purchase orders, requisitions, RFQs/RFPs",
          "toolA": "available",
          "toolB": "available",
          "note": "Order.co via procurement automation; Tradogram as core modules"
        },
        {
          "feature": "Approval workflows",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Inventory control",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Contract management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Budget tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Order.co's spend visibility vs Tradogram's budget management"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-driven catalog and supplier sourcing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI Command Center",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Order.co's is currently in beta"
        },
        {
          "feature": "Automated AP reconciliation",
          "toolA": "available",
          "toolB": "limited",
          "note": "Order.co cites up to 80% reduction; Tradogram offers 3-way match invoice reconciliation"
        },
        {
          "feature": "Virtual cards with budget enforcement",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tradogram Basic: 1 user, 5 transactions/month"
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tradogram PRO $225/mo, PREMIUM $425/mo"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Accounting system integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Both integrate with QuickBooks Online, NetSuite, Sage Intacct"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Order.co or Tradogram?",
      "answer": "Tradogram publishes transparent pricing starting with a free Basic plan and paid tiers from $225/month. Order.co publishes no pricing at all and requires scheduling a demo for a quote, so a direct cost comparison isn't possible from public information."
    },
    {
      "question": "Does Order.co offer a free plan?",
      "answer": "No free plan is documented for Order.co. Tradogram offers a free Basic plan limited to one user and five transactions per month with no time limit."
    },
    {
      "question": "Which platform uses AI more heavily?",
      "answer": "Order.co centers its product on AI across catalog management, supplier sourcing, approval workflows, order tracking, and payment processing, plus a beta AI Command Center. Tradogram's documented features are not described as AI-driven."
    },
    {
      "question": "Do either of these tools issue virtual cards?",
      "answer": "Order.co issues virtual cards with built-in budget and policy controls for purchasing. Virtual card issuance is not documented for Tradogram."
    },
    {
      "question": "Is there a mobile app for either platform?",
      "answer": "Tradogram offers iOS and Android mobile apps. Mobile app support is not documented for Order.co."
    },
    {
      "question": "What accounting systems does each integrate with?",
      "answer": "Both integrate with QuickBooks Online, NetSuite, and Sage Intacct. Tradogram additionally lists QuickBooks Desktop, Xero, and Microsoft Dynamics 365, while Order.co additionally lists SSO providers Okta and Ping Identity."
    }
  ]
};

export default orderCoVsTradogramContent;
