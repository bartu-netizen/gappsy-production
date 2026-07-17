import type { ToolComparisonContent } from './types';

const loopsVsResendContent: ToolComparisonContent = {
  "verdict": "Loops and Resend are both modern, developer-friendly email platforms with generous free tiers, but they target different jobs: Loops is built for product and lifecycle email with a visual workflow builder, a cross-client design tool, and no per-seat charges, while Resend is a broader transactional email API with a wider SDK footprint, an MCP server for AI-agent integration, and documented SOC 2/GDPR compliance. Neither is a strict upgrade over the other — it depends on whether the priority is lifecycle marketing tooling or developer/API breadth and compliance documentation.",
  "bestForToolA": "Teams sending product-led lifecycle and marketing email who want a visual workflow builder, a cross-client design tool, and no added cost for extra team seats.",
  "bestForToolB": "Development teams needing broad multi-language SDK support, an MCP server for AI-agent email sending, and documented SOC 2 Type II / GDPR compliance.",
  "whoNeedsBoth": "A SaaS company that uses Resend for core transactional/API-level sending across a polyglot backend while using Loops' workflow builder and segmentation for lifecycle marketing campaigns to the same user base.",
  "keyDifferences": [
    {
      "title": "Per-Seat Pricing",
      "toolA": "Loops explicitly does not charge extra for additional team seats on any plan.",
      "toolB": "Resend's facts don't document seat-based pricing either way.",
      "whyItMatters": "Teams adding many users care about per-seat costs when budgeting.",
      "benefitsWho": "Growing teams or agencies adding multiple users."
    },
    {
      "title": "AI / MCP Integration",
      "toolA": "Loops' facts don't mention an MCP server or AI credits.",
      "toolB": "Resend provides a built-in MCP server for AI clients (Cursor, Claude) and includes a monthly AI credit allotment on its plans.",
      "whyItMatters": "Teams building AI-agent workflows need a tool that can send email programmatically from within an agent client.",
      "benefitsWho": "AI-agent and developer-tooling teams."
    },
    {
      "title": "SDK / Language Breadth",
      "toolA": "Loops documents a REST API and an npm package for programmatic sending.",
      "toolB": "Resend documents official SDKs for nine languages (Node.js, Python, PHP, Ruby, Go, Java, Laravel, Rust, .NET) plus a CLI tool.",
      "whyItMatters": "Broader SDK coverage reduces integration effort across a polyglot engineering stack.",
      "benefitsWho": "Engineering teams not exclusively using JavaScript/Node."
    },
    {
      "title": "Marketing vs. Transactional Plan Structure",
      "toolA": "Loops' single documented plan (Free) bundles contacts and sends together with all features included.",
      "toolB": "Resend prices marketing (contact-based) and transactional (volume-based) email as separate plan tracks.",
      "whyItMatters": "Affects how billing scales as usage grows across both marketing and transactional use cases.",
      "benefitsWho": "Companies sending both lifecycle/marketing and transactional email who need to budget for both."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Loops' facts don't mention compliance certifications.",
      "toolB": "Resend states SOC 2 Type II and GDPR compliance on all plans.",
      "whyItMatters": "Documented compliance certifications matter for regulated or enterprise buyers during vendor review.",
      "benefitsWho": "Enterprise or regulated-industry buyers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Developer Tooling",
      "rows": [
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SMTP relay",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CLI tool",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP server for AI clients",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-language SDKs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Resend documents 9 languages; Loops documents a REST API and npm package."
        }
      ]
    },
    {
      "group": "Email Building & Sending",
      "rows": [
        {
          "feature": "Cross-client email design tool",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "React-based email templates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Lifecycle / automation workflows",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Batch sending with open/link tracking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Inbound email",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Loops: 1,000 contacts / ~4,000 sends per month. Resend: 3,000 emails/month, capped at 100/day."
        },
        {
          "feature": "No per-seat charges",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published starting paid price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Loops uses an interactive pricing slider with no static published price; Resend starts at $20/month."
        },
        {
          "feature": "Documented compliance certification (SOC 2 / GDPR)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Loops have a free plan?",
      "answer": "Yes — up to 1,000 subscribed contacts and about 4,000 sends per month, no credit card required, with a Loops branding footer on emails."
    },
    {
      "question": "Does Resend have a free plan?",
      "answer": "Yes — 3,000 emails per month capped at 100/day, 1 domain, and 5 AI credits per month."
    },
    {
      "question": "Does either charge extra per team seat?",
      "answer": "Loops explicitly does not charge for additional seats on any plan; Resend's facts don't document seat-based pricing either way."
    },
    {
      "question": "Can AI agents send email through these tools?",
      "answer": "Resend provides an MCP server for AI clients like Cursor and Claude plus a monthly AI credit allotment; Loops' facts don't mention MCP or AI-agent integration."
    },
    {
      "question": "What languages can developers use to integrate?",
      "answer": "Resend documents official SDKs for Node.js, Python, PHP, Ruby, Go, Java, Laravel, Rust, and .NET plus a CLI; Loops documents a REST API and an npm package for programmatic sending."
    }
  ]
};

export default loopsVsResendContent;
