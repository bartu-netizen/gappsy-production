import type { ToolComparisonContent } from './types';

const crowdsecVsWazuhContent: ToolComparisonContent = {
  "verdict": "CrowdSec and Wazuh are both open-source-rooted security tools, but they solve different problems: CrowdSec is a crowd-sourced threat intelligence and IP-blocking network built on data shared by 70,000+ users across 190+ countries, with paid tiers starting at $49/month for its IP Reputation API, while Wazuh is a fully free SIEM/XDR platform for endpoint security, threat detection, and compliance monitoring with no published paid pricing beyond optional managed Wazuh Cloud and support. Teams wanting to block known-bad IPs using collective threat data lean toward CrowdSec; teams wanting a self-hosted SIEM/XDR for log analysis, file integrity monitoring, and compliance lean toward Wazuh.",
  "bestForToolA": "CrowdSec fits teams that want to preemptively block malicious traffic using crowd-sourced IP reputation data — its Community Blocklist aggregates around 15 million daily signals — and are willing to pay from $49/month for the IP Reputation API or from $1,900/month for curated Platinum Blocklists.",
  "bestForToolB": "Wazuh fits teams that need a full SIEM and XDR platform — endpoint security, vulnerability detection, cloud/container security, and compliance monitoring — at no licensing cost, reporting 15+ million protected endpoints and 100,000+ enterprise users.",
  "whoNeedsBoth": "A security team could run Wazuh as its core SIEM/XDR for endpoint monitoring and compliance while adding CrowdSec's Community Blocklist or paid IP Reputation API as a preemptive network-layer defense that blocks known-malicious IPs before they generate the alerts Wazuh would otherwise have to process.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "CrowdSec centers on Preemptive Blocking and a Community Blocklist built from crowd-sourced IP reputation data shared by 70,000+ users in 190+ countries.",
      "toolB": "Wazuh centers on SIEM Capabilities and Active XDR — real-time correlation with granular, on-device active responses — alongside endpoint security and threat intelligence.",
      "whyItMatters": "Blocking known-bad IPs at the perimeter and correlating internal log/endpoint data for threat detection are complementary but distinct security functions.",
      "benefitsWho": "Network/infrastructure security teams need CrowdSec's blocklist approach; SOC analysts monitoring endpoints and logs need Wazuh's SIEM/XDR approach."
    },
    {
      "title": "Pricing Structure",
      "toolA": "CrowdSec's Community plan is free, but paid tiers include IP Reputation API from $49/month (5,000 queries) and Platinum Blocklists from $1,900/month; Console Premium pricing requires contact.",
      "toolB": "Wazuh's Community (self-hosted) plan is entirely free with the full SIEM/XDR feature set; Wazuh Cloud and professional support/training pricing is not publicly listed.",
      "whyItMatters": "CrowdSec has clear published price points for specific paid capabilities, while Wazuh's core product is free but its managed/paid options are opaque.",
      "benefitsWho": "Budget-conscious teams that want to know exact costs upfront benefit from CrowdSec's published tier pricing for the features they need."
    },
    {
      "title": "Data Source",
      "toolA": "CrowdSec's value comes from Real-Time Signal Sharing — aggregating roughly 15 million daily signals with about 50% daily IP rotation across its user network.",
      "toolB": "Wazuh's Threat Intelligence feature relies on threat hunting, log data analysis, and vulnerability detection from an organization's own monitored environment.",
      "whyItMatters": "External crowd-sourced threat data catches attackers before they hit your systems; internal log-based detection catches what's already happening inside your environment.",
      "benefitsWho": "Teams wanting an early-warning layer benefit from CrowdSec's network-wide signal sharing; teams needing deep internal visibility benefit from Wazuh's log-based detection."
    },
    {
      "title": "Deployment Coverage",
      "toolA": "CrowdSec offers Plug-and-Play Integrations that connect with common firewalls and CDNs.",
      "toolB": "Wazuh's Cloud Security feature covers container security and cloud workload posture management, and it works across public cloud, private cloud, and on-premises environments.",
      "whyItMatters": "The breadth of environments and infrastructure each tool protects determines how much of a security stack it can cover on its own.",
      "benefitsWho": "Teams with mixed cloud/on-prem/container environments need Wazuh's broader environment coverage; teams focused on edge/network defense benefit from CrowdSec's firewall/CDN integrations."
    },
    {
      "title": "Openness of Core Product",
      "toolA": "CrowdSec's Community Plan is free and open source, with paid tiers layered on top for premium blocklists and API access.",
      "toolB": "Wazuh is fully open source with ongoing community contributions on GitHub, and its entire documented feature set is available in the free Community (self-hosted) plan.",
      "whyItMatters": "How much core functionality is gated behind a paywall affects total cost for teams that can self-manage.",
      "benefitsWho": "Self-hosting teams with in-house security expertise get more free capability from Wazuh's fully open Community plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Threat Detection & Blocking",
      "rows": [
        {
          "feature": "Crowd-sourced IP blocklist",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "CrowdSec Community Blocklist"
        },
        {
          "feature": "Endpoint security / file integrity monitoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Wazuh Endpoint Security"
        },
        {
          "feature": "SIEM log correlation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Wazuh SIEM Capabilities"
        },
        {
          "feature": "IP reputation lookups via API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CrowdSec IP Reputation API, from $49/month"
        }
      ]
    },
    {
      "group": "Coverage & Compliance",
      "rows": [
        {
          "feature": "Cloud/container security",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh Cloud Security"
        },
        {
          "feature": "Compliance monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh SIEM Capabilities"
        },
        {
          "feature": "Firewall/CDN integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CrowdSec Plug-and-Play Integrations"
        }
      ]
    },
    {
      "group": "Pricing & Community",
      "rows": [
        {
          "feature": "Free core plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer a free open-source tier"
        },
        {
          "feature": "Published paid tier pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "CrowdSec: $49/mo API, $1,900/mo Platinum; Wazuh Cloud pricing not public"
        },
        {
          "feature": "Reported user/endpoint scale",
          "toolA": "available",
          "toolB": "available",
          "note": "CrowdSec: 70,000+ users, 190+ countries; Wazuh: 15M+ endpoints, 100,000+ enterprise users"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CrowdSec or Wazuh free?",
      "answer": "Both have free tiers. CrowdSec's Community Plan is free and open source with behavioral detection and automated response. Wazuh's Community (self-hosted) plan is also free and includes its full SIEM/XDR feature set; both charge for optional add-ons (CrowdSec's premium blocklists and API, Wazuh's managed cloud and support)."
    },
    {
      "question": "What does CrowdSec's paid tier cost?",
      "answer": "CrowdSec's IP Reputation API starts at $49/month for 5,000 queries, while Platinum Blocklists start around $1,900/month. Console Premium pricing is not publicly listed and requires contacting CrowdSec."
    },
    {
      "question": "Can CrowdSec and Wazuh be used together?",
      "answer": "Their documented feature sets are complementary — CrowdSec focuses on crowd-sourced IP blocking at the network edge, while Wazuh focuses on SIEM/XDR log correlation and endpoint monitoring — so a security team could run both to cover perimeter blocking and internal detection respectively."
    },
    {
      "question": "How many users does each platform report?",
      "answer": "CrowdSec reports more than 70,000 active users across 190+ countries sharing roughly 15 million signals daily. Wazuh reports 15+ million protected endpoints and 100,000+ enterprise users."
    },
    {
      "question": "Does Wazuh cover cloud and container environments?",
      "answer": "Yes, Wazuh's Cloud Security feature covers container security and cloud workload posture management, and the platform works across public cloud, private cloud, and on-premises environments."
    },
    {
      "question": "Is CrowdSec open source?",
      "answer": "Yes, the CrowdSec Security Engine is open-source software available on GitHub, with the Community Plan free to use; premium blocklists and API tiers are paid add-ons."
    }
  ]
};

export default crowdsecVsWazuhContent;
