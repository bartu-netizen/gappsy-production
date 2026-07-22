import type { ToolComparisonContent } from './types';

const awardcoVsFormaBenefitsContent: ToolComparisonContent = {
  "verdict": "Awardco is a recognition-and-rewards platform centered on peer/manager recognition and a 300-million-option rewards catalog, with a general Benefits & Perks feature and AI-enhanced tools. Forma Benefits is a dedicated benefits administration platform managing Lifestyle Spending Accounts, HSAs, FSAs, and HRAs with a purpose-built payment card and claims processing. They address different parts of total rewards - recognition versus benefits administration.",
  "bestForToolA": "Organizations wanting a peer/manager recognition program with a large global rewards catalog and AI-enhanced recognition tools.",
  "bestForToolB": "Benefits teams needing to administer Lifestyle Spending Accounts, HSAs, FSAs, and HRAs with a dedicated spending card and claims processing rather than a recognition catalog.",
  "whoNeedsBoth": "A company could pair Forma to administer core pre-tax and lifestyle benefit accounts with Awardco to run its separate peer recognition and rewards program, since Forma doesn't document recognition features and Awardco doesn't document HSA/FSA/HRA account administration.",
  "keyDifferences": [
    {
      "title": "Core Platform Purpose",
      "toolA": "Awardco is a recognition and rewards platform with a configurable 300-million-option catalog for celebrating achievements.",
      "toolB": "Forma is a benefits administration platform for pre-tax and lifestyle spending accounts covering healthcare and lifestyle expenses.",
      "whyItMatters": "Buyers need to know whether they're evaluating a recognition tool or a benefits infrastructure platform.",
      "benefitsWho": "HR and total rewards teams scoping which part of employee experience they need to solve for."
    },
    {
      "title": "Spending Mechanism",
      "toolA": "Rewards are redeemed through Awardco's configurable rewards network rather than a documented payment card.",
      "toolB": "Forma provides a Forma Visa Card so employees can pay for eligible benefits directly without fronting costs, plus the curated Forma Store marketplace.",
      "whyItMatters": "A payment card removes the reimbursement friction of paying out of pocket and waiting for repayment.",
      "benefitsWho": "Employees who want to avoid fronting money for eligible health and lifestyle expenses."
    },
    {
      "title": "Account Types Administered",
      "toolA": "Awardco's Benefits & Perks feature is described generally as personalized employee benefits offerings, without documenting specific account types.",
      "toolB": "Forma explicitly manages Lifestyle Spending Accounts, HSAs, FSAs, and HRAs with dedicated claims administration.",
      "whyItMatters": "Pre-tax account compliance requires specific plan administration that a general perks feature may not cover.",
      "benefitsWho": "Benefits administrators needing documented support for specific pre-tax account types."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Awardco offers Awardco Intelligence (AI-enhanced recognition) and Awardco Engage (a survey/feedback tool).",
      "toolB": "Forma's feature list does not mention AI capabilities.",
      "whyItMatters": "AI-enhanced recognition tools can help scale personalized recognition as headcount grows.",
      "benefitsWho": "Recognition program managers wanting AI-assisted personalization."
    },
    {
      "title": "Mobile Access",
      "toolA": "Awardco does not document dedicated mobile apps.",
      "toolB": "Forma is explicitly available on web, iOS, and Android.",
      "whyItMatters": "Employees checking benefits balances or making claims often need mobile access.",
      "benefitsWho": "Distributed or frontline workforces needing mobile access to benefits accounts."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer & manager recognition",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Configurable rewards catalog",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Awardco: 300M options"
        },
        {
          "feature": "Custom incentive programs",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Milestone celebrations",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Benefits & Spending Accounts",
      "rows": [
        {
          "feature": "Lifestyle Spending Accounts (LSA)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HSA/FSA pre-tax account support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Health Reimbursement Arrangements (HRA)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Dedicated payment card for benefits",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Forma Visa Card"
        },
        {
          "feature": "Curated vendor marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Forma Store"
        }
      ]
    },
    {
      "group": "Platform & Trust",
      "rows": [
        {
          "feature": "AI-powered features",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Awardco Intelligence"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Employee survey/feedback tool",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Awardco Engage"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Awardco and Forma the same type of platform?",
      "answer": "No. Awardco is a recognition and rewards platform with a 300-million-option reward catalog, while Forma is a benefits administration platform managing LSAs, HSAs, FSAs, and HRAs."
    },
    {
      "question": "Does Awardco offer benefits administration?",
      "answer": "Awardco lists a general Benefits & Perks feature, but doesn't document specific account types like HSA, FSA, or HRA the way Forma does."
    },
    {
      "question": "How do employees spend funds in each platform?",
      "answer": "Forma gives employees a Forma Visa Card to pay directly for eligible benefits plus a curated Forma Store marketplace. Awardco redeems recognition through its configurable rewards network of 300 million options."
    },
    {
      "question": "Is pricing public for either platform?",
      "answer": "No, both Awardco and Forma require contacting sales or requesting a demo for pricing."
    },
    {
      "question": "Which has mobile apps?",
      "answer": "Forma is documented as available on web, iOS, and Android. Awardco does not document dedicated mobile apps."
    },
    {
      "question": "Does Forma use AI?",
      "answer": "Not documented - Forma's public feature list covers accounts, claims, and a marketplace without mentioning AI, unlike Awardco's Awardco Intelligence feature."
    }
  ]
};

export default awardcoVsFormaBenefitsContent;
