import type { ToolComparisonContent } from './types';

const glassboxVsQuantumMetricContent: ToolComparisonContent = {
  "verdict": "Glassbox and Quantum Metric are both enterprise-grade digital experience analytics platforms with session replay and AI-driven insight generation, but they emphasize different things: Glassbox leans into regulated-industry compliance and tagless capture, while Quantum Metric emphasizes autonomous, continuously running AI (Felix Agentic AI) and documents massive scale — 8 billion sessions processed monthly, reaching roughly half of worldwide internet users, per the company.",
  "bestForToolA": "Glassbox fits regulated enterprises (financial services, insurance, e-commerce) that need compliance-focused Digital Record Keeping, tagless data capture, and real-time Rapid Response to visitor struggles.",
  "bestForToolB": "Quantum Metric fits large-scale digital businesses that want an always-on autonomous AI agent (Felix) surfacing insights continuously, Autocapture of 300+ metrics without manual tagging, and native integrations with Adobe Experience Platform and Salesforce Lightning Analytics.",
  "whoNeedsBoth": "There's no realistic scenario for running both — they compete directly for the same enterprise digital experience analytics budget and overlap in session replay, journey/error analysis, and AI-driven insights, so organizations would evaluate and select one rather than deploying both.",
  "keyDifferences": [
    {
      "title": "AI Model: Assistant vs. Autonomous Agent",
      "toolA": "Glassbox's Insights Assistant delivers AI-driven insights extracted from session data.",
      "toolB": "Quantum Metric's Felix Agentic AI runs continuously in the background, autonomously analyzing customer journeys and surfacing insights automatically, with what the company describes as transparent reasoning rather than a black-box output.",
      "whyItMatters": "An always-on autonomous agent versus an assistant that surfaces insights on request represents different operating models for how a team consumes analytics.",
      "benefitsWho": "Teams wanting continuous, unprompted insight discovery benefit from Quantum Metric's Felix; teams wanting a more traditional assistant layered on session data benefit from Glassbox's approach."
    },
    {
      "title": "Data Capture Method",
      "toolA": "Glassbox uses tagless data capture, collecting behavioral data without manual tagging.",
      "toolB": "Quantum Metric's Autocapture automatically captures 300+ metrics without manual tagging.",
      "whyItMatters": "Both reduce instrumentation overhead, but Quantum Metric documents a specific metric count (300+) that gives a concrete sense of capture breadth.",
      "benefitsWho": "Engineering teams minimizing instrumentation work benefit from either, though teams wanting a documented metric count benefit from Quantum Metric's specificity."
    },
    {
      "title": "Reported Scale",
      "toolA": "Glassbox's documented scale evidence is industry recognition (G2 Summer 2025 Leader in e-commerce) rather than a specific session volume figure.",
      "toolB": "Quantum Metric reports processing 8 billion sessions monthly and reaching roughly half of worldwide internet users, per the company.",
      "whyItMatters": "Raw scale claims can be a proxy for platform maturity and infrastructure capacity, relevant to very large enterprises evaluating vendor reliability at their own scale.",
      "benefitsWho": "Very large digital businesses evaluating infrastructure scale benefit from Quantum Metric's documented volume figures."
    },
    {
      "title": "Third-Party Integrations",
      "toolA": "Glassbox's documented integration detail is limited; specific named platform integrations are not called out in the available feature list.",
      "toolB": "Quantum Metric documents native integrations with Adobe Experience Platform and Salesforce Lightning Analytics, plus Data Streaming & Activation to data warehouses.",
      "whyItMatters": "Teams already invested in Adobe or Salesforce ecosystems benefit from documented native connectivity rather than custom integration work.",
      "benefitsWho": "Enterprises standardized on Adobe Experience Platform or Salesforce benefit specifically from Quantum Metric's named integrations."
    },
    {
      "title": "Compliance Positioning",
      "toolA": "Glassbox is explicitly built with regulated industries in mind, including Digital Record Keeping to support compliance and fraud-prevention use cases.",
      "toolB": "Quantum Metric's documented feature set does not call out a dedicated compliance/record-keeping capability.",
      "whyItMatters": "Financial services and insurance buyers often require documented compliance tooling as a baseline evaluation criterion.",
      "benefitsWho": "Compliance and risk teams in regulated industries benefit specifically from Glassbox's Digital Record Keeping feature."
    }
  ],
  "featureMatrix": [
    {
      "group": "Analytics & Session Data",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Journey mapping",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Glassbox's Augmented Journey Map."
        },
        {
          "feature": "Interaction heatmaps",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Struggle/error analysis",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Performance monitoring with business-impact quantification",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Data Capture",
      "rows": [
        {
          "feature": "Autonomous/agentic AI insight generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Quantum Metric's Felix Agentic AI."
        },
        {
          "feature": "AI insights assistant",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Tagless/automatic data capture",
          "toolA": "available",
          "toolB": "available",
          "note": "Quantum Metric documents 300+ metrics captured automatically."
        },
        {
          "feature": "Segment builder",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Enterprise & Compliance",
      "rows": [
        {
          "feature": "Named third-party platform integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Adobe Experience Platform, Salesforce Lightning Analytics."
        },
        {
          "feature": "Data streaming to warehouses",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Compliance/fraud-prevention record keeping",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core AI difference between Glassbox and Quantum Metric?",
      "answer": "Glassbox's Insights Assistant delivers AI-driven insights from session data on request, while Quantum Metric's Felix Agentic AI runs continuously and autonomously, surfacing insights automatically with what the company describes as transparent reasoning."
    },
    {
      "question": "Which platform documents larger scale?",
      "answer": "Quantum Metric reports processing 8 billion sessions monthly and reaching roughly half of worldwide internet users, per the company. Glassbox does not publish an equivalent session-volume figure, instead citing G2 Summer 2025 Leader recognition in e-commerce."
    },
    {
      "question": "Is either platform's pricing public?",
      "answer": "No, both Glassbox and Quantum Metric use custom/enterprise pricing with no published rates; both require contacting sales for a quote, and neither offers a free trial or free plan."
    },
    {
      "question": "Which tool is better for regulated industries?",
      "answer": "Glassbox is explicitly positioned for regulated industries like financial services and insurance, with compliance-focused Digital Record Keeping. Quantum Metric's documented features don't call out an equivalent compliance capability."
    },
    {
      "question": "Does Quantum Metric integrate with Adobe or Salesforce?",
      "answer": "Yes, Quantum Metric documents native integrations with Adobe Experience Platform and Salesforce Lightning Analytics. Glassbox's available feature list does not name specific third-party platform integrations."
    },
    {
      "question": "How do the two capture behavioral data?",
      "answer": "Glassbox uses tagless data capture to collect behavioral data without manual tagging. Quantum Metric's Autocapture similarly captures data automatically, specifically documented at 300+ metrics without manual tagging."
    }
  ]
};

export default glassboxVsQuantumMetricContent;
