import type { ToolComparisonContent } from './types';

const boundaryVsBurpSuiteContent: ToolComparisonContent = {
  "verdict": "Boundary and Burp Suite both sit in the security tooling space but address different threats: Boundary is HashiCorp's identity-based access management tool for securely accessing infrastructure (servers, databases) without exposing credentials or networks, while Burp Suite is PortSwigger's web application security testing platform used to find vulnerabilities in web apps via manual and automated scanning. One controls who can reach your systems; the other finds flaws in what you've built.",
  "bestForToolA": "Infrastructure and platform teams that need identity-based, credential-less access to servers and databases, especially those already using Terraform for infrastructure-as-code policy management.",
  "bestForToolB": "Penetration testers, bug bounty hunters, and AppSec teams that need manual and automated web vulnerability scanning, from PortSwigger's free Community Edition up through CI-integrated Enterprise DAST scanning.",
  "whoNeedsBoth": "A security team could use Burp Suite to test a web application for vulnerabilities before deployment, then use Boundary to control identity-based access to the underlying infrastructure that application runs on — covering application-layer testing and infrastructure-access control as separate, complementary layers of a security program.",
  "keyDifferences": [
    {
      "title": "Security Domain",
      "toolA": "Boundary provides identity-based access to infrastructure (servers, databases) via privileged sessions, SSH credential injection, and automated service discovery.",
      "toolB": "Burp Suite tests web applications for vulnerabilities using a manual testing toolkit and, in paid editions, an automated DAST scanner.",
      "whyItMatters": "Access management and vulnerability scanning are different disciplines within security; buyers should not expect either tool to substitute for the other.",
      "benefitsWho": "Security teams structuring their toolchain need to assign infrastructure-access control and application testing to the right specialized tool."
    },
    {
      "title": "Deployment Options",
      "toolA": "Boundary offers a self-managed Community edition plus HCP Boundary, HashiCorp's managed cloud offering, available with a free trial.",
      "toolB": "Burp Suite offers a free Community Edition (manual tools only), a paid Professional edition for individual testers, and a paid Enterprise (DAST) edition for automated scanning at scale.",
      "whyItMatters": "Both follow a free-community-tier-plus-paid-tiers model, but the paid tiers unlock different things: Boundary's paid tier is about managed hosting, Burp Suite's paid tiers are about automation and scale.",
      "benefitsWho": "Teams wanting to avoid self-hosting operational overhead may prefer HCP Boundary; teams wanting automated scanning at scale need Burp Suite Professional or Enterprise specifically."
    },
    {
      "title": "Infrastructure-as-Code Integration",
      "toolA": "Boundary has full Terraform provider support, letting teams define access policies and configuration as code.",
      "toolB": "Burp Suite integrates into CI/CD pipelines for early vulnerability detection but is not documented as having Terraform-based policy configuration, since it doesn't manage infrastructure access.",
      "whyItMatters": "Terraform support matters specifically for teams that manage all infrastructure configuration, including access policy, as code.",
      "benefitsWho": "Platform engineering teams running an IaC-first workflow for infrastructure access provisioning."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Boundary's HCP pricing beyond the free trial is not published on the site.",
      "toolB": "Burp Suite's pricing is also not published on the main product page for Professional or Enterprise and requires further inquiry.",
      "whyItMatters": "Both tools require a sales conversation to get exact paid pricing, so budgeting requires reaching out rather than comparing published numbers.",
      "benefitsWho": "Procurement teams evaluating either tool should expect to request a quote rather than self-serve pricing information."
    },
    {
      "title": "Learning and Training Resources",
      "toolA": "Dedicated training content is not documented for Boundary beyond its own product documentation.",
      "toolB": "PortSwigger backs Burp Suite with free web security training through its Web Security Academy.",
      "whyItMatters": "Built-in training resources reduce the ramp-up time for new security testers learning to use the tool effectively.",
      "benefitsWho": "Junior security testers and teams onboarding new pentesters benefit from Burp Suite's Web Security Academy content."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access Control (Boundary)",
      "rows": [
        {
          "feature": "Identity-based privileged sessions",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SSH credential injection",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated service/host discovery",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Session auditing with export to monitoring tools",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Application Security Testing (Burp Suite)",
      "rows": [
        {
          "feature": "Manual web penetration testing toolkit",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Free in Community Edition"
        },
        {
          "feature": "Automated web vulnerability (DAST) scanner",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Paid editions only"
        },
        {
          "feature": "CI/CD pipeline integration for scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated scanning at enterprise scale",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Enterprise DAST edition"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free/community tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Boundary: self-managed Community; Burp Suite: Community Edition"
        },
        {
          "feature": "Managed/hosted paid option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "HCP Boundary free trial"
        },
        {
          "feature": "Terraform provider support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free training resources",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Web Security Academy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Boundary and Burp Suite solve the same problem?",
      "answer": "No. Boundary manages identity-based access to infrastructure like servers and databases without exposing credentials or networks. Burp Suite tests web applications for security vulnerabilities. They address different layers of a security program."
    },
    {
      "question": "Is Boundary free?",
      "answer": "A self-managed Community edition is available at no license cost, and HCP Boundary (HashiCorp's managed cloud offering) has a free trial. Pricing beyond the trial is not published."
    },
    {
      "question": "Is Burp Suite free?",
      "answer": "The Community Edition is free with manual testing tools. The automated vulnerability scanner requires the paid Professional or Enterprise (DAST) editions, and pricing for those requires contacting PortSwigger."
    },
    {
      "question": "Does Boundary integrate with Terraform?",
      "answer": "Yes, Boundary has full Terraform provider support for defining access policies and configuration as code."
    },
    {
      "question": "Does PortSwigger offer security training alongside Burp Suite?",
      "answer": "Yes, PortSwigger offers free web security training through its Web Security Academy."
    },
    {
      "question": "Would a security team need both tools?",
      "answer": "Yes, they can be complementary. Burp Suite can be used to test a web application for vulnerabilities before or after deployment, while Boundary separately manages identity-based access to the infrastructure that application runs on."
    }
  ]
};

export default boundaryVsBurpSuiteContent;
