import type { GroupComparisonContent } from './types';

const cortezaVsEspocrmVsTwentyContent: GroupComparisonContent = {
  "verdict": "Corteza, EspoCRM, and Twenty are all free-to-self-host, open-source CRMs, but they solve different problems. Corteza bundles CRM with a general low-code app builder and internal messaging under a permissive Apache 2.0 license, EspoCRM is the most mature and feature-complete standalone CRM of the three with a mature extension ecosystem, and Twenty is the newest and most developer-modern option, built on TypeScript with a spreadsheet-like interface and AI-assisted setup. Teams choosing between them are really choosing between breadth (Corteza), maturity (EspoCRM), and cutting-edge developer experience (Twenty), not picking a single 'best' CRM.",
  "bestFor": {
    "corteza": "Organizations that want CRM, workflow automation, and internal team messaging combined in one self-hosted, license-fee-free platform.",
    "espocrm": "Small and midsize businesses that want a mature, self-hostable CRM with an established extension marketplace and an optional managed Cloud plan.",
    "twenty": "Technical teams that want a modern, spreadsheet-style CRM with a developer SDK and AI-assisted customization tools."
  },
  "highlights": [
    {
      "title": "Only one bundles CRM, low-code, and messaging",
      "description": "Corteza is the sole option here that ships an enterprise messaging module and a general-purpose low-code app builder alongside its CRM, letting teams build additional internal tools on the same platform.",
      "toolSlugs": [
        "corteza"
      ]
    },
    {
      "title": "Most established extension ecosystem",
      "description": "EspoCRM has been in active development since 2014 and offers official paid extensions like the Advanced Pack and Sales Pack for workflow automation, quoting, and invoicing, all bundled free into its EspoCRM Cloud plans.",
      "toolSlugs": [
        "espocrm"
      ]
    },
    {
      "title": "Modern developer-first architecture",
      "description": "Twenty is built on a TypeScript and React stack with a dedicated SDK for custom server-side logic and components, plus integrations with AI coding tools like Claude and Cursor for faster configuration.",
      "toolSlugs": [
        "twenty"
      ]
    },
    {
      "title": "License terms differ in ways that matter for redistribution",
      "description": "Corteza uses the permissive Apache 2.0 license, while EspoCRM and Twenty are both AGPLv3, which requires organizations that redistribute a modified, hosted version to open-source those changes or buy a commercial license.",
      "toolSlugs": [
        "corteza",
        "espocrm",
        "twenty"
      ]
    },
    {
      "title": "Transparent managed-cloud pricing",
      "description": "EspoCRM Cloud and Twenty Cloud both publish fixed per-user monthly pricing for teams that do not want to self-host, while Corteza's support and hosting options are quoted directly by Planet Crust.",
      "toolSlugs": [
        "espocrm",
        "twenty"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Hosting",
      "rows": [
        {
          "feature": "Free self-hosted deployment",
          "statuses": {
            "corteza": "available",
            "espocrm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Published managed-cloud pricing",
          "statuses": {
            "corteza": "unavailable",
            "espocrm": "available",
            "twenty": "available"
          },
          "note": "Corteza offers paid support and managed hosting from Planet Crust, but pricing is custom rather than published per-user rates."
        },
        {
          "feature": "Permissive (non-network-copyleft) license",
          "statuses": {
            "corteza": "available",
            "espocrm": "unavailable",
            "twenty": "unavailable"
          },
          "note": "Corteza is Apache 2.0; EspoCRM and Twenty are both AGPLv3."
        }
      ]
    },
    {
      "group": "Core CRM Capabilities",
      "rows": [
        {
          "feature": "Built-in CRM application out of the box",
          "statuses": {
            "corteza": "available",
            "espocrm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "No-code custom objects, fields, and views",
          "statuses": {
            "corteza": "available",
            "espocrm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Native enterprise messaging or chat module",
          "statuses": {
            "corteza": "available",
            "espocrm": "unavailable",
            "twenty": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Automation and Extensibility",
      "rows": [
        {
          "feature": "Built-in workflow automation on the free self-hosted tier",
          "statuses": {
            "corteza": "available",
            "espocrm": "limited",
            "twenty": "available"
          },
          "note": "EspoCRM's Advanced Pack workflow and BPM tools are a paid add-on for self-hosted installs, though included free in EspoCRM Cloud."
        },
        {
          "feature": "Dedicated developer SDK for custom extensions",
          "statuses": {
            "corteza": "limited",
            "espocrm": "available",
            "twenty": "available"
          },
          "note": "Corteza exposes a REST API and webhooks but does not document a dedicated extension SDK the way EspoCRM's module framework and the Twenty SDK do."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Corteza, EspoCRM, and Twenty all completely free to self-host?",
      "answer": "Yes for the core CRM. Corteza and Twenty include their full Pro-level feature sets in the free self-hosted version, while EspoCRM's self-hosted core is free but its official Advanced Pack and Sales Pack extensions are sold separately."
    },
    {
      "question": "Which one is best for a team that wants CRM plus general internal tools?",
      "answer": "Corteza, since it combines its CRM module with a broader low-code application builder and an enterprise messaging tool in the same self-hosted platform."
    },
    {
      "question": "Which has the most mature, battle-tested feature set?",
      "answer": "EspoCRM, which has been developed since 2014 and offers official integrations for VoIP, calendars, payments, and a documented extension marketplace."
    },
    {
      "question": "Which is easiest for a developer-heavy team to customize?",
      "answer": "Twenty, which is built on a modern TypeScript and React codebase with a dedicated SDK and AI-assisted development workflows."
    },
    {
      "question": "Do the AGPLv3 licenses on EspoCRM and Twenty affect how a company can use them?",
      "answer": "Only if a company modifies the software and offers it as a hosted product to others; in that case AGPLv3 requires releasing those modifications as open source or purchasing a commercial license. Internal self-hosted use is unaffected."
    },
    {
      "question": "Which offers the simplest path to a managed, non-self-hosted plan?",
      "answer": "Both EspoCRM Cloud and Twenty Cloud publish fixed per-user monthly pricing, while Corteza's managed hosting is arranged directly with Planet Crust on a custom basis."
    }
  ]
};

export default cortezaVsEspocrmVsTwentyContent;
