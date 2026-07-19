import type { GroupComparisonContent } from './types';

const deelVsHibobVsIcehrmContent: GroupComparisonContent = {
  "verdict": "Deel, HiBob, and IceHrm are all HR platforms, but they are built for very different company profiles and budgets. Deel specializes in compliantly hiring, paying, and managing employees and contractors across 150-plus countries through its Employer of Record and global payroll products. HiBob is a design-forward, mid-market HRIS with native US and UK payroll, compensation management, and AI-driven people analytics, priced on request. IceHrm is a free-to-low-cost, self-hostable HR tool covering the core HR lifecycle for small teams that want to control their own infrastructure or keep costs minimal. Choosing between them mostly comes down to company size and whether international compliant hiring is the primary need.",
  "bestFor": {
    "deel": "Companies hiring or paying employees and contractors across many countries without setting up local legal entities.",
    "hibob": "Mid-market companies that want a polished, full-featured HRIS with native US and UK payroll and built-in people analytics.",
    "icehrm": "Small teams or budget-conscious and self-hosting-minded companies that want core HR, attendance, and payroll for free or low cost."
  },
  "highlights": [
    {
      "title": "Global Employer of Record coverage",
      "description": "Deel is the only one of the three offering Employer of Record services, letting companies hire full-time employees in 150-plus countries without establishing a local entity.",
      "toolSlugs": [
        "deel"
      ]
    },
    {
      "title": "Free, self-hosted option for small teams",
      "description": "IceHrm offers a genuinely free tier for up to five employees and a self-hostable, open-source PHP and MySQL codebase for full data control.",
      "toolSlugs": [
        "icehrm"
      ]
    },
    {
      "title": "Native payroll plus AI-driven people analytics",
      "description": "HiBob combines native US and UK payroll with AI-powered engagement surveys and analytics that flag burnout, disengagement, and attrition risk.",
      "toolSlugs": [
        "hibob"
      ]
    },
    {
      "title": "Lowest cost entry point",
      "description": "IceHrm's free tier and roughly $12-per-month Cloud plan undercut both Deel's per-employee pricing and HiBob's custom, typically $8 to $25 per employee per month, quotes.",
      "toolSlugs": [
        "icehrm"
      ]
    },
    {
      "title": "Deepest per-worker pricing transparency",
      "description": "Deel publishes specific per-employee and per-contractor prices across its Global Payroll, Contractor Management, Contractor of Record, and EOR products, while HiBob requires a custom sales quote.",
      "toolSlugs": [
        "deel"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Management",
      "rows": [
        {
          "feature": "Employee records, org charts, and onboarding",
          "statuses": {
            "deel": "available",
            "hibob": "available",
            "icehrm": "available"
          }
        }
      ]
    },
    {
      "group": "Payroll and Global Hiring",
      "rows": [
        {
          "feature": "Employer of Record for international hiring",
          "statuses": {
            "deel": "available",
            "hibob": "not-documented",
            "icehrm": "not-documented"
          }
        },
        {
          "feature": "Native in-house payroll processing",
          "statuses": {
            "deel": "available",
            "hibob": "available",
            "icehrm": "available"
          },
          "note": "Deel runs payroll for owned entities in 100-plus countries, HiBob natively processes US and UK payroll, and IceHrm runs basic payroll and payslip generation for self-hosted or cloud customers."
        }
      ]
    },
    {
      "group": "Deployment and Cost",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "deel": "unavailable",
            "hibob": "unavailable",
            "icehrm": "available"
          }
        },
        {
          "feature": "Permanently free tier",
          "statuses": {
            "deel": "unavailable",
            "hibob": "unavailable",
            "icehrm": "available"
          },
          "note": "IceHrm's free tier covers up to five employees."
        }
      ]
    },
    {
      "group": "Analytics and Performance",
      "rows": [
        {
          "feature": "AI-driven people analytics or attrition risk insights",
          "statuses": {
            "deel": "not-documented",
            "hibob": "available",
            "icehrm": "not-documented"
          }
        },
        {
          "feature": "Structured performance review management",
          "statuses": {
            "deel": "not-documented",
            "hibob": "available",
            "icehrm": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can IceHrm really be used for free?",
      "answer": "Yes, for up to five employees on its Free plan, and it can also be self-hosted on an organization's own PHP and MySQL server for full data control."
    },
    {
      "question": "Is Deel only useful for international Employer of Record hiring?",
      "answer": "No. Beyond EOR, Deel also offers global payroll for a company's own entities, contractor management and payments in 120-plus currencies, and a general HRIS dashboard."
    },
    {
      "question": "Which of the three has the most transparent published pricing?",
      "answer": "Deel publishes specific per-employee and per-contractor rates for each product line, while HiBob's pricing requires a custom sales quote and IceHrm publishes tiered pricing for its Free and Cloud plans."
    },
    {
      "question": "Which platform fits a mid-market company with a few hundred employees best?",
      "answer": "HiBob, with its native US and UK payroll, compensation management, and AI-powered people analytics built for growing, distributed mid-market teams."
    },
    {
      "question": "Which fits a five-person startup on a tight budget?",
      "answer": "IceHrm, since its Free tier covers up to five employees at no cost, including self-hosting."
    },
    {
      "question": "Do any of these three self-host?",
      "answer": "Only IceHrm offers a self-hosted deployment option; Deel and HiBob are both delivered as managed cloud platforms."
    }
  ]
};

export default deelVsHibobVsIcehrmContent;
