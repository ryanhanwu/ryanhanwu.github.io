# ryanhanwu.github.io — Agent Notes

Astro 7 site. Content collections load only `content/posts`, `content/notes`, and `content/tags`. A push to `master` builds `dist/` and deploys that artifact. Dev server: `npm run dev` on port 4321.

## Shared agent config

Personal writing voice, skills, and tool rules live in the private `agent-configs` submodule (`github.com/ryanhanwu/agent-configs`, branch `main`). This repo and `wufu-math` both pin that submodule so a cloud agent with only one repository still reads the same config.

At the start of every task, run `bash scripts/update-agent-configs.sh`. That checks out the latest `main` and initializes nested vendor submodules. If the gitlink moved, commit the pointer update with the rest of the change.

Read `agent-configs/gemini/GEMINI.md` before writing prose. `.cursor/rules/content-research-writer.mdc` is a symlink into the submodule. Do not copy files out of `agent-configs` into this repository. GitHub Actions checks out this repo without submodules, so the private files are not part of the Pages build.

`.cursor/environment.json` lists `github.com/ryanhanwu/agent-configs` under `repositoryDependencies` so a single-repo cloud agent token can fetch the private submodule. `install` and `start` run the update script.

## Cursor Cloud specific instructions

- Install with `npm ci` (Node 22 in GitHub Actions; `.nvmrc` is 24 locally). `bash scripts/update-agent-configs.sh` runs before `npm ci` in `install`, and again on `start`.
- `start` serves `npm run dev` on port 4321. If that port is already accepting connections, reuse `http://127.0.0.1:4321`.
- Checks: `npm run check`, `npm run build`.
