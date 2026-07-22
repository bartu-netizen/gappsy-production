#!/usr/bin/env python3
"""Fetch grounding facts for a list of tool IDs, for use as comparison-content
research-agent input. Usage:
  python3 scripts/comparisons/fetch_facts.py <ids_file> <output_json>
<ids_file>: one tool UUID per line.
"""
import json
import re
import subprocess
import sys
import tempfile

TAG_ID_TO_SLUG = {
    'c296bd6a-c865-41d7-8807-5dce653dd3f5': 'ai',
    '87a92d11-ee13-4164-9910-61410254388a': 'no-code',
    '96595ec7-e449-4fd5-803d-e73ba922c0ca': 'api',
    '4137e3dc-5b54-4d6a-adfa-85ce8104e38f': 'web-app',
    '5e4d4807-cae2-410c-9e7a-df0798a917cb': 'ios',
    '7336153f-a26b-491c-b927-faf4f5a8d103': 'android',
    'f24fb236-dfcf-452c-9b9e-02926f4383d9': 'mac',
    '381992fc-7997-449c-9c68-511f0dce4b99': 'windows',
    'd5f794d8-1509-49c9-ac15-6834dce260e9': 'freemium',
    '610c2598-d057-4727-bf3b-e907b0daed7f': 'free-trial',
    '326f20ae-646d-484a-96b8-335f75262ea9': 'free-plan',
    'ee5576d4-5994-49f9-84c2-c9a84cc884f6': 'templates',
}

ids_file, out_path = sys.argv[1], sys.argv[2]
ids = [l.strip() for l in open(ids_file) if l.strip()]
quoted_ids = ",".join(f"'{i}'" for i in ids)

sql = f"""
SELECT
  t.id, t.slug, t.name, t.short_description, t.pricing_model, t.starting_price,
  t.founded_year, t.headquarters,
  COALESCE((SELECT json_agg(json_build_object('title', f.title, 'description', f.description) ORDER BY f.sort_order) FROM tool_features f WHERE f.tool_id = t.id), '[]'::json) AS features,
  COALESCE((SELECT json_agg(p.text ORDER BY p.sort_order) FROM tool_pros p WHERE p.tool_id = t.id), '[]'::json) AS pros,
  COALESCE((SELECT json_agg(c.text ORDER BY c.sort_order) FROM tool_cons c WHERE c.tool_id = t.id), '[]'::json) AS cons,
  COALESCE((SELECT json_agg(json_build_object('question', fq.question, 'answer', fq.answer) ORDER BY fq.sort_order) FROM tool_faqs fq WHERE fq.tool_id = t.id), '[]'::json) AS faqs,
  COALESCE((SELECT json_agg(json_build_object('plan_name', pp.plan_name, 'price', pp.price, 'billing_cycle', pp.billing_cycle, 'features', pp.features) ORDER BY pp.sort_order) FROM tool_pricing_plans pp WHERE pp.tool_id = t.id), '[]'::json) AS pricing_plans,
  COALESCE((SELECT json_agg(tl.tag_id) FROM tool_tag_links tl WHERE tl.tool_id = t.id), '[]'::json) AS tag_ids
FROM tools t
WHERE t.id IN ({quoted_ids});
"""

with tempfile.NamedTemporaryFile(mode='w', suffix='.sql', delete=False) as f:
    f.write(sql)
    sql_path = f.name

result = subprocess.run(
    ["npx", "supabase", "db", "query", "--linked", "--file", sql_path],
    cwd="/Users/bartucavusoglu/Desktop/gappsy-production",
    capture_output=True, text=True,
)
text = result.stdout + result.stderr
m = re.search(r'\{.*"rows".*\}', text, re.DOTALL)
if not m:
    print("FAILED TO PARSE RESULT:")
    print(text[:2000])
    sys.exit(1)
data = json.loads(m.group(0))
rows = data['rows']

facts = {}
for r in rows:
    tags = [TAG_ID_TO_SLUG.get(tid, tid) for tid in (r.get('tag_ids') or [])]
    facts[r['slug']] = {
        'name': r['name'],
        'slug': r['slug'],
        'short_description': r['short_description'],
        'pricing_model': r['pricing_model'],
        'starting_price': r['starting_price'],
        'founded_year': r['founded_year'],
        'headquarters': r['headquarters'],
        'features': r['features'],
        'pros': r['pros'],
        'cons': r['cons'],
        'faqs': r['faqs'],
        'pricing_plans': r['pricing_plans'],
        'tags': tags,
    }

with open(out_path, 'w') as f:
    json.dump(facts, f, indent=2, ensure_ascii=False)
print(f"Wrote {out_path} ({len(facts)} tools)")
