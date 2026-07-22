import type { ToolComparisonContent } from './types';

const trufflehogVsVeracodeContent: ToolComparisonContent = {
  "verdict": "TruffleHog is a focused, largely free secret-scanning tool built specifically to find and verify exposed credentials in git history, Docker images, and cloud storage, while Veracode is a broad, fully custom-priced enterprise application security platform combining SAST, DAST, SCA, container security, and penetration testing under one vendor relationship. They overlap on security scanning but differ enormously in scope, pricing model, and target buyer.",
  "bestForToolA": "Developers and small teams who want a free, open-source scanner with 800+ secret detectors and live credential verification to catch leaked API keys in code and Docker images.",
  "bestForToolB": "Enterprises that need a single vendor for SAST, DAST, SCA, container security, and PTaaS, and are willing to go through a sales process since Veracode publishes no public pricing or free trial.",
  "whoNeedsBoth": "An enterprise running Veracode for full-spectrum SAST/DAST/SCA testing could still deploy TruffleHog's free pre-commit and pre-receive hooks specifically to block secrets from ever being committed, since Veracode's listed feature set does not call out dedicated secret-scanning or live credential verification the way TruffleHog does.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "TruffleHog's open-source core is free, with an Enterprise tier priced by contacting sales.",
      "toolB": "Veracode discloses no public pricing at all; every plan requires contacting sales or requesting a demo.",
      "whyItMatters": "Teams evaluating tools on a budget need to know upfront whether they can start free or must go through a sales cycle.",
      "benefitsWho": "Budget-conscious developers and small teams benefit from TruffleHog's free entry point."
    },
    {
      "title": "Scanning Specialization",
      "toolA": "TruffleHog specializes in secret detection with 800+ built-in detectors across git history, multiple branches, Docker images, and cloud storage.",
      "toolB": "Veracode covers SAST, DAST, SCA, and container security broadly, but its listed features do not call out a dedicated secret-scanning capability.",
      "whyItMatters": "A team specifically worried about leaked credentials needs a tool purpose-built for that, not just general code scanning.",
      "benefitsWho": "Security teams focused narrowly on credential leaks benefit from TruffleHog's depth in that one area."
    },
    {
      "title": "False Positive Handling",
      "toolA": "TruffleHog programmatically verifies discovered secrets live against the relevant service or API to confirm they're active.",
      "toolB": "Veracode reports a 1.1% false-positive rate across its scanning platform.",
      "whyItMatters": "High false-positive rates waste developer time chasing non-issues, so verification approach affects daily workflow.",
      "benefitsWho": "Security engineers triaging alerts benefit from lower noise in either tool's approach."
    },
    {
      "title": "AI-Assisted Remediation",
      "toolA": "TruffleHog does not document an AI-powered remediation feature; it tracks remediation status and sends rotation reminders instead.",
      "toolB": "Veracode's Fix feature uses AI to automate remediation of flagged vulnerabilities to save developer time.",
      "whyItMatters": "AI-assisted fixes can significantly reduce the manual effort of triaging and patching flaws at scale.",
      "benefitsWho": "Large engineering organizations with high flaw volumes benefit most from Veracode's AI remediation."
    },
    {
      "title": "Scale and Track Record",
      "toolA": "TruffleHog is made by Truffle Security Co., founded in 2021, with an Enterprise tier adding SSO, RBAC, and 20+ integrations.",
      "toolB": "Veracode states it has scanned over 1.5M applications and 471T+ lines of code, with 148M+ flaws fixed, and lists enterprise customers like Sitecore, Unisys, BMW, and Garmin.",
      "whyItMatters": "Track record and scale claims matter when an enterprise is choosing a long-term security vendor.",
      "benefitsWho": "Large, regulated enterprises evaluating vendor maturity benefit from Veracode's documented scale."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scanning & Detection",
      "rows": [
        {
          "feature": "Secret/credential scanning",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "TruffleHog: 800+ detectors"
        },
        {
          "feature": "SAST (static analysis)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "DAST (dynamic analysis)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SCA (open-source dependency scanning)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Container security scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Live credential verification",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Free tier / open-source core",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Veracode has no public free trial info"
        },
        {
          "feature": "Pre-commit / pre-receive hooks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "On-premises or cloud deployment (Enterprise)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom regex / rule support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Enterprise & Compliance",
      "rows": [
        {
          "feature": "SSO / RBAC",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "TruffleHog Enterprise only"
        },
        {
          "feature": "Public pricing",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "TruffleHog OSS is free; Enterprise is custom"
        },
        {
          "feature": "AI-assisted remediation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Veracode Fix feature"
        },
        {
          "feature": "Penetration testing as a service",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is TruffleHog free to use?",
      "answer": "Yes, the open-source core is free and includes GitHub, S3, directory, GCS, and Docker scanning with 800+ secret detectors. An Enterprise tier with SSO, RBAC, and a dashboard is priced by contacting sales."
    },
    {
      "question": "Does Veracode offer a free trial?",
      "answer": "No, no free trial information is provided on the Veracode site; pricing requires contacting sales or requesting a demo."
    },
    {
      "question": "Which tool is better for finding leaked API keys in git history?",
      "answer": "TruffleHog is purpose-built for this, scanning full git history and multiple branches with 800+ detectors and live verification against the relevant service. Veracode's documented features don't call out dedicated secret scanning."
    },
    {
      "question": "Does Veracode use AI?",
      "answer": "Yes, Veracode's Fix feature uses AI to automate remediation of flagged security flaws."
    },
    {
      "question": "Can I see public pricing for either tool?",
      "answer": "TruffleHog's open-source core is free with Enterprise pricing available on request; Veracode publishes no pricing at all and requires contacting sales."
    },
    {
      "question": "Do TruffleHog and Veracode integrate with each other?",
      "answer": "No official integration between the two is documented, but both are designed to run inside CI/CD pipelines alongside other security tooling."
    }
  ]
};

export default trufflehogVsVeracodeContent;
