#!/usr/bin/env bash
set -euo pipefail

# Template deploy script for the Astro static site.
#
# Usage:
#   DROPLET_HOST=root@YOUR_DROPLET_IP ./deploy/deploy.sh
#
# Assumptions:
# - Caddy is installed on the droplet
# - /etc/caddy/Caddyfile should use deploy/Caddyfile from this repo
# - the site is served from /var/www/swarm

if [[ -z "${DROPLET_HOST:-}" ]]; then
  echo "Set DROPLET_HOST, for example: DROPLET_HOST=root@203.0.113.10 ./deploy/deploy.sh" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${PROJECT_ROOT}"
npm ci
npm run build

ssh "${DROPLET_HOST}" "mkdir -p /var/www/swarm"
rsync -avz --delete "${PROJECT_ROOT}/dist/" "${DROPLET_HOST}:/var/www/swarm/"
ssh "${DROPLET_HOST}" "caddy validate --config /etc/caddy/Caddyfile && systemctl reload caddy"

echo "Deployed dist/ to ${DROPLET_HOST}:/var/www/swarm"
