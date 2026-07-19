import type { GroupComparisonContent } from './types';

const caproverVsCloudronVsYunohostContent: GroupComparisonContent = {
  "verdict": "CapRover, Cloudron, and YunoHost all reduce the friction of running your own server, but they start from different premises. CapRover is oriented around deploying your own application code with a Heroku-like workflow, while Cloudron and YunoHost are built around installing and administering a catalog of pre-packaged apps behind shared single sign-on. Cloudron is a commercially maintained product with a capped free tier and paid plans for unlimited apps, whereas YunoHost is entirely volunteer-run and free regardless of scale. Which one fits best depends on whether the priority is deploying custom code or getting a turnkey personal server with minimal ongoing maintenance.",
  "bestFor": {
    "caprover": "Developers who want to deploy their own custom application code via git push, CLI, or Docker images, with a lighter one-click marketplace on the side.",
    "cloudron": "Individuals and small businesses who want a polished, commercially backed platform with automatic backups, updates, and email delivery handled for them.",
    "yunohost": "Privacy-focused individuals and communities who want a completely free, volunteer-maintained Debian-based server OS with single sign-on across a broad app catalog."
  },
  "highlights": [
    {
      "title": "CapRover is built for deploying your own code, not just installing apps",
      "description": "Unlike Cloudron and YunoHost, which center on installing pre-packaged applications, CapRover's core workflow is deploying your own application via CLI, web dashboard, git webhook, Dockerfile, or a prebuilt image, with a smaller app marketplace layered on top.",
      "toolSlugs": [
        "caprover"
      ]
    },
    {
      "title": "Cloudron and YunoHost both center on app catalogs with built-in SSO",
      "description": "Both platforms let users install pre-configured applications and automatically authenticate across them through a shared identity layer - Cloudron via OpenID Connect and LDAP, YunoHost via its own LDAP-backed user portal.",
      "toolSlugs": [
        "cloudron",
        "yunohost"
      ]
    },
    {
      "title": "YunoHost is the only fully volunteer-run, non-commercial option",
      "description": "YunoHost has no company behind it and is maintained entirely by volunteer contributors as copylefted libre software, in contrast to Cloudron, which is built and sold by a commercial company founded in 2015.",
      "toolSlugs": [
        "yunohost"
      ]
    },
    {
      "title": "Cloudron's free plan is capped, while CapRover and YunoHost stay free at any scale",
      "description": "CapRover and YunoHost carry no license fee regardless of how many apps you run. Cloudron's Free plan is limited to two apps before its paid Pro, Max, or Service Provider tiers are required.",
      "toolSlugs": [
        "caprover",
        "cloudron",
        "yunohost"
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
            "yunohost": "unavailable"
          },
          "note": "CapRover supports deploying your own code via git push, CLI, or Dockerfile; Cloudron and YunoHost are both centered on installing pre-packaged catalog apps rather than arbitrary custom code."
        }
      ]
    },
    {
      "group": "App Ecosystem",
      "rows": [
        {
          "feature": "Pre-packaged one-click app catalog",
          "statuses": {
            "caprover": "limited",
            "cloudron": "available",
            "yunohost": "available"
          },
          "note": "Cloudron's curated catalog runs roughly 100-200+ apps; YunoHost's community-packaged catalog covers blogs, file sync, email, and office suites; CapRover's marketplace is comparatively smaller."
        }
      ]
    },
    {
      "group": "Operations and Identity",
      "rows": [
        {
          "feature": "Automatic SSL / TLS provisioning",
          "statuses": {
            "caprover": "available",
            "cloudron": "available",
            "yunohost": "available"
          }
        },
        {
          "feature": "Centralized SSO / LDAP identity",
          "statuses": {
            "caprover": "unavailable",
            "cloudron": "available",
            "yunohost": "available"
          }
        },
        {
          "feature": "Built-in email server",
          "statuses": {
            "caprover": "unavailable",
            "cloudron": "available",
            "yunohost": "available"
          }
        },
        {
          "feature": "Automated backup and restore",
          "statuses": {
            "caprover": "not-documented",
            "cloudron": "available",
            "yunohost": "available"
          },
          "note": "Cloudron runs encrypted per-app backups automatically; YunoHost provides standardized backup and restore for integrated apps; CapRover doesn't document a built-in backup feature."
        }
      ]
    },
    {
      "group": "Cost and Access",
      "rows": [
        {
          "feature": "Fully free at any scale",
          "statuses": {
            "caprover": "available",
            "cloudron": "limited",
            "yunohost": "available"
          },
          "note": "CapRover and YunoHost have no paid tier at all; Cloudron's free plan is capped at two apps."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three is best if I want to deploy my own custom-built application, not just install pre-made software?",
      "answer": "CapRover, since it's built around deploying your own code via git push, a Dockerfile, or a prebuilt image, alongside a smaller app marketplace. Cloudron and YunoHost are primarily designed around installing curated, pre-packaged applications rather than arbitrary custom code."
    },
    {
      "question": "Do CapRover, Cloudron, and YunoHost all have automatic SSL?",
      "answer": "Yes, all three automatically provision and renew Let's Encrypt SSL certificates for hosted apps and domains."
    },
    {
      "question": "Which tool includes single sign-on across installed apps?",
      "answer": "Cloudron and YunoHost both include built-in single sign-on - Cloudron via OpenID Connect and LDAP, YunoHost via its own LDAP-backed user portal. CapRover does not document a built-in SSO layer across deployed apps."
    },
    {
      "question": "Is any of these three entirely free with no paid tier?",
      "answer": "CapRover and YunoHost are both fully free with no paid tier; the only cost is the server you run them on. Cloudron's Free plan is capped at two apps, with paid Pro, Max, and Service Provider plans required for unlimited apps or multiple servers."
    },
    {
      "question": "Which project is run by a company versus a volunteer community?",
      "answer": "Cloudron is developed and sold by a commercial company founded in 2015 and headquartered in Berlin. CapRover was created by an individual developer and is now community-maintained under a modified Apache license. YunoHost has no company behind it at all and is maintained entirely by volunteer contributors as copylefted libre software."
    },
    {
      "question": "Which has the largest app catalog for one-click installs?",
      "answer": "Cloudron's curated catalog, roughly 100-200+ apps, is the most extensive of the three. YunoHost also ships a broad, community-packaged catalog covering blogs, file sync, email, and office suites. CapRover's marketplace is comparatively smaller, focused on common software like WordPress and popular databases."
    }
  ]
};

export default caproverVsCloudronVsYunohostContent;
