import type { ToolComparisonContent } from './types';

const composeAiVsParagraphaiContent: ToolComparisonContent = {
  "verdict": "Compose AI and ParagraphAI both speed up everyday writing with AI autocomplete, but they differ in scope and platform reach: Compose AI is a narrowly focused, free-forever Chrome autocomplete tool, while ParagraphAI is a broader writing assistant with grammar correction, translation, and mobile apps, gated behind daily usage limits on its free tier.",
  "bestForToolA": "Users who primarily type in the browser and want unlimited, free sentence and email autocomplete that learns their personal writing voice, without needing mobile or translation features.",
  "bestForToolB": "Users who write across mobile and browser, need grammar correction, tone editing, or translation in 40+ languages, and are willing to pay for unlimited daily use beyond the capped free tier.",
  "whoNeedsBoth": "Someone who wants free, always-on browser autocomplete from Compose AI for daily typing but also needs mobile writing support and translation for specific tasks might keep both installed.",
  "keyDifferences": [
    {
      "title": "Platform Breadth",
      "toolA": "Only available as a Chrome browser extension.",
      "toolB": "Available as a Chrome extension plus iOS and Android mobile apps with cross-device sync.",
      "whyItMatters": "Mobile availability matters for users who write on the go, such as texting or mobile email.",
      "benefitsWho": "Mobile-first users and anyone writing primarily from a phone keyboard."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "The core autocomplete plugin is free to use forever with no stated usage cap.",
      "toolB": "The free plan is capped at 5 daily uses of Create/Fix/Reply/Edit and a 1,000-character input limit.",
      "whyItMatters": "Free-tier usage limits affect how much daily writing volume a non-paying user can realistically get done.",
      "benefitsWho": "Heavy daily users looking to avoid paying at all (Compose AI) versus occasional users fine with capped daily use (ParagraphAI)."
    },
    {
      "title": "Language & Translation Support",
      "toolA": "No language or translation support is documented beyond English autocomplete.",
      "toolB": "Supports 40+ languages for input, output, and translation.",
      "whyItMatters": "Multilingual writers and translators need broad language coverage.",
      "benefitsWho": "Non-English speakers or anyone communicating across languages."
    },
    {
      "title": "Feature Scope",
      "toolA": "Focused narrowly on autocomplete and personalized phrase suggestion.",
      "toolB": "Documents a wider range of writing features: grammar correction, tone/length editing, AI humanization, summarization of web pages and PDFs, and templates.",
      "whyItMatters": "Broader feature scope suits users who need more than sentence completion, like summarizing documents or adjusting tone.",
      "benefitsWho": "Users needing an all-in-one writing assistant versus those who just want faster typing."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Premium plan pricing is not publicly disclosed.",
      "toolB": "Publishes clear pricing: $24.99/month or $12.49/month billed annually for Pro, plus a custom Enterprise tier.",
      "whyItMatters": "Transparent pricing helps buyers budget without contacting sales.",
      "benefitsWho": "Individual buyers who want to see exact costs before signing up."
    }
  ],
  "featureMatrix": [
    {
      "group": "Writing Assistance",
      "rows": [
        {
          "feature": "Sentence/email autocomplete",
          "toolA": "available",
          "toolB": "available",
          "note": "ParagraphAI: Email Replies"
        },
        {
          "feature": "Grammar correction",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tone/formality/length editing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI humanization",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Summarization",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Personalized writing voice",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platforms & Language Support",
      "rows": [
        {
          "feature": "Browser extension",
          "toolA": "available",
          "toolB": "available",
          "note": "Compose AI: Chrome only"
        },
        {
          "feature": "Mobile app (iOS/Android)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-language translation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "40+ languages"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free forever tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Compose AI: no stated cap; ParagraphAI: capped at 5 daily uses, 1,000 characters"
        },
        {
          "feature": "Published premium pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$24.99/mo or $12.49/mo annual"
        },
        {
          "feature": "Enterprise plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Custom, includes brand voice and dedicated support"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Compose AI or ParagraphAI free?",
      "answer": "Compose AI's core Chrome plugin is free to use forever. ParagraphAI also has a free plan, but it's capped at 5 daily uses of Create/Fix/Reply/Edit and a 1,000-character input limit."
    },
    {
      "question": "Which tool works on mobile devices?",
      "answer": "ParagraphAI is available as iOS and Android mobile apps in addition to a browser extension. Compose AI is only available as a Chrome browser extension."
    },
    {
      "question": "Which tool supports more languages?",
      "answer": "ParagraphAI supports 40+ languages for writing and translation. Compose AI does not document language or translation support."
    },
    {
      "question": "How much does ParagraphAI's Pro plan cost?",
      "answer": "$24.99/user/month billed monthly, or $12.49/user/month billed annually ($149.88/year)."
    },
    {
      "question": "Is Compose AI's premium plan pricing public?",
      "answer": "No, Compose AI's premium plan pricing is not publicly disclosed on the site; only the free core plugin's availability is confirmed."
    }
  ]
};

export default composeAiVsParagraphaiContent;
