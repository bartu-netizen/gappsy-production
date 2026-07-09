#!/bin/bash

echo "=== FINAL PRE-DEPLOY VERIFICATION ==="
echo ""

# Count rule types
total_rules=$(grep -c "^/" public/_redirects)
redirect_rules=$(grep -c "301" public/_redirects)
echo "Total rules: $total_rules"
echo "301 redirects: $redirect_rules"
echo ""

# Verify all 10 critical paths exist and resolve correctly
echo "=== CRITICAL PATH VERIFICATION (10 paths) ==="
echo ""

passed=0
failed=0

for source in /listing /pricing /login /contact-us /about-us /home /refund /refund/61 /marketing-agency-web-rocket-media-reviews /product/deal-1-special; do
  rule=$(grep "^${source} " public/_redirects | head -1)
  if [ -n "$rule" ]; then
    dest=$(echo "$rule" | awk '{print $2}')
    status=$(echo "$rule" | awk '{print $3}')
    if [ "$status" = "301" ]; then
      printf "✓ %-45s -> %-35s -> %s\n" "$source" "$dest" "$status"
      ((passed++))
    else
      printf "✗ %-45s -> %-35s -> %s (WRONG STATUS!)\n" "$source" "$dest" "$status"
      ((failed++))
    fi
  else
    printf "✗ %-45s -> NOT FOUND\n" "$source"
    ((failed++))
  fi
done

echo ""
echo "Results: $passed passed, $failed failed"
echo ""

# Verify all 244 WordPress sources are covered
echo "=== WORDPRESS SOURCE COVERAGE ==="
echo ""

cat > /tmp/wp_sources.txt << 'SOURCES'
/listing
/marketing-agency-hozio-reviews
/pricing
/login
/home
/ai
/product/appbuilder-lifetime-deal-whitelabel-appsumo
/contact-us
/how-to-publish-on-ios
/product/ltd-appbuilder-basic
/problem
/download
/product/done-for-you-app-publishing
/support
/product/gappsy-ai-ltd-tier-1
/marketing-agency-brand-x-ads-reviews
/product/appbuilder-lifetime-deal-whitelabel2-appsumo
/author/bartu-cavusoglu
/marketing-agency-pbhs-reviews
/marketing-agency-furman-roth-advertising-reviews
/ltd-2
/about-us
/documentation-pushnotifications
/shop-2
/privacy-policy
/documentation-videos
/reset-password
/marketing-agency-daniel-james-consulting-reviews
/how-to-publish-on-android
/ltd
/affiliate-program
/email
/product/lifetimedeal-lifetime-updates-support
/marketing-agency-webnbeyond-reviews
/drag-and-drop-app-builder
/how-to-publish-your-app
/dashboard
/claim-agency
/marketing-agency-web-rocket-media-reviews
/product/second-mobile-app
/marketing-agency-multivisiondigital-review
/marketing-agency-justinjenkinsdesigns-review
/marketing-agency-fourthree-media-review
/car-dealerships-in-california-united-states
/marketing-agency-corunit-reviews
/agency
/marketing-agency-calta-marketing-review
/product/lifetime-updates-customer-support-gappsy-analytics
/product/reseller-program-6667
/free-trial
/documentation-form
/about-us-2
/product/reseller-program-zonkeepers-210
/documentation-social-wall
/add-listing
/product/1usd-a-day-subscription-1-day-free-trial
/pricing-2
/product/gappsy-partner-program-pay-once
/product/blackfriday-gold-plan
/product/done-for-you-app-creation
/directory/cloudways
/marketing-agency-search-engine-easy-review
/refund
/marketing-agency-unique-models-and-marketing-reviews
/marketing-agency-corbett-pr-review
/marketing-agency-andrea-studios-reviews
/update
/blackfriday
/product/reseller-program-547
/product/appbuilder-lifetime-deal-whitelabel-3-appsumo
/marketing-agency-kind-marketing-reviews
/documentation-radio
/documentation-qr-code-scan
/software
/product/top-25-agency-listing-2000-9-months
/product/first-payment-1313
/listing-marketing-agency-plans
/molti-showcase
/roadmap
/listed-your-agency-nj
/product/gappsy-partner-program-pay-yearly-50
/product/help-you-out-listing
/blog
/m
/product/gappsy-ai-lifetime-deal-tier-5
/marketing-agency-foley-marketing-advisors-reviews
/marketing-agency-amzingppc-reviews
/product/gappsy-appbuilder-paid-yearly
/marketing-agency-rockcandymedia-review
/documentation-admob
/marketing-agency-enchantment-marketing-review
/marketing-agency-merola-design-reviews
/marketing-agency-the-vyater-group-reviews
/marketing-agency-reach-marketing-reviews
/marketing-agency-datariven-reviews
/marketing-agency-promoteyourwebsite-review
/marketing-agency-sir-speedy-reviews
/article-1
/documentation-google-maps-api
/product/testfreetrialsetup
/marketing-agency-saluk-and-co-reviews
/product/vetlink
/product/resellerprogram2100
/appsumo
/documentation-contact
/documentation-scratch-card
/project
/services
/product/gappsy-suite-monthly-special
/marketing-agency-marketingtechonline-reviews
/product/basic-listing-plan
/product/gappsy-analytics-lifetime-deal-basic
/documentation-audio
/documentation-padlock
/product/christopher-laverack-reseller-copy
/product/appbuilder-lifetime-deal-whitelabel-4-appsumo
/product/orion-tiatia
/terms-of-service
/product/openweb-business-apps-whitelabel-agency-first-payment-2
/search-home
/product/openweb
/marketing-agency-mllgd-reviews
/elements/team-card
/partner
/product/leonard-tomacelli
/documentation-custom-page
/product/review-page
/product/christopherlaverack
/product/dean-snaith-25-apps
/product/top-25-agency-listing-1687-3-months
/product/reseller-program-500
/product/proof-lifetime-deal-basic
/product/26-50-listing
/product/reseller-program-131
/documentation-commerce
/product/lock-in-current-early-bird-pricing-get-free-access-to-new-apps-when-we-add-them-to-the-gappsy-suite
/product/gappsy-ai-lifetime-deal-tier-5-second
/shop-homepage
/project_category/logo-design
/documentation-wordpress
/documentation-pages
/documentation-custom-css
/documentation-stripe
/product/reseller-program-zonkeepers-397
/product/dfy-pub-special-1
/giveaway
/marketing-agency-datakey-consulting-reviews
/product/listing-gybmarketinggroup
/careers
/elements/card-designs
/product/dfy-pub-michael
/documentation-paypal
/product/zonkeepers-247
/documentation-in-app-messages
/order-confirmation
/product/add-url-to-gappsy-listing-refer-clients-to-site-split
/documentation-loyalty-card
/unsubscribe
/product/dfy-app-creation
/directory/gappsy-appbuilder
/documentation-twitter
/header-designs-2
/product/marcus-green
/elements/testimonial-designs
/product/chris1
/product/extra-ltd-gappsy-proof
/product/listing-payment-split-628
/product/11-20-listing
/product/2-month-ad-placement-above-top-25-page
/neque-egestas-congue-quisque-egestas-diam-in
/product/gappsy-appbuilder-paid-monthly
/product/add-url-to-gappsy-listing-refer-clients-to-site
/product/directory-listing
/faq
/hiring
/product/reseller-program-zonkeepers-997
/product/gappsy-proof-paid-yearly
/cart
/product/done-for-you-app-publishing-bonus-extra
/product/gappsy-analytics-lifetime-deal-pro
/product/whitelabel-750
/blog-advanced
/elementor-10085
/claim-proceed
/product/gappsy-email-paid-monthly
/product/openweb-business-apps-whitelabel-agency-payment-1000
/product/first-payment-of-2000-reseller
/product/appbuilder-business-plan-lifetime-updates-support
/product/appbuilder-lifetime-deal-advanced-appsumo
/product/2-app-repub
/8-reasons-why
/product/gappsy-proof-lifetime-deal-pro
/product/dfy-pub-deal-now
/single-category/nocode
/coming-soon
/product/whitelabel-new
/product/reseller-program-305
/8-reasons-why-your-business-needs-a-mobile-app
/sollicitudin-ac-orci-phasellus-egestas
/elements/service-boxes
/demovideo
/product/gappsy-proof-paid-monthly
/single-location
/bezpieczenstwo-i-ochrona-platnosci-blik-w-kasynach-online
/product/extra-lifetime-deal-gappsy-analytics-business
/single-category/nocode
/project/shoe-repairer
/product/dfy-pub-new
/product/dfy-creation-special
/documentation-woocommerce
/portfolio
/product/gappsy-ai-lifetime-deal-tier-0
/elements/portfolio-modules
/list-your-agency
/product/1-time-payment-750-1of2
/product/gappsy-proof-lifetime-deal-business-upgrade
/product/gappsy-proof-lifetime-deal-business
/product/place-1-till-5-split
/product/search-engine-optimization-report
/project_category/web-design
/all-listings
/elements/pricing-tables
/author/bartu-cavusoglu/page/2
/single-category
/volutpat-commodo-sed-egestas-egestas-fringilla-phasellus
/elements/tab-designs
/marketing-agency-content-studio-ny-reviews
/product/lifetime-updates-customer-support-gappsy-gappsy-ai
/shop-2
/top-marketing-agencies-in-arizona-usa
/product/deepak-pub-deal-473
/product/gappsy-partner-program-yearly
/marketing-agency-digitas-reviews
/marketing-agency-one-21-productions-reviews
/product/whitelabel-new-deal
/elements
/product/whitelabel-212
/product/gappsy-email-paid-yearly
/product/upgrade-to-gappsy-appbuilder-business-ltd
/product/dfy-katie
/product/dfy-pub-david
/product/blackfriday-gold-plan-extra
/product/deal-1-special
/product/dfy-pub-creation
/refund/61
/dictum-fusce-ut-placerat-orci-nulla-pellentesque
SOURCES

grep "^/" public/_redirects | awk '{print $1}' | sort -u > /tmp/redirects_sources.txt
sort -u /tmp/wp_sources.txt > /tmp/wp_sources_sorted.txt

missing=$(comm -23 /tmp/wp_sources_sorted.txt /tmp/redirects_sources.txt | wc -l)
covered=$(comm -12 /tmp/wp_sources_sorted.txt /tmp/redirects_sources.txt | wc -l)

echo "WordPress sources covered: $covered/244"
echo "WordPress sources missing: $missing"

if [ "$missing" -eq 0 ]; then
  echo ""
  echo "✓ ALL WORDPRESS SOURCES COVERED - READY FOR DEPLOY"
else
  echo ""
  echo "✗ MISSING SOURCES:"
  comm -23 /tmp/wp_sources_sorted.txt /tmp/redirects_sources.txt
fi
