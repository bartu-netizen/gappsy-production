import type { GroupComparisonContent } from './types';

const anywordVsFraseVsWriterContent: GroupComparisonContent = {
  "verdict": "Anyword, Frase, and Writer are all AI content-generation platforms for marketing and content teams, but they optimize for different jobs. Anyword leans hardest into data-driven performance scoring for short-form marketing copy, Frase builds its workflow around SERP-grounded content briefs and now AI-answer-engine visibility, and Writer is a full-stack enterprise generative AI platform built on its own Palmyra models and a company-data-grounded Knowledge Graph. The right pick depends on whether you need conversion-optimized ad copy, an SEO content operations workflow, or an enterprise-wide, governed AI platform.",
  "bestFor": {
    "anyword": "Performance and growth marketers producing high volumes of ads, email, and web copy who want data-backed scoring on which variations are likely to convert best.",
    "frase": "SEO specialists, content marketers, and agencies who need keyword and SERP research, content briefs, technical audits, and generative-engine (GEO) visibility tracking in a single subscription.",
    "writer": "Large enterprises, especially in regulated industries like financial services, healthcare, or insurance, that need a governed generative AI platform grounded in their own company data and proprietary models rather than a standalone copywriting tool."
  },
  "highlights": [
    {
      "title": "Three different grounding strategies",
      "description": "Anyword grounds output in performance-prediction scoring trained on historical ad data, Frase grounds briefs in live SERP research, and Writer grounds generation in an enterprise Knowledge Graph built from a company's own documents and systems.",
      "toolSlugs": [
        "anyword",
        "frase",
        "writer"
      ]
    },
    {
      "title": "Frase uniquely tracks AI-answer-engine visibility",
      "description": "Frase's GEO tracking monitors whether and how a brand's content is cited in AI chatbot answers from tools like ChatGPT and Google's AI Overviews, a capability not documented for Anyword or Writer.",
      "toolSlugs": [
        "frase"
      ]
    },
    {
      "title": "Writer owns its models instead of wrapping third-party AI",
      "description": "Writer builds its own Palmyra large language model family rather than relying solely on third-party models, which the company positions as an advantage for accuracy and auditability in regulated industries.",
      "toolSlugs": [
        "writer"
      ]
    },
    {
      "title": "No permanent free plan on any of the three",
      "description": "Anyword and Frase both start around $39/month with short free trials (7 days each), while Writer's Team plan runs roughly $18 to $29 per user per month with Enterprise pricing handled through custom sales contracts.",
      "toolSlugs": [
        "anyword",
        "frase",
        "writer"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Generation Approach",
      "rows": [
        {
          "feature": "Data-driven performance scoring for content variations",
          "statuses": {
            "anyword": "available",
            "frase": "unavailable",
            "writer": "not-documented"
          }
        },
        {
          "feature": "SERP-grounded content briefs",
          "statuses": {
            "anyword": "unavailable",
            "frase": "available",
            "writer": "not-documented"
          }
        },
        {
          "feature": "Enterprise knowledge-base grounding (company data)",
          "statuses": {
            "anyword": "unavailable",
            "frase": "unavailable",
            "writer": "available"
          }
        }
      ]
    },
    {
      "group": "SEO and Content Operations",
      "rows": [
        {
          "feature": "AI answer-engine (GEO) visibility tracking",
          "statuses": {
            "anyword": "unavailable",
            "frase": "available",
            "writer": "not-documented"
          }
        },
        {
          "feature": "Published-content monitoring and refresh alerts",
          "statuses": {
            "anyword": "unavailable",
            "frase": "available",
            "writer": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Team and Governance",
      "rows": [
        {
          "feature": "Brand voice / style guide controls",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "writer": "available"
          }
        },
        {
          "feature": "SSO / enterprise security controls",
          "statuses": {
            "anyword": "limited",
            "frase": "limited",
            "writer": "available"
          },
          "note": "Available on Anyword and Frase only at their custom-priced Enterprise tiers; part of Writer's standard enterprise positioning."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the most affordable entry point?",
      "answer": "Anyword and Frase both start at $39/month billed annually. Writer's Team plan is priced per user at roughly $18 to $29/month, but Writer's core value proposition is realized through its custom-priced Enterprise tier."
    },
    {
      "question": "Does any of these offer a permanent free plan?",
      "answer": "No. None of the three has a permanent free tier. Anyword and Frase each offer a 7-day free trial, while Writer's pricing is oriented around Team and Enterprise subscriptions."
    },
    {
      "question": "Which tool is best for SEO-focused content teams?",
      "answer": "Frase, because of its SERP and competitor research, content briefs, technical site audits, and generative-engine (GEO) visibility tracking, none of which are documented features of Anyword or Writer."
    },
    {
      "question": "Which tool is designed for large, regulated enterprises?",
      "answer": "Writer, due to its proprietary Palmyra models, Knowledge Graph grounding in company data, and enterprise security and compliance focus for industries like financial services, healthcare, and insurance."
    },
    {
      "question": "Can any of these platforms auto-publish content?",
      "answer": "Frase's Agent feature can auto-publish certain content types, such as FAQ or glossary pages, directly to a connected CMS, and Writer's AI Agents automate broader multi-step business workflows. Anyword's documented feature set does not include an auto-publish agent."
    },
    {
      "question": "Do these tools offer API access for custom integrations?",
      "answer": "Anyword documents API access as a feature of its Business and Enterprise tiers. API availability for Frase and Writer is not specified in the available data, so confirm directly with each vendor if that is a requirement."
    }
  ]
};

export default anywordVsFraseVsWriterContent;
