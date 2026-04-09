# Deploy To DigitalOcean

This site is an Astro static build. The simplest production setup is:

- build the site
- copy `dist/` to the droplet
- serve it with Caddy
- point `swarm.christopherlin.ca` at the droplet

This guide assumes:

- domain: `christopherlin.ca`
- target subdomain: `swarm.christopherlin.ca`
- hosting target: a DigitalOcean droplet

## 1. DNS

In your DNS provider, add:

- type: `A`
- host/name: `swarm`
- value: `YOUR_DROPLET_IPV4`

If you use DigitalOcean DNS, that means an `A` record for:

- `swarm.christopherlin.ca` -> `YOUR_DROPLET_IPV4`

Wait for the record to resolve before expecting HTTPS issuance to work.

## 2. Prepare The Droplet

SSH into the droplet:

```bash
ssh root@YOUR_DROPLET_IPV4
```

Install Caddy and rsync if needed:

```bash
apt update
apt install -y caddy rsync
```

Create the site directory:

```bash
mkdir -p /var/www/swarm
```

## 3. Install The Caddy Config

From this repo, the intended Caddy config is:

- [deploy/Caddyfile](./Caddyfile)

On the droplet, put that content into:

```bash
/etc/caddy/Caddyfile
```

Then validate and reload:

```bash
caddy validate --config /etc/caddy/Caddyfile
systemctl reload caddy
```

If Caddy was not running yet:

```bash
systemctl enable caddy
systemctl restart caddy
```

## 4. Build The Site Locally

From this `web/` directory:

```bash
npm ci
npm run build
```

That produces:

- `dist/`

## 5. Upload The Build Output

Copy the built site to the droplet:

```bash
rsync -avz --delete dist/ root@YOUR_DROPLET_IPV4:/var/www/swarm/
```

## 6. Reload Caddy

After upload:

```bash
ssh root@YOUR_DROPLET_IPV4 "caddy validate --config /etc/caddy/Caddyfile && systemctl reload caddy"
```

## 7. Open The Site

Once DNS has propagated and Caddy has issued TLS certificates:

- `https://swarm.christopherlin.ca`

## Optional: One-Command Deploy Script

This repo also includes:

- [deploy/deploy.sh](./deploy.sh)

Example:

```bash
cd /Users/christopherlin/dev/cwsf2026/web
chmod +x deploy/deploy.sh
DROPLET_HOST=root@YOUR_DROPLET_IPV4 ./deploy/deploy.sh
```

That script will:

1. run `npm ci`
2. run `npm run build`
3. sync `dist/` to `/var/www/swarm`
4. validate and reload Caddy

## Updating The Site Later

For future deploys:

```bash
cd /Users/christopherlin/dev/cwsf2026/web
DROPLET_HOST=root@YOUR_DROPLET_IPV4 ./deploy/deploy.sh
```

## Notes

- This is a static deployment, not a long-running Node server.
- Caddy handles HTTPS automatically once DNS is correct.
- If HTTPS does not come up, check:
  - DNS resolution for `swarm.christopherlin.ca`
  - port `80` and `443` open on the droplet firewall
  - `journalctl -u caddy -n 100 --no-pager`
