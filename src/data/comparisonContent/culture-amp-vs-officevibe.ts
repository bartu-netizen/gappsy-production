import type { ToolComparisonContent } from './types';

const cultureAmpVsOfficevibeContent: ToolComparisonContent = {
  "verdict": "Culture Amp is a broad employee experience suite pairing engagement surveys with formal performance management - reviews, goals, and 360-degree feedback - plus documented compliance certifications for larger enterprises. Officevibe (a Workleap product) is more tightly focused on pulse surveys, anonymous feedback, and AI-assisted peer recognition and 1-on-1 conversations, without a documented formal review cycle.",
  "bestForToolA": "Organizations needing combined engagement surveys and structured performance reviews, goals, and 360 feedback with documented SOC II/ISO/GDPR compliance, at the scale of Culture Amp's Canva- and Etsy-sized customers.",
  "bestForToolB": "Managers wanting anonymous pulse feedback plus AI-drafted reply suggestions and built-in peer recognition cards, especially where English/French language coverage is sufficient.",
  "whoNeedsBoth": "There's no clear complementary use case here - both platforms compete directly on engagement surveys and feedback, so a company would typically choose one rather than run overlapping survey tools.",
  "keyDifferences": [
    {
      "title": "Formal Performance Management",
      "toolA": "Culture Amp's Perform product includes continuous feedback, performance reviews, 1-on-1 tools, goal management, and 360-degree feedback.",
      "toolB": "Officevibe's public feature list centers on pulse surveys, anonymous feedback, recognition, and 1-on-1 tools, without a documented formal review or goals module.",
      "whyItMatters": "Companies that need structured annual or cyclical review processes need more than pulse feedback alone.",
      "benefitsWho": "HR teams running formal performance review cycles alongside engagement tracking."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Culture Amp offers AI Coach for performance insights and AI-generated comment summaries within its Engage surveys.",
      "toolB": "Officevibe offers AI-Powered Highlights, AI-Generated Recommended Actions, and Feedback Reply Assistance that helps managers draft replies to employee feedback.",
      "whyItMatters": "Officevibe's AI is built specifically to help managers respond to feedback, while Culture Amp's AI focuses on summarizing data and coaching.",
      "benefitsWho": "Managers who want AI help drafting responses to employee comments (Officevibe) versus faster survey-data digestion (Culture Amp)."
    },
    {
      "title": "Peer Recognition",
      "toolA": "Culture Amp's feature list does not document peer recognition cards.",
      "toolB": "Officevibe includes Good Vibes Recognition Cards, letting employees celebrate wins and each other directly in the platform.",
      "whyItMatters": "Built-in recognition can reinforce engagement survey findings in the same tool employees already use.",
      "benefitsWho": "Teams wanting lightweight peer recognition alongside their pulse survey tool."
    },
    {
      "title": "DEI and Benchmarking",
      "toolA": "Culture Amp's Engage product explicitly includes DEI assessments and benchmarking against other companies.",
      "toolB": "Officevibe's feature list does not document DEI assessments or cross-company benchmarking.",
      "whyItMatters": "Benchmarking gives engagement scores external context that internal-only survey data can't provide.",
      "benefitsWho": "People teams tracking DEI metrics and comparing scores against industry peers."
    },
    {
      "title": "Language Support",
      "toolA": "Culture Amp does not publicly list its specific supported languages.",
      "toolB": "Officevibe confirms support limited to English and French via its language selector.",
      "whyItMatters": "Global organizations need to confirm language coverage matches their workforce before rolling out a survey tool.",
      "benefitsWho": "Companies operating primarily in English- or French-speaking regions (Officevibe) versus those needing broader, undocumented language support to verify directly (Culture Amp)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Surveys & Feedback",
      "rows": [
        {
          "feature": "Pulse/engagement surveys",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Anonymous feedback collection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "DEI assessments",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cross-company benchmarking",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Recognition & AI Assistance",
      "rows": [
        {
          "feature": "Peer-to-peer recognition cards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Officevibe: Good Vibes cards"
        },
        {
          "feature": "AI-generated recommended actions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-drafted feedback replies",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI coaching/performance insights",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Culture Amp: AI Coach"
        }
      ]
    },
    {
      "group": "Performance, Compliance & Scale",
      "rows": [
        {
          "feature": "Formal performance reviews / 360 feedback",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Goal management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Compliance certifications (SOC II/ISO/GDPR)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Slack/Microsoft Teams integration",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Officevibe include formal performance reviews?",
      "answer": "Not documented. Officevibe's public feature list centers on pulse surveys, anonymous feedback, recognition, and 1-on-1 tools rather than a formal review cycle, unlike Culture Amp's Perform module."
    },
    {
      "question": "Which has more AI features focused on drafting responses?",
      "answer": "Officevibe, with Feedback Reply Assistance that helps managers draft replies to employee feedback - a capability not documented for Culture Amp."
    },
    {
      "question": "What languages does each support?",
      "answer": "Officevibe confirms English and French only. Culture Amp does not publicly list its specific supported languages."
    },
    {
      "question": "Is pricing public for either tool?",
      "answer": "No. Both Culture Amp and Officevibe require a quote or demo request; neither publishes pricing."
    },
    {
      "question": "Which has documented compliance certifications?",
      "answer": "Culture Amp states it is SOC II, ISO, and GDPR compliant. Officevibe does not list specific certifications on its site."
    },
    {
      "question": "Is Officevibe part of a larger company?",
      "answer": "Yes, Officevibe is a product of Workleap Technologies Inc."
    }
  ]
};

export default cultureAmpVsOfficevibeContent;
