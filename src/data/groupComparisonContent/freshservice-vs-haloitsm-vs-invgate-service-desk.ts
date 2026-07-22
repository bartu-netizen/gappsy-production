import type { GroupComparisonContent } from './types';

const freshserviceVsHaloitsmVsInvgateServiceDeskContent: GroupComparisonContent = {
  "verdict": "Freshservice, HaloITSM, and InvGate Service Desk all deliver ITIL-aligned incident, change, and problem management, but they package and price that functionality very differently. HaloITSM bundles nearly every ITSM module, including CMDB and its Halo AI assistant, into one per-agent quote with flexible on-premise or private-cloud deployment, though that quote is never published. Freshservice offers the broadest reach into enterprise service management and a clear tiered price list through its Pro plan, but its deepest Freddy AI capabilities and full ITIL process set are concentrated in the pricier Enterprise tier. InvGate Service Desk stands out for publishing its pricing outright and promising a fast, low-code rollout, making it a strong fit for growing IT teams that prioritize budget certainty over the very deepest enterprise feature set.",
  "bestFor": {
    "freshservice": "IT teams that want the broadest ITIL process coverage plus a natural extension into enterprise service management for non-IT departments, backed by a large partner and integration ecosystem.",
    "haloitsm": "Organizations that want essentially all ITIL modules, including CMDB and AI-assisted triage, in a single all-inclusive per-agent price with flexible on-premise or private-cloud deployment.",
    "invgate-service-desk": "Growing IT teams that want transparent published pricing, unlimited end users on every plan, and a fast, low-code implementation without a lengthy sales cycle."
  },
  "highlights": [
    {
      "title": "Transparent Pricing vs Custom Quotes",
      "description": "InvGate Service Desk publishes its per-agent pricing outright and Freshservice publishes tiers up through Pro, while HaloITSM keeps its per-agent rate behind a sales quote even though third parties estimate it around $50 to $70 per agent per month.",
      "toolSlugs": [
        "freshservice",
        "haloitsm",
        "invgate-service-desk"
      ]
    },
    {
      "title": "All-Inclusive Licensing vs Tiered Add-Ons",
      "description": "HaloITSM bundles CMDB, change management, and its AI assistant into one price with no separate module fees, while Freshservice and InvGate Service Desk gate change management, advanced AI, and channel integrations behind higher-priced tiers.",
      "toolSlugs": [
        "freshservice",
        "haloitsm",
        "invgate-service-desk"
      ]
    },
    {
      "title": "AI-Assisted Ticket Triage, at a Cost",
      "description": "Each platform ships an AI layer, Freddy AI, Halo AI, and the AI Service Agent, but Freshservice and InvGate Service Desk reserve their fullest AI capability for Enterprise or Pro-and-above plans, while HaloITSM includes Halo AI as part of its single all-inclusive quote.",
      "toolSlugs": [
        "freshservice",
        "haloitsm",
        "invgate-service-desk"
      ]
    },
    {
      "title": "Deployment Flexibility",
      "description": "HaloITSM offers on-premise or private-cloud deployment from the start, InvGate Service Desk only unlocks on-premise hosting at its costliest Enterprise tier, and Freshservice is a cloud-only platform with no stated on-premise option.",
      "toolSlugs": [
        "freshservice",
        "haloitsm",
        "invgate-service-desk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core ITSM Capabilities",
      "rows": [
        {
          "feature": "Incident and problem management",
          "statuses": {
            "freshservice": "available",
            "haloitsm": "available",
            "invgate-service-desk": "available"
          }
        },
        {
          "feature": "Change and release management",
          "statuses": {
            "freshservice": "limited",
            "haloitsm": "available",
            "invgate-service-desk": "limited"
          },
          "note": "Freshservice requires the Pro tier or above; InvGate Service Desk's low-code workflow builder for change processes is emphasized on Pro and Enterprise plans."
        },
        {
          "feature": "CMDB and asset management",
          "statuses": {
            "freshservice": "available",
            "haloitsm": "available",
            "invgate-service-desk": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted ticket triage",
          "statuses": {
            "freshservice": "limited",
            "haloitsm": "available",
            "invgate-service-desk": "limited"
          },
          "note": "Freshservice's Freddy AI Agent and Copilot are concentrated in the Enterprise tier; InvGate's AI Service Agent requires Pro or Enterprise."
        },
        {
          "feature": "Low-code workflow builder",
          "statuses": {
            "freshservice": "available",
            "haloitsm": "not-documented",
            "invgate-service-desk": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "On-premise or private-cloud deployment",
          "statuses": {
            "freshservice": "not-documented",
            "haloitsm": "available",
            "invgate-service-desk": "limited"
          },
          "note": "InvGate Service Desk only offers on-premise hosting at its highest-cost Enterprise tier."
        },
        {
          "feature": "Published, transparent per-agent pricing",
          "statuses": {
            "freshservice": "available",
            "haloitsm": "unavailable",
            "invgate-service-desk": "available"
          },
          "note": "HaloITSM requires a sales quote for its per-agent rate; Freshservice publishes pricing through Pro with Enterprise remaining custom."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between Freshservice, HaloITSM, and InvGate Service Desk?",
      "answer": "Freshservice leans into broad enterprise service management with published tiered pricing, HaloITSM bundles nearly all ITIL modules into one all-inclusive per-agent quote with flexible on-premise options, and InvGate Service Desk emphasizes transparent published pricing with a fast, low-code implementation."
    },
    {
      "question": "Which of these three ITSM tools is most affordable for a small IT team?",
      "answer": "InvGate Service Desk's Starter plan is $1,499 per year for up to 5 agents with unlimited end users, and Freshservice's Starter plan begins at $19 per agent per month, both of which are published prices; HaloITSM's custom quote is estimated around $50 to $70 per agent per month, which typically makes it costlier for very small teams."
    },
    {
      "question": "Does HaloITSM publish its pricing online?",
      "answer": "No. HaloITSM pricing is only available through a custom sales quote, though third-party estimates put it around $50 to $70 per agent per month, compared to Freshservice and InvGate Service Desk, which both publish tiered pricing."
    },
    {
      "question": "Which of these tools supports on-premise deployment?",
      "answer": "HaloITSM offers on-premise and private-cloud deployment as a standard option, InvGate Service Desk only enables on-premise hosting on its highest-cost Enterprise tier, and Freshservice is documented as a cloud-based platform with no stated on-premise option."
    },
    {
      "question": "Do all three platforms include AI-assisted ticket triage?",
      "answer": "Yes, each has an AI layer, Freddy AI Agent for Freshservice, Halo AI for HaloITSM, and the AI Service Agent for InvGate Service Desk, but Freshservice and InvGate concentrate their fullest AI capabilities in higher-priced tiers while HaloITSM includes Halo AI in its single all-inclusive quote."
    },
    {
      "question": "Is CMDB and asset management included by default?",
      "answer": "Freshservice includes CMDB and asset management starting at its Growth tier and HaloITSM includes CMDB as part of its all-inclusive per-agent pricing; CMDB is not documented as a named capability in InvGate Service Desk's published feature set."
    }
  ]
};

export default freshserviceVsHaloitsmVsInvgateServiceDeskContent;
