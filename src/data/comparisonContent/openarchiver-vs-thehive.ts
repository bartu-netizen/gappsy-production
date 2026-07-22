import type { ToolComparisonContent } from './types';

const openarchiverVsThehiveContent: ToolComparisonContent = {
  "verdict": "openarchiver is an email archiving platform for compliance, backup, and eDiscovery, while TheHive is a collaborative security incident response and case management platform for SOCs, CSIRTs, and CERTs, developed by StrangeBee. They address different needs — records retention versus incident coordination — though both are self-hosted tools that a security-conscious organization might run alongside each other.",
  "bestForToolA": "Compliance and records teams needing to archive and search Microsoft 365, Google Workspace, or IMAP mailboxes, or import legacy PST/EML files.",
  "bestForToolB": "SOCs, CSIRTs, and CERTs needing structured case, task, and observable tracking, with Cortex-based enrichment, MISP integration, and 300+ listed third-party integrations.",
  "whoNeedsBoth": "A security operations team running TheHive to triage alerts and manage incident-response cases might also rely on openarchiver's archived, searchable email as forensic evidence during an investigation — TheHive coordinates the response while openarchiver supplies a compliant record of past communications.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "openarchiver archives email for compliance and eDiscovery.",
      "toolB": "TheHive is a case-management platform for security incident response.",
      "whyItMatters": "Records retention and active incident coordination are distinct disciplines.",
      "benefitsWho": "Compliance teams versus SOC/CSIRT analysts."
    },
    {
      "title": "Free Tier Limits",
      "toolA": "openarchiver's free tier isn't documented with specific limits beyond being Freemium.",
      "toolB": "TheHive's free Community edition is explicitly capped at 2 users and 1 organization, with 1 Cortex server and 1 MISP server; larger teams need paid Gold or Platinum licensing, priced custom per user/org.",
      "whyItMatters": "Concrete usage caps determine whether the free tier can actually support a real team.",
      "benefitsWho": "Small security teams evaluating whether TheHive's free tier fits their headcount."
    },
    {
      "title": "Integrations",
      "toolA": "openarchiver integrates with Microsoft 365, Google Workspace, IMAP, and PST/EML import — no security or threat-intel integrations.",
      "toolB": "TheHive integrates with Cortex for observable enrichment and active response, with MISP threat-intelligence servers, and lists 300+ integrations via StrangeBee.",
      "whyItMatters": "TheHive's value depends heavily on its threat-intel and enrichment ecosystem.",
      "benefitsWho": "SOCs needing to correlate alerts across many security tools."
    },
    {
      "title": "Deployment Options",
      "toolA": "openarchiver's deployment options beyond self-hosting aren't documented in the facts available.",
      "toolB": "TheHive offers self-hosted on-premises install, prebuilt cloud images for AWS/Azure, or a fully managed TheHive Cloud Platform SaaS.",
      "whyItMatters": "TheHive gives teams a documented spectrum from fully self-hosted to fully managed.",
      "benefitsWho": "Teams weighing operational overhead against control."
    },
    {
      "title": "Governance History",
      "toolA": "openarchiver's governance and contribution model aren't documented.",
      "toolB": "TheHive has been developed exclusively by StrangeBee since 2018; TheHive 4 and 5 no longer accept external code contributions, and the earlier fully open-source versions (3 and 4) were discontinued with repositories archived in 2023.",
      "whyItMatters": "A shift away from open contribution affects long-term community trust and roadmap influence.",
      "benefitsWho": "Teams that weigh a project's open-source governance model before standardizing on it."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Email archiving",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Incident case / alert management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Observable / IOC enrichment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "TheHive: via Cortex"
        },
        {
          "feature": "Full-text search of records",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "TheHive: Community edition"
        },
        {
          "feature": "Free tier user cap documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TheHive Community: capped at 2 users, 1 org"
        },
        {
          "feature": "Managed SaaS option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TheHive Cloud Platform"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "MISP threat-intel integration",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Cortex analysis engine integration",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "300+ third-party integrations",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do openarchiver and TheHive compete?",
      "answer": "No. openarchiver archives email for compliance while TheHive manages security incident response cases — different categories entirely."
    },
    {
      "question": "Is TheHive fully free?",
      "answer": "The Community edition is free but capped at 2 users and 1 organization; larger teams need paid Gold or Platinum licensing, priced custom per user/org."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but specific paid-tier pricing isn't documented."
    },
    {
      "question": "Does TheHive archive email?",
      "answer": "No. It manages security incident cases and integrates with Cortex and MISP for enrichment, not email archiving."
    },
    {
      "question": "Can openarchiver be used for incident response?",
      "answer": "Not per the documented features — its role is mail archiving, not case management."
    },
    {
      "question": "Is TheHive still fully open source?",
      "answer": "No. Since StrangeBee took over development in 2018, TheHive 4 and 5 no longer accept external code contributions, and the earlier open-source versions were archived in 2023."
    }
  ]
};

export default openarchiverVsThehiveContent;
