# Crawler Gateway

Bridges Gappsy's Supabase Edge Functions to the loopback-only Crawl4AI
instance (`127.0.0.1:11235`) on the Hivelocity/Plesk server. This is the
**only** thing permitted to reach Crawl4AI over the network; Crawl4AI itself
never changes its binding.

## What this is not

- Not a public crawler API. It accepts exactly one signed action (`POST /crawl`
  with a fixed `{url, max_pages, max_depth, max_duration_ms}` shape).
- Not a generic proxy. It never forwards arbitrary Crawl4AI options or
  arbitrary paths.
- Not a shell. No command execution of any kind.

## Required environment (set via the systemd Quadlet's `EnvironmentFile=`,
mode 600, never committed)

| Variable | Purpose |
|---|---|
| `GATEWAY_SHARED_SECRET` | HMAC key Gappsy's edge functions sign requests with. Generate with `openssl rand -hex 32`. |
| `CRAWL4AI_URL` | `http://127.0.0.1:11235` (loopback, same host) |
| `CRAWL4AI_API_TOKEN` | The existing Crawl4AI bearer token already configured on this server |
| `GATEWAY_PORT` | `8787` (loopback-only; see network exposure below) |

## Deployment (proposed — not yet applied)

Mirrors the existing Crawl4AI Quadlet pattern exactly, under the same
`svc-ai` account, same resource-capping approach:

```ini
# /home/svc-ai/.config/containers/systemd/crawler-gateway.container
[Unit]
Description=Crawler Gateway - signed bridge to loopback Crawl4AI
After=crawl4ai.service

[Container]
Image=localhost/gappsy-crawler-gateway:1.0.0
ContainerName=crawler-gateway
PublishPort=127.0.0.1:8787:8787
EnvironmentFile=/home/svc-ai/services/crawler-gateway/config/.env
PodmanArgs=--cgroups=no-conmon --memory=512m --cpus=1
HealthCmd=node -e "fetch('http://127.0.0.1:8787/health').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"
HealthInterval=30s

[Service]
Restart=on-failure
RestartSec=10

[Install]
WantedBy=default.target
```

Steps: `podman build` the image from this directory, `podman load`/tag it
locally under `svc-ai` (no registry needed for a single-host deploy),
write the `.env` (mode 600) with the four variables above, place the
Quadlet file, `systemctl --user daemon-reload && systemctl --user start
crawler-gateway.service`. Same fleet slice cap (`user-<uid>.slice`, already
covers Crawl4AI) absorbs this container's 512MB/1-CPU addition — well
within the existing 6GB/3-CPU fleet ceiling.

## Network exposure — the actual decision point

The gateway binds `127.0.0.1:8787` on the server, same as Crawl4AI. But
Supabase Edge Functions run on Supabase's own infrastructure, not inside
this server's network — they can only reach this gateway over the public
internet. That means **some** internet-reachable endpoint is required; the
HMAC signature + timestamp window is the actual security boundary, not
network obscurity.

**Proposed minimum-footprint approach**: one new Plesk-managed subdomain
(e.g. `crawler.gappsy.com`), HTTPS via Plesk's existing Let's Encrypt
automation (same flow already used for every other vhost on this box), with
an nginx `proxy_pass` to `127.0.0.1:8787` — mirroring exactly how the
existing `dashboard.gappsy.com` vhost already reverse-proxies to a loopback
backend (Apache on 7080/7081). No new firewalld port: 443 is already open.

This is a genuine new production change on a live server hosting other
sites/mail/DNS, so it is **not applied** — see the crawl integration report
for the exact proposal awaiting approval.
