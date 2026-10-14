# Ryan Wu's Blog

Personal blog of Ryan Wu ([blog.ryanwu.me](https://blog.ryanwu.me/)), migrated from Hexo to [Astro](https://astro.build/) with the [Astro Cactus](https://github.com/chrismwilliams/astro-theme-cactus) theme.

## 🚀 Getting Started

### Prerequisites

- Node.js (v20+ recommended)
- npm or pnpm

### Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

Visit `http://localhost:4321` to view the blog locally.

### Building

```bash
# Build static site and search indexes
npm run build
```

This compiles the static site into `dist/`, indexes content with [Pagefind](https://pagefind.app/), and generates legacy redirects.

### Writing New Posts

Create a new Markdown (`.md` or `.mdx`) file under `content/posts/`:

```markdown
---
title: "Your Post Title"
description: "A brief summary of your post"
publishDate: "YYYY-MM-DD"
tags: ["tag1", "tag2"]
---

Your content in Markdown here...
```

## 🚢 Deployment

Automated CI/CD is configured via GitHub Actions (`.github/workflows/deploy.yml`). Pushing changes to `master` (or `main`) automatically builds the site and deploys it to GitHub Pages at `blog.ryanwu.me`.

## 📂 Content Archive

The legacy Hexo static deployment is archived in the `archive/legacy-hexo` branch.
