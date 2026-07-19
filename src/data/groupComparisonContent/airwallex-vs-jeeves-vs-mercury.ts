import type { GroupComparisonContent } from './types';

const airwallexVsJeevesVsMercuryContent: GroupComparisonContent = {
  "verdict": "Airwallex, Jeeves, and Mercury all offer free-to-start business accounts with corporate cards, but they are optimized for different kinds of companies. Airwallex has the broadest global footprint, with accounts in 20-plus currencies, transfers to 200-plus countries, and embedded finance APIs for companies that want to build payment products on top of it. Jeeves focuses on cross-border spend across Latin America, EMEA, and North America, underwriting credit lines against a company's cash position and revenue rather than local credit history. Mercury is the most US-centric of the three, pairing free business banking with treasury tools, invoicing, and deep accounting integrations for startups that primarily operate domestically.",
  "bestFor": {
    "airwallex": "International businesses that need multi-currency accounts, global payment acceptance, and embedded finance APIs to build financial products.",
    "jeeves": "Cross-border teams in Latin America, EMEA, or North America that want card spend paired with credit lines sized to cash position rather than local credit history.",
    "mercury": "US-based startups that want free core business banking bundled with treasury, invoicing, and accounting integrations."
  },
  "highlights": [
    {
      "title": "Broadest currency and country coverage",
      "description": "Airwallex supports accounts in 20-plus currencies with batch transfers to 200-plus countries and regions, the widest global reach of the three.",
      "toolSlugs": [
        "airwallex"
      ]
    },
    {
      "title": "Credit sized to cash flow, not credit history",
      "description": "Jeeves underwrites short-term credit lines based on a company's cash position and revenue, which can help newer or internationally based businesses access financing that traditional credit-history-based underwriting would deny.",
      "toolSlugs": [
        "jeeves"
      ]
    },
    {
      "title": "Free banking with built-in treasury tools",
      "description": "Mercury's free plan includes business checking and savings with no monthly fees, plus access to money-market treasury tools for earning yield on idle cash.",
      "toolSlugs": [
        "mercury"
      ]
    },
    {
      "title": "Embedded finance APIs for building on top",
      "description": "Airwallex is the only one of the three that markets a dedicated platform API for other companies to build payment, payout, and card-issuing products on its infrastructure.",
      "toolSlugs": [
        "airwallex"
      ]
    },
    {
      "title": "Cashback and travel perks on card spend",
      "description": "Jeeves offers up to 1 percent cashback plus perks like airport lounge access, comparable to US-focused card competitors, with no annual card fees.",
      "toolSlugs": [
        "jeeves"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Banking",
      "rows": [
        {
          "feature": "Free entry-level business account",
          "statuses": {
            "airwallex": "available",
            "jeeves": "available",
            "mercury": "available"
          }
        },
        {
          "feature": "Treasury or idle-cash yield tools",
          "statuses": {
            "airwallex": "not-documented",
            "jeeves": "not-documented",
            "mercury": "available"
          }
        }
      ]
    },
    {
      "group": "Cards and Spend Management",
      "rows": [
        {
          "feature": "Multi-currency corporate cards",
          "statuses": {
            "airwallex": "available",
            "jeeves": "available",
            "mercury": "limited"
          },
          "note": "Mercury issues startup-friendly corporate credit cards but does not document the same breadth of multi-currency card issuance as Airwallex or Jeeves."
        },
        {
          "feature": "Short-term credit lines underwritten on cash position",
          "statuses": {
            "airwallex": "not-documented",
            "jeeves": "available",
            "mercury": "not-documented"
          }
        },
        {
          "feature": "Cashback or rewards on card spend",
          "statuses": {
            "airwallex": "not-documented",
            "jeeves": "available",
            "mercury": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Global Reach and APIs",
      "rows": [
        {
          "feature": "Embedded finance or platform APIs for building products",
          "statuses": {
            "airwallex": "available",
            "jeeves": "not-documented",
            "mercury": "not-documented"
          }
        },
        {
          "feature": "Cross-border money transfers across multiple regions",
          "statuses": {
            "airwallex": "available",
            "jeeves": "available",
            "mercury": "limited"
          },
          "note": "Airwallex sends batch payments to 200-plus countries, Jeeves covers Latin America, EMEA, and North America, while Mercury is primarily built for US-based operations."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Airwallex, Jeeves, and Mercury all have free plans?",
      "answer": "Yes. Airwallex's Explore plan, Jeeves' Core plan, and Mercury's free banking plan all have no monthly subscription fee, though each charges fees on certain transactions or upgrades."
    },
    {
      "question": "Which is best for building payment products on top of the platform?",
      "answer": "Airwallex, which offers embedded finance and platform APIs specifically for companies that want to build payment, payout, and card-issuing products on its infrastructure."
    },
    {
      "question": "Which offers credit based on revenue instead of personal or local credit history?",
      "answer": "Jeeves, which underwrites short-term credit lines against a company's cash position and revenue rather than relying solely on local credit history."
    },
    {
      "question": "Which is most tailored to US-based startups?",
      "answer": "Mercury, which bundles free US business banking with treasury tools, invoicing, and deep QuickBooks and Xero integrations."
    },
    {
      "question": "Which has the widest international currency and country coverage?",
      "answer": "Airwallex, with accounts in 20-plus currencies and batch transfers to 200-plus countries and regions."
    },
    {
      "question": "Do all three charge fees on foreign exchange or international transfers?",
      "answer": "Yes, transaction and FX fees apply on all three platforms for cross-currency activity, though Airwallex advertises rates close to interbank FX and Jeeves shows fees before sending."
    }
  ]
};

export default airwallexVsJeevesVsMercuryContent;
