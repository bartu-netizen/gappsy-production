import type { ToolComparisonContent } from './types';

const authentikVsClairContent: ToolComparisonContent = {
  "verdict": "Authentik and Clair solve different problems: Authentik is a self-hosted identity provider handling authentication and access across protocols like OIDC, SAML, LDAP, RADIUS, and Kerberos, while Clair is a static analysis tool that scans container images for known vulnerabilities. They aren't substitutes for each other, and a buyer comparing them is likely evaluating which category of tool they actually need rather than choosing between two competitors.",
  "bestForToolA": "Teams needing self-hosted single sign-on and access management across a wide range of protocols (OIDC, SAML, LDAP, SCIM, RADIUS), plus a built-in remote access proxy for internal infrastructure.",
  "bestForToolB": "DevOps and security teams needing to statically scan container images for known vulnerabilities as part of a CI/CD pipeline or registry workflow, such as those using the Quay container registry.",
  "whoNeedsBoth": "A platform engineering team building internal infrastructure could deploy Authentik for workforce SSO into internal apps and separately run Clair to scan container images pushed to their registry for vulnerabilities — different layers of the same DevSecOps stack rather than overlapping tools.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Authentik is an identity provider handling authentication and authorization protocols (OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, Kerberos).",
      "toolB": "Clair is a static container image vulnerability scanner that parses image contents and matches them against vulnerability data without executing the container.",
      "whyItMatters": "These tools solve entirely different problems, so buyers need to be clear on which category of tool they actually need before comparing further.",
      "benefitsWho": "DevOps and security teams scoping out their toolchain correctly before evaluating vendors."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Authentik's open-source core is free and self-hosted; Enterprise costs $5/user/month (internal) plus $0.02/external user/month, and Enterprise Plus starts at $20,000/year.",
      "toolB": "Clair is entirely free and open source, with no paid tier or pricing plans documented beyond the free Open Source offering.",
      "whyItMatters": "Buyers on a fixed budget need to know whether a tool ever requires a paid subscription as usage grows.",
      "benefitsWho": "Cost-conscious infrastructure teams evaluating total cost of ownership for identity versus scanning tooling."
    },
    {
      "title": "User Interface",
      "toolA": "Authentik provides a full web UI for managing policies, MFA/passkeys, conditional access, and a remote access proxy (RDP/VNC/SSH).",
      "toolB": "Clair has no graphical UI documented on its project site; it is typically consumed via API or through an integrated registry like Quay.",
      "whyItMatters": "Teams that need a point-and-click admin console versus an API-first, registry-integrated tool will have very different day-to-day operating experiences.",
      "benefitsWho": "IT admins who want a visual console (Authentik) versus platform teams building automated scanning pipelines (Clair)."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Authentik integrates with 30+ named enterprise services including Google Workspace, Microsoft Entra, Slack, GitHub Enterprise, Atlassian Cloud, AWS, Grafana, Stripe, and Salesforce.",
      "toolB": "Clair's ecosystem centers on broad Linux distribution and package support (Ubuntu, Debian, RHEL, SUSE, Oracle, Alpine, Amazon Linux, VMware Photon, Python) and is used as the vulnerability scanner behind the Quay container registry.",
      "whyItMatters": "The value of each tool depends heavily on whether your stack already touches the specific systems each one integrates with.",
      "benefitsWho": "Enterprise IT teams standardizing on named SaaS tools (Authentik) versus registry operators needing broad distro coverage (Clair)."
    },
    {
      "title": "Deployment Model",
      "toolA": "Authentik requires self-hosting for every tier, including Enterprise — there is no official cloud-hosted option.",
      "toolB": "Clair also requires self-hosting with no hosted SaaS documented on the project site.",
      "whyItMatters": "Both tools place the operational burden of hosting on the buyer, which matters for teams without ops resources.",
      "benefitsWho": "Teams with existing self-hosting/Kubernetes infrastructure who are comfortable operating both categories of software themselves."
    }
  ],
  "featureMatrix": [
    {
      "group": "Identity & Access Management",
      "rows": [
        {
          "feature": "OAuth2/OIDC support",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Clair is not an identity tool"
        },
        {
          "feature": "SAML support",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "MFA / passkeys",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Remote access proxy (RDP/VNC/SSH)",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Container & Vulnerability Scanning",
      "rows": [
        {
          "feature": "Static container image analysis",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Vulnerability matching against distro packages",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Vulnerability notification service",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free open-source self-hosted core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Official hosted/cloud SaaS",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require self-hosting"
        },
        {
          "feature": "Paid enterprise plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Authentik Enterprise from $5/user/month"
        },
        {
          "feature": "Graphical web UI",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Authentik or Clair better for single sign-on?",
      "answer": "Authentik, since it's an identity provider supporting OIDC, SAML, LDAP, and other protocols; Clair doesn't handle identity or access at all — it's a container vulnerability scanner."
    },
    {
      "question": "Can Clair be used for identity management?",
      "answer": "No. Clair's documented functionality is limited to statically analyzing container images and matching their contents against vulnerability data."
    },
    {
      "question": "Is Authentik free?",
      "answer": "Yes, the open-source edition is free and self-hosted; paid Enterprise tiers start at $5/user/month (internal) plus $0.02/external user/month."
    },
    {
      "question": "Does Clair have a free plan?",
      "answer": "Clair is entirely free and open source with no paid tier documented."
    },
    {
      "question": "Do Authentik and Clair integrate with each other?",
      "answer": "This isn't documented in either tool's facts; they serve unrelated functions (identity versus image scanning) and would typically operate independently within a broader DevSecOps stack."
    },
    {
      "question": "Which one requires self-hosting?",
      "answer": "Both. Neither Authentik nor Clair documents an official vendor-hosted cloud option — every tier of each tool requires you to host it yourself."
    }
  ]
};

export default authentikVsClairContent;
