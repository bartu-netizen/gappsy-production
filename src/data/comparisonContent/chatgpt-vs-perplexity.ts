import type { ToolComparisonContent } from './types';

const chatgptVsPerplexityContent: ToolComparisonContent = {
  "verdict": "ChatGPT and Perplexity are both AI chat interfaces with a $20/month paid tier, but they are built to do different jobs. ChatGPT, from OpenAI (founded 2015), is a general-purpose conversational assistant: it writes, brainstorms, tutors, generates and edits images, holds real-time voice conversations, and, through its code interpreter, writes, runs, and debugs code while analyzing data files. Custom GPTs, Projects, and cross-conversation Memory let it be shaped into a personalized, multi-purpose tool, and its developer API lets teams build custom products on the same models. Perplexity, launched in 2022, is built around a narrower job: turning a question into a cited, synthesized answer pulled from live web sources, with every response backed by clickable citations by default. Its focused search modes, Discover feed, and shareable research pages are tuned for fact-finding and current-events research rather than open-ended creation or coding. Buyers who need a do-everything assistant for writing, coding, and building — where flexibility and output depth matter more than sourcing — fit ChatGPT's model. Buyers whose core need is fast, verifiable, up-to-date answers with transparent sourcing, especially non-technical users who want search-like simplicity, fit Perplexity's model better. Since both tools overlap on web search and cost the same at the entry paid tier, the deciding factor is less about which tool is objectively better and more about which job you're hiring it to do.",
  "bestForToolA": "ChatGPT is the better fit for users who need one tool for writing, coding, tutoring, image generation, and voice interaction, and who want to build custom assistants (Custom GPTs) or organize ongoing work into Projects.",
  "bestForToolB": "Perplexity is the better fit for users whose primary need is fast, source-cited answers to research and current-events questions, especially non-technical users who want a search-engine-like experience with transparency built in.",
  "whoNeedsBoth": "Researchers, content creators, and knowledge workers often use both: Perplexity for quickly finding and verifying current, cited information, and ChatGPT for the follow-on work of drafting, coding, or building on top of those findings.",
  "keyDifferences": [
    {
      "title": "Core design philosophy",
      "toolA": "General-purpose conversational assistant covering writing, brainstorming, tutoring, coding, and image work",
      "toolB": "Purpose-built real-time answer engine that synthesizes web sources into a single cited response",
      "whyItMatters": "It determines whether the tool is optimized for open-ended creation or for fast, verifiable fact-finding",
      "benefitsWho": "Creators and builders benefit from ChatGPT's breadth; researchers and fact-checkers benefit from Perplexity's focus"
    },
    {
      "title": "Company maturity",
      "toolA": "Founded 2015 (OpenAI), with a large, mature developer ecosystem via its API",
      "toolB": "Founded 2022, newer to market with a narrower but rapidly evolving feature set",
      "whyItMatters": "Longer track record can mean more third-party integrations and tooling built around the product",
      "benefitsWho": "Developers and enterprises wanting an established API ecosystem lean toward ChatGPT"
    },
    {
      "title": "Citation behavior",
      "toolA": "Web browsing retrieves and cites sources only when a query needs current information beyond training data",
      "toolB": "Every answer includes numbered, clickable citations to original sources by default",
      "whyItMatters": "Default, consistent citations make it faster to verify claims without extra prompting",
      "benefitsWho": "Students, journalists, and anyone who needs to fact-check answers benefits from Perplexity's default sourcing"
    },
    {
      "title": "Code and data work",
      "toolA": "Dedicated code interpreter writes, runs, and debugs code and analyzes uploaded data files and spreadsheets",
      "toolB": "Not documented as offering code execution or debugging capability",
      "whyItMatters": "Developers and analysts need a tool that can actually execute and iterate on code, not just discuss it",
      "benefitsWho": "Developers, data analysts, and technical users benefit from ChatGPT's code interpreter"
    },
    {
      "title": "Personalization and memory",
      "toolA": "Memory retains details across conversations, and Projects group related chats, files, and instructions",
      "toolB": "Not documented as offering cross-conversation memory or project-style organization",
      "whyItMatters": "Persistent context reduces repetitive prompting for ongoing, multi-session work",
      "benefitsWho": "Long-term individual users and teams managing multiple ongoing workstreams benefit from ChatGPT's memory and Projects"
    },
    {
      "title": "Content discovery",
      "toolA": "Not documented as offering a curated content or trending-topics feed",
      "toolB": "Discover feed surfaces trending topics and curated stories without requiring a typed query",
      "whyItMatters": "A built-in discovery feed supports passive browsing and staying current on topics of interest",
      "benefitsWho": "Users who want to casually stay informed benefit from Perplexity's Discover feed"
    },
    {
      "title": "Focused search targeting",
      "toolA": "Web browsing is general-purpose, without documented options to restrict searches to specific domains or content types",
      "toolB": "Focused search modes let users narrow queries to academic papers, recent news, or specific websites",
      "whyItMatters": "Domain-narrowed search reduces noise for specialized research tasks like academic or news-specific queries",
      "benefitsWho": "Academic researchers and news-focused users benefit from Perplexity's focused search modes"
    },
    {
      "title": "Team plan structure",
      "toolA": "Offers a dedicated Team plan with per-seat custom pricing, admin console, and workspace controls",
      "toolB": "Team collaboration and admin controls are documented as part of the custom-priced Enterprise plan, with no separate mid-tier Team plan",
      "whyItMatters": "A dedicated mid-tier team plan can be an easier, less negotiation-heavy entry point for small teams",
      "benefitsWho": "Small-to-midsize teams benefit from ChatGPT's dedicated Team tier"
    },
    {
      "title": "Voice interaction",
      "toolA": "Voice mode enables real-time spoken conversation with natural-sounding spoken responses",
      "toolB": "Not documented as offering a voice conversation mode",
      "whyItMatters": "Voice interaction supports hands-free use cases like driving, walking, or accessibility needs",
      "benefitsWho": "Users who want hands-free or accessibility-friendly interaction benefit from ChatGPT's voice mode"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Interaction & Input",
      "rows": [
        {
          "feature": "Conversational chat",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Voice mode",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT offers real-time spoken conversation"
        },
        {
          "feature": "Image understanding and generation",
          "toolA": "available",
          "toolB": "limited",
          "note": "Perplexity documents image analysis of uploads; image generation is not documented"
        },
        {
          "feature": "File and document analysis",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Search & Information Retrieval",
      "rows": [
        {
          "feature": "Real-time web search",
          "toolA": "available",
          "toolB": "available",
          "note": "ChatGPT browses the web as needed; Perplexity's core function is real-time search synthesis"
        },
        {
          "feature": "Inline citations by default",
          "toolA": "limited",
          "toolB": "available",
          "note": "ChatGPT cites sources when web browsing is used; Perplexity cites sources on every answer"
        },
        {
          "feature": "Focused/domain-specific search modes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "e.g. academic papers, recent news, specific sites"
        },
        {
          "feature": "Trending/discovery feed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Content Creation & Development",
      "rows": [
        {
          "feature": "Code interpreter (write, run, debug code)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Custom configurable assistants (e.g. Custom GPTs)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Developer API",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer programmatic access to underlying models/search"
        }
      ]
    },
    {
      "group": "Personalization & Organization",
      "rows": [
        {
          "feature": "Cross-conversation memory",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Grouped workspaces (chats/files/instructions)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT's Projects feature"
        },
        {
          "feature": "Shareable structured research pages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Platforms & Access",
      "rows": [
        {
          "feature": "Web app",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "iOS app",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Android app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Perplexity explicitly documents an Android app"
        },
        {
          "feature": "Browser extension",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both priced at $20/month (Plus vs Pro)"
        },
        {
          "feature": "Dedicated mid-tier team plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT Team is a distinct per-seat plan; Perplexity bundles team features into Enterprise"
        },
        {
          "feature": "Enterprise / custom plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer custom-priced enterprise plans"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, ChatGPT or Perplexity?",
      "answer": "Neither is cheaper outright at the entry level — both offer a free tier and a $20/month paid plan (ChatGPT Plus vs. Perplexity Pro) — but ChatGPT additionally offers a dedicated per-seat Team plan, while Perplexity folds team features into its custom-priced Enterprise plan."
    },
    {
      "question": "Is ChatGPT or Perplexity better for research with sources?",
      "answer": "Perplexity is built specifically for sourced research, since every answer includes inline citations by default and offers focused search modes for academic papers or news, whereas ChatGPT only cites sources when its web browsing feature is actively used."
    },
    {
      "question": "Can ChatGPT do what Perplexity does?",
      "answer": "ChatGPT can browse the web and cite current information when needed, but it does not document Perplexity's default-on citations, domain-focused search modes, or Discover feed for browsing trending topics."
    },
    {
      "question": "Can Perplexity write and debug code like ChatGPT?",
      "answer": "This isn't documented — Perplexity's verified feature set covers search synthesis, citations, and file/image analysis, while ChatGPT has a dedicated code interpreter for writing, running, and debugging code and analyzing data files."
    },
    {
      "question": "Which is better for beginners or non-technical users?",
      "answer": "Perplexity's clean, conversational interface is described as easy for non-technical users to pick up quickly, since it largely replaces a search engine with cited answers, whereas ChatGPT's broader feature set (Custom GPTs, Projects, code interpreter) has more depth to learn."
    },
    {
      "question": "Do ChatGPT and Perplexity both have mobile apps?",
      "answer": "Yes, both offer native mobile apps and web access; ChatGPT is documented with an iOS app, while Perplexity is documented with both iOS and Android apps plus a browser extension."
    }
  ]
};

export default chatgptVsPerplexityContent;
