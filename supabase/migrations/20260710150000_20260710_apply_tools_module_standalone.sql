/*
  # Tools Module — standalone, CLI-bypass apply script

  ## Why this file exists
  This repo's local migration history has diverged from the remote database
  in ways unrelated to the Tools module (pre-existing, out of scope here).
  Running `supabase db push` would force a reconciliation of that entire
  unrelated history and could prompt for `supabase migration repair` —
  which must NOT be used per explicit instruction. To bring ONLY the Tools
  module live, this file concatenates the three Tools module migrations,
  byte-for-byte unmodified, into one script meant to be run directly via
  the Supabase Dashboard SQL Editor (or `psql`/any direct Postgres
  connection) — NOT via `supabase db push`. This path never reads or
  writes `supabase_migrations.schema_migrations`, so it cannot conflict
  with, alter, or need to repair any historical migration record.

  Source files (each already fully idempotent on its own):
    1. 20260710120000_20260710_create_tools_module.sql
       — CREATE TABLE IF NOT EXISTS / CREATE INDEX IF NOT EXISTS / RLS with
         DROP POLICY IF EXISTS before every CREATE POLICY.
    2. 20260710130000_20260710_seed_tool_categories.sql
       — INSERT ... ON CONFLICT (slug) DO NOTHING (61 categories).
    3. 20260710140000_20260710_seed_tool_tags.sql
       — INSERT ... ON CONFLICT (slug) DO NOTHING (73 tags).

  Because every statement below is idempotent, this script is safe to run
  more than once, and safe to leave in supabase/migrations/: if the
  unrelated historical drift is ever resolved and normal `supabase db push`
  resumes, replaying any of the four files (this one included) is a no-op.

  The three original files are left completely untouched — this file only
  adds a new, independent artifact.
*/

-- ═══════════════════════════════════════════════════════════════════════
-- SOURCE 1 of 3: 20260710120000_20260710_create_tools_module.sql
-- ═══════════════════════════════════════════════════════════════════════

-- ─────────────────────────────────────────────
-- 1. tools
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tools (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug               text UNIQUE NOT NULL,
  name               text NOT NULL,
  logo               text,
  website            text,
  affiliate_link     text,
  short_description  text,
  long_description   text,
  pricing_model      text,
  starting_price     text,
  youtube_url        text,
  verified           boolean NOT NULL DEFAULT false,
  featured           boolean NOT NULL DEFAULT false,
  rating             numeric NOT NULL DEFAULT 0,
  review_count       integer NOT NULL DEFAULT 0,
  status             text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_at         timestamptz NOT NULL DEFAULT now(),
  updated_at         timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tools_status ON tools (status);
CREATE INDEX IF NOT EXISTS idx_tools_featured ON tools (featured) WHERE featured = true;

-- ─────────────────────────────────────────────
-- 2. tool_categories
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_categories (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug             text UNIQUE NOT NULL,
  name             text NOT NULL,
  description      text,
  seo_title        text,
  seo_description  text,
  icon             text,
  status           text NOT NULL DEFAULT 'published' CHECK (status IN ('draft', 'published', 'archived')),
  created_at       timestamptz NOT NULL DEFAULT now(),
  updated_at       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_categories_status ON tool_categories (status);

-- ─────────────────────────────────────────────
-- 3. tool_tags
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_tags (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug         text UNIQUE NOT NULL,
  name         text NOT NULL,
  description  text,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- ─────────────────────────────────────────────
-- 4. tool_category_links
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_category_links (
  tool_id            uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  category_id        uuid NOT NULL REFERENCES tool_categories(id) ON DELETE CASCADE,
  primary_category   boolean NOT NULL DEFAULT false,
  PRIMARY KEY (tool_id, category_id)
);

CREATE INDEX IF NOT EXISTS idx_tool_category_links_category ON tool_category_links (category_id);

-- ─────────────────────────────────────────────
-- 5. tool_tag_links
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_tag_links (
  tool_id   uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  tag_id    uuid NOT NULL REFERENCES tool_tags(id) ON DELETE CASCADE,
  PRIMARY KEY (tool_id, tag_id)
);

CREATE INDEX IF NOT EXISTS idx_tool_tag_links_tag ON tool_tag_links (tag_id);

-- ─────────────────────────────────────────────
-- 6. tool_screenshots
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_screenshots (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  image_url   text NOT NULL,
  caption     text,
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_screenshots_tool_id ON tool_screenshots (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 7. tool_pricing_plans (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_pricing_plans (
  id             uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id        uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  plan_name      text,
  price          text,
  billing_cycle  text,
  description    text,
  features       jsonb NOT NULL DEFAULT '[]'::jsonb,
  sort_order     integer NOT NULL DEFAULT 0,
  created_at     timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_pricing_plans_tool_id ON tool_pricing_plans (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 8. tool_integrations (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_integrations (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id            uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  integration_name   text NOT NULL,
  integration_slug   text,
  integration_logo   text,
  description        text,
  created_at         timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_integrations_tool_id ON tool_integrations (tool_id);

-- ─────────────────────────────────────────────
-- 9. tool_updates (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_updates (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id       uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  title         text NOT NULL,
  description   text,
  update_date   date,
  source_url    text,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_updates_tool_id ON tool_updates (tool_id, update_date DESC);

-- ─────────────────────────────────────────────
-- Row Level Security
-- ─────────────────────────────────────────────
ALTER TABLE tools ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_category_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_tag_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_screenshots ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_pricing_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_integrations ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_updates ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tools_public_select" ON tools;
CREATE POLICY "tools_public_select"
  ON tools FOR SELECT
  TO anon, authenticated
  USING (status = 'published');

DROP POLICY IF EXISTS "tool_categories_public_select" ON tool_categories;
CREATE POLICY "tool_categories_public_select"
  ON tool_categories FOR SELECT
  TO anon, authenticated
  USING (status = 'published');

DROP POLICY IF EXISTS "tool_tags_public_select" ON tool_tags;
CREATE POLICY "tool_tags_public_select"
  ON tool_tags FOR SELECT
  TO anon, authenticated
  USING (true);

-- tool_category_links: only visible when BOTH the linked tool is published AND
-- the linked category is published. This is the only child table whose rows
-- reference two parents with independent status columns.
DROP POLICY IF EXISTS "tool_category_links_public_select" ON tool_category_links;
CREATE POLICY "tool_category_links_public_select"
  ON tool_category_links FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_category_links.tool_id AND t.status = 'published'
    )
    AND EXISTS (
      SELECT 1 FROM tool_categories c
      WHERE c.id = tool_category_links.category_id AND c.status = 'published'
    )
  );

-- tool_tag_links: tags have no status column, so only the linked tool's status matters.
DROP POLICY IF EXISTS "tool_tag_links_public_select" ON tool_tag_links;
CREATE POLICY "tool_tag_links_public_select"
  ON tool_tag_links FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_tag_links.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_screenshots_public_select" ON tool_screenshots;
CREATE POLICY "tool_screenshots_public_select"
  ON tool_screenshots FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_screenshots.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_pricing_plans_public_select" ON tool_pricing_plans;
CREATE POLICY "tool_pricing_plans_public_select"
  ON tool_pricing_plans FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_pricing_plans.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_integrations_public_select" ON tool_integrations;
CREATE POLICY "tool_integrations_public_select"
  ON tool_integrations FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_integrations.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_updates_public_select" ON tool_updates;
CREATE POLICY "tool_updates_public_select"
  ON tool_updates FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_updates.tool_id AND t.status = 'published'
    )
  );

-- ═══════════════════════════════════════════════════════════════════════
-- SOURCE 2 of 3: 20260710130000_20260710_seed_tool_categories.sql
-- ═══════════════════════════════════════════════════════════════════════

/*
  # Seed core tool_categories taxonomy

  Populates the tool_categories table (defined in
  20260710120000_20260710_create_tools_module.sql) with the standard set of
  broad SaaS/software categories used by directories like G2, Capterra, and
  Product Hunt. Idempotent: ON CONFLICT (slug) DO NOTHING so re-running this
  migration never overwrites admin edits made after the initial seed.

  "Education" and "Learning" were merged into a single "Online Learning"
  category to avoid a near-duplicate entry.
*/

INSERT INTO tool_categories (slug, name, description, seo_title, seo_description, icon, status) VALUES
('ai', 'AI', 'AI-powered software and platforms that use machine learning and generative AI to automate tasks, generate content, and augment human work across every business function.', 'Best AI Tools & Software (2026) | Gappsy', 'Browse top-rated AI tools and software. Compare features, pricing, and real user reviews to find the right AI solution for your team.', 'Sparkles', 'published'),
('ai-writing', 'AI Writing', 'AI writing assistants and generators that help teams draft, edit, and optimize blog posts, marketing copy, emails, and other written content in seconds.', 'Best AI Writing Tools & Software (2026) | Gappsy', 'Compare top AI writing tools and generators. Find the best AI copywriting and content-generation software based on features, pricing, and reviews.', 'PenLine', 'published'),
('ai-chatbots', 'AI Chatbots', 'Conversational AI platforms and chatbot builders that automate customer conversations, support tickets, and lead qualification across web, mobile, and messaging channels.', 'Best AI Chatbot Software & Tools (2026) | Gappsy', 'Discover top AI chatbot platforms for customer service, sales, and support. Compare features, pricing, and reviews to find the right chatbot builder.', 'Bot', 'published'),
('ai-image-generation', 'AI Image Generation', 'AI image generators that create original graphics, artwork, and product visuals from text prompts, helping teams produce visuals without a design team.', 'Best AI Image Generators & Tools (2026) | Gappsy', 'Compare the best AI image generation tools and software. Find text-to-image platforms rated by real users on features, pricing, and quality.', 'Image', 'published'),
('ai-video-generation', 'AI Video Generation', 'AI video generators and editing platforms that turn text, images, or scripts into finished videos for marketing, social media, and training content.', 'Best AI Video Generation Tools (2026) | Gappsy', 'Browse top AI video generation software. Compare text-to-video and AI editing tools by features, pricing, and user reviews.', 'Video', 'published'),
('ai-voice', 'AI Voice', 'AI voice generators, text-to-speech engines, and voice cloning tools that produce natural-sounding narration, voiceovers, and voice agents.', 'Best AI Voice & Text-to-Speech Tools (2026) | Gappsy', 'Compare the best AI voice generation and text-to-speech software. Find top-rated tools by features, pricing, and reviews.', 'Mic', 'published'),
('ai-coding', 'AI Coding', 'AI coding assistants and copilots that autocomplete code, generate functions, review pull requests, and speed up software development.', 'Best AI Coding Tools & Copilots (2026) | Gappsy', 'Discover top AI coding assistants and copilots. Compare features, pricing, and reviews to find the best AI tool for developers.', 'Code2', 'published'),
('automation', 'Automation', 'Workflow and business process automation platforms that connect apps, trigger actions, and eliminate repetitive manual tasks.', 'Best Automation Software & Tools (2026) | Gappsy', 'Compare top workflow and business automation platforms. Find the best automation software by features, integrations, pricing, and reviews.', 'Zap', 'published'),
('marketing', 'Marketing', 'Marketing software covering campaign management, advertising, lead generation, and growth tools for modern marketing teams.', 'Best Marketing Software & Tools (2026) | Gappsy', 'Browse top-rated marketing software and platforms. Compare features, pricing, and reviews to find the right marketing tool for your business.', 'Megaphone', 'published'),
('seo', 'SEO', 'SEO tools for keyword research, rank tracking, backlink analysis, and on-page optimization that help websites grow organic search traffic.', 'Best SEO Tools & Software (2026) | Gappsy', 'Compare top SEO tools for keyword research, rank tracking, and site audits. Find the best SEO software by features, pricing, and reviews.', 'Search', 'published'),
('social-media', 'Social Media', 'Social media management platforms for scheduling posts, managing multiple accounts, tracking engagement, and running paid social campaigns.', 'Best Social Media Management Tools (2026) | Gappsy', 'Discover top social media management software. Compare scheduling, analytics, and engagement tools by pricing and user reviews.', 'Share2', 'published'),
('email-marketing', 'Email Marketing', 'Email marketing platforms for building campaigns, automating sequences, segmenting audiences, and tracking deliverability and engagement.', 'Best Email Marketing Software (2026) | Gappsy', 'Compare top email marketing platforms and automation tools. Find the best software for campaigns, newsletters, and drip sequences.', 'Mail', 'published'),
('content-marketing', 'Content Marketing', 'Content marketing tools for planning, creating, optimizing, and distributing blog posts, videos, and other content that drives traffic and leads.', 'Best Content Marketing Tools & Software (2026) | Gappsy', 'Browse top content marketing platforms. Compare content planning, creation, and distribution tools by features, pricing, and reviews.', 'FileText', 'published'),
('sales', 'Sales', 'Sales software for prospecting, outreach, pipeline management, and closing deals faster across every stage of the sales cycle.', 'Best Sales Software & Tools (2026) | Gappsy', 'Compare top sales tools and platforms for prospecting, outreach, and pipeline management. Find the right sales software for your team.', 'TrendingUp', 'published'),
('crm', 'CRM', 'Customer relationship management platforms that centralize contacts, track deals, and manage every customer interaction in one place.', 'Best CRM Software & Tools (2026) | Gappsy', 'Compare top CRM platforms for sales, marketing, and customer management. Find the best CRM software by features, pricing, and reviews.', 'Users', 'published'),
('customer-support', 'Customer Support', 'Customer support software for managing tickets, conversations, and customer relationships across email, chat, and social channels.', 'Best Customer Support Software (2026) | Gappsy', 'Discover top customer support platforms. Compare ticketing, messaging, and service tools by features, pricing, and real user reviews.', 'Headset', 'published'),
('help-desk', 'Help Desk', 'Help desk and ticketing software that organizes support requests, automates routing, and helps teams resolve customer issues efficiently.', 'Best Help Desk Software & Tools (2026) | Gappsy', 'Compare top help desk and ticketing platforms. Find the best support software by features, pricing, and customer reviews.', 'LifeBuoy', 'published'),
('live-chat', 'Live Chat', 'Live chat and messaging widgets that let businesses talk to website visitors in real time to answer questions and convert leads.', 'Best Live Chat Software & Tools (2026) | Gappsy', 'Browse top live chat platforms for sales and support. Compare features, pricing, and reviews to find the right live chat widget.', 'MessageCircle', 'published'),
('analytics', 'Analytics', 'Analytics platforms that track user behavior, product usage, and business metrics to help teams make data-driven decisions.', 'Best Analytics Software & Tools (2026) | Gappsy', 'Compare top analytics platforms for web, product, and marketing data. Find the best analytics software by features and pricing.', 'BarChart3', 'published'),
('business-intelligence', 'Business Intelligence', 'Business intelligence platforms that turn raw data into dashboards, reports, and insights for smarter, faster decision-making.', 'Best Business Intelligence Tools (2026) | Gappsy', 'Discover top business intelligence and reporting software. Compare BI platforms by features, pricing, and user reviews.', 'LineChart', 'published'),
('finance', 'Finance', 'Financial management software for budgeting, forecasting, spend management, and tracking the financial health of a business.', 'Best Finance Software & Tools (2026) | Gappsy', 'Compare top finance and financial management platforms. Find the best budgeting, forecasting, and spend management software.', 'Landmark', 'published'),
('accounting', 'Accounting', 'Accounting software for bookkeeping, financial reporting, tax preparation, and managing the books for businesses of every size.', 'Best Accounting Software & Tools (2026) | Gappsy', 'Browse top accounting platforms for bookkeeping and financial reporting. Compare features, pricing, and reviews.', 'Calculator', 'published'),
('payments', 'Payments', 'Payment processing platforms that let businesses accept, manage, and reconcile online and in-person transactions securely.', 'Best Payment Processing Software (2026) | Gappsy', 'Compare top payment processing platforms and gateways. Find the best payments software by fees, features, and reviews.', 'CreditCard', 'published'),
('invoicing', 'Invoicing', 'Invoicing software that helps businesses create, send, and track invoices and get paid faster by clients and customers.', 'Best Invoicing Software & Tools (2026) | Gappsy', 'Discover top invoicing platforms for freelancers and businesses. Compare features, pricing, and reviews to get paid faster.', 'Receipt', 'published'),
('productivity', 'Productivity', 'Productivity software that helps individuals and teams organize work, manage time, and get more done with less friction.', 'Best Productivity Software & Tools (2026) | Gappsy', 'Compare top productivity tools and apps. Find the best software for organizing work, managing time, and boosting output.', 'CheckCircle2', 'published'),
('project-management', 'Project Management', 'Project management platforms for planning, tracking, and delivering projects on time with tasks, timelines, and team collaboration.', 'Best Project Management Software (2026) | Gappsy', 'Browse top project management tools. Compare timelines, task tracking, and collaboration features by pricing and reviews.', 'Kanban', 'published'),
('task-management', 'Task Management', 'Task management apps that help individuals and teams organize to-dos, set priorities, and track progress on daily work.', 'Best Task Management Software & Apps (2026) | Gappsy', 'Compare top task management tools and to-do apps. Find the best software for organizing and tracking daily work.', 'ListChecks', 'published'),
('documentation', 'Documentation', 'Documentation tools for writing, organizing, and publishing internal docs, product manuals, and technical guides.', 'Best Documentation Software & Tools (2026) | Gappsy', 'Discover top documentation platforms for technical writing and product docs. Compare features, pricing, and reviews.', 'BookOpen', 'published'),
('knowledge-base', 'Knowledge Base', 'Knowledge base software for building self-service help centers and internal wikis that answer customer and employee questions.', 'Best Knowledge Base Software & Tools (2026) | Gappsy', 'Compare top knowledge base and help center platforms. Find the best self-service software by features, pricing, and reviews.', 'Library', 'published'),
('collaboration', 'Collaboration', 'Team collaboration tools that bring conversations, files, and shared work into one place so distributed teams can work together.', 'Best Team Collaboration Software (2026) | Gappsy', 'Browse top collaboration platforms for remote and hybrid teams. Compare features, pricing, and reviews.', 'Users2', 'published'),
('design', 'Design', 'Design software for creating digital products, brand assets, and visual content across web, mobile, and print.', 'Best Design Software & Tools (2026) | Gappsy', 'Compare top design platforms for UI, branding, and visual content. Find the best design software by features and pricing.', 'Palette', 'published'),
('graphic-design', 'Graphic Design', 'Graphic design tools for creating logos, illustrations, marketing graphics, and other visual brand assets.', 'Best Graphic Design Software & Tools (2026) | Gappsy', 'Discover top graphic design platforms for logos, illustrations, and marketing visuals. Compare features and pricing.', 'PenTool', 'published'),
('video-editing', 'Video Editing', 'Video editing software for cutting, polishing, and producing professional video content for marketing, social, and film.', 'Best Video Editing Software & Tools (2026) | Gappsy', 'Compare top video editing platforms for creators and marketers. Find the best software by features, pricing, and reviews.', 'Film', 'published'),
('photo-editing', 'Photo Editing', 'Photo editing software for retouching, enhancing, and transforming images for marketing, ecommerce, and creative projects.', 'Best Photo Editing Software & Tools (2026) | Gappsy', 'Browse top photo editing platforms. Compare retouching, enhancement, and creative editing tools by pricing and reviews.', 'Camera', 'published'),
('no-code', 'No-Code', 'No-code platforms that let anyone build apps, websites, and workflows visually, without writing a single line of code.', 'Best No-Code Tools & Platforms (2026) | Gappsy', 'Compare top no-code app and website builders. Find the best no-code platform by features, pricing, and user reviews.', 'Blocks', 'published'),
('low-code', 'Low-Code', 'Low-code development platforms that combine visual building with custom code so teams can ship software faster.', 'Best Low-Code Platforms & Tools (2026) | Gappsy', 'Discover top low-code development platforms. Compare features, pricing, and reviews to speed up app delivery.', 'Puzzle', 'published'),
('website-builders', 'Website Builders', 'Website builders that let businesses design, launch, and manage websites without hiring a developer.', 'Best Website Builders & Software (2026) | Gappsy', 'Compare top website builder platforms. Find the best drag-and-drop website software by features, pricing, and reviews.', 'LayoutTemplate', 'published'),
('ecommerce', 'Ecommerce', 'Ecommerce platforms for building online stores, managing inventory, processing orders, and selling products online.', 'Best Ecommerce Software & Platforms (2026) | Gappsy', 'Browse top ecommerce platforms for online stores. Compare features, pricing, and reviews to find the best fit for your business.', 'ShoppingCart', 'published'),
('forms', 'Forms', 'Online form builders for collecting leads, feedback, orders, and data through simple, customizable forms.', 'Best Online Form Builders & Software (2026) | Gappsy', 'Compare top online form builders. Find the best form software for leads, feedback, and data collection.', 'ClipboardList', 'published'),
('surveys', 'Surveys', 'Survey software for collecting customer feedback, running market research, and measuring satisfaction at scale.', 'Best Survey Software & Tools (2026) | Gappsy', 'Discover top survey platforms for customer feedback and market research. Compare features, pricing, and reviews.', 'ClipboardCheck', 'published'),
('scheduling', 'Scheduling', 'Scheduling software that automates booking appointments, meetings, and shifts so teams spend less time on back-and-forth.', 'Best Scheduling Software & Tools (2026) | Gappsy', 'Compare top scheduling and appointment booking platforms. Find the best software by features, pricing, and reviews.', 'CalendarClock', 'published'),
('calendar', 'Calendar', 'Calendar apps and tools for managing schedules, sharing availability, and keeping teams and individuals organized.', 'Best Calendar Software & Apps (2026) | Gappsy', 'Browse top calendar apps and scheduling tools. Compare features, pricing, and reviews for managing your time.', 'Calendar', 'published'),
('hr', 'HR', 'Human resources software for managing employees, payroll, benefits, and HR operations in one system.', 'Best HR Software & Tools (2026) | Gappsy', 'Compare top HR platforms for payroll, benefits, and people management. Find the best HR software by features and pricing.', 'Briefcase', 'published'),
('recruitment', 'Recruitment', 'Recruitment and hiring software for sourcing candidates, managing applicants, and streamlining the interview process.', 'Best Recruitment Software & Tools (2026) | Gappsy', 'Discover top recruiting and applicant tracking platforms. Compare features, pricing, and reviews for hiring teams.', 'UserPlus', 'published'),
('legal', 'Legal', 'Legal software for contract management, e-signatures, compliance, and other legal operations for businesses and law firms.', 'Best Legal Software & Tools (2026) | Gappsy', 'Compare top legal tech platforms for contracts, compliance, and legal operations. Find the best software by features and pricing.', 'Scale', 'published'),
('security', 'Security', 'Cybersecurity software for protecting data, systems, and networks from threats, breaches, and unauthorized access.', 'Best Security Software & Tools (2026) | Gappsy', 'Browse top cybersecurity platforms. Compare threat protection, monitoring, and security software by features and reviews.', 'Shield', 'published'),
('password-managers', 'Password Managers', 'Password managers that securely store, generate, and autofill credentials to keep accounts and teams protected.', 'Best Password Manager Software (2026) | Gappsy', 'Compare top password manager apps for individuals and teams. Find the best software by security features and pricing.', 'KeyRound', 'published'),
('cloud-storage', 'Cloud Storage', 'Cloud storage platforms for storing, syncing, and backing up files securely and accessing them from anywhere.', 'Best Cloud Storage Software & Tools (2026) | Gappsy', 'Discover top cloud storage platforms. Compare storage limits, sync features, and pricing to find the right fit.', 'Cloud', 'published'),
('file-management', 'File Management', 'File management software for organizing, sharing, and controlling access to documents and digital assets across a team.', 'Best File Management Software (2026) | Gappsy', 'Compare top file management and sharing platforms. Find the best software for organizing team documents and assets.', 'FolderOpen', 'published'),
('developer-tools', 'Developer Tools', 'Developer tools that help engineering teams build, test, deploy, and maintain software more efficiently.', 'Best Developer Tools & Software (2026) | Gappsy', 'Browse top developer tools and platforms. Compare features, pricing, and reviews for building and shipping software.', 'Terminal', 'published'),
('devops', 'DevOps', 'DevOps platforms for continuous integration, deployment, monitoring, and infrastructure automation.', 'Best DevOps Tools & Software (2026) | Gappsy', 'Compare top DevOps platforms for CI/CD, monitoring, and infrastructure automation. Find the best tool for your stack.', 'GitBranch', 'published'),
('api-tools', 'API Tools', 'API tools for building, testing, documenting, and managing APIs across development teams.', 'Best API Tools & Software (2026) | Gappsy', 'Discover top API development, testing, and management platforms. Compare features, pricing, and reviews.', 'Plug', 'published'),
('databases', 'Databases', 'Database platforms for storing, querying, and managing structured and unstructured data at any scale.', 'Best Database Software & Platforms (2026) | Gappsy', 'Compare top database platforms for applications of every size. Find the best database software by features and pricing.', 'Database', 'published'),
('cms', 'CMS', 'Content management systems for building, publishing, and managing websites and digital content without custom code.', 'Best CMS Software & Platforms (2026) | Gappsy', 'Browse top content management system platforms. Compare features, pricing, and reviews to power your website.', 'Newspaper', 'published'),
('hosting', 'Hosting', 'Web hosting and cloud infrastructure platforms for deploying and running websites, apps, and services.', 'Best Web Hosting & Cloud Platforms (2026) | Gappsy', 'Compare top web hosting and cloud infrastructure providers. Find the best hosting platform by performance and pricing.', 'Server', 'published'),
('communication', 'Communication', 'Business communication software for messaging, calls, and connecting teams and customers across every channel.', 'Best Communication Software & Tools (2026) | Gappsy', 'Discover top business communication platforms. Compare messaging, calling, and collaboration tools by pricing and reviews.', 'MessageSquare', 'published'),
('team-chat', 'Team Chat', 'Team chat apps that bring instant messaging, channels, and file sharing together for fast internal communication.', 'Best Team Chat Software & Apps (2026) | Gappsy', 'Compare top team chat and messaging platforms. Find the best internal communication software by features and pricing.', 'MessagesSquare', 'published'),
('video-conferencing', 'Video Conferencing', 'Video conferencing platforms for hosting meetings, webinars, and virtual events with screen sharing and recording.', 'Best Video Conferencing Software (2026) | Gappsy', 'Browse top video conferencing platforms for meetings and webinars. Compare features, pricing, and reviews.', 'MonitorPlay', 'published'),
('translation', 'Translation', 'Translation and localization software that helps businesses adapt content and products for global audiences.', 'Best Translation & Localization Software (2026) | Gappsy', 'Compare top translation and localization platforms. Find the best software for global content and products.', 'Languages', 'published'),
('online-learning', 'Online Learning', 'Online learning and e-learning platforms for building courses, training employees, and delivering education at scale.', 'Best Online Learning Software & Platforms (2026) | Gappsy', 'Discover top e-learning and training platforms. Compare course-building, LMS, and education software by features and pricing.', 'GraduationCap', 'published'),
('product-management', 'Product Management', 'Product management software for roadmapping, gathering feedback, and prioritizing what to build next.', 'Best Product Management Software (2026) | Gappsy', 'Compare top product management platforms for roadmaps, feedback, and prioritization. Find the best software for product teams.', 'Compass', 'published')
ON CONFLICT (slug) DO NOTHING;

-- ═══════════════════════════════════════════════════════════════════════
-- SOURCE 3 of 3: 20260710140000_20260710_seed_tool_tags.sql
-- ═══════════════════════════════════════════════════════════════════════

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
