import type { ToolComparisonContent } from './types';

const konnectzitVsNodeRedContent: ToolComparisonContent = {
  "verdict": "KonnectzIT is a commercial no-code SaaS automation platform connecting cloud apps like CRMs, email, and payment platforms through a visual builder, with a free-forever tier and paid plans from $15/month. Node-RED is a completely free, open-source, self-hosted visual flow tool for wiring together hardware, APIs, and services, with particular strength in IoT and edge deployment on devices like Raspberry Pi and Arduino. The right pick depends on whether you're automating SaaS-to-SaaS workflows without hosting anything yourself (KonnectzIT) or building flows that may touch hardware/edge devices and are comfortable self-hosting a Node.js runtime (Node-RED).",
  "bestForToolA": "KonnectzIT suits small businesses that want a hosted, no-code way to connect 400+ CRMs, email, payment, and scheduling apps with unlimited workflows even on the free plan.",
  "bestForToolB": "Node-RED suits developers and hobbyists building IoT/edge automations or custom integrations who want a free, self-hosted tool with 5,000+ community nodes and support for devices like Raspberry Pi and Arduino.",
  "whoNeedsBoth": "A small business could use KonnectzIT to automate its cloud CRM, email, and payment workflows while a technical team member separately runs Node-RED to wire together in-house IoT sensors or hardware devices — the two rarely overlap since KonnectzIT targets hosted SaaS connections and Node-RED targets hardware/edge flows.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "KonnectzIT is a hosted SaaS platform with no self-hosting required.",
      "toolB": "Node-RED has no official Node-RED-run cloud hosting; it must be self-hosted via Docker/Node.js or run on FlowFuse, AWS, or Microsoft Azure.",
      "whyItMatters": "Determines whether a team needs to manage its own server or runtime.",
      "benefitsWho": "Non-technical small-business users benefit from KonnectzIT's fully hosted model."
    },
    {
      "title": "Pricing Structure",
      "toolA": "KonnectzIT has a free-forever plan with unlimited Konnectz, then Pro at $15/month, Team at $39/month, and Agency at $59/month.",
      "toolB": "Node-RED is completely free and open source with no paid tiers.",
      "whyItMatters": "Affects total cost of ownership as usage or team size scales.",
      "benefitsWho": "Budget-conscious developers who can self-host benefit from Node-RED's zero cost; teams wanting paid collaboration tiers benefit from KonnectzIT's paid plans."
    },
    {
      "title": "App/Node Library Size",
      "toolA": "KonnectzIT's library covers 400+ apps across CRMs, email, communication, payments, calendars, project management, scheduling, and storage.",
      "toolB": "Node-RED has a much larger ecosystem of 5,000+ community-built nodes and flows.",
      "whyItMatters": "A bigger library reduces the need for custom API/webhook connections.",
      "benefitsWho": "Users needing niche or hardware-specific integrations benefit from Node-RED's larger node count."
    },
    {
      "title": "Target Use Case",
      "toolA": "KonnectzIT is positioned primarily for small businesses automating repetitive SaaS/CRM/marketing processes.",
      "toolB": "Node-RED is built for wiring together hardware, APIs, and online services, and explicitly supports edge/IoT deployment on Raspberry Pi, BeagleBone Black, Arduino, and Android.",
      "whyItMatters": "One is a business-process automation tool, the other a general-purpose flow and hardware tool.",
      "benefitsWho": "IoT builders and hardware tinkerers benefit from Node-RED; office and marketing teams benefit from KonnectzIT."
    },
    {
      "title": "Governance",
      "toolA": "KonnectzIT's founding year and company background are not independently documented.",
      "toolB": "Node-RED is governed by the OpenJS Foundation, created in 2013 by Nick O'Leary and Dave Conway-Jones, with FlowFuse as its current active sponsor.",
      "whyItMatters": "Foundation governance signals long-term project stability for open-source adopters.",
      "benefitsWho": "Enterprises vetting open-source supply-chain risk benefit from Node-RED's documented OpenJS Foundation governance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation & Workflow",
      "rows": [
        {
          "feature": "Visual drag-and-drop builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Unlimited workflows on free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "KonnectzIT: unlimited Konnectz on Free plan; Node-RED entirely free"
        },
        {
          "feature": "API and webhook connections",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No technical setup required",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Node-RED requires self-hosting"
        }
      ]
    },
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Hosted/managed service",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Node-RED relies on third-party sponsor FlowFuse for commercial hosting"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Edge/IoT device support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Raspberry Pi, BeagleBone, Arduino, Android"
        },
        {
          "feature": "Cloud deployment options",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Docker, FlowFuse, AWS, Azure"
        }
      ]
    },
    {
      "group": "Ecosystem & Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "KonnectzIT: Free-forever plan; Node-RED: entirely free"
        },
        {
          "feature": "App/node library size",
          "toolA": "available",
          "toolB": "available",
          "note": "KonnectzIT: 400+ apps; Node-RED: 5,000+ nodes"
        },
        {
          "feature": "Paid support tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "KonnectzIT: $15-$59/month"
        },
        {
          "feature": "Foundation governance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenJS Foundation"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is KonnectzIT free?",
      "answer": "KonnectzIT offers a free-forever plan with unlimited Konnectz (workflows), alongside paid Pro ($15/month), Team ($39/month), and Agency ($59/month) plans."
    },
    {
      "question": "Is Node-RED free?",
      "answer": "Yes, Node-RED is free and open source, distributed via npm."
    },
    {
      "question": "Which has more integrations, KonnectzIT or Node-RED?",
      "answer": "Node-RED has a larger ecosystem with 5,000+ community-built nodes, compared to KonnectzIT's 400+ app library."
    },
    {
      "question": "Do I need to host Node-RED myself?",
      "answer": "Yes. Node-RED can be self-hosted via Docker or Node.js, or run on FlowFuse, AWS, or Microsoft Azure; there is no official Node-RED-run cloud hosting."
    },
    {
      "question": "Can KonnectzIT connect to IoT devices?",
      "answer": "This isn't documented. KonnectzIT's stated app library covers CRMs, email, payments, calendars, project management, scheduling, and storage tools, not hardware/IoT connections."
    },
    {
      "question": "Who governs Node-RED?",
      "answer": "Node-RED is governed by the OpenJS Foundation, with FlowFuse as its current active sponsor, and remains led by its original creators."
    }
  ]
};

export default konnectzitVsNodeRedContent;
