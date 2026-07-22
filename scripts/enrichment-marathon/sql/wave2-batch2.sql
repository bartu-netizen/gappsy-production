-- Enrichment marathon batch: Adobe Acrobat, Adobe Express, Adobe Firefly, Adobe Illustrator, Adobe Photoshop, ADP Workforce Now, Advanced Web Ranking, AdvancedMD

-- ── Adobe Acrobat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adobe Acrobat is a PDF platform for viewing, editing, converting, e-signing, and organizing PDF files, available as a free Reader and paid Standard/Pro subscriptions.$q$, short_description),
  pricing_model = COALESCE($q$Free plan + subscription$q$, pricing_model),
  starting_price = COALESCE($q$$14.99/month (Standard, annual plan billed monthly)$q$, starting_price),
  founded_year = COALESCE(1982, founded_year),
  company_size = COALESCE($q$31,000+ employees (Adobe Inc., Nov 2025)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Japanese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$Adobe Acrobat: PDF Editor, Converter & E-Sign$q$, seo_title),
  seo_meta_description = COALESCE($q$Adobe Acrobat lets you view, edit, convert, and e-sign PDF files. Free Reader plus Standard and Pro plans starting at $14.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adobe Acrobat is a PDF document platform made by Adobe Inc., the San Jose, California software company founded in 1982. Acrobat lets users view, create, edit, convert, organize, protect, and electronically sign PDF files. The free Acrobat Reader app is used to open and annotate PDFs, while paid Acrobat Standard and Pro subscriptions unlock editing tools such as converting PDFs to and from Word, Excel, and PowerPoint, combining and reordering pages, redacting sensitive content (Pro), and applying passwords or permissions. Acrobat also includes an AI Assistant that can summarize documents and answer questions about PDF content, and integrates with Adobe Acrobat Sign for requesting and tracking electronic signatures. Acrobat is available as a desktop app for Windows and Mac, a web app, and mobile apps for iOS and Android, with documents synced through Adobe Document Cloud. Pricing is subscription-based: Acrobat Standard starts at $14.99/month and Acrobat Pro at $19.99/month on annual plans billed monthly, with higher month-to-month rates and separate team pricing. Acrobat is used by individuals, students, and businesses that need reliable PDF creation, conversion, and e-signature workflows, and it remains one of the most widely used PDF tools because the PDF format itself originated at Adobe. It competes with PDF tools such as Foxit, Nitro, and Smallpdf, but is often preferred for format fidelity and Creative Cloud integration.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '931411f0-b95b-42fa-bb83-f3a80c291cef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '931411f0-b95b-42fa-bb83-f3a80c291cef' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$PDF Editing$q$, $q$Edit text and images directly within PDF files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Convert PDFs$q$, $q$Convert PDFs to and from Word, Excel, PowerPoint, and image formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$E-signatures$q$, $q$Request, sign, and track signatures via Acrobat Sign integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$AI Assistant$q$, $q$Summarize documents and ask questions about PDF content using generative AI.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Organize & Protect$q$, $q$Merge, split, reorder, compress, and password-protect PDFs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Free Reader$q$, $q$Acrobat Reader is free for viewing, printing, and basic annotation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Cross-Platform Access$q$, $q$Desktop apps for Windows and Mac, plus web, iOS, and Android apps.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Free Reader is ubiquitous and compatible with virtually all PDF files$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Built-in e-signature workflow via Acrobat Sign$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Reliable PDF-to-Office conversion accuracy$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Available across desktop, web, and mobile$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Full editing and Pro-tier features require a paid subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Annual plans carry an early-cancellation fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Can feel feature-heavy compared to lightweight PDF tools for simple tasks$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Is Adobe Acrobat free?$q$, $q$Acrobat Reader is free for viewing and basic annotation; editing, converting, and Pro features require a Standard or Pro subscription.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$What's the difference between Acrobat Standard and Pro?$q$, $q$Pro adds features like redaction, PDF comparison, and additional export/OCR options beyond what Standard offers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Does Acrobat support e-signatures?$q$, $q$Yes, through its integration with Adobe Acrobat Sign.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Can I cancel my Acrobat subscription anytime?$q$, $q$Annual plans billed monthly charge an early-termination fee if canceled before the year is up; month-to-month plans can be canceled anytime at a higher price.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Business document management$q$, $q$Teams use Acrobat to edit, convert, and route contracts and reports as PDFs.$q$, $q$Businesses and office teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Legal and contract e-signing$q$, $q$Attorneys and sales teams use Acrobat Sign integration to collect signatures.$q$, $q$Legal, sales, and HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Converting scanned or PDF documents$q$, $q$Converting scanned or PDF materials into editable Word or Excel files.$q$, $q$Students and researchers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Standard$q$, $q$$14.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Edit and convert PDFs","E-sign requests","Organize pages"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$Pro$q$, $q$$19.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Everything in Standard","Redact content","Compare PDFs","Advanced export/OCR"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '931411f0-b95b-42fa-bb83-f3a80c291cef';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adobe Acrobat is the PDF platform built by Adobe, the company that created the PDF format itself. It covers the full lifecycle of a PDF document, from viewing and annotating to editing, converting, organizing, and signing.$q$, $q$The free Acrobat Reader app handles viewing, printing, and basic commenting, while paid Acrobat Standard and Pro subscriptions add editing, conversion, and advanced document-protection tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Acrobat lets users edit text and images directly in a PDF, convert PDFs to and from Word, Excel, and PowerPoint, and merge, split, reorder, or compress files.$q$, $q$An AI Assistant can summarize long documents and answer questions about their content, and Acrobat Sign integration lets users request, track, and collect electronic signatures without leaving the app.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Acrobat Standard starts at $14.99/month and Acrobat Pro at $19.99/month on annual plans billed monthly; month-to-month pricing without an annual commitment is higher. Team and business pricing is available separately.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Acrobat is used by businesses that route contracts and reports as PDFs, legal and sales teams that need e-signatures, and students or researchers converting scanned or PDF material into editable Office documents.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Adobe Express ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adobe Express is a free online design app for creating social posts, flyers, videos, and marketing graphics using templates and built-in generative AI tools.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Premium $9.99/month)$q$, starting_price),
  founded_year = COALESCE(1982, founded_year),
  company_size = COALESCE($q$31,000+ employees (Adobe Inc., Nov 2025)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Japanese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$Adobe Express: Free Online Design & Video Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Create social posts, flyers, and videos with Adobe Express. Free plan available; Premium adds AI credits and stock assets from $9.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adobe Express is a web and mobile design application made by Adobe Inc., built for quickly creating social media graphics, flyers, presentations, videos, and marketing materials from templates. It combines a drag-and-drop editor with generative AI features powered by Adobe Firefly, including text-to-image generation, background removal, and AI-assisted layout suggestions. The free plan includes access to over 100,000 templates, more than 1 million stock assets, 5GB of storage, and scheduling to one social account per network. The Premium plan, priced at $9.99 per month, expands this to over 200 million stock assets, 30,000+ fonts, roughly 250 monthly generative AI credits, video background removal, brand kits, 100GB of storage, and multi-account social scheduling; Premium is also bundled into Creative Cloud Standard and Pro subscriptions. A Teams plan starting around $4.99 per user per month adds collaboration and admin controls. Adobe Express runs in the browser and has dedicated iOS and Android apps. It's aimed at small businesses, marketers, content creators, students, and social media managers who need fast, template-driven design without the learning curve of full desktop tools like Photoshop or Illustrator.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c800b98-87da-4392-80f8-cc8ac66f95be';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c800b98-87da-4392-80f8-cc8ac66f95be' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Template Library$q$, $q$100,000+ templates for social posts, flyers, video, and presentations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Generative AI Tools$q$, $q$Text-to-image generation and AI-assisted design powered by Adobe Firefly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Stock Assets$q$, $q$Access to Adobe Stock photos, videos, icons, and fonts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Social Scheduling$q$, $q$Schedule and publish posts directly to social accounts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Brand Kits$q$, $q$Save brand colors, fonts, and logos for consistent designs (Premium).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Video Editor$q$, $q$Trim, add captions, and remove backgrounds from video clips.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Cross-Platform$q$, $q$Web app plus iOS and Android mobile apps.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Free tier is genuinely usable with a large template and stock library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Generative AI features are built in without needing separate tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Faster, more beginner-friendly editor than full Creative Cloud apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Premium is included free with Creative Cloud Standard/Pro subscriptions$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Advanced design control is limited compared to Photoshop or Illustrator$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Best AI and stock features are gated behind the Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Free plan limits storage and social scheduling to one account per network$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Is Adobe Express free?$q$, $q$Yes, Adobe Express has a free plan with templates, basic editing, and limited stock assets and storage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$What does Adobe Express Premium include?$q$, $q$Premium ($9.99/month) adds expanded stock assets, more fonts, generative AI credits, brand kits, and more storage.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Is Adobe Express the same as Photoshop?$q$, $q$No, Express is a template-based design tool for quick graphics and video, while Photoshop is a professional pixel-editing application.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Does Adobe Express have a mobile app?$q$, $q$Yes, it's available on iOS and Android in addition to the web app.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Social media content creation$q$, $q$Marketers and creators use templates to produce on-brand social graphics and short videos quickly.$q$, $q$Social media managers and content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Small business marketing materials$q$, $q$Small businesses design flyers, logos, and promotional graphics without hiring a designer.$q$, $q$Small business owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Quick presentations and documents$q$, $q$Users create presentations, resumes, and other documents from templates.$q$, $q$Students and professionals$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Free$q$, $q$$0$q$, NULL, NULL, $q$["100,000+ templates","1M+ stock assets","5GB storage","10-day version history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Premium$q$, $q$$9.99/month$q$, $q$Monthly (17% off if billed annually)$q$, NULL, $q$["200M+ stock assets","30,000+ fonts","~250 monthly AI credits","100GB storage","Brand kits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$Teams$q$, $q$From $4.99/user/month$q$, $q$Monthly$q$, NULL, $q$["Collaboration tools","Admin controls","1TB storage","24/7 support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adobe Express is a browser and mobile design app aimed at quick, template-driven content creation rather than the precision editing of Photoshop or Illustrator.$q$, $q$It blends a drag-and-drop editor, a large template and stock library, and generative AI tools powered by Adobe Firefly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Users start from templates for social posts, flyers, presentations, and videos, and can generate images or remove backgrounds using built-in Firefly-powered AI tools.$q$, $q$A video editor supports trimming, captions, and background removal, and brand kits keep colors, fonts, and logos consistent across designs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The free plan includes 100,000+ templates, 1M+ stock assets, and 5GB of storage. Premium costs $9.99/month and adds expanded stock, fonts, generative AI credits, brand kits, and 100GB storage. A Teams plan starts around $4.99 per user/month.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Adobe Express is aimed at social media managers, small business owners, content creators, and students who need fast, on-brand graphics and video without a steep learning curve.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Adobe Firefly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adobe Firefly is Adobe's generative AI tool for creating images, text effects, vector graphics, and video from text prompts, with a free tier and credit-based paid plans.$q$, short_description),
  pricing_model = COALESCE($q$Freemium (credit-based)$q$, pricing_model),
  starting_price = COALESCE($q$Free (limited monthly credits); paid plans from ~$9.99/month$q$, starting_price),
  founded_year = COALESCE(1982, founded_year),
  company_size = COALESCE($q$31,000+ employees (Adobe Inc., Nov 2025)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Japanese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$Adobe Firefly: Generative AI Image & Video Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Adobe Firefly generates images, video, and vector art from text prompts. Free plan available; paid plans start around $9.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adobe Firefly is a family of generative AI models and a web/mobile application built by Adobe Inc. that creates images, text effects, vector graphics, and video from text prompts. It powers generative features embedded across Creative Cloud apps such as Photoshop's Generative Fill and Illustrator's Generative Recolor, and is also available as a standalone web app and mobile app for iOS and Android. Firefly supports text-to-image generation, generative fill and expand, generative video (including via third-party models like Google's Veo), sound-effect generation, and Firefly Boards, a collaborative AI moodboarding tool in beta. Adobe states that Firefly's core models are trained on Adobe Stock images, openly licensed content, and public-domain material, and are designed to be safe for commercial use. Firefly uses a credit-based pricing system: a free plan includes a limited number of monthly generative credits, while paid plans (Standard, Pro, and Premium) offer larger monthly credit allotments for premium features like video and third-party AI models, with unlimited standard image generation included on paid tiers. Firefly credits are also bundled into Creative Cloud subscriptions at lower allocations. It's aimed at designers, marketers, content creators, and Creative Cloud users who want AI-assisted image and video generation integrated into their existing workflow.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Text-to-Image Generation$q$, $q$Generate images from text prompts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Generative Fill & Expand$q$, $q$Extend or edit images with AI, integrated directly into Photoshop.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Generative Video$q$, $q$Create short video clips from text or image prompts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Text Effects & Vector Generation$q$, $q$Stylize text and generate vector graphics from prompts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Sound Effect Generation$q$, $q$Generate sound effects from text descriptions and add them to a timeline.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Firefly Boards$q$, $q$AI-assisted moodboarding for creative teams (public beta).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Mobile App$q$, $q$Standalone iOS and Android apps for on-the-go generation.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Adobe states models are trained with commercial-safe use in mind$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Deep integration with Photoshop, Illustrator, and Express$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Free tier available to try core features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Supports multiple generation types beyond images, including video and audio$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Credit system can be confusing and premium features consume credits quickly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Free plan has a low monthly credit allowance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Output quality still depends on prompting skill, as with most generative AI tools$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Is Adobe Firefly free?$q$, $q$Yes, there's a free plan with a limited number of monthly generative credits.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$What can Adobe Firefly generate?$q$, $q$Images, text effects, vector graphics, video clips, and sound effects from text prompts.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Is Adobe Firefly integrated into Photoshop?$q$, $q$Yes, Firefly powers features like Generative Fill directly inside Photoshop and other Creative Cloud apps.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Does Firefly have a mobile app?$q$, $q$Yes, Adobe launched standalone Firefly apps for iOS and Android in 2025.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Rapid concept and image generation$q$, $q$Designers generate visual concepts from text prompts before refining them in other tools.$q$, $q$Designers and marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$AI video creation$q$, $q$Creators generate short video clips from text or images for social content.$q$, $q$Content creators and social media teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$In-app photo editing$q$, $q$Photoshop and Illustrator users use Firefly-powered Generative Fill and Generative Recolor to speed up edits.$q$, $q$Creative Cloud users$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Free$q$, $q$$0$q$, $q$Monthly$q$, NULL, $q$["Limited monthly generative credits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Standard$q$, $q$~$9.99/month$q$, $q$Monthly$q$, NULL, $q$["~2,000 premium credits/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Pro$q$, $q$~$19.99/month$q$, $q$Monthly$q$, NULL, $q$["~4,000 premium credits/month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$Premium$q$, $q$~$199.99/month$q$, $q$Monthly$q$, NULL, $q$["~50,000 premium credits/month"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adobe Firefly is Adobe's generative AI platform, available as a standalone web and mobile app and embedded inside Creative Cloud apps like Photoshop and Illustrator.$q$, $q$Adobe states Firefly's models are trained on Adobe Stock, licensed, and public-domain content, positioning them as commercially safe to use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Firefly generates images, text effects, and vector graphics from text prompts, and its Generative Fill/Expand tools extend or edit existing images inside Photoshop.$q$, $q$Firefly also generates short video clips and sound effects from text or image prompts, and Firefly Boards offers AI-assisted moodboarding for creative teams.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$A free plan offers a limited number of monthly generative credits. Paid plans (Standard, Pro, Premium) start around $9.99/month and scale up to larger monthly premium-credit allotments for video and partner-model generations.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Firefly is aimed at designers, marketers, and content creators who want AI image/video generation, as well as existing Creative Cloud users who use Firefly-powered tools inside Photoshop and Illustrator.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Adobe Illustrator ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adobe Illustrator is professional vector graphics software for creating logos, icons, illustrations, and typography, available as a Creative Cloud subscription.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (free trial)$q$, pricing_model),
  starting_price = COALESCE($q$$22.99/month (single app, annual plan billed monthly)$q$, starting_price),
  founded_year = COALESCE(1982, founded_year),
  company_size = COALESCE($q$31,000+ employees (Adobe Inc., Nov 2025)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Japanese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$Adobe Illustrator: Vector Graphics Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Adobe Illustrator is the industry-standard vector design app for logos, icons, and illustration. Plans start around $22.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adobe Illustrator is a professional vector graphics editor made by Adobe Inc., first released in 1987, used for designing logos, icons, typography, illustrations, and print or digital artwork built from scalable vector paths rather than pixels. Core tools include the Pen tool for precision path drawing, advanced typography controls, gradient and pattern tools, and an extensive library of brushes and effects. Illustrator integrates with the rest of Creative Cloud, sharing assets with Photoshop, InDesign, and After Effects through Creative Cloud Libraries, and includes AI-assisted features such as Generative Recolor, which uses Adobe Firefly to recolor artwork from text prompts. An iPad version of Illustrator lets users draw and edit vector artwork on a tablet with Apple Pencil support. Illustrator is sold as a subscription: a single-app plan starts around $22.99/month on an annual commitment billed monthly (or roughly $34.49/month with no annual commitment), while the Creative Cloud All Apps plan bundling Illustrator with 20+ other apps runs about $59.99/month annually. Team and student/teacher pricing is also available. Illustrator is aimed at graphic designers, brand and logo designers, illustrators, and print/packaging designers who need precision vector tools, and it remains a standard tool in professional design workflows alongside Photoshop.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53d8a955-0f74-4814-b877-caeb34bf0761';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53d8a955-0f74-4814-b877-caeb34bf0761' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Vector Drawing$q$, $q$Precision Pen tool and shape tools for scalable artwork.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Typography Tools$q$, $q$Advanced type and font controls for branding and print.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Generative Recolor$q$, $q$AI-assisted recoloring of artwork via Adobe Firefly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Creative Cloud Libraries$q$, $q$Share colors, assets, and brushes across Adobe apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$iPad App$q$, $q$Draw and edit vector art on tablet with Apple Pencil support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Effects & Brushes Library$q$, $q$Extensive built-in effects, brushes, and pattern tools.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Industry-standard vector tool with deep precision control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Strong integration with the rest of Creative Cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$iPad app extends the workflow to tablets$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Regular feature updates including AI tools$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Subscription-only, no perpetual license option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Steep learning curve for beginners$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Can be expensive as a single app versus bundled suites for casual users$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Can I buy Illustrator outright instead of subscribing?$q$, $q$No, Adobe only offers Illustrator via subscription; there's no one-time purchase option.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Does Illustrator work on iPad?$q$, $q$Yes, Adobe offers a dedicated Illustrator app for iPad.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$What's the difference between Illustrator and Photoshop?$q$, $q$Illustrator creates scalable vector graphics built from paths, while Photoshop edits pixel-based raster images like photos.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Is there a free trial?$q$, $q$Adobe offers a free trial period for Illustrator before requiring a paid subscription.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Logo and brand identity design$q$, $q$Designers create scalable logos and brand assets that work at any size.$q$, $q$Graphic and brand designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Illustration and digital art$q$, $q$Illustrators produce vector artwork, icons, and character designs.$q$, $q$Illustrators and icon designers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Print and packaging design$q$, $q$Designers prepare vector-based layouts for print and packaging production.$q$, $q$Print and packaging designers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Single App (annual, billed monthly)$q$, $q$$22.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Full Illustrator desktop app"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Single App (month-to-month)$q$, $q$$34.49/month$q$, $q$Monthly, no commitment$q$, NULL, $q$["Full Illustrator desktop app","Cancel anytime"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Creative Cloud All Apps$q$, $q$$59.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Illustrator plus 20+ Adobe apps"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$Team$q$, $q$$37.99/user/month$q$, $q$Monthly$q$, NULL, $q$["Illustrator + Adobe Express Premium","1TB storage","25 monthly AI credits"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '53d8a955-0f74-4814-b877-caeb34bf0761';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adobe Illustrator is a vector graphics editor built around paths rather than pixels, letting artwork scale to any size without quality loss.$q$, $q$First released in 1987, it remains one of Adobe's flagship design applications and the industry standard for logo and icon design.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Illustrator's Pen tool, typography controls, and gradient/pattern tools give designers precise control over vector artwork, and it shares assets with other Creative Cloud apps through Creative Cloud Libraries.$q$, $q$Generative Recolor, powered by Adobe Firefly, lets users recolor artwork from text prompts, and an iPad app supports drawing and editing with Apple Pencil.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$A single-app plan starts around $22.99/month on an annual commitment billed monthly (about $34.49/month without an annual commitment). The Creative Cloud All Apps plan runs about $59.99/month annually, and a Team plan is available around $37.99/user/month.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Illustrator is aimed at graphic designers, brand and logo designers, illustrators, and print or packaging designers who need scalable, precision vector artwork.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Adobe Photoshop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adobe Photoshop is the industry-standard raster image editing app for photo retouching, compositing, and digital art, offered via Creative Cloud subscription.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (free trial)$q$, pricing_model),
  starting_price = COALESCE($q$$9.99/month (Photography Plan with Lightroom, 20GB)$q$, starting_price),
  founded_year = COALESCE(1982, founded_year),
  company_size = COALESCE($q$31,000+ employees (Adobe Inc., Nov 2025)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Japanese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$Adobe Photoshop: Photo & Image Editing Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Adobe Photoshop is the leading pixel-based image editor for retouching, compositing, and design. Plans start around $9.99/month with Lightroom.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adobe Photoshop is a raster image editing application made by Adobe Inc., originally released in 1990, widely used for photo retouching, compositing, digital painting, and graphic design. It works with pixel-based images organized in layers, and includes tools for selection, masking, color correction, and filters. Photoshop's Generative Fill and Generative Expand features, powered by Adobe Firefly, let users add, remove, or extend image content using text prompts, and Neural Filters apply AI-driven effects like skin smoothing or sky replacement. Photoshop integrates with Adobe Lightroom for photo management and with Creative Cloud Libraries for sharing assets across apps, and an iPad version supports touch and Apple Pencil editing. Photoshop is subscription-only: the standalone app costs about $22.99/month on an annual plan billed monthly, while the Photography Plan bundling Photoshop with Lightroom starts at $9.99/month (20GB cloud storage) or $19.99/month (1TB storage). It's also included in the Creative Cloud All Apps plan. Photoshop is used by photographers, graphic designers, digital artists, and marketing teams that need precise photo editing and compositing, and it remains the dominant tool in professional image editing, with 'photoshop' having become a generic verb for photo manipulation.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Layer-Based Editing$q$, $q$Non-destructive editing using layers, masks, and adjustment layers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Generative Fill & Expand$q$, $q$AI-powered content generation and extension from text prompts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Neural Filters$q$, $q$AI-powered effects such as skin smoothing and sky replacement.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Selection & Masking Tools$q$, $q$Precise object selection and masking for compositing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Lightroom Integration$q$, $q$Sync photos and edits with Adobe Lightroom.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$iPad App$q$, $q$Touch and Apple Pencil editing on iPad.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Most widely supported image-editing format and plugin ecosystem$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Powerful AI generative tools for compositing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Deep integration with Lightroom and Creative Cloud$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Available on both desktop and iPad$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Subscription-only pricing, no perpetual license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Resource-intensive; requires a capable computer$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Steep learning curve for the full feature set$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Can I buy Photoshop as a one-time purchase?$q$, $q$No, Photoshop is subscription-only through Adobe Creative Cloud.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$What is Generative Fill?$q$, $q$An AI feature that lets users add, remove, or extend image content using text prompts, powered by Adobe Firefly.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Does Photoshop include Lightroom?$q$, $q$The Photography Plan bundles Photoshop with Lightroom starting at $9.99/month.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Is there an iPad version?$q$, $q$Yes, Adobe offers a Photoshop app for iPad.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Photo retouching and editing$q$, $q$Photographers retouch and color-correct images for clients.$q$, $q$Photographers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Digital compositing and art$q$, $q$Artists combine and manipulate images to create composite artwork.$q$, $q$Digital artists and designers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Marketing and social graphics$q$, $q$Teams edit product photos and create graphics for campaigns.$q$, $q$Marketing and creative teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Photography Plan (20GB)$q$, $q$$9.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Photoshop + Lightroom","20GB cloud storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Photography Plan (1TB)$q$, $q$$19.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Photoshop + Lightroom","1TB cloud storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Photoshop Single App$q$, $q$$22.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Full Photoshop desktop and iPad app"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$Creative Cloud All Apps$q$, $q$$69.99/month$q$, $q$Annual, billed monthly$q$, NULL, $q$["Photoshop plus 20+ Adobe apps"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '8c9d4cc8-10e6-4477-bd67-5b29fe5d266a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adobe Photoshop is a pixel-based (raster) image editor, first released in 1990, that remains the standard tool for photo retouching, compositing, and digital art.$q$, $q$Images are organized in editable layers, with dedicated tools for selection, masking, color correction, and filters.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Generative Fill and Generative Expand, powered by Adobe Firefly, let users add, remove, or extend image content from text prompts, while Neural Filters apply AI-driven effects like skin smoothing or sky replacement.$q$, $q$Photoshop integrates with Lightroom for photo management and Creative Cloud Libraries for shared assets, and an iPad app supports touch and Apple Pencil editing.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The Photography Plan bundling Photoshop with Lightroom starts at $9.99/month (20GB storage) or $19.99/month (1TB storage). The standalone Photoshop app costs about $22.99/month, and it's also included in the Creative Cloud All Apps plan.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Photoshop is used by photographers, digital artists, graphic designers, and marketing teams that need precise photo editing, retouching, and compositing.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── ADP Workforce Now ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ADP Workforce Now is a cloud HR platform combining payroll, benefits administration, time tracking, and talent management for small and midsized businesses.$q$, short_description),
  pricing_model = COALESCE($q$Custom quote (contact sales)$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(1949, founded_year),
  company_size = COALESCE($q$~67,000 employees (ADP, 2025)$q$, company_size),
  headquarters = COALESCE($q$Roseland, New Jersey, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ADP Workforce Now: HR & Payroll Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$ADP Workforce Now unifies payroll, HR, benefits, and time tracking in one cloud platform for small and midsized businesses. Custom pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ADP Workforce Now is a cloud-based human capital management (HCM) platform from ADP (Automatic Data Processing), a payroll and HR services company founded in 1949 and headquartered in Roseland, New Jersey. Workforce Now unifies payroll processing, HR management, benefits administration, time and attendance tracking, and talent management (recruiting, onboarding, and performance) in a single platform aimed at small and midsized businesses, roughly 1 to 999 employees, though ADP also serves larger enterprises through related products. The platform includes AI-assisted features such as payroll anomaly detection, turnover prediction, and compensation benchmarking drawing on ADP's payroll database covering millions of U.S. employees. It's sold in tiered packages -- Select, Plus, and Premium -- with each tier adding more functionality, such as full time-and-attendance tracking in the Premium tier; pricing is not published and requires a custom quote from ADP. Workforce Now is accessible via a web dashboard and ADP's mobile apps, and integrates with third-party business applications through the ADP Marketplace. It's used by HR and payroll teams that want to consolidate multiple HR functions into one system rather than running separate payroll, benefits, and HR software.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Payroll Processing$q$, $q$Automated payroll calculation, tax filing, and AI anomaly detection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$HR Management$q$, $q$Centralized employee records, onboarding, and HR workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Time & Attendance$q$, $q$Time tracking and scheduling, included in the Premium tier.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Benefits Administration$q$, $q$Manage benefits enrollment and carrier connections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Talent Management$q$, $q$Recruiting, onboarding, and performance management tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Compensation Benchmarking$q$, $q$Salary comparison data drawn from ADP's payroll dataset.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$ADP Marketplace Integrations$q$, $q$Connects with third-party business applications.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Mobile Access$q$, $q$ADP mobile apps for employees and managers.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Consolidates payroll, HR, benefits, and time tracking in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Backed by ADP's decades of payroll compliance experience$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Compensation benchmarking data is a differentiator versus smaller HR tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Scales via tiered plans as a business grows$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Pricing isn't published; requires a sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Tiered structure means some features, like full time tracking, require upgrading to Premium$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Implementation and per-tier feature gating can add complexity versus simpler payroll tools$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$How much does ADP Workforce Now cost?$q$, $q$ADP doesn't publish pricing; cost depends on company size, modules selected, and requires a custom quote.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$What company sizes is Workforce Now for?$q$, $q$It's built primarily for businesses with 1 to 999 employees, with ADP offering separate products for larger enterprises.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$What are the plan tiers?$q$, $q$Select, Plus, and Premium, with Premium adding full time and attendance tracking.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Does Workforce Now have a mobile app?$q$, $q$Yes, employees and managers can access it through ADP's mobile apps.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Unified payroll and HR for growing businesses$q$, $q$Replaces separate payroll and HR systems with one integrated platform.$q$, $q$Small and midsized business HR/payroll teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Benefits and time tracking management$q$, $q$Administers employee benefits enrollment and tracks time and attendance in one system.$q$, $q$HR administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Talent acquisition and performance management$q$, $q$Manages recruiting, onboarding, and performance reviews.$q$, $q$HR and talent teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ADP Workforce Now is a cloud human capital management platform from ADP, a payroll processing company founded in 1949, aimed at consolidating payroll, HR, benefits, and time tracking into one system.$q$, $q$It's built primarily for businesses with 1 to 999 employees, with ADP offering separate products for larger enterprises.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core modules cover payroll processing with automated tax filing, HR record-keeping and onboarding, time and attendance tracking, benefits administration, and talent management for recruiting and performance.$q$, $q$AI-assisted features include payroll anomaly detection, turnover prediction, and compensation benchmarking drawn from ADP's payroll dataset.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Workforce Now is sold in three tiers -- Select, Plus, and Premium -- with Premium adding full time and attendance tracking. ADP does not publish pricing; cost depends on company size and modules selected, and requires a custom quote.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Workforce Now is aimed at HR and payroll teams at small and midsized businesses that want to replace multiple point solutions with one integrated HCM platform.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Advanced Web Ranking ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Advanced Web Ranking (AWR) is an SEO rank-tracking platform that monitors keyword rankings across Google, Bing, YouTube, and AI search engines for agencies and SEO teams.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$139/month (Pro plan)$q$, starting_price),
  founded_year = COALESCE(2002, founded_year),
  company_size = COALESCE($q$~67 employees (Caphyon, 2026)$q$, company_size),
  headquarters = COALESCE($q$Craiova, Romania$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Advanced Web Ranking: SEO Rank Tracking Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Advanced Web Ranking tracks keyword rankings, SERP features, and AI search visibility. Plans start at $139/month with a free trial.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Advanced Web Ranking (AWR) is an SEO rank-tracking and reporting platform made by Caphyon, a software company founded in 2002 and headquartered in Craiova, Romania. AWR tracks keyword rankings across Google, Bing, YouTube, Amazon, and regional search engines, with daily, weekly, or on-demand update schedules, and includes pixel-level SERP position tracking, click-through-rate estimates, and visibility metrics. It also offers AI search visibility tracking to monitor how sites appear in AI-generated search answers, SEO forecasting that compares organic traffic value to equivalent paid search costs, and competitor tracking for up to 50 rivals. AWR supports white-label, automated, and shareable reporting, and integrates with Google Analytics, Google Search Console, Bing Webmaster Tools, Looker Studio, and BigQuery, plus a developer API and a Chrome extension called AWR Search Anywhere. It's sold on tiered monthly plans -- Pro ($139/month, 7,000 keywords), Agency ($279/month, 14,500 keywords), Enterprise ($699/month, 35,500 keywords), and Enterprise Plus ($980/month, 50,000 keywords) -- with a 10% discount for annual billing and a 7-day free trial. AWR is aimed at SEO agencies, in-house SEO teams, and freelance SEO professionals who need detailed rank tracking and client-ready reporting at scale.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Multi-Engine Rank Tracking$q$, $q$Tracks rankings on Google, Bing, YouTube, Amazon, and regional search engines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Pixel-Level SERP Tracking$q$, $q$Tracks search result position to the pixel with CTR estimates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$AI Search Visibility Tracking$q$, $q$Monitors how sites appear in AI-generated search answers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$SEO Forecasting$q$, $q$Compares organic traffic value against equivalent Google Ads cost.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Competitor Tracking$q$, $q$Tracks up to 50 competitors at no extra cost.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$White-Label Reporting$q$, $q$Automated, shareable, and white-label client reports.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Integrations & API$q$, $q$Connects with Google Analytics, Search Console, Looker Studio, BigQuery, and a developer API.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Chrome Extension$q$, $q$AWR Search Anywhere extension for quick rank checks.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Granular, pixel-level SERP tracking beyond basic rank position$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Strong white-label reporting for agencies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Broad integration ecosystem, including Looker Studio and BigQuery$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Unlimited projects and users on paid plans$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$No permanent free tier, only a 7-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Pricing scales quickly with keyword volume needs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Primarily positioned toward agencies, which may be more than solo or small-site users need$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Does Advanced Web Ranking have a free plan?$q$, $q$No, it offers a 7-day free trial with no credit card required, but no permanent free tier.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$How much does AWR cost?$q$, $q$Plans start at $139/month for the Pro tier (7,000 keywords), up to $980/month for Enterprise Plus (50,000 keywords).$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Does AWR track AI search results?$q$, $q$Yes, it includes AI search visibility tracking alongside traditional SERP tracking.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Can I track competitors?$q$, $q$Yes, up to 50 competitors are included at no extra cost.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Agency client reporting$q$, $q$Agencies track rankings for multiple clients and generate white-label reports.$q$, $q$SEO agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Enterprise SEO tracking at scale$q$, $q$Large sites track tens of thousands of keywords with integrations like BigQuery.$q$, $q$Enterprise SEO teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Competitive SEO analysis$q$, $q$Teams monitor competitor rankings and SERP feature ownership.$q$, $q$In-house SEO teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Pro$q$, $q$$139/month$q$, $q$Monthly (10% off annual)$q$, NULL, $q$["7,000 keywords","Unlimited projects and users","AI visibility tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Agency$q$, $q$$279/month$q$, $q$Monthly (10% off annual)$q$, NULL, $q$["14,500 keywords","Unlimited SEO forecasts","1-hour on-demand updates","API access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Enterprise$q$, $q$$699/month$q$, $q$Monthly (10% off annual)$q$, NULL, $q$["35,500 keywords","BigQuery connector","Unlimited scheduled reports"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$Enterprise Plus 50k$q$, $q$$980/month$q$, $q$Monthly (10% off annual)$q$, NULL, $q$["50,000 keywords","Dedicated account manager","SSO and security audits"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Advanced Web Ranking (AWR) is an SEO rank-tracking platform built by Caphyon, a Romanian software company founded in 2002, with more than two decades of SERP-tracking experience.$q$, $q$It tracks keyword positions across multiple search engines and provides detailed SERP and visibility analytics beyond simple rank position.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AWR tracks rankings across Google, Bing, YouTube, Amazon, and regional engines on daily, weekly, or on-demand schedules, with pixel-level SERP position tracking and CTR estimates.$q$, $q$It also offers AI search visibility tracking, SEO forecasting against paid search cost, tracking of up to 50 competitors, and white-label, automated, and shareable reporting.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AWR is sold on four monthly tiers: Pro at $139/month (7,000 keywords), Agency at $279/month (14,500 keywords), Enterprise at $699/month (35,500 keywords), and Enterprise Plus at $980/month (50,000 keywords). Annual billing saves 10%, and a 7-day free trial is available with no credit card required.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AWR is aimed at SEO agencies, in-house SEO teams, and freelance SEO professionals who need detailed rank tracking, competitor monitoring, and client-ready reporting.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── AdvancedMD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AdvancedMD is a cloud-based platform combining electronic health records, practice management, and medical billing for independent healthcare practices.$q$, short_description),
  pricing_model = COALESCE($q$Custom quote (contact sales)$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE($q$~634 employees (2026)$q$, company_size),
  headquarters = COALESCE($q$South Jordan, Utah, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AdvancedMD: Cloud EHR & Practice Management$q$, seo_title),
  seo_meta_description = COALESCE($q$AdvancedMD combines EHR, scheduling, billing, and telehealth for independent medical practices. Pricing available by quote.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AdvancedMD is a cloud-based healthcare practice management and electronic health records (EHR) platform made by AdvancedMD, Inc., a company founded in 1999 and headquartered in South Jordan, Utah. The platform combines clinical documentation, practice management, medical billing, and patient engagement tools for independent medical practices and specialty clinics. Clinical features include AI-enabled and ambient documentation, electronic prescribing, and specialty-specific charting templates. Practice management tools cover appointment scheduling, real-time insurance eligibility verification, and claims management, while revenue cycle management (RCM) services handle claim scrubbing and accounts-receivable tracking, offered either as software or as a managed billing service. Patient-facing features include a patient portal, telehealth visits, automated appointment reminders, and secure messaging. AdvancedMD is hosted on AWS, is HIPAA-compliant, and holds ONC Health IT certification, and it supports MACRA/MIPS quality reporting. The platform is used by independent practices across specialties such as mental health, physical therapy, and orthopedics, as well as medical billing companies and larger multi-location group practices, and includes mobile apps for clinical and practice-management functions. AdvancedMD does not publish standard pricing; prospective customers must request a custom quote, and the company has offered promotions such as free introductory months for certain plans.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57bca61a-8bf5-445a-b275-cddca078e066';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57bca61a-8bf5-445a-b275-cddca078e066' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$EHR & Clinical Documentation$q$, $q$AI-enabled and ambient notes, e-prescribing, and specialty-specific charting templates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Practice Management$q$, $q$Scheduling, real-time insurance eligibility verification, and claims management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Revenue Cycle Management$q$, $q$Claim scrubbing, accounts-receivable tracking, and managed billing services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Patient Engagement$q$, $q$Patient portal, telehealth visits, appointment reminders, and secure messaging.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Analytics & Reporting$q$, $q$Real-time financial and clinical dashboards across multiple locations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Mobile Apps$q$, $q$Clinical and practice-management access on the go.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Compliance$q$, $q$HIPAA-compliant, ONC-certified, and MACRA/MIPS ready.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Combines EHR, practice management, and billing in one connected platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Specialty-specific templates for various practice types$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Offers both self-service software and managed billing service options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$ONC-certified and built for regulatory compliance (MACRA/MIPS)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$No public pricing; requires a sales quote to get costs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Third-party estimates suggest per-provider costs can be significant for full EHR plus practice management bundles$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$As an all-in-one platform, it may be more than very small practices need$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Does AdvancedMD publish its pricing?$q$, $q$No, pricing isn't publicly listed; practices need to request a quote based on modules and provider count.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Is AdvancedMD only for large practices?$q$, $q$No, it's designed primarily for independent and specialty practices of varying sizes, as well as billing companies.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Does AdvancedMD offer telehealth?$q$, $q$Yes, telehealth visits are included among its patient engagement tools.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Is AdvancedMD HIPAA-compliant?$q$, $q$Yes, and its EHR holds ONC Health IT certification.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Independent practice EHR and billing$q$, $q$Solo and small-group practices manage charting, scheduling, and claims in one system.$q$, $q$Independent medical practices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Specialty practice workflows$q$, $q$Mental health, physical therapy, and other specialty practices use tailored templates and workflows.$q$, $q$Specialty healthcare practices$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$Outsourced medical billing$q$, $q$Billing companies use AdvancedMD's RCM tools to manage claims for multiple provider clients.$q$, $q$Medical billing companies$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdvancedMD is a cloud-based practice management and EHR platform from AdvancedMD, Inc., founded in 1999 and headquartered in South Jordan, Utah.$q$, $q$It combines clinical documentation, practice management, billing, and patient engagement in one connected system for independent healthcare practices.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Clinical tools include AI-enabled and ambient documentation, e-prescribing, and specialty-specific templates, while practice management covers scheduling, real-time eligibility verification, and claims management.$q$, $q$Revenue cycle management services handle claim scrubbing and A/R tracking, available as software or a managed billing service, and patient-facing tools include a portal, telehealth, and secure messaging.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AdvancedMD does not publish standard pricing on its website; the company directs prospective customers to request a custom quote, with cost depending on practice size, specialty, and modules selected.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AdvancedMD serves independent and specialty medical practices, including mental health, physical therapy, and orthopedics providers, as well as medical billing companies and multi-location group practices.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

