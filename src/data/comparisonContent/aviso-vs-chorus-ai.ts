import type { ToolComparisonContent } from './types';

const avisoVsChorusAiContent: ToolComparisonContent = {
  "verdict": "Aviso is a broader AI revenue platform combining forecasting, conversation intelligence, relationship intelligence, and a no-code Agent Studio for building custom AI agents, reporting use by 450+ revenue teams. Chorus.ai is a focused conversation intelligence tool backed by 14 technology patents, now sold only as part of ZoomInfo's platform (Chorus by ZoomInfo) rather than as a standalone product. The choice comes down to platform breadth versus focused, patent-backed conversation analysis tied into ZoomInfo's data.",
  "bestForToolA": "Revenue teams wanting an independent platform that combines forecasting, relationship intelligence, and a no-code Agent Studio for building custom AI agents.",
  "bestForToolB": "Teams already invested in ZoomInfo's data ecosystem who want conversation intelligence directly connected to ZoomInfo's B2B contact and company database.",
  "whoNeedsBoth": "The facts don't describe a scenario where both would be run together; they overlap directly on conversation intelligence, so a buyer would typically choose one rather than pay for both.",
  "keyDifferences": [
    {
      "title": "Standalone Product Availability",
      "toolA": "Aviso is offered as its own independent platform with no acquisition or bundling noted in the facts.",
      "toolB": "Chorus.ai is now sold only as part of ZoomInfo's platform (Chorus by ZoomInfo) rather than as a standalone product.",
      "whyItMatters": "Buying Chorus.ai today likely means buying into ZoomInfo's broader platform and contract structure.",
      "benefitsWho": "Buyers wanting a single-vendor conversation intelligence tool (Aviso) versus those already committed to ZoomInfo (Chorus)."
    },
    {
      "title": "Platform Breadth",
      "toolA": "Aviso combines conversation intelligence with forecasting, relationship intelligence, and a no-code Agent Studio for building custom AI agents.",
      "toolB": "Chorus.ai centers specifically on call transcription, deal intelligence, and win/loss analysis, without a documented agent-building or forecasting module of its own.",
      "whyItMatters": "A broader revenue platform reduces the number of point tools needed, while a focused tool can go deeper on its core use case.",
      "benefitsWho": "Buyers deciding between a broad revenue platform (Aviso) and a focused conversation-intelligence tool (Chorus.ai)."
    },
    {
      "title": "Patent-Backed Technology",
      "toolA": "Aviso's facts don't document a patent count for its underlying technology.",
      "toolB": "Chorus.ai cites being backed by 14 technology patents in machine-learning-based conversation analysis.",
      "whyItMatters": "A documented patent portfolio is a specific technical-depth signal for the core conversation-analysis capability.",
      "benefitsWho": "Buyers scrutinizing the underlying ML technology behind conversation intelligence claims."
    },
    {
      "title": "Data Enrichment Integration",
      "toolA": "Aviso's integrations aren't documented with a comparable named data-enrichment source.",
      "toolB": "Chorus.ai connects conversation data directly with ZoomInfo's B2B contact and company database.",
      "whyItMatters": "Direct enrichment from a large B2B contact database adds firmographic context to conversation insights out of the box.",
      "benefitsWho": "Teams that want conversation insights tied to firmographic and contact data without a separate integration."
    },
    {
      "title": "Recognized Award Categories",
      "toolA": "Aviso's validation centers on being used by 450+ revenue teams and offering 30+ pre-built GTM workflows.",
      "toolB": "Chorus.ai won G2 awards for 'Easiest Admin - SMB' and 'Best Results - MM,' signaling usability for smaller admin teams.",
      "whyItMatters": "SMB-focused usability awards versus workflow-breadth claims point to different buyer priorities.",
      "benefitsWho": "SMB buyers prioritizing ease of administration (Chorus.ai) versus teams wanting broader workflow content (Aviso)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Conversation Intelligence",
      "rows": [
        {
          "feature": "Call Transcription & Analysis",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Deal / Relationship Intelligence",
          "toolA": "available",
          "toolB": "available",
          "note": "Aviso: relationship intelligence; Chorus: deal intelligence"
        },
        {
          "feature": "Competitive Win/Loss Analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Coaching Insights from Calls",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform Breadth",
      "rows": [
        {
          "feature": "Revenue Forecasting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No-Code Agent Building",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aviso's Agent Studio"
        },
        {
          "feature": "Mobile App",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Data & Validation",
      "rows": [
        {
          "feature": "Third-Party Data Enrichment Integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ZoomInfo B2B database"
        },
        {
          "feature": "Standalone Product Availability",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Chorus sold only within ZoomInfo's platform"
        },
        {
          "feature": "Patent-Backed Technology",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14 ML patents"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Chorus.ai still a standalone product?",
      "answer": "No, Chorus.ai was acquired by ZoomInfo and is now sold only as 'Chorus by ZoomInfo,' integrated with ZoomInfo's broader platform. Aviso remains an independent platform."
    },
    {
      "question": "Which tool has a no-code AI agent builder?",
      "answer": "Aviso offers a no-code Agent Studio that lets teams build and deploy custom AI agents without engineering resources. This capability isn't documented for Chorus.ai."
    },
    {
      "question": "Does Chorus.ai integrate with ZoomInfo's data?",
      "answer": "Yes, Chorus connects conversation data directly with ZoomInfo's B2B contact and company database. This kind of named data-enrichment integration isn't documented for Aviso."
    },
    {
      "question": "How is Chorus.ai's technology validated?",
      "answer": "Chorus.ai cites being backed by 14 technology patents in machine-learning-based conversation analysis, plus G2 awards for 'Easiest Admin - SMB' and 'Best Results - MM.'"
    },
    {
      "question": "Does Aviso include forecasting like a revenue platform?",
      "answer": "Yes, Aviso includes advanced forecasting models for pipeline and revenue projections alongside conversation intelligence. Forecasting is not documented as a Chorus.ai feature."
    },
    {
      "question": "Which is a better fit for a company already using ZoomInfo?",
      "answer": "Chorus by ZoomInfo integrates directly with ZoomInfo's contact and company database and CRM/Zoom sync, which may appeal to teams already in the ZoomInfo ecosystem. Aviso is a separate, independent platform with its own Agent Studio and forecasting tools."
    }
  ]
};

export default avisoVsChorusAiContent;
