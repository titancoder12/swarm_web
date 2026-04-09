# CWSF 2026 Website

This directory contains the project showcase website for the `cwsf2026`
swarm-robotics project.

## Stack

- Astro
- TypeScript
- handcrafted global CSS

The site is content-first and showcase-oriented. It is meant to present the
project from theory through simulator design, Mission Control, sim-to-real
transfer, and the physical robot.

## Run Locally

From this directory:

```bash
npm install
npm run dev
```

Then open the local Astro dev URL.

## Test Locally Before Deploying

Recommended local workflow:

```bash
cd /Users/christopherlin/dev/cwsf2026/web
npm install
npm run dev
```

For a production-style local check:

```bash
npm run build
npm run preview
```

Use `npm run dev` while editing and `npm run build` before pushing changes.

## Build

```bash
npm run build
```

## Deploy To DigitalOcean

Recommended production setup:

- build the Astro site to `dist/`
- serve it from the droplet with nginx
- point `swarm.christopherlin.ca` at the droplet IP

Deployment files:

- [deploy/DEPLOY_DIGITALOCEAN.md](./deploy/DEPLOY_DIGITALOCEAN.md)
- [deploy/deploy.sh](./deploy/deploy.sh)

## Remote Deployment Workflow

This site is currently deployed by:

1. cloning the repo on the droplet
2. building the Astro site on the droplet
3. copying `dist/` into `/var/www/swarm`
4. serving `/var/www/swarm` with nginx at `swarm.christopherlin.ca`

### First-Time Build On The Droplet

On the server:

```bash
cd ~/swarm_web
npm ci
npm run build
sudo mkdir -p /var/www/swarm
sudo rsync -av --delete dist/ /var/www/swarm/
sudo systemctl reload nginx
```

### Updating The Live Site Later

When you change the website and push to GitHub, update the droplet with:

```bash
cd ~/swarm_web
git pull
npm run build
sudo rsync -av --delete dist/ /var/www/swarm/
sudo systemctl reload nginx
```

If `package.json` or `package-lock.json` changed, use this instead:

```bash
cd ~/swarm_web
git pull
npm ci
npm run build
sudo rsync -av --delete dist/ /var/www/swarm/
sudo systemctl reload nginx
```

### Verifying The Live Site

From your Mac or from the droplet:

```bash
curl -I https://swarm.christopherlin.ca
```

You should get an HTTP response from nginx over HTTPS.

## Project Structure

- `src/pages/index.astro`
  - main one-page project showcase
- `src/components/`
  - reusable UI blocks
- `src/layouts/BaseLayout.astro`
  - base HTML shell
- `src/styles/global.css`
  - site-wide design system and styling
- `public/`
  - static assets such as favicon and future media

## Adding Real Media

Place future assets under `public/`.

Recommended structure:

```text
public/
  images/
  video/
```

For example:

- `public/images/robot-hero.jpg`
- `public/images/mission-control.png`
- `public/images/simulator-scene.png`
- `public/video/demo.mp4`

Then replace the placeholder blocks in `src/pages/index.astro` with real image
or video elements.

Example image usage in Astro:

```astro
<img src="/images/robot-hero.jpg" alt="Physical swarm robot" />
```

## Updating Copy

Most project copy currently lives in:

- `src/pages/index.astro`

If the content grows substantially, move long-form section text into separate
content files or MDX pages.
