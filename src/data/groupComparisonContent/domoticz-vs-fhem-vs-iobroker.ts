import type { GroupComparisonContent } from './types';

const domoticzVsFhemVsIobrokerContent: GroupComparisonContent = {
  "verdict": "Domoticz, FHEM, and ioBroker are all free, self-hosted home automation servers, so the choice comes down to hardware constraints, protocol needs, and community fit rather than price. Domoticz's C++ core is the lightest on resources, making it a strong fit for constrained devices like a Raspberry Pi Zero or setups full of legacy 433MHz and RFXCOM hardware. FHEM is the oldest and most mature of the three, with especially deep support for German-market protocols like Homematic and KNX, but its Subversion-based workflow and largely German-language community can be a barrier for English-only users. ioBroker offers by far the largest adapter catalog and a built-in VIS dashboard builder, plus an optional paid ioBroker.pro layer for people who eventually want a managed convenience layer without giving up self-hosting.",
  "bestFor": {
    "domoticz": "Users with very constrained hardware, such as a Raspberry Pi Zero, or homes full of legacy 433MHz, RFXCOM, or Dutch P1 smart meter hardware who want the lightest possible resource footprint.",
    "fhem": "German-speaking hobbyists with Homematic, KNX, or older FS20/FHT hardware who want the most mature, longest-running platform and are comfortable with Perl and a Subversion-based development workflow.",
    "iobroker": "Users who want the largest device and protocol catalog (1,000-plus adapters), a built-in VIS dashboard builder, and the option of a managed ioBroker.pro cloud layer without abandoning self-hosting."
  },
  "highlights": [
    {
      "title": "Domoticz has the lightest resource footprint",
      "description": "Domoticz's C++ core reportedly uses under 50MB of RAM, letting it run on hardware as constrained as a Raspberry Pi Zero, a lighter footprint than either FHEM or ioBroker document for themselves.",
      "toolSlugs": [
        "domoticz"
      ]
    },
    {
      "title": "ioBroker has the largest integration catalog",
      "description": "ioBroker ships with more than 1,000 community-built adapters, well beyond Domoticz's 150-plus supported devices and FHEM's 430-plus modules, covering everything from smart home protocols to cloud voice assistants and industrial data.",
      "toolSlugs": [
        "iobroker"
      ]
    },
    {
      "title": "FHEM is the oldest and most protocol-mature platform",
      "description": "FHEM's development began in 2005, predating both Domoticz and ioBroker, and it carries unusually deep support for older German-market radio-frequency protocols like FS20 and FHT alongside modern standards like KNX and Zigbee.",
      "toolSlugs": [
        "fhem"
      ]
    },
    {
      "title": "All three are free and fully self-hosted at the core",
      "description": "Domoticz, FHEM, and ioBroker are each free and open source at their core, run entirely on hardware the user controls, and require no mandatory cloud account to function.",
      "toolSlugs": [
        "domoticz",
        "fhem",
        "iobroker"
      ]
    },
    {
      "title": "Only ioBroker offers an optional managed cloud layer",
      "description": "ioBroker.pro is a paid, hosted convenience layer offering remote access, backups, and simplified server management for users who don't want to manage the underlying server themselves, an option Domoticz and FHEM don't offer.",
      "toolSlugs": [
        "iobroker"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core platform",
      "rows": [
        {
          "feature": "Lightweight resource footprint (runs on very constrained hardware)",
          "statuses": {
            "domoticz": "available",
            "fhem": "limited",
            "iobroker": "limited"
          },
          "note": "Domoticz is explicitly cited at under 50MB RAM. FHEM publishes no official minimum specs but its cons note it can be more resource-intensive than newer platforms. ioBroker requires at least 1GB of RAM."
        },
        {
          "feature": "Size of device and protocol integration library",
          "statuses": {
            "domoticz": "available",
            "fhem": "available",
            "iobroker": "available"
          },
          "note": "Domoticz supports 150-plus devices, FHEM has 430-plus modules, and ioBroker has 1,000-plus adapters."
        },
        {
          "feature": "Visual, no-code automation editor",
          "statuses": {
            "domoticz": "available",
            "fhem": "unavailable",
            "iobroker": "available"
          },
          "note": "Domoticz and ioBroker both offer a Blockly-based visual editor. FHEM's automation relies on the text-based notify mechanism and the DOIF module rather than a drag-and-drop editor."
        }
      ]
    },
    {
      "group": "Interfaces and access",
      "rows": [
        {
          "feature": "Built-in web dashboard or visualization builder",
          "statuses": {
            "domoticz": "available",
            "fhem": "available",
            "iobroker": "available"
          },
          "note": "Domoticz has a responsive HTML5 interface, FHEM has the FHEMWEB interface, and ioBroker adds the more elaborate drag-and-drop VIS dashboard builder."
        },
        {
          "feature": "Official native mobile app",
          "statuses": {
            "domoticz": "available",
            "fhem": "unavailable",
            "iobroker": "not-documented"
          },
          "note": "Domoticz ships an official Android app. FHEM's cons explicitly note no modern app-store apps. ioBroker's VIS dashboards are browser-viewable on mobile but a dedicated native app is not documented."
        },
        {
          "feature": "Voice assistant integration (Alexa, HomeKit, Google Home)",
          "statuses": {
            "domoticz": "not-documented",
            "fhem": "available",
            "iobroker": "available"
          },
          "note": "FHEM explicitly supports Apple HomeKit and Amazon Alexa; ioBroker explicitly supports Amazon Alexa and Google Home. No equivalent is documented for Domoticz."
        }
      ]
    },
    {
      "group": "Hosting and cost",
      "rows": [
        {
          "feature": "Optional hosted or managed cloud convenience layer",
          "statuses": {
            "domoticz": "unavailable",
            "fhem": "unavailable",
            "iobroker": "available"
          },
          "note": "ioBroker.pro provides a paid hosted layer for remote access and managed backups; Domoticz and FHEM have no equivalent offering."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Domoticz, FHEM, and ioBroker all free?",
      "answer": "Yes. All three are free and open source at their core, with no license fee for the software itself. ioBroker additionally offers an optional paid ioBroker.pro cloud subscription for users who want managed hosting."
    },
    {
      "question": "Which one uses the least system resources?",
      "answer": "Domoticz, whose C++ core is cited at under 50MB of RAM, making it the best documented fit for very low-power hardware like a Raspberry Pi Zero. ioBroker specifies a 1GB RAM minimum, and FHEM publishes no official spec but is described as potentially more resource-intensive."
    },
    {
      "question": "Which has the most device integrations?",
      "answer": "ioBroker, with more than 1,000 community-built adapters, compared to FHEM's 430-plus modules and Domoticz's 150-plus supported devices."
    },
    {
      "question": "Which is best if I only speak English?",
      "answer": "Domoticz has the broadest English-language documentation and community presence of the three. FHEM's community and documentation are predominantly German, and ioBroker's documentation and community also skew toward German speakers, though its adapter catalog and docs have expanded internationally."
    },
    {
      "question": "Which platform is best for legacy Homematic, KNX, or 433MHz hardware?",
      "answer": "FHEM has unusually deep, mature support for older German-market protocols like FS20 and FHT, plus KNX and Homematic. Domoticz also has strong 433MHz/RFXCOM support, and ioBroker covers KNX, Zigbee, Z-Wave, and Homematic through its adapter library."
    },
    {
      "question": "Can I get a hosted version if I don't want to run my own server?",
      "answer": "Only ioBroker offers this directly, through the optional paid ioBroker.pro service, which adds remote access, automated backups, and simplified server management on top of the free self-hosted core. Domoticz and FHEM have no equivalent managed offering."
    }
  ]
};

export default domoticzVsFhemVsIobrokerContent;
