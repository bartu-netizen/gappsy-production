import type { ToolComparisonContent } from './types';

const activepiecesVsNagiosContent: ToolComparisonContent = {
  "verdict": "activepieces is a workflow automation platform for building AI-driven processes across HR, finance, marketing, and sales, priced per active flow ($5/month on the Standard plan) with self-hosted or cloud deployment. Nagios is an IT infrastructure monitoring engine that watches servers, networks, and applications via a free open-source Core plus a paid Nagios XI edition with pre-installed plugins and enterprise dashboards. They solve different problems — automating business processes versus monitoring infrastructure health — so category fit matters more here than a feature-by-feature comparison.",
  "bestForToolA": "Teams that want to automate repetitive workflows across HR, finance, marketing, or sales, using a library of app integrations (\"pieces\") like Gmail, paying usage-based per active flow ($5/month Standard) instead of a flat per-seat fee.",
  "bestForToolB": "IT and ops teams that need to monitor servers, networks, and applications, especially those wanting a mature, 25+ year-old plugin ecosystem (thousands of community checks like check_ping and check_cpu) with the option to scale checks across large environments via Mod-Gearman.",
  "whoNeedsBoth": "An ops team could run Nagios to monitor infrastructure health and use activepieces to automate the response workflow, such as routing an alert into a notification or escalation process, though the facts don't document a direct Nagios-activepieces integration.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "activepieces is a workflow/process automation platform built for \"a self-driven AI culture across HR, finance, marketing, sales and more.\"",
      "toolB": "Nagios is an infrastructure monitoring engine for servers, networks, and applications, using a plugin-based architecture with thousands of community checks.",
      "whyItMatters": "These tools address fundamentally different jobs, so category fit should drive the decision more than a feature comparison.",
      "benefitsWho": "Buyers need to first confirm whether they need process automation or infrastructure monitoring before comparing further."
    },
    {
      "title": "Pricing Model",
      "toolA": "activepieces charges $5/month per active flow on the Standard plan (usage-based), with a custom-priced annual Ultimate tier.",
      "toolB": "Nagios Core is entirely free and open source; Nagios XI pricing is not published and requires contacting sales.",
      "whyItMatters": "Usage-based per-flow pricing scales differently than a free-core/paid-XI licensing model.",
      "benefitsWho": "Teams automating a small number of flows benefit from activepieces' low $5 entry price; teams needing enterprise monitoring dashboards need to budget for an unpublished Nagios XI quote."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "activepieces supports both cloud and self-hosted deployment.",
      "toolB": "Nagios Core is a self-hosted open-source engine; Nagios XI adds pre-installed plugins and wizards, with dashboard specifics documented but not deployment details beyond that.",
      "whyItMatters": "Deployment flexibility affects data residency, compliance, and operational overhead.",
      "benefitsWho": "Teams with strict hosting requirements can self-host either tool, but activepieces documents an explicit cloud option too."
    },
    {
      "title": "Extensibility Ecosystem",
      "toolA": "activepieces' value comes from its integrations library (\"pieces\"), such as Gmail, for connecting workflows to external apps.",
      "toolB": "Nagios' value comes from a plugin architecture with thousands of community-built checks (check_ping, check_ssh, check_cpu, check_memory) plus Mod-Gearman for scaling checks.",
      "whyItMatters": "The size and focus of each ecosystem determines what's realistically automatable or monitorable out of the box.",
      "benefitsWho": "Automation-focused teams benefit from activepieces' app integrations; infrastructure teams benefit from Nagios' monitoring plugin depth."
    },
    {
      "title": "Track Record & Maturity",
      "toolA": "activepieces' founding year is not documented in available facts.",
      "toolB": "Nagios has 25+ years of development history and enterprise adoption, per its documented pros.",
      "whyItMatters": "Longer track records typically mean more battle-tested reliability and a larger accumulated plugin/check ecosystem.",
      "benefitsWho": "Risk-averse enterprise IT buyers who value Nagios' long operating history for mission-critical monitoring."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Workflow/process automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Infrastructure monitoring (servers/network/apps)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Plugin/integration ecosystem",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces 'pieces' (e.g. Gmail) vs. thousands of Nagios community plugins"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Nagios Core is free open source; activepieces starts at $5/active flow"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "activepieces Standard $5/month per active flow; Nagios XI pricing unpublished"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces Ultimate (custom annual) vs. Nagios XI (contact sales)"
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Scalability tooling for large environments",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nagios Mod-Gearman distributes checks"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are activepieces and Nagios competitors?",
      "answer": "Not directly — activepieces is a workflow automation platform for business processes (HR, finance, marketing, sales), while Nagios is an IT infrastructure monitoring engine for servers and networks. They serve different jobs rather than competing head-to-head."
    },
    {
      "question": "How does pricing compare?",
      "answer": "activepieces charges $5/month per active flow on its Standard plan, usage-based rather than a flat seat fee, with a custom-priced Ultimate tier. Nagios Core is free and open source, while the enterprise Nagios XI edition requires contacting sales for pricing."
    },
    {
      "question": "Can both be self-hosted?",
      "answer": "Yes — activepieces supports both self-hosted and cloud deployment, and Nagios Core is a self-hosted open-source engine (Nagios XI is the paid enterprise edition)."
    },
    {
      "question": "Which has a bigger ecosystem of integrations or plugins?",
      "answer": "Nagios documents thousands of community-built plugins (e.g. check_ping, check_ssh, check_cpu, check_memory). activepieces documents a large integrations library of \"pieces\" such as Gmail, though an exact count isn't published in available data."
    },
    {
      "question": "Does either tool scale to large environments?",
      "answer": "Nagios documents Mod-Gearman for distributing checks across large environments. activepieces' scaling story isn't detailed beyond its usage-based per-flow pricing model."
    },
    {
      "question": "Which tool has more operating history?",
      "answer": "Nagios has a documented 25+ years of development history and enterprise adoption. activepieces' founding year is not publicly documented."
    }
  ]
};

export default activepiecesVsNagiosContent;
