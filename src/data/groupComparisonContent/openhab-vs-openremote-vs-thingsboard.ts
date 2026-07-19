import type { GroupComparisonContent } from './types';

const openhabVsOpenremoteVsThingsboardContent: GroupComparisonContent = {
  "verdict": "openHAB, OpenRemote, and ThingsBoard are all open-source, self-hostable automation platforms with rule engines and broad device-protocol support, but they target different scales of deployment. openHAB is built for home and hobbyist use with the largest binding library and a non-profit governance model, while OpenRemote and ThingsBoard are enterprise-oriented platforms for smart-building, energy, and industrial deployments with asset-centric data models, multi-tenancy, and dashboards. ThingsBoard offers the most structured commercial path with clearly published paid tiers alongside its free Community Edition, while OpenRemote keeps its entire stack open source and monetizes through professional services instead.",
  "bestFor": {
    "openhab": "DIY smart-home enthusiasts and privacy-conscious homeowners who want the largest library of device integrations and a vendor-neutral, foundation-governed platform for a single home or small property.",
    "openremote": "System integrators and enterprises building custom smart-building, energy, or industrial IoT solutions who want a fully open-source stack with no paywalled features, backed by professional services.",
    "thingsboard": "Teams that want an enterprise IoT platform with a genuinely free, unlimited-device Community Edition plus a clear, published upgrade path to paid Professional or Cloud tiers as they scale."
  },
  "highlights": [
    {
      "title": "Home vs. enterprise IoT scale",
      "description": "openHAB is built around single-property home automation, while OpenRemote and ThingsBoard are designed for multi-site, multi-tenant enterprise deployments like smart buildings and industrial IoT.",
      "toolSlugs": [
        "openhab",
        "openremote",
        "thingsboard"
      ]
    },
    {
      "title": "Pricing transparency",
      "description": "ThingsBoard is the only one of the three with published paid pricing tiers, from ten dollars a month up to a Cloud Business plan at 749 dollars a month, while openHAB has no paid tiers at all and OpenRemote's paid services are quoted per project.",
      "toolSlugs": [
        "openhab",
        "openremote",
        "thingsboard"
      ]
    },
    {
      "title": "Device integration breadth",
      "description": "openHAB leads with more than 400 pluggable bindings covering both consumer and commercial ecosystems, while OpenRemote and ThingsBoard focus on a smaller, more industrial set of protocols like MQTT, ModBus, and LoRaWAN.",
      "toolSlugs": [
        "openhab",
        "openremote",
        "thingsboard"
      ]
    },
    {
      "title": "Fully open-source stack",
      "description": "OpenRemote publishes its entire stack, including its most advanced features, as open source with no proprietary fork, distinguishing it from ThingsBoard, which reserves features like white-labeling and Trendz Analytics for paid editions.",
      "toolSlugs": [
        "openremote",
        "thingsboard"
      ]
    },
    {
      "title": "Governance and backing",
      "description": "openHAB is stewarded by a non-profit foundation, OpenRemote is a bootstrapped private company funded by client contracts, and ThingsBoard is a company offering both an open-source edition and commercial cloud products.",
      "toolSlugs": [
        "openhab",
        "openremote",
        "thingsboard"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Scope",
      "rows": [
        {
          "feature": "Asset-centric data model",
          "statuses": {
            "openhab": "not-documented",
            "openremote": "available",
            "thingsboard": "available"
          }
        },
        {
          "feature": "Multi-tenant / multi-site management",
          "statuses": {
            "openhab": "unavailable",
            "openremote": "available",
            "thingsboard": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and Rules",
      "rows": [
        {
          "feature": "Visual rule engine",
          "statuses": {
            "openhab": "available",
            "openremote": "available",
            "thingsboard": "available"
          }
        },
        {
          "feature": "Scripting for advanced logic",
          "statuses": {
            "openhab": "available",
            "openremote": "available",
            "thingsboard": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Device Connectivity and Visualization",
      "rows": [
        {
          "feature": "Breadth of supported protocols and integrations",
          "statuses": {
            "openhab": "available",
            "openremote": "available",
            "thingsboard": "available"
          },
          "note": "openHAB documents 400-plus bindings; OpenRemote and ThingsBoard document a smaller, industrially-focused protocol list."
        },
        {
          "feature": "Prebuilt dashboard widgets",
          "statuses": {
            "openhab": "limited",
            "openremote": "available",
            "thingsboard": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "openhab": "available",
            "openremote": "available",
            "thingsboard": "available"
          }
        },
        {
          "feature": "Published paid pricing tiers",
          "statuses": {
            "openhab": "unavailable",
            "openremote": "unavailable",
            "thingsboard": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for a home rather than a commercial building?",
      "answer": "openHAB, since it is purpose-built for home automation with the widest range of consumer device integrations, whereas OpenRemote and ThingsBoard are oriented toward enterprise and multi-site deployments."
    },
    {
      "question": "Is ThingsBoard's Community Edition really free?",
      "answer": "Yes, ThingsBoard offers a genuinely free, unlimited-device, Apache 2.0-licensed Community Edition for self-hosting, with paid Professional Edition and Cloud tiers reserved for features like white-labeling and advanced role management."
    },
    {
      "question": "Does OpenRemote have any paid plans?",
      "answer": "OpenRemote's core software is entirely free and open source with no paywalled features. The company generates revenue through professional services and managed hosting quoted per project rather than published subscription tiers."
    },
    {
      "question": "Can openHAB handle enterprise or multi-building deployments?",
      "answer": "openHAB is architected around a single installation for one property and does not offer the multi-tenant realm isolation that OpenRemote and ThingsBoard provide for managing multiple sites or organizations."
    },
    {
      "question": "Which platform has the largest device integration library?",
      "answer": "openHAB, with more than 400 pluggable bindings covering consumer and commercial device ecosystems, compared to the smaller, more industrially-focused protocol lists of OpenRemote and ThingsBoard."
    }
  ]
};

export default openhabVsOpenremoteVsThingsboardContent;
