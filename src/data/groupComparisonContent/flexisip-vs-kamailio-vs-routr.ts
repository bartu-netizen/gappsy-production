import type { GroupComparisonContent } from './types';

const flexisipVsKamailioVsRoutrContent: GroupComparisonContent = {
  "verdict": "Flexisip, Kamailio, and Routr are all free, self-hostable SIP servers, but they sit at different points on the maturity-versus-simplicity spectrum. Kamailio is the veteran choice for carriers and VoIP providers who need proven, extreme-scale performance and are comfortable with a steep configuration learning curve. Flexisip brings a more modular, feature-complete suite out of the box, including presence, push notifications and encrypted messaging, backed by an optional commercial license, making it a natural fit for teams already in the Linphone ecosystem. Routr is the newest and most cloud-native of the three, built for Docker and Kubernetes deployment with REST API, CLI and GUI control, appealing to teams that want infrastructure-as-code style SIP infrastructure over raw telecom-grade throughput.",
  "bestFor": {
    "flexisip": "Teams that want a modular SIP suite with presence, push notifications and end-to-end encrypted messaging built in, especially those pairing it with Linphone clients or wanting an optional commercial license and vendor support.",
    "kamailio": "Carriers and VoIP service providers that need extreme, battle-tested throughput and are willing to invest in SIP expertise to configure a highly extensible routing engine.",
    "routr": "Cloud-native teams who want to deploy a lightweight SIP proxy, registrar and location server on Docker or Kubernetes and manage it through a REST API, CLI or web GUI."
  },
  "highlights": [
    {
      "title": "Flexisip bundles presence, push and encrypted messaging",
      "description": "Flexisip ships dedicated modules for RFC 8599 mobile push notifications, SIP SIMPLE presence, a B2BUA for media/identity bridging, and LIME-based end-to-end encrypted messaging, giving operators more built-in capability than a bare SIP proxy.",
      "toolSlugs": [
        "flexisip"
      ]
    },
    {
      "title": "Kamailio has the longest track record at the largest scale",
      "description": "Dating back to 2001 as SIP Express Router, Kamailio is described by its maintainers as routing billions of VoIP minutes globally every month, with asynchronous TCP/UDP/SCTP transport built for thousands of call setups per second.",
      "toolSlugs": [
        "kamailio"
      ]
    },
    {
      "title": "Routr is purpose-built for Docker and Kubernetes",
      "description": "Routr ships as a Docker image with Helm charts for Kubernetes, plus a REST API, CLI and web GUI, making it the most straightforward of the three to fit into a cloud-native, infrastructure-as-code deployment workflow.",
      "toolSlugs": [
        "routr"
      ]
    },
    {
      "title": "Support models diverge sharply",
      "description": "Flexisip is the only one of the three with an optional paid commercial license and direct vendor support from Belledonne Communications. Kamailio explicitly has no official vendor support and relies on community or third-party consultants, while Routr has no documented managed or support tier at all.",
      "toolSlugs": [
        "flexisip",
        "kamailio",
        "routr"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core SIP Signaling",
      "rows": [
        {
          "feature": "SIP proxy and registrar routing",
          "statuses": {
            "flexisip": "available",
            "kamailio": "available",
            "routr": "available"
          }
        },
        {
          "feature": "Presence server (SIP SIMPLE/XCAP)",
          "statuses": {
            "flexisip": "available",
            "kamailio": "available",
            "routr": "not-documented"
          }
        },
        {
          "feature": "Mobile push notifications (APNs/FCM via RFC 8599)",
          "statuses": {
            "flexisip": "available",
            "kamailio": "not-documented",
            "routr": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Scale",
      "rows": [
        {
          "feature": "Docker/Kubernetes-native deployment tooling",
          "statuses": {
            "flexisip": "limited",
            "kamailio": "not-documented",
            "routr": "available"
          },
          "note": "Flexisip supports Docker and Nix-based reproducible builds; Routr ships dedicated Helm charts for Kubernetes."
        },
        {
          "feature": "Lightweight/embedded and IoT-capable footprint",
          "statuses": {
            "flexisip": "available",
            "kamailio": "not-documented",
            "routr": "not-documented"
          }
        },
        {
          "feature": "Multi-tenant, multi-domain isolation",
          "statuses": {
            "flexisip": "not-documented",
            "kamailio": "not-documented",
            "routr": "available"
          }
        }
      ]
    },
    {
      "group": "Management and Support",
      "rows": [
        {
          "feature": "REST API, CLI or GUI administration",
          "statuses": {
            "flexisip": "limited",
            "kamailio": "available",
            "routr": "available"
          },
          "note": "Flexisip's REST provisioning is scoped to its Account Manager module; Kamailio exposes JSON-RPC/XML-RPC/SNMP; Routr offers a full REST API, CLI and web GUI."
        },
        {
          "feature": "Official commercial license or vendor support",
          "statuses": {
            "flexisip": "available",
            "kamailio": "unavailable",
            "routr": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Flexisip, Kamailio, and Routr is best for a large-scale carrier deployment?",
      "answer": "Kamailio has the longest operating history in this comparison and is reported to route billions of VoIP minutes monthly, making it the most proven option for carrier-grade, extreme-throughput deployments. Flexisip has also run production infrastructure since 2011 via linphone.org, while Routr is the newest of the three with a smaller published track record."
    },
    {
      "question": "Can any of these three run on Kubernetes?",
      "answer": "Routr is explicitly built for Docker and Kubernetes, shipping with Helm charts for cluster deployment. Flexisip supports Docker-based and Nix-based reproducible builds but does not document Kubernetes-specific tooling, and Kamailio's containerization approach is not detailed in the provided data."
    },
    {
      "question": "Do Flexisip, Kamailio, and Routr include mobile push notifications for iOS and Android?",
      "answer": "Flexisip has a dedicated Push Notification module implementing RFC 8599 for waking mobile SIP clients via Apple's APNs and Google Firebase. Push notification support is not documented for Kamailio or Routr in their published feature sets."
    },
    {
      "question": "Is commercial support available for any of these SIP servers?",
      "answer": "Flexisip is the only one of the three offering an official paid commercial license with direct vendor support from Belledonne Communications. Kamailio's maintainers explicitly note there is no official vendor support, relying instead on community or third-party consultants, and Routr has no documented managed support tier."
    },
    {
      "question": "Which tool has built-in presence and instant messaging features?",
      "answer": "Both Flexisip and Kamailio document dedicated presence server capability using SIP SIMPLE and XCAP standards, with Flexisip adding LIME-based end-to-end encrypted messaging. Routr's documented feature set covers proxy, registrar, and location server roles but does not mention presence or messaging."
    },
    {
      "question": "Do any of these three offer a hosted or managed SaaS version?",
      "answer": "No. All three are self-hosted, open-source SIP servers with no official managed SaaS tier from their maintainers. Flexisip's commercial license covers licensing and support, not hosting; Kamailio and Routr both require the deploying organization to run and operate their own infrastructure."
    }
  ]
};

export default flexisipVsKamailioVsRoutrContent;
