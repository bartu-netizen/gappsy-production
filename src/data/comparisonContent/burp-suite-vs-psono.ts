import type { ToolComparisonContent } from './types';

const burpSuiteVsPsonoContent: ToolComparisonContent = {
  "verdict": "Burp Suite and Psono both sit in the security tooling category but solve unrelated problems: Burp Suite is a web application penetration-testing platform combining manual tools with an automated DAST scanner, while Psono is a self-hosted, open-source password manager for teams. They aren't substitutes; a security-conscious organization is more likely to use both than to choose between them.",
  "bestForToolA": "Penetration testers and AppSec teams who need manual testing tools via the free Community Edition, or an automated web vulnerability scanner with CI/CD integration via the paid Professional or Enterprise editions, backed by PortSwigger's free Web Security Academy training.",
  "bestForToolB": "Teams that want full control over where credential data is stored via self-hosted deployment, with client-side encryption and an open-source codebase available for independent security audits, free for up to 10 users.",
  "whoNeedsBoth": "A security team could run Burp Suite Professional to test its own applications for vulnerabilities while using Psono internally, self-hosted, to store and share the credentials, API keys, and test accounts used during that testing; the two tools address testing and credential storage, not the same job.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Burp Suite is a web application penetration testing and DAST scanning platform.",
      "toolB": "Psono is a team password management and credential storage tool.",
      "whyItMatters": "Buyers need to know which security problem they're solving before comparing tools that both carry a 'security' label.",
      "benefitsWho": "AppSec and pentest teams need Burp Suite; IT and ops teams managing shared credentials need Psono."
    },
    {
      "title": "Deployment Model",
      "toolA": "Burp Suite is a desktop application (Community/Professional) plus a separate Enterprise DAST product for centralized scanning; self-hosting server infrastructure isn't a described concept.",
      "toolB": "Psono can be deployed on your own servers, or used as a hosted SaaS edition.",
      "whyItMatters": "Data-residency requirements often dictate whether a tool needs a true self-hosted option.",
      "benefitsWho": "Organizations with data-residency requirements that want to self-host their password vault need Psono."
    },
    {
      "title": "Free Tier Scope",
      "toolA": "Burp Suite Community Edition is free but limited to manual testing tools, with no automated scanner.",
      "toolB": "Psono's Free plan includes all business features for up to 10 users, not a stripped-down tier.",
      "whyItMatters": "Small teams get very different value from each product's free offering.",
      "benefitsWho": "Small teams get a fully-featured free password manager from Psono, while Burp Suite's free tier is a learning/manual-testing tool only."
    },
    {
      "title": "Open Source Transparency",
      "toolA": "Burp Suite is not fully open source, though PortSwigger maintains free Web Security Academy training content separately.",
      "toolB": "Psono's entire codebase is publicly available, which the company says enables independent security audits.",
      "whyItMatters": "Auditability of the code that handles credentials matters for security-conscious buyers.",
      "benefitsWho": "Security teams that want to audit the code behind their password vault benefit from Psono's open-source model."
    },
    {
      "title": "Pricing Disclosure",
      "toolA": "Burp Suite Professional and Enterprise editions require contacting PortSwigger for pricing.",
      "toolB": "Psono's free tier price is published ($0 for up to 10 users); Business/Enterprise is custom.",
      "whyItMatters": "Published entry pricing lets small teams evaluate cost without a sales call.",
      "benefitsWho": "Small teams can get exact free-tier terms from Psono immediately, while Burp Suite pricing beyond Community Edition needs a conversation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Manual penetration testing tools",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated web vulnerability scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Paid Professional/Enterprise editions"
        },
        {
          "feature": "Password / credential storage",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Encrypted credential sharing",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Hosted SaaS option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CI/CD pipeline integration",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cross-platform apps (desktop/mobile/browser)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "macOS, Windows, Linux, iOS, Android, Chrome/Firefox/Edge"
        }
      ]
    },
    {
      "group": "Cost & Trust",
      "rows": [
        {
          "feature": "Free tier available",
          "toolA": "available",
          "toolB": "available",
          "note": "Burp Community Edition; Psono free for 10 users"
        },
        {
          "feature": "Open-source codebase",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published entry pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Psono free tier is $0"
        },
        {
          "feature": "Vendor security training content",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "PortSwigger's Web Security Academy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Burp Suite and Psono direct competitors?",
      "answer": "No. Burp Suite is a web application penetration testing platform, and Psono is a team password manager; they serve unrelated security functions."
    },
    {
      "question": "Is Burp Suite free?",
      "answer": "The Community Edition is free with manual testing tools; the automated scanner requires the paid Professional or Enterprise editions."
    },
    {
      "question": "Is Psono really free for teams?",
      "answer": "Yes, Psono offers all business features free for up to 10 users."
    },
    {
      "question": "Can Psono be self-hosted?",
      "answer": "Yes, Psono can be deployed on your own servers, or used as a hosted SaaS edition."
    },
    {
      "question": "Does Burp Suite offer CI/CD integration?",
      "answer": "Yes, Burp Suite integrates into CI/CD pipelines for early vulnerability detection."
    },
    {
      "question": "Is Psono open source?",
      "answer": "Yes, Psono's source code is publicly available, which the company says allows for independent security audits."
    }
  ]
};

export default burpSuiteVsPsonoContent;
