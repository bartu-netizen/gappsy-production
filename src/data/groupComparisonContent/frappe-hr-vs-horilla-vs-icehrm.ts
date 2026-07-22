import type { GroupComparisonContent } from './types';

const frappeHrVsHorillaVsIcehrmContent: GroupComparisonContent = {
  "verdict": "Frappe HR, Horilla, and IceHrm are all open-source, self-hostable HR platforms that let small and mid-sized businesses avoid per-employee SaaS fees, but they differ in depth and ecosystem maturity. Frappe HR offers the broadest, most enterprise-grade module set, backed by the wider Frappe and ERPNext ecosystem and over 200 implementation partners, though it carries the steepest learning curve. Horilla stands out for bundling HR with CRM functionality in a single open-source platform. IceHrm is the leanest and most budget-focused of the three, with a genuinely free tier for very small teams and the lowest-cost paid cloud plan.",
  "bestFor": {
    "frappe-hr": "Organizations already in the Frappe or ERPNext ecosystem, or teams needing deep payroll, recruitment, and performance modules with no-code customization.",
    "horilla": "SMBs and agencies that want combined HR and CRM functionality in a single free, self-hosted open-source platform.",
    "icehrm": "Very small teams of five or fewer employees that want a genuinely free HRIS, or budget-conscious SMBs needing a low-cost per-employee cloud plan."
  },
  "highlights": [
    {
      "title": "Deepest Enterprise-Style Module Set",
      "description": "Frappe HR covers payroll, taxation, recruitment, performance, expense claims, and asset management, and inherits the no-code DocType customization system from the wider Frappe Framework.",
      "toolSlugs": [
        "frappe-hr"
      ]
    },
    {
      "title": "HR Plus CRM in One Platform",
      "description": "Horilla is the only one of the three that bundles a built-in CRM with lead capture and sales pipeline tracking alongside its HR modules.",
      "toolSlugs": [
        "horilla"
      ]
    },
    {
      "title": "Lowest Entry Price for Tiny Teams",
      "description": "IceHrm's cloud tier is free for organizations with five or fewer employees and its paid Cloud plan starts at just $12 per month, the lowest published paid entry point of the three.",
      "toolSlugs": [
        "icehrm"
      ]
    },
    {
      "title": "Infrastructure-Based Managed Cloud Pricing",
      "description": "Frappe Cloud and Horilla Cloud both offer managed hosting as an alternative to self-hosting, with Frappe pricing tied to infrastructure tiers and Horilla priced per user starting at $7 per month.",
      "toolSlugs": [
        "frappe-hr",
        "horilla"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Modules",
      "rows": [
        {
          "feature": "Payroll processing",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Recruitment and applicant tracking",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Performance management",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Asset management",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "available",
            "icehrm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Deployment",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Built-in CRM module",
          "statuses": {
            "frappe-hr": "unavailable",
            "horilla": "available",
            "icehrm": "unavailable"
          }
        },
        {
          "feature": "No-code custom fields and workflows",
          "statuses": {
            "frappe-hr": "available",
            "horilla": "not-documented",
            "icehrm": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Frappe HR really free to use?",
      "answer": "Yes for self-hosting: the full HRMS source code is free under AGPL-3.0 with unlimited employees. If you want managed hosting instead of running your own servers, Frappe Cloud starts from $5 per month, priced by infrastructure rather than per employee."
    },
    {
      "question": "What makes Horilla different from a typical HR tool?",
      "answer": "Horilla bundles a built-in CRM with lead capture and sales pipeline tracking directly alongside its HR modules, so small teams can manage both HR and light sales pipeline work in one open-source platform."
    },
    {
      "question": "Does IceHrm have a free plan?",
      "answer": "Yes. IceHrm's cloud tier is free for organizations with five or fewer employees, and it also has a self-hosted open-source edition. Its paid Cloud plan starts at $12 per month for up to six employees."
    },
    {
      "question": "Which of these three is easiest to run without dedicated IT staff?",
      "answer": "All three are open-source tools that can be self-hosted, which requires some technical capability. For teams that prefer not to manage servers, Frappe Cloud, Horilla Cloud, and IceHrm's Cloud plan all offer managed hosting alternatives."
    },
    {
      "question": "Do any of these three handle payroll tax compliance outside their home market?",
      "answer": "Frappe HR's payroll and tax computation are strongest for India-specific rules and may need additional configuration or partner support for other markets. Horilla and IceHrm both include payroll processing, though country-specific compliance depth is not detailed in the available data."
    }
  ]
};

export default frappeHrVsHorillaVsIcehrmContent;
