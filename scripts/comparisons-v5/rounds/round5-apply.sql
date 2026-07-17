-- Comparison batch: idempiere-vs-odoo-community, konnectzit-vs-node-red, jane-app-vs-luma-health, litify-vs-nextpoint, recruiterflow-vs-seekout, sharpcloud-vs-stonly, aha-vs-nolt, lucky-orange-vs-quantum-metric, m3ter-vs-subskribe, healthchecks-vs-uptime-kuma, hetrixtools-vs-uptime-kuma, hetrixtools-vs-zabbix, icinga-vs-zabbix, groundcover-vs-icinga, glitchtip-vs-groundcover, glitchtip-vs-openobserve, hyperdx-vs-openobserve, inngest-vs-mockoon, mockoon-vs-wiremock, bruno-vs-wiremock, bruno-vs-yaak, scalar-vs-yaak, mintlify-vs-scalar, fern-vs-mintlify, bump-sh-vs-fern, bump-sh-vs-redocly, redocly-vs-sphinx, material-for-mkdocs-vs-sphinx, material-for-mkdocs-vs-sauce-labs, sauce-labs-vs-testingbot, withknown-vs-writefreely, super-productivity-vs-taskwarrior, siyuan-vs-super-productivity, siyuan-vs-trilium-notes, joplin-vs-trilium-notes, joplin-vs-standard-notes, notesnook-vs-standard-notes, memos-vs-notesnook, memos-vs-silverbullet, obsidian-vs-silverbullet, documize-vs-hedgedoc, 15five-vs-frappe-hr, 15five-vs-culture-amp, culture-amp-vs-officevibe, kudos-vs-officevibe, assembly-employee-recognition-vs-kudos, assembly-employee-recognition-vs-awardco, awardco-vs-forma-benefits, forma-benefits-vs-pave, figures-vs-pave, compa-vs-figures, charthop-vs-compa, charthop-vs-orgvue, crowdsec-vs-wazuh, security-onion-vs-wazuh, security-onion-vs-trivy, syft-vs-trivy, greenbone-vs-syft, greenbone-vs-mend-io, mend-io-vs-veracode, trufflehog-vs-veracode, 1password-secrets-automation-vs-trufflehog, 1password-secrets-automation-vs-keeweb, keeweb-vs-zitadel, keycloak-vs-zitadel, keycloak-vs-ory, cerbos-vs-ory, cerbos-vs-permit-io, openfga-vs-permit-io, openfga-vs-stytch, corbado-vs-stytch, corbado-vs-slashid, scalekit-vs-slashid, mattermost-vs-rocket-chat, rocket-chat-vs-zulip, element-vs-zulip, element-vs-nextcloud-talk, nextcloud-talk-vs-synapse, goldcast-vs-pretalx, baserow-vs-nocodb
-- Publishes 80 comparison page(s) with editorial content.

-- ── iDempiere vs Odoo Community (idempiere-vs-odoo-community) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', 'e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$idempiere-vs-odoo-community$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$vs Odoo Community$q$, $q$/compare/idempiere-vs-odoo-community$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0' AND href = $q$/compare/idempiere-vs-odoo-community$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$vs iDempiere$q$, $q$/compare/idempiere-vs-odoo-community$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a' AND href = $q$/compare/idempiere-vs-odoo-community$q$);

-- ── KonnectzIT vs Node-RED (konnectzit-vs-node-red) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', 'b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$konnectzit-vs-node-red$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26b90793-47fc-44e2-b4ed-aaab363f429f', $q$vs Node-RED$q$, $q$/compare/konnectzit-vs-node-red$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26b90793-47fc-44e2-b4ed-aaab363f429f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26b90793-47fc-44e2-b4ed-aaab363f429f' AND href = $q$/compare/konnectzit-vs-node-red$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$vs KonnectzIT$q$, $q$/compare/konnectzit-vs-node-red$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f' AND href = $q$/compare/konnectzit-vs-node-red$q$);

-- ── Jane App vs Luma Health (jane-app-vs-luma-health) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$jane-app-vs-luma-health$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e495d174-9d89-4a75-aaca-d48d89a2581f', $q$vs Luma Health$q$, $q$/compare/jane-app-vs-luma-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e495d174-9d89-4a75-aaca-d48d89a2581f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e495d174-9d89-4a75-aaca-d48d89a2581f' AND href = $q$/compare/jane-app-vs-luma-health$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$vs Jane App$q$, $q$/compare/jane-app-vs-luma-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df' AND href = $q$/compare/jane-app-vs-luma-health$q$);

-- ── Litify vs Nextpoint (litify-vs-nextpoint) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', '5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$litify-vs-nextpoint$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc263e36-ce97-42d4-be53-04c312ae1484', $q$vs Nextpoint$q$, $q$/compare/litify-vs-nextpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc263e36-ce97-42d4-be53-04c312ae1484'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc263e36-ce97-42d4-be53-04c312ae1484' AND href = $q$/compare/litify-vs-nextpoint$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$vs Litify$q$, $q$/compare/litify-vs-nextpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392' AND href = $q$/compare/litify-vs-nextpoint$q$);

-- ── Recruiterflow vs SeekOut (recruiterflow-vs-seekout) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$recruiterflow-vs-seekout$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$vs SeekOut$q$, $q$/compare/recruiterflow-vs-seekout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576' AND href = $q$/compare/recruiterflow-vs-seekout$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$vs Recruiterflow$q$, $q$/compare/recruiterflow-vs-seekout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1' AND href = $q$/compare/recruiterflow-vs-seekout$q$);

-- ── SharpCloud vs Stonly (sharpcloud-vs-stonly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', '28d621bc-8148-478e-91f4-93954281f173', $q$sharpcloud-vs-stonly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$vs Stonly$q$, $q$/compare/sharpcloud-vs-stonly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc' AND href = $q$/compare/sharpcloud-vs-stonly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28d621bc-8148-478e-91f4-93954281f173', $q$vs SharpCloud$q$, $q$/compare/sharpcloud-vs-stonly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28d621bc-8148-478e-91f4-93954281f173'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28d621bc-8148-478e-91f4-93954281f173' AND href = $q$/compare/sharpcloud-vs-stonly$q$);

-- ── Aha! vs Nolt (aha-vs-nolt) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '464182df-a73e-41ff-88d0-d38b16891925', $q$aha-vs-nolt$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1d3b022c-eecd-4869-9efc-0b614824aa91', $q$vs Nolt$q$, $q$/compare/aha-vs-nolt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91' AND href = $q$/compare/aha-vs-nolt$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '464182df-a73e-41ff-88d0-d38b16891925', $q$vs Aha!$q$, $q$/compare/aha-vs-nolt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '464182df-a73e-41ff-88d0-d38b16891925'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '464182df-a73e-41ff-88d0-d38b16891925' AND href = $q$/compare/aha-vs-nolt$q$);

-- ── Lucky Orange vs Quantum Metric (lucky-orange-vs-quantum-metric) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', '546750c3-813f-430c-a551-e76c5f6484f1', $q$lucky-orange-vs-quantum-metric$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$vs Quantum Metric$q$, $q$/compare/lucky-orange-vs-quantum-metric$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa' AND href = $q$/compare/lucky-orange-vs-quantum-metric$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '546750c3-813f-430c-a551-e76c5f6484f1', $q$vs Lucky Orange$q$, $q$/compare/lucky-orange-vs-quantum-metric$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '546750c3-813f-430c-a551-e76c5f6484f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '546750c3-813f-430c-a551-e76c5f6484f1' AND href = $q$/compare/lucky-orange-vs-quantum-metric$q$);

-- ── m3ter vs Subskribe (m3ter-vs-subskribe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', 'b0a76343-e065-4813-8f8c-fb490cece33b', $q$m3ter-vs-subskribe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$vs Subskribe$q$, $q$/compare/m3ter-vs-subskribe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263' AND href = $q$/compare/m3ter-vs-subskribe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0a76343-e065-4813-8f8c-fb490cece33b', $q$vs m3ter$q$, $q$/compare/m3ter-vs-subskribe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b' AND href = $q$/compare/m3ter-vs-subskribe$q$);

-- ── healthchecks vs Uptime Kuma (healthchecks-vs-uptime-kuma) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('24aa6862-35d5-4811-b145-17e35cd64036', '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$healthchecks-vs-uptime-kuma$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24aa6862-35d5-4811-b145-17e35cd64036', $q$vs Uptime Kuma$q$, $q$/compare/healthchecks-vs-uptime-kuma$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24aa6862-35d5-4811-b145-17e35cd64036'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24aa6862-35d5-4811-b145-17e35cd64036' AND href = $q$/compare/healthchecks-vs-uptime-kuma$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$vs healthchecks$q$, $q$/compare/healthchecks-vs-uptime-kuma$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96' AND href = $q$/compare/healthchecks-vs-uptime-kuma$q$);

-- ── HetrixTools vs Uptime Kuma (hetrixtools-vs-uptime-kuma) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$hetrixtools-vs-uptime-kuma$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c7aa89c-3f60-4564-b444-ec64000a8454', $q$vs Uptime Kuma$q$, $q$/compare/hetrixtools-vs-uptime-kuma$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c7aa89c-3f60-4564-b444-ec64000a8454'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c7aa89c-3f60-4564-b444-ec64000a8454' AND href = $q$/compare/hetrixtools-vs-uptime-kuma$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$vs HetrixTools$q$, $q$/compare/hetrixtools-vs-uptime-kuma$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96' AND href = $q$/compare/hetrixtools-vs-uptime-kuma$q$);

-- ── HetrixTools vs Zabbix (hetrixtools-vs-zabbix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', '59226ced-c95a-4575-8fdf-25651ad806d1', $q$hetrixtools-vs-zabbix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c7aa89c-3f60-4564-b444-ec64000a8454', $q$vs Zabbix$q$, $q$/compare/hetrixtools-vs-zabbix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c7aa89c-3f60-4564-b444-ec64000a8454'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c7aa89c-3f60-4564-b444-ec64000a8454' AND href = $q$/compare/hetrixtools-vs-zabbix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '59226ced-c95a-4575-8fdf-25651ad806d1', $q$vs HetrixTools$q$, $q$/compare/hetrixtools-vs-zabbix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '59226ced-c95a-4575-8fdf-25651ad806d1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '59226ced-c95a-4575-8fdf-25651ad806d1' AND href = $q$/compare/hetrixtools-vs-zabbix$q$);

-- ── Icinga vs Zabbix (icinga-vs-zabbix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', '59226ced-c95a-4575-8fdf-25651ad806d1', $q$icinga-vs-zabbix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$vs Zabbix$q$, $q$/compare/icinga-vs-zabbix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '263f6e12-dfc9-4797-a1fe-95f4616f1475'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '263f6e12-dfc9-4797-a1fe-95f4616f1475' AND href = $q$/compare/icinga-vs-zabbix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '59226ced-c95a-4575-8fdf-25651ad806d1', $q$vs Icinga$q$, $q$/compare/icinga-vs-zabbix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '59226ced-c95a-4575-8fdf-25651ad806d1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '59226ced-c95a-4575-8fdf-25651ad806d1' AND href = $q$/compare/icinga-vs-zabbix$q$);

-- ── Groundcover vs Icinga (groundcover-vs-icinga) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', '263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$groundcover-vs-icinga$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$vs Icinga$q$, $q$/compare/groundcover-vs-icinga$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af' AND href = $q$/compare/groundcover-vs-icinga$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$vs Groundcover$q$, $q$/compare/groundcover-vs-icinga$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '263f6e12-dfc9-4797-a1fe-95f4616f1475'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '263f6e12-dfc9-4797-a1fe-95f4616f1475' AND href = $q$/compare/groundcover-vs-icinga$q$);

-- ── GlitchTip vs Groundcover (glitchtip-vs-groundcover) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$glitchtip-vs-groundcover$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$vs Groundcover$q$, $q$/compare/glitchtip-vs-groundcover$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b' AND href = $q$/compare/glitchtip-vs-groundcover$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$vs GlitchTip$q$, $q$/compare/glitchtip-vs-groundcover$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af' AND href = $q$/compare/glitchtip-vs-groundcover$q$);

-- ── GlitchTip vs OpenObserve (glitchtip-vs-openobserve) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '22369d03-3beb-4c3b-bad9-983dd3069db4', $q$glitchtip-vs-openobserve$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$vs OpenObserve$q$, $q$/compare/glitchtip-vs-openobserve$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b' AND href = $q$/compare/glitchtip-vs-openobserve$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22369d03-3beb-4c3b-bad9-983dd3069db4', $q$vs GlitchTip$q$, $q$/compare/glitchtip-vs-openobserve$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22369d03-3beb-4c3b-bad9-983dd3069db4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22369d03-3beb-4c3b-bad9-983dd3069db4' AND href = $q$/compare/glitchtip-vs-openobserve$q$);

-- ── HyperDX vs OpenObserve (hyperdx-vs-openobserve) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '22369d03-3beb-4c3b-bad9-983dd3069db4', $q$hyperdx-vs-openobserve$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd0fed099-679d-4702-a509-fbb8a5115476', $q$vs OpenObserve$q$, $q$/compare/hyperdx-vs-openobserve$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd0fed099-679d-4702-a509-fbb8a5115476'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd0fed099-679d-4702-a509-fbb8a5115476' AND href = $q$/compare/hyperdx-vs-openobserve$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22369d03-3beb-4c3b-bad9-983dd3069db4', $q$vs HyperDX$q$, $q$/compare/hyperdx-vs-openobserve$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22369d03-3beb-4c3b-bad9-983dd3069db4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22369d03-3beb-4c3b-bad9-983dd3069db4' AND href = $q$/compare/hyperdx-vs-openobserve$q$);

-- ── Inngest vs Mockoon (inngest-vs-mockoon) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', 'd7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$inngest-vs-mockoon$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3acb1b38-990d-4851-be0b-cc32baa33857', $q$vs Mockoon$q$, $q$/compare/inngest-vs-mockoon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3acb1b38-990d-4851-be0b-cc32baa33857'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3acb1b38-990d-4851-be0b-cc32baa33857' AND href = $q$/compare/inngest-vs-mockoon$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$vs Inngest$q$, $q$/compare/inngest-vs-mockoon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b' AND href = $q$/compare/inngest-vs-mockoon$q$);

-- ── Mockoon vs WireMock (mockoon-vs-wiremock) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', 'f7b90709-b508-4388-a295-d5608f207c11', $q$mockoon-vs-wiremock$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$vs WireMock$q$, $q$/compare/mockoon-vs-wiremock$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b' AND href = $q$/compare/mockoon-vs-wiremock$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f7b90709-b508-4388-a295-d5608f207c11', $q$vs Mockoon$q$, $q$/compare/mockoon-vs-wiremock$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f7b90709-b508-4388-a295-d5608f207c11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f7b90709-b508-4388-a295-d5608f207c11' AND href = $q$/compare/mockoon-vs-wiremock$q$);

-- ── Bruno vs WireMock (bruno-vs-wiremock) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', 'f7b90709-b508-4388-a295-d5608f207c11', $q$bruno-vs-wiremock$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$vs WireMock$q$, $q$/compare/bruno-vs-wiremock$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00' AND href = $q$/compare/bruno-vs-wiremock$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f7b90709-b508-4388-a295-d5608f207c11', $q$vs Bruno$q$, $q$/compare/bruno-vs-wiremock$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f7b90709-b508-4388-a295-d5608f207c11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f7b90709-b508-4388-a295-d5608f207c11' AND href = $q$/compare/bruno-vs-wiremock$q$);

-- ── Bruno vs Yaak (bruno-vs-yaak) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', '80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$bruno-vs-yaak$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$vs Yaak$q$, $q$/compare/bruno-vs-yaak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00' AND href = $q$/compare/bruno-vs-yaak$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$vs Bruno$q$, $q$/compare/bruno-vs-yaak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '80059e68-8557-45a3-a76c-b2d0817a3a9c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '80059e68-8557-45a3-a76c-b2d0817a3a9c' AND href = $q$/compare/bruno-vs-yaak$q$);

-- ── Scalar vs Yaak (scalar-vs-yaak) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', '80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$scalar-vs-yaak$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$vs Yaak$q$, $q$/compare/scalar-vs-yaak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab' AND href = $q$/compare/scalar-vs-yaak$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$vs Scalar$q$, $q$/compare/scalar-vs-yaak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '80059e68-8557-45a3-a76c-b2d0817a3a9c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '80059e68-8557-45a3-a76c-b2d0817a3a9c' AND href = $q$/compare/scalar-vs-yaak$q$);

-- ── Mintlify vs Scalar (mintlify-vs-scalar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$mintlify-vs-scalar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$vs Scalar$q$, $q$/compare/mintlify-vs-scalar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0' AND href = $q$/compare/mintlify-vs-scalar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$vs Mintlify$q$, $q$/compare/mintlify-vs-scalar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab' AND href = $q$/compare/mintlify-vs-scalar$q$);

-- ── Fern vs Mintlify (fern-vs-mintlify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', 'f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$fern-vs-mintlify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$vs Mintlify$q$, $q$/compare/fern-vs-mintlify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100' AND href = $q$/compare/fern-vs-mintlify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$vs Fern$q$, $q$/compare/fern-vs-mintlify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0' AND href = $q$/compare/fern-vs-mintlify$q$);

-- ── Bump.sh vs Fern (bump-sh-vs-fern) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', 'b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$bump-sh-vs-fern$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$vs Fern$q$, $q$/compare/bump-sh-vs-fern$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8' AND href = $q$/compare/bump-sh-vs-fern$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$vs Bump.sh$q$, $q$/compare/bump-sh-vs-fern$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100' AND href = $q$/compare/bump-sh-vs-fern$q$);

-- ── Bump.sh vs Redocly (bump-sh-vs-redocly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', '01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$bump-sh-vs-redocly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$vs Redocly$q$, $q$/compare/bump-sh-vs-redocly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8' AND href = $q$/compare/bump-sh-vs-redocly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$vs Bump.sh$q$, $q$/compare/bump-sh-vs-redocly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '01c9cb83-d21b-4761-b79e-7d589ccbad23'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '01c9cb83-d21b-4761-b79e-7d589ccbad23' AND href = $q$/compare/bump-sh-vs-redocly$q$);

-- ── Redocly vs Sphinx (redocly-vs-sphinx) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', 'a5b8e104-a176-4bca-a581-3d1e42859374', $q$redocly-vs-sphinx$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$vs Sphinx$q$, $q$/compare/redocly-vs-sphinx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '01c9cb83-d21b-4761-b79e-7d589ccbad23'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '01c9cb83-d21b-4761-b79e-7d589ccbad23' AND href = $q$/compare/redocly-vs-sphinx$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5b8e104-a176-4bca-a581-3d1e42859374', $q$vs Redocly$q$, $q$/compare/redocly-vs-sphinx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374' AND href = $q$/compare/redocly-vs-sphinx$q$);

-- ── Material for MkDocs vs Sphinx (material-for-mkdocs-vs-sphinx) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', 'a5b8e104-a176-4bca-a581-3d1e42859374', $q$material-for-mkdocs-vs-sphinx$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0491910-91ba-45bf-9e66-510a9761281d', $q$vs Sphinx$q$, $q$/compare/material-for-mkdocs-vs-sphinx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0491910-91ba-45bf-9e66-510a9761281d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0491910-91ba-45bf-9e66-510a9761281d' AND href = $q$/compare/material-for-mkdocs-vs-sphinx$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5b8e104-a176-4bca-a581-3d1e42859374', $q$vs Material for MkDocs$q$, $q$/compare/material-for-mkdocs-vs-sphinx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374' AND href = $q$/compare/material-for-mkdocs-vs-sphinx$q$);

-- ── Material for MkDocs vs Sauce Labs (material-for-mkdocs-vs-sauce-labs) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$material-for-mkdocs-vs-sauce-labs$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0491910-91ba-45bf-9e66-510a9761281d', $q$vs Sauce Labs$q$, $q$/compare/material-for-mkdocs-vs-sauce-labs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0491910-91ba-45bf-9e66-510a9761281d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0491910-91ba-45bf-9e66-510a9761281d' AND href = $q$/compare/material-for-mkdocs-vs-sauce-labs$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$vs Material for MkDocs$q$, $q$/compare/material-for-mkdocs-vs-sauce-labs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45' AND href = $q$/compare/material-for-mkdocs-vs-sauce-labs$q$);

-- ── Sauce Labs vs TestingBot (sauce-labs-vs-testingbot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', '1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$sauce-labs-vs-testingbot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$vs TestingBot$q$, $q$/compare/sauce-labs-vs-testingbot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45' AND href = $q$/compare/sauce-labs-vs-testingbot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$vs Sauce Labs$q$, $q$/compare/sauce-labs-vs-testingbot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa' AND href = $q$/compare/sauce-labs-vs-testingbot$q$);

-- ── withknown vs writefreely (withknown-vs-writefreely) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ece3f5b6-3302-4069-a41e-b5e480349b71', '0eeb6217-8a67-456a-8643-6f5a58e0f979', $q$withknown-vs-writefreely$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ece3f5b6-3302-4069-a41e-b5e480349b71', $q$vs writefreely$q$, $q$/compare/withknown-vs-writefreely$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ece3f5b6-3302-4069-a41e-b5e480349b71'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ece3f5b6-3302-4069-a41e-b5e480349b71' AND href = $q$/compare/withknown-vs-writefreely$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0eeb6217-8a67-456a-8643-6f5a58e0f979', $q$vs withknown$q$, $q$/compare/withknown-vs-writefreely$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0eeb6217-8a67-456a-8643-6f5a58e0f979'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0eeb6217-8a67-456a-8643-6f5a58e0f979' AND href = $q$/compare/withknown-vs-writefreely$q$);

-- ── Super Productivity vs Taskwarrior (super-productivity-vs-taskwarrior) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$super-productivity-vs-taskwarrior$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$vs Taskwarrior$q$, $q$/compare/super-productivity-vs-taskwarrior$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a' AND href = $q$/compare/super-productivity-vs-taskwarrior$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$vs Super Productivity$q$, $q$/compare/super-productivity-vs-taskwarrior$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884' AND href = $q$/compare/super-productivity-vs-taskwarrior$q$);

-- ── SiYuan vs Super Productivity (siyuan-vs-super-productivity) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$siyuan-vs-super-productivity$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fc868bfd-fdf4-4187-9d7e-b719006af946', $q$vs Super Productivity$q$, $q$/compare/siyuan-vs-super-productivity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fc868bfd-fdf4-4187-9d7e-b719006af946'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fc868bfd-fdf4-4187-9d7e-b719006af946' AND href = $q$/compare/siyuan-vs-super-productivity$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$vs SiYuan$q$, $q$/compare/siyuan-vs-super-productivity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a' AND href = $q$/compare/siyuan-vs-super-productivity$q$);

-- ── SiYuan vs Trilium Notes (siyuan-vs-trilium-notes) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '8a1e8900-232b-487e-a707-161bf160047b', $q$siyuan-vs-trilium-notes$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fc868bfd-fdf4-4187-9d7e-b719006af946', $q$vs Trilium Notes$q$, $q$/compare/siyuan-vs-trilium-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fc868bfd-fdf4-4187-9d7e-b719006af946'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fc868bfd-fdf4-4187-9d7e-b719006af946' AND href = $q$/compare/siyuan-vs-trilium-notes$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a1e8900-232b-487e-a707-161bf160047b', $q$vs SiYuan$q$, $q$/compare/siyuan-vs-trilium-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a1e8900-232b-487e-a707-161bf160047b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a1e8900-232b-487e-a707-161bf160047b' AND href = $q$/compare/siyuan-vs-trilium-notes$q$);

-- ── Joplin vs Trilium Notes (joplin-vs-trilium-notes) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '8a1e8900-232b-487e-a707-161bf160047b', $q$joplin-vs-trilium-notes$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$vs Trilium Notes$q$, $q$/compare/joplin-vs-trilium-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762' AND href = $q$/compare/joplin-vs-trilium-notes$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a1e8900-232b-487e-a707-161bf160047b', $q$vs Joplin$q$, $q$/compare/joplin-vs-trilium-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a1e8900-232b-487e-a707-161bf160047b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a1e8900-232b-487e-a707-161bf160047b' AND href = $q$/compare/joplin-vs-trilium-notes$q$);

-- ── Joplin vs Standard Notes (joplin-vs-standard-notes) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$joplin-vs-standard-notes$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$vs Standard Notes$q$, $q$/compare/joplin-vs-standard-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762' AND href = $q$/compare/joplin-vs-standard-notes$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$vs Joplin$q$, $q$/compare/joplin-vs-standard-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2' AND href = $q$/compare/joplin-vs-standard-notes$q$);

-- ── Notesnook vs Standard Notes (notesnook-vs-standard-notes) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$notesnook-vs-standard-notes$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$vs Standard Notes$q$, $q$/compare/notesnook-vs-standard-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce' AND href = $q$/compare/notesnook-vs-standard-notes$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$vs Notesnook$q$, $q$/compare/notesnook-vs-standard-notes$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2' AND href = $q$/compare/notesnook-vs-standard-notes$q$);

-- ── Memos vs Notesnook (memos-vs-notesnook) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$memos-vs-notesnook$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$vs Notesnook$q$, $q$/compare/memos-vs-notesnook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745' AND href = $q$/compare/memos-vs-notesnook$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$vs Memos$q$, $q$/compare/memos-vs-notesnook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce' AND href = $q$/compare/memos-vs-notesnook$q$);

-- ── Memos vs SilverBullet (memos-vs-silverbullet) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$memos-vs-silverbullet$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$vs SilverBullet$q$, $q$/compare/memos-vs-silverbullet$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745' AND href = $q$/compare/memos-vs-silverbullet$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$vs Memos$q$, $q$/compare/memos-vs-silverbullet$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b' AND href = $q$/compare/memos-vs-silverbullet$q$);

-- ── Obsidian vs SilverBullet (obsidian-vs-silverbullet) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$obsidian-vs-silverbullet$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$vs SilverBullet$q$, $q$/compare/obsidian-vs-silverbullet$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c' AND href = $q$/compare/obsidian-vs-silverbullet$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$vs Obsidian$q$, $q$/compare/obsidian-vs-silverbullet$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b' AND href = $q$/compare/obsidian-vs-silverbullet$q$);

-- ── Documize vs HedgeDoc (documize-vs-hedgedoc) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', '6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$documize-vs-hedgedoc$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc626839-0d04-4df9-9c03-63658e2f415a', $q$vs HedgeDoc$q$, $q$/compare/documize-vs-hedgedoc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a' AND href = $q$/compare/documize-vs-hedgedoc$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$vs Documize$q$, $q$/compare/documize-vs-hedgedoc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565' AND href = $q$/compare/documize-vs-hedgedoc$q$);

-- ── 15Five vs Frappe HR (15five-vs-frappe-hr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$15five-vs-frappe-hr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$vs Frappe HR$q$, $q$/compare/15five-vs-frappe-hr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2' AND href = $q$/compare/15five-vs-frappe-hr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$vs 15Five$q$, $q$/compare/15five-vs-frappe-hr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0' AND href = $q$/compare/15five-vs-frappe-hr$q$);

-- ── 15Five vs Culture Amp (15five-vs-culture-amp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$15five-vs-culture-amp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$vs Culture Amp$q$, $q$/compare/15five-vs-culture-amp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2' AND href = $q$/compare/15five-vs-culture-amp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$vs 15Five$q$, $q$/compare/15five-vs-culture-amp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8260c82f-10fa-4ece-b662-6c99bd5967eb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8260c82f-10fa-4ece-b662-6c99bd5967eb' AND href = $q$/compare/15five-vs-culture-amp$q$);

-- ── Culture Amp vs Officevibe (culture-amp-vs-officevibe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', 'a31391fe-79aa-479e-ad05-f7def34d36ee', $q$culture-amp-vs-officevibe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$vs Officevibe$q$, $q$/compare/culture-amp-vs-officevibe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8260c82f-10fa-4ece-b662-6c99bd5967eb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8260c82f-10fa-4ece-b662-6c99bd5967eb' AND href = $q$/compare/culture-amp-vs-officevibe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a31391fe-79aa-479e-ad05-f7def34d36ee', $q$vs Culture Amp$q$, $q$/compare/culture-amp-vs-officevibe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a31391fe-79aa-479e-ad05-f7def34d36ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a31391fe-79aa-479e-ad05-f7def34d36ee' AND href = $q$/compare/culture-amp-vs-officevibe$q$);

-- ── Kudos vs Officevibe (kudos-vs-officevibe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', 'a31391fe-79aa-479e-ad05-f7def34d36ee', $q$kudos-vs-officevibe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$vs Officevibe$q$, $q$/compare/kudos-vs-officevibe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c' AND href = $q$/compare/kudos-vs-officevibe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a31391fe-79aa-479e-ad05-f7def34d36ee', $q$vs Kudos$q$, $q$/compare/kudos-vs-officevibe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a31391fe-79aa-479e-ad05-f7def34d36ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a31391fe-79aa-479e-ad05-f7def34d36ee' AND href = $q$/compare/kudos-vs-officevibe$q$);

-- ── Assembly Employee Recognition vs Kudos (assembly-employee-recognition-vs-kudos) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', '45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$assembly-employee-recognition-vs-kudos$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b80f26c5-559d-4dd6-a520-9913d10938f6', $q$vs Kudos$q$, $q$/compare/assembly-employee-recognition-vs-kudos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6' AND href = $q$/compare/assembly-employee-recognition-vs-kudos$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$vs Assembly Employee Recognition$q$, $q$/compare/assembly-employee-recognition-vs-kudos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c' AND href = $q$/compare/assembly-employee-recognition-vs-kudos$q$);

-- ── Assembly Employee Recognition vs Awardco (assembly-employee-recognition-vs-awardco) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$assembly-employee-recognition-vs-awardco$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b80f26c5-559d-4dd6-a520-9913d10938f6', $q$vs Awardco$q$, $q$/compare/assembly-employee-recognition-vs-awardco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6' AND href = $q$/compare/assembly-employee-recognition-vs-awardco$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$vs Assembly Employee Recognition$q$, $q$/compare/assembly-employee-recognition-vs-awardco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac' AND href = $q$/compare/assembly-employee-recognition-vs-awardco$q$);

-- ── Awardco vs Forma Benefits (awardco-vs-forma-benefits) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', '558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$awardco-vs-forma-benefits$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$vs Forma Benefits$q$, $q$/compare/awardco-vs-forma-benefits$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac' AND href = $q$/compare/awardco-vs-forma-benefits$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$vs Awardco$q$, $q$/compare/awardco-vs-forma-benefits$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a' AND href = $q$/compare/awardco-vs-forma-benefits$q$);

-- ── Forma Benefits vs Pave (forma-benefits-vs-pave) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', '09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$forma-benefits-vs-pave$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$vs Pave$q$, $q$/compare/forma-benefits-vs-pave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a' AND href = $q$/compare/forma-benefits-vs-pave$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$vs Forma Benefits$q$, $q$/compare/forma-benefits-vs-pave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a' AND href = $q$/compare/forma-benefits-vs-pave$q$);

-- ── Figures vs Pave (figures-vs-pave) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', '09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$figures-vs-pave$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '51568536-b7e1-4391-a01a-fb0353541bf4', $q$vs Pave$q$, $q$/compare/figures-vs-pave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '51568536-b7e1-4391-a01a-fb0353541bf4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '51568536-b7e1-4391-a01a-fb0353541bf4' AND href = $q$/compare/figures-vs-pave$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$vs Figures$q$, $q$/compare/figures-vs-pave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a' AND href = $q$/compare/figures-vs-pave$q$);

-- ── Compa vs Figures (compa-vs-figures) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', '51568536-b7e1-4391-a01a-fb0353541bf4', $q$compa-vs-figures$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$vs Figures$q$, $q$/compare/compa-vs-figures$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e' AND href = $q$/compare/compa-vs-figures$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '51568536-b7e1-4391-a01a-fb0353541bf4', $q$vs Compa$q$, $q$/compare/compa-vs-figures$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '51568536-b7e1-4391-a01a-fb0353541bf4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '51568536-b7e1-4391-a01a-fb0353541bf4' AND href = $q$/compare/compa-vs-figures$q$);

-- ── ChartHop vs Compa (charthop-vs-compa) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$charthop-vs-compa$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$vs Compa$q$, $q$/compare/charthop-vs-compa$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9d53613b-ce48-4bee-a738-96b4bc59bd46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9d53613b-ce48-4bee-a738-96b4bc59bd46' AND href = $q$/compare/charthop-vs-compa$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$vs ChartHop$q$, $q$/compare/charthop-vs-compa$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e' AND href = $q$/compare/charthop-vs-compa$q$);

-- ── ChartHop vs Orgvue (charthop-vs-orgvue) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$charthop-vs-orgvue$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$vs Orgvue$q$, $q$/compare/charthop-vs-orgvue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9d53613b-ce48-4bee-a738-96b4bc59bd46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9d53613b-ce48-4bee-a738-96b4bc59bd46' AND href = $q$/compare/charthop-vs-orgvue$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$vs ChartHop$q$, $q$/compare/charthop-vs-orgvue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f' AND href = $q$/compare/charthop-vs-orgvue$q$);

-- ── CrowdSec vs Wazuh (crowdsec-vs-wazuh) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$crowdsec-vs-wazuh$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '521d7edd-be93-4cc5-b678-97bf55389e62', $q$vs Wazuh$q$, $q$/compare/crowdsec-vs-wazuh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '521d7edd-be93-4cc5-b678-97bf55389e62'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '521d7edd-be93-4cc5-b678-97bf55389e62' AND href = $q$/compare/crowdsec-vs-wazuh$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$vs CrowdSec$q$, $q$/compare/crowdsec-vs-wazuh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50' AND href = $q$/compare/crowdsec-vs-wazuh$q$);

-- ── Security Onion vs Wazuh (security-onion-vs-wazuh) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$security-onion-vs-wazuh$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e225ae3-f536-4753-a9dd-77c8187545ca', $q$vs Wazuh$q$, $q$/compare/security-onion-vs-wazuh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e225ae3-f536-4753-a9dd-77c8187545ca'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e225ae3-f536-4753-a9dd-77c8187545ca' AND href = $q$/compare/security-onion-vs-wazuh$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$vs Security Onion$q$, $q$/compare/security-onion-vs-wazuh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50' AND href = $q$/compare/security-onion-vs-wazuh$q$);

-- ── Security Onion vs Trivy (security-onion-vs-trivy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$security-onion-vs-trivy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e225ae3-f536-4753-a9dd-77c8187545ca', $q$vs Trivy$q$, $q$/compare/security-onion-vs-trivy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e225ae3-f536-4753-a9dd-77c8187545ca'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e225ae3-f536-4753-a9dd-77c8187545ca' AND href = $q$/compare/security-onion-vs-trivy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$vs Security Onion$q$, $q$/compare/security-onion-vs-trivy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d' AND href = $q$/compare/security-onion-vs-trivy$q$);

-- ── Syft vs Trivy (syft-vs-trivy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$syft-vs-trivy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c83d263-30f5-472f-9408-4e9883759bcd', $q$vs Trivy$q$, $q$/compare/syft-vs-trivy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c83d263-30f5-472f-9408-4e9883759bcd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c83d263-30f5-472f-9408-4e9883759bcd' AND href = $q$/compare/syft-vs-trivy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$vs Syft$q$, $q$/compare/syft-vs-trivy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d' AND href = $q$/compare/syft-vs-trivy$q$);

-- ── Greenbone vs Syft (greenbone-vs-syft) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', '8c83d263-30f5-472f-9408-4e9883759bcd', $q$greenbone-vs-syft$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$vs Syft$q$, $q$/compare/greenbone-vs-syft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87' AND href = $q$/compare/greenbone-vs-syft$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c83d263-30f5-472f-9408-4e9883759bcd', $q$vs Greenbone$q$, $q$/compare/greenbone-vs-syft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c83d263-30f5-472f-9408-4e9883759bcd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c83d263-30f5-472f-9408-4e9883759bcd' AND href = $q$/compare/greenbone-vs-syft$q$);

-- ── Greenbone vs Mend.io (greenbone-vs-mend-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', '8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$greenbone-vs-mend-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$vs Mend.io$q$, $q$/compare/greenbone-vs-mend-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87' AND href = $q$/compare/greenbone-vs-mend-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$vs Greenbone$q$, $q$/compare/greenbone-vs-mend-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c102b52-3adb-4485-b65a-2b1065f9aa19'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c102b52-3adb-4485-b65a-2b1065f9aa19' AND href = $q$/compare/greenbone-vs-mend-io$q$);

-- ── Mend.io vs Veracode (mend-io-vs-veracode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', '96409439-bd37-456a-bd67-52a51e831b1e', $q$mend-io-vs-veracode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$vs Veracode$q$, $q$/compare/mend-io-vs-veracode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c102b52-3adb-4485-b65a-2b1065f9aa19'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c102b52-3adb-4485-b65a-2b1065f9aa19' AND href = $q$/compare/mend-io-vs-veracode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '96409439-bd37-456a-bd67-52a51e831b1e', $q$vs Mend.io$q$, $q$/compare/mend-io-vs-veracode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e' AND href = $q$/compare/mend-io-vs-veracode$q$);

-- ── TruffleHog vs Veracode (trufflehog-vs-veracode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', '96409439-bd37-456a-bd67-52a51e831b1e', $q$trufflehog-vs-veracode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$vs Veracode$q$, $q$/compare/trufflehog-vs-veracode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd' AND href = $q$/compare/trufflehog-vs-veracode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '96409439-bd37-456a-bd67-52a51e831b1e', $q$vs TruffleHog$q$, $q$/compare/trufflehog-vs-veracode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e' AND href = $q$/compare/trufflehog-vs-veracode$q$);

-- ── 1Password Secrets Automation vs TruffleHog (1password-secrets-automation-vs-trufflehog) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', 'c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$1password-secrets-automation-vs-trufflehog$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ae78ea6a-31f8-4642-9dd7-797047244d47', $q$vs TruffleHog$q$, $q$/compare/1password-secrets-automation-vs-trufflehog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47' AND href = $q$/compare/1password-secrets-automation-vs-trufflehog$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$vs 1Password Secrets Automation$q$, $q$/compare/1password-secrets-automation-vs-trufflehog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd' AND href = $q$/compare/1password-secrets-automation-vs-trufflehog$q$);

-- ── 1Password Secrets Automation vs KeeWeb (1password-secrets-automation-vs-keeweb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$1password-secrets-automation-vs-keeweb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ae78ea6a-31f8-4642-9dd7-797047244d47', $q$vs KeeWeb$q$, $q$/compare/1password-secrets-automation-vs-keeweb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47' AND href = $q$/compare/1password-secrets-automation-vs-keeweb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$vs 1Password Secrets Automation$q$, $q$/compare/1password-secrets-automation-vs-keeweb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0' AND href = $q$/compare/1password-secrets-automation-vs-keeweb$q$);

-- ── KeeWeb vs Zitadel (keeweb-vs-zitadel) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', '69d914d3-8667-4dc1-83ca-010c75550ec9', $q$keeweb-vs-zitadel$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$vs Zitadel$q$, $q$/compare/keeweb-vs-zitadel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0' AND href = $q$/compare/keeweb-vs-zitadel$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69d914d3-8667-4dc1-83ca-010c75550ec9', $q$vs KeeWeb$q$, $q$/compare/keeweb-vs-zitadel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69d914d3-8667-4dc1-83ca-010c75550ec9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69d914d3-8667-4dc1-83ca-010c75550ec9' AND href = $q$/compare/keeweb-vs-zitadel$q$);

-- ── Keycloak vs Zitadel (keycloak-vs-zitadel) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', '69d914d3-8667-4dc1-83ca-010c75550ec9', $q$keycloak-vs-zitadel$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$vs Zitadel$q$, $q$/compare/keycloak-vs-zitadel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb' AND href = $q$/compare/keycloak-vs-zitadel$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69d914d3-8667-4dc1-83ca-010c75550ec9', $q$vs Keycloak$q$, $q$/compare/keycloak-vs-zitadel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69d914d3-8667-4dc1-83ca-010c75550ec9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69d914d3-8667-4dc1-83ca-010c75550ec9' AND href = $q$/compare/keycloak-vs-zitadel$q$);

-- ── Keycloak vs Ory (keycloak-vs-ory) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', 'f21e8c47-9727-46e1-8769-b1874bae4d03', $q$keycloak-vs-ory$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$vs Ory$q$, $q$/compare/keycloak-vs-ory$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb' AND href = $q$/compare/keycloak-vs-ory$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f21e8c47-9727-46e1-8769-b1874bae4d03', $q$vs Keycloak$q$, $q$/compare/keycloak-vs-ory$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f21e8c47-9727-46e1-8769-b1874bae4d03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f21e8c47-9727-46e1-8769-b1874bae4d03' AND href = $q$/compare/keycloak-vs-ory$q$);

-- ── Cerbos vs Ory (cerbos-vs-ory) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', 'f21e8c47-9727-46e1-8769-b1874bae4d03', $q$cerbos-vs-ory$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '62db09f8-596e-4759-92a2-df735f8464c1', $q$vs Ory$q$, $q$/compare/cerbos-vs-ory$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '62db09f8-596e-4759-92a2-df735f8464c1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '62db09f8-596e-4759-92a2-df735f8464c1' AND href = $q$/compare/cerbos-vs-ory$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f21e8c47-9727-46e1-8769-b1874bae4d03', $q$vs Cerbos$q$, $q$/compare/cerbos-vs-ory$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f21e8c47-9727-46e1-8769-b1874bae4d03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f21e8c47-9727-46e1-8769-b1874bae4d03' AND href = $q$/compare/cerbos-vs-ory$q$);

-- ── Cerbos vs Permit.io (cerbos-vs-permit-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', '7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$cerbos-vs-permit-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '62db09f8-596e-4759-92a2-df735f8464c1', $q$vs Permit.io$q$, $q$/compare/cerbos-vs-permit-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '62db09f8-596e-4759-92a2-df735f8464c1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '62db09f8-596e-4759-92a2-df735f8464c1' AND href = $q$/compare/cerbos-vs-permit-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$vs Cerbos$q$, $q$/compare/cerbos-vs-permit-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d826762-9d50-46fb-93f2-f3db167ecdd7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d826762-9d50-46fb-93f2-f3db167ecdd7' AND href = $q$/compare/cerbos-vs-permit-io$q$);

-- ── OpenFGA vs Permit.io (openfga-vs-permit-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', '7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$openfga-vs-permit-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$vs Permit.io$q$, $q$/compare/openfga-vs-permit-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37' AND href = $q$/compare/openfga-vs-permit-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$vs OpenFGA$q$, $q$/compare/openfga-vs-permit-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d826762-9d50-46fb-93f2-f3db167ecdd7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d826762-9d50-46fb-93f2-f3db167ecdd7' AND href = $q$/compare/openfga-vs-permit-io$q$);

-- ── OpenFGA vs Stytch (openfga-vs-stytch) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$openfga-vs-stytch$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$vs Stytch$q$, $q$/compare/openfga-vs-stytch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37' AND href = $q$/compare/openfga-vs-stytch$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$vs OpenFGA$q$, $q$/compare/openfga-vs-stytch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20' AND href = $q$/compare/openfga-vs-stytch$q$);

-- ── Corbado vs Stytch (corbado-vs-stytch) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$corbado-vs-stytch$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$vs Stytch$q$, $q$/compare/corbado-vs-stytch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '62db571f-582a-43e0-9f5f-3cf4413ae59a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '62db571f-582a-43e0-9f5f-3cf4413ae59a' AND href = $q$/compare/corbado-vs-stytch$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$vs Corbado$q$, $q$/compare/corbado-vs-stytch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20' AND href = $q$/compare/corbado-vs-stytch$q$);

-- ── Corbado vs SlashID (corbado-vs-slashid) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', '6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$corbado-vs-slashid$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$vs SlashID$q$, $q$/compare/corbado-vs-slashid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '62db571f-582a-43e0-9f5f-3cf4413ae59a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '62db571f-582a-43e0-9f5f-3cf4413ae59a' AND href = $q$/compare/corbado-vs-slashid$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$vs Corbado$q$, $q$/compare/corbado-vs-slashid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6d1eff7c-0366-4a72-af49-95cd19369f3b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6d1eff7c-0366-4a72-af49-95cd19369f3b' AND href = $q$/compare/corbado-vs-slashid$q$);

-- ── Scalekit vs SlashID (scalekit-vs-slashid) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', '6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$scalekit-vs-slashid$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f089f3d0-931d-41ab-b83c-765e387a247e', $q$vs SlashID$q$, $q$/compare/scalekit-vs-slashid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f089f3d0-931d-41ab-b83c-765e387a247e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f089f3d0-931d-41ab-b83c-765e387a247e' AND href = $q$/compare/scalekit-vs-slashid$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$vs Scalekit$q$, $q$/compare/scalekit-vs-slashid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6d1eff7c-0366-4a72-af49-95cd19369f3b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6d1eff7c-0366-4a72-af49-95cd19369f3b' AND href = $q$/compare/scalekit-vs-slashid$q$);

-- ── Mattermost vs Rocket.Chat (mattermost-vs-rocket-chat) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$mattermost-vs-rocket-chat$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$vs Rocket.Chat$q$, $q$/compare/mattermost-vs-rocket-chat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d' AND href = $q$/compare/mattermost-vs-rocket-chat$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$vs Mattermost$q$, $q$/compare/mattermost-vs-rocket-chat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '376dca7b-3bc4-46f6-ae09-635baf27d62b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '376dca7b-3bc4-46f6-ae09-635baf27d62b' AND href = $q$/compare/mattermost-vs-rocket-chat$q$);

-- ── Rocket.Chat vs Zulip (rocket-chat-vs-zulip) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', 'c920ff4f-292d-4b70-82c4-92886a22daa0', $q$rocket-chat-vs-zulip$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$vs Zulip$q$, $q$/compare/rocket-chat-vs-zulip$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '376dca7b-3bc4-46f6-ae09-635baf27d62b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '376dca7b-3bc4-46f6-ae09-635baf27d62b' AND href = $q$/compare/rocket-chat-vs-zulip$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c920ff4f-292d-4b70-82c4-92886a22daa0', $q$vs Rocket.Chat$q$, $q$/compare/rocket-chat-vs-zulip$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c920ff4f-292d-4b70-82c4-92886a22daa0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c920ff4f-292d-4b70-82c4-92886a22daa0' AND href = $q$/compare/rocket-chat-vs-zulip$q$);

-- ── Element vs Zulip (element-vs-zulip) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', 'c920ff4f-292d-4b70-82c4-92886a22daa0', $q$element-vs-zulip$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a0ebe08-e4d6-46da-a624-6b276c676577', $q$vs Zulip$q$, $q$/compare/element-vs-zulip$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a0ebe08-e4d6-46da-a624-6b276c676577'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a0ebe08-e4d6-46da-a624-6b276c676577' AND href = $q$/compare/element-vs-zulip$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c920ff4f-292d-4b70-82c4-92886a22daa0', $q$vs Element$q$, $q$/compare/element-vs-zulip$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c920ff4f-292d-4b70-82c4-92886a22daa0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c920ff4f-292d-4b70-82c4-92886a22daa0' AND href = $q$/compare/element-vs-zulip$q$);

-- ── Element vs Nextcloud Talk (element-vs-nextcloud-talk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', '6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$element-vs-nextcloud-talk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a0ebe08-e4d6-46da-a624-6b276c676577', $q$vs Nextcloud Talk$q$, $q$/compare/element-vs-nextcloud-talk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a0ebe08-e4d6-46da-a624-6b276c676577'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a0ebe08-e4d6-46da-a624-6b276c676577' AND href = $q$/compare/element-vs-nextcloud-talk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$vs Element$q$, $q$/compare/element-vs-nextcloud-talk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893' AND href = $q$/compare/element-vs-nextcloud-talk$q$);

-- ── Nextcloud Talk vs Synapse (nextcloud-talk-vs-synapse) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$nextcloud-talk-vs-synapse$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$vs Synapse$q$, $q$/compare/nextcloud-talk-vs-synapse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893' AND href = $q$/compare/nextcloud-talk-vs-synapse$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$vs Nextcloud Talk$q$, $q$/compare/nextcloud-talk-vs-synapse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3' AND href = $q$/compare/nextcloud-talk-vs-synapse$q$);

-- ── Goldcast vs Pretalx (goldcast-vs-pretalx) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$goldcast-vs-pretalx$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$vs Pretalx$q$, $q$/compare/goldcast-vs-pretalx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e' AND href = $q$/compare/goldcast-vs-pretalx$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$vs Goldcast$q$, $q$/compare/goldcast-vs-pretalx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8' AND href = $q$/compare/goldcast-vs-pretalx$q$);

-- ── Baserow vs NocoDB (baserow-vs-nocodb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$baserow-vs-nocodb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$vs NocoDB$q$, $q$/compare/baserow-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e' AND href = $q$/compare/baserow-vs-nocodb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$vs Baserow$q$, $q$/compare/baserow-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112' AND href = $q$/compare/baserow-vs-nocodb$q$);

