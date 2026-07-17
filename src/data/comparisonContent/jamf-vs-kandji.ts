import type { ToolComparisonContent } from './types';

const jamfVsKandjiContent: ToolComparisonContent = {
  "verdict": "Jamf and Kandji are both purpose-built Apple device management platforms, but they come from different eras and serve different priorities. Jamf, founded in 2002, is the longer-tenured platform with the broadest product line: full macOS and iOS management, dedicated classroom and shared-iPad tools for education, and separately sold security (Jamf Protect) and identity (Jamf Connect) modules, plus a mobile plan that extends to Android. Kandji, founded in 2018, is a newer, Apple-only platform built around Blueprints for reusable configuration, an Auto Apps catalog that keeps software patched automatically, and built-in compliance templates for frameworks like SOC 2 and HIPAA, with EDR running on the same agent as its MDM. Neither publishes full pricing outright, but Kandji at least discloses per-device starting rates while Jamf requires a sales conversation across the board. The right choice depends on fit: organizations needing Android support, K-12 classroom workflows, or an all-in-one vendor spanning MDM, security, and identity tend to lean Jamf. Teams that are Apple-only, want fast compliance audit prep, and prefer a newer admin interface tend to lean Kandji. Neither is a universal winner.",
  "bestForToolA": "Jamf fits organizations that need Android device support alongside Apple, K-12 schools needing classroom and shared-iPad workflows, or teams that want device management, endpoint security, and identity from a single long-established vendor.",
  "bestForToolB": "Kandji fits Apple-only IT teams that want reusable Blueprints, automatically patched Auto Apps, built-in EDR on the MDM agent, and pre-built compliance templates for frameworks like SOC 2 or HIPAA.",
  "whoNeedsBoth": "A larger enterprise with a mixed Apple and Android fleet might run Kandji for its streamlined Apple-specific Blueprint and compliance workflows while relying on Jamf for Mobile or another tool to cover Android devices outside Kandji's Apple-only scope.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Jamf lists every plan, including Jamf Now, as Contact for pricing with no published rates.",
      "toolB": "Kandji publishes starting per-device rates, from $1.60/device/month for iOS, iPadOS, and tvOS and $3.20/device/month for Mac, though a final quote still requires sales.",
      "whyItMatters": "Buyers comparing MDM options often want at least a ballpark cost before engaging a sales team, and one vendor gives that while the other does not.",
      "benefitsWho": "Budget-conscious IT buyers and smaller teams doing early-stage vendor comparison benefit from Kandji's published starting rates."
    },
    {
      "title": "Company history and market maturity",
      "toolA": "Jamf was founded in 2002 and is headquartered in Minneapolis, Minnesota.",
      "toolB": "Kandji was founded in 2018 and is headquartered in San Diego, California.",
      "whyItMatters": "A longer track record can mean more field-tested workflows and integrations, while a newer platform can mean a more modern architecture built without legacy constraints.",
      "benefitsWho": "Enterprises wanting a proven, long-standing vendor lean toward Jamf, while teams wanting a newer platform built without legacy baggage lean toward Kandji."
    },
    {
      "title": "Android device support",
      "toolA": "Jamf offers a dedicated Jamf for Mobile plan covering iOS, iPadOS, and Android device management, and is tagged for Android support.",
      "toolB": "Kandji's core platform was built specifically for Apple's ecosystem, macOS, iOS, iPadOS, and tvOS, and is not documented as supporting Android.",
      "whyItMatters": "Mixed-fleet organizations that issue both Apple and Android hardware need one console that covers both, or accept running two tools.",
      "benefitsWho": "IT teams managing mixed Apple and Android fleets benefit from Jamf's broader platform coverage."
    },
    {
      "title": "Security and identity: bundled versus modular",
      "toolA": "Jamf sells endpoint security (Jamf Protect) and identity and access management (Jamf Connect) as separate add-on products alongside its core MDM.",
      "toolB": "Kandji runs EDR as an add-on module on the same lightweight agent as its MDM, and connects to identity providers like Okta and Google Workspace rather than offering its own identity product.",
      "whyItMatters": "How security and identity are packaged affects both total cost and how many agents or consoles IT has to manage.",
      "benefitsWho": "Teams wanting a single vendor for MDM, security, and identity may prefer Jamf's fuller product line, while teams wanting one lightweight agent for MDM and EDR may prefer Kandji."
    },
    {
      "title": "Compliance framework tooling",
      "toolA": "Jamf's documented feature set does not include a named compliance-framework template feature.",
      "toolB": "Kandji offers One-Click Compliance Templates mapped to frameworks such as SOC 2, HIPAA, ISO 27001, and PCI DSS, applied directly to a Blueprint.",
      "whyItMatters": "Teams preparing for security audits can save significant setup time if compliance controls are pre-built into the platform.",
      "benefitsWho": "IT and security teams preparing for SOC 2, HIPAA, or similar audits benefit from Kandji's built-in templates."
    },
    {
      "title": "Small-team and small-business options",
      "toolA": "Jamf Now is explicitly aimed at organizations with fewer than 25 employees, with a simplified plan structure.",
      "toolB": "Kandji's cons note that minimum device commitments can make it a poor fit for very small teams with only a few Apple devices.",
      "whyItMatters": "Very small organizations need a plan sized and priced for their scale rather than an enterprise-first structure.",
      "benefitsWho": "Small businesses and startups with under 25 employees are better served by Jamf Now than by Kandji's device-commitment model."
    },
    {
      "title": "Education and classroom workflows",
      "toolA": "Jamf provides dedicated classroom and shared-device tools, including locking iPads into single-app mode and managing shared iPad configurations and school app catalogs, and offers Jamf School for K-12.",
      "toolB": "Kandji's documented feature set does not include education- or classroom-specific tooling.",
      "whyItMatters": "Schools have workflow needs, like shared devices and single-app testing mode, that a generic business MDM does not address.",
      "benefitsWho": "K-12 schools and districts benefit from Jamf's education-specific tooling."
    },
    {
      "title": "App configuration approach",
      "toolA": "Jamf pushes configuration profiles, restrictions, and app installs through policy and profile management, with a self-service app catalog for end users and scheduled or policy-driven patch management.",
      "toolB": "Kandji uses Blueprints, reusable bundles of apps, scripts, and configuration profiles continuously enforced on assigned devices, plus Auto Apps, a catalog of business applications Kandji packages and keeps automatically updated.",
      "whyItMatters": "The underlying model for how configuration and patching are defined and reused affects how much repetitive setup work admins face as the fleet grows.",
      "benefitsWho": "Admins who want a single reusable policy object applied continuously across groups may prefer Kandji's Blueprint model, while admins comfortable with traditional profiles and policies may find Jamf's approach familiar."
    },
    {
      "title": "Out-of-box onboarding experience",
      "toolA": "Jamf's documented feature set does not include a named branded onboarding experience distinct from standard zero-touch deployment.",
      "toolB": "Kandji offers Liftoff Custom Onboarding, a branded out-of-box setup experience guiding new users through account creation and initial configuration during enrollment.",
      "whyItMatters": "A polished first-run experience can reduce help desk tickets from new hires setting up devices for the first time.",
      "benefitsWho": "Organizations that want a customized, branded first-run experience for new employees benefit from Kandji's Liftoff feature."
    },
    {
      "title": "Named third-party integrations",
      "toolA": "Jamf's provided facts describe identity via its own Jamf Connect product rather than naming specific third-party identity, chat, or ticketing integrations, though it is tagged as offering an API.",
      "toolB": "Kandji documents specific integrations with identity providers like Okta and Google Workspace, plus tools such as Slack, SIEM platforms, and ticketing systems, along with an API for scripting Blueprint assignment and reporting.",
      "whyItMatters": "Teams with an existing toolchain of identity providers, chat, and ticketing systems want confirmation a platform connects to what they already use.",
      "benefitsWho": "IT teams with an established stack of Okta, Google Workspace, Slack, or SIEM tools benefit from Kandji's documented integration list."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and enrollment",
      "rows": [
        {
          "feature": "Zero-touch deployment via Apple Business Manager or Apple School Manager",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated device enrollment for new devices",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shared or classroom device provisioning (e.g. shared iPad, single-app mode)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Jamf's classroom and shared-device tools are explicitly documented; Kandji's facts do not describe an equivalent."
        }
      ]
    },
    {
      "group": "App and patch management",
      "rows": [
        {
          "feature": "End-user self-service app catalog",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated third-party app patching",
          "toolA": "available",
          "toolB": "available",
          "note": "Jamf calls this patch management; Kandji calls this Auto Apps."
        },
        {
          "feature": "Reusable configuration bundles applied continuously to device groups",
          "toolA": "limited",
          "toolB": "available",
          "note": "Jamf offers policy and profile management plus smart groups; Kandji has a named Blueprint feature for this specific workflow."
        }
      ]
    },
    {
      "group": "Security",
      "rows": [
        {
          "feature": "Endpoint threat detection and response",
          "toolA": "available",
          "toolB": "available",
          "note": "Both sell this as an add-on: Jamf Protect for Jamf, Kandji EDR for Kandji."
        },
        {
          "feature": "Remote lock and wipe",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Dedicated identity and access management product",
          "toolA": "available",
          "toolB": "limited",
          "note": "Jamf sells Jamf Connect as its own identity product; Kandji instead connects to third-party identity providers like Okta and Google Workspace."
        }
      ]
    },
    {
      "group": "Compliance and reporting",
      "rows": [
        {
          "feature": "Pre-built compliance framework templates (SOC 2, HIPAA, ISO 27001, PCI DSS)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Device inventory and compliance reporting dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SIEM and ticketing system integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Platform support",
      "rows": [
        {
          "feature": "macOS device management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "iOS and iPadOS device management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Android device management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Available via the Jamf for Mobile plan; Kandji's core platform is built for the Apple ecosystem only."
        },
        {
          "feature": "Windows device management",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Jamf offers less depth for Windows-heavy fleets per its own documented cons; Kandji's cons state it is built exclusively around Apple devices."
        }
      ]
    },
    {
      "group": "Onboarding and admin experience",
      "rows": [
        {
          "feature": "Branded custom out-of-box onboarding experience",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kandji calls this Liftoff Custom Onboarding."
        },
        {
          "feature": "Modern, easy-to-learn admin console",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Described in Kandji's own documented pros relative to older MDM tools; not addressed in Jamf's provided facts."
        }
      ]
    },
    {
      "group": "Small business and education fit",
      "rows": [
        {
          "feature": "Simplified plan for teams under 25 employees",
          "toolA": "available",
          "toolB": "limited",
          "note": "Jamf Now targets this segment directly; Kandji's documented cons cite minimum device commitments as a poor fit for very small teams."
        },
        {
          "feature": "Education-specific classroom tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Jamf or Kandji?",
      "answer": "Kandji publishes starting per-device prices, from $1.60/device/month for iOS, iPadOS, and tvOS and $3.20/device/month for Mac, while Jamf lists every plan, including Jamf Now, as Contact for pricing with no published rates, so Kandji is more transparent about starting cost even though both require a final sales quote."
    },
    {
      "question": "Is Kandji easier to use than Jamf for beginners?",
      "answer": "Kandji's own documented pros describe it as having a modern, relatively easy-to-learn admin console compared with older MDM tools, a claim not addressed in Jamf's provided facts, so buyers evaluating ease of use for new admins should weigh Kandji's stated interface advantage against Jamf's longer track record and broader configuration options."
    },
    {
      "question": "Does Jamf or Kandji support Windows devices?",
      "answer": "Neither is built primarily for Windows: Jamf's documented cons state it offers less depth for Windows-heavy fleets despite having some Windows tagging, while Kandji's cons state it is built exclusively around Apple devices, meaning organizations with substantial Windows fleets should not expect strong Windows support from either."
    },
    {
      "question": "Can Kandji do everything Jamf can do?",
      "answer": "No, based on the documented facts Kandji does not match Jamf's Android device management (via Jamf for Mobile) or Jamf's dedicated classroom and shared-iPad tools for education, though Kandji does offer features Jamf's facts do not document, such as One-Click Compliance Templates and Liftoff custom onboarding."
    },
    {
      "question": "Which has better security features, Jamf or Kandji?",
      "answer": "Both offer add-on endpoint security, Jamf Protect for Jamf and Kandji EDR for Kandji, but Jamf additionally sells a dedicated identity and access management product, Jamf Connect, while Kandji instead connects to third-party identity providers like Okta and Google Workspace, so which is better depends on whether a buyer wants an all-in-one vendor or is fine using existing identity providers."
    },
    {
      "question": "Is Kandji a good alternative to Jamf?",
      "answer": "Yes, Kandji's own documented FAQs describe it as commonly evaluated as a modern alternative to Jamf for organizations wanting Apple-focused MDM with a newer admin interface and built-in security and compliance tooling, making it a reasonable alternative for Apple-only fleets, though not for organizations needing Android support or education-specific classroom tools."
    }
  ]
};

export default jamfVsKandjiContent;
