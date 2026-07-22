import type { ToolComparisonContent } from './types';

const coolifyVsStormkitContent: ToolComparisonContent = {
  "verdict": "Coolify and Stormkit are both positioned as self-hostable alternatives to Heroku, Vercel, and Netlify for deploying applications, but they differ in breadth and self-hosting model: Coolify supports 280+ one-click services (databases, apps in multiple languages) and is free forever to self-host with an optional Coolify Cloud tier from $5/month, while Stormkit focuses on Git-based CI/CD for a documented set of frameworks (Next.js, Nuxt, Astro, Svelte, FastAPI, and more) with a Free unlimited-usage tier and paid Premium/Ultimate tiers from $20/month. Both avoid vendor lock-in by deploying to infrastructure you control, but Coolify's one-click service catalog is broader while Stormkit's plans layer in specific enterprise controls like audit logs and approval mode.",
  "bestForToolA": "Coolify fits teams wanting a fully free, open-source, self-hosted deployment platform with no vendor lock-in, supporting 280+ one-click services and automatic SSL via Let's Encrypt, with an optional low-cost Coolify Cloud tier at $5/month for 2 connected servers.",
  "bestForToolB": "Stormkit fits teams wanting Git-based CI/CD automation with zero-downtime rolling deployments for specific modern frameworks (Next.js, Nuxt, Astro, Svelte, TanStack, FastAPI, Go), with a free unlimited-usage tier and audit logs/approval mode available on its $20/month Premium plan.",
  "whoNeedsBoth": "There is no realistic scenario for using both together — Coolify and Stormkit solve the same deployment/CI-CD problem for the same kind of team, so an organization would typically evaluate them as alternatives and pick one rather than running both in production.",
  "keyDifferences": [
    {
      "title": "Self-Hosting Model",
      "toolA": "Coolify's self-hosted version is free forever and fully open source, with unlimited servers and deployments; Coolify Cloud is an optional managed control panel from $5/month for 2 connected servers.",
      "toolB": "Stormkit is described as a self-hosted deployment platform, with a Free plan offering unlimited usage and community support and paid Premium ($20/month) and Ultimate ($100/month) tiers layering in additional features.",
      "whyItMatters": "How self-hosting is packaged and priced affects total cost of ownership and how much control a team retains over the underlying infrastructure.",
      "benefitsWho": "Cost-sensitive teams wanting a fully free, open-source self-hosted core benefit from Coolify's forever-free self-hosted model."
    },
    {
      "title": "One-Click Service Catalog",
      "toolA": "Coolify supports 280+ one-click services, including databases and applications across multiple programming languages, deployable with one click alongside custom apps.",
      "toolB": "Stormkit's documented framework support (Node.js, Astro, Nuxt, Next.js, Svelte, TanStack, FastAPI, Go, and more) centers on application deployment rather than a broad one-click database/service catalog.",
      "whyItMatters": "A large one-click service catalog reduces manual setup work when deploying databases or auxiliary services alongside an application.",
      "benefitsWho": "Teams needing to self-host databases and multiple auxiliary services alongside their app benefit from Coolify's 280+ service catalog."
    },
    {
      "title": "Deployment Model",
      "toolA": "Coolify offers automatic database backups and free SSL via Let's Encrypt, browser-based terminal access, and Git integration with GitHub, GitLab, Bitbucket, and Gitea.",
      "toolB": "Stormkit emphasizes zero-downtime rolling deployments, automatic TLS certificate provisioning for custom domains, and automated CI/CD triggered from GitHub, GitLab, and BitBucket.",
      "whyItMatters": "Zero-downtime rolling deployment as an explicit, named feature matters for teams prioritizing uptime during frequent releases.",
      "benefitsWho": "Teams deploying frequently who need guaranteed zero-downtime rollouts benefit from Stormkit's explicit zero-downtime deployment feature."
    },
    {
      "title": "Enterprise Controls",
      "toolA": "Coolify's team collaboration tools support deployment collaboration, but detailed audit-log or approval-workflow features are not broken out in its documented feature list.",
      "toolB": "Stormkit documents audit logs, automated E2E testing, and custom TLS certificates as Enterprise-tier controls, with audit logs and approval mode specifically included on the $20/month Premium plan.",
      "whyItMatters": "Named governance features like audit logs and approval mode matter for teams with compliance or change-management requirements.",
      "benefitsWho": "Teams needing documented audit trails and deployment approval workflows benefit from Stormkit's named Premium-tier controls."
    },
    {
      "title": "Pricing Entry Point for Paid Tiers",
      "toolA": "Coolify Cloud starts at $5/month for 2 connected servers, with $3/month per additional server and a 20% discount for annual billing.",
      "toolB": "Stormkit's Premium plan (analytics, audit logs, approval mode, teams) starts at $20/month, with premium support via Slack/Discord/Teams reserved for the $100/month Ultimate plan.",
      "whyItMatters": "The price gap between the two platforms' entry paid tiers ($5 vs. $20/month) affects which is more attractive for small teams wanting to move beyond free/self-hosted usage.",
      "benefitsWho": "Budget-conscious small teams wanting an inexpensive managed tier benefit from Coolify Cloud's lower $5/month entry price."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Self-hosted free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify: free forever, unlimited servers; Stormkit: Free plan, unlimited usage"
        },
        {
          "feature": "One-click service/database deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coolify: 280+ one-click services"
        },
        {
          "feature": "Zero-downtime deployments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automatic SSL/TLS",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify via Let's Encrypt; Stormkit via automatic TLS provisioning"
        },
        {
          "feature": "Browser-based terminal access",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry paid/managed tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify Cloud $5/month; Stormkit Premium $20/month"
        },
        {
          "feature": "Free plan credit card required",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stormkit Free requires no credit card"
        },
        {
          "feature": "Top-tier price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stormkit Ultimate $100/month"
        }
      ]
    },
    {
      "group": "Git & Governance",
      "rows": [
        {
          "feature": "Git provider integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify: GitHub, GitLab, Bitbucket, Gitea; Stormkit: GitHub, GitLab, BitBucket"
        },
        {
          "feature": "Audit logs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stormkit: Premium plan and above"
        },
        {
          "feature": "Approval mode for deployments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated E2E testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stormkit Enterprise controls"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Coolify and Stormkit direct competitors?",
      "answer": "Yes. Both are self-hostable alternatives to Heroku, Vercel, and Netlify for deploying applications with Git-based automation, so they're typically evaluated against each other rather than used together."
    },
    {
      "question": "Which tool is cheaper to start with a paid plan?",
      "answer": "Coolify Cloud starts at $5/month for 2 connected servers, while Stormkit's Premium plan (adding analytics, audit logs, and approval mode) starts at $20/month. Both also offer a free self-hosted or free-usage tier before any paid plan."
    },
    {
      "question": "Does Coolify support more one-click services than Stormkit?",
      "answer": "Coolify explicitly documents 280+ one-click services, including databases and applications across multiple programming languages. Stormkit's documented strength is framework-specific deployment (Next.js, Nuxt, Astro, Svelte, FastAPI, and more) rather than a broad one-click service catalog."
    },
    {
      "question": "Do both tools require you to bring your own server?",
      "answer": "Yes for Coolify — both its self-hosted version and Coolify Cloud require bringing your own servers to deploy to. Stormkit is also described as a self-hosted deployment platform, positioning it similarly around user-controlled infrastructure."
    },
    {
      "question": "Which tool has documented audit logs and deployment approval controls?",
      "answer": "Stormkit documents audit logs and approval mode as named features on its $20/month Premium plan. Coolify's team collaboration tools are documented at a higher level without breaking out audit logs or approval workflows specifically."
    },
    {
      "question": "Is either tool free to self-host indefinitely?",
      "answer": "Coolify's self-hosted version is explicitly free forever and open source with unlimited servers and deployments. Stormkit's Free plan offers unlimited usage with community support and no credit card required, though it isn't explicitly described as open source in the way Coolify is."
    }
  ]
};

export default coolifyVsStormkitContent;
