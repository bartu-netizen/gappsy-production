import type { ToolComparisonContent } from './types';

const luckyOrangeVsQuantumMetricContent: ToolComparisonContent = {
  "verdict": "Lucky Orange is a self-serve digital experience analytics tool combining heatmaps, session recordings, funnels, surveys, and live chat with published, session-volume-based pricing starting at $32/month. Quantum Metric is an enterprise-grade digital analytics platform built around Felix Agentic AI, autocapture of 300+ metrics, and integrations with Adobe Experience Platform and Salesforce, sold exclusively through custom enterprise quotes. Smaller businesses and self-serve buyers gravitate toward Lucky Orange's transparent pricing, while large enterprises needing autonomous AI-driven insight at massive scale look to Quantum Metric, which reports processing 8 billion sessions monthly.",
  "bestForToolA": "Lucky Orange fits small-to-midsize businesses wanting an affordable, self-serve tool with heatmaps, session recordings, funnels, surveys, and live chat bundled into every plan starting at $32/month for 3,500 sessions.",
  "bestForToolB": "Quantum Metric fits large enterprises needing autonomous, continuous AI-driven customer journey analysis via Felix Agentic AI at massive scale, with native integrations into Adobe Experience Platform and Salesforce Lightning Analytics.",
  "whoNeedsBoth": "There's no clear scenario for running both simultaneously since they overlap directly on session recording, heatmaps, and behavioral analytics — a company would size up from Lucky Orange to Quantum Metric as its traffic and enterprise integration needs grow, rather than run both at once.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Lucky Orange publishes tiered pricing based on monthly tracked sessions, from $32/month (3,500 sessions, Build) to $839/month (300,000+ sessions, Scale), with Enterprise custom quotes above 700,000 sessions.",
      "toolB": "Quantum Metric does not publish pricing; all plans are custom quotes based on digital properties, session volume, and support tier.",
      "whyItMatters": "Transparent, self-serve pricing lets smaller teams budget without a sales process.",
      "benefitsWho": "Small businesses and self-serve buyers benefit from Lucky Orange's published pricing."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Lucky Orange's Discovery AI analyzes live visitor behavior and answers specific questions with a direct link to supporting evidence, though it's referenced as an add-on.",
      "toolB": "Quantum Metric's Felix Agentic AI runs continuously in the background, autonomously surfacing customer experience insights with what the vendor describes as transparent reasoning.",
      "whyItMatters": "The AI's role differs: one answers on-demand questions, the other continuously investigates and surfaces findings without being asked.",
      "benefitsWho": "Teams wanting always-on autonomous insight generation benefit from Quantum Metric's Felix; teams wanting an on-demand Q&A tool benefit from Lucky Orange's Discovery AI."
    },
    {
      "title": "Scale & Enterprise Integration",
      "toolA": "Lucky Orange reports being used by over 500,000 websites, with additional sites costing $5 each.",
      "toolB": "Quantum Metric reports processing 8 billion sessions monthly, reaching roughly half of worldwide internet users, and integrates with Adobe Experience Platform and Salesforce Lightning Analytics.",
      "whyItMatters": "Enterprises with existing Adobe or Salesforce stacks need native integration that a self-serve tool may not offer.",
      "benefitsWho": "Large enterprises with existing Adobe or Salesforce Lightning Analytics deployments benefit from Quantum Metric's native integrations."
    },
    {
      "title": "Feature Gating by Plan",
      "toolA": "All Lucky Orange plans include the full feature set (heatmaps, recordings, funnels, surveys, live chat) rather than gating by tier; plans differ only by session volume.",
      "toolB": "Quantum Metric's plan structure and feature gating are not publicly documented since pricing is entirely custom.",
      "whyItMatters": "Knowing whether features are gated by tier affects which plan a buyer actually needs.",
      "benefitsWho": "Budget-conscious buyers benefit from Lucky Orange's non-gated full feature access on every paid tier."
    },
    {
      "title": "Free Trial Access",
      "toolA": "Lucky Orange offers a 7-day free trial with full feature access and no credit card required.",
      "toolB": "Quantum Metric does not mention a free trial or free plan.",
      "whyItMatters": "A no-commitment trial lowers the barrier to evaluating the product hands-on.",
      "benefitsWho": "Self-serve evaluators and smaller teams benefit from Lucky Orange's no-credit-card trial."
    }
  ],
  "featureMatrix": [
    {
      "group": "Behavioral Analytics",
      "rows": [
        {
          "feature": "Session recordings",
          "toolA": "available",
          "toolB": "available",
          "note": "Quantum Metric: Session Replay"
        },
        {
          "feature": "Heatmaps",
          "toolA": "available",
          "toolB": "available",
          "note": "Lucky Orange: Dynamic Heatmaps; Quantum Metric: Interaction Heatmaps"
        },
        {
          "feature": "Conversion funnels",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Autocapture of events/metrics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "300+ metrics, no manual tagging"
        }
      ]
    },
    {
      "group": "AI & Insights",
      "rows": [
        {
          "feature": "On-demand AI Q&A",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Discovery AI"
        },
        {
          "feature": "Continuous autonomous AI agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Felix Agentic AI"
        },
        {
          "feature": "Voice of customer / feedback tools",
          "toolA": "available",
          "toolB": "available",
          "note": "Lucky Orange: Surveys & Live Chat; Quantum Metric: Voice of Customer"
        }
      ]
    },
    {
      "group": "Enterprise & Integration",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Native Adobe/Salesforce integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile app analytics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lucky Orange: 7-day, no credit card"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is Lucky Orange priced?",
      "answer": "Plans are tiered by monthly tracked sessions, starting at $32/month for 3,500 sessions (Build) up to $839/month for 300,000+ sessions (Scale), billed annually."
    },
    {
      "question": "Is Quantum Metric pricing public?",
      "answer": "No, all plans are enterprise custom quotes based on usage and support needs."
    },
    {
      "question": "What is Felix Agentic AI?",
      "answer": "Quantum Metric's autonomous AI agent that continuously investigates customer journeys and surfaces insights without manual queries."
    },
    {
      "question": "What is Discovery AI?",
      "answer": "An AI feature in Lucky Orange that analyzes live visitor behavior and gives direct answers about site performance with links to the supporting evidence."
    },
    {
      "question": "Does Lucky Orange offer a free trial?",
      "answer": "Yes, a 7-day free trial with full feature access is offered, and no credit card is required to start."
    },
    {
      "question": "What integrations does Quantum Metric offer?",
      "answer": "It integrates with Adobe Experience Platform, Salesforce Lightning Analytics, and data warehouses via streaming."
    }
  ]
};

export default luckyOrangeVsQuantumMetricContent;
