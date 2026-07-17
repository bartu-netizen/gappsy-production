import type { ToolComparisonContent } from './types';

const excalidrawVsMicrosoftTeamsContent: ToolComparisonContent = {
  "verdict": "Excalidraw is a free, open-source virtual whiteboard for hand-drawn style diagrams and wireframes with real-time, end-to-end encrypted collaboration; Microsoft Teams is a chat, video-meeting, and file-collaboration hub bundled into Microsoft 365. Excalidraw is a canvas tool for sketching ideas together, while Teams is the broader communication platform where meetings and chat happen — many teams would open a shared Excalidraw link during a Teams call rather than treat the two as substitutes.",
  "bestForToolA": "Teams that want a free, no-account-required whiteboard with a distinctive hand-drawn visual style for wireframing and brainstorming, using shareable links for end-to-end encrypted real-time collaboration.",
  "bestForToolB": "Organizations on Microsoft 365 that need HD video meetings, breakout rooms, Teams Phone VoIP calling, and real-time Word, Excel, and PowerPoint co-authoring in a single workspace.",
  "whoNeedsBoth": "A product team on a Teams video call sketching a wireframe together would open a shared Excalidraw link alongside the meeting, since Excalidraw's free web app requires no account and Teams itself does not offer a hand-drawn whiteboard canvas.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Excalidraw is an infinite-canvas whiteboard for hand-drawn style diagrams and wireframes, with no chat or meeting functionality.",
      "toolB": "Microsoft Teams is a chat, video-meeting, and file-collaboration hub with persistent channels and Teams Phone calling.",
      "whyItMatters": "The two tools address different problems, so most buyers are deciding whether they need a dedicated whiteboard alongside their communication platform, not choosing between them.",
      "benefitsWho": "Teams evaluating whether a lightweight whiteboard tool is needed in addition to their chat/meeting platform."
    },
    {
      "title": "Pricing",
      "toolA": "Excalidraw's core editor is free and MIT-licensed; the optional Excalidraw+ tier costs $7/month billed monthly or $6/month billed annually, with a 14-day free trial.",
      "toolB": "Teams offers a free plan, then paid tiers from roughly $4/user/month (Teams Essentials) up to roughly $12.50/user/month (Microsoft 365 Business Standard).",
      "whyItMatters": "Both have low-cost paid tiers, but Excalidraw's entry paid price ($6-7/month) is far below Teams' per-user Microsoft 365 bundle pricing.",
      "benefitsWho": "Budget-conscious small teams and freelancers comparing whiteboard costs against full collaboration-suite costs."
    },
    {
      "title": "Account Requirement",
      "toolA": "Excalidraw's free web app requires no account at all to start drawing.",
      "toolB": "Teams is not documented as usable without an account; it is accessed via a Microsoft account.",
      "whyItMatters": "Lower friction for ad hoc sketching sessions with outside collaborators like clients or contractors who shouldn't need to sign up.",
      "benefitsWho": "Teams collaborating with external clients or contractors on a quick sketch."
    },
    {
      "title": "AI-Assisted Creation",
      "toolA": "Excalidraw includes generative AI tools such as text-to-diagram and wireframe-to-code, with upgraded versions on Excalidraw+.",
      "toolB": "Not documented in Teams' listed feature set, which centers on meetings, chat, and Office collaboration rather than generative diagramming AI.",
      "whyItMatters": "Relevant for teams that want to speed up early-stage wireframing or diagram creation using AI prompts.",
      "benefitsWho": "Designers and product teams prototyping quickly from a text description or rough wireframe."
    },
    {
      "title": "Meeting and Calling Capability",
      "toolA": "Excalidraw has no meeting or calling capability documented; it is a drawing canvas only.",
      "toolB": "Teams includes HD video meetings with recording and live captions, breakout rooms, and Teams Phone VoIP calling.",
      "whyItMatters": "Only one of these tools can serve as the actual communication layer for a distributed team.",
      "benefitsWho": "Distributed teams needing video calls or a cloud-based phone system replacement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Visual Collaboration",
      "rows": [
        {
          "feature": "Infinite canvas whiteboard",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Hand-drawn style diagrams",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Real-time collaborative editing",
          "toolA": "available",
          "toolB": "available",
          "note": "End-to-end encrypted links vs. Office co-authoring"
        },
        {
          "feature": "Offline / PWA support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Communication & Meetings",
      "rows": [
        {
          "feature": "Video meetings",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Up to 60 minutes on the free plan"
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
        },
        {
          "feature": "Meeting recording & transcription",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier / no account required",
          "toolA": "available",
          "toolB": "available",
          "note": "Excalidraw needs no account; Teams free plan needs a Microsoft account"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "$6-7/month (Excalidraw+) vs. ~$4/user/month (Teams Essentials)"
        },
        {
          "feature": "Free trial on paid tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "14-day trial for Excalidraw+"
        },
        {
          "feature": "Admin/compliance controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Excalidraw free?",
      "answer": "Yes, the core Excalidraw editor is free and open source under the MIT license, and no account is required to use the web app."
    },
    {
      "question": "What does Excalidraw+ add over the free version?",
      "answer": "Excalidraw+ adds extended team collaboration, live presentations, cloud workspace management, and upgraded generative AI, for $7/month billed monthly or $6/month billed annually, with a 14-day free trial."
    },
    {
      "question": "Does Microsoft Teams have a free plan?",
      "answer": "Yes, with unlimited chat, video meetings up to 60 minutes, and file storage per user."
    },
    {
      "question": "Can I use Excalidraw during a Teams meeting?",
      "answer": "There's no documented native integration between the two, but since Excalidraw runs in a browser and needs no account, teams can share an Excalidraw link or screen-share it during a Teams call."
    },
    {
      "question": "Which tool can replace a phone system?",
      "answer": "Teams, via its Teams Phone feature for VoIP calling, call transfer, and voicemail. Excalidraw has no calling functionality."
    },
    {
      "question": "Do I need Microsoft 365 to use Teams?",
      "answer": "No, Teams can be used with its free plan or the standalone Teams Essentials plan without a full Microsoft 365 subscription."
    }
  ]
};

export default excalidrawVsMicrosoftTeamsContent;
