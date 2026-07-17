import type { ToolComparisonContent } from './types';

const coolifyVsFlyIoContent: ToolComparisonContent = {
  "verdict": "Coolify is a free, open-source, self-hostable PaaS you run on your own servers (VPS, Raspberry Pi, or cloud instance), with an optional $5/month Coolify Cloud control panel for 2 connected servers. Fly.io is a usage-based developer cloud that runs your app as VMs (\"Fly Machines\") in regions close to your users, plus managed Postgres, volumes, and Kubernetes, billed per machine size, storage, and data transfer. Coolify's promise is \"no vendor lock-in, self-host forever free\"; Fly.io's is \"we run and place your VMs globally, you pay for what you use.\"",
  "bestForToolA": "Coolify fits developers who already have (or want) their own servers and want a Heroku/Vercel-style deploy experience without vendor lock-in, using 280+ one-click services and Git integration with GitHub, GitLab, Bitbucket, and Gitea.",
  "bestForToolB": "Fly.io fits teams that want infrastructure managed for them: VMs, managed Postgres, volumes, global anycast networking, and Kubernetes, deployed close to end users worldwide with usage-based pricing instead of provisioning servers themselves.",
  "whoNeedsBoth": "A team could self-host internal tooling on Coolify while deploying a latency-sensitive public service on Fly.io's globally distributed Machines, though this is uncommon since both tools solve the same core \"deploy my app\" problem and most teams standardize on one.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "Coolify deploys onto servers you own (VPS, Raspberry Pi, or cloud instance) — you always bring your own infrastructure, whether self-hosted for free or via the $5/month Coolify Cloud control panel.",
      "toolB": "Fly.io deploys apps as VMs (\"Fly Machines\") hosted on Fly.io's own global infrastructure in regions close to end users — no server of your own required.",
      "whyItMatters": "It determines whether you provision and maintain your own servers or hand infrastructure entirely to the vendor.",
      "benefitsWho": "Teams wanting full infrastructure control benefit from Coolify; teams wanting zero server management benefit from Fly.io."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Coolify self-hosting is free forever; Coolify Cloud starts at $5/month for 2 connected servers, with $3/month per additional server.",
      "toolB": "Fly.io has no published flat starting price — billing is usage-based per organization, e.g. $0.0028-$0.3577/hour per Machine, $0.15/GB/month for volumes, and $0.02-$0.12/GB for data transfer.",
      "whyItMatters": "Coolify's flat low-cost tier is predictable, while Fly.io's granular usage-based pricing scales with resource use but is harder to estimate upfront.",
      "benefitsWho": "Budget-conscious teams wanting cost predictability benefit from Coolify; teams with variable or bursty workloads benefit from Fly.io's pay-for-what-you-use model."
    },
    {
      "title": "Managed Data Services",
      "toolA": "Coolify supports one-click deployment of databases among its 280+ services with automatic backups and free Let's Encrypt SSL, but you still run them on your own servers.",
      "toolB": "Fly.io offers Managed Postgres with automatic backups, Fly Volumes for persistent storage with snapshots, and Fly Kubernetes (FKS) as a managed container orchestration option.",
      "whyItMatters": "It determines whether database and infrastructure operations are handled by the vendor or remain your responsibility.",
      "benefitsWho": "Teams wanting a fully managed database and orchestration layer benefit from Fly.io; teams comfortable self-managing services on their own hardware benefit from Coolify."
    },
    {
      "title": "Support Options",
      "toolA": "Coolify Cloud's base plan includes only community and limited email support.",
      "toolB": "Fly.io offers a \"Serious Support\" plan at $29/month for access to dedicated engineers, and a $99/month HIPAA Compliance Package with BAAs and SOC2 documentation.",
      "whyItMatters": "Organizations with compliance or SLA requirements need documented, paid support tiers.",
      "benefitsWho": "Regulated or enterprise teams needing HIPAA documentation and dedicated support benefit from Fly.io; smaller teams fine with community support benefit from Coolify's lower cost."
    },
    {
      "title": "Company History",
      "toolA": "Coolify's founding year is not documented in available data.",
      "toolB": "Fly.io was founded in 2017 and operates as a distributed, remote-first team.",
      "whyItMatters": "Company longevity can factor into risk assessment for mission-critical infrastructure decisions.",
      "benefitsWho": "Risk-averse buyers evaluating platform maturity have a documented data point with Fly.io's 2017 founding."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Infrastructure",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Coolify deploys to any owned server; Fly.io runs Machines on its own infrastructure"
        },
        {
          "feature": "Managed VM hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Fly Machines with shared/performance CPU options"
        },
        {
          "feature": "One-click service deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "280+ one-click services on Coolify"
        },
        {
          "feature": "Git provider integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GitHub, GitLab, Bitbucket, Gitea"
        },
        {
          "feature": "Managed Kubernetes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fly Kubernetes (FKS)"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Legacy Fly.io free allowances discontinued"
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify Cloud $5/month for 2 servers vs. Fly.io usage-based, no flat entry price"
        },
        {
          "feature": "Dedicated support add-on",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Fly.io Serious Support $29/month"
        }
      ]
    },
    {
      "group": "Data & Storage",
      "rows": [
        {
          "feature": "Automatic backups",
          "toolA": "available",
          "toolB": "available",
          "note": "Coolify database backups; Fly.io Managed Postgres backups"
        },
        {
          "feature": "Persistent volumes with snapshots",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fly Volumes"
        },
        {
          "feature": "Free SSL certificate management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coolify uses Let's Encrypt"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Coolify require me to have my own server, and does Fly.io?",
      "answer": "Yes for Coolify — both the self-hosted and Coolify Cloud versions require bringing your own server (VPS, Raspberry Pi, or cloud instance). Fly.io is the opposite: it deploys your app as a VM on Fly's own global infrastructure, so you don't provision servers yourself."
    },
    {
      "question": "Which is cheaper to start with?",
      "answer": "Coolify Cloud starts at a flat $5/month for 2 connected servers ($3/month per additional server), and self-hosting is free forever. Fly.io has no flat starting price; you pay usage-based rates such as $0.0028-$0.3577/hour per Machine plus storage and data transfer fees."
    },
    {
      "question": "Does either tool offer managed databases?",
      "answer": "Fly.io offers Managed Postgres with automatic backups as a built-in product. Coolify lets you one-click deploy databases among its 280+ supported services, but you're responsible for running them on your own server."
    },
    {
      "question": "Can I get dedicated support with either tool?",
      "answer": "Fly.io offers a \"Serious Support\" plan at $29/month for access to dedicated engineers, plus a $99/month HIPAA Compliance Package. Coolify Cloud's base plan includes only community and limited email support."
    },
    {
      "question": "When was each company founded?",
      "answer": "Fly.io was founded in 2017. Coolify's founding year is not publicly documented in available data."
    },
    {
      "question": "Is vendor lock-in a concern with either tool?",
      "answer": "Coolify is explicitly built to avoid lock-in — it deploys to any server you own with no vendor tie-in. Fly.io does not document a lock-in stance, but by design your app runs as Machines on Fly's own infrastructure."
    }
  ]
};

export default coolifyVsFlyIoContent;
