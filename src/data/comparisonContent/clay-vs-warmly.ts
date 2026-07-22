import type { ToolComparisonContent } from './types';

const clayVsWarmlyContent: ToolComparisonContent = {
  "verdict": "Clay and Warmly both use AI agents for go-to-market work, but they solve different problems: Clay is a usage-based data enrichment platform (Claygents, waterfall enrichment across 200+ providers) starting free and scaling to $167/month and up, while Warmly is a person-level website visitor identification and AI chat/retargeting platform with no free tier and plans starting at $10,000/year.",
  "bestForToolA": "Teams that want to build and enrich outbound lead lists using waterfall enrichment from 200+ data providers and no-code AI research agents (Claygents), starting on a free plan with 500 actions and 100 data credits per month.",
  "bestForToolB": "Teams focused on inbound: identifying anonymous website visitors at the person level and engaging them immediately through an AI chatbot, smart popups, or ad retargeting, with budget for a $10,000+/year commitment.",
  "whoNeedsBoth": "GTM teams running both outbound enrichment and inbound visitor identification with AI chat engagement may use them side by side, Clay to build and enrich prospect lists, Warmly to catch and convert anonymous site traffic, since neither documents the other's core capability.",
  "keyDifferences": [
    {
      "title": "Pricing model and entry point",
      "toolA": "Clay has a Free plan ($0/month, 500 actions, 100 data credits, unlimited seats and tables) and scales through Launch (from $167/month) and Growth (from $446/month) before Enterprise.",
      "toolB": "Warmly has no published free tier; its cheapest plan, AI Web-Deanonymization, starts at $10,000/year, rising to $30,000/year for AI Inbound Autopilot.",
      "whyItMatters": "The cost of entry differs by roughly three orders of magnitude, which shapes who can even trial each product.",
      "benefitsWho": "Startups and small teams evaluating Clay for free versus larger revenue teams with dedicated budget for Warmly."
    },
    {
      "title": "Primary data direction: outbound enrichment vs. inbound identification",
      "toolA": "Clay's Waterfall Enrichment pulls from 200+ external data providers to fill in contact and company records for outbound prospecting.",
      "toolB": "Warmly's Inbound Agent identifies visitors already on your website at the person level and engages them in real time.",
      "whyItMatters": "These serve opposite ends of the funnel, building lead lists versus converting existing traffic, so the choice depends on where a team's bottleneck is.",
      "benefitsWho": "Outbound-heavy SDR teams (Clay) versus inbound marketing/demand-gen teams (Warmly)."
    },
    {
      "title": "AI agent focus",
      "toolA": "Claygents are AI agents that research target companies and people using web data to fill in enrichment records.",
      "toolB": "Warmly's TAM Agent adds ML-based intent scoring and automated buying-committee identification on top of visitor and firmographic data.",
      "whyItMatters": "Both use AI agents, but Clay's are oriented around data collection while Warmly's are oriented around account prioritization and engagement.",
      "benefitsWho": "Teams needing custom, no-code data-gathering workflows (Clay) versus teams needing automated account scoring and routing from web traffic (Warmly)."
    },
    {
      "title": "Engagement and retargeting capability",
      "toolA": "Clay's Sequencer provides native email sequencing and automation, and its Audiences feature syncs first- and third-party data to ad platforms (Growth plan and above).",
      "toolB": "Warmly directly engages identified visitors through an AI chatbot, smart popups, and ad retargeting synced to LinkedIn and email campaigns.",
      "whyItMatters": "For Warmly, real-time engagement of identified visitors is the core product; for Clay, ad-audience sync is one feature among many.",
      "benefitsWho": "Teams wanting a dedicated inbound-engagement product (Warmly) versus one enrichment platform with an ad-sync feature (Clay)."
    },
    {
      "title": "Access channels",
      "toolA": "Clay is accessed as a table-based web app with API/webhook access on the Growth plan and above.",
      "toolB": "Warmly explicitly states it is accessible via app, API, and MCP for custom workflows.",
      "whyItMatters": "Warmly's documented MCP access may matter for teams building AI-assistant-driven workflows; Clay's facts do not mention MCP.",
      "benefitsWho": "Teams building custom AI-agent integrations who specifically need MCP support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Outbound data enrichment (waterfall/multi-provider)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Website visitor identification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI research/scoring agents",
          "toolA": "available",
          "toolB": "available",
          "note": "Clay: Claygents; Warmly: TAM Agent"
        },
        {
          "feature": "Intent signal tracking",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Engagement & Outreach",
      "rows": [
        {
          "feature": "Native email sequencing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI chatbot for engagement",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Ad platform sync/retargeting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clay: Growth plan+"
        },
        {
          "feature": "Meeting booking/lead routing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published entry-level self-serve price",
          "toolA": "available",
          "toolB": "available",
          "note": "Clay: $167/mo; Warmly: $10,000/yr"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Clay: Growth plan+"
        },
        {
          "feature": "MCP access",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Clay and Warmly both offer a free plan?",
      "answer": "Clay does, its Free plan includes 500 actions, 100 data credits, and unlimited seats and tables (up to 200 rows per table). Warmly has no published free tier; its cheapest plan starts at $10,000/year."
    },
    {
      "question": "What is the core difference between Clay and Warmly?",
      "answer": "Clay is a data enrichment platform that pulls from 200+ providers to build and enrich outbound lead lists using AI research agents called Claygents. Warmly identifies anonymous visitors on your own website at the person level and engages them via an AI chatbot and retargeting."
    },
    {
      "question": "What are Claygents and the TAM Agent?",
      "answer": "Claygents are Clay's AI agents that research companies and people using web data. Warmly's TAM Agent builds dynamic audiences using AI ICP tiering, buying-committee identification, and ML-based intent scoring."
    },
    {
      "question": "Can either platform sync data to ad platforms?",
      "answer": "Yes. Clay's Audiences feature (Growth plan and above) syncs first- and third-party data to LinkedIn, Meta, and Google Ads. Warmly syncs identified visitors directly to LinkedIn and email retargeting campaigns as a core feature."
    },
    {
      "question": "How is each platform priced at the top end?",
      "answer": "Clay's Enterprise plan is custom-priced with 100,000+ actions/month and features like SSO, RBAC, and data warehouse integrations. Warmly's top plan, AI Inbound Autopilot, is $30,000/year and adds unlimited AI Studio Agents and autopilot goal-setting."
    },
    {
      "question": "Does either tool support MCP for AI-assistant workflows?",
      "answer": "Warmly explicitly states it is accessible via app, API, and MCP. Clay's own facts do not mention MCP support."
    }
  ]
};

export default clayVsWarmlyContent;
