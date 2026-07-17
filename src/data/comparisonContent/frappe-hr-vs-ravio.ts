import type { ToolComparisonContent } from './types';

const frappeHrVsRavioContent: ToolComparisonContent = {
  "verdict": "Frappe HR and Ravio both touch compensation but for opposite reasons: Frappe HR is a 100% open-source HR and payroll platform covering the full employee lifecycle (recruitment, attendance, leave, payroll, performance) that can be self-hosted for free or run on Frappe Cloud from $5/month, while Ravio is a real-time compensation benchmarking platform that tells you what the market pays, sourced from live HR system data across 1,400+ companies, starting at £5,000/year. One runs your HR operations; the other tells you if your pay is competitive.",
  "bestForToolA": "Organizations, especially technical ones comfortable with self-hosting or the Frappe ecosystem, that need a full open-source HR and payroll system covering the entire employee lifecycle from recruitment to payroll tax reporting, integrated with ERPNext accounting.",
  "bestForToolB": "High-growth tech companies (Ravio is targeted primarily at this segment) that need live, filterable compensation benchmark data across 50+ countries and 300+ roles to build salary bands and run pay equity analysis, connecting to 75+ HRIS platforms like Workday and HiBob.",
  "whoNeedsBoth": "A company running Frappe HR as its system of record for payroll and employee data could connect it to Ravio (via Ravio's 75+ HRIS integrations, if Frappe HR is supported) to pull in live market benchmarking data and build defensible salary bands on top of the payroll data Frappe HR already manages.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Frappe HR is an operational HR/payroll system of record: recruitment, employee lifecycle management, shifts and attendance, leave, expenses, performance, and payroll tax reporting.",
      "toolB": "Ravio is a compensation intelligence tool: real-time benchmarking, salary bands, pay equity analysis, and compensation review workflows sourced from live data across 1,400+ companies.",
      "whyItMatters": "These are not substitutes — one runs HR operations day-to-day, the other informs pay decisions with market data.",
      "benefitsWho": "HR and People teams need to identify whether their gap is 'we don't have a system to run payroll' (Frappe HR) or 'we don't know if our pay is competitive' (Ravio)."
    },
    {
      "title": "Pricing Model",
      "toolA": "Frappe HR can be self-hosted for free under AGPL-3.0, or run on Frappe Cloud starting at $5/month for site hosting (with a 14-day free trial).",
      "toolB": "Ravio's Standard plan starts at £5,000/year, positioned for high-growth tech companies rather than budget-constrained teams.",
      "whyItMatters": "The roughly 1,000x difference in entry cost reflects that one is a self-hostable open-source system and the other is a data/intelligence subscription with ongoing data-sourcing costs.",
      "benefitsWho": "Cash-conscious startups may prefer Frappe HR's free self-hosted tier; well-funded scale-ups needing defensible compensation data may accept Ravio's higher price."
    },
    {
      "title": "Open Source vs. Proprietary Data Product",
      "toolA": "Frappe HR is 100% open source under AGPL-3.0 with 8.2K GitHub stars, meaning the code is fully inspectable and modifiable.",
      "toolB": "Ravio is a proprietary Custom/Enterprise product built around live data sourced from HR systems of 1,400+ companies, which isn't something an open-source alternative can replicate without that data network.",
      "whyItMatters": "Open-source HR software offers customization and data control; compensation benchmarking specifically requires a data network effect that only a centralized commercial provider can build.",
      "benefitsWho": "Engineering-led organizations wanting full control benefit from Frappe HR's open model; People teams needing credible market data benefit from Ravio's data network, which can't be self-hosted."
    },
    {
      "title": "Integration Direction",
      "toolA": "Frappe HR integrates with ERPNext accounting and supports REST APIs, webhooks, biometric, and bank integrations.",
      "toolB": "Ravio connects with 75+ HR systems, including HiBob, Workday, and Personio, to automatically sync job, salary, and employee data.",
      "whyItMatters": "Frappe HR integrates outward toward accounting and hardware systems; Ravio integrates inward, pulling salary data from whatever HRIS a company already uses.",
      "benefitsWho": "Companies with an existing HRIS (Workday, HiBob, Personio) can plug Ravio in without replacing that system, while companies wanting to replace their HR system entirely would look at Frappe HR."
    },
    {
      "title": "Company Transparency",
      "toolA": "Frappe HR's founding year, headquarters, and company size are not disclosed on its site.",
      "toolB": "Ravio was founded in 2022, is headquartered in London, UK, and has disclosed $22M in total funding including a $12M Series A led by Spark Capital.",
      "whyItMatters": "Funding and company transparency can matter for enterprise procurement teams assessing vendor stability, especially for a compensation data provider handling sensitive salary information.",
      "benefitsWho": "Procurement and legal teams doing vendor due diligence, particularly for a tool touching sensitive pay data."
    }
  ],
  "featureMatrix": [
    {
      "group": "HR Operations",
      "rows": [
        {
          "feature": "Recruitment/hiring workflow",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Payroll processing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Leave and attendance management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Performance management (goals, appraisals)",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Compensation Intelligence",
      "rows": [
        {
          "feature": "Real-time market compensation benchmarking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Data from 1,400+ companies"
        },
        {
          "feature": "Salary band building",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Pay equity analysis",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Compensation review cycle workflows",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted/open-source option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Frappe HR: AGPL-3.0"
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Frappe HR: $5/mo cloud hosting; Ravio: £5,000/year"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "14-day trial on Frappe Cloud"
        },
        {
          "feature": "HRIS integration breadth",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Ravio: 75+ HR systems"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Frappe HR and Ravio do the same thing?",
      "answer": "No. Frappe HR is an operational HR and payroll system covering the full employee lifecycle. Ravio is a compensation benchmarking platform that provides live market salary data to inform pay decisions, not a system for running HR operations."
    },
    {
      "question": "Is Frappe HR free?",
      "answer": "Yes, it can be self-hosted for free under the AGPL-3.0 open-source license, or deployed on managed Frappe Cloud starting at $5/month for site hosting with a 14-day free trial."
    },
    {
      "question": "How much does Ravio cost?",
      "answer": "Ravio's annual plans start from £5,000/year, targeted primarily at high-growth tech companies rather than very small companies."
    },
    {
      "question": "Is Ravio's compensation data reliable?",
      "answer": "Ravio states its data is sourced live directly from the HR systems of 1,400+ companies across 50+ countries and 300+ roles, rather than from surveys, and it integrates with 75+ HR systems including HiBob, Workday, and Personio to keep data current."
    },
    {
      "question": "Can Frappe HR and Ravio be used together?",
      "answer": "Potentially, since they serve different purposes. A company could run Frappe HR as its HR/payroll system of record while using Ravio's HRIS integrations to pull in market benchmarking data for building salary bands, if Frappe HR is among Ravio's supported integrations."
    },
    {
      "question": "Is Frappe HR open source?",
      "answer": "Yes, Frappe HR is 100% open source under the AGPL-3.0 license with 8.2K GitHub stars. Ravio is a proprietary, closed compensation data product."
    }
  ]
};

export default frappeHrVsRavioContent;
