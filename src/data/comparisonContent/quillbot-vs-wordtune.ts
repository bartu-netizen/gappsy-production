import type { ToolComparisonContent } from './types';

const quillbotVsWordtuneContent: ToolComparisonContent = {
  "verdict": "QuillBot and Wordtune both use AI to rewrite text, but they are built for different jobs. QuillBot is an all-in-one writing toolkit aimed at students, researchers, and academic writers: alongside its Paraphraser, it bundles a Plagiarism Checker, Citation Generator, AI Content Detector, and a Translator covering dozens of languages, plus a dedicated Word add-in and mobile keyboard apps for both iOS and Android. Wordtune, built by AI21 Labs, is narrower and more general-purpose: it focuses on in-the-moment sentence rewriting, one-click tone adjustment, and its Spices feature that inserts facts, examples, or counterarguments to strengthen a draft, working across Gmail, Google Docs, LinkedIn, and most web text fields via its browser extension. QuillBot's 2017 founding and ownership under Learneo (alongside citation- and research-focused sibling products) shows in its academic-leaning feature set; Wordtune's rewrite output is English-only and it has no Android app, reflecting its narrower, general-writing focus. Neither tool wins outright: QuillBot is the stronger pick when plagiarism checking, citations, or high-volume paraphrasing matter, while Wordtune suits writers who want quick, in-context rewrite suggestions and argument-strengthening help without academic tooling. Budget matters too — Wordtune's entry paid tier, Advanced at $6.99/month, undercuts QuillBot Premium's $19.95/month rate, though QuillBot's annual plan ($8.33/month) closes most of that gap and adds a discounted student tier Wordtune doesn't offer.",
  "bestForToolA": "QuillBot fits students, researchers, and academic writers who need paraphrasing bundled with plagiarism checking, citation formatting, and multi-language translation in one subscription.",
  "bestForToolB": "Wordtune fits everyday writers, marketers, and professionals who want fast, in-context sentence rewriting and tone adjustment while drafting emails, docs, and posts across the web.",
  "whoNeedsBoth": "A grad student or content professional who needs QuillBot's citation and plagiarism tools for formal academic work but also wants Wordtune's Spices feature and browser-wide rewrite overlay for everyday email and social writing could reasonably run both.",
  "keyDifferences": [
    {
      "title": "Entry paid pricing",
      "toolA": "QuillBot Premium starts at $19.95/month, or $8.33/month billed annually at $99.95/year.",
      "toolB": "Wordtune Advanced starts at $6.99/month, or $4.89/month billed annually.",
      "whyItMatters": "Wordtune's cheapest paid tier costs roughly a third of QuillBot's monthly rate, which matters for buyers comparing sticker price before annual discounts.",
      "benefitsWho": "Budget-conscious individual writers benefit from Wordtune's lower entry price; those who commit to annual billing narrow the gap with QuillBot."
    },
    {
      "title": "Core use case",
      "toolA": "QuillBot centers on paraphrasing with multiple rewrite modes (Standard, Fluency, Formal, Creative) and a synonym slider.",
      "toolB": "Wordtune centers on AI Rewrite suggestions plus Spices that add facts, examples, or counterarguments to a draft.",
      "whyItMatters": "One tool is optimized for controlled rephrasing intensity, the other for expanding and strengthening an argument in place.",
      "benefitsWho": "Writers polishing existing text benefit from QuillBot's mode control; writers building out an argument benefit from Wordtune's Spices."
    },
    {
      "title": "Academic tooling",
      "toolA": "QuillBot includes a Plagiarism Checker and a Citation Generator supporting styles like APA, MLA, and Chicago.",
      "toolB": "Wordtune's documented feature set does not include a plagiarism checker or citation generator.",
      "whyItMatters": "Academic and research writers need originality checks and formatted citations, which only one tool provides.",
      "benefitsWho": "Students and academic writers benefit from QuillBot; general business or casual writers are less affected by the gap."
    },
    {
      "title": "AI content detection",
      "toolA": "QuillBot offers its own AI Content Detector to estimate the likelihood text was AI-generated.",
      "toolB": "Wordtune's documented facts do not mention an AI content detector.",
      "whyItMatters": "Writers worried about AI-detection flags on submitted work have a built-in check with QuillBot but not confirmed with Wordtune.",
      "benefitsWho": "Students and content teams concerned about AI-detection scrutiny benefit from QuillBot's detector."
    },
    {
      "title": "Language and translation support",
      "toolA": "QuillBot includes a standalone Translator supporting dozens of languages while aiming to preserve tone and meaning.",
      "toolB": "Wordtune accepts input in several non-English languages but produces rewrite output in English only.",
      "whyItMatters": "Multilingual writers who need output in their own language are limited by Wordtune's English-only rewrites.",
      "benefitsWho": "Non-English-first writers and international teams benefit from QuillBot's broader translation output."
    },
    {
      "title": "Mobile platform coverage",
      "toolA": "QuillBot offers keyboard apps for both iOS and Android.",
      "toolB": "Wordtune offers an iOS writing keyboard; its cons explicitly note no Android app.",
      "whyItMatters": "Android users get a native mobile experience with one tool but not the other.",
      "benefitsWho": "Android-first users benefit from QuillBot; iOS-only users see no difference."
    },
    {
      "title": "Document and productivity integrations",
      "toolA": "QuillBot provides a Microsoft Word add-in alongside its Chrome extension.",
      "toolB": "Wordtune's browser extension overlays on Gmail, Google Docs, LinkedIn, and most Chrome, Edge, and Firefox text fields, but no Word add-in is documented.",
      "whyItMatters": "Writers working primarily in Word need a native add-in, while those working in Google Docs, Gmail, or LinkedIn benefit from broader web-app overlay support.",
      "benefitsWho": "Microsoft Word users benefit from QuillBot; Google Workspace and web-form writers benefit from Wordtune's wider extension reach."
    },
    {
      "title": "Free plan limits",
      "toolA": "QuillBot's free plan limits input length and available paraphrasing modes.",
      "toolB": "Wordtune's free Basic plan caps usage at 10 rewrites per day and 3 AI summarizations per month.",
      "whyItMatters": "Both free tiers cap usage but in different ways — QuillBot restricts capability depth per session, Wordtune restricts daily/monthly volume.",
      "benefitsWho": "Occasional users doing short edits may find Wordtune's daily cap workable; users needing full-mode paraphrasing benefit more from paying for QuillBot."
    },
    {
      "title": "Company background and ownership",
      "toolA": "QuillBot was founded in 2017 in Chicago and is owned by Learneo (formerly Course Hero), which also owns Scribbr, CliffsNotes, LanguageTool, and Symbolab.",
      "toolB": "Wordtune was founded in 2020 in Tel Aviv and is built by AI21 Labs.",
      "whyItMatters": "QuillBot's ownership under an education-focused company group aligns with its academic feature depth; Wordtune's AI21 Labs backing reflects its general-purpose language-model roots.",
      "benefitsWho": "Buyers weighing company focus and product roadmap direction can use this to judge which tool is likely to keep investing in their use case."
    },
    {
      "title": "Discounted plan tiers",
      "toolA": "QuillBot offers a discounted Student plan at $6.25/month for verified students with the full Premium feature set.",
      "toolB": "Wordtune's documented pricing plans (Basic, Advanced, Unlimited) include no student-specific discount tier.",
      "whyItMatters": "Verified students get a lower committed price with one tool but not the other.",
      "benefitsWho": "Enrolled students benefit from QuillBot's Student plan pricing; non-students see no difference here."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Rewriting",
      "rows": [
        {
          "feature": "Sentence paraphrasing",
          "toolA": "available",
          "toolB": "available",
          "note": "QuillBot uses named modes (Standard, Fluency, Formal, Creative); Wordtune offers multiple alternative phrasings per highlighted sentence"
        },
        {
          "feature": "One-click tone adjustment (casual/formal)",
          "toolA": "limited",
          "toolB": "available",
          "note": "QuillBot achieves tone shifts via separate rewrite modes rather than a single toggle; Wordtune has a dedicated one-click control"
        },
        {
          "feature": "Sentence shortening/expansion to target length",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Argument-strengthening additions (facts, examples, counterarguments)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wordtune's Spices feature"
        }
      ]
    },
    {
      "group": "Grammar & Correction",
      "rows": [
        {
          "feature": "Grammar checking",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Spelling correction",
          "toolA": "available",
          "toolB": "available",
          "note": "Wordtune lists unlimited spelling corrections even on its free Basic plan"
        }
      ]
    },
    {
      "group": "Academic & Research Tools",
      "rows": [
        {
          "feature": "Plagiarism checker",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "Citation generator (APA, MLA, Chicago)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "AI content detector",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        }
      ]
    },
    {
      "group": "Summarization",
      "rows": [
        {
          "feature": "Article/document summarization",
          "toolA": "available",
          "toolB": "available",
          "note": "Wordtune's free plan limits this to 3 summaries per month"
        },
        {
          "feature": "Video transcript summarization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        }
      ]
    },
    {
      "group": "Translation & Language",
      "rows": [
        {
          "feature": "Multi-language rewrite/translation output",
          "toolA": "available",
          "toolB": "limited",
          "note": "QuillBot's Translator covers dozens of languages; Wordtune accepts non-English input but outputs English only"
        }
      ]
    },
    {
      "group": "Platform & Integrations",
      "rows": [
        {
          "feature": "Browser extension",
          "toolA": "available",
          "toolB": "available",
          "note": "QuillBot: Chrome; Wordtune: Chrome, Edge, and Firefox"
        },
        {
          "feature": "Microsoft Word add-in",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "iOS app/keyboard",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Android app/keyboard",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Wordtune's documented cons explicitly state no Android app"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "QuillBot limits input length/modes; Wordtune caps daily rewrites and monthly summaries"
        },
        {
          "feature": "Student discount pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "QuillBot Student plan at $6.25/month for verified students"
        },
        {
          "feature": "Advanced enterprise/team admin controls",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "QuillBot's own documented cons note fewer enterprise admin and compliance controls versus larger writing suites"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, QuillBot or Wordtune?",
      "answer": "Wordtune is cheaper at the entry paid tier: Advanced starts at $6.99/month ($4.89/month billed annually) versus QuillBot Premium at $19.95/month ($8.33/month billed annually at $99.95/year); QuillBot's annual plan narrows the gap and adds a discounted $6.25/month Student plan that Wordtune does not offer."
    },
    {
      "question": "Is QuillBot or Wordtune better for academic writing and students?",
      "answer": "QuillBot is the better fit for academic writing because it bundles a Plagiarism Checker and a Citation Generator (APA, MLA, Chicago) alongside its Paraphraser, plus a discounted Student plan, none of which are documented features of Wordtune."
    },
    {
      "question": "Can Wordtune do what QuillBot does, like check for plagiarism or generate citations?",
      "answer": "No, Wordtune's documented feature set does not include a plagiarism checker or citation generator; those are QuillBot-specific tools, while Wordtune focuses on rewriting, tone adjustment, and its Spices feature for adding supporting content."
    },
    {
      "question": "Is Wordtune available on Android?",
      "answer": "No, Wordtune has no Android app; its documented cons explicitly state this, whereas QuillBot offers keyboard apps for both iOS and Android."
    },
    {
      "question": "Which tool supports more languages, QuillBot or Wordtune?",
      "answer": "QuillBot supports more languages for actual output, since its Translator covers dozens of languages while preserving tone and meaning, whereas Wordtune accepts input in several non-English languages but only produces rewrite output in English."
    },
    {
      "question": "Which has a better free plan, QuillBot or Wordtune?",
      "answer": "It depends on usage pattern: QuillBot's free plan limits input length and available paraphrasing modes but has no stated daily cap, while Wordtune's free Basic plan caps usage at 10 rewrites per day and 3 AI summarizations per month, which suits light, occasional use better than heavy daily editing."
    }
  ]
};

export default quillbotVsWordtuneContent;
