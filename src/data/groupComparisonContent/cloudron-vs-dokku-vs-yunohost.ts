import type { GroupComparisonContent } from './types';

const cloudronVsDokkuVsYunohostContent: GroupComparisonContent = {
  "verdict": "Cloudron and YunoHost are both app-store style self-hosting platforms for installing pre-packaged software like WordPress and Nextcloud with automated backups, SSL, and email, while Dokku is a developer-first git-push PaaS for deploying your own custom code. Cloudron is a commercial freemium product with paid support tiers, whereas YunoHost and Dokku are fully free, community-governed open source projects. Choose Cloudron for a polished, supported app catalog with built-in email, YunoHost for a fully free Debian-based alternative with built-in single sign-on, and Dokku if you are a developer who wants Heroku-style git push deploys for your own applications rather than a catalog of pre-built apps.",
  "bestFor": {
    "cloudron": "Individuals and small teams who want a polished, supported app catalog with automated backups, SSL, and a built-in email server, and don't mind paying a monthly fee per server.",
    "dokku": "Developers and indie hackers who want to git push their own applications to a self-owned VPS with a Heroku-like workflow, for free.",
    "yunohost": "Privacy-conscious individuals and communities who want a completely free, Debian-based self-hosting OS with built-in single sign-on across installed apps."
  },
  "highlights": [
    {
      "title": "Free vs. paid self-hosting",
      "description": "Dokku and YunoHost cost nothing beyond server hosting, while Cloudron charges from 15 euros per month per server once you exceed two apps.",
      "toolSlugs": [
        "cloudron",
        "dokku",
        "yunohost"
      ]
    },
    {
      "title": "App catalog vs. custom code deployment",
      "description": "Cloudron and YunoHost focus on installing pre-packaged apps like WordPress and Nextcloud with one click, while Dokku is built for deploying your own git-based applications.",
      "toolSlugs": [
        "cloudron",
        "dokku",
        "yunohost"
      ]
    },
    {
      "title": "Built-in email server",
      "description": "Cloudron and YunoHost both include automated email server setup with DKIM, SPF, and DMARC configuration, a capability Dokku does not offer natively.",
      "toolSlugs": [
        "cloudron",
        "yunohost"
      ]
    },
    {
      "title": "Single sign-on across apps",
      "description": "Cloudron and YunoHost both provide built-in SSO and LDAP so users log in once across installed apps, an area Dokku does not address since it deploys individual custom apps rather than a shared catalog.",
      "toolSlugs": [
        "cloudron",
        "yunohost"
      ]
    },
    {
      "title": "Governance model",
      "description": "Cloudron is a commercial company with paid support tiers, Dokku is a community-governed MIT-licensed project with no company behind it, and YunoHost is volunteer-maintained copylefted software.",
      "toolSlugs": [
        "cloudron",
        "dokku",
        "yunohost"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment Model",
      "rows": [
        {
          "feature": "One-click app catalog",
          "statuses": {
            "cloudron": "available",
            "dokku": "unavailable",
            "yunohost": "available"
          }
        },
        {
          "feature": "Git-push custom app deployment",
          "statuses": {
            "cloudron": "unavailable",
            "dokku": "available",
            "yunohost": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Operations and Security",
      "rows": [
        {
          "feature": "Automatic SSL/TLS provisioning",
          "statuses": {
            "cloudron": "available",
            "dokku": "available",
            "yunohost": "available"
          }
        },
        {
          "feature": "Built-in email server",
          "statuses": {
            "cloudron": "available",
            "dokku": "unavailable",
            "yunohost": "available"
          }
        },
        {
          "feature": "Single sign-on / LDAP",
          "statuses": {
            "cloudron": "available",
            "dokku": "not-documented",
            "yunohost": "available"
          }
        },
        {
          "feature": "Automated backups",
          "statuses": {
            "cloudron": "available",
            "dokku": "not-documented",
            "yunohost": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free tier or fully free",
          "statuses": {
            "cloudron": "limited",
            "dokku": "available",
            "yunohost": "available"
          },
          "note": "Cloudron's free plan covers up to two apps per server; unlimited apps require a paid plan from 15 euros per month."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dokku a good alternative to Cloudron or YunoHost for self-hosting apps?",
      "answer": "Not directly. Dokku is built for developers deploying their own custom application code via git push, while Cloudron and YunoHost are designed to install pre-packaged apps like WordPress and Nextcloud with a few clicks."
    },
    {
      "question": "Which of these three is completely free?",
      "answer": "Dokku and YunoHost are both fully free and open source software. Cloudron offers a free plan limited to two apps per server, with paid plans starting at 15 euros per month for unlimited apps."
    },
    {
      "question": "Do Cloudron and YunoHost include email hosting?",
      "answer": "Yes, both include a built-in email server with automated DKIM, SPF, and DMARC configuration, something Dokku does not provide out of the box."
    },
    {
      "question": "Which platform is easiest for a non-developer to use?",
      "answer": "Cloudron and YunoHost are both built around a web-based interface and one-click app installs, making them more approachable for non-developers than Dokku, which is operated primarily through git and the command line."
    },
    {
      "question": "Can I run Dokku, Cloudron, and YunoHost on the same server?",
      "answer": "No. Each is a full platform that takes over the server's app, proxy, and, for Cloudron and YunoHost, email stack, so a given server should typically run just one of these platforms at a time."
    }
  ]
};

export default cloudronVsDokkuVsYunohostContent;
