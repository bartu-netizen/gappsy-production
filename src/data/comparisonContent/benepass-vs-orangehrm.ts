import type { ToolComparisonContent } from './types';

const benepassVsOrangehrmContent: ToolComparisonContent = {
  "verdict": "Benepass and OrangeHRM solve different parts of the HR stack: Benepass is a benefits-administration and Lifestyle Spending Account (LSA) card platform, while OrangeHRM is a full HRIS covering employee records, recruitment, onboarding, leave, time tracking, and performance. Benepass centers on a card-first way to fund and reimburse pre-tax and lifestyle benefits (HSA, FSA, HRA, commuter, LSAs) across 90+ countries, while OrangeHRM centers on core people-management workflows with a free, open-source Starter edition and a modular paid Advanced edition. Neither is a substitute for the other's core function.",
  "bestForToolA": "Benepass fits companies, especially ones with distributed or global teams, that want a single card to administer pre-tax benefits (HSA/FSA/HRA/commuter) plus flexible Lifestyle Spending Accounts, and that value its 98% client retention rate and 86% instant-approval transaction rate.",
  "bestForToolB": "OrangeHRM fits organizations that need core HR administration, recruitment/ATS, onboarding, leave, time tracking, and performance management in one system, particularly those that want a free, open-source Starter edition or the option to self-host rather than pay a SaaS benefits vendor.",
  "whoNeedsBoth": "A mid-size company could run its core HR records, recruiting pipeline, and leave/performance tracking in OrangeHRM while using Benepass as the funding and card mechanism for pre-tax benefits and lifestyle stipends, since OrangeHRM does not offer a benefits card or LSA product of its own.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Benepass is purpose-built for benefits administration: Lifestyle Spending Accounts, pre-tax benefits (HSA, FSA, HRA, commuter), and a physical/virtual card for redemptions.",
      "toolB": "OrangeHRM is a general HRIS covering Employee Management, Recruitment & Applicant Tracking, Onboarding, Leave Management, Time & Attendance, and Performance Management.",
      "whyItMatters": "Buyers searching for 'HR software' often actually need one of two very different things: a system of record for employees, or a way to fund and administer benefits.",
      "benefitsWho": "HR and People teams scoping which category of tool actually solves their immediate problem."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Benepass does not publish pricing; the site offers a savings calculator instead of listed prices.",
      "toolB": "OrangeHRM publishes a free, open-source Starter edition and clearly states Advanced is modular, per-module custom pricing with a 30-day free trial.",
      "whyItMatters": "OrangeHRM lets a team start for $0 today, while Benepass requires a sales conversation before any cost is known.",
      "benefitsWho": "Budget-conscious HR teams or startups that want to try software before involving procurement."
    },
    {
      "title": "Self-Hosting and Deployment",
      "toolA": "Benepass is a SaaS-only benefits platform with no self-hosted or open-source option documented.",
      "toolB": "OrangeHRM supports both cloud-hosted and on-premise deployment, with a fully open-source Starter edition.",
      "whyItMatters": "Organizations with data-residency or infrastructure-control requirements may need on-premise HR software, which OrangeHRM offers and Benepass does not.",
      "benefitsWho": "Regulated or security-conscious organizations that require on-premise deployment of core HR data."
    },
    {
      "title": "AI Features",
      "toolA": "Benepass includes Benefits Compliance GPT, an AI assistant specifically for answering benefits compliance questions.",
      "toolB": "OrangeHRM lists 'OrangeHRM AI' as intelligent automation capabilities within the platform, without detailing specific compliance-focused use cases.",
      "whyItMatters": "Benepass's AI is narrowly targeted at a known pain point (benefits compliance), while OrangeHRM's AI scope is broader but less specifically documented.",
      "benefitsWho": "Benefits administrators who need quick, accurate answers to compliance questions across pre-tax and LSA rules."
    },
    {
      "title": "Global Reach",
      "toolA": "Benepass states it operates in 90+ countries with $1B+ in global benefits funded.",
      "toolB": "OrangeHRM does not publish specific country coverage or funding volume figures on its site.",
      "whyItMatters": "Companies with distributed international teams need to confirm a benefits platform actually supports their employees' countries before committing.",
      "benefitsWho": "Globally distributed companies evaluating whether a benefits vendor can support employees outside their home country."
    }
  ],
  "featureMatrix": [
    {
      "group": "Benefits Administration",
      "rows": [
        {
          "feature": "Lifestyle Spending Accounts (LSAs)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Benepass LSAs cover wellness, professional development, family care, and food."
        },
        {
          "feature": "Pre-tax benefits (HSA/FSA/HRA/commuter)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Benefits payment card",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Tap-to-pay card-first technology."
        },
        {
          "feature": "Benefits compliance AI assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Benepass's Benefits Compliance GPT."
        }
      ]
    },
    {
      "group": "Core HR & Talent",
      "rows": [
        {
          "feature": "Employee records management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Recruitment / Applicant Tracking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Onboarding workflows",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Leave management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Performance management",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Access",
      "rows": [
        {
          "feature": "Free tier / open-source edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OrangeHRM Starter edition is free and open source."
        },
        {
          "feature": "On-premise deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "OrangeHRM Starter is free/public; Advanced pricing requires a custom quote."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Benepass an HRIS like OrangeHRM?",
      "answer": "No. Benepass is a benefits-administration and card platform focused on Lifestyle Spending Accounts and pre-tax benefits, while OrangeHRM is a full HRIS with employee records, recruitment, onboarding, leave, and performance modules."
    },
    {
      "question": "Does OrangeHRM offer a benefits card or LSA product?",
      "answer": "OrangeHRM's documented features do not include a benefits card or Lifestyle Spending Account product; that is Benepass's core offering."
    },
    {
      "question": "Is either tool free to start?",
      "answer": "OrangeHRM has a free, open-source Starter edition with core HR functionality. Benepass does not publish pricing or a free tier and instead offers a savings calculator."
    },
    {
      "question": "Can I self-host either platform?",
      "answer": "OrangeHRM supports both cloud-hosted and on-premise deployment. Benepass has no documented self-hosted option; it is a SaaS platform."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Benepass includes Benefits Compliance GPT for compliance questions. OrangeHRM lists 'OrangeHRM AI' as an intelligent automation capability, though specifics are not detailed on its site."
    },
    {
      "question": "Would a company ever use both Benepass and OrangeHRM?",
      "answer": "Yes — a company could use OrangeHRM for core HR administration, recruiting, and leave tracking, while using Benepass specifically to fund and administer pre-tax benefits and lifestyle stipends via its card, since OrangeHRM does not offer that functionality."
    }
  ]
};

export default benepassVsOrangehrmContent;
