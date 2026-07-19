import type { GroupComparisonContent } from './types';

const deelVsHorillaVsIcehrmContent: GroupComparisonContent = {
  "verdict": "Deel, Horilla, and IceHrm sit at opposite ends of the HR software spectrum. Deel is a premium, per-employee-priced platform built around global payroll, Employer of Record, and international hiring compliance, with core HR record-keeping as a secondary feature. Horilla and IceHrm are free, open-source, self-hostable HR management systems focused on core employee lifecycle tasks like attendance, leave, recruitment, and payroll, with Horilla covering a broader module set including a built-in CRM and IceHrm targeting very small teams with a genuinely free tier. Businesses choosing between them are really choosing between paying for global employment compliance versus self-managing a lightweight HR system at low or no licensing cost.",
  "bestFor": {
    "deel": "Companies hiring and paying employees or contractors across 150-plus countries that need compliant global payroll, Employer of Record services, and visa or equity support in one platform.",
    "horilla": "Organizations that want a free, open-source HRMS with unlimited self-hosted users, broad lifecycle coverage including a built-in CRM, and an optional managed Cloud tier for teams that do not want to self-host.",
    "icehrm": "Very small teams of five or fewer employees that want a genuinely free, simple self-hosted HR tool, or slightly larger teams wanting a low per-employee cloud plan."
  },
  "highlights": [
    {
      "title": "A wide pricing gap",
      "description": "Deel's plans run from $29 per employee per month for payroll up to $899 per employee per month for Enterprise EOR, while Horilla's self-hosted core and IceHrm's tier for up to five employees are both free.",
      "toolSlugs": [
        "deel",
        "horilla",
        "icehrm"
      ]
    },
    {
      "title": "Global employment is Deel's specialty",
      "description": "Deel's Employer of Record, immigration and visa support, and equity management features let companies hire abroad without setting up a local entity, a capability Horilla and IceHrm do not offer.",
      "toolSlugs": [
        "deel"
      ]
    },
    {
      "title": "Two open-source, self-hostable alternatives",
      "description": "Both Horilla and IceHrm can be installed and run on a company's own servers, giving full data control at little to no licensing cost, unlike Deel's fully managed SaaS model.",
      "toolSlugs": [
        "horilla",
        "icehrm"
      ]
    },
    {
      "title": "Different free-tier limits",
      "description": "Horilla's free self-hosted edition supports unlimited users and companies, while IceHrm's free tier is capped at five employees before a paid Cloud plan is needed.",
      "toolSlugs": [
        "horilla",
        "icehrm"
      ]
    },
    {
      "title": "Managed cloud options for less technical teams",
      "description": "Horilla Cloud and IceHrm's Cloud plan both offer managed hosting for teams that want the open-source feature set without running their own servers, positioned as lower-cost alternatives to Deel's fully managed platform.",
      "toolSlugs": [
        "horilla",
        "icehrm",
        "deel"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Functions",
      "rows": [
        {
          "feature": "Payroll processing",
          "statuses": {
            "deel": "available",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Recruitment / applicant tracking",
          "statuses": {
            "deel": "not-documented",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Performance management",
          "statuses": {
            "deel": "not-documented",
            "horilla": "available",
            "icehrm": "available"
          }
        }
      ]
    },
    {
      "group": "Global Employment and Mobility",
      "rows": [
        {
          "feature": "Employer of Record / international hiring",
          "statuses": {
            "deel": "available",
            "horilla": "unavailable",
            "icehrm": "unavailable"
          }
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "deel": "available",
            "horilla": "not-documented",
            "icehrm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Cost",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "deel": "unavailable",
            "horilla": "available",
            "icehrm": "available"
          }
        },
        {
          "feature": "Free tier",
          "statuses": {
            "deel": "unavailable",
            "horilla": "available",
            "icehrm": "available"
          },
          "note": "Horilla's free self-hosted tier has no user limit; IceHrm's free tier is capped at five employees."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Horilla and IceHrm really free to use?",
      "answer": "Yes, with different limits. Horilla's self-hosted core edition is free with unlimited users and companies under an open-source license. IceHrm's free tier is also self-hostable but capped at five employees, after which its Cloud plan starts from around $12 per month."
    },
    {
      "question": "Does Deel offer core HR record-keeping like Horilla and IceHrm?",
      "answer": "Deel includes an HRIS dashboard covering time off, expenses, org charts, and reporting, but its primary focus and pricing are built around global payroll, Employer of Record, and contractor management rather than being a general-purpose HRMS."
    },
    {
      "question": "Which tool is best for hiring an employee in another country without a local entity?",
      "answer": "Deel is built specifically for this through its Employer of Record service, which lets a company legally employ someone abroad without setting up its own local entity, along with visa and equity support that Horilla and IceHrm do not offer."
    },
    {
      "question": "Can Horilla or IceHrm be self-hosted on a company's own servers?",
      "answer": "Yes, both can. Horilla is distributed under an LGPL-2.1 license with full source-code access, and IceHrm's codebase is also self-hostable on a company's own PHP and MySQL server."
    },
    {
      "question": "How much more expensive is Deel compared to the open-source options?",
      "answer": "Substantially more. Deel's plans start at $29 per employee per month for payroll and rise to $899 per employee per month for Enterprise-tier Employer of Record, while Horilla and IceHrm both offer free self-hosted tiers, with IceHrm's paid Cloud plan starting around $12 per month total rather than per employee."
    },
    {
      "question": "Which option fits a five-person startup on a tight budget?",
      "answer": "IceHrm's free tier is built for teams of exactly this size, and Horilla's free self-hosted edition has no user cap at all, making either a lower-cost starting point than Deel for a small team that does not need international Employer of Record services."
    }
  ]
};

export default deelVsHorillaVsIcehrmContent;
