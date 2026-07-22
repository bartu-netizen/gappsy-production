import type { ToolComparisonContent } from './types';

const assemblyEmployeeRecognitionVsKudosContent: ToolComparisonContent = {
  "verdict": "Assembly is a transparently priced ($3/user/month) recognition platform with a documented G2 track record, named integrations like BambooHR, and an AI-powered Dora Hub for culture analytics, currently in the process of joining Quantum Workplace. Kudos is a Canadian recognition platform with named enterprise clients like DHL and Vanderbilt University, but no public pricing or documented integrations.",
  "bestForToolA": "Teams wanting predictable per-user pricing, a documented G2 track record (4.9/5, 3,000+ reviews), and named integrations with Slack, Microsoft Teams, and BambooHR, plus AI-driven culture insights via Dora Hub.",
  "bestForToolB": "Organizations already evaluating vendors by client list (DHL, ENGIE, Vanderbilt University) who are comfortable requesting a custom quote and want structured Awards & Nominations management alongside recognition.",
  "whoNeedsBoth": "There's no realistic complementary scenario - both are direct competitors covering the same peer recognition and rewards use case, so a company would evaluate and select one rather than run both simultaneously.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Assembly publishes its Empower plan at $3/user/month billed yearly, with a custom Enterprise tier.",
      "toolB": "Kudos has no public pricing at all and requires a demo request for a quote.",
      "whyItMatters": "Published pricing lets smaller teams evaluate cost without a sales cycle.",
      "benefitsWho": "Budget-conscious teams wanting to compare cost upfront."
    },
    {
      "title": "Named Integrations",
      "toolA": "Assembly explicitly documents integrations with Slack, Microsoft Teams, and BambooHR.",
      "toolB": "Kudos does not detail specific integrations on its public website.",
      "whyItMatters": "Named integrations confirm compatibility with existing HR and communication tools before a sales call.",
      "benefitsWho": "IT and HR teams needing confirmed compatibility with tools like BambooHR."
    },
    {
      "title": "AI Culture Analytics",
      "toolA": "Assembly's Dora Hub provides AI-powered culture insights, nudges, and trend data, alongside AI-suggested prompts for managers.",
      "toolB": "Kudos offers an AI Recognition Assistant focused on automating recognition suggestions.",
      "whyItMatters": "Dora Hub's trend analytics go beyond suggesting recognition to surfacing broader culture patterns.",
      "benefitsWho": "People analytics teams wanting culture trend data, not just recognition prompts."
    },
    {
      "title": "Reviews and Social Proof",
      "toolA": "Assembly reports a 4.9/5 rating from 3,000+ G2 reviews, ranked #1 for Employee Recognition & Rewards Platform.",
      "toolB": "Kudos does not publicize a G2 rating.",
      "whyItMatters": "Third-party review volume and category ranking help validate vendor claims during procurement.",
      "benefitsWho": "Buyers relying on independent review platforms during vendor selection."
    },
    {
      "title": "Company Transparency",
      "toolA": "Assembly discloses an Omaha, Nebraska headquarters and states it is in the process of joining Quantum Workplace.",
      "toolB": "Kudos describes itself only as \"Proudly Canadian\" without a specific city.",
      "whyItMatters": "Disclosed HQ and ownership status matter for vendor due diligence and roadmap continuity risk.",
      "benefitsWho": "Procurement teams assessing vendor stability before signing a multi-year contract."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer-to-peer recognition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Points-based rewards (gift cards/charity)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Milestone/anniversary celebrations",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom awards & challenges",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Nomination management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kudos: Awards & Nominations"
        }
      ]
    },
    {
      "group": "AI & Analytics",
      "rows": [
        {
          "feature": "AI culture insights/trend data",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Assembly: Dora Hub"
        },
        {
          "feature": "AI recognition suggestions",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time dashboards/reporting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Manager enablement/AI prompts",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing, Integrations & Trust",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Assembly: $3/user/month"
        },
        {
          "feature": "Named HR/communication integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Assembly: Slack, MS Teams, BambooHR"
        },
        {
          "feature": "G2 rating disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Assembly: 4.9/5, 3,000+ reviews"
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "limited",
          "note": "Assembly: Omaha, NE; Kudos: country-level only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does Assembly cost compared to Kudos?",
      "answer": "Assembly publishes its Empower plan at $3/user/month billed yearly with a custom Enterprise tier. Kudos does not publish any pricing and requires a demo request."
    },
    {
      "question": "Which platform has published customer ratings?",
      "answer": "Assembly reports a 4.9/5 G2 rating from over 3,000 reviews, ranked #1 for Employee Recognition & Rewards Platform. Kudos does not publicize a G2 score."
    },
    {
      "question": "Does Assembly integrate with BambooHR?",
      "answer": "Yes, Assembly documents integrations with Slack, Microsoft Teams, and BambooHR. Kudos's specific integrations aren't detailed publicly."
    },
    {
      "question": "What AI features does each offer?",
      "answer": "Assembly has Dora Hub for AI-powered culture insights, nudges, and trend data, plus AI-suggested prompts for managers. Kudos has an AI Recognition Assistant that helps automate recognition suggestions."
    },
    {
      "question": "Is Assembly being acquired?",
      "answer": "Assembly's website states it is in the process of joining Quantum Workplace, which could affect its product roadmap. No such disclosure exists for Kudos."
    },
    {
      "question": "Where is each company headquartered?",
      "answer": "Assembly lists an Omaha, Nebraska address. Kudos describes itself only as \"Proudly Canadian\" without a specific city."
    }
  ]
};

export default assemblyEmployeeRecognitionVsKudosContent;
