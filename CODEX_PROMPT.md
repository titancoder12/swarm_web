# Codex Prompt: Build The CWSF 2026 Project Website

Build a beautiful, high-end showcase website for the `cwsf2026` project.

This is not a web app. It is a presentation website for a robotics research and
engineering project. The site should feel polished enough for judges,
researchers, sponsors, and technically curious visitors.

## Product Goal

Create a visually strong project website that explains the project from:

- big-picture motivation
- biological / swarm-intelligence theory
- simulator and reinforcement learning system
- Mission Control and communication stack
- sim-to-real transfer
- physical robot implementation
- findings and limitations

The site should make the project feel real, technically credible, and ambitious.

## Recommended Stack

Use:

- Astro
- TypeScript
- Tailwind CSS
- MDX support if useful for long-form content

Reasoning:

- the site is showcase-only, not an app
- Astro is ideal for fast, content-heavy, visually rich sites
- React islands can still be used for charts, animated sections, and interactive
  diagrams when needed

If you believe Next.js is materially better for execution, justify it briefly in
comments or the README, but default to Astro.

## Design Direction

The website must be beautiful. Avoid generic startup-site design.

Visual direction:

- refined, cinematic, technical
- premium research-lab aesthetic
- strong editorial layout
- feels like a blend of:
  - robotics lab
  - scientific poster
  - experimental design portfolio

Do not use:

- generic purple gradients
- safe template-looking SaaS sections
- bland white cards everywhere
- interchangeable Tailwind boilerplate

Use:

- strong typography
- layered backgrounds
- subtle grid / field / sensor / swarm motifs
- carefully chosen accent colors
- deliberate spacing and hierarchy
- restrained but meaningful motion

The site should feel custom.

## Content Structure

Create a site with these sections or pages.

### 1. Hero

The landing section should immediately communicate:

- autonomous swarm robotics
- digital pheromones
- reinforcement learning
- simulator-to-physical-robot transfer

It should include:

- a strong project title
- a short, memorable value statement
- a visual motif inspired by swarm trails / pheromone fields / robot sensing
- clear CTA links to:
  - project overview
  - experiments
  - physical robot

### 2. Project Overview

Explain:

- what problem the project tackles
- why swarm robotics is interesting
- why pheromone-inspired coordination matters
- what the overall system consists of

### 3. Theory

Explain the conceptual foundations:

- stigmergy
- ant-inspired coordination
- digital pheromones
- decentralized multi-agent behavior
- why local signals can produce global coordination

This section should feel intellectually serious but accessible.

### 4. Simulation and Learning

Explain:

- the simulator
- observation/action design
- RL approach
- MAPPO and policy learning
- training curriculum
- what Mission Control does in the simulated ecosystem

If appropriate, include diagrams for:

- agent observation flow
- action loop
- pheromone sensing/deposit cycle

### 5. Sim-to-Real

Explain:

- what transferred cleanly
- what did not
- Mission Control integration
- BLE / relay / TCP communication
- camera-based target detection
- practical engineering challenges encountered on the real robot

This section should make the bridge from research system to embodied robot feel
concrete.

### 6. Physical Robot

Showcase the robot as a real artifact.

Include:

- photos / placeholders for photos
- hardware architecture
- Raspberry Pi
- sensors
- motors / locomotion
- onboard camera
- communication stack

If no final assets are available yet, create elegant placeholders and structure
the site so real media can be dropped in later.

### 7. Software Architecture

Explain the major components:

- simulator
- Mission Control
- robot firmware/runtime
- communication protocols
- training code

Use a clear visual system diagram if possible.

### 8. Lessons and Limitations

Be explicit about:

- what worked
- what was fragile
- where the experiments were inconclusive
- where engineering constraints shaped the outcome

This should increase credibility.

### 9. Future Work

Potential directions:

- learned visual detection such as YOLO
- improved curriculum design
- stronger physical localization
- multi-robot physical deployment
- richer environment complexity

## Functional Requirements

The site should:

- work well on desktop and mobile
- have excellent visual hierarchy
- support image/video/media placeholders cleanly
- support chart sections cleanly
- be statically buildable
- be easy to extend later with real content

## Implementation Guidance

Build reusable sections/components, such as:

- hero
- section header
- metric/result block
- architecture diagram block
- timeline or system-flow block
- experiment chart container
- media showcase block
- pull-quote / insight block

Define a consistent design system:

- color tokens
- spacing rhythm
- type scale
- surface styles
- border treatment
- motion rules

## Tone

The tone should be:

- technically confident
- serious
- modern
- not hype-driven
- not childish
- not corporate marketing language

Write like a strong research-engineering portfolio.

## Content Source Strategy

Use the existing repository as the primary source of truth for:

- terminology
- architecture
- experiments
- Mission Control
- camera integration
- sim-to-real details

Do not invent flashy claims that are not supported by the repo.

Prefer accurate summaries over exaggerated marketing copy.

## Deliverables

Create:

1. the website scaffold
2. the homepage and major sections/pages
3. a coherent visual system
4. placeholder areas for charts, images, and videos
5. a concise README describing:
   - stack choice
   - how to run locally
   - where to place media assets
   - where to update project copy

## Non-Negotiables

- The website must feel custom and visually intentional.
- It must showcase both theory and real engineering.
- It must clearly connect simulation, experiments, and the physical robot.
- It must be credible to technical readers.
- It must avoid generic template aesthetics.

## Build Standard

When done, the result should feel like a standout science-fair / robotics-lab
project site, not a bootcamp portfolio.
