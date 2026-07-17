import type { ToolComparisonContent } from './types';

const hetznerVsLinodeContent: ToolComparisonContent = {
  "verdict": "Hetzner and Linode are both veteran infrastructure providers that don't publish flat starting prices on their main marketing pages, so the real differentiator is ownership and geography: Hetzner is an independently run, Germany-based provider founded in 1997 with a wide range of dedicated hardware lines, while Linode, founded in 2003 in Philadelphia, has operated as part of Akamai's global network since its 2022 acquisition and adds managed databases and an App Platform.",
  "bestForToolA": "Teams prioritizing low-cost, European-based infrastructure who want free one-click app installs, firewalls, and load balancers bundled in, and are comfortable with an independently run provider.",
  "bestForToolB": "Teams that want the reach and backing of Akamai's global network, along with flat, predictable pricing, low egress fees, managed MySQL/PostgreSQL databases, and an App Platform layer.",
  "whoNeedsBoth": "A team managing infrastructure across regions might use Hetzner for low-cost EU-based workloads while relying on Linode/Akamai for broader global network reach or managed database needs elsewhere.",
  "keyDifferences": [
    {
      "title": "Ownership and backing",
      "toolA": "Operates independently, founded in 1997, with no acquisition mentioned.",
      "toolB": "Was acquired by Akamai Technologies in 2022 and now operates as Akamai Connected Cloud, backed by Akamai's global network.",
      "whyItMatters": "Buyers weigh the reliability and global reach of a hyperscaler-backed provider against the independence and pricing of a standalone operator.",
      "benefitsWho": "Enterprises wanting hyperscaler-backed SLAs vs. teams preferring an independent, lower-cost operator."
    },
    {
      "title": "Headquarters location",
      "toolA": "Headquartered in Gunzenhausen, Germany.",
      "toolB": "Originally headquartered in Philadelphia, Pennsylvania, USA.",
      "whyItMatters": "Data residency preferences and support timezone alignment often follow a provider's home region.",
      "benefitsWho": "EU-based teams favoring a German provider vs. US-based teams favoring a US-founded one."
    },
    {
      "title": "Server hardware lineup",
      "toolA": "Offers six dedicated server lines (EX, AX, RX, SX, GPU, DX) plus three cloud server tiers (Cost-Optimized, Regular Performance, General Purpose).",
      "toolB": "Compute lineup spans Essential Compute, GPU, Accelerated Compute, Kubernetes, and an App Platform.",
      "whyItMatters": "Teams with specific dedicated-hardware needs versus teams wanting a higher-level PaaS layer will find different fits.",
      "benefitsWho": "Infra teams needing specific hardware lines vs. teams wanting Linode's App Platform abstraction."
    },
    {
      "title": "Bundled networking extras",
      "toolA": "States free stateful firewalls, load balancers, and private networking are included.",
      "toolB": "Offers Cloud Firewall, DNS Manager, and NodeBalancers as part of its networking category, without stating they are free.",
      "whyItMatters": "Whether networking add-ons are free or billed affects total cost of ownership.",
      "benefitsWho": "Budget-sensitive operations teams."
    },
    {
      "title": "Managed operations add-on",
      "toolA": "No equivalent managed-operations add-on documented.",
      "toolB": "Offers 'Linode Managed,' an optional managed-services add-on for infrastructure oversight.",
      "whyItMatters": "Teams without in-house ops staff may need a vendor-provided managed layer.",
      "benefitsWho": "Smaller teams wanting hands-off infrastructure management."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Infrastructure",
      "rows": [
        {
          "feature": "Dedicated/bare-metal server lines",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hetzner: EX, AX, RX, SX, GPU, DX lines."
        },
        {
          "feature": "Kubernetes",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Managed databases",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linode: managed MySQL and PostgreSQL."
        },
        {
          "feature": "GPU compute",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "One-click app installs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hetzner: Docker, WordPress, Nextcloud, GitLab."
        }
      ]
    },
    {
      "group": "Networking & Storage",
      "rows": [
        {
          "feature": "Firewalls",
          "toolA": "available",
          "toolB": "available",
          "note": "Hetzner states firewalls are free; Linode's Cloud Firewall pricing is not stated."
        },
        {
          "feature": "Object storage",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Load balancers",
          "toolA": "available",
          "toolB": "available",
          "note": "Hetzner free; Linode via NodeBalancers."
        }
      ]
    },
    {
      "group": "Company & Support",
      "rows": [
        {
          "feature": "Independent ownership",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Linode has been part of Akamai since 2022."
        },
        {
          "feature": "Managed services add-on",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Flat published pricing on main page",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both redirect to product-specific or third-party pricing tools."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Where is Hetzner based?",
      "answer": "Hetzner Online is headquartered in Gunzenhausen, Germany, and was founded in 1997."
    },
    {
      "question": "Is Linode still independent?",
      "answer": "No, Linode was acquired by Akamai Technologies in 2022 and now operates as Akamai Connected Cloud."
    },
    {
      "question": "When was Linode founded?",
      "answer": "Linode was founded in 2003 and was originally headquartered in Philadelphia, Pennsylvania."
    },
    {
      "question": "Does Hetzner support one-click app installs?",
      "answer": "Yes, including Docker, WordPress, Nextcloud, and GitLab."
    },
    {
      "question": "What databases does Linode manage?",
      "answer": "Linode offers managed MySQL and PostgreSQL database services."
    },
    {
      "question": "Are firewalls included with Hetzner?",
      "answer": "Yes, Hetzner includes free stateful firewalls with its cloud servers."
    }
  ]
};

export default hetznerVsLinodeContent;
