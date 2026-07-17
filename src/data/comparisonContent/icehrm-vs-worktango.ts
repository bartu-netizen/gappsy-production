import type { ToolComparisonContent } from './types';

const icehrmVsWorktangoContent: ToolComparisonContent = {
  "verdict": "IceHrm and WorkTango serve very different parts of the HR stack. IceHrm is a broad, self-hostable HR toolkit covering employee management, leave, attendance, payroll, performance reviews, and recruitment, with a free open-source edition and a $2,499 one-time IceHrmPro license. WorkTango is an employee experience platform focused on recognition and rewards plus AI-powered listening (Constellation), with pricing entirely custom and unpublished.",
  "bestForToolA": "IceHrm fits organizations that want core HR operations software (leave, attendance, payroll reports, recruitment) with the option to self-host for free or pay a one-time $2,499 license for IceHrmPro, avoiding recurring per-user subscription costs.",
  "bestForToolB": "WorkTango fits organizations prioritizing employee experience — recognition and rewards, lifecycle surveys, and AI-powered listening via Constellation — backed by Vista Equity Partners and used across manufacturing, education, SaaS, and government.",
  "whoNeedsBoth": "A mid-size company could realistically run both: IceHrm as the operational system of record for leave, attendance, and payroll data, alongside WorkTango layered on top for recognition, rewards, and engagement surveys that operational HR software like IceHrm doesn't cover.",
  "keyDifferences": [
    {
      "title": "Core Category",
      "toolA": "IceHrm is a complete HR toolkit: employee management, leave, attendance, payroll, performance reviews, and recruitment.",
      "toolB": "WorkTango is an employee experience platform centered on recognition and rewards plus AI-powered listening, not operational HR record-keeping.",
      "whyItMatters": "Buyers looking for payroll/attendance software and buyers looking for a recognition platform are solving different problems entirely, even though both are 'HR' tools.",
      "benefitsWho": "HR operations teams need IceHrm's operational scope; people/culture teams focused on engagement need WorkTango's experience scope."
    },
    {
      "title": "Pricing Model",
      "toolA": "IceHrm offers a free self-hosted open-source community edition, a $2,499 one-time IceHrmPro self-hosted license, and custom-priced IceHrm Cloud.",
      "toolB": "WorkTango's pricing model is not documented at all; no pricing information, free trial, or plan structure is published.",
      "whyItMatters": "A one-time license versus fully custom, unpublished pricing represent very different budgeting and procurement processes.",
      "benefitsWho": "Cost-conscious organizations wanting a predictable one-time cost benefit from IceHrm; WorkTango's model instead requires a sales conversation to determine any cost at all."
    },
    {
      "title": "Self-Hosting vs. Managed Platform",
      "toolA": "IceHrm gives a choice between self-hosted (one-time cost, own infrastructure) or fully managed IceHrm Cloud with 99.9% uptime SLA, automatic updates, and daily backups.",
      "toolB": "WorkTango's deployment model is not documented, with no self-hosting option mentioned.",
      "whyItMatters": "Organizations with data residency requirements or a preference for owning their infrastructure need a documented self-hosting path.",
      "benefitsWho": "IT-heavy organizations with infrastructure control requirements benefit from IceHrm's self-hosted option."
    },
    {
      "title": "AI Capabilities",
      "toolA": "IceHrm's documented feature set does not include any AI-powered capability.",
      "toolB": "WorkTango's Constellation is an AI-powered employee listening tool for deeper insight into feedback.",
      "whyItMatters": "Teams wanting AI-assisted analysis of open-ended employee feedback need a platform that documents that capability specifically.",
      "benefitsWho": "People analytics teams analyzing large volumes of qualitative feedback benefit from WorkTango's Constellation."
    },
    {
      "title": "Mobile Access",
      "toolA": "IceHrm has mobile apps available on both the iOS App Store and Google Play Store.",
      "toolB": "WorkTango's documented feature list does not mention dedicated mobile apps.",
      "whyItMatters": "Frontline or field employees without regular desktop access need native mobile apps to interact with HR systems.",
      "benefitsWho": "Organizations with distributed or non-desk workforces benefit from IceHrm's documented mobile app availability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Operations",
      "rows": [
        {
          "feature": "Employee records management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Leave management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Time & attendance tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Payroll reports",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Recruitment / applicant tracking",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Engagement & Recognition",
      "rows": [
        {
          "feature": "Recognition & rewards programs",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Employee lifecycle surveys",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-powered employee listening",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "WorkTango's Constellation."
        },
        {
          "feature": "Performance reviews (360-degree)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Free/open-source tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "IceHrmPro is $2,499 one-time; IceHrm Cloud and WorkTango are both custom quotes."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do IceHrm and WorkTango compete directly?",
      "answer": "Not really. IceHrm is an operational HR toolkit (leave, attendance, payroll, recruitment), while WorkTango is an employee experience platform focused on recognition, rewards, and AI-powered listening. They cover different parts of HR."
    },
    {
      "question": "How much does IceHrm cost compared to WorkTango?",
      "answer": "IceHrm has a free open-source community edition, a $2,499 one-time IceHrmPro self-hosted license, and custom-priced IceHrm Cloud. WorkTango's pricing is not published at all and requires contacting sales."
    },
    {
      "question": "Does either platform include AI features?",
      "answer": "WorkTango's Constellation is an AI-powered employee listening tool for surfacing feedback insights. IceHrm's documented feature set does not include any AI capability."
    },
    {
      "question": "Can IceHrm be self-hosted?",
      "answer": "Yes, IceHrm offers both a free self-hosted open-source edition and a paid self-hosted IceHrmPro license ($2,499 one-time), plus a fully managed IceHrm Cloud option. WorkTango's deployment model is not documented."
    },
    {
      "question": "Does IceHrm have mobile apps?",
      "answer": "Yes, IceHrm has mobile apps on both the iOS App Store and Google Play Store. WorkTango's documented feature list does not mention mobile apps."
    },
    {
      "question": "Who backs WorkTango?",
      "answer": "WorkTango is backed by Vista Equity Partners and is used across industries including manufacturing, education, SaaS/technology, and government, according to the company."
    }
  ]
};

export default icehrmVsWorktangoContent;
