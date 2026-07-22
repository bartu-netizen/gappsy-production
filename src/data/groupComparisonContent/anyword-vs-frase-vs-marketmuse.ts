import type { GroupComparisonContent } from './types';

const anywordVsFraseVsMarketmuseContent: GroupComparisonContent = {
  "verdict": "Anyword, Frase, and MarketMuse all use AI to help marketing and SEO teams produce better content, but they optimize for different moments in the workflow. Anyword leans into performance-predictive ad, email, and social copy; Frase bundles SERP research, briefing, drafting, auditing, and emerging GEO visibility tracking into one subscription; and MarketMuse goes deepest on topic modeling and content strategy before a single word is written. None of the three is a strict upgrade over the others, since the right pick depends on whether a team needs conversion-focused copy, an end-to-end SEO content pipeline, or rigorous topical planning.",
  "bestFor": {
    "anyword": "Marketing and growth teams that want AI-generated ad, email, and social copy paired with data-driven performance predictions rather than open-ended drafting.",
    "frase": "SEO and content teams that want one subscription covering SERP research, content briefs, AI drafting, technical site audits, and AI-answer (GEO) visibility tracking.",
    "marketmuse": "Content strategists and SEO leads who need deep topic modeling and content-gap analysis to plan and prioritize what to write before drafting begins."
  },
  "highlights": [
    {
      "title": "Anyword scores copy before you publish it",
      "description": "The Data-Driven Editor inside Anyword produces several copy variations at once, then ranks them with proprietary performance-prediction scoring built from historical A/B-test results — something neither Frase nor MarketMuse documents.",
      "toolSlugs": [
        "anyword"
      ]
    },
    {
      "title": "Frase covers the full SEO content pipeline in one tool",
      "description": "A single Frase subscription bundles SERP and competitor research, AI-generated briefs, an AI writing assistant, Content Guard alerts for underperforming pages, site audits, and tracking of visibility in generative-engine (GEO) results.",
      "toolSlugs": [
        "frase"
      ]
    },
    {
      "title": "MarketMuse goes deepest on topic strategy",
      "description": "MarketMuse's topic modeling compares a page or draft against the breadth and depth of top-ranking competitor content to surface topical gaps, entities, and questions, making it a planning-first tool rather than a drafting tool.",
      "toolSlugs": [
        "marketmuse"
      ]
    },
    {
      "title": "Entry pricing lands in a similar range, but structure differs",
      "description": "Anyword and Frase both start around 39 US dollars per month billed annually with a short free trial and no permanent free plan, while MarketMuse offers an always-free tier with limited queries alongside paid tiers that are now largely quote-based since its acquisition by Siteimprove.",
      "toolSlugs": [
        "anyword",
        "frase",
        "marketmuse"
      ]
    },
    {
      "title": "Both Frase and MarketMuse changed hands recently",
      "description": "Copysmith AI acquired Frase back in October 2022, and the product has kept shipping new features under its own brand since then, whereas MarketMuse's 2024 acquisition by Siteimprove pushed it toward sales-assisted, quote-based pricing.",
      "toolSlugs": [
        "frase",
        "marketmuse"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Generation",
      "rows": [
        {
          "feature": "AI copy or article drafting",
          "statuses": {
            "anyword": "available",
            "frase": "available",
            "marketmuse": "limited"
          },
          "note": "MarketMuse centers on scoring and briefing rather than generating full drafts."
        },
        {
          "feature": "Brand voice or tone controls",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "marketmuse": "not-documented"
          }
        },
        {
          "feature": "Marketing content template library",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "marketmuse": "not-documented"
          },
          "note": "Anyword documents 100+ templates across channels."
        }
      ]
    },
    {
      "group": "SEO Research and Strategy",
      "rows": [
        {
          "feature": "SERP and competitor research",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "marketmuse": "available"
          }
        },
        {
          "feature": "AI-generated content briefs",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "marketmuse": "available"
          }
        },
        {
          "feature": "Content performance or optimization scoring",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "marketmuse": "available"
          },
          "note": "Anyword predicts marketing-copy performance; MarketMuse scores drafts against a topic model."
        },
        {
          "feature": "Existing-content audit or refresh alerts",
          "statuses": {
            "anyword": "not-documented",
            "frase": "available",
            "marketmuse": "available"
          },
          "note": "Frase's Content Guard and MarketMuse's Content Inventory both flag pages needing updates."
        }
      ]
    },
    {
      "group": "Plans and Integration",
      "rows": [
        {
          "feature": "Free tier or free trial",
          "statuses": {
            "anyword": "available",
            "frase": "available",
            "marketmuse": "available"
          },
          "note": "Only MarketMuse offers a permanent free plan; Anyword and Frase offer 7-day trials."
        },
        {
          "feature": "API access",
          "statuses": {
            "anyword": "available",
            "frase": "not-documented",
            "marketmuse": "not-documented"
          },
          "note": "Anyword's API is limited to Business and Enterprise tiers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tools actually writes full articles for me?",
      "answer": "Frase and Anyword both include AI drafting for full pieces of content, while MarketMuse focuses more on topic briefs and optimization scoring than generating complete drafts."
    },
    {
      "question": "Does any of these have a permanent free plan?",
      "answer": "MarketMuse offers an always-free tier with limited monthly queries and no content inventory. Anyword and Frase only offer 7-day free trials, with no free plan afterward."
    },
    {
      "question": "Which tool fits ad and social copy versus long-form SEO content?",
      "answer": "Anyword is built around ad, email, and social copy with performance prediction, while Frase and MarketMuse are geared toward organic SEO content: briefs, articles, and topical coverage."
    },
    {
      "question": "Are these three tools still run independently?",
      "answer": "Frase was acquired by Copysmith AI in 2022 and continues to operate as a branded, actively developed product. MarketMuse was acquired by Siteimprove in late 2024 and has moved to largely quote-based pricing. Anyword remains an independent company."
    },
    {
      "question": "Do any of these track visibility in AI chatbot answers?",
      "answer": "Frase now offers generative-engine optimization (GEO) tracking, which checks whether AI chatbots are citing a brand's content in their answers. Anyword and MarketMuse don't document this kind of tracking."
    },
    {
      "question": "What is the starting price for each tool?",
      "answer": "Anyword starts around 39 US dollars per month billed annually, Frase starts around 39 US dollars per month billed annually, and MarketMuse offers a free plan with paid tiers historically starting near 99 US dollars per month, now largely quote-based."
    }
  ]
};

export default anywordVsFraseVsMarketmuseContent;
