import type { ToolComparisonContent } from './types';

const minthcmVsOpenHrmsContent: ToolComparisonContent = {
  "verdict": "MintHCM and Open HRMS are both free, open-source HR platforms built on different underlying codebases — MintHCM on SuiteCRM/SugarCRM, Open HRMS on the Odoo ERP framework — and both are developed by teams with ties to Kerala, India. Open HRMS documents dedicated Payroll and Timesheets modules plus optional incident-based paid support packages, while MintHCM documents an Open API built for integrating with systems like SAP and Workday and lacks a documented payroll module.",
  "bestForToolA": "Teams that need to integrate HR data with enterprise systems like SAP or Workday through a documented Open API, or that want a lighter, AGPLv3-licensed system without inheriting a full ERP framework.",
  "bestForToolB": "Teams that need built-in Payroll and Timesheets modules, want to try a cloud demo instance before installing, and may want the option of paid, incident-based support packages ($499-$1,099/month) rather than relying only on community forums.",
  "whoNeedsBoth": "There's no realistic scenario for running both together — both are HR systems of record covering overlapping functions (recruitment, performance, leave), so a team would choose one rather than maintain duplicate HR data across two platforms.",
  "keyDifferences": [
    {
      "title": "Underlying Platform",
      "toolA": "MintHCM is built on the SuiteCRM/SugarCRM codebase, which its own listed cons note 'may carry some legacy architecture.'",
      "toolB": "Open HRMS is built on the Odoo ERP framework, inheriting Odoo's broader module ecosystem and requiring a PostgreSQL database for self-hosted installation.",
      "whyItMatters": "The underlying platform shapes both the feature ecosystem available and the technical skills needed to customize the system.",
      "benefitsWho": "Teams already familiar with Odoo benefit from Open HRMS's platform; teams wanting a CRM-adjacent codebase may find MintHCM's SuiteCRM/SugarCRM base familiar."
    },
    {
      "title": "Payroll Support",
      "toolA": "MintHCM's documented feature list does not include payroll — its feature set covers recruitment, onboarding/offboarding, performance evaluation, and time/leave/travel/expense management.",
      "toolB": "Open HRMS explicitly lists Payroll (salary and payment processing) as a core module.",
      "whyItMatters": "Payroll processing is a central HR function for most organizations evaluating an HRMS.",
      "benefitsWho": "Organizations needing built-in payroll benefit from Open HRMS's documented Payroll module."
    },
    {
      "title": "Paid Support Structure",
      "toolA": "MintHCM's support is described as primarily community-forum based, with paid implementation partners available as an option, rather than a fixed packaged pricing tier.",
      "toolB": "Open HRMS offers three incident-based monthly support packages: $499/month (15 incidents), $799/month (30 incidents), and $1,099/month (45 incidents), each with 24x7 availability.",
      "whyItMatters": "A packaged, priced support tier gives predictable costs for organizations that want guaranteed response times.",
      "benefitsWho": "Organizations wanting predictable, contracted support benefit from Open HRMS's tiered incident packages."
    },
    {
      "title": "Enterprise Integration API",
      "toolA": "MintHCM offers an Open API specifically described as enabling integration with systems like SAP and Workday.",
      "toolB": "Open HRMS's integration options aren't detailed beyond inheriting Odoo's broader module ecosystem.",
      "whyItMatters": "An explicitly documented enterprise integration API reduces ambiguity when planning system-to-system data flows.",
      "benefitsWho": "Organizations needing to connect HR data to SAP or Workday benefit from MintHCM's documented Open API."
    },
    {
      "title": "Pre-Install Evaluation",
      "toolA": "MintHCM does not document an equivalent hosted demo or trial option before installing.",
      "toolB": "Open HRMS provides a cloud demo instance so prospective users can evaluate the software before installing it locally.",
      "whyItMatters": "Being able to test a system before committing to a local install reduces evaluation risk.",
      "benefitsWho": "Teams wanting to evaluate before investing in installation time benefit from Open HRMS's cloud demo."
    }
  ],
  "featureMatrix": [
    {
      "group": "HR & Payroll Modules",
      "rows": [
        {
          "feature": "Payroll",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Recruitment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Appraisal / performance evaluation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Attendance & leave tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Travel & expense management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Timesheets",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Deployment",
      "rows": [
        {
          "feature": "Underlying framework",
          "toolA": "available",
          "toolB": "available",
          "note": "MintHCM: SuiteCRM/SugarCRM; Open HRMS: Odoo ERP"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Open HRMS requires PostgreSQL"
        },
        {
          "feature": "Cloud demo instance for evaluation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Open API for enterprise integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MintHCM: SAP, Workday integration"
        }
      ]
    },
    {
      "group": "Support & Licensing",
      "rows": [
        {
          "feature": "License",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MintHCM: AGPLv3"
        },
        {
          "feature": "Paid incident-based support packages",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Open HRMS: $499-$1,099/month"
        },
        {
          "feature": "Community translation program",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MintHCM uses Crowdin"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which includes payroll?",
      "answer": "Open HRMS lists Payroll as a dedicated module. MintHCM's documented feature list does not include payroll."
    },
    {
      "question": "What platform is each built on?",
      "answer": "Open HRMS is built on Odoo, requiring PostgreSQL for self-hosting. MintHCM is built on the SuiteCRM/SugarCRM codebase."
    },
    {
      "question": "Are both free?",
      "answer": "Yes, both are free, open-source downloads with no software license fee. Open HRMS additionally sells optional incident-based paid support packages ($499-$1,099/month), while MintHCM relies more on community forums and paid implementation partners."
    },
    {
      "question": "Can I try either before installing?",
      "answer": "Open HRMS offers a cloud demo instance for evaluation before installing. MintHCM doesn't document an equivalent pre-install demo."
    },
    {
      "question": "Which integrates with enterprise systems like SAP?",
      "answer": "MintHCM's Open API is explicitly described as supporting integration with systems such as SAP and Workday. Open HRMS's integration capabilities aren't detailed to that level in the available facts."
    },
    {
      "question": "Where are these platforms developed?",
      "answer": "Open HRMS is developed by Cybrosys Technologies, listed with headquarters in Kerala, India (and an office in London, UK per its FAQ). MintHCM's headquarters is not disclosed in its listing."
    }
  ]
};

export default minthcmVsOpenHrmsContent;
