import type { ToolComparisonContent } from './types';

const burpSuiteVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "Burp Suite and openarchiver sit in unrelated categories rather than competing head to head: Burp Suite is PortSwigger's web application security testing platform, covering manual penetration testing tools (free Community Edition) up through automated, CI-integrated vulnerability scanning (Professional and Enterprise DAST). openarchiver is a self-hosted, open-source email archiving platform built for backup, compliance, and eDiscovery, connecting to Microsoft 365, Google Workspace, and IMAP or importing legacy PST/EML files. Anyone evaluating both is likely filling two separate line items in a security and compliance stack, not choosing between substitutes.",
  "bestForToolA": "Penetration testers and AppSec teams who need manual web app testing tools (free in Community Edition) or automated, CI/CD-integrated vulnerability scanning at scale via Professional or Enterprise DAST.",
  "bestForToolB": "IT and compliance teams who need to archive company email for backup and eDiscovery, especially those wanting a self-hosted platform with Microsoft 365/Google Workspace connectors and PST/EML import for legacy data.",
  "whoNeedsBoth": "A security and IT operations team could use both as unrelated tools within the same organization -- Burp Suite for offensive application security testing and openarchiver for email records retention -- but there is no functional overlap or integration between them to justify pairing them as alternatives.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Burp Suite is a web application security testing platform with a manual testing toolkit, an automated DAST vulnerability scanner, and attack surface visibility.",
      "toolB": "openarchiver is described as a self-hosted email archiving platform for backup, compliance, and eDiscovery with full-text search across archived mail.",
      "whyItMatters": "Confirming the category prevents buyers from mistakenly treating these as interchangeable options during vendor selection.",
      "benefitsWho": "Procurement teams and IT buyers scoping out separate security and compliance tooling budgets."
    },
    {
      "title": "Deployment Model",
      "toolA": "Burp Suite's Community Edition is manual desktop testing software, while Enterprise DAST is built for automated, CI-driven scanning across many applications; a self-hosted deployment mode is not documented for Burp Suite.",
      "toolB": "openarchiver is explicitly positioned as a secure, self-hosted platform, meaning organizations run and control the archiving infrastructure themselves.",
      "whyItMatters": "Self-hosting affects data residency, infrastructure overhead, and who is responsible for uptime and patching.",
      "benefitsWho": "Organizations with strict data residency or compliance requirements around where archived email is stored."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Burp Suite uses a freemium model: Community Edition is free, while Professional and Enterprise (DAST) editions are both listed as \"Contact for pricing\" with no published rates.",
      "toolB": "openarchiver's pricing model is listed as Freemium, but no starting price or plan-level pricing details are published in its facts.",
      "whyItMatters": "Neither tool publishes full self-serve pricing for its higher tiers, so buyers should expect a sales conversation before committing budget.",
      "benefitsWho": "Budget owners who need to plan a sales-cycle timeline rather than an instant self-serve signup."
    },
    {
      "title": "Integration Surface",
      "toolA": "Burp Suite integrates into CI/CD pipelines to catch vulnerabilities during the development process, particularly in the Professional and Enterprise editions.",
      "toolB": "openarchiver connects directly to Microsoft 365 and Google Workspace, plus generic IMAP servers, and can import existing PST and EML archive files.",
      "whyItMatters": "The integrations each tool ships with reveal where it plugs into a stack -- development pipelines versus email/collaboration platforms.",
      "benefitsWho": "DevOps teams wiring security scans into build pipelines, and IT admins migrating legacy PST archives into a searchable system."
    },
    {
      "title": "Training and Enablement",
      "toolA": "PortSwigger backs Burp Suite with the free Web Security Academy, offering security training content alongside the product.",
      "toolB": "No training or academy program is documented for openarchiver in the available facts.",
      "whyItMatters": "Free vendor-provided training can shorten ramp-up time for new users and reduce reliance on paid onboarding.",
      "benefitsWho": "Security teams onboarding junior penetration testers who need structured learning material."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Manual web app security testing toolkit",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Included free in Burp Suite Community Edition"
        },
        {
          "feature": "Automated vulnerability (DAST) scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Requires Burp Suite Professional or Enterprise"
        },
        {
          "feature": "Email archiving and backup",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Full-text search across archives",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "eDiscovery / compliance support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free entry-level tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Burp Suite Community Edition is free; openarchiver's pricing model is listed as Freemium but no plan details are published"
        },
        {
          "feature": "Published Professional/paid pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting the vendor for a quote"
        },
        {
          "feature": "Enterprise-scale automated tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Burp Suite Enterprise (DAST) edition"
        }
      ]
    },
    {
      "group": "Deployment & Integrations",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "openarchiver is explicitly self-hosted"
        },
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "PST/EML file import",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "CI/CD pipeline integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Free vendor security training",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "PortSwigger's Web Security Academy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Burp Suite and openarchiver competitors?",
      "answer": "No. Burp Suite is a web application security testing platform for penetration testing and vulnerability scanning, while openarchiver is a self-hosted email archiving tool for compliance and eDiscovery. They solve different problems and would typically sit in different parts of a technology budget."
    },
    {
      "question": "Is Burp Suite free to use?",
      "answer": "The Community Edition is free and includes manual testing tools, but the automated vulnerability scanner is only available in the paid Professional or Enterprise (DAST) editions."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "openarchiver's pricing model is listed as Freemium, but no starting price or specific plan pricing is published in the available product information."
    },
    {
      "question": "Does openarchiver connect to Microsoft 365 and Google Workspace?",
      "answer": "Yes -- along with generic IMAP servers and the ability to import existing PST and EML files for historical archives."
    },
    {
      "question": "Can Burp Suite integrate into a CI/CD pipeline?",
      "answer": "Yes, Burp Suite's paid editions support CI/CD integration to catch vulnerabilities during development, and the Enterprise edition supports automated scanning across many applications."
    },
    {
      "question": "Which of the two tools is self-hosted?",
      "answer": "openarchiver is explicitly described as a self-hosted platform. Burp Suite's hosting model isn't detailed the same way in its facts -- Community Edition runs as desktop software, while Enterprise DAST is built for scanning at scale, but neither is described as self-hosted in the same sense as openarchiver."
    }
  ]
};

export default burpSuiteVsOpenarchiverContent;
