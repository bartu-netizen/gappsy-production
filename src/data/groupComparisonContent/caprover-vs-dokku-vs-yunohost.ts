import type { GroupComparisonContent } from './types';

const caproverVsDokkuVsYunohostContent: GroupComparisonContent = {
  "verdict": "CapRover and Dokku are both free, Docker-based platform-as-a-service tools that let a developer git-push or one-click deploy their own application code onto a self-managed server, while YunoHost takes a different approach, packaging and installing ready-made third-party apps like collaborative office suites or email servers onto a Debian-based machine with one click. Dokku offers the closest experience to Heroku with a large community plugin ecosystem, while CapRover adds a web dashboard, Docker Swarm clustering, and a one-click app marketplace on top of similar git-push deployment. YunoHost is less about deploying custom code and more about running a household or small-organization server, with built-in single sign-on, LDAP, and automated email and domain management that neither CapRover nor Dokku attempt to replicate. All three are free and require the user to provision and secure their own server, since none of the projects offers managed hosting or a paid support contract.",
  "bestFor": {
    "caprover": "Developers who want a web dashboard, one-click app marketplace, and Docker Swarm clustering for deploying containerized applications on their own server.",
    "dokku": "Developers migrating away from Heroku who want the closest git-push deployment workflow and a large plugin ecosystem on a single, lightweight VPS.",
    "yunohost": "Self-hosters who want a catalog of ready-made apps, such as email, file sync, and collaborative office tools, running on a single Debian server with built-in single sign-on."
  },
  "highlights": [
    {
      "title": "Deploy Your Own Code vs Install Ready-Made Apps",
      "description": "CapRover and Dokku are built around pushing your own application code via Docker and git, while YunoHost's one-click catalog installs pre-packaged third-party services rather than custom code.",
      "toolSlugs": [
        "caprover",
        "dokku",
        "yunohost"
      ]
    },
    {
      "title": "Heroku-Style Developer Experience",
      "description": "Dokku most closely mirrors Heroku's git-push deployment workflow, easing migration for teams leaving that platform, while CapRover offers a similar git-push and CLI workflow layered under a full web dashboard.",
      "toolSlugs": [
        "dokku",
        "caprover"
      ]
    },
    {
      "title": "Built-In Identity and Email Management",
      "description": "YunoHost uniquely bundles single sign-on, LDAP, and automated email server management directly into the platform, capabilities that neither CapRover nor Dokku include.",
      "toolSlugs": [
        "yunohost"
      ]
    },
    {
      "title": "Free but Self-Managed Infrastructure",
      "description": "All three tools are free to run, with CapRover and Dokku open for commercial use and CapRover's 2023 license change restricting redistribution of certain paid features, but every project requires the user to provision, secure, and maintain their own server with no official managed hosting.",
      "toolSlugs": [
        "caprover",
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
          "feature": "Git-push or CLI application deployment",
          "statuses": {
            "caprover": "available",
            "dokku": "available",
            "yunohost": "unavailable"
          },
          "note": "YunoHost installs pre-packaged apps from its catalog rather than deploying custom code via git push."
        },
        {
          "feature": "One-click app catalog or marketplace",
          "statuses": {
            "caprover": "available",
            "dokku": "not-documented",
            "yunohost": "available"
          }
        },
        {
          "feature": "Docker container support",
          "statuses": {
            "caprover": "available",
            "dokku": "available",
            "yunohost": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Networking and Security",
      "rows": [
        {
          "feature": "Automatic SSL via Let's Encrypt",
          "statuses": {
            "caprover": "available",
            "dokku": "available",
            "yunohost": "available"
          }
        },
        {
          "feature": "Built-in single sign-on and LDAP",
          "statuses": {
            "caprover": "not-documented",
            "dokku": "not-documented",
            "yunohost": "available"
          }
        }
      ]
    },
    {
      "group": "Operations and Scale",
      "rows": [
        {
          "feature": "Multi-host clustering",
          "statuses": {
            "caprover": "available",
            "dokku": "limited",
            "yunohost": "not-documented"
          },
          "note": "CapRover supports Docker Swarm clustering across multiple hosts, while Dokku is primarily designed around single-host deployments."
        },
        {
          "feature": "Email server management",
          "statuses": {
            "caprover": "not-documented",
            "dokku": "not-documented",
            "yunohost": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the core difference between CapRover, Dokku, and YunoHost?",
      "answer": "CapRover and Dokku are platform-as-a-service tools for deploying your own application code to a self-managed server via Docker and git push, while YunoHost is a self-hosted server operating system that installs pre-packaged third-party apps like Nextcloud or email from a one-click catalog."
    },
    {
      "question": "Which of these three tools is closest to Heroku for developers?",
      "answer": "Dokku is the tool most frequently compared to Heroku, offering a near-identical git-push deployment workflow, while CapRover provides a similar deployment experience layered under a full web dashboard and app marketplace."
    },
    {
      "question": "Does YunoHost support deploying custom application code the way CapRover and Dokku do?",
      "answer": "No. YunoHost is built around installing ready-made applications from its catalog rather than deploying custom code via git push or Docker images the way CapRover and Dokku do."
    },
    {
      "question": "Can CapRover, Dokku, or YunoHost run on a low-cost VPS or Raspberry Pi?",
      "answer": "CapRover and Dokku are both documented as lightweight enough to run on inexpensive VPS providers, with CapRover specifically noted to work on Raspberry Pi hardware; YunoHost is built on Debian GNU/Linux and is commonly run on small home-server hardware as well."
    },
    {
      "question": "Do CapRover, Dokku, or YunoHost offer managed hosting or paid support?",
      "answer": "No. All three are free, community or volunteer-maintained projects that require users to provision, secure, and maintain their own server, and none offers an official managed hosting plan or paid support contract."
    },
    {
      "question": "Which tool includes built-in single sign-on and email hosting?",
      "answer": "YunoHost is the only one of the three with built-in single sign-on, LDAP integration, and automated email server management; CapRover and Dokku focus on application deployment and do not document these identity or email features."
    }
  ]
};

export default caproverVsDokkuVsYunohostContent;
