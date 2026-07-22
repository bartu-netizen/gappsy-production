import type { ToolComparisonContent } from './types';

const avidxchangeVsTipaltiContent: ToolComparisonContent = {
  "verdict": "AvidXchange and Tipalti both automate accounts payable for mid-market and enterprise teams, but they're built around different centers of gravity: AvidXchange leans into vertical-specific AP workflows (real estate, construction, healthcare, nonprofits) with deep accounting/ERP connections like Yardi and MRI, while Tipalti is built around global mass payouts and a broader finance-ops stack that adds procurement, expense management, and treasury on top of AP. Neither publishes pricing, so the real differentiator is which finance workflows each company needs beyond basic invoice-to-pay.",
  "bestForToolA": "Best for finance teams in real estate, construction, or other AvidXchange-supported verticals that need invoice capture, coding, and approval workflows tied into systems like Yardi, MRI, or Workday, and that value lien waiver tracking as part of AP.",
  "bestForToolB": "Best for finance teams that need to pay suppliers, contractors, or partners across many countries and currencies, or that want procurement, expense management, and treasury management consolidated with AP rather than run as separate systems.",
  "whoNeedsBoth": "Multi-entity organizations with both a domestic vertical-specific AP need (e.g., a real estate portfolio company) and a global supplier or partner payout requirement may end up running AvidXchange for one entity's AP workflow and Tipalti for cross-border mass payments elsewhere, since neither product's public feature set fully covers the other's specialty.",
  "keyDifferences": [
    {
      "title": "Global payout reach",
      "toolA": "AvidXchange's payment automation supports virtual card, ACH, and checks, without a documented country or currency count.",
      "toolB": "Tipalti explicitly supports payouts to 200+ countries in 120 currencies via 50+ payment methods.",
      "whyItMatters": "Teams paying international suppliers or contractors need documented multi-currency, multi-country payment rails, not just domestic payment methods.",
      "benefitsWho": "Finance teams with global supplier or contractor bases benefit from Tipalti's documented international reach."
    },
    {
      "title": "Scope beyond AP",
      "toolA": "AvidXchange's feature set centers on invoice capture/coding, approval workflows, payment automation, and vertical add-ons like lien waiver management.",
      "toolB": "Tipalti bundles AP automation with procurement (PO matching), expense management, and treasury management as native modules.",
      "whyItMatters": "Organizations wanting a single system for the full finance-ops stack (not just AP) get more of that out of the box with Tipalti.",
      "benefitsWho": "Finance teams looking to consolidate procurement, expenses, and treasury alongside AP rather than buy separate point solutions."
    },
    {
      "title": "Vertical specialization",
      "toolA": "AvidXchange explicitly serves real estate, construction, healthcare, nonprofits, government, financial services, higher education, and hospitality, with lien waiver management for construction and Yardi/MRI integrations for real estate.",
      "toolB": "Tipalti's facts don't document industry-specific modules; its focus is described in general mid-market/enterprise finance terms.",
      "whyItMatters": "A vertical-specific feature like lien waiver tracking can eliminate the need for a separate compliance tool in construction AP.",
      "benefitsWho": "Construction and real estate finance teams that need industry-specific compliance and property-management-system integrations."
    },
    {
      "title": "Company track record and recognition",
      "toolA": "AvidXchange states it's built on 25+ years of supplier transaction data, but its own founding year isn't disclosed on-site.",
      "toolB": "Tipalti discloses a 2010 founding year and cites recognition in the 2025 Deloitte Fast 500 (8th consecutive year) and 2025 CNBC Top Fintech Company (3rd consecutive year).",
      "whyItMatters": "Buyers evaluating vendor stability and market recognition have more disclosed, verifiable data points for Tipalti.",
      "benefitsWho": "Procurement/vendor-risk reviewers who weigh public company history and third-party recognition in vendor selection."
    },
    {
      "title": "ERP and accounting integrations",
      "toolA": "AvidXchange integrates with 200+ systems including NetSuite, QuickBooks, Sage, Acumatica, Yardi, MRI, and Workday.",
      "toolB": "Tipalti lists pre-built connectors for NetSuite, SAP, Microsoft Dynamics, and Sage Intacct.",
      "whyItMatters": "The specific ERP or property-management system already in use can determine which platform integrates more cleanly.",
      "benefitsWho": "Finance teams on Yardi/MRI (real estate) or QuickBooks/Sage (mid-market) may find AvidXchange's integration list more directly relevant; SAP/Dynamics shops may lean toward Tipalti."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core AP Automation",
      "rows": [
        {
          "feature": "Invoice capture and coding",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-step approval workflows",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Payment methods (virtual card, ACH, checks)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Global mass payments (200+ countries, 120 currencies)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Finance Ops Beyond AP",
      "rows": [
        {
          "feature": "Procurement / PO matching",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Expense management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Treasury management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-entity support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Verticals",
      "rows": [
        {
          "feature": "ERP/accounting integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "AvidXchange: NetSuite, QuickBooks, Sage, Acumatica, Yardi, MRI, Workday (200+ total). Tipalti: NetSuite, SAP, Dynamics, Sage Intacct."
        },
        {
          "feature": "Real estate property system integrations (Yardi, MRI)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Construction lien waiver management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-powered process automation",
          "toolA": "available",
          "toolB": "available",
          "note": "AvidXchange: AI-powered invoice automation. Tipalti: Tipalti AI for process optimization and insights."
        }
      ]
    },
    {
      "group": "Company & Pricing Transparency",
      "rows": [
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a demo/quote request."
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tipalti: 2010."
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "AvidXchange: Charlotte, NC. Tipalti: Foster City, CA."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does AvidXchange or Tipalti publish pricing?",
      "answer": "Neither publishes pricing on-site; both require a demo request to get a quote."
    },
    {
      "question": "Which one supports paying suppliers internationally?",
      "answer": "Tipalti explicitly supports mass payouts to 200+ countries in 120 currencies via 50+ payment methods. AvidXchange's payment automation covers virtual card, ACH, and checks, without a documented international payout scope."
    },
    {
      "question": "Which is better suited to construction or real estate finance teams?",
      "answer": "AvidXchange has industry-specific support, including lien waiver management for construction and integrations with Yardi and MRI for real estate."
    },
    {
      "question": "Does either platform include procurement or expense management?",
      "answer": "Tipalti includes procurement (PO matching and workflow automation), expense management, and treasury management as part of its platform. These aren't listed among AvidXchange's documented features."
    },
    {
      "question": "When was each company founded?",
      "answer": "Tipalti was founded in 2010. AvidXchange's founding year is not disclosed on-site, though it states its supplier network is built on 25+ years of transaction data."
    },
    {
      "question": "What ERP systems does each integrate with?",
      "answer": "AvidXchange integrates with 200+ systems including NetSuite, QuickBooks, Sage, Acumatica, Yardi, MRI, and Workday. Tipalti lists pre-built connectors for NetSuite, SAP, Microsoft Dynamics, and Sage Intacct."
    }
  ]
};

export default avidxchangeVsTipaltiContent;
