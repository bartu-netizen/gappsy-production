import type { ToolComparisonContent } from './types';

const nucleiVsSupertokensContent: ToolComparisonContent = {
  "verdict": "Nuclei and SuperTokens are both open-source, developer-focused tools, but they address opposite ends of application security: Nuclei is a YAML-template-based vulnerability scanner that probes applications and infrastructure for known weaknesses, while SuperTokens is an authentication platform that builds login, session, and access-control flows directly into an application. One finds security holes from the outside; the other implements a core security-relevant feature from the inside.",
  "bestForToolA": "Nuclei fits security engineers and DevSecOps teams who need a free, scriptable CLI scanner with a library of 6,500+ community templates to run automated vulnerability scans across URLs, IP ranges, and CI/CD pipelines.",
  "bestForToolB": "SuperTokens fits application developers who need to build email/password, passwordless, social login, or SSO flows into a product, especially teams that want core auth features free at any scale when self-hosted or free under 5,000 monthly active users on the managed cloud.",
  "whoNeedsBoth": "A team could use SuperTokens to implement its own application's login and session management, then run Nuclei against that same application's endpoints, including the authentication flows, to continuously scan for vulnerabilities and misconfigurations before and after each deployment.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Nuclei is a vulnerability scanner that detects security issues in applications, infrastructure, and cloud platforms using over 6,500 community-contributed YAML templates.",
      "toolB": "SuperTokens is an authentication platform providing email/password, passwordless, social login, SSO, multi-tenancy, and session management.",
      "whyItMatters": "These solve entirely different engineering problems — finding vulnerabilities versus building a login system — so they are rarely evaluated as alternatives to each other.",
      "benefitsWho": "Engineering teams clarifying whether they need a scanning tool or an auth library before comparing options."
    },
    {
      "title": "Pricing Model",
      "toolA": "Nuclei's core CLI scanner is free and open source, with an optional paid Cloud tier ('Contact for pricing') that adds reporting and ticketing integrations.",
      "toolB": "SuperTokens core features are free at any scale when self-hosted, and the managed Cloud Core is free under 5,000 monthly active users, with premium add-ons like MFA billed at $0.01/MAU (minimum $100/month).",
      "whyItMatters": "Both tools are free to adopt at small scale, but SuperTokens has clearly published usage-based pricing for premium add-ons while Nuclei's cloud tier pricing is opaque.",
      "benefitsWho": "Startups and small teams evaluating total cost of ownership before scaling usage."
    },
    {
      "title": "Deployment Model",
      "toolA": "Nuclei runs as a command-line tool that scans targets you point it at; there is no application runtime to deploy.",
      "toolB": "SuperTokens ships as a self-hosted core service or managed cloud dashboard that your application integrates with via SDKs across 25+ frameworks and languages.",
      "whyItMatters": "SuperTokens becomes a running dependency of your production application, while Nuclei is an external tool run on demand or in CI/CD.",
      "benefitsWho": "Infrastructure teams planning what needs to be provisioned, monitored, and kept highly available in production."
    },
    {
      "title": "CI/CD Integration",
      "toolA": "Nuclei explicitly supports CI/CD pipeline integration for automated security testing on every build.",
      "toolB": "SuperTokens does not document CI/CD scanning integration; its integration surface is SDKs for application frameworks, not pipeline security testing.",
      "whyItMatters": "Teams building a DevSecOps pipeline need a scanner like Nuclei; SuperTokens simply becomes part of the application code being scanned.",
      "benefitsWho": "DevSecOps and platform engineering teams automating security checks in the deployment pipeline."
    },
    {
      "title": "Enterprise-Only Features",
      "toolA": "Nuclei's advanced reporting and ticketing integrations (e.g. Jira, Splunk) require the paid Cloud tier.",
      "toolB": "SuperTokens' multi-tenancy, machine-to-machine auth, and full attack protection suite require contacting sales beyond the free tier.",
      "whyItMatters": "Both tools gate advanced enterprise workflows behind sales conversations, so teams should budget time for a custom pricing discussion once they outgrow the free tier.",
      "benefitsWho": "Growing companies planning for security operations maturity or enterprise authentication requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Security & Scanning",
      "rows": [
        {
          "feature": "Vulnerability scanning (YAML templates)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "6,500+ community templates."
        },
        {
          "feature": "Multi-protocol scanning (TCP/DNS/HTTP)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Attack protection suite (auth attacks)",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "SuperTokens' attack protection suite requires contacting sales."
        },
        {
          "feature": "CI/CD pipeline integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Authentication & Identity",
      "rows": [
        {
          "feature": "Email/password authentication",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Passwordless / magic link login",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Social login",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-tenancy",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Requires contacting SuperTokens sales."
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "Nuclei CLI free; SuperTokens self-hosted free at any scale."
        },
        {
          "feature": "Managed cloud offering",
          "toolA": "available",
          "toolB": "available",
          "note": "SuperTokens Cloud Core free under 5,000 MAU."
        },
        {
          "feature": "Ticketing integrations (Jira, Splunk)",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Nuclei Cloud tier only."
        },
        {
          "feature": "Published usage-based pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SuperTokens add-ons priced per MAU with $100/month minimum."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Nuclei and SuperTokens competitors?",
      "answer": "No. Nuclei is a vulnerability scanner and SuperTokens is an authentication platform; they solve different problems and are typically used together rather than as alternatives."
    },
    {
      "question": "Is Nuclei free?",
      "answer": "Yes, the core Nuclei CLI scanner is open source and free. ProjectDiscovery also offers an optional paid Cloud tier with reporting and ticketing integrations, priced on request."
    },
    {
      "question": "Is SuperTokens free?",
      "answer": "Core authentication features are free at any scale when self-hosted, and the managed Cloud Core is free for under 5,000 monthly active users. Premium add-ons like MFA start at $0.01/MAU with a $100/month minimum."
    },
    {
      "question": "Does SuperTokens scan for vulnerabilities?",
      "answer": "No, SuperTokens does not document any vulnerability scanning capability; it includes an 'attack protection suite' against common authentication attacks, which is a different function from Nuclei's broader vulnerability scanning."
    },
    {
      "question": "Can Nuclei run in a CI/CD pipeline?",
      "answer": "Yes, Nuclei explicitly supports CI/CD integration for automated security testing on every build."
    },
    {
      "question": "What frameworks does SuperTokens support?",
      "answer": "The company states it works with 25+ frameworks and languages, including React, Angular, Vue, Python, Go, Android, Flutter, and iOS."
    }
  ]
};

export default nucleiVsSupertokensContent;
