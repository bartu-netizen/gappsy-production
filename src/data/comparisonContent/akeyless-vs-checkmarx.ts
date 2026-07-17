import type { ToolComparisonContent } from './types';

const akeylessVsCheckmarxContent: ToolComparisonContent = {
  "verdict": "Akeyless and Checkmarx solve different security problems entirely. Akeyless is a SaaS platform for secrets management, machine identity, PKI, and multi-cloud key management, with a published Free plan and an Enterprise custom tier. Checkmarx is an application security testing platform (SAST, DAST, SCA, container, secrets detection, IaC) priced through custom enterprise quotes with no free tier. They're not competitors so much as adjacent pieces of a security stack.",
  "bestForToolA": "Teams that need to centrally store, rotate, and dynamically deliver secrets, certificates, and encryption keys across multi-cloud environments, including protecting secrets from AI agent context via SecretlessAI.",
  "bestForToolB": "Enterprise development organizations that need to scan source code, dependencies, containers, and infrastructure-as-code for vulnerabilities across the SDLC, backed by SOC 2 Type II, ISO 27001, and FedRAMP compliance.",
  "whoNeedsBoth": "A strong complementary scenario: a DevSecOps team uses Checkmarx's Secrets Detection feature to catch hardcoded credentials accidentally committed to source code, while using Akeyless as the actual secrets management platform where those credentials should be stored, rotated, and dynamically delivered instead of hardcoded.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Akeyless centrally stores and dynamically delivers static, dynamic, and rotated secrets to applications and pipelines.",
      "toolB": "Checkmarx statically and dynamically tests application code and infrastructure for security vulnerabilities; it does not store or manage secrets.",
      "whyItMatters": "Secrets management and application security testing are different disciplines that both belong in a mature security program but solve different problems.",
      "benefitsWho": "Platform/infrastructure teams need Akeyless for secret storage; AppSec teams need Checkmarx for vulnerability scanning."
    },
    {
      "title": "Hardcoded Secrets Detection vs. Management",
      "toolA": "Not documented as scanning source code for hardcoded secrets; Akeyless focuses on storing and rotating secrets that applications retrieve.",
      "toolB": "Checkmarx includes a dedicated Secrets Detection feature that identifies hardcoded secrets and credentials in source code repositories.",
      "whyItMatters": "Detecting a leaked secret in code and actually managing that secret's lifecycle are complementary but distinct capabilities.",
      "benefitsWho": "Teams wanting to both catch leaked secrets (Checkmarx) and properly manage them going forward (Akeyless)."
    },
    {
      "title": "AI-Related Security Features",
      "toolA": "Akeyless offers SecretlessAI, which keeps secrets out of AI agent context while validating agent actions at runtime via Agentic Runtime Authority.",
      "toolB": "Checkmarx offers AI-powered agents (Developer Assist, Triage & Remediation Assist) and a Checkmarx MCP Server to help developers fix vulnerability findings faster.",
      "whyItMatters": "Both vendors are investing in AI, but for different purposes — protecting secrets from AI agents versus using AI to accelerate vulnerability remediation.",
      "benefitsWho": "Teams building AI agent workflows benefit from Akeyless's SecretlessAI; development teams facing large finding backlogs benefit from Checkmarx's AI remediation agents."
    },
    {
      "title": "Free Tier Availability",
      "toolA": "Akeyless publishes a Free plan with specific quotas: up to 5 clients, 500 static secrets, 5 dynamic secrets, 5 rotated secrets, 3 targets, and 3-day audit log retention.",
      "toolB": "Checkmarx pricing is fully custom and quote-based with no published free tier or advertised free trial.",
      "whyItMatters": "A published free tier lets smaller teams start immediately without a sales process, while enterprise platforms often require budget approval upfront.",
      "benefitsWho": "Small teams and individual developers can start with Akeyless's Free plan immediately; enterprise buyers with dedicated AppSec budgets are the target for Checkmarx."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Akeyless holds ISO 27001, PCI-DSS, FIPS 140-3, GDPR, and DORA compliance, among others.",
      "toolB": "Checkmarx holds SOC 2 Type II, ISO 27001 certification, and FedRAMP authorization.",
      "whyItMatters": "Both share ISO 27001 but otherwise carry different certifications relevant to different regulatory contexts (payments/crypto vs. government/enterprise).",
      "benefitsWho": "Payment and financial services teams may weigh Akeyless's PCI-DSS and FIPS 140-3 certifications; government-adjacent buyers may weigh Checkmarx's FedRAMP authorization."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Product Category",
      "rows": [
        {
          "feature": "Secrets storage and rotation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Static/dynamic application security testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Hardcoded secrets detection in source code",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "PKI / certificate lifecycle management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI agent secret protection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Akeyless SecretlessAI"
        },
        {
          "feature": "AI-powered code remediation agents",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Developer Assist, Triage & Remediation Assist"
        },
        {
          "feature": "Model Context Protocol (MCP) server",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Checkmarx MCP Server"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Published free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Akeyless Free plan: $0, quota-limited"
        },
        {
          "feature": "Custom enterprise quote required for top tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Compliance certifications documented",
          "toolA": "available",
          "toolB": "available",
          "note": "Akeyless: ISO 27001, PCI-DSS, FIPS 140-3, GDPR, DORA; Checkmarx: SOC 2 Type II, ISO 27001, FedRAMP"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Akeyless and Checkmarx direct competitors?",
      "answer": "No, they serve different purposes — Akeyless manages and stores secrets, while Checkmarx scans code and infrastructure for security vulnerabilities, including hardcoded secrets left in source code."
    },
    {
      "question": "Does Akeyless scan source code for vulnerabilities?",
      "answer": "This is not documented as an Akeyless capability; its documented focus is secrets management, PKI, and multi-cloud key management."
    },
    {
      "question": "Does Checkmarx manage or store secrets?",
      "answer": "No, Checkmarx's Secrets Detection feature identifies hardcoded secrets in source code, but it does not store, rotate, or dynamically deliver secrets the way Akeyless does."
    },
    {
      "question": "Is there a free way to try Akeyless?",
      "answer": "Yes, Akeyless offers a Free plan with quotas including up to 5 clients, 500 static secrets, and 3-day audit log retention; Checkmarx does not advertise a free trial."
    },
    {
      "question": "Do both platforms use AI?",
      "answer": "Yes, but differently — Akeyless's SecretlessAI protects secrets from AI agent context, while Checkmarx's AI agents (Developer Assist, Triage & Remediation Assist) help developers fix security findings."
    },
    {
      "question": "Which compliance certifications do they share?",
      "answer": "Both Akeyless and Checkmarx hold ISO 27001 certification; Akeyless additionally documents PCI-DSS, FIPS 140-3, GDPR, and DORA, while Checkmarx additionally documents SOC 2 Type II and FedRAMP authorization."
    }
  ]
};

export default akeylessVsCheckmarxContent;
