import type { ToolComparisonContent } from './types';

const mintlifyVsScalarContent: ToolComparisonContent = {
  "verdict": "Mintlify centers on a polished web-editor documentation experience augmented with agent-readiness features like a dedicated MCP server and Agent Score, while Scalar bundles API documentation with an open-source API client, multi-language SDK generation, and an API spec registry. Both offer free tiers and MCP servers, but Scalar's free plan includes a request-testing client that Mintlify's does not.",
  "bestForToolA": "Mintlify suits teams prioritizing an agent-native documentation experience, with a free Starter plan that includes a custom domain, MCP server, and 10,000 AI credits per month, at a scale used by companies like Coinbase.",
  "bestForToolB": "Scalar suits API teams that want documentation combined with a built-in open-source API client and SDK generation in six languages, with Pro pricing at a public $72/month.",
  "whoNeedsBoth": "A team could publish reference docs on Mintlify to take advantage of its Agent Score feature for AI-agent readability, while separately using Scalar's open-source API Client internally for request testing, since Mintlify doesn't bundle a request client and Scalar doesn't document an equivalent agent-readability scoring feature.",
  "keyDifferences": [
    {
      "title": "Free Plan Depth",
      "toolA": "Mintlify's Starter plan ($0) includes full platform access, a custom domain, MCP server, API playground, and 10,000 AI credits per month.",
      "toolB": "Scalar's Free plan ($0) includes hosted docs, a built-in API client, 50 Agent Scalar credits, unlimited viewer seats, but only 1 editor seat.",
      "whyItMatters": "Free-tier limits determine how far a small team can go before needing to pay.",
      "benefitsWho": "Teams needing more AI credits without paying benefit from Mintlify's larger free allowance; teams needing an API client for free benefit from Scalar."
    },
    {
      "title": "Built-in API Client",
      "toolA": "Mintlify has no request-testing client; it offers an API Playground embedded in docs for interactive testing.",
      "toolB": "Scalar bundles an open-source, offline-first API client positioned as a Postman alternative.",
      "whyItMatters": "Teams that need a full request client, not just embedded doc testing, need this feature.",
      "benefitsWho": "Developers who want to test and debug API requests outside the docs context benefit from Scalar's bundled client."
    },
    {
      "title": "SDK Generation",
      "toolA": "Mintlify's feature list does not document SDK generation.",
      "toolB": "Scalar generates SDKs in TypeScript, Python, Golang, PHP, Java, and Ruby, at $100/month per additional language on Pro.",
      "whyItMatters": "API providers that ship client libraries need this capability built into their documentation platform.",
      "benefitsWho": "Teams distributing SDKs to external developers benefit from Scalar's generation feature."
    },
    {
      "title": "Pro Plan Pricing Transparency",
      "toolA": "Mintlify's Pro plan price is not publicly listed and requires sign-up to see cost.",
      "toolB": "Scalar's Pro plan is publicly listed at $72/month.",
      "whyItMatters": "Buyers comparing vendors often want upfront pricing before engaging sales.",
      "benefitsWho": "Budget-conscious teams evaluating options quickly benefit from Scalar's transparent pricing."
    },
    {
      "title": "Agent-Readiness Tooling",
      "toolA": "Mintlify has a dedicated Agent Score feature that assesses how well AI agents can read and use a site's documentation.",
      "toolB": "Scalar does not document an equivalent agent-readability scoring feature.",
      "whyItMatters": "As AI agents increasingly consume documentation, teams may want to measure and improve agent readability specifically.",
      "benefitsWho": "Documentation teams optimizing for AI-agent consumption benefit from Mintlify's Agent Score."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation Platform",
      "rows": [
        {
          "feature": "Web-based doc editor",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Scalar uses Markdown/MDX/OpenAPI with Git sync rather than a documented web editor"
        },
        {
          "feature": "Custom domain (free tier)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Scalar custom domains are Pro-only ($72/month)"
        },
        {
          "feature": "API testing embedded in docs",
          "toolA": "available",
          "toolB": "available",
          "note": "Mintlify: API Playground; Scalar: bundled API Client"
        },
        {
          "feature": "Git-based content sync",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Agent Features",
      "rows": [
        {
          "feature": "MCP server",
          "toolA": "available",
          "toolB": "available",
          "note": "Scalar's is Pro-plan only"
        },
        {
          "feature": "AI chat for doc readers",
          "toolA": "available",
          "toolB": "available",
          "note": "Mintlify: Pro and above"
        },
        {
          "feature": "Agent readability scoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mintlify's Agent Score"
        },
        {
          "feature": "AI credits on free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Mintlify: 10,000/month; Scalar: 50 Agent Scalar credits"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Pro plan price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mintlify Pro not publicly listed; Scalar Pro $72/month"
        },
        {
          "feature": "SDK generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Scalar: 6 languages"
        },
        {
          "feature": "Enterprise SSO/SCIM/RBAC",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Mintlify offer a free plan with an MCP server?",
      "answer": "Yes, Mintlify's Starter plan is free ($0) and includes full platform access, a custom domain, and an MCP server."
    },
    {
      "question": "Does Scalar include an API client for free?",
      "answer": "Yes, Scalar's Free plan includes a built-in, open-source, offline-first API client alongside hosted OpenAPI docs."
    },
    {
      "question": "Which is cheaper on the paid tier, Mintlify or Scalar?",
      "answer": "Scalar publishes its Pro price at $72/month. Mintlify's Pro plan price is not publicly listed and requires signing up to see the cost, so a direct comparison isn't possible from public information."
    },
    {
      "question": "Does Mintlify generate SDKs?",
      "answer": "SDK generation is not documented among Mintlify's features. Scalar generates SDKs in six languages (TypeScript, Python, Golang, PHP, Java, Ruby)."
    },
    {
      "question": "What is Mintlify's Agent Score?",
      "answer": "It's a feature that assesses how well AI agents can read and use a site's documentation, part of Mintlify's agent-native feature set alongside its MCP server."
    },
    {
      "question": "Which companies use Mintlify?",
      "answer": "Mintlify reports over 20,000 companies as users, including Anthropic, Amazon, AT&T, and Coinbase."
    }
  ]
};

export default mintlifyVsScalarContent;
