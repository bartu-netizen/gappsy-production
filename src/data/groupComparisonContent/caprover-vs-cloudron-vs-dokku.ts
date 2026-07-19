import type { GroupComparisonContent } from './types';

const caproverVsCloudronVsDokkuContent: GroupComparisonContent = {
  "verdict": "CapRover, Cloudron, and Dokku all turn a bare server into a self-managed application platform, but they optimize for different workflows: Dokku and CapRover center on deploying your own code via git push or Docker images, while Cloudron centers on installing and maintaining a curated catalog of pre-built apps with automated backups, updates, and email. CapRover sits between the two, adding Docker Swarm clustering and a one-click app marketplace on top of a Heroku-style deploy flow. None is free of trade-offs: Dokku and CapRover leave update and backup automation largely to the operator, while Cloudron's free plan caps out at two apps before a per-server subscription kicks in.",
  "bestFor": {
    "caprover": "Developers who want Heroku-style git-push or Docker deploys plus a one-click marketplace for common self-hosted apps, without paying for managed hosting.",
    "cloudron": "Individuals and small teams who want a turnkey, automated way to run popular apps like Nextcloud, WordPress, and GitLab with backups, updates, and email handled for them.",
    "dokku": "Cost-conscious developers and small teams who want the closest possible replica of Heroku's git-push workflow on a single, inexpensive VPS."
  },
  "highlights": [
    {
      "title": "Dokku and CapRover both replicate Heroku's deploy workflow",
      "description": "Dokku was purpose-built to recreate git push heroku-style deploys on your own server, and CapRover offers an equivalent flow through CLI, dashboard, git webhooks, or Dockerfiles - neither requires adopting a pre-packaged app catalog just to ship custom code.",
      "toolSlugs": [
        "dokku",
        "caprover"
      ]
    },
    {
      "title": "Cloudron trades code-deploy flexibility for turnkey automation",
      "description": "Cloudron automates the operational grind of self-hosting - database provisioning, DNS/TLS setup, automatic app updates, encrypted per-app backups, and a built-in email server with DKIM, SPF, and DMARC - in exchange for being built around its own curated catalog rather than arbitrary custom code.",
      "toolSlugs": [
        "cloudron"
      ]
    },
    {
      "title": "CapRover adds a marketplace and clustering on top of git-push deploys",
      "description": "CapRover ships a one-click app marketplace for common software like WordPress and popular databases, plus built-in Docker Swarm clustering for running apps across more than one node - capabilities neither Cloudron nor base Dokku document.",
      "toolSlugs": [
        "caprover"
      ]
    },
    {
      "title": "Only Cloudron has a hard cost floor beyond a small free tier",
      "description": "CapRover and Dokku carry no license fee at any scale - the only cost is the server itself - while Cloudron's Free plan is capped at two apps, with paid Pro, Max, and Service Provider tiers required for unlimited apps or multiple servers.",
      "toolSlugs": [
        "caprover",
        "cloudron",
        "dokku"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment Model",
      "rows": [
        {
          "feature": "Git-push / custom code deployment",
          "statuses": {
            "caprover": "available",
            "cloudron": "limited",
            "dokku": "available"
          },
          "note": "CapRover and Dokku both support deploying your own code via git push, CLI, or Dockerfile; Cloudron is built primarily around installing catalog apps rather than arbitrary code."
        },
        {
          "feature": "Multi-node / clustering support",
          "statuses": {
            "caprover": "available",
            "cloudron": "unavailable",
            "dokku": "limited"
          },
          "note": "CapRover documents built-in Docker Swarm clustering; Dokku's later versions added expanded multi-host scaling though it remains primarily single-server-friendly; Cloudron licenses are per single server."
        }
      ]
    },
    {
      "group": "App Ecosystem and Automation",
      "rows": [
        {
          "feature": "Pre-packaged one-click app catalog",
          "statuses": {
            "caprover": "limited",
            "cloudron": "available",
            "dokku": "unavailable"
          },
          "note": "Cloudron ships the largest curated catalog (roughly 100-200+ apps); CapRover has a smaller marketplace of common software; Dokku has no pre-built app catalog, relying on buildpacks and plugins instead."
        },
        {
          "feature": "Automatic app updates",
          "statuses": {
            "caprover": "not-documented",
            "cloudron": "available",
            "dokku": "not-documented"
          },
          "note": "Cloudron explicitly automates app updates; CapRover and Dokku do not document this as a built-in capability."
        }
      ]
    },
    {
      "group": "Operations and Security",
      "rows": [
        {
          "feature": "Automatic SSL via Let's Encrypt",
          "statuses": {
            "caprover": "available",
            "cloudron": "available",
            "dokku": "available"
          }
        },
        {
          "feature": "Built-in email server (DKIM/SPF/DMARC)",
          "statuses": {
            "caprover": "unavailable",
            "cloudron": "available",
            "dokku": "unavailable"
          }
        },
        {
          "feature": "Centralized SSO / user management",
          "statuses": {
            "caprover": "unavailable",
            "cloudron": "available",
            "dokku": "unavailable"
          },
          "note": "Cloudron provides SSO via OpenID Connect and LDAP across installed apps; CapRover and Dokku don't document a built-in SSO layer."
        }
      ]
    },
    {
      "group": "Licensing and Cost",
      "rows": [
        {
          "feature": "Fully free at any scale",
          "statuses": {
            "caprover": "available",
            "cloudron": "limited",
            "dokku": "available"
          },
          "note": "CapRover and Dokku have no license fee regardless of scale; Cloudron's free tier is capped at two apps before paid plans are required."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I deploy my own custom application code with all three tools?",
      "answer": "CapRover and Dokku are both built around deploying your own code, via git push, a CLI, a Dockerfile, or a prebuilt image. Cloudron is primarily built around installing its curated app catalog rather than deploying arbitrary custom application code."
    },
    {
      "question": "Which of the three is completely free?",
      "answer": "CapRover and Dokku have no license fee at all. Cloudron's Free plan is capped at two apps, with paid plans starting at 15 euros per month for unlimited apps on a single server."
    },
    {
      "question": "Do any of these tools handle email server setup automatically?",
      "answer": "Cloudron includes a built-in, fully functional email server with automated DKIM, SPF, and DMARC configuration. CapRover and Dokku don't document a built-in email server as a feature."
    },
    {
      "question": "Which tool is best for scaling across multiple servers?",
      "answer": "CapRover ships built-in Docker Swarm clustering for running apps across multiple nodes. Dokku's later versions added expanded multi-host scaling support, though it remains primarily designed for single-host deployments. Cloudron is licensed per server, with its Service Provider plan supporting up to 10 servers for agencies rather than clustering a single app across nodes."
    },
    {
      "question": "What's the closest match to Heroku's deploy workflow?",
      "answer": "Dokku was built specifically to recreate Heroku's git push deployment experience on your own server. CapRover offers a similar git webhook deploy flow alongside CLI and dashboard options."
    },
    {
      "question": "Is there a one-click app catalog in all three?",
      "answer": "Cloudron has the largest curated catalog, roughly 100-200+ apps including WordPress, Nextcloud, and GitLab. CapRover ships a smaller one-click app marketplace covering common software like WordPress and popular databases. Dokku doesn't include a pre-built app catalog, relying instead on its buildpack and plugin ecosystem."
    }
  ]
};

export default caproverVsCloudronVsDokkuContent;
