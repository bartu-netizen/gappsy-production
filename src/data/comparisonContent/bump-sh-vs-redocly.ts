import type { ToolComparisonContent } from './types';

const bumpShVsRedoclyContent: ToolComparisonContent = {
  "verdict": "Both are API documentation platforms with paid tiers and no permanent free plan for their hosted products, but they emphasize different lifecycle stages. Bump.sh centers on breaking-change detection and PR-level diffs for API evolution, while Redocly centers on a modular product suite — Reunite, Redoc, Revel, and Reef — for design review, hosting, developer portals, and internal API governance, built around its free, widely used open-source Redoc renderer.",
  "bestForToolA": "Bump.sh suits teams whose priority is catching breaking API changes and previewing spec diffs on every pull request, with pricing starting at $50/month for the Basic plan.",
  "bestForToolB": "Redocly suits teams that want a modular documentation stack, from the free open-source Redoc renderer up through Realm's per-seat Pro ($10/seat/month) and Enterprise ($24/seat/month) tiers with AI search and MCP servers.",
  "whoNeedsBoth": "A team could self-host the free, open-source Redoc renderer for a public API reference while using Bump.sh for internal breaking-change detection and PR previews on the underlying spec, since Redoc alone doesn't include Bump.sh's diff/preview workflow.",
  "keyDifferences": [
    {
      "title": "Free/Open-Source Option",
      "toolA": "Bump.sh has no free tier or open-source component documented.",
      "toolB": "Redocly's underlying Redoc renderer is free and open-source, with over 1M weekly npm downloads, and can be used standalone.",
      "whyItMatters": "An open-source component lets teams adopt core rendering technology without any vendor spend.",
      "benefitsWho": "Developers wanting a free, self-hostable OpenAPI reference renderer benefit from Redoc."
    },
    {
      "title": "Pricing Model",
      "toolA": "Bump.sh prices per plan tier regardless of seat count: $50/month Basic includes 3 internal users, $250/month Pro includes 5 internal users.",
      "toolB": "Redocly prices per seat: $10/seat/month Pro, $24/seat/month Enterprise.",
      "whyItMatters": "Per-seat versus flat-tier pricing scales very differently as a team grows.",
      "benefitsWho": "Small teams with few internal users may find Bump.sh's flat tiers more predictable; larger teams with variable headcount may prefer Redocly's per-seat model."
    },
    {
      "title": "Breaking-Change Detection",
      "toolA": "Bump.sh automatically flags breaking changes with PR diffs and live previews.",
      "toolB": "Redocly's documented feature list does not include automated breaking-change detection.",
      "whyItMatters": "Automated detection prevents shipping backward-incompatible API changes unnoticed.",
      "benefitsWho": "API teams with strict compatibility guarantees benefit from Bump.sh's built-in detection."
    },
    {
      "title": "AI Search & MCP Availability",
      "toolA": "Bump.sh includes MCP server deployment (managed or on-premise) starting on its $50/month Basic plan.",
      "toolB": "Redocly gates AI Search and MCP Servers behind its $24/seat/month Enterprise plan.",
      "whyItMatters": "Access to AI/MCP features at a lower price point matters for teams building AI-agent integrations early.",
      "benefitsWho": "Smaller teams wanting MCP access without an Enterprise contract benefit from Bump.sh's inclusion at the entry tier."
    },
    {
      "title": "Product Modularity",
      "toolA": "Bump.sh is a single unified plan structure without separate add-on products.",
      "toolB": "Redocly sells modular add-ons — Reunite for design review, Revel for developer portals, Reef for internal governance — priced separately per seat.",
      "whyItMatters": "Modular pricing lets teams pay only for the specific capabilities they need, but can complicate budgeting.",
      "benefitsWho": "Teams that only need one specific capability (e.g., just a developer portal) benefit from Redocly's modular add-ons."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation Hosting",
      "rows": [
        {
          "feature": "Hosted doc portal",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Open-source/self-hostable renderer",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Redoc, free standalone"
        },
        {
          "feature": "Mock servers",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom domain",
          "toolA": "available",
          "toolB": "available",
          "note": "Redocly via Reunite"
        },
        {
          "feature": "Spec format support",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh: OpenAPI/AsyncAPI/Arazzo; Redocly: OpenAPI/GraphQL/AsyncAPI/SOAP"
        }
      ]
    },
    {
      "group": "API Governance & Change Management",
      "rows": [
        {
          "feature": "Breaking change detection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PR diff / preview",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Design review tooling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Redocly Reunite: side-by-side visual diffs"
        },
        {
          "feature": "Internal API catalog / governance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Redocly Reef, add-on"
        },
        {
          "feature": "MCP servers",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh from Basic plan ($50/mo); Redocly Enterprise only ($24/seat/mo)"
        },
        {
          "feature": "AI-powered search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Redocly Enterprise only"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Redoc renderer free standalone; hosted Realm platform is not free"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh Basic $50/month flat; Redocly Pro $10/seat/month"
        },
        {
          "feature": "Enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh: contact sales; Redocly: $24/seat/month or custom Enterprise+"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh: 14-day Pro trial; Redocly: 30-day trial on Pro & Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Redocly free?",
      "answer": "The underlying Redoc renderer is free and open-source and can be used standalone. The hosted Realm platform (Pro/Enterprise) is a paid product, though it includes a 30-day free trial."
    },
    {
      "question": "Does Bump.sh have an open-source component?",
      "answer": "This is not documented in Bump.sh's available facts; it appears to be a fully commercial product with a free trial rather than an open-source offering."
    },
    {
      "question": "How is pricing structured differently between the two?",
      "answer": "Redocly prices per seat ($10/seat/month Pro, $24/seat/month Enterprise). Bump.sh prices per plan tier with a fixed user allowance ($50/month Basic includes 3 internal users)."
    },
    {
      "question": "Which tool includes AI search?",
      "answer": "Redocly offers AI Search, but only on its $24/seat/month Enterprise plan. Bump.sh does not document an AI search feature."
    },
    {
      "question": "Does Bump.sh detect breaking changes automatically?",
      "answer": "Yes, this is a core Bump.sh feature — it flags breaking changes and shows diffs and live previews on every pull request."
    },
    {
      "question": "What are Redocly's modular add-on products?",
      "answer": "Redocly sells Reunite (design review), Redoc (the open-source renderer), Revel (developer hub/onboarding), and Reef (internal API catalog and governance) as modular components of its Realm platform."
    }
  ]
};

export default bumpShVsRedoclyContent;
