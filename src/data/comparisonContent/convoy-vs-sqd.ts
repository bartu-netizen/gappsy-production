import type { ToolComparisonContent } from './types';

const convoyVsSqdContent: ToolComparisonContent = {
  "verdict": "Convoy is an open-source and cloud webhooks gateway for sending, receiving, and managing webhook events reliably, with a free Community edition and a $999/month self-hosted Premium tier; SQD is a blockchain data provider offering real-time and historical data across 225+ networks via a free public API or enterprise data portals. Convoy solves webhook delivery and reliability, while SQD solves blockchain data access -- different infrastructure layers that could be chained together in a Web3 event pipeline.",
  "bestForToolA": "Convoy fits engineering teams that need reliable webhook infrastructure -- incoming and outgoing event delivery with automatic retries, payload signing, and SSRF protection -- whether self-hosted for free on the Community edition or via Convoy Cloud.",
  "bestForToolB": "SQD fits teams and applications that need real-time or historical blockchain data across a large number of networks (225+), from a free public API up to dedicated enterprise data portals.",
  "whoNeedsBoth": "A Web3 application could use SQD to pull blockchain event data and then route resulting notifications to downstream services reliably through Convoy's webhook gateway, with automatic retries and payload signing.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Convoy manages the reliable sending, receiving, and delivery of webhook events, including automatic retries and payload signing.",
      "toolB": "SQD provides blockchain data itself across more than 225 networks.",
      "whyItMatters": "Convoy is event-delivery infrastructure, while SQD is a blockchain data source -- they address different parts of a data pipeline.",
      "benefitsWho": "Backend and platform teams needing reliable webhook delivery use Convoy; teams needing blockchain data use SQD."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Convoy has a free open-source Community edition, a $999/month self-hosted Premium plan, and custom Enterprise pricing; Cloud also offers a 14-day free trial.",
      "toolB": "SQD offers a free public API and paid dedicated enterprise data portals, with no other pricing figures published.",
      "whyItMatters": "Convoy's pricing ladder is explicit up to $999/month, giving buyers a concrete mid-tier reference point that SQD doesn't publish.",
      "benefitsWho": "Teams that want to budget precisely can use Convoy's published $999/month tier; teams comfortable with a coarser free-vs-enterprise split can use SQD."
    },
    {
      "title": "Reliability & Security Features",
      "toolA": "Convoy includes automatic retries, payload signing and verification with rolling secrets, and built-in SSRF attack prevention.",
      "toolB": "Not documented -- no equivalent reliability or security feature list is provided for SQD.",
      "whyItMatters": "Teams delivering webhooks at scale need documented retry and security guarantees, which Convoy provides explicitly.",
      "benefitsWho": "Engineering teams responsible for webhook uptime and security compliance."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Convoy is SOC 2 and GDPR compliant, with SSO/SAML support on higher tiers.",
      "toolB": "Not documented for SQD.",
      "whyItMatters": "Regulated industries or enterprise buyers often require SOC 2/GDPR attestations before adopting infrastructure, which only Convoy documents here.",
      "benefitsWho": "Enterprise and regulated buyers with compliance requirements."
    },
    {
      "title": "Self-Hosting Options",
      "toolA": "Convoy's Community edition is free and open source for self-hosting (Elastic License v2.0), with Premium self-hosted at $999/month.",
      "toolB": "Not documented whether SQD offers a self-hosted option; it's presented as an API/portal service.",
      "whyItMatters": "Teams wanting to run infrastructure entirely in-house have a documented free option with Convoy, unlike SQD.",
      "benefitsWho": "Teams with data-residency or infrastructure-control requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Webhook sending/receiving gateway",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Blockchain data (real-time/historical)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automatic retries for failed deliveries",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Security & Compliance",
      "rows": [
        {
          "feature": "Payload signing/verification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SSRF protection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2 / GDPR compliance",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Cost",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Convoy Community edition; SQD free public API"
        },
        {
          "feature": "Published mid-tier price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Convoy Premium is $999/month; SQD enterprise portals not priced publicly"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Convoy Community, Elastic License v2.0"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Convoy free like SQD's public API?",
      "answer": "Convoy's Community edition is free and open source for self-hosting; paid Premium ($999/month) and Enterprise tiers add features like RBAC, SSO, and priority support. SQD similarly offers a free public API alongside paid enterprise data portals."
    },
    {
      "question": "Do Convoy and SQD compete for the same use case?",
      "answer": "No -- Convoy is a webhook gateway for reliably sending and receiving events, while SQD is a blockchain data provider across 225+ networks; they address different infrastructure needs."
    },
    {
      "question": "Is Convoy SOC 2 compliant?",
      "answer": "Yes, Convoy is SOC 2 and GDPR compliant with SSO/SAML support on higher tiers; no comparable compliance certifications are documented for SQD."
    },
    {
      "question": "What license is Convoy's open-source code under?",
      "answer": "The Elastic License v2.0, rather than a fully permissive license."
    },
    {
      "question": "Could Convoy and SQD be used together?",
      "answer": "Plausibly -- a Web3 application could pull blockchain data from SQD and use Convoy to reliably deliver resulting event notifications to downstream services with automatic retries and payload signing."
    },
    {
      "question": "How many blockchain networks does SQD support?",
      "answer": "More than 225 networks, with both real-time and historical data available."
    }
  ]
};

export default convoyVsSqdContent;
