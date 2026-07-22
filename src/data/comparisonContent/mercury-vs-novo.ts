import type { ToolComparisonContent } from './types';

const mercuryVsNovoContent: ToolComparisonContent = {
  "verdict": "Mercury and Novo both offer free core business banking with no monthly fees, but Mercury adds tiered paid plans (Plus, Pro) with treasury yield, higher invoicing limits, and a dedicated relationship manager, while Novo keeps a single documented free plan and discloses that deposits are held through a partner bank (Middlesex Federal Savings). The better fit depends on whether a business expects to need paid upgrades and treasury yield, or wants a single straightforward free plan.",
  "bestForToolA": "Businesses that expect to need higher invoicing or reimbursement limits, a dedicated relationship manager, or yield on large idle balances ($250K+) as they grow.",
  "bestForToolB": "Businesses that want to stay on a single free checking plan with built-in invoicing, expense tracking, and Novo Reserves without evaluating paid tiers.",
  "whoNeedsBoth": "The facts describe these as substitutable core banking products for a single business rather than complementary tools — most companies would use one primary business bank account, not both simultaneously.",
  "keyDifferences": [
    {
      "title": "Pricing Tiers vs. Single Free Plan",
      "toolA": "Mercury offers three tiers (Free, Plus $29.90/month, Pro $299/month) unlocking progressively more invoicing API volume, reimbursement seats, and a dedicated relationship manager.",
      "toolB": "Novo's facts document a single free business checking plan with no paid tiers listed.",
      "whyItMatters": "Growing companies needing higher reimbursement or invoicing limits have a documented upgrade path with Mercury.",
      "benefitsWho": "Scaling startups anticipating more invoicing volume or team reimbursements."
    },
    {
      "title": "Treasury / Yield Product",
      "toolA": "Mercury offers a treasury feature yielding up to 3.64% via Mercury Advisory, requiring a $250K+ balance.",
      "toolB": "Novo's facts don't mention any yield or treasury product.",
      "whyItMatters": "Businesses holding significant cash reserves may want yield on idle balances.",
      "benefitsWho": "Well-funded startups with $250K+ sitting in the account."
    },
    {
      "title": "Named Accounting Integrations",
      "toolA": "Mercury documents syncing with QuickBooks, Xero, and NetSuite specifically.",
      "toolB": "Novo's facts state it has \"Tool Integrations\" for accounting, payments, and payroll but don't name specific platforms.",
      "whyItMatters": "Businesses using a specific named accounting tool need confirmation of direct support.",
      "benefitsWho": "Companies standardized on QuickBooks, Xero, or NetSuite."
    },
    {
      "title": "AI Model Transparency",
      "toolA": "Mercury states it uses AI for bill pay and transaction categorization but doesn't name the underlying models.",
      "toolB": "Novo explicitly states its AI features are powered by Claude, OpenAI, and Gemini.",
      "whyItMatters": "Some buyers care which AI vendors are processing their financial data.",
      "benefitsWho": "Security- or vendor-conscious finance teams."
    },
    {
      "title": "Direct Bank vs. Partner Bank Structure",
      "toolA": "Mercury's facts don't describe an explicit partner-bank disclosure.",
      "toolB": "Novo's facts state banking services are provided through a partner bank (Middlesex Federal Savings, F.A.) rather than Novo directly.",
      "whyItMatters": "Understanding who actually holds deposits and provides FDIC coverage matters for banking trust and compliance.",
      "benefitsWho": "Businesses doing vendor and banking due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Banking",
      "rows": [
        {
          "feature": "Free business checking (no monthly fees)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Business credit/debit cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Virtual cards",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Treasury / yield on balances",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mercury: up to 3.64% via Mercury Advisory, requires $250K+ balance."
        }
      ]
    },
    {
      "group": "Payments & Accounting",
      "rows": [
        {
          "feature": "Invoicing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named vendor/employee payments feature",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mercury documents broad \"Payment Processing\" (no-fee USD wires) rather than a distinctly named vendor/employee payments feature."
        },
        {
          "feature": "Named accounting software sync (QuickBooks/Xero/NetSuite)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automated expense categorization",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI bill pay / AI-assisted categorization",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust & Scale",
      "rows": [
        {
          "feature": "Documented app store rating",
          "toolA": "available",
          "toolB": "available",
          "note": "Mercury: 4.9 Apple App Store. Novo: 4.8 Apple, 4.5 Google Play."
        },
        {
          "feature": "Stated user base scale",
          "toolA": "available",
          "toolB": "available",
          "note": "Mercury: 300,000+ entrepreneurs. Novo: 250,000+ businesses."
        },
        {
          "feature": "Named AI model providers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Novo names Claude, OpenAI, and Gemini."
        },
        {
          "feature": "Business loans",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Mercury and Novo really free?",
      "answer": "Both offer free core business checking with no monthly fees or minimum balance; Mercury's paid Plus ($29.90/month) and Pro ($299/month) tiers add features, while Novo's documented plan is its single free Business Checking account."
    },
    {
      "question": "Does either offer a yield or treasury product?",
      "answer": "Mercury offers up to 3.64% yield via Mercury Advisory for balances of $250K or more; Novo's facts don't mention a yield or treasury product."
    },
    {
      "question": "Which accounting tools does each integrate with?",
      "answer": "Mercury syncs with QuickBooks, Xero, and NetSuite; Novo states it connects accounting, payment, and payroll tools but doesn't name specific platforms."
    },
    {
      "question": "Do these platforms use AI?",
      "answer": "Both do — Mercury uses AI to read and populate bill details and categorize transactions; Novo uses AI powered by Claude, OpenAI, and Gemini for onboarding and expense categorization."
    },
    {
      "question": "Who actually holds the deposits?",
      "answer": "Novo's facts state banking services are provided through Middlesex Federal Savings, F.A., a partner bank; Mercury's facts don't include an equivalent partner-bank disclosure."
    }
  ]
};

export default mercuryVsNovoContent;
