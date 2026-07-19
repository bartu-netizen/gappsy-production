import type { GroupComparisonContent } from './types';

const chatgptVsClaudeVsGrokContent: GroupComparisonContent = {
  "verdict": "ChatGPT, Claude, and Grok are all general-purpose AI chatbots with free tiers and developer APIs, but each leans into a different strength. ChatGPT still offers the broadest and most polished consumer feature set, from voice mode to Custom GPTs. Claude is the pick for developers who want agentic coding through Claude Code plus enterprise-grade compliance controls. Grok's differentiator is real-time integration with X, giving it access to live public conversation and breaking news that the other two don't natively pull from, though its pricing is split confusingly across standalone SuperGrok plans and separate X Premium bundles.",
  "bestFor": {
    "chatgpt": "Users who want the most full-featured, widely integrated consumer AI assistant across web, mobile, and desktop, with voice, image generation, and Custom GPTs.",
    "claude": "Developers and teams building agentic coding workflows through Claude Code who also need enterprise-grade compliance controls like SSO and audit logs.",
    "grok": "Users embedded in the X ecosystem who want real-time awareness of breaking news and public conversation alongside fast-moving frontier model releases."
  },
  "highlights": [
    {
      "title": "Grok's real-time X integration is unique",
      "description": "Grok has native access to live posts and trends on X, giving it up-to-date awareness of breaking news and public conversation that ChatGPT and Claude don't natively pull from.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "Claude Code targets agentic development",
      "description": "Claude Code lets Claude read, edit, and run code across a codebase from a terminal or IDE, a dedicated agentic coding surface deeper than what's documented for ChatGPT or Grok.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "ChatGPT has the broadest consumer feature surface",
      "description": "Voice mode, image generation, Custom GPTs, Projects, and sandboxed code execution are all bundled into one product, giving ChatGPT the widest range of built-in capabilities among the three.",
      "toolSlugs": [
        "chatgpt"
      ]
    },
    {
      "title": "Grok's pricing is fragmented",
      "description": "Grok access is split across standalone SuperGrok plans and separate X Premium bundles, which can make it harder to compare cost against ChatGPT's or Claude's single-track subscription tiers.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "All three ship a usable free tier",
      "description": "ChatGPT, Claude, and Grok each let users chat for free before hitting usage limits, though the caps and included capabilities differ meaningfully across the three.",
      "toolSlugs": [
        "chatgpt",
        "claude",
        "grok"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Model Access and Real-Time Data",
      "rows": [
        {
          "feature": "Native real-time social or news data integration",
          "statuses": {
            "chatgpt": "limited",
            "claude": "limited",
            "grok": "available"
          },
          "note": "ChatGPT and Claude offer general real-time web search; Grok has native access to live X posts and trends."
        },
        {
          "feature": "Voice mode",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "grok": "not-documented"
          }
        },
        {
          "feature": "Image or video generation",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "grok": "available"
          },
          "note": "Grok Imagine generates both images and short videos from text prompts."
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free tier chat access",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Entry-level paid tier under $15/month",
          "statuses": {
            "chatgpt": "available",
            "claude": "unavailable",
            "grok": "available"
          },
          "note": "ChatGPT Go is $8/month and Grok offers X Premium at $8/month or SuperGrok Lite at $10/month; Claude's cheapest paid plan, Pro, starts at $17/month."
        },
        {
          "feature": "Dedicated business or team plan",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "grok": "available"
          }
        }
      ]
    },
    {
      "group": "Developer and Enterprise",
      "rows": [
        {
          "feature": "Developer API",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Enterprise SSO and SCIM admin controls",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "grok": "not-documented"
          },
          "note": "Grok Business offers organizational deployment and team management, but SSO/SCIM isn't documented."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which gives the most real-time awareness of current events?",
      "answer": "Grok, because it has native access to live posts and trends on X, giving it up-to-date awareness of breaking news and public conversation. ChatGPT and Claude both offer general real-time web search but don't have that same native social-platform integration."
    },
    {
      "question": "Which has the cheapest entry-level paid plan?",
      "answer": "ChatGPT Go and Grok's X Premium both start at $8/month, with Grok's standalone SuperGrok Lite plan at $10/month. Claude's cheapest paid tier, Pro, starts at $17/month billed annually."
    },
    {
      "question": "Which is best for coding agents?",
      "answer": "Claude, through Claude Code, which is purpose-built for reading, editing, and running code across a codebase from a terminal or IDE. ChatGPT also includes coding-agent tools within its Plus tier."
    },
    {
      "question": "Do any of these have enterprise-grade admin controls?",
      "answer": "ChatGPT and Claude both document SSO and SCIM provisioning for enterprise customers. Grok offers a Grok Business plan for organizational deployment, but SSO/SCIM support isn't documented in the same way."
    },
    {
      "question": "How do content moderation approaches differ?",
      "answer": "Grok is known for a less-filtered personality and moderation approach that has drawn scrutiny compared to ChatGPT's and Claude's more conservative content guidelines."
    },
    {
      "question": "Is Grok's pricing simple to understand?",
      "answer": "Not particularly. Grok access is split across standalone SuperGrok plans (Lite, standard, and Heavy) and separate X Premium and Premium+ bundles, which can make direct cost comparisons against ChatGPT or Claude harder than a single-tier subscription."
    }
  ]
};

export default chatgptVsClaudeVsGrokContent;
