import type { ToolComparisonContent } from './types';

const corbadoVsSlashidContent: ToolComparisonContent = {
  "verdict": "Corbado and SlashID both sit adjacent to an existing identity provider, but they solve different problems. Corbado is a passkey adoption and login-friction analytics layer, reconstructing user login journeys to show where people abandon authentication. SlashID is an identity threat detection and response (ITDR) platform, running 500+ MITRE ATT&CK-mapped detections and automated remediation across human, machine, and AI identities. One is about improving the login experience; the other is about catching and stopping identity-based attacks.",
  "bestForToolA": "Corbado fits teams that already have solid IDP security but want to understand and improve passkey adoption rates and pinpoint exactly where users abandon login flows.",
  "bestForToolB": "SlashID fits security and IT teams needing active threat detection and automated remediation (MFA enforcement, suspension, credential rotation) across human, machine, and AI identities in hybrid or multi-cloud environments.",
  "whoNeedsBoth": "An enterprise could run SlashID for identity threat detection and remediation across its entire identity estate while running Corbado specifically on its consumer-facing login flow to track and improve passkey adoption — the two address different problems (security enforcement vs. UX/adoption analytics) with little functional overlap.",
  "keyDifferences": [
    {
      "title": "Primary Focus",
      "toolA": "Corbado focuses on passkey adoption and login friction analytics through journey reconstruction and per-user debugging.",
      "toolB": "SlashID focuses on identity threat detection and remediation, with 500+ detections mapped to the MITRE ATT&CK framework.",
      "whyItMatters": "The two tools answer different questions: 'why are users abandoning login?' versus 'is this identity being attacked?'",
      "benefitsWho": "Product/UX teams need Corbado's answer; security teams need SlashID's."
    },
    {
      "title": "Remediation Capability",
      "toolA": "Corbado provides visibility and analytics only; no enforcement or remediation feature is documented.",
      "toolB": "SlashID offers one-click enforcement of MFA, user suspension, or credential rotation, with a claimed sub-1-second detection-to-remediation capability.",
      "whyItMatters": "Detecting a problem is different from being able to act on it automatically.",
      "benefitsWho": "Security operations teams that need to contain incidents quickly."
    },
    {
      "title": "Identity Types Covered",
      "toolA": "Corbado's documented features focus on human login journeys and passkey rollout.",
      "toolB": "SlashID explicitly covers human, machine, and AI identities under one system of record.",
      "whyItMatters": "Modern environments increasingly need to secure non-human identities, not just end users.",
      "benefitsWho": "Organizations running service accounts, bots, or AI agents alongside human users."
    },
    {
      "title": "Governance & Compliance Automation",
      "toolA": "Corbado is ISO 27001, SOC 2 Type II, and GDPR certified itself, but does not document access-review or governance automation features.",
      "toolB": "SlashID offers automated certification campaigns and access-review workflows supporting SOC 2, ISO 27001, PCI DSS, HIPAA, and GDPR compliance.",
      "whyItMatters": "Automated governance workflows reduce manual audit prep for regulated organizations.",
      "benefitsWho": "Compliance and GRC teams running periodic access certifications."
    },
    {
      "title": "Browser-Level Threat Detection",
      "toolA": "Corbado has no browser extension or threat-detection feature; its IDP compatibility is about analytics integration, not enforcement.",
      "toolB": "SlashID offers a browser extension for edge-level phishing detection, shadow SaaS discovery, and session hijacking prevention.",
      "whyItMatters": "Real-time detection at the browser level catches attacks before they reach backend systems.",
      "benefitsWho": "Security teams worried about phishing and unsanctioned SaaS usage."
    }
  ],
  "featureMatrix": [
    {
      "group": "Visibility & Analytics",
      "rows": [
        {
          "feature": "Login journey reconstruction",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Per-user login debugging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Risk/posture scoring across identities",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SlashID scores exposure and entitlements continuously."
        }
      ]
    },
    {
      "group": "Security & Remediation",
      "rows": [
        {
          "feature": "Threat detection (MITRE ATT&CK-mapped)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "500+ built-in detections."
        },
        {
          "feature": "Automated remediation (MFA/suspend/rotate)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Browser-level phishing/session-hijack detection",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Integrations",
      "rows": [
        {
          "feature": "SOC 2 Type II certification",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "ISO 27001 certification (own certification)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SlashID supports ISO 27001 compliance workflows for customers but its own ISO 27001 certification isn't documented."
        },
        {
          "feature": "Third-party integration count",
          "toolA": "available",
          "toolB": "available",
          "note": "Corbado: 20+ CIAM systems. SlashID: 100+ integrations."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Corbado and SlashID?",
      "answer": "Corbado analyzes login journeys to improve passkey adoption and reduce friction. SlashID detects and remediates identity-based security threats across human, machine, and AI identities. They solve different problems even though both integrate with existing identity systems."
    },
    {
      "question": "Does SlashID cover AI identities?",
      "answer": "Yes, SlashID explicitly states it covers human, machine, and AI identities under one system of record."
    },
    {
      "question": "Does Corbado detect security threats or just analytics?",
      "answer": "Corbado's documented functionality is analytics and friction detection for login journeys — it does not document a threat-detection or automated remediation feature the way SlashID does."
    },
    {
      "question": "Is pricing public for either tool?",
      "answer": "No. Both Corbado and SlashID are custom/enterprise priced with no public pricing; both require contacting sales or requesting a demo."
    },
    {
      "question": "Which tool automates remediation actions like MFA enforcement or credential rotation?",
      "answer": "SlashID, with one-click enforcement of MFA, user suspension, or credential rotation and a claimed sub-1-second detection-to-remediation capability."
    },
    {
      "question": "What compliance certifications does each tool hold?",
      "answer": "Corbado states it is ISO 27001, SOC 2 Type II, and GDPR certified. SlashID is SOC 2 Type II certified and supports compliance workflows for SOC 2, ISO 27001, PCI DSS, HIPAA, and GDPR."
    }
  ]
};

export default corbadoVsSlashidContent;
