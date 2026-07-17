import type { ToolComparisonContent } from './types';

const icingaVsZabbixContent: ToolComparisonContent = {
  "verdict": "Icinga and Zabbix are both open-source infrastructure monitoring platforms with free-forever cores, but they structure their paid offerings differently. Icinga sells modular subscriptions (Repository, Module, Support) with published starting prices from $1,400-$15,000/year depending on region, while Zabbix keeps its core 100% free with no licensing fees and pushes Cloud/support pricing to a custom sales quote. Icinga leans on explicit automation tooling (Ansible, Puppet, Terraform, Git workflows), while Zabbix leans on breadth (IoT/OT device monitoring, 300+ templates) and a documented base of 300,000+ deployments.",
  "bestForToolA": "Teams that want config-as-code monitoring workflows via API, Git, Ansible, Puppet, and Terraform, and are willing to pay predictable, published subscription prices, from $1,400/year for enterprise modules to $3,500/year for enterprise Linux packages, rather than an all-or-nothing enterprise contract.",
  "bestForToolB": "Organizations monitoring IoT/OT devices alongside servers, networks, and cloud, who want a 100% free open-source core with no licensing fees at any scale and don't mind negotiating custom pricing for Zabbix Cloud or 24/7 support.",
  "whoNeedsBoth": "There's no strong scenario for running both simultaneously; they overlap heavily as general-purpose open-source infrastructure monitoring platforms, and most teams would pick one as their monitoring backbone rather than operate two competing systems side by side.",
  "keyDifferences": [
    {
      "title": "Subscription Structure",
      "toolA": "Icinga's core is free forever, but paid add-ons are modular: Repository Subscription from $3,500/year, Module Subscription from $1,400/year, and Support Subscription from $15,000/year, all region-dependent.",
      "toolB": "Zabbix's core is 100% free with no licensing fees at any scale; Zabbix Cloud and technical support are priced via custom quote rather than published tiers.",
      "whyItMatters": "Published, itemized pricing lets teams budget for exactly the add-ons they need, while custom-quote pricing requires a sales conversation before cost is known.",
      "benefitsWho": "Budget-planning IT teams benefit from Icinga's published modular pricing; teams wanting a single free core with no tiered add-ons benefit from Zabbix."
    },
    {
      "title": "IoT/OT and Network Monitoring",
      "toolA": "Icinga covers servers, networks, Kubernetes, databases, applications, Windows, and VMware across on-prem, cloud, and hybrid environments.",
      "toolB": "Zabbix explicitly documents monitoring of IoT/OT devices alongside cloud services, networks, and applications through a single interface.",
      "whyItMatters": "Organizations with industrial or IoT equipment need monitoring tools that explicitly support those device types.",
      "benefitsWho": "Manufacturing and industrial IT teams monitoring IoT/OT hardware benefit from Zabbix's documented coverage."
    },
    {
      "title": "Automation and Configuration-as-Code",
      "toolA": "Icinga is explicitly configurable via API, Git workflows, Ansible, Puppet, and Terraform.",
      "toolB": "Zabbix documents automated discovery, visualization, and 300+ templates/integrations, but doesn't explicitly list Ansible, Puppet, or Terraform support.",
      "whyItMatters": "Teams running infrastructure-as-code pipelines want their monitoring configuration to fit the same workflow.",
      "benefitsWho": "DevOps teams standardized on Ansible, Puppet, or Terraform benefit from Icinga's explicit automation support."
    },
    {
      "title": "Enterprise Linux Packaging",
      "toolA": "Icinga sells a dedicated Repository Subscription providing installation packages for RHEL, SLES, and Amazon Linux, starting from $3,500/year with a 60-day free trial.",
      "toolB": "Zabbix does not document a comparable paid repository/package subscription for enterprise Linux distributions.",
      "whyItMatters": "Enterprises standardized on specific Linux distributions may need vetted, supported installation packages.",
      "benefitsWho": "Enterprises running RHEL, SLES, or Amazon Linux benefit from Icinga's Repository Subscription."
    },
    {
      "title": "Documented Scale and Track Record",
      "toolA": "Icinga does not publish comparable deployment-count or named-customer figures.",
      "toolB": "Zabbix documents 300,000+ deployments in 190+ countries, with named enterprise customers including ESA, NATO, Orange, and Dell, plus a 12-minute average support response time.",
      "whyItMatters": "Buyers evaluating vendor maturity and reliability often look for documented scale and reference customers.",
      "benefitsWho": "Risk-averse enterprise buyers benefit from Zabbix's documented deployment scale and customer references."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring",
      "rows": [
        {
          "feature": "Hosts/services monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Network device monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "IoT/OT device monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "VMware monitoring",
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
      "group": "Automation & Integration",
      "rows": [
        {
          "feature": "Ansible/Puppet/Terraform support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API-driven configuration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-built templates/integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "300+ templates"
        },
        {
          "feature": "Grafana/Prometheus/InfluxDB/Elasticsearch integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Free core edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Both cores are free with unlimited hosts"
        },
        {
          "feature": "Published subscription pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Icinga publishes region-based tiers from $1,400-$15,000/year; Zabbix requires custom quote"
        },
        {
          "feature": "Free trial on paid tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Icinga: 60-day trial on Repository Subscription"
        },
        {
          "feature": "Documented support response time",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zabbix: ~12-minute average, 24/7"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both Icinga and Zabbix free?",
      "answer": "Yes, both have free-forever open-source cores with unlimited hosts and services. Paid add-ons differ: Icinga sells modular subscriptions, while Zabbix's paid support and cloud options require a custom quote."
    },
    {
      "question": "How much do paid Icinga subscriptions cost?",
      "answer": "Repository Subscription starts from $3,500/year, Module Subscription from $1,400/year, and Support Subscription from $15,000/year in North America, all varying by region."
    },
    {
      "question": "Does Zabbix publish its Cloud or support pricing?",
      "answer": "No, Zabbix Cloud and technical support subscriptions are not publicly priced and require contacting sales."
    },
    {
      "question": "Which platform has more documented enterprise customers and deployment scale?",
      "answer": "Zabbix, with 300,000+ documented deployments in 190+ countries and named customers including ESA, NATO, Orange, and Dell."
    },
    {
      "question": "Which integrates more explicitly with Ansible, Puppet, and Terraform?",
      "answer": "Icinga explicitly documents automation support via API, Git workflows, Ansible, Puppet, and Terraform."
    },
    {
      "question": "Where are Icinga and Zabbix headquartered?",
      "answer": "Icinga's headquarters is not publicly documented. Zabbix is headquartered in Latvia, with additional offices in the USA, Japan, Brazil, Mexico, and France."
    }
  ]
};

export default icingaVsZabbixContent;
