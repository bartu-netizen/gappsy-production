import type { ToolComparisonContent } from './types';

const chatgptVsClaudeContent: ToolComparisonContent = {
  "verdict": "ChatGPT and Claude are both general-purpose AI assistants built by different companies, with different documented emphases. ChatGPT, from OpenAI (founded 2015), leans into breadth and customization: it pairs conversational chat with voice mode, image generation and editing, a code interpreter for running code and analyzing data files, web browsing, and Custom GPTs that let anyone build a tailored assistant without writing code. Claude, from Anthropic (founded 2021), leans into structured, document-heavy and developer-focused work: it documents strong handling of long documents and conversation histories, a dedicated Artifacts panel for iterating on generated content, and Claude Code, a purpose-built agentic tool for terminal and IDE workflows. Both start with a free tier and price their first paid plan at $20 per month, and both offer Team and Enterprise plans with admin controls. The real choice isn't about one tool being unconditionally better, but about fit: users who want an all-in-one assistant with voice, image generation, web browsing, and no-code custom bots will find ChatGPT's documented feature set broader for general use, while users focused on long-document review, iterating on structured content, or embedding AI directly into a coding workflow will find Claude's documented tooling more aligned with that work.",
  "bestForToolA": "ChatGPT is the better fit for people who want one tool covering voice conversations, image generation, web browsing, and the ability to build no-code custom assistants (Custom GPTs) for repeatable tasks.",
  "bestForToolB": "Claude is the better fit for users focused on long-document analysis, iterating on structured content through Artifacts, or developers who want an agentic coding tool (Claude Code) built into their terminal or IDE.",
  "whoNeedsBoth": "Teams that want a broad, multimodal assistant with voice and image generation for everyday work (ChatGPT) alongside a dedicated in-editor coding agent and long-document review tool (Claude) may reasonably use both side by side.",
  "keyDifferences": [
    {
      "title": "Image generation vs. image understanding",
      "toolA": "ChatGPT can both analyze uploaded images and generate or edit new images from a text description within the chat.",
      "toolB": "Claude's documented image feature covers uploading and analyzing images for description and reasoning, with no image generation feature listed.",
      "whyItMatters": "For users who need the assistant to create or edit visuals, not just read them, this is a hard capability gap rather than a matter of preference.",
      "benefitsWho": "Marketers, designers, and content creators who need in-chat image creation benefit from ChatGPT's documented feature set."
    },
    {
      "title": "Voice mode",
      "toolA": "ChatGPT includes a dedicated voice mode for real-time spoken conversation with natural-sounding responses.",
      "toolB": "Claude's documented features do not include a voice mode.",
      "whyItMatters": "Hands-free, spoken interaction changes where and how an assistant can be used, such as while driving or multitasking.",
      "benefitsWho": "Users who want to talk to their AI assistant rather than type benefit from ChatGPT's documented voice mode."
    },
    {
      "title": "Persistent memory across conversations",
      "toolA": "ChatGPT documents a Memory feature that recalls relevant details across separate conversations to personalize future responses.",
      "toolB": "Claude's documented feature list does not include a cross-conversation memory feature.",
      "whyItMatters": "Memory reduces the need to repeat context in every new chat, which matters for ongoing personal or work use.",
      "benefitsWho": "Repeat users who want continuity across sessions without re-explaining context benefit from ChatGPT's documented memory."
    },
    {
      "title": "No-code custom assistants",
      "toolA": "ChatGPT offers Custom GPTs: configurable assistants with tailored instructions, knowledge files, and tools that can be used privately or shared.",
      "toolB": "Claude's documented features do not include an equivalent no-code custom-assistant builder.",
      "whyItMatters": "Teams that want to package a specific workflow, such as a support bot or research assistant, without writing code need this kind of builder.",
      "benefitsWho": "Non-technical teams and creators who want to distribute a purpose-built assistant benefit from ChatGPT's Custom GPTs."
    },
    {
      "title": "Dedicated agentic coding tool",
      "toolA": "ChatGPT's documented coding capability is a Code interpreter for writing, running, and debugging code and analyzing data files within chat.",
      "toolB": "Claude offers Claude Code, a dedicated agentic tool that integrates directly into terminal and IDE workflows, in addition to general coding assistance.",
      "whyItMatters": "Embedding an AI agent directly into a developer's existing terminal or IDE workflow is a different use case than running code snippets inside a chat window.",
      "benefitsWho": "Professional developers who want AI assistance embedded in their actual coding environment benefit from Claude Code."
    },
    {
      "title": "Content iteration workspace",
      "toolA": "ChatGPT's documented features do not include a dedicated side-panel workspace for iterating on generated content.",
      "toolB": "Claude offers Artifacts, a dedicated side panel for viewing and iterating on generated code, documents, or interactive content.",
      "whyItMatters": "A persistent, separate view for iterating on a specific piece of output speeds up drafting and revision work compared to scrolling through chat history.",
      "benefitsWho": "Writers, developers, and anyone iterating repeatedly on a single document or piece of code benefits from Claude's Artifacts."
    },
    {
      "title": "Native app platform coverage",
      "toolA": "ChatGPT's documented platform tags cover web app, iOS, and API access.",
      "toolB": "Claude's documented platform tags cover web app, iOS, Android, and desktop apps for Mac and Windows.",
      "whyItMatters": "Broader native app coverage affects whether users get a first-class experience on their preferred device without relying on a browser.",
      "benefitsWho": "Android users and desktop-first users benefit from Claude's broader documented native app coverage."
    },
    {
      "title": "Web browsing for current information",
      "toolA": "ChatGPT documents a web browsing feature that retrieves and cites current information beyond its training data.",
      "toolB": "Claude's documented feature list does not include a web browsing feature.",
      "whyItMatters": "Access to live, cited web information matters for time-sensitive research or fact-checking within the chat itself.",
      "benefitsWho": "Users researching current events or needing cited, up-to-date answers benefit from ChatGPT's documented web browsing."
    },
    {
      "title": "Company background and founding",
      "toolA": "ChatGPT is built by OpenAI, founded in 2015.",
      "toolB": "Claude is built by Anthropic, founded in 2021.",
      "whyItMatters": "Company history and stated focus can factor into procurement and vendor-trust decisions for regulated or risk-conscious buyers.",
      "benefitsWho": "Buyers weighing vendor maturity against a newer, safety-focused research company can use this as one input into a purchasing decision."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Conversation",
      "rows": [
        {
          "feature": "Conversational chat",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Persistent memory across chats",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Extended context for long documents and conversations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Claude explicitly documents handling of long documents and conversation histories; not listed as a distinct feature for ChatGPT."
        }
      ]
    },
    {
      "group": "Multimodal Input and Output",
      "rows": [
        {
          "feature": "Image understanding (upload and analyze)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Image generation and editing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Voice mode",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "File and document analysis",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Coding and Development",
      "rows": [
        {
          "feature": "In-chat code execution and data file analysis",
          "toolA": "available",
          "toolB": "limited",
          "note": "Claude's documented capability is writing, explaining, debugging, and refactoring code; it does not document a sandboxed code-run/data-analysis feature the way ChatGPT's Code interpreter does."
        },
        {
          "feature": "Agentic terminal/IDE coding tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Claude Code integrates into terminal and IDE workflows; no equivalent documented for ChatGPT."
        },
        {
          "feature": "Developer API",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Research and Information Retrieval",
      "rows": [
        {
          "feature": "Web browsing / live information retrieval",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Citing sources for retrieved web content",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT's web browsing feature explicitly cites sources; Claude's documented features don't include web browsing or source citation for live content."
        }
      ]
    },
    {
      "group": "Personalization and Custom Assistants",
      "rows": [
        {
          "feature": "Projects (grouping chats, files, instructions)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No-code custom assistant builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT's Custom GPTs let users configure a tailored assistant; no equivalent documented for Claude."
        },
        {
          "feature": "Dedicated content-iteration workspace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Claude's Artifacts provide a side panel for iterating on generated content; not documented for ChatGPT."
        }
      ]
    },
    {
      "group": "Platform Availability",
      "rows": [
        {
          "feature": "Web app",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "iOS app",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Android app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ChatGPT's documented tags don't list an Android app; Claude's tags explicitly include Android."
        },
        {
          "feature": "Desktop app (Mac/Windows)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Claude's documented pros explicitly mention Mac and Windows desktop apps; not listed for ChatGPT."
        }
      ]
    },
    {
      "group": "Plans and Team Administration",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Team plan with admin console and billing controls",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Enterprise plan with custom pricing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Data not used for model training by default (stated plan feature)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT's Team plan explicitly lists this guarantee; Claude's Team plan description does not state it."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, ChatGPT or Claude?",
      "answer": "Both start with a free tier and price their first paid plan at $20 per month, ChatGPT Plus and Claude Pro, so there's no documented price difference at the entry paid tier; differences show up in what each plan includes rather than in the price itself."
    },
    {
      "question": "Can Claude generate images like ChatGPT can?",
      "answer": "Not based on documented features: ChatGPT explicitly supports generating and editing images from a text description, while Claude's documented image feature is limited to understanding and analyzing uploaded images."
    },
    {
      "question": "Does ChatGPT or Claude have a dedicated coding tool for developers?",
      "answer": "Claude does, in the form of Claude Code, an agentic tool built to integrate into terminal and IDE workflows, while ChatGPT's documented coding feature is an in-chat Code interpreter for writing, running, and debugging code."
    },
    {
      "question": "Is there a voice mode in Claude the way there is in ChatGPT?",
      "answer": "ChatGPT documents a dedicated voice mode for real-time spoken conversation; Claude's documented feature list does not include an equivalent voice mode."
    },
    {
      "question": "Which tool has more native apps available?",
      "answer": "Based on documented platform tags, Claude has broader native app coverage with web, iOS, Android, Mac, and Windows apps, while ChatGPT's documented tags cover web, iOS, and API access."
    },
    {
      "question": "Can I build a custom AI assistant with ChatGPT or Claude?",
      "answer": "ChatGPT supports this through Custom GPTs, which let users configure a tailored assistant with specific instructions, knowledge files, and tools; Claude's documented features do not include an equivalent no-code custom-assistant builder."
    }
  ]
};

export default chatgptVsClaudeContent;
