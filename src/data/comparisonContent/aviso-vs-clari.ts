import type { ToolComparisonContent } from './types';

const avisoVsClariContent: ToolComparisonContent = {
  "verdict": "Aviso combines forecasting and conversation intelligence with a no-code Agent Studio that lets non-technical teams build custom AI agents, reporting use by 450+ revenue teams. Clari is a broader, more established revenue orchestration platform used by 1,500+ customers reportedly managing $5 trillion in revenue, and carries stronger third-party validation with a 2025 G2 Best Sales Software Winner title and Gartner Magic Quadrant Leader placement. Both cover forecasting and conversation intelligence, but they differ in agent-building flexibility, scale of customer base, and depth of independent analyst recognition.",
  "bestForToolA": "Revenue teams that want to build and deploy custom AI agents without engineering resources, using Aviso's no-code Agent Studio and 30+ pre-built GTM workflows.",
  "bestForToolB": "Large, cross-functional revenue organizations that prioritize independently validated analyst recognition (Gartner Magic Quadrant Leader, 2025 G2 Best Sales Software Winner) alongside forecasting and pipeline inspection.",
  "whoNeedsBoth": "The facts don't support a clear dual-use case since both cover overlapping ground in forecasting and conversation intelligence; a revenue team would typically select one as its primary revenue intelligence platform rather than running both in parallel.",
  "keyDifferences": [
    {
      "title": "Custom AI Agent Building",
      "toolA": "Aviso offers a no-code Agent Studio letting teams build and deploy custom AI agents for revenue workflows without engineering help.",
      "toolB": "Clari's Revenue AI Agents are described as automated deal-monitoring and forecasting agents, but a customer-facing no-code agent-builder isn't documented.",
      "whyItMatters": "The ability to customize AI agents in-house versus relying on vendor-built agents affects flexibility for unique workflows.",
      "benefitsWho": "RevOps teams without dedicated engineering resources who want to build their own automated workflows."
    },
    {
      "title": "Customer Base Scale",
      "toolA": "Aviso reports being used by 450+ revenue teams.",
      "toolB": "Clari reports 1,500+ customers managing a reported $5 trillion in revenue.",
      "whyItMatters": "Customer count and reported revenue under management serve as proxies for platform maturity and market penetration.",
      "benefitsWho": "Buyers using adoption scale as a signal of platform stability and proven fit."
    },
    {
      "title": "Pre-Built Workflow Content",
      "toolA": "Aviso documents 30+ pre-built GTM workflows and 13-week cadences as ready-made starting points.",
      "toolB": "Clari's feature set (Forecast, Inspect, Copilot, Groove, RevDB) doesn't list a specific count of pre-built workflow templates.",
      "whyItMatters": "Ready-made templates can shorten time-to-value during implementation.",
      "benefitsWho": "Teams wanting faster time-to-value from pre-built workflow content rather than building from scratch."
    },
    {
      "title": "Analyst and Award Recognition",
      "toolA": "Aviso's validation in the facts is limited to its own reported customer count; its cons note that performance statistics like win-rate increases are self-reported case study figures, not independently verified.",
      "toolB": "Clari was named a 2025 G2 Best Sales Software Winner and a Leader in Gartner's Magic Quadrant for Revenue Action Orchestration.",
      "whyItMatters": "Independent analyst validation carries more weight in procurement than self-reported statistics.",
      "benefitsWho": "Buyers who weight third-party analyst validation heavily during vendor selection."
    },
    {
      "title": "Mobile Access",
      "toolA": "Aviso explicitly offers a mobile app giving reps and managers an AI-powered revenue view from a mobile device.",
      "toolB": "Clari's documented feature set doesn't call out a dedicated mobile app.",
      "whyItMatters": "Mobile access matters for field reps and managers who need revenue visibility away from a desktop.",
      "benefitsWho": "Field-based reps and managers who need to check pipeline and forecast data on the go."
    }
  ],
  "featureMatrix": [
    {
      "group": "Revenue Intelligence Core",
      "rows": [
        {
          "feature": "Forecasting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clari's dedicated Forecast module"
        },
        {
          "feature": "Pipeline Inspection",
          "toolA": "available",
          "toolB": "available",
          "note": "Clari's Inspect"
        },
        {
          "feature": "Conversation Intelligence",
          "toolA": "available",
          "toolB": "available",
          "note": "Clari's Copilot"
        },
        {
          "feature": "Relationship / Stakeholder Intelligence",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aviso tracks multi-threaded stakeholder relationships"
        }
      ]
    },
    {
      "group": "AI Agent Capability",
      "rows": [
        {
          "feature": "No-Code Agent Building",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aviso's Agent Studio"
        },
        {
          "feature": "Role-specific AI Avatars",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-built Workflow Templates",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "30+ GTM workflows, 13-week cadences"
        },
        {
          "feature": "Mobile App",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Buying Experience & Validation",
      "rows": [
        {
          "feature": "Published Pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Reported Customer Count",
          "toolA": "available",
          "toolB": "available",
          "note": "Aviso: 450+ teams; Clari: 1,500+ customers, $5T revenue"
        },
        {
          "feature": "Independent Analyst/Award Recognition",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "2025 G2 Best Sales Software Winner, Gartner MQ Leader"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I build custom AI agents in Aviso or Clari?",
      "answer": "Aviso offers a no-code Agent Studio that lets teams build and deploy custom AI agents for revenue workflows without engineering resources. Clari's Revenue AI Agents are described as automated monitoring and forecasting agents, but a customer-facing no-code agent builder isn't documented."
    },
    {
      "question": "How large is each platform's customer base?",
      "answer": "Clari reports 1,500+ customers managing a reported $5 trillion in revenue. Aviso reports being used by 450+ revenue teams."
    },
    {
      "question": "Which platform has stronger third-party validation?",
      "answer": "Clari was named a 2025 G2 Best Sales Software Winner and a Leader in Gartner's Magic Quadrant for Revenue Action Orchestration. Aviso's cons note that its reported performance statistics are self-reported case study figures, not independently verified."
    },
    {
      "question": "Does Aviso have pre-built workflow templates?",
      "answer": "Yes, Aviso documents 30+ pre-built GTM workflows and 13-week cadences. Clari's facts don't list a comparable count of pre-built workflow templates."
    },
    {
      "question": "Is there a mobile app?",
      "answer": "Aviso explicitly offers a mobile app for an AI-powered revenue view. A mobile app is not documented as a Clari feature in the available facts."
    },
    {
      "question": "Do either Aviso or Clari publish pricing?",
      "answer": "No, both require a custom quote or proposal. Neither publishes pricing on its website."
    }
  ]
};

export default avisoVsClariContent;
