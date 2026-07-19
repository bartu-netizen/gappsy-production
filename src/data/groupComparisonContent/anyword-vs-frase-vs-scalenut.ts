import type { GroupComparisonContent } from './types';

const anywordVsFraseVsScalenutContent: GroupComparisonContent = {
  "verdict": "Anyword, Frase, and Scalenut all sit in the AI content space but start from different priorities: Anyword leads with performance-prediction scoring for marketing copy, while Frase and Scalenut are closer competitors, both combining keyword and SERP research, AI writing, content audits, and generative-engine-optimization tracking. Scalenut adds keyword clustering, multi-workspace support, and an optional VIP managed service aimed at agencies, and its promotional entry pricing undercuts Frase's starting price, though its regular list prices are considerably higher. None of the three provides a permanent free plan, so evaluation happens through a trial before committing to a paid tier.",
  "bestFor": {
    "anyword": "Marketing teams that want AI-generated ad and landing-page copy backed by data-driven performance prediction rather than generic SEO scoring.",
    "frase": "Content and SEO teams that want SERP-grounded briefs, AI writing, content-decay monitoring, and GEO visibility tracking in one subscription.",
    "scalenut": "Agencies and larger content teams that want keyword clustering, multi-workspace management, and an optional managed VIP service alongside AI content and GEO tracking."
  },
  "highlights": [
    {
      "title": "Performance prediction remains Anyword's edge",
      "description": "Anyword's Performance Prediction and Data-Driven Editor score copy variants before publishing, a capability that neither Frase nor Scalenut offers, since both of the other tools are oriented around matching content to what already ranks in search.",
      "toolSlugs": [
        "anyword"
      ]
    },
    {
      "title": "Frase and Scalenut compete closely on SEO workflow",
      "description": "Frase and Scalenut both pair keyword and SERP research with AI writing, content audits, and GEO visibility tracking, making them the more direct head-to-head pairing for teams choosing a full SEO content platform.",
      "toolSlugs": [
        "frase",
        "scalenut"
      ]
    },
    {
      "title": "Scalenut's promotional pricing undercuts Frase at entry",
      "description": "Scalenut advertises a Starter plan at $24 per month, below Frase's $39 starting price, though Scalenut's regular list price of $59 per month shows the promotional rate may not be permanent.",
      "toolSlugs": [
        "scalenut",
        "frase"
      ]
    },
    {
      "title": "Scalenut adds agency-oriented scale features",
      "description": "Multi-workspace support and an optional VIP managed service give Scalenut a stronger fit for agencies handling multiple clients than either Anyword or Frase currently offer.",
      "toolSlugs": [
        "scalenut"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Generation",
      "rows": [
        {
          "feature": "AI copy and content generation",
          "statuses": {
            "anyword": "available",
            "frase": "available",
            "scalenut": "available"
          }
        },
        {
          "feature": "Brand voice controls",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "scalenut": "not-documented"
          }
        }
      ]
    },
    {
      "group": "SEO Research and Optimization",
      "rows": [
        {
          "feature": "Keyword research and clustering",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "scalenut": "available"
          },
          "note": "Frase covers this through SERP and competitor research; Scalenut through dedicated keyword clustering."
        },
        {
          "feature": "AI-generated content briefs",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "scalenut": "not-documented"
          }
        },
        {
          "feature": "Content audits",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "scalenut": "available"
          }
        }
      ]
    },
    {
      "group": "Visibility and Scale",
      "rows": [
        {
          "feature": "GEO / AI-answer-engine visibility tracking",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "scalenut": "available"
          }
        },
        {
          "feature": "Performance prediction scoring",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "scalenut": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between Anyword and Frase or Scalenut?",
      "answer": "Anyword is built around predicting how marketing and ad copy will perform before it is published, while Frase and Scalenut are SEO content platforms that build briefs and audits around what already ranks for a given keyword."
    },
    {
      "question": "Is Scalenut cheaper than Frase?",
      "answer": "Scalenut's advertised Starter plan at $24 per month is currently cheaper than Frase's $39 starting price, but Scalenut discloses that this is a promotional rate and its regular list price is $59 per month, so the long-term cost gap is smaller than it first appears."
    },
    {
      "question": "Which tool is best for agencies managing multiple client sites?",
      "answer": "Scalenut is the strongest fit among the three for agencies, since it offers multi-workspace support and an optional VIP managed service; Frase and Anyword do not document equivalent multi-workspace or managed-service features."
    },
    {
      "question": "Do Anyword, Frase, and Scalenut track visibility in AI answer engines like ChatGPT?",
      "answer": "Frase and Scalenut both include GEO or generative-engine-optimization tracking features. Anyword does not offer this, since it is focused on marketing copy performance prediction rather than search or AI-answer-engine rankings."
    },
    {
      "question": "Do any of these three tools offer a permanent free plan?",
      "answer": "No. Anyword offers a 7-day free trial, and Frase and Scalenut are paid subscriptions from their first tier, so evaluating any of the three requires a trial period before committing to a paid plan."
    }
  ]
};

export default anywordVsFraseVsScalenutContent;
