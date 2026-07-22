import type { ToolComparisonContent } from './types';

const hetrixtoolsVsZabbixContent: ToolComparisonContent = {
  "verdict": "HetrixTools is a lightweight SaaS built around uptime checks, server agent metrics, and blacklist/IP reputation tracking for site owners and hosting providers, while Zabbix is a much broader, self-hostable enterprise observability platform covering networks, IoT/OT devices, applications, and logs, used across 300,000+ deployments including organizations like ESA and NATO. They serve different scales: HetrixTools trades depth for simplicity and a managed SaaS model, while Zabbix trades setup complexity for unified, free-at-core monitoring of complex hybrid infrastructure.",
  "bestForToolA": "Hosting providers and small-to-mid site owners who want uptime, server agent, and blacklist/reputation monitoring bundled into one SaaS with a free-forever tier of 15 uptime monitors and 32 blacklist monitors, without operating any monitoring infrastructure.",
  "bestForToolB": "Enterprises and IT teams monitoring hybrid environments, networks, IoT/OT devices, cloud, and applications, that need a 100% open-source platform with 300+ pre-built templates and want to self-host without licensing fees, as used by organizations like ESA, NATO, Orange, and Dell.",
  "whoNeedsBoth": "A hosting company could run Zabbix internally to monitor its own network hardware, servers, and hybrid infrastructure at enterprise scale, while separately using HetrixTools to track external blacklist/IP reputation and SSL/domain expiration for customer-facing services, a niche that Zabbix's templates don't specifically address.",
  "keyDifferences": [
    {
      "title": "Monitoring Breadth",
      "toolA": "HetrixTools focuses on uptime checks, a server metrics agent, and blacklist/IP reputation monitoring for hosting and site owners.",
      "toolB": "Zabbix provides unified real-time monitoring across cloud services, networks, IoT/OT devices, and applications, backed by 300+ pre-built templates and integrations.",
      "whyItMatters": "Teams monitoring complex hybrid infrastructure need broader device and application coverage than a site-uptime tool provides.",
      "benefitsWho": "Enterprise IT teams with diverse infrastructure benefit from Zabbix's breadth; hosting/site owners benefit from HetrixTools' focus."
    },
    {
      "title": "Deployment Model",
      "toolA": "HetrixTools is hosted SaaS only, with no self-hosted option.",
      "toolB": "Zabbix's core is self-hosted open source, with an optional managed Zabbix Cloud SaaS offering.",
      "whyItMatters": "Organizations with data residency or infrastructure-control requirements need a self-hostable option.",
      "benefitsWho": "Regulated or infrastructure-heavy organizations benefit from Zabbix's self-hosted flexibility."
    },
    {
      "title": "Cost Structure",
      "toolA": "HetrixTools' free-forever tier includes 15 uptime monitors and 32 blacklist monitors; paid plan pricing is not publicly documented.",
      "toolB": "Zabbix's core software is 100% free with no licensing fees at any scale, though the enterprise support subscription and Zabbix Cloud are priced separately via custom quote.",
      "whyItMatters": "Predictable, published pricing matters for budgeting, and neither tool fully discloses its paid-tier costs.",
      "benefitsWho": "Cost-sensitive teams scaling monitoring benefit from Zabbix's free-at-any-scale core software."
    },
    {
      "title": "Track Record and Scale",
      "toolA": "HetrixTools has been operating since 2015 as a hosting-focused monitoring SaaS.",
      "toolB": "Zabbix has operated since 2001 and is used across 300,000+ deployments in 190+ countries, including large organizations like ESA, NATO, Orange, and Dell.",
      "whyItMatters": "Enterprise buyers often weigh proven scale and named customer references when selecting infrastructure monitoring.",
      "benefitsWho": "Large enterprises evaluating vendor maturity benefit from Zabbix's documented deployment scale."
    },
    {
      "title": "Blacklist and Reputation Monitoring",
      "toolA": "HetrixTools has dedicated IP and domain blacklist monitoring across major blacklists, including Microsoft SNDS.",
      "toolB": "Zabbix does not document blacklist or IP reputation monitoring as a feature.",
      "whyItMatters": "Hosting providers and email senders specifically need to know when their IPs get blacklisted, which general infrastructure monitoring tools may not cover.",
      "benefitsWho": "Hosting providers and bulk email senders benefit from HetrixTools' blacklist monitoring."
    }
  ],
  "featureMatrix": [
    {
      "group": "Monitoring Coverage",
      "rows": [
        {
          "feature": "Uptime monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Server/host metrics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Network device monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "IoT/OT device monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Blacklist & IP reputation monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Log monitoring and analysis",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Scale & Deployment",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "available",
          "note": "HetrixTools SaaS; Zabbix Cloud (custom pricing)"
        },
        {
          "feature": "Pre-built templates/integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "300+ templates"
        },
        {
          "feature": "Automated discovery and visualization",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "HetrixTools: 15 uptime + 32 blacklist monitors; Zabbix: 100% free open-source core"
        },
        {
          "feature": "Published paid pricing",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Both require contacting sales for paid tiers"
        },
        {
          "feature": "24/7 support option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zabbix: ~12-minute average response time"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Zabbix really free?",
      "answer": "Yes, the core Zabbix software is 100% open source with no licensing fees, regardless of scale. Separate paid support and Zabbix Cloud subscriptions are priced via custom quote."
    },
    {
      "question": "Does HetrixTools monitor network devices and IoT equipment like Zabbix?",
      "answer": "This isn't documented for HetrixTools, which focuses on uptime, server agent metrics, and blacklist monitoring rather than network device or IoT/OT monitoring."
    },
    {
      "question": "Which is better for enterprise-scale infrastructure monitoring?",
      "answer": "Zabbix, with a documented base of 300,000+ deployments in 190+ countries and customers including ESA, NATO, Orange, and Dell."
    },
    {
      "question": "Does Zabbix track blacklist or IP reputation status?",
      "answer": "This isn't documented as a Zabbix feature. HetrixTools is specifically built for blacklist and IP reputation monitoring, including Microsoft SNDS."
    },
    {
      "question": "Can I get managed hosting for Zabbix instead of self-hosting?",
      "answer": "Yes, Zabbix Cloud is a managed SaaS option, though pricing requires contacting sales."
    },
    {
      "question": "How long have these companies been operating?",
      "answer": "HetrixTools was founded in 2015. Zabbix has operated since 2001 and is headquartered in Latvia."
    }
  ]
};

export default hetrixtoolsVsZabbixContent;
