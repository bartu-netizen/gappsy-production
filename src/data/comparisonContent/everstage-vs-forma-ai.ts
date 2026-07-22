import type { ToolComparisonContent } from './types';

const everstageVsFormaAiContent: ToolComparisonContent = {
  "verdict": "Everstage and Forma.ai both automate sales compensation, but they emphasize different strengths. Everstage leans on self-serve usability (a drag-and-drop plan builder), live pipeline-based forecasting (Crystal Commissions), and strong review scores (4.8/5 G2, Gartner Challenger 2026). Forma.ai leans on breadth of integration (600+ pre-built connectors) and unifying incentive compensation with territory planning, quota setting, and ML-backed sales planning advisory (Forma Prophet), and is used by enterprises managing billions in commission spend.",
  "bestForToolA": "Everstage fits sales and RevOps teams wanting a self-serve, drag-and-drop plan builder that reduces dependency on technical staff, plus live commission forecasting for reps, and that value disclosed third-party ratings (4.8/5 G2, 4.7/5 Gartner).",
  "bestForToolB": "Forma.ai fits larger enterprises managing billions in commission spend that need territory and quota planning unified with incentive compensation, backed by 600+ pre-built integrations for syncing CRM/ERP data and machine-learning-driven planning advisory.",
  "whoNeedsBoth": "There is no realistic scenario for running both simultaneously — they compete directly on incentive compensation management, so a company would evaluate them head-to-head and select one system of record for commissions rather than run both.",
  "keyDifferences": [
    {
      "title": "Integration Breadth",
      "toolA": "Everstage's facts don't state a specific number of pre-built integrations.",
      "toolB": "Forma.ai offers more than 600 pre-built integrations to sync data across CRM, ERP, and other source systems.",
      "whyItMatters": "Broad, pre-built integration coverage reduces custom engineering work to connect compensation data across a company's tech stack.",
      "benefitsWho": "Large enterprises with many source systems benefit from Forma.ai's 600+ pre-built integrations."
    },
    {
      "title": "Machine-Learning Sales Advisory",
      "toolA": "Everstage's facts don't mention a machine-learning-driven planning advisory feature.",
      "toolB": "Forma.ai's Forma Prophet provides sales planning advisory backed by machine learning analytics, alongside a real-time modeling engine for financial projections.",
      "whyItMatters": "ML-backed planning advisory can surface compensation and territory optimization insights that manual analysis might miss.",
      "benefitsWho": "Enterprise sales planning teams wanting data-driven advisory benefit from Forma.ai's Forma Prophet."
    },
    {
      "title": "Self-Serve Usability",
      "toolA": "Everstage offers a self-serve, drag-and-drop plan builder that lets non-technical staff build and manage commission plans directly.",
      "toolB": "Forma.ai offers AI-enabled plan configuration with guided templates and natural-language input, a different approach to easing plan setup.",
      "whyItMatters": "The method of simplifying plan configuration (drag-and-drop vs. natural-language/templates) affects how quickly non-technical staff can operate the tool independently.",
      "benefitsWho": "Non-technical RevOps staff wanting a visual, drag-and-drop interface benefit from Everstage; teams preferring natural-language plan setup may prefer Forma.ai's guided templates."
    },
    {
      "title": "Third-Party Recognition",
      "toolA": "Everstage cites a 4.8/5 rating on G2 and 4.7/5 on Gartner from 2,500+ reviews, and is named a Challenger in the 2026 Gartner Magic Quadrant.",
      "toolB": "Forma.ai is featured positively in the Forrester Wave Report Q1 2025, per its facts.",
      "whyItMatters": "Different analyst firms (Gartner vs. Forrester) and review platforms (G2) carry weight with different buyer types during vendor evaluation.",
      "benefitsWho": "Buyers who weight Gartner Magic Quadrant and G2 user reviews heavily may favor Everstage's disclosed credentials; buyers who weight Forrester Wave placement may favor Forma.ai's."
    },
    {
      "title": "Company Scale & Customer Base",
      "toolA": "Everstage's facts don't disclose specific customer names or the scale of commission spend it manages.",
      "toolB": "Forma.ai is used by enterprises managing billions in commission spend, and is headquartered in Toronto, Canada.",
      "whyItMatters": "Evidence of managing very large commission volumes signals a platform's readiness for the most complex enterprise deployments.",
      "benefitsWho": "Very large enterprises with billions in commission spend can point to Forma.ai's stated experience at that scale."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compensation Management",
      "rows": [
        {
          "feature": "Incentive compensation automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Forma.ai: Forma Operator (ICM)"
        },
        {
          "feature": "Live pipeline-based commission forecasting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Everstage: Crystal Commissions"
        },
        {
          "feature": "Plan simulation before deploying",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-serve drag-and-drop plan builder",
          "toolA": "available",
          "toolB": "limited",
          "note": "Forma.ai: AI-enabled templates/natural-language input"
        }
      ]
    },
    {
      "group": "Territory, Quota & Planning",
      "rows": [
        {
          "feature": "Territory and quota planning",
          "toolA": "available",
          "toolB": "available",
          "note": "Forma.ai: Forma Architect"
        },
        {
          "feature": "ML-backed sales planning advisory",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Forma.ai: Forma Prophet"
        },
        {
          "feature": "Real-time financial modeling engine",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CPQ",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations, Pricing & Recognition",
      "rows": [
        {
          "feature": "Pre-built integration count disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Forma.ai: 600+"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Analyst recognition disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Everstage: Gartner MQ Challenger 2026; Forma.ai: Forrester Wave Q1 2025"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How many integrations does Forma.ai offer compared to Everstage?",
      "answer": "Forma.ai states it offers more than 600 pre-built integrations for syncing CRM, ERP, and other source systems. Everstage's facts don't disclose a specific integration count."
    },
    {
      "question": "Does Everstage or Forma.ai use machine learning for planning?",
      "answer": "Forma.ai's Forma Prophet provides sales planning advisory backed by machine learning analytics. Everstage's facts don't mention an equivalent ML-driven planning advisory feature."
    },
    {
      "question": "Which tool is better for non-technical staff building commission plans?",
      "answer": "Everstage offers a self-serve, drag-and-drop plan builder specifically designed to reduce dependency on technical teams. Forma.ai instead uses AI-enabled plan configuration with guided templates and natural-language input."
    },
    {
      "question": "Is either tool's pricing public?",
      "answer": "No, neither Everstage nor Forma.ai publishes pricing. Both require contacting sales for a custom quote."
    },
    {
      "question": "What third-party recognition does each tool have?",
      "answer": "Everstage cites a 4.8/5 G2 rating, 4.7/5 Gartner rating from 2,500+ reviews, and Challenger status in the 2026 Gartner Magic Quadrant. Forma.ai is featured positively in the Forrester Wave Report Q1 2025."
    },
    {
      "question": "Where is Forma.ai headquartered?",
      "answer": "Forma.ai is headquartered in Toronto, Canada. Everstage's headquarters is not disclosed in its facts."
    }
  ]
};

export default everstageVsFormaAiContent;
