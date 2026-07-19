import type { GroupComparisonContent } from './types';

const canvaVsFigmaVsPenpotContent: GroupComparisonContent = {
  "verdict": "Canva remains the quickest option for non-designers producing marketing graphics, while Figma is the dominant proprietary, browser-based collaborative platform for structured UI design. Penpot is the open-source, self-hostable alternative built specifically to give teams a Figma-like design experience without depending on proprietary, venture-backed software, making it most compelling for organizations with data-residency or cost concerns.",
  "bestFor": {
    "canva": "Non-designers and marketers who need fast, template-driven graphics rather than structured interface design.",
    "figma": "Product design teams who want the most mature, plugin-rich, real-time collaborative UI design and prototyping platform.",
    "penpot": "Organizations that want an open-source, self-hostable Figma alternative for data residency, security, or cost reasons."
  },
  "highlights": [
    {
      "title": "Open Source and Self-Hostable",
      "description": "Penpot's full source code is available under the Mozilla Public License 2.0 and can be deployed on a company's own infrastructure, unlike Canva or Figma.",
      "toolSlugs": [
        "penpot"
      ]
    },
    {
      "title": "Template-First Workflow",
      "description": "Canva is built around a library of more than 250,000 templates for non-designers rather than structured design systems.",
      "toolSlugs": [
        "canva"
      ]
    },
    {
      "title": "Mature Plugin and Collaboration Ecosystem",
      "description": "Figma offers more than 5,000 community-built plugins alongside the real-time multiplayer editing it pioneered in the category.",
      "toolSlugs": [
        "figma"
      ]
    },
    {
      "title": "SVG-Native File Format",
      "description": "Penpot stores designs using standard SVG, keeping files interoperable with web technologies, in contrast to Figma's proprietary file format.",
      "toolSlugs": [
        "penpot"
      ]
    },
    {
      "title": "Free Tier for Small Teams",
      "description": "Figma's Starter plan and Penpot's Professional plan are both free, with Penpot's free tier supporting teams of up to eight members.",
      "toolSlugs": [
        "figma",
        "penpot"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Design Capabilities",
      "rows": [
        {
          "feature": "Vector-based interface design tools",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "penpot": "available"
          }
        },
        {
          "feature": "Design-to-code or developer handoff",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "penpot": "available"
          }
        }
      ]
    },
    {
      "group": "Openness and Deployment",
      "rows": [
        {
          "feature": "Open-source codebase",
          "statuses": {
            "canva": "unavailable",
            "figma": "unavailable",
            "penpot": "available"
          }
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "canva": "unavailable",
            "figma": "unavailable",
            "penpot": "available"
          },
          "note": "Penpot's Private Server plan supports fully self-hosted deployment."
        }
      ]
    },
    {
      "group": "Collaboration and Access",
      "rows": [
        {
          "feature": "Real-time multiplayer editing",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "penpot": "available"
          }
        },
        {
          "feature": "Plugin ecosystem or app marketplace",
          "statuses": {
            "canva": "available",
            "figma": "available",
            "penpot": "available"
          }
        },
        {
          "feature": "Free plan",
          "statuses": {
            "canva": "available",
            "figma": "available",
            "penpot": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Penpot really open source?",
      "answer": "Yes. Penpot is released under the Mozilla Public License 2.0, with its full source code publicly available, unlike the proprietary Canva and Figma."
    },
    {
      "question": "Can Penpot be self-hosted?",
      "answer": "Yes. Penpot can be deployed on a company's own infrastructure, and it also offers a dedicated Private Server plan for organizations that want a fully private, self-hosted deployment. Neither Canva nor Figma offers a self-hosting option."
    },
    {
      "question": "Is Canva a good alternative to Figma for UI design?",
      "answer": "Not really. Canva is built around templates for marketing graphics, social content, and print, while Figma is purpose-built for structured interface design, prototyping, and developer handoff. They overlap only partially."
    },
    {
      "question": "Which tool has the most plugins?",
      "answer": "Figma has the most mature plugin ecosystem of the three, with more than 5,000 community-built plugins. Penpot also supports plugins and a REST API, while Canva has an apps marketplace with more than 300 third-party integrations."
    },
    {
      "question": "Does Figma or Penpot cost more for small teams?",
      "answer": "Both offer a free tier for small teams: Figma's Starter plan is free with limited files, and Penpot's Professional plan is free for up to eight members with unlimited design files. Paid tiers then diverge, with Penpot's Unlimited plan around $7/user/month versus Figma's Professional at $16/month for a Full seat."
    },
    {
      "question": "What is Penpot's file format based on?",
      "answer": "Penpot stores designs in a native SVG-based format, keeping files interoperable with standard web technologies rather than locking them into a proprietary format like Figma's."
    }
  ]
};

export default canvaVsFigmaVsPenpotContent;
