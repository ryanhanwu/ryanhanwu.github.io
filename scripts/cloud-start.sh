#!/usr/bin/env bash
# Refresh shared agent config, then start the dev server when its port is free.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "${root}"
bash "${root}/scripts/update-agent-configs.sh"

port="${1:?port required}"
shift

if (echo >/dev/tcp/127.0.0.1/"${port}") >/dev/null 2>&1; then
  echo "Already accepting connections on 127.0.0.1:${port}"
  exit 0
fi

exec "$@"
