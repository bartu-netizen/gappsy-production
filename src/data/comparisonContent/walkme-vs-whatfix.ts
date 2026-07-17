import type { ToolComparisonContent } from './types';

const walkmeVsWhatfixContent: ToolComparisonContent = {
  "verdict": "WalkMe and Whatfix are both quote-only enterprise digital adoption platforms with no published pricing, and they overlap heavily on in-app guidance and usage analytics. The documented differences are specific: WalkMe names deep out-of-the-box support for systems like Salesforce, Workday, and SAP, plus DeepUI's on-screen context understanding, while Whatfix offers Mirror, an application-cloning feature for training simulations and AI roleplay that WalkMe does not document. Choosing between them depends on whether the priority is contextual guidance across named enterprise systems or a training-and-simulation layer on top of guidance.",
  "bestForToolA": "Large enterprises standardized on named systems like Salesforce, Workday, SAP, Microsoft Dynamics 365, ServiceNow, or SuccessFactors that want DeepUI's on-screen context understanding and an Analytics Suite that includes license optimization.",
  "bestForToolB": "Organizations that want a training and simulation layer — Whatfix's Mirror clones the application for training, AI roleplay scenarios, and adaptive assessments — combined with session-replay-based product analytics, particularly regulated industries like banking, healthcare, and financial services that Whatfix cites as customers.",
  "whoNeedsBoth": "Because both platforms are quote-only enterprise DAPs covering overlapping guidance and analytics ground, most organizations evaluate them side by side during procurement and select one rather than running both in production; very large multi-system enterprises weighing contextual AI assistance (WalkMe) against training simulation (Whatfix's Mirror) may pilot both before deciding.",
  "keyDifferences": [
    {
      "title": "Application training and simulation",
      "toolA": "No application-cloning or simulation feature is documented for WalkMe.",
      "toolB": "Mirror clones the application for training, AI roleplay scenarios, and guided simulations, with Adaptive Assessments delivered through it.",
      "whyItMatters": "Whatfix documents a distinct way to train users in a simulated copy of the app rather than live production, which WalkMe's facts don't describe.",
      "benefitsWho": "Training and enablement teams onboarding large numbers of new users without risking mistakes in production."
    },
    {
      "title": "Named out-of-the-box enterprise application support",
      "toolA": "WalkMe explicitly lists support for Salesforce, Workday, SAP, Microsoft Dynamics 365, ServiceNow, and SuccessFactors.",
      "toolB": "No specific named application integrations are documented.",
      "whyItMatters": "Enterprises running these specific named systems have a documented fit with WalkMe that isn't mirrored for Whatfix in these facts.",
      "benefitsWho": "IT and procurement teams standardized on major enterprise software suites."
    },
    {
      "title": "Analytics feature set",
      "toolA": "The Analytics Suite covers application usage, workflow, and form analytics plus license optimization.",
      "toolB": "Product Analytics includes AutoCapture event collection, session replay, and real-time cohorts.",
      "whyItMatters": "Whatfix documents session replay and real-time cohorts, which WalkMe's Analytics Suite does not mention; WalkMe documents license optimization, which Whatfix does not mention.",
      "benefitsWho": "Teams wanting to watch individual user sessions (Whatfix) vs. teams wanting to optimize software license spend (WalkMe)."
    },
    {
      "title": "Language support disclosure",
      "toolA": "WalkMe's site lists English, French, German, and Japanese.",
      "toolB": "No specific language list is documented.",
      "whyItMatters": "Buyers needing guidance in a specific language have a documented list to check against for WalkMe but not for Whatfix.",
      "benefitsWho": "Global enterprises deploying guidance across multiple regions."
    },
    {
      "title": "Future AI pricing changes",
      "toolA": "WalkMe states that starting January 2027, certain AI capabilities will require additional 'AI Units,' though pricing for these has not been disclosed.",
      "toolB": "No comparable future pricing change is documented.",
      "whyItMatters": "Buyers evaluating WalkMe should account for an upcoming, not-yet-priced AI billing change that isn't a factor for Whatfix per these facts.",
      "benefitsWho": "Finance and procurement teams planning multi-year budgets."
    }
  ],
  "featureMatrix": [
    {
      "group": "Guidance & Automation",
      "rows": [
        {
          "feature": "Contextual in-app guidance",
          "toolA": "available",
          "toolB": "available",
          "note": "WalkMe: DeepUI/WalkMe AI. Whatfix: Flows, Smart Tips, Pop-Ups, Task Lists."
        },
        {
          "feature": "Cross-application workflow automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Application training simulation/cloning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Whatfix's Mirror."
        },
        {
          "feature": "Content governance/lifecycle management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Analytics",
      "rows": [
        {
          "feature": "Usage/workflow analytics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "License usage optimization",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time cohorts",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Enterprise Fit",
      "rows": [
        {
          "feature": "Named out-of-box application support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "WalkMe: Salesforce, Workday, SAP, MS Dynamics 365, ServiceNow, SuccessFactors."
        },
        {
          "feature": "Omnichannel support (desktop/mobile/web)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented customer base / satisfaction scores",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Whatfix: 700+ customers, 99.5% CSAT, G2 4.6/545 reviews (vendor-claimed)."
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both are quote-only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does WalkMe publish its pricing?",
      "answer": "No, WalkMe uses quote-based pricing; the site directs visitors to 'Request a quote' rather than listing plan prices."
    },
    {
      "question": "What applications does WalkMe support out of the box?",
      "answer": "WalkMe lists support for Salesforce, Workday, SAP, Microsoft Dynamics 365, ServiceNow, and SuccessFactors."
    },
    {
      "question": "Will WalkMe's AI features change in pricing?",
      "answer": "WalkMe states that starting January 2027, certain AI capabilities will require 'AI Units,' though pricing for these has not been disclosed."
    },
    {
      "question": "What is Whatfix's Mirror?",
      "answer": "Mirror is Whatfix's application-cloning feature used for training simulations, AI roleplay scenarios, and adaptive assessments."
    },
    {
      "question": "Does Whatfix offer a free plan?",
      "answer": "A free 'Standard' Product Analytics plan exists, but only as an add-on bundled with a paid DAP Web & Desktop plan."
    },
    {
      "question": "What industries does Whatfix serve?",
      "answer": "Whatfix lists customers across banking, education, financial services, healthcare, insurance, pharma & life sciences, and the public sector."
    }
  ]
};

export default walkmeVsWhatfixContent;
