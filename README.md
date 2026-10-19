# Ryan Wu's Blog

[ryanwu.me](https://ryanwu.me/). Astro 7 static site on the
[Cactus](https://github.com/chrismwilliams/astro-theme-cactus) theme.
Content moved off Hexo. A push to `master` builds with npm and deploys
to GitHub Pages.

## Stack

- **Astro 7** content collections in `src/content.config.ts`. Posts,
  notes, and tags are glob-loaded from `content/`.
- **Satteri** processes Markdown (`astro.config.ts`,
  `@astrojs/markdown-satteri`). MDX is enabled. Current posts are `.md`.
- **Tailwind 4** in `src/styles/global.css`, with the typography plugin.
- **Expressive Code** for fenced blocks. Dracula in dark mode, GitHub
  Light otherwise. Both follow `data-theme`.
- **Pagefind** builds the search index after `astro build`.
- **Satori** draws `/og-image/<slug>.png` when a post has no `ogImage`.
- Sitemap, `robots.txt`, web manifest, and RSS for posts (`/rss.xml`)
  and notes (`/notes/rss.xml`).
- **webmention.io** likes and comments, when the env vars are set.

Title, URL, date format, and the header nav live in `src/site.config.ts`.
Nav is Home, Blog, About. Notes and tags are linked from the pages.

## Run it

GitHub Actions uses Node 22. `.nvmrc` is 24, which is fine on a laptop.

Use npm. `deploy.yml` runs `npm ci` against `package-lock.json`.
`ci.yml` uses pnpm, and it only runs on `main`. The default branch is
`master`, so the lockfile that ships is npm's.

```bash
npm install
npm run dev
```

Dev server: http://localhost:4321

Search stays off in dev. Pagefind indexes `dist/` during `postbuild`.

```bash
npm run build
npm run preview
```

## Content

| Collection | Files             | URL                   |
| ---------- | ----------------- | --------------------- |
| post       | `content/posts/`  | `/posts/<slug>/`      |
| note       | `content/notes/`  | `/notes/<slug>/`      |
| tag        | `content/tags/`   | copy for `/tags/<tag>/` |

The slug is the path under that folder, extension stripped.
`content/posts/agent-settings-is-the-new-dotfiles.md` is
`/posts/agent-settings-is-the-new-dotfiles/`.

Home shows up to 3 pinned posts, the latest 10 posts, and the latest
5 notes.

### Post

```markdown
---
title: "Design Review and Perf Review"
description: "One or two sentences. Used on the card and in meta tags."
publishDate: "2026-10-17T12:00:00.000Z"
updatedDate: "2026-10-18"
tags: ["leadership", "ai"]
ogImage: "/images/cover.jpg"
draft: false
pinned: false
---
```

`publishDate` accepts a date or an ISO string. Recent posts use a full
timestamp. Tags are lowercased and de-duplicated.

`ogImage` is a path under `public/`. With no `ogImage`, the build emits
a Satori image at `/og-image/<slug>.png`.

`draft: true` still shows in `npm run dev`. Production `getAllPosts()`
drops it.

`pinned: true` surfaces the post on the home page and on `/posts/`.
Both lists cap at 3.

`coverImage` is optional. It is a local image (`alt` + `src`) rendered
in the post masthead. `src` is an Astro `image()`, so point it at a file
the content loader can resolve, usually next to the post.

### Note

`publishDate` has to be an ISO datetime. An offset is allowed (`Z` or
`+08:00`).

```markdown
---
title: Hello, Visitor
description: Welcome to Ryan's blog
publishDate: "2024-10-14T11:23:00Z"
---
```

### Tag page

`/tags/` and `/tags/<tag>/` are built from post frontmatter. Add
`content/tags/<tag>.md` only when that tag needs its own title or intro.
The filename must match the lowercased tag.

## Markdown

Plugins in `src/plugins/`, registered on the Satteri processor:

- Callouts: `:::tip`, `:::note`, `:::important`, `:::caution`,
  `:::warning`. Custom title: `:::tip[Ship it]`.
- GitHub card: `::github{repo="owner/name"}`. The page fetches the
  GitHub API in the browser.
- Heading ids and anchor links.
- Reading time, stored on the post at build.
- A paragraph that is only an image is unwrapped.
- External links open in a new tab.

## Build and deploy

```bash
npm run build
```

`astro build`, then `postbuild`:

1. Pagefind indexes `dist/`.
2. `scripts/generate-redirects.js` writes a static HTML redirect for
   each old Hexo URL.

`.github/workflows/deploy.yml` runs that on push to `master` or `main`
(Node 22, `npm ci`) and uploads `dist/` to GitHub Pages. The domain is
`public/CNAME`.

`.github/workflows/ci.yml` typechecks and builds with pnpm, on `main`
only. A push to `master` deploys without that workflow.

Legacy redirects are edited in `scripts/generate-redirects.js`. That is
the file the build runs. `src/redirects.ts` holds the same map and
nothing imports it.

The old Hexo site is on `archive/legacy-hexo`.

## Checks

```bash
npm run check    # astro check && biome check
npm run lint     # biome check --write
npm run format   # prettier
```

## Webmentions

Optional. The site builds without them. The mentions block stays empty
until these are set (schema in `astro.config.ts`):

| Variable              | Access        |
| --------------------- | ------------- |
| `WEBMENTION_API_KEY`  | server secret |
| `WEBMENTION_URL`      | public        |
| `WEBMENTION_PINGBACK` | public        |

## Where to look

```
content/posts|notes|tags/      markdown
src/content.config.ts          collection schemas
src/data/post.ts               draft filter, tag helpers
src/site.config.ts             url, title, nav, code theme
src/pages/                     routes, RSS, OG endpoint
src/layouts/BlogPost.astro     post chrome, TOC, webmentions
src/plugins/                   callouts, GitHub cards, Satteri helpers
scripts/generate-redirects.js  Hexo redirects (this one runs)
public/                        CNAME, icons, post images
```
