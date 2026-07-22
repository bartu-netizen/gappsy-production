import type { ToolComparisonContent } from './types';

const limesurveyVsQualtricsContent: ToolComparisonContent = {
  "verdict": "LimeSurvey and Qualtrics both offer freemium survey building, but at very different depths - LimeSurvey is an affordable, self-hostable survey tool starting at €29/month for its Expert cloud plan, while Qualtrics is an enterprise experience-management platform with a free account capped at 3 active surveys and 500 responses per user, and custom-quoted CX, EX, and Strategic Research suites featuring AI-assisted text analytics. LimeSurvey suits straightforward survey projects and budget-conscious teams; Qualtrics suits organizations running formal customer or employee experience programs.",
  "bestForToolA": "Teams needing an affordable or self-hosted survey tool with broad language support (80+ languages) and 800+ templates, including academic and nonprofit users eligible for 30-50% discounts on cloud plans.",
  "bestForToolB": "Enterprises running structured customer experience (CX) or employee experience (EX) programs that need AI-assisted text and sentiment analysis (Text iQ), advanced branching, quota, and randomization logic, and CRM/helpdesk integrations like Salesforce and Slack.",
  "whoNeedsBoth": "A company might run internal, low-stakes pulse surveys in LimeSurvey's self-hosted Community Edition for cost reasons, while contracting Qualtrics' CX suite for its formal, board-reported NPS and customer experience program that needs AI-assisted sentiment analysis and enterprise dashboards.",
  "keyDifferences": [
    {
      "title": "Free Tier Scope",
      "toolA": "The free, GPL-licensed self-hosted Community Edition carries no documented response caps.",
      "toolB": "The Free Account is capped at up to 3 active surveys and 500 responses per user, with unlimited inactive surveys and an optional 30-day paid trial upgrade.",
      "whyItMatters": "LimeSurvey's free self-hosted tier has no volume ceiling if you manage your own server, while Qualtrics' free tier is explicitly capped.",
      "benefitsWho": "Benefits high-volume survey users who can self-host LimeSurvey versus casual or trial users testing Qualtrics."
    },
    {
      "title": "AI-Assisted Analysis",
      "toolA": "Includes an AI-assisted translation feature that is explicitly labeled beta.",
      "toolB": "Includes Text iQ, AI-assisted text and sentiment analysis that automatically categorizes open-text feedback and surfaces themes.",
      "whyItMatters": "Teams processing large volumes of open-text responses benefit from automated theme and sentiment extraction rather than manual coding.",
      "benefitsWho": "Benefits CX/EX teams and researchers handling high volumes of qualitative feedback."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes tiered pricing - Expert at €29/month and Business at €75/month - with a Corporate tier requiring a custom quote.",
      "toolB": "Only the Free Account and self-service 'Strategic Research' plan have visible entry points; full CX, EX, and CoreXM Enterprise suites are custom-quoted.",
      "whyItMatters": "Buyers wanting to budget without a sales call have more transparent options with LimeSurvey.",
      "benefitsWho": "Benefits small teams and self-serve buyers avoiding enterprise procurement cycles."
    },
    {
      "title": "Offline & Field Research Support",
      "toolA": "Not documented as offering an offline mobile app.",
      "toolB": "Includes a mobile app supporting offline data collection for field research and in-person surveys.",
      "whyItMatters": "Field researchers collecting data without reliable internet need offline capture built in.",
      "benefitsWho": "Benefits market researchers and field teams conducting in-person or remote-location surveys."
    },
    {
      "title": "Enterprise Integration Ecosystem",
      "toolA": "Not documented as offering prebuilt CRM or helpdesk integrations.",
      "toolB": "Includes prebuilt connections to CRM, helpdesk, and collaboration tools such as Salesforce and Slack.",
      "whyItMatters": "Enterprises embedding survey data into existing sales or support workflows need native integrations rather than manual exports.",
      "benefitsWho": "Benefits large organizations with established CRM/helpdesk stacks wanting survey data flowing directly into them."
    }
  ],
  "featureMatrix": [
    {
      "group": "Survey Creation",
      "rows": [
        {
          "feature": "Question type variety",
          "toolA": "available",
          "toolB": "available",
          "note": "LimeSurvey: 30+ types; Qualtrics: many types with quotas/randomization"
        },
        {
          "feature": "Template library",
          "toolA": "available",
          "toolB": "available",
          "note": "LimeSurvey: 800+ templates; Qualtrics count not documented"
        },
        {
          "feature": "Multi-language delivery",
          "toolA": "available",
          "toolB": "available",
          "note": "LimeSurvey: 80+ languages"
        },
        {
          "feature": "Advanced branching, quotas, and randomization",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Analytics & AI",
      "rows": [
        {
          "feature": "Built-in response dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics: NPS/eNPS role-based dashboards"
        },
        {
          "feature": "AI-assisted text/sentiment analysis",
          "toolA": "limited",
          "toolB": "available",
          "note": "LimeSurvey: beta translation only; Qualtrics: Text iQ"
        },
        {
          "feature": "CX/EX program modules",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free cloud/account tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics caps at 3 active surveys / 500 responses per user"
        },
        {
          "feature": "Published starting cloud price",
          "toolA": "available",
          "toolB": "limited",
          "note": "LimeSurvey: €29/month; Qualtrics: self-service plan exists but priced custom"
        },
        {
          "feature": "CRM/helpdesk integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Salesforce, Slack"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Qualtrics have a free plan like LimeSurvey?",
      "answer": "Both offer free tiers - LimeSurvey has a free, GPL open-source Community Edition plus a free cloud tier, while Qualtrics' Free Account caps active surveys at 3 and responses at 500 per user."
    },
    {
      "question": "Which tool has AI-assisted analysis?",
      "answer": "Qualtrics includes Text iQ for AI-assisted sentiment and theme analysis of open-text responses; LimeSurvey's only AI feature documented is a beta AI-assisted translation tool."
    },
    {
      "question": "Is LimeSurvey cheaper than Qualtrics?",
      "answer": "LimeSurvey publishes transparent pricing starting at €29/month for its Expert cloud plan, while most Qualtrics enterprise suites (CX, EX, Strategic Research) are custom-quoted and require a sales conversation."
    },
    {
      "question": "Can either tool be self-hosted?",
      "answer": "LimeSurvey's Community Edition can be self-hosted under a GPL license; Qualtrics has no self-hosting option documented."
    },
    {
      "question": "Which tool is better suited to a formal customer experience program?",
      "answer": "Qualtrics, with purpose-built CX Solutions for journey mapping, case management, and frontline CX, plus CRM integrations like Salesforce - features LimeSurvey does not offer."
    },
    {
      "question": "Does either tool support offline data collection?",
      "answer": "Qualtrics includes a mobile app with offline data collection for field research; LimeSurvey does not document an offline collection app."
    }
  ]
};

export default limesurveyVsQualtricsContent;
