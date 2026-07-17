import type { ToolComparisonContent } from './types';

const aptyVsWhatfixContent: ToolComparisonContent = {
  "verdict": "Apty and Whatfix are both enterprise digital adoption platforms adding in-app guidance to complex business software, and both target large organizations rather than small teams. Apty at least publishes a starting price ($9,500/app/year) even though final cost depends on custom factors, while Whatfix publishes no pricing at all and requires a sales conversation for every plan; Whatfix's facts also show a broader scope that includes a separate Product Analytics offering and Mirror application-cloning for training simulations.",
  "bestForToolA": "Enterprises that want a documented starting price point to budget against ($9,500/app/year) and specifically need live workflow monitoring with early risk and compliance alerting.",
  "bestForToolB": "Enterprises that want Mirror's application-cloning for training, AI roleplay scenarios, and adaptive assessments, or that want combined in-app guidance and separate product analytics (AutoCapture, session replay, cohorts) under one vendor.",
  "whoNeedsBoth": "A large enterprise standardizing on multiple business systems (e.g., Salesforce plus a separate employee-facing app) might evaluate both for different systems, since Apty emphasizes breadth of enterprise app integrations while Whatfix emphasizes training simulation depth via Mirror.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Apty publishes a starting price of $9,500 per app annually, though final pricing depends on custom factors.",
      "toolB": "Whatfix publishes no pricing at all; every plan requires a demo or sales conversation.",
      "whyItMatters": "Having any published starting number, even if not final, lets buyers do rough budget planning before engaging sales.",
      "benefitsWho": "Procurement teams doing early-stage vendor shortlisting before formal sales engagement."
    },
    {
      "title": "Training simulation",
      "toolA": "Apty's facts don't document an application-cloning or simulation training feature.",
      "toolB": "Whatfix's Mirror clones the application for training, AI roleplay scenarios, and guided simulations, with Adaptive Assessments delivered through it.",
      "whyItMatters": "Simulated training environments let new users practice without risk in a live production system.",
      "benefitsWho": "Enterprises onboarding large numbers of new employees into complex systems like Salesforce or Workday who want a safe practice environment."
    },
    {
      "title": "Product analytics as a separate offering",
      "toolA": "Apty's Adoption Analytics is bundled into its core product for usage and process tracking.",
      "toolB": "Whatfix offers a distinct Product Analytics product with AutoCapture, session replay, and real-time cohorts, though its free Standard tier is only available bundled with a paid DAP plan.",
      "whyItMatters": "A dedicated analytics product with session replay and cohorts is a deeper analytics capability than usage/process tracking alone.",
      "benefitsWho": "Product teams wanting session-replay-level detail on how employees or customers use enterprise software."
    },
    {
      "title": "Live workflow risk monitoring",
      "toolA": "Apty includes Live Workflow Monitoring with real-time engagement tracking and early risk and compliance alerts.",
      "toolB": "Whatfix's facts don't document an equivalent real-time compliance-risk alerting feature.",
      "whyItMatters": "Early risk/compliance alerting can flag process breakdowns before they become bigger problems.",
      "benefitsWho": "Compliance and operations teams in regulated industries monitoring process adherence."
    },
    {
      "title": "Scale and reputation proof points",
      "toolA": "Apty cites support for 1,000+ applications with 100+ pre-built integrations.",
      "toolB": "Whatfix cites over 700 customers across 30+ countries, a claimed 99.5% CSAT, and a G2 rating of 4.6 stars across 545 reviews.",
      "whyItMatters": "These are different kinds of evidence — breadth of integration support (Apty) versus customer base size and satisfaction scores (Whatfix).",
      "benefitsWho": "Buyers weighing integration breadth against social proof/customer satisfaction data in vendor selection."
    }
  ],
  "featureMatrix": [
    {
      "group": "In-App Guidance",
      "rows": [
        {
          "feature": "No-code walkthroughs",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Tooltips/validations",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Role-based governance/versioning",
          "toolA": "available",
          "toolB": "available",
          "note": "Whatfix calls this Content Lifecycle Management."
        }
      ]
    },
    {
      "group": "Analytics & Monitoring",
      "rows": [
        {
          "feature": "Adoption/usage analytics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live risk/compliance alerting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dedicated product analytics with session replay",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Training & Simulation",
      "rows": [
        {
          "feature": "Application cloning for training/simulation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Whatfix's Mirror feature."
        },
        {
          "feature": "Adaptive skills assessments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI roleplay scenarios",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Delivered through Whatfix's Mirror."
        }
      ]
    },
    {
      "group": "Pricing & Integrations",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Apty starts at $9,500/app/year; Whatfix requires a demo for any pricing."
        },
        {
          "feature": "Enterprise app integrations (100+)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "White-label/on-premise add-ons",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Apty publish pricing?",
      "answer": "Apty publishes a starting price of $9,500 per app annually, though the final price depends on factors like employee count, implementation complexity, and compliance needs."
    },
    {
      "question": "Does Whatfix publish pricing?",
      "answer": "No, Whatfix's pricing combines a flat fee plus user license fees, but specific amounts require requesting a demo."
    },
    {
      "question": "What is Whatfix's Mirror feature?",
      "answer": "Mirror is Whatfix's application-cloning feature used for training simulations, AI roleplay scenarios, and adaptive assessments."
    },
    {
      "question": "Does Apty include compliance risk alerting?",
      "answer": "Yes, Apty's Live Workflow Monitoring includes real-time engagement tracking with early risk and compliance alerts."
    },
    {
      "question": "Which enterprise apps do these platforms integrate with?",
      "answer": "Apty integrates with 100+ enterprise applications including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor, and supports 1,000+ applications overall; Whatfix's facts don't list a specific integration count."
    },
    {
      "question": "Does Whatfix offer a free plan?",
      "answer": "A free 'Standard' Product Analytics plan exists, but only as an add-on bundled with a paid DAP Web & Desktop plan."
    }
  ]
};

export default aptyVsWhatfixContent;
