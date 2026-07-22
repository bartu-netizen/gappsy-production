import type { ToolComparisonContent } from './types';

const justworksVsMultiplierContent: ToolComparisonContent = {
  "verdict": "Justworks and Multiplier serve different core use cases: Justworks is a US-based PEO bundling payroll, benefits, and compliance for domestic employees with international hiring as an add-on, while Multiplier is built EOR-first for hiring full-time employees and contractors abroad without a domestic PEO relationship. The right choice depends on whether the majority of hires are domestic US employees or international ones.",
  "bestForToolA": "Justworks fits US-based small businesses that want payroll, benefits (including health insurance, HSA/FSA, and 401(k)), compliance support, and an employee perks marketplace bundled into one flat per-employee PEO plan, with a published price starting at $79/employee/month.",
  "bestForToolB": "Multiplier fits companies hiring full-time employees or contractors in other countries without setting up local entities, offering flat $400/month EOR pricing with no setup or offboarding fees, 24-72 hour onboarding, immigration/visa support, and ESOP support for global hires, backed by 100+ owned entities across 150+ countries.",
  "whoNeedsBoth": "A US company with a domestic workforce plus a smaller number of international hires might use Justworks as its core domestic PEO (payroll, benefits, compliance) while using Multiplier specifically for EOR employment of overseas staff, rather than covering both needs with either platform alone.",
  "keyDifferences": [
    {
      "title": "Core service model",
      "toolA": "A PEO (co-employment) model bundling US payroll, benefits, compliance, and HR support, with international hiring only available as a separate add-on.",
      "toolB": "An Employer of Record (EOR) model built specifically for hiring full-time employees and contractors abroad without local entities.",
      "whyItMatters": "PEO and EOR solve different legal/administrative problems -- co-employment for domestic teams versus acting as the legal employer overseas.",
      "benefitsWho": "US-only small businesses need PEO; companies actively hiring across borders need EOR."
    },
    {
      "title": "Pricing structure",
      "toolA": "Tiered PEO pricing: PEO Basic at $79/employee/month, PEO Plus (with health insurance) at $109/employee/month, plus a separate Payroll-only plan at $50/month base + $8/employee/month.",
      "toolB": "Flat-rate EOR pricing at $400/month per employee with no setup or offboarding fees, and separate contractor pricing at $40/contractor/month.",
      "whyItMatters": "Justworks' tiers let teams choose whether to include health benefits, while Multiplier's flat rate simplifies budgeting for global hires regardless of country.",
      "benefitsWho": "Cost-sensitive domestic teams benefit from PEO tiering; global HR teams budgeting across many countries benefit from Multiplier's flat pricing."
    },
    {
      "title": "International/global hiring",
      "toolA": "International hiring is offered only as a separate, higher-cost add-on rather than included in the core plans.",
      "toolB": "Global hiring in 100+ countries with visa/immigration support and ESOP support built into the core offering.",
      "whyItMatters": "For companies whose growth strategy centers on distributed global teams, having EOR as the core product versus an add-on affects cost predictability and support depth.",
      "benefitsWho": "Globally distributed startups vs. primarily domestic US employers."
    },
    {
      "title": "Included benefits",
      "toolA": "PEO Plus includes health insurance administration, HSA/FSA accounts, mental health and fertility benefits, plus a 401(k) retirement plan and employee perks marketplace.",
      "toolB": "Facts document ESOP (Employee Stock Ownership Plan) support for global hires and 24/5 local HR/legal support, but do not detail health insurance or retirement benefit administration.",
      "whyItMatters": "Benefits administration depth affects whether a platform can serve as a full HR benefits provider or just an employment/legal wrapper.",
      "benefitsWho": "US employers wanting integrated benefits administration; global employers prioritizing equity compensation for international hires."
    },
    {
      "title": "Company footprint",
      "toolA": "Founded 2012, headquartered in New York, NY.",
      "toolB": "Founded 2020, headquartered in Singapore, backed by 100+ owned entities across 150+ countries.",
      "whyItMatters": "An EOR provider's owned-entity network size affects how directly (versus via subcontracted local partners) it can guarantee compliant employment in a given country.",
      "benefitsWho": "Companies hiring in a wide range of countries who want assurance of direct entity ownership rather than third-party subcontracting."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Employment Services",
      "rows": [
        {
          "feature": "Domestic (US) PEO co-employment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Employer of Record (international)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Justworks only offers international hiring/contractors via a paid add-on; Multiplier's EOR is a core product."
        },
        {
          "feature": "Contractor payments",
          "toolA": "available",
          "toolB": "available",
          "note": "Multiplier prices contractors at $40/contractor/month."
        },
        {
          "feature": "Immigration/visa support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "ESOP / equity support for global hires",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Benefits & Payroll",
      "rows": [
        {
          "feature": "Health insurance administration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Justworks' PEO Plus plan."
        },
        {
          "feature": "401(k)/retirement plans",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Payroll processing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published per-employee pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Justworks: $79-$109/employee/month. Multiplier: flat $400/employee/month."
        },
        {
          "feature": "No setup/offboarding fees stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom-priced global payroll/immigration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Justworks and Multiplier?",
      "answer": "Justworks is a PEO offering payroll, benefits, and compliance for US-based employees with international hiring as an add-on. Multiplier is an EOR platform built specifically for hiring full-time employees and contractors abroad without local entities."
    },
    {
      "question": "How much do they cost?",
      "answer": "Justworks' PEO Basic plan is $79/employee/month and PEO Plus is $109/employee/month. Multiplier's EOR plan is a flat $400/month per employee with no setup or offboarding fees."
    },
    {
      "question": "Does either support hiring contractors?",
      "answer": "Yes -- Justworks manages contractor and vendor payments as part of its core plans, and Multiplier offers contractor onboarding and payments at $40/contractor/month."
    },
    {
      "question": "How fast is onboarding with Multiplier?",
      "answer": "Multiplier states employee onboarding typically completes within 24-72 hours."
    },
    {
      "question": "Where are these companies based?",
      "answer": "Justworks was founded in 2012 and is headquartered in New York, NY. Multiplier was founded in 2020 and is headquartered in Singapore."
    },
    {
      "question": "Does Multiplier support equity compensation for global hires?",
      "answer": "Yes, Multiplier supports Employee Stock Ownership Plans (ESOP) for global hires."
    }
  ]
};

export default justworksVsMultiplierContent;
