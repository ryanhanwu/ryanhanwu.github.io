#!/usr/bin/env bash
# Check out the latest agent-configs main, then the vendor pins recorded there.
# Safe to run repeatedly. Commit the gitlink in this repo when it moves.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "${root}"

export GIT_TERMINAL_PROMPT=0

if ! git config -f .gitmodules --get submodule.agent-configs.path >/dev/null; then
  echo "agent-configs submodule is not configured" >&2
  exit 1
fi

git submodule sync -- agent-configs

# .gitmodules uses HTTPS so a cloud agent token (repositoryDependencies) can
# fetch the private repo. This machine may only have SSH keys.
https_url="$(git config -f .gitmodules --get submodule.agent-configs.url)"
if ! git ls-remote "${https_url}" HEAD >/dev/null 2>&1; then
  case "${https_url}" in
    https://github.com/*)
      ssh_url="git@github.com:${https_url#https://github.com/}"
      # sync writes the HTTPS URL into the submodule's origin. update fetches
      # that origin, so the SSH fallback has to land there too.
      git config submodule.agent-configs.url "${ssh_url}"
      if [[ -e agent-configs/.git ]]; then
        git -C agent-configs remote set-url origin "${ssh_url}"
      fi
      ;;
    *)
      echo "Cannot reach ${https_url}" >&2
      exit 1
      ;;
  esac
fi

git submodule update --init --remote -- agent-configs

if [[ -f agent-configs/.gitmodules ]]; then
  git -C agent-configs submodule sync --recursive
  git -C agent-configs submodule update --init --recursive
fi
