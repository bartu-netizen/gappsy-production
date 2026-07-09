# Proof: public/_redirects Cannot Create a Redirect Loop

## Redirect Rules Analysis

### Rules 1-3: Force WWW (lines 8-10)
```
http://gappsy.com/*      → https://www.gappsy.com/:splat  (Rule A)
http://www.gappsy.com/*  → https://www.gappsy.com/:splat  (Rule B)
https://gappsy.com/*     → https://www.gappsy.com/:splat  (Rule C)
```

### Rule 4: Force Trailing Slash (line 13)
```
^/([^.?]+[^/])$ → /$1/  (Rule D)
```

## Loop Impossibility Proof

### Test Case 1: Canonical URL
```
Input: https://www.gappsy.com/page/
```

**Does it match Rule A?** No (not `http://gappsy.com/*`)
**Does it match Rule B?** No (not `http://www.gappsy.com/*`)
**Does it match Rule C?** No (not `https://gappsy.com/*`)
**Does it match Rule D?** No (already has trailing slash)

**Result:** Serves content (200 OK)
**No redirect, no loop possible ✅**

### Test Case 2: Non-WWW with Trailing Slash
```
Input: https://gappsy.com/page/
```

**Matches Rule C:** `https://gappsy.com/page/` → `https://www.gappsy.com/page/`

**After redirect:** `https://www.gappsy.com/page/`
- Does NOT match any rule (same as Test Case 1)
- Serves content (200 OK)

**Result:** 1 redirect, then serves content ✅**

### Test Case 3: WWW without Trailing Slash
```
Input: https://www.gappsy.com/page
```

**Does it match Rule A?** No
**Does it match Rule B?** No
**Does it match Rule C?** No
**Matches Rule D:** `/page` → `/page/`

**After redirect:** `https://www.gappsy.com/page/`
- Does NOT match any rule (same as Test Case 1)
- Serves content (200 OK)

**Result:** 1 redirect, then serves content ✅

### Test Case 4: Non-WWW without Trailing Slash
```
Input: https://gappsy.com/page
```

**Matches Rule C:** `https://gappsy.com/page` → `https://www.gappsy.com/page`

**After redirect:** `https://www.gappsy.com/page`
- Does NOT match Rule A, B, or C
- **Matches Rule D:** `/page` → `/page/`

**After second redirect:** `https://www.gappsy.com/page/`
- Does NOT match any rule
- Serves content (200 OK)

**Result:** 2 redirects, then serves content ✅

## Mathematical Proof

For a redirect loop to exist, there must be a cycle where:
```
URL₁ → URL₂ → URL₃ → ... → URL₁
```

**Canonical format:** `https://www.gappsy.com/<path>/`

**Key observation:** Once ANY URL reaches canonical format, NO rule matches it.

**All rules transform URLs toward canonical format:**
- Rule A, B, C: Transform to `https://www.gappsy.com/*`
- Rule D: Transform to `*` with trailing slash

**No rule transforms FROM canonical format to non-canonical.**

Therefore, all URL variants form a **directed acyclic graph (DAG)** that converges to canonical format:

```
http://gappsy.com/page  ─────┐
http://www.gappsy.com/page ──┤
https://gappsy.com/page ─────┼──→ https://www.gappsy.com/page/ (terminal)
https://www.gappsy.com/page ─┘
https://gappsy.com/page/ ────┘
```

**Conclusion:** A redirect loop is mathematically impossible with these rules alone.

## Then Where's the Loop Coming From?

If users report:
```
gappsy.com → www.gappsy.com → gappsy.com → www.gappsy.com → ...
```

This pattern indicates:

1. **Platform-level rule:** Force `www.gappsy.com` → `gappsy.com` (non-www)
2. **_redirects Rule C:** Force `gappsy.com` → `www.gappsy.com` (www)

These two rules create a ping-pong loop:
```
www → [platform] → non-www → [_redirects] → www → [platform] → ...
```

**The platform-level redirect must be disabled.**
