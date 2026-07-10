/*
  # Seed core tool_tags taxonomy

  Populates the tool_tags table (defined in
  20260710120000_20260710_create_tools_module.sql) with a professional,
  cross-cutting tag taxonomy covering AI capabilities, deployment model,
  pricing/business model, audience, compliance, collaboration style, and
  third-party integrations. Idempotent: ON CONFLICT (slug) DO NOTHING so
  re-running this migration never overwrites admin edits made after the
  initial seed.

  Tags are deliberately kept distinct from tool_categories (seeded in
  20260710130000_20260710_seed_tool_categories.sql). A handful of tags share
  a theme with a category (e.g. the "AI" and "Automation" tags vs. the "AI"
  and "Automation" categories) but are intentionally kept: a tool has one
  primary category but many tags, so these let a tool in any category (e.g.
  a CRM) also be filtered as "has AI features" or "has automation" without
  reassigning its category. Tags that would have been exact or near-exact
  duplicates of a category with no added filtering value (CRM, Marketing,
  Sales, SEO, Analytics, Security, CMS, Hosting, Developer Tools, etc.) were
  intentionally omitted.
*/

INSERT INTO tool_tags (slug, name, description) VALUES
-- AI capabilities
('ai', 'AI', 'For tools of any category that include artificial intelligence features, from smart suggestions to fully automated AI-driven workflows.'),
('generative-ai', 'Generative AI', 'For tools that use generative AI models to create original text, images, video, audio, or code from a prompt.'),
('gpt', 'GPT', 'For tools built on or using GPT-based language models from OpenAI.'),
('llm', 'LLM', 'For tools powered by large language models for text understanding, generation, or reasoning.'),
('machine-learning', 'Machine Learning', 'For tools that use machine learning models to analyze data, predict outcomes, or improve automatically over time.'),
('ai-agents', 'AI Agents', 'For tools that use autonomous AI agents to complete multi-step tasks with minimal human input.'),
('chatbot', 'Chatbot', 'For tools with a built-in chatbot for answering questions, qualifying leads, or automating conversations.'),
('voice-ai', 'Voice AI', 'For tools with AI voice, speech-to-text, or text-to-speech capabilities.'),
('image-generation', 'Image Generation', 'For tools with AI-powered image or graphic generation features.'),
('video-generation', 'Video Generation', 'For tools with AI-powered video creation or editing features.'),
('code-assistant', 'Code Assistant', 'For tools that help developers write, complete, or review code with AI assistance.'),
-- Automation & building
('automation', 'Automation', 'For tools that automate repetitive tasks or trigger actions across connected apps.'),
('no-code', 'No-Code', 'For tools that can be fully configured and used without writing code.'),
('low-code', 'Low-Code', 'For tools that combine visual building with the option to add custom code.'),
('workflow-automation', 'Workflow Automation', 'For tools with visual workflow builders for automating multi-step business processes.'),
-- Technical / software characteristics
('api', 'API', 'For tools that offer a public API for custom integrations and development.'),
('open-source', 'Open Source', 'For tools with publicly available, open-source source code.'),
('integrations', 'Integrations', 'For tools with a broad marketplace or library of third-party app integrations.'),
('white-label', 'White Label', 'For tools that can be rebranded and resold under another company brand.'),
('multilingual', 'Multilingual', 'For tools that support multiple languages for interface, content, or output.'),
-- Deployment & platform
('cloud', 'Cloud', 'For tools that run fully in the cloud with no local installation required.'),
('self-hosted', 'Self-Hosted', 'For tools that can be installed and run on your own servers or infrastructure.'),
('saas', 'SaaS', 'For subscription-based software delivered entirely over the web.'),
('browser-based', 'Browser Based', 'For tools that run directly in a web browser with no download required.'),
('web-app', 'Web App', 'For tools delivered as a web application accessible from any device with a browser.'),
('mobile-app', 'Mobile App', 'For tools with a dedicated mobile app for iOS or Android.'),
('desktop-app', 'Desktop App', 'For tools with a dedicated desktop application for Mac, Windows, or Linux.'),
('chrome-extension', 'Chrome Extension', 'For tools available as a Google Chrome browser extension.'),
('ios', 'iOS', 'For tools with a native iOS app for iPhone and iPad.'),
('android', 'Android', 'For tools with a native Android app.'),
('mac', 'Mac', 'For tools with a native macOS application.'),
('windows', 'Windows', 'For tools with a native Windows application.'),
('linux', 'Linux', 'For tools with a native Linux application.'),
-- Compliance & trust
('gdpr-compliant', 'GDPR Compliant', 'For tools that meet GDPR requirements for handling data from EU users.'),
('soc-2-compliant', 'SOC 2 Compliant', 'For tools that have completed a SOC 2 security and compliance audit.'),
('hipaa-compliant', 'HIPAA Compliant', 'For tools that meet HIPAA requirements for handling protected health information.'),
-- Audience
('enterprise', 'Enterprise', 'For tools built or priced for large organizations with complex, high-volume needs.'),
('smb', 'SMB', 'For tools built or priced for small and medium-sized businesses.'),
('startup', 'Startup', 'For tools built or priced for early-stage startups and small teams.'),
('freelancers', 'Freelancers', 'For tools built for independent freelancers and solo professionals.'),
('agencies', 'Agencies', 'For tools built for agencies managing multiple clients or accounts.'),
('nonprofit', 'Nonprofit', 'For tools built or discounted for nonprofit organizations.'),
-- Pricing & business model
('freemium', 'Freemium', 'For tools with a free tier alongside paid plans with additional features.'),
('free-trial', 'Free Trial', 'For tools that offer a free trial of paid plans before purchase.'),
('free-plan', 'Free Plan', 'For tools with a permanently free plan available.'),
('paid', 'Paid', 'For tools that require a paid plan with no free tier.'),
('lifetime-deal', 'Lifetime Deal', 'For tools available with a one-time lifetime access deal.'),
('subscription', 'Subscription', 'For tools billed on a recurring monthly or annual subscription.'),
('one-time-purchase', 'One-Time Purchase', 'For tools available through a single, one-time purchase instead of a subscription.'),
('usage-based-pricing', 'Usage-Based Pricing', 'For tools priced according to usage, such as credits, seats, or API calls.'),
-- Collaboration & work style
('real-time-collaboration', 'Real-Time Collaboration', 'For tools that let multiple people edit or view the same content simultaneously in real time.'),
('team-management', 'Team Management', 'For tools with features for managing team members, roles, and permissions.'),
('remote-work', 'Remote Work', 'For tools built to support distributed and remote teams.'),
('templates', 'Templates', 'For tools that include ready-made templates to speed up setup.'),
-- Content & creative
('content-creation', 'Content Creation', 'For tools that help teams produce written, visual, or video content.'),
('copywriting', 'Copywriting', 'For tools focused on generating or improving marketing and sales copy.'),
-- Functional feature tags
('reporting', 'Reporting', 'For tools with built-in reporting features for tracking performance.'),
('dashboard', 'Dashboard', 'For tools with a visual dashboard for monitoring key metrics at a glance.'),
('testing', 'Testing', 'For tools used for software testing, QA, or quality assurance.'),
('bookkeeping', 'Bookkeeping', 'For tools focused on day-to-day bookkeeping tasks like transaction tracking and reconciliation.'),
('predictive-analytics', 'Predictive Analytics', 'For tools that use data and models to forecast future outcomes or trends.'),
-- Integration ecosystem
('zapier-integration', 'Zapier Integration', 'For tools that connect with Zapier for no-code automation.'),
('slack-integration', 'Slack Integration', 'For tools that integrate directly with Slack.'),
('discord-integration', 'Discord Integration', 'For tools that integrate directly with Discord.'),
('notion-integration', 'Notion Integration', 'For tools that integrate directly with Notion.'),
('google-workspace-integration', 'Google Workspace Integration', 'For tools that integrate with Google Workspace apps like Gmail, Drive, and Calendar.'),
('microsoft-365-integration', 'Microsoft 365 Integration', 'For tools that integrate with Microsoft 365 apps like Outlook, Teams, and SharePoint.'),
('shopify-integration', 'Shopify Integration', 'For tools that integrate directly with Shopify stores.'),
('wordpress-integration', 'WordPress Integration', 'For tools that integrate directly with WordPress websites.'),
('salesforce-integration', 'Salesforce Integration', 'For tools that integrate directly with Salesforce.'),
('hubspot-integration', 'HubSpot Integration', 'For tools that integrate directly with HubSpot.'),
('stripe-integration', 'Stripe Integration', 'For tools that integrate directly with Stripe for payments.'),
('zoom-integration', 'Zoom Integration', 'For tools that integrate directly with Zoom.')
ON CONFLICT (slug) DO NOTHING;
