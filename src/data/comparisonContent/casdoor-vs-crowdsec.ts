import type { ToolComparisonContent } from './types';

const casdoorVsCrowdsecContent: ToolComparisonContent = {
  "verdict": "Casdoor and CrowdSec are both free-to-start, open-source security tools, but they protect different things: Casdoor is an identity and access management (IAM) platform handling authentication via OAuth, OIDC, SAML, and LDAP, plus a built-in MCP server for AI agent management, while CrowdSec is a crowd-sourced threat intelligence platform that blocks malicious IPs using behavioral detection shared across a network of 70,000+ users. One manages who is allowed to log in; the other blocks attackers trying to break in from outside.",
  "bestForToolA": "Organizations building or consolidating authentication across multiple protocols (OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn) that want a self-hostable, open-source IAM platform with a native MCP server for tools like Claude Desktop and Cursor to manage identity via natural language.",
  "bestForToolB": "Teams wanting to block malicious IPs and mass exploitation attempts using crowd-sourced threat data, starting with a free Community Plan and scaling to premium blocklists (from $1,900/month) or an IP Reputation API (from $49/month).",
  "whoNeedsBoth": "A self-hosted infrastructure stack would commonly run both together: Casdoor handling authentication and access for legitimate users, while CrowdSec runs alongside it detecting and blocking malicious traffic and exploitation attempts at the network/firewall level — they protect the front door and the perimeter respectively.",
  "keyDifferences": [
    {
      "title": "Security Function",
      "toolA": "Casdoor is an identity and access management platform: it authenticates and authorizes users and AI agents across OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn, and MFA.",
      "toolB": "CrowdSec is a threat intelligence and IP-blocking platform: it detects malicious behavior and blocks attacking IPs using data shared across a network of 70,000+ users in 190+ countries.",
      "whyItMatters": "IAM and threat intelligence are distinct security disciplines — one governs legitimate access, the other blocks illegitimate access attempts.",
      "benefitsWho": "Security architects need both disciplines covered but by purpose-built tools rather than expecting either to do both jobs."
    },
    {
      "title": "AI Agent Integration",
      "toolA": "Casdoor includes a built-in MCP server that lets AI agents like Claude Desktop, Cursor, and VS Code Copilot manage Casdoor itself through natural language, plus OAuth 2.1 with Dynamic Client Registration for per-tool agent permissions.",
      "toolB": "CrowdSec's AI-agent-specific integration is not documented; its focus is behavioral threat detection and blocklists rather than AI agent management.",
      "whyItMatters": "As AI coding assistants become part of infrastructure management, native MCP support determines whether an AI agent can safely administer the tool itself.",
      "benefitsWho": "Teams already using AI coding assistants (Claude Desktop, Cursor, Copilot) for infrastructure administration."
    },
    {
      "title": "Pricing Model",
      "toolA": "Casdoor has no published pricing for any managed or commercial offering; it is free and open source to self-host, with no listed license cost.",
      "toolB": "CrowdSec has a free Community Plan plus multiple named paid tiers: IP Reputation API from $49/month, and Platinum Blocklists from $1,900/month, with Console Premium priced on inquiry.",
      "whyItMatters": "CrowdSec's tiered, named pricing lets a team pay only for the specific threat-intelligence depth it needs, while Casdoor's model is entirely self-hosted with no commercial tier to compare against.",
      "benefitsWho": "Teams wanting predictable, tiered threat-intelligence pricing benefit from CrowdSec's published tiers; teams wanting zero licensing cost benefit from Casdoor's fully free model."
    },
    {
      "title": "Network Effect / Data Scale",
      "toolA": "Casdoor's value comes from protocol breadth and 100+ built-in identity provider connectors (Google, GitHub, WeChat), not from a shared data network.",
      "toolB": "CrowdSec's core value is its crowd-sourced network: roughly 15 million daily signals aggregated with about 50% daily IP rotation across 70,000+ active users.",
      "whyItMatters": "CrowdSec's effectiveness scales with the size of its user network sharing threat data, which is a structurally different value driver than Casdoor's protocol/connector coverage.",
      "benefitsWho": "Organizations facing mass automated attacks benefit most from CrowdSec's network-scale detection; organizations with complex identity federation needs benefit most from Casdoor's protocol breadth."
    },
    {
      "title": "Notable Users",
      "toolA": "Casdoor lists notable users including Intel, VMware Harbor, Docker, Cisco, Microsoft, Alibaba, and Tencent.",
      "toolB": "CrowdSec does not list specific named enterprise customers in its documented materials, instead citing its 70,000+ user network and a claimed up to 95% reduction in mass exploitation attempts reaching protected systems.",
      "whyItMatters": "Named enterprise adopters can serve as a credibility signal during vendor evaluation, though both tools' open-source nature means broad usage isn't always centrally tracked.",
      "benefitsWho": "Buyers doing vendor reference checks may find Casdoor's named large-organization users useful as a validation signal."
    }
  ],
  "featureMatrix": [
    {
      "group": "Identity & Access (Casdoor)",
      "rows": [
        {
          "feature": "OAuth 2.0 / OIDC / SAML / LDAP support",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "MFA and WebAuthn",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "100+ identity provider connectors",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Built-in SaaS billing/subscription management",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Threat Intelligence (CrowdSec)",
      "rows": [
        {
          "feature": "Crowd-sourced IP reputation/blocklist",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Behavioral attack detection",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Firewall/CDN plug-and-play integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "IP Reputation API for on-demand lookups",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "From $49/month"
        }
      ]
    },
    {
      "group": "AI, Openness & Pricing",
      "rows": [
        {
          "feature": "Native MCP server for AI agent management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available",
          "note": "Both have open-source cores"
        },
        {
          "feature": "Free tier / self-hosting at no license cost",
          "toolA": "available",
          "toolB": "available",
          "note": "CrowdSec: Community Plan"
        },
        {
          "feature": "Published paid tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "CrowdSec: $49/mo to $1,900+/mo"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Casdoor and CrowdSec protect against the same threats?",
      "answer": "No. Casdoor is an identity and access management platform that authenticates and authorizes users and AI agents. CrowdSec is a threat intelligence platform that detects and blocks malicious IPs. They address different parts of a security stack."
    },
    {
      "question": "Is Casdoor free?",
      "answer": "Yes, Casdoor is open source and free to self-host, with no published pricing for any managed or commercial offering."
    },
    {
      "question": "Is CrowdSec free?",
      "answer": "The Community Plan is free and includes behavioral detection and automated response via the open-source Security Engine. Paid tiers include the IP Reputation API (from $49/month) and Platinum Blocklists (from $1,900/month)."
    },
    {
      "question": "Does Casdoor support AI agent management?",
      "answer": "Yes, Casdoor includes a built-in MCP server that lets AI agents like Claude Desktop, Cursor, and VS Code Copilot manage Casdoor through natural language, plus OAuth 2.1 with Dynamic Client Registration for per-tool agent permissions."
    },
    {
      "question": "How large is CrowdSec's threat data network?",
      "answer": "More than 70,000 active users across 190+ countries share roughly 15 million signals daily, with about 50% daily IP rotation."
    },
    {
      "question": "Would an organization use both Casdoor and CrowdSec?",
      "answer": "Yes, this is a plausible combination since they protect different layers: Casdoor manages authentication and access for legitimate users, while CrowdSec runs at the network/firewall level to detect and block malicious traffic."
    }
  ]
};

export default casdoorVsCrowdsecContent;
