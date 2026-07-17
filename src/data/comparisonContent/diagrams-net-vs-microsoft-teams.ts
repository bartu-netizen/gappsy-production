import type { ToolComparisonContent } from './types';

const diagramsNetVsMicrosoftTeamsContent: ToolComparisonContent = {
  "verdict": "Diagrams.net (draw.io) is a completely free, open-source diagramming tool for flowcharts, UML, and org charts, while Microsoft Teams is a chat, video-meeting, and file-collaboration hub bundled into Microsoft 365. They aren't really competitors: diagrams.net is one of the productivity tools that natively integrates into Teams as a channel tab, so most buyers evaluating this pair are deciding how to combine them rather than choosing one over the other.",
  "bestForToolA": "Teams that want a free, no-sign-up diagramming tool for flowcharts, UML, and org charts, especially those who want to self-host via the official Docker image or keep diagram files in their own Google Drive, OneDrive, or SharePoint storage.",
  "bestForToolB": "Organizations already on Microsoft 365 that need HD video meetings, breakout rooms, Teams Phone VoIP calling, persistent chat channels, and real-time Word/Excel/PowerPoint co-authoring in one workspace.",
  "whoNeedsBoth": "A team running design reviews inside Microsoft Teams that also needs to sketch architecture diagrams together would add diagrams.net as a tab inside a Teams channel, since diagrams.net lists a native Microsoft Teams integration alongside Confluence, Jira, GitHub, and VS Code.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Diagrams.net is a dedicated diagramming tool for flowcharts, UML diagrams, and org charts, with no chat or meeting functionality.",
      "toolB": "Microsoft Teams is a chat, video-meeting, and file-collaboration hub with persistent channels, HD video meetings, and Teams Phone calling.",
      "whyItMatters": "The two tools solve entirely different problems, so the decision is about how they fit together rather than which one to pick.",
      "benefitsWho": "Teams evaluating whether they need a dedicated diagramming tool alongside their existing communication platform."
    },
    {
      "title": "Pricing",
      "toolA": "Diagrams.net is free forever with no paid tier and no sign-up required at all.",
      "toolB": "Teams offers a free plan, then paid tiers from roughly $4/user/month (Teams Essentials) up to roughly $12.50/user/month (Microsoft 365 Business Standard).",
      "whyItMatters": "Diagrams.net can be adopted at zero cost indefinitely, while Teams costs scale with headcount and feature tier, especially for full Microsoft 365 bundles.",
      "benefitsWho": "Budget-conscious small teams and freelancers who need diagramming but don't want another recurring subscription."
    },
    {
      "title": "Self-Hosting and Data Control",
      "toolA": "Diagrams.net offers an official Docker image (jgraph/drawio) for full self-hosting, and lets users choose where diagram data is stored (Google Drive, OneDrive, SharePoint, or local), stating it cannot access that data.",
      "toolB": "Microsoft Teams is not documented as self-hostable; it runs as a Microsoft-hosted cloud service.",
      "whyItMatters": "Self-hosting matters for organizations with data residency or compliance requirements around exactly where content lives.",
      "benefitsWho": "Security-conscious IT teams that need full control over diagram data storage."
    },
    {
      "title": "Meeting and Calling Capability",
      "toolA": "Diagrams.net has no meeting or calling features documented; it is purely a diagramming canvas.",
      "toolB": "Teams includes HD video meetings with screen sharing and recording, breakout rooms, and Teams Phone VoIP calling with voicemail.",
      "whyItMatters": "Only one of these products can serve as the actual communication and meeting layer for a team.",
      "benefitsWho": "Distributed teams that need video calls or want to replace a traditional phone system."
    },
    {
      "title": "Third-Party Integrations",
      "toolA": "Diagrams.net natively integrates with Confluence, Jira, GitHub, VS Code, Microsoft Teams, and Notion.",
      "toolB": "Teams supports App & Workflow Integrations that connect third-party apps and bots as tabs or notifications, plus deep native integration with Word, Excel, PowerPoint, and SharePoint.",
      "whyItMatters": "This shows the products are largely complementary rather than competing, since diagrams.net is literally one of the apps listed as integrating into Teams.",
      "benefitsWho": "Teams standardizing communication around Microsoft 365 while still wanting a dedicated, free diagram editor."
    }
  ],
  "featureMatrix": [
    {
      "group": "Diagramming & Visual Tools",
      "rows": [
        {
          "feature": "Flowchart, UML, and org chart creation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Desktop application",
          "toolA": "available",
          "toolB": "available",
          "note": "Teams desktop app is for chat/meetings, not diagramming"
        },
        {
          "feature": "Long-term file backward compatibility",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Diagrams created since 2005 still open in the current app"
        },
        {
          "feature": "No sign-up required to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Teams requires a Microsoft account"
        }
      ]
    },
    {
      "group": "Communication & Meetings",
      "rows": [
        {
          "feature": "Real-time co-editing",
          "toolA": "available",
          "toolB": "available",
          "note": "Shared cursors vs. Office co-authoring"
        },
        {
          "feature": "Video meetings",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Up to 60 minutes on the free Teams plan"
        },
        {
          "feature": "Persistent chat/channels",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "VoIP/phone calling",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Teams Phone"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Official Docker image jgraph/drawio"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Diagrams.net has no paid tier at all"
        },
        {
          "feature": "Admin/compliance controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Teams Admin Controls & Compliance"
        },
        {
          "feature": "Mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can diagrams.net be used inside Microsoft Teams?",
      "answer": "Yes, diagrams.net lists a native integration with Microsoft Teams, so diagrams can be embedded and edited from within a Teams channel."
    },
    {
      "question": "Is diagrams.net really free?",
      "answer": "Yes. Its homepage states it is free forever and open source under the Apache 2.0 license, with no sign-up required."
    },
    {
      "question": "Does Microsoft Teams have a free plan?",
      "answer": "Yes, the free plan includes unlimited chat messages and search, video meetings up to 60 minutes, and file storage per user."
    },
    {
      "question": "Can diagrams.net be self-hosted?",
      "answer": "Yes, via the official Docker image (jgraph/drawio), letting teams run it entirely on their own infrastructure. Teams has no documented self-hosting option since it's a Microsoft-hosted cloud service."
    },
    {
      "question": "Do I need Microsoft 365 to use Teams?",
      "answer": "No, Teams can be used with the free plan or the standalone Teams Essentials plan (around $4/user/month) without a full Microsoft 365 subscription."
    },
    {
      "question": "Which tool should a distributed team use for design reviews?",
      "answer": "Neither replaces the other. Diagrams.net handles the actual diagramming work (flowcharts, UML, org charts) while Teams provides the video meeting and chat layer where the diagram gets discussed, and the two can be combined via diagrams.net's Teams integration."
    }
  ]
};

export default diagramsNetVsMicrosoftTeamsContent;
