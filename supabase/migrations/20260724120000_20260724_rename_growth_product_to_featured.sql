-- Rename the "growth" product tier value to "featured" in
-- vendor_feature_subscriptions, matching the app-wide Growth->Featured
-- rename. Widens the CHECK constraint additively (adds 'featured') before
-- migrating rows, then drops 'growth' from the allowed set since no row
-- should reference it anymore after the UPDATE.

ALTER TABLE vendor_feature_subscriptions
  DROP CONSTRAINT IF EXISTS vendor_feature_subscriptions_product_check;

ALTER TABLE vendor_feature_subscriptions
  ADD CONSTRAINT vendor_feature_subscriptions_product_check
  CHECK (product = ANY (ARRAY['claim'::text, 'growth'::text, 'featured'::text]));

UPDATE vendor_feature_subscriptions
SET product = 'featured'
WHERE product = 'growth';

ALTER TABLE vendor_feature_subscriptions
  DROP CONSTRAINT vendor_feature_subscriptions_product_check;

ALTER TABLE vendor_feature_subscriptions
  ADD CONSTRAINT vendor_feature_subscriptions_product_check
  CHECK (product = ANY (ARRAY['claim'::text, 'featured'::text]));
