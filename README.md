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

## Build

```bash
npm run build
```

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

Place future assets under `public/`, for example:

- `public/images/robot-hero.jpg`
- `public/images/mission-control.png`
- `public/images/simulator-scene.png`
- `public/video/demo.mp4`

Then replace the placeholder blocks in `src/pages/index.astro` with real image
or video elements.

## Updating Copy

Most project copy currently lives in:

- `src/pages/index.astro`

If the content grows substantially, move long-form section text into separate
content files or MDX pages.
