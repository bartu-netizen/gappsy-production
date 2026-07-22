import type { ToolComparisonContent } from './types';

const mattermostVsRocketChatContent: ToolComparisonContent = {
  "verdict": "Mattermost and Rocket.Chat are both open-core, self-hostable team chat platforms with unpublished enterprise pricing, but they emphasize different things. Mattermost bundles built-in Playbooks workflow automation and Kanban boards alongside chat, with FIPS 140-3 and STIG-hardened images on its Enterprise Advanced tier. Rocket.Chat is fully MIT-licensed, publishes the broadest documented compliance certification list (SOC 2, ISO 27001, GDPR, HIPAA, DoD ATO up to IL6), and includes cross-organization federation.",
  "bestForToolA": "Mattermost fits teams that want built-in incident-response workflow automation (Playbooks) and Kanban-style project boards alongside chat, especially regulated organizations needing FIPS 140-3/STIG-hardened images.",
  "bestForToolB": "Rocket.Chat fits teams needing the broadest published compliance certification list — SOC 2, ISO 27001, GDPR, HIPAA, and DoD ATO up to IL6 — or cross-organization federation, including government and defense deployments.",
  "whoNeedsBoth": "There's little realistic scenario for running both in production for the same team — both are alternative self-hosted chat platforms serving the same core communication need, so an organization would typically pilot one against the other during evaluation rather than deploy both as its primary chat tool.",
  "keyDifferences": [
    {
      "title": "Licensing Model",
      "toolA": "Mattermost is open-core: a compiled edition is released monthly under MIT, with separately licensed enterprise features on top (38.5k GitHub stars).",
      "toolB": "Rocket.Chat is fully MIT-licensed with 45.8k GitHub stars.",
      "whyItMatters": "A fully open-source license avoids feature gating tied to a separate enterprise license.",
      "benefitsWho": "Open-source-first organizations and self-hosters who want the whole codebase under one permissive license."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Mattermost documents FIPS 140-3 compliance and STIG-hardened images on its Enterprise Advanced tier; SOC 2/ISO 27001/HIPAA certification isn't documented in the facts.",
      "toolB": "Rocket.Chat documents SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD ATO up to IL6.",
      "whyItMatters": "Regulated industries need to match specific certification requirements before adopting a platform.",
      "benefitsWho": "Government, defense, and healthcare organizations with formal compliance requirements."
    },
    {
      "title": "Built-in Workflow & Project Tools",
      "toolA": "Mattermost includes Playbooks (workflow automation for incident response) and Kanban boards built into the platform.",
      "toolB": "Rocket.Chat offers an Apps-Engine for building custom apps and integrations, but no built-in Kanban or Playbooks-style workflow feature is documented.",
      "whyItMatters": "Built-in workflow tools reduce the need for separate incident-response or project-tracking software.",
      "benefitsWho": "DevOps and incident-response teams that want workflow automation inside their chat tool."
    },
    {
      "title": "AI Features",
      "toolA": "Mattermost's Enterprise tier adds 'Sovereign AI and contextual summarization,' plus AI summarization on recorded audio calls.",
      "toolB": "Rocket.Chat has no AI feature documented in the facts.",
      "whyItMatters": "AI summarization can reduce time spent catching up on missed discussions and calls.",
      "benefitsWho": "Large teams with high message/call volume who want automated summaries."
    },
    {
      "title": "Federation",
      "toolA": "Mattermost documents Microsoft Teams interoperability (shared channels) on Enterprise plans, not a native federation feature.",
      "toolB": "Rocket.Chat documents Federation as a native feature for communicating across separate Rocket.Chat organizations.",
      "whyItMatters": "Federation lets separate organizations communicate without merging into one workspace.",
      "benefitsWho": "Organizations that need to communicate across separate, independently-run deployments (e.g., partners, agencies, or government bodies)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted free edition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Air-gapped deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Mattermost: Enterprise Advanced tier. Rocket.Chat: Defense plan."
        },
        {
          "feature": "Fully open-source (no open-core split)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Mattermost separates enterprise features under a different license; Rocket.Chat is entirely MIT-licensed."
        },
        {
          "feature": "Public cloud deployment (AWS/Azure/GCP)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Collaboration Features",
      "rows": [
        {
          "feature": "Built-in workflow automation/playbooks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kanban boards",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Federation across separate organizations",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in video calling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mattermost documents audio calls only, not video; Rocket.Chat documents chat, voice, video, and screen sharing."
        }
      ]
    },
    {
      "group": "Compliance & Enterprise",
      "rows": [
        {
          "feature": "FIPS 140-3 compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2 / ISO 27001 / HIPAA certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "DoD Authorization to Operate",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Rocket.Chat: up to IL6."
        },
        {
          "feature": "Microsoft Teams interoperability",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mattermost Enterprise tier shared channels."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Mattermost fully open source?",
      "answer": "It's open-core: a compiled edition is released monthly under the MIT license, with separately licensed enterprise features layered on top."
    },
    {
      "question": "Is Rocket.Chat fully open source?",
      "answer": "Yes, Rocket.Chat is open source under the MIT license."
    },
    {
      "question": "Which tool has published compliance certifications?",
      "answer": "Rocket.Chat documents SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD ATO up to IL6. Mattermost documents FIPS 140-3 compliance and STIG-hardened images but not the same certification list."
    },
    {
      "question": "Does either tool publish pricing for paid plans?",
      "answer": "No. Both Mattermost's Professional/Enterprise/Enterprise Advanced tiers and Rocket.Chat's Commercial/Government/Defense plans require contacting sales for pricing."
    },
    {
      "question": "Which tool includes built-in workflow automation?",
      "answer": "Mattermost, via its Playbooks feature for automating recurring workflows and incident response."
    },
    {
      "question": "Does either support government or defense deployments?",
      "answer": "Rocket.Chat has a dedicated Defense plan with DoD ATO up to IL6. Mattermost's Enterprise Advanced tier supports air-gapped and classified deployments but doesn't document a specific DoD ATO rating."
    }
  ]
};

export default mattermostVsRocketChatContent;
