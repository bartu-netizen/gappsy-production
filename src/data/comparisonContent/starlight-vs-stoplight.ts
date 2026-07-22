import type { ToolComparisonContent } from './types';

const starlightVsStoplightContent: ToolComparisonContent = {
  "verdict": "Starlight is a free, open-source Astro-based framework for building documentation sites, while Stoplight is a paid, design-first platform for designing, mocking, and governing OpenAPI specifications, with documentation generation as one of several capabilities. They solve adjacent but distinct problems: Starlight publishes narrative and reference content, while Stoplight designs and governs the API contract itself.",
  "bestForToolA": "Teams that want a free, self-hosted, highly customizable documentation site with built-in search, i18n, and support for Markdown, MDX, and Markdoc, and are comfortable working with Astro.",
  "bestForToolB": "Teams doing OpenAPI-first API design who need a visual editor, automatic mock servers, style guide governance, and Git sync (GitHub, GitLab, Bitbucket, Azure) across a portfolio of APIs, especially with SSO and activity logs at the Pro Team tier ($362/month annual).",
  "whoNeedsBoth": "A platform team could design and govern its OpenAPI specs in Stoplight, then use Starlight to build the broader developer portal covering tutorials, guides, and changelogs that surrounds or links to the Stoplight-generated interactive API docs.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Starlight is free and open source, with no paid tiers.",
      "toolB": "Stoplight is freemium, starting at $44/month (annual, Basic plan, 3 users) up to Pro Team at $362/month (15 users), plus custom Enterprise pricing.",
      "whyItMatters": "Budget-conscious teams and collaboration-heavy teams face very different cost structures with these tools.",
      "benefitsWho": "Solo developers and small teams needing zero-cost publishing benefit from Starlight; organizations needing governance features accept Stoplight's paid tiers."
    },
    {
      "title": "Core Purpose",
      "toolA": "Starlight is a docs-site framework for authoring content in Markdown, MDX, or Markdoc, with built-in search and internationalization.",
      "toolB": "Stoplight is an API design platform centered on a visual OpenAPI/JSON Schema editor, automatic mock servers, and style guides.",
      "whyItMatters": "This determines whether you're publishing written content or designing and governing an API contract.",
      "benefitsWho": "Technical writing teams need Starlight's content tooling; API architects and platform teams need Stoplight's design tooling."
    },
    {
      "title": "Hosting Model",
      "toolA": "Starlight has no official hosted or managed offering; it must be deployed like any other Astro site.",
      "toolB": "Stoplight is a hosted SaaS platform with free and paid tiers, and also maintains open-source components (Spectral, Prism, Elements).",
      "whyItMatters": "Teams that don't want to manage deployment infrastructure need a hosted option.",
      "benefitsWho": "Teams wanting a managed API design workspace favor Stoplight; teams comfortable self-deploying static sites favor Starlight."
    },
    {
      "title": "Governance & Collaboration",
      "toolA": "Starlight has no built-in collaboration or governance layer since it is a static site framework, not a workspace.",
      "toolB": "Stoplight includes built-in and shared style guides, LDAP/SAML SSO, workspace groups, and activity logs on the Pro Team plan.",
      "whyItMatters": "Larger organizations managing many APIs need enforceable design standards across teams.",
      "benefitsWho": "API platform teams governing multiple APIs at scale benefit most from Stoplight's governance tools."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Starlight is fully free and open source with no user or project caps.",
      "toolB": "Stoplight's Free plan is capped at 1 user and 1 project.",
      "whyItMatters": "Growing teams will hit Stoplight's free-tier limits faster than they'll hit any limit in Starlight.",
      "benefitsWho": "Individual developers publishing docs benefit from Starlight's unlimited free use; teams evaluating Stoplight should expect to outgrow its free tier quickly."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation & Content",
      "rows": [
        {
          "feature": "Built-in full-text search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Starlight ships search out of the box"
        },
        {
          "feature": "Internationalization (i18n)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Markdown/MDX/Markdoc authoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Stoplight docs are generated from OpenAPI, not authored in Markdown"
        },
        {
          "feature": "Interactive API documentation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Framework UI components (React/Vue/Svelte)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "API Design & Governance",
      "rows": [
        {
          "feature": "Visual OpenAPI/JSON Schema editor",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automatic mock servers",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Style guides / API governance",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Shared style guides on Pro and Enterprise"
        },
        {
          "feature": "Reusable schemas/components across APIs",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Git sync (GitHub, GitLab, Bitbucket, Azure)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Collaboration & Access",
      "rows": [
        {
          "feature": "Free tier availability",
          "toolA": "available",
          "toolB": "available",
          "note": "Starlight unlimited; Stoplight capped at 1 user/1 project"
        },
        {
          "feature": "LDAP/SAML SSO",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pro Team plan"
        },
        {
          "feature": "Activity logs",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pro Team plan"
        },
        {
          "feature": "Multi-user seats included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "3 users Basic, 8 Startup, 15 Pro Team"
        },
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "limited",
          "note": "Only Spectral, Prism, and Elements are open source, not the full hosted platform"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Starlight a replacement for Stoplight's API design tools?",
      "answer": "No. Starlight is a documentation site framework built on Astro for publishing written content; it doesn't include an OpenAPI visual editor, mock servers, or style-guide governance the way Stoplight does."
    },
    {
      "question": "Does Stoplight offer a free plan?",
      "answer": "Yes, Stoplight has a Free plan for $0 limited to 1 user and 1 project, including the API editor, visual designer, interactive docs, and instant/local mock servers."
    },
    {
      "question": "Can Stoplight be self-hosted like Starlight?",
      "answer": "Not fully. Stoplight is a hosted SaaS platform; only its open-source components (Spectral, Prism, Elements) can be run independently, whereas Starlight is deployed entirely as a self-hosted Astro site."
    },
    {
      "question": "Which tool costs money?",
      "answer": "Starlight is free and open source. Stoplight is freemium, with paid plans starting at $44/month (annual) and custom Enterprise pricing."
    },
    {
      "question": "Do both tools generate API documentation?",
      "answer": "Stoplight generates interactive API documentation automatically from OpenAPI design work. Starlight can host any documentation content you write, including API reference pages, but it doesn't design or validate the API spec itself."
    },
    {
      "question": "Is Stoplight still actively maintained after the SmartBear acquisition?",
      "answer": "Yes. Stoplight's website and pricing remain active under the Stoplight brand, though the company now operates as part of SmartBear Software following an acquisition announced in 2023."
    }
  ]
};

export default starlightVsStoplightContent;
