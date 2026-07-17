import type { ToolComparisonContent } from './types';

const arcVsPayemContent: ToolComparisonContent = {
  "verdict": "Arc is a cash management and capital markets platform built for technology companies, combining brokerage yield (up to roughly 4.57% net), a cashback business card, debt capital raising, and a general-purpose AI CFO Agent, with a free Essentials tier to start. PayEm is a procurement and AP automation platform aimed at finance teams, combining purchase-order workflows, AI-driven OCR invoice-to-PO matching, and dedicated vendor cards for SaaS spend control, priced only through custom quotes. They address adjacent but distinct problems: treasury and yield optimization versus spend and procurement automation.",
  "bestForToolA": "Tech companies wanting to earn yield on idle operating cash (up to roughly 4.57% net on the Enterprise tier) and access venture debt, starting with a free Essentials tier and unlimited AI CFO Agent access on Premium.",
  "bestForToolB": "Finance and procurement teams that need purchase-order approval workflows, AI-powered OCR invoice-to-PO matching, and dedicated vendor cards to control SaaS subscription spend, especially those already syncing data with NetSuite.",
  "whoNeedsBoth": "This is a realistic pairing: a finance team could use Arc to manage operating cash, earn brokerage yield, and issue a cashback card, while separately using PayEm to run procurement approvals, AI-driven AP automation, and dedicated vendor cards for individual SaaS purchases, since the two cover complementary treasury and procurement functions rather than duplicating each other.",
  "keyDifferences": [
    {
      "title": "Core Focus",
      "toolA": "Arc centers on cash management, brokerage yield optimization, and debt capital raising for technology companies.",
      "toolB": "PayEm centers on procurement (PO creation), AI-powered AP automation, and real-time spend controls for finance teams.",
      "whyItMatters": "Buyers need to match the tool to whether their priority is earning yield on cash or automating procurement and payables.",
      "benefitsWho": "Finance leaders deciding between a treasury tool and a procurement/AP automation tool."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Arc publishes a free Essentials tier ($0/month) with documented yield and cashback rates by tier (4.12%-4.57% yield, 1.0%-2.0% cashback).",
      "toolB": "PayEm has no published pricing; it operates on a Custom/Enterprise, quote-only basis.",
      "whyItMatters": "A published free tier lets smaller teams start immediately without a sales conversation.",
      "benefitsWho": "Early-stage startups wanting to start without a sales cycle."
    },
    {
      "title": "Card Program Purpose",
      "toolA": "Arc's business card offers cashback rewards that scale from 1.0% to 2.0% by membership tier.",
      "toolB": "PayEm issues virtual and physical corporate cards, including dedicated vendor cards specifically for controlling individual SaaS subscriptions.",
      "whyItMatters": "Teams focused on controlling recurring SaaS spend need per-vendor card controls, not just cashback.",
      "benefitsWho": "Finance teams managing many individual SaaS vendor subscriptions."
    },
    {
      "title": "AI Application",
      "toolA": "Arc's CFO Agent is a general-purpose AI financial assistant, with unlimited access included on the Premium tier.",
      "toolB": "PayEm's AI is narrowly applied through AI-powered OCR that automatically matches incoming invoices to their corresponding purchase orders.",
      "whyItMatters": "Teams should know whether they need broad AI financial assistance or narrow invoice-matching automation.",
      "benefitsWho": "AP teams specifically trying to reduce manual invoice-matching work benefit from PayEm's scoped AI."
    },
    {
      "title": "Company Status",
      "toolA": "Arc was founded in 2021, and Axos Financial announced a definitive agreement in July 2026 to acquire Arc Technologies, Inc., which may bring platform changes.",
      "toolB": "PayEm was founded in 2019 in New York, with no acquisition or ownership change documented in the facts.",
      "whyItMatters": "An announced acquisition can affect product roadmap, pricing, or support continuity.",
      "benefitsWho": "Buyers doing vendor-risk due diligence before signing a long-term contract."
    }
  ],
  "featureMatrix": [
    {
      "group": "Cash & Treasury Management",
      "rows": [
        {
          "feature": "Brokerage yield on idle cash",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc: up to ~4.57% net yield by tier."
        },
        {
          "feature": "Debt capital raising marketplace",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free entry-level tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc Essentials is $0/month; PayEm is Custom/Enterprise only."
        }
      ]
    },
    {
      "group": "Procurement & AP Automation",
      "rows": [
        {
          "feature": "Purchase order creation and approval workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-powered invoice-to-PO matching (OCR)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "ERP sync (e.g., NetSuite)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cross-border vendor payments",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Cards, AI & Company Info",
      "rows": [
        {
          "feature": "Corporate/business card",
          "toolA": "available",
          "toolB": "available",
          "note": "Arc: cashback 1.0%-2.0% by tier. PayEm: virtual/physical plus dedicated vendor cards."
        },
        {
          "feature": "Dedicated vendor-specific cards for SaaS subscriptions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "General-purpose AI financial assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc's CFO Agent; PayEm's AI is scoped to invoice/PO matching."
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc: $0/month Essentials."
        },
        {
          "feature": "Founded year / HQ disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Arc: 2021, San Francisco & New York. PayEm: 2019, New York."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Arc and PayEm solving the same problem?",
      "answer": "Not quite. Arc focuses on cash management, brokerage yield, and debt raising for tech companies, while PayEm focuses on procurement and AP automation for finance teams. Both happen to include corporate cards."
    },
    {
      "question": "Does either have a free plan?",
      "answer": "Arc has a free Essentials tier ($0/month) with core treasury features, up to 4.12% net yield, and 1.0% cashback. PayEm has no published pricing and operates on a Custom/Enterprise, quote-only basis."
    },
    {
      "question": "How does the AI differ between the two?",
      "answer": "Arc's CFO Agent is a general-purpose AI financial assistant with unlimited access on the Premium tier. PayEm's AI is applied specifically to OCR-based invoice-to-purchase-order matching within its AP automation flow."
    },
    {
      "question": "Is Arc being acquired?",
      "answer": "Yes. Axos Financial announced a definitive agreement in July 2026 to acquire Arc Technologies, Inc., which may bring platform changes."
    },
    {
      "question": "Which is better for controlling SaaS vendor spend?",
      "answer": "PayEm documents dedicated vendor cards specifically for SaaS subscriptions plus real-time spend monitoring. Arc's card program centers on cashback rewards rather than per-vendor spend controls."
    },
    {
      "question": "Does either integrate with an ERP like NetSuite?",
      "answer": "PayEm documents ERP integrations including NetSuite sync for procurement and accounting data. Arc's facts don't document ERP integrations."
    }
  ]
};

export default arcVsPayemContent;
