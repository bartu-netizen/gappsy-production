import type { RoundupContent } from './types';

const krakendVsTraefikHubVsTykContent: RoundupContent = {
  "verdict": "These three open-source-rooted API gateways differ most on protocol breadth, Kubernetes dependency, and how AI traffic is governed, so the right choice depends on your architecture rather than any single 'best' answer. KrakenD stands out for bundling a dedicated multi-LLM AI Gateway directly into its Enterprise tier at no extra license cost, and for Enterprise pricing that isn't tied to API count or traffic volume. Traefik Hub is built specifically around Kubernetes-native, GitOps-first API publishing on top of the open-source Traefik Proxy. Tyk offers the widest documented protocol support (REST, GraphQL, TCP, and gRPC) in a fully free, self-hostable open-source core, with commercial tiers layered on only when you need the dashboard, developer portal, or control plane.",
  "bestFor": {
    "krakend": "Engineering teams that want a high-throughput, declarative, no-plugin-code Go gateway and need to govern LLM/AI traffic through a built-in AI Gateway without paying for a separate product.",
    "traefik-hub": "Platform teams already running Kubernetes and GitOps workflows who want to extend Traefik Proxy, or even a non-Traefik ingress controller like NGINX, with centralized API management and a self-serve developer portal.",
    "tyk": "Teams that want to self-host a fully-featured, protocol-diverse gateway (REST, GraphQL, TCP, gRPC) for free indefinitely, upgrading to a commercial tier only when they need the management dashboard and developer portal."
  },
  "highlights": [
    {
      "title": "KrakenD is the only one with a documented built-in AI Gateway",
      "description": "KrakenD Enterprise bundles secure multi-LLM routing (OpenAI, Anthropic's Claude, Gemini, Mistral, or self-hosted models) with token quotas and prompt guardrails at no extra license cost, a capability not documented for Traefik Hub or Tyk.",
      "toolSlugs": [
        "krakend"
      ]
    },
    {
      "title": "Traefik Hub is built around Kubernetes and GitOps specifically",
      "description": "Traefik Hub markets itself as a Kubernetes-native, GitOps-compliant way to publish and govern APIs, more explicitly tied to that infrastructure model than either KrakenD or Tyk.",
      "toolSlugs": [
        "traefik-hub"
      ]
    },
    {
      "title": "Tyk's free open-source core supports the broadest protocol range",
      "description": "Tyk's Gateway is documented to support REST, GraphQL, TCP, and gRPC without a commercial license, a wider protocol spread than what's documented for KrakenD's free Community Edition.",
      "toolSlugs": [
        "tyk"
      ]
    },
    {
      "title": "KrakenD and Tyk both offer a genuinely free, unrestricted open-source gateway",
      "description": "KrakenD Community Edition and Tyk's open-source Gateway are both fully free and production-capable. Traefik Hub's free Application Proxy tier is essentially plain Traefik Proxy, without the API-management features that define Traefik Hub itself.",
      "toolSlugs": [
        "krakend",
        "traefik-hub",
        "tyk"
      ]
    },
    {
      "title": "Pricing philosophy differs across all three",
      "description": "KrakenD Enterprise pricing is explicitly decoupled from API count or traffic volume, Tyk's Core tier is consumption-based while Professional is flat-rate for unlimited APIs and requests, and Traefik Hub's paid tiers are entirely custom-quoted with no published structure.",
      "toolSlugs": [
        "krakend",
        "traefik-hub",
        "tyk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core gateway capabilities",
      "rows": [
        {
          "feature": "Free, self-hostable open-source core",
          "statuses": {
            "krakend": "available",
            "traefik-hub": "limited",
            "tyk": "available"
          },
          "note": "Traefik Hub's free tier is Traefik Proxy itself, which lacks the API-management features that define the paid Hub product."
        },
        {
          "feature": "Declarative, no-plugin-code configuration",
          "statuses": {
            "krakend": "available",
            "traefik-hub": "not-documented",
            "tyk": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Protocol support",
      "rows": [
        {
          "feature": "GraphQL support",
          "statuses": {
            "krakend": "not-documented",
            "traefik-hub": "not-documented",
            "tyk": "available"
          }
        },
        {
          "feature": "gRPC support",
          "statuses": {
            "krakend": "available",
            "traefik-hub": "not-documented",
            "tyk": "available"
          },
          "note": "KrakenD's gRPC support is part of its Enterprise edition."
        }
      ]
    },
    {
      "group": "AI and governance",
      "rows": [
        {
          "feature": "Built-in multi-LLM AI Gateway",
          "statuses": {
            "krakend": "available",
            "traefik-hub": "not-documented",
            "tyk": "not-documented"
          }
        },
        {
          "feature": "SSO, RBAC, or advanced authentication (LDAP/JWT/OAuth/OIDC/mTLS)",
          "statuses": {
            "krakend": "available",
            "traefik-hub": "available",
            "tyk": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Kubernetes-native / GitOps-first workflow",
          "statuses": {
            "krakend": "not-documented",
            "traefik-hub": "available",
            "tyk": "not-documented"
          }
        },
        {
          "feature": "Developer portal included",
          "statuses": {
            "krakend": "not-documented",
            "traefik-hub": "available",
            "tyk": "available"
          },
          "note": "Traefik Hub includes this in its API Management tier; Tyk includes it in its commercial Core/Professional/Enterprise tiers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a built-in AI Gateway for LLM traffic?",
      "answer": "KrakenD. Its Enterprise edition bundles an AI Gateway module that securely routes and governs calls to providers like OpenAI, Anthropic's Claude, Gemini, and Mistral, with token quotas and prompt guardrails, at no extra license cost. This isn't a documented feature of Traefik Hub or Tyk."
    },
    {
      "question": "Which is the best fit for a team that isn't running Kubernetes?",
      "answer": "KrakenD or Tyk are better fits, since neither is described as Kubernetes-native. Traefik Hub's value proposition is explicitly built around Kubernetes-native, GitOps-compliant API publishing, so teams outside that environment would get less out of it."
    },
    {
      "question": "Which one is genuinely free to self-host with no artificial limits?",
      "answer": "Both KrakenD (Community Edition, Apache 2.0) and Tyk (open-source Gateway, MPL 2.0) are documented as fully free and production-capable to self-host. Traefik Hub's free Application Proxy tier is plain Traefik Proxy and does not include the API-management features of Traefik Hub itself."
    },
    {
      "question": "Do any of these three publish transparent enterprise pricing?",
      "answer": "No, none of the three publishes exact enterprise pricing; all require a sales conversation for their top commercial tiers. KrakenD differentiates itself by stating its Enterprise pricing isn't tied to API count or traffic volume, and offers a free two-month trial to evaluate the tier before committing."
    },
    {
      "question": "Which gateway supports GraphQL natively?",
      "answer": "Tyk is the only one of the three with documented native GraphQL support, alongside REST, TCP, and gRPC, in its open-source Gateway."
    },
    {
      "question": "Can I use Traefik Hub without switching my ingress controller to Traefik?",
      "answer": "Yes. Traefik Hub is documented to work with third-party ingress controllers, including NGINX, not just Traefik's own ingress, so teams can add API management without changing their existing ingress layer."
    }
  ]
};

export default krakendVsTraefikHubVsTykContent;
