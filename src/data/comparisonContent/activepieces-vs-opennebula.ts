import type { ToolComparisonContent } from './types';

const activepiecesVsOpennebulaContent: ToolComparisonContent = {
  "verdict": "activepieces automates business workflows and app integrations for teams across HR, finance, marketing, and sales, while OpenNebula is an open-source cloud and virtualization management platform used to build private, hybrid, and edge clouds as an alternative to VMware. They operate at entirely different layers of the stack - activepieces at the application/workflow layer, OpenNebula at the infrastructure/virtualization layer - so the comparison centers on deployment philosophy and target buyer rather than overlapping features.",
  "bestForToolA": "Business operations teams automating cross-app processes, with usage-based pricing at $5 per active flow/month and both cloud-hosted and self-hosted deployment options.",
  "bestForToolB": "Infrastructure and platform teams building private, hybrid, or edge clouds who want to avoid proprietary hypervisor licensing costs, need GPU workload support via an NVIDIA partnership, or require multi-site federation across data centers.",
  "whoNeedsBoth": "An organization running its own private cloud on OpenNebula for cost and control reasons might separately deploy activepieces on top of that infrastructure to automate business workflows - the two tools would coexist at different layers rather than compete.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Application-layer workflow and business-process automation with prebuilt integrations.",
      "toolB": "Infrastructure-layer cloud and virtualization management for VMs, GPUs, and multi-site clouds.",
      "whyItMatters": "Buyers must recognize these solve entirely different problems before comparing price or features.",
      "benefitsWho": "Benefits IT decision-makers scoping which layer of their stack actually needs a new tool."
    },
    {
      "title": "Pricing Model",
      "toolA": "Usage-based at $5 per active flow/month (Standard), with a custom Ultimate plan.",
      "toolB": "Free Community version; paid Enterprise Subscriptions are quote-based and not published.",
      "whyItMatters": "activepieces' cost scales with automation usage, while OpenNebula's core platform is free with optional paid support layered on.",
      "benefitsWho": "Benefits infrastructure teams that can run OpenNebula at zero licensing cost versus automation teams paying per active flow."
    },
    {
      "title": "Hosting Model",
      "toolA": "Explicitly offers both cloud-hosted and self-hosted deployment.",
      "toolB": "Is infrastructure software deployed to build your own cloud; no vendor-hosted SaaS version of OpenNebula itself is documented.",
      "whyItMatters": "OpenNebula's entire purpose is to let you run your own cloud, whereas activepieces gives you the choice of using someone else's cloud.",
      "benefitsWho": "Benefits organizations wanting full infrastructure control with OpenNebula versus those wanting managed convenience with activepieces."
    },
    {
      "title": "Specialized Workload Support",
      "toolA": "No GPU or hypervisor-specific features are documented.",
      "toolB": "Supports GPU and accelerated computing workloads through an NVIDIA partnership, plus enterprise storage integrations with NetApp, Pure Storage, and Veeam.",
      "whyItMatters": "Organizations running compute-intensive or storage-heavy workloads need infrastructure-level support that a workflow tool can't provide.",
      "benefitsWho": "Benefits data center and platform engineering teams running GPU or enterprise storage workloads."
    },
    {
      "title": "Licensing Transparency",
      "toolA": "Standard plan pricing is published at $5/active flow/month.",
      "toolB": "Enterprise Subscription pricing is not published and is quote-based; the site content itself is also licensed CC BY-NC-SA, separate from the platform's source license.",
      "whyItMatters": "Buyers comparing total cost of ownership need to know upfront what's published versus what requires a sales call.",
      "benefitsWho": "Benefits procurement teams trying to budget without engaging sales."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment Layer",
      "rows": [
        {
          "feature": "Application/workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Virtual machine / hypervisor management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-site federation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes orchestration alongside VMs",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Hosting & Access",
      "rows": [
        {
          "feature": "Vendor-managed cloud-hosted option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenNebula Community version"
        },
        {
          "feature": "Open-source availability",
          "toolA": "available",
          "toolB": "available",
          "note": "Source code publicly available on GitHub"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "activepieces starts at $5/active flow/month"
        },
        {
          "feature": "Published enterprise pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OpenNebula Enterprise is quote-based"
        },
        {
          "feature": "Vendor-integrated OS subscriptions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Optional Ubuntu Pro, RHEL, SUSE"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do activepieces and OpenNebula compete for the same budget?",
      "answer": "Not directly - activepieces is business workflow automation software, while OpenNebula is infrastructure software for building private/hybrid clouds; they typically sit in different parts of an IT budget."
    },
    {
      "question": "Is OpenNebula free?",
      "answer": "A Community version is available at no cost; paid Enterprise Subscriptions with additional services also exist but aren't publicly priced."
    },
    {
      "question": "Does activepieces manage cloud infrastructure like OpenNebula?",
      "answer": "No, activepieces automates application workflows and integrations; it doesn't manage virtual machines, hypervisors, or GPU infrastructure the way OpenNebula does."
    },
    {
      "question": "Can OpenNebula run GPU workloads?",
      "answer": "Yes, OpenNebula supports GPU and accelerated computing workloads through an NVIDIA partnership, a capability not documented for activepieces."
    },
    {
      "question": "How is activepieces priced compared to OpenNebula?",
      "answer": "activepieces uses published usage-based pricing at $5 per active flow/month; OpenNebula's core Community version is free, with Enterprise Subscription pricing available only by quote."
    }
  ]
};

export default activepiecesVsOpennebulaContent;
