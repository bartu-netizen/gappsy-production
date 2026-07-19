import type { GroupComparisonContent } from './types';

const asteriskVsFreepbxVsFreeswitchContent: GroupComparisonContent = {
  "verdict": "Asterisk, FreePBX, and FreeSWITCH are the three pillars of open-source telephony, but they sit at different layers of the stack rather than being pure substitutes for each other. FreePBX is literally a web GUI built on top of Asterisk, so choosing between them is less an either-or than deciding whether you want to configure Asterisk directly or manage it through FreePBX's point-and-click interface. FreeSWITCH is the true alternative engine to Asterisk, favored when WebRTC, video, or carrier-grade concurrency matter more than out-of-the-box administrative tooling.",
  "bestFor": {
    "asterisk": "Developers and integrators who want full control over a customizable open-source telephony engine via dialplan scripting and AGI/AMI/ARI APIs",
    "freepbx": "IT admins and MSPs who want a free, GUI-managed business phone system built on Asterisk without writing dialplan by hand",
    "freeswitch": "Engineers building high-concurrency, WebRTC- or video-centric communications platforms who need a lower-level, embeddable telephony engine"
  },
  "highlights": [
    {
      "title": "The 25-year-old open-source PBX foundation",
      "description": "Asterisk has been the base telephony engine since 1999 and is extensible through its dialplan and AGI, AMI, and ARI APIs, making it the underlying engine that other tools, including FreePBX, are commonly built on top of.",
      "toolSlugs": [
        "asterisk"
      ]
    },
    {
      "title": "A GUI layer with over a million installations",
      "description": "FreePBX turns Asterisk's text-based configuration into a point-and-click interface, adding call queues, an Endpoint Manager for provisioning SIP phones, and a module marketplace, and it reports powering more than a million business phone system installs worldwide.",
      "toolSlugs": [
        "freepbx"
      ]
    },
    {
      "title": "Native WebRTC and video built in",
      "description": "FreeSWITCH supports SIP over WebSocket and WebRTC natively and adds MCU-style video conferencing and transcoding, positioning it ahead of many competing engines for browser-based real-time communications.",
      "toolSlugs": [
        "freeswitch"
      ]
    },
    {
      "title": "Designed for carrier-grade scale",
      "description": "FreeSWITCH's architecture is documented as suited to handling large volumes of concurrent calls, from a Raspberry Pi to multi-core data center servers, making it a common choice as an embedded engine inside commercial VoIP and contact-center platforms.",
      "toolSlugs": [
        "freeswitch"
      ]
    },
    {
      "title": "All free, self-hosted, with a commercial steward behind them",
      "description": "Every core engine is free and open source with no license fees. Asterisk and FreePBX are stewarded by Sangoma Technologies, while FreeSWITCH is stewarded by SignalWire, founded by FreeSWITCH's original creators, giving each project a well-resourced commercial backer without forcing a paid tier on self-hosters.",
      "toolSlugs": [
        "asterisk",
        "freepbx",
        "freeswitch"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Administration",
      "rows": [
        {
          "feature": "Built-in graphical admin interface",
          "statuses": {
            "asterisk": "unavailable",
            "freepbx": "available",
            "freeswitch": "unavailable"
          },
          "note": "Asterisk and FreeSWITCH are configured via text-based dialplan/config files or third-party front ends; FreePBX exists specifically to provide the GUI Asterisk lacks."
        },
        {
          "feature": "Call queues with agent management",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "available",
            "freeswitch": "not-documented"
          }
        },
        {
          "feature": "Endpoint or phone provisioning management",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "available",
            "freeswitch": "not-documented"
          },
          "note": "FreePBX's Endpoint Manager module centrally provisions Sangoma and third-party SIP desk phones."
        }
      ]
    },
    {
      "group": "Protocols and Scale",
      "rows": [
        {
          "feature": "Native WebRTC support",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "not-documented",
            "freeswitch": "available"
          }
        },
        {
          "feature": "Video conferencing and transcoding",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "not-documented",
            "freeswitch": "available"
          }
        },
        {
          "feature": "Documented for carrier-grade, high-concurrency scale",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "not-documented",
            "freeswitch": "available"
          }
        }
      ]
    },
    {
      "group": "Support and Extensibility",
      "rows": [
        {
          "feature": "Commercial or professional support option available",
          "statuses": {
            "asterisk": "not-documented",
            "freepbx": "available",
            "freeswitch": "available"
          },
          "note": "FreePBX offers commercial modules and Sangoma's PBXact; FreeSWITCH offers SignalWire's FreeSWITCH Advantage support plan and its usage-based cloud platform."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the actual difference between Asterisk and FreePBX?",
      "answer": "FreePBX is not a competing telephony engine; it is a free, web-based graphical management interface built on top of Asterisk. Choosing FreePBX means you get Asterisk's engine underneath plus a point-and-click GUI for extensions, trunks, IVRs, and call queues instead of hand-editing dialplan files."
    },
    {
      "question": "Which is best for a small business that wants a phone system without deep telephony expertise?",
      "answer": "FreePBX is the most approachable of the three because it wraps Asterisk's configuration in a GUI, and its documented hardware guidance shows it can run a small deployment on a modest server with about 4GB of RAM."
    },
    {
      "question": "Which is best for WebRTC or video-heavy communications apps?",
      "answer": "FreeSWITCH is the strongest documented fit, with native SIP-over-WebSocket and WebRTC support plus MCU-style video conferencing and transcoding built into the engine."
    },
    {
      "question": "Do any of these three cost money?",
      "answer": "All three core engines are free and open source with no license fees. FreePBX has optional paid commercial modules and Sangoma's PBXact for professional support, and FreeSWITCH has SignalWire's optional Advantage support plan and usage-based cloud platform; neither requires payment to run a functional system."
    },
    {
      "question": "Is FreeSWITCH a drop-in replacement for Asterisk plus FreePBX?",
      "answer": "Not out of the box. FreeSWITCH is documented as a bare telephony engine with no administrative dashboard, provisioning system, or billing tools, so replicating what Asterisk plus FreePBX delivers out of the box requires building or buying that administrative layer separately."
    },
    {
      "question": "Which requires the least Linux and telephony expertise to run?",
      "answer": "All three require self-hosting and Linux systems knowledge, but FreePBX reduces the telephony-specific learning curve the most since its GUI handles dialplan generation; Asterisk and FreeSWITCH both expect comfort with text-based configuration and, for FreeSWITCH, additional engineering work to reach a production-ready system."
    }
  ]
};

export default asteriskVsFreepbxVsFreeswitchContent;
