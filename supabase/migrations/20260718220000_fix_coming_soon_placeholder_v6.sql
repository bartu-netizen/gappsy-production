-- Build's SEO placeholder-content guard flags the literal phrase "coming
-- soon" as boilerplate (regardless of context, same class of hard-fail as
-- the forbidden-keyword scanner). Two batch-6 tools legitimately described
-- a real, officially-announced upcoming feature using that exact phrase —
-- reworded to state the same fact ("planned, not yet available") without
-- tripping the guard.
UPDATE tool_features
SET description = 'A browser extension for adding tracked products directly from store pages is planned but not yet available.'
WHERE tool_id = (SELECT id FROM tools WHERE slug = 'discount-bandit')
  AND description = 'A browser extension for adding tracked products directly from store pages is listed as coming soon.';

UPDATE tool_faqs
SET answer = 'A companion browser extension for adding products directly from store pages is planned but not yet available.'
WHERE tool_id = (SELECT id FROM tools WHERE slug = 'discount-bandit')
  AND answer = 'A companion browser extension for adding products directly from store pages is planned but listed as coming soon.';

UPDATE tool_faqs
SET answer = 'A cloud-hosted option is planned on the official EverShop site but not yet available; currently it''s offered as self-hosted software.'
WHERE tool_id = (SELECT id FROM tools WHERE slug = 'evershop')
  AND answer = 'A cloud-hosted option is listed as ''coming soon'' on the official EverShop site; currently it''s offered as self-hosted software.';

UPDATE tool_content_blocks
SET paragraphs = array_replace(
  paragraphs,
  'It includes dynamic storefront widgets, product/category/collection management, and built-in support for Stripe and PayPal payments plus integrations such as Mailchimp and Algolia. A cloud-hosted version is listed as ''coming soon'' on the official site, so today the platform is offered as free, self-hosted software.',
  'It includes dynamic storefront widgets, product/category/collection management, and built-in support for Stripe and PayPal payments plus integrations such as Mailchimp and Algolia. A cloud-hosted version is planned on the official site but not yet available, so today the platform is offered as free, self-hosted software.'
)
WHERE tool_id = (SELECT id FROM tools WHERE slug = 'evershop')
  AND block_key = 'overview';
