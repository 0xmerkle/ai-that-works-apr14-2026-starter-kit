# AI That Works — Starter Kit

Get Claude Code + Apify Agent Skills running on your machine in under 5 minutes.

This kit was built for the [AI That Works](https://lu.ma/ai-that-works) meetup in Austin, TX. It works for anyone who wants to try AI agent skills with real web data.

---

## What You Need

Before running setup, make sure you have:

| Requirement | How to get it |
|---|---|
| **macOS or Linux** | Windows users: install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) first |
| **Node.js 18+** | [nodejs.org](https://nodejs.org/) — download the LTS version |
| **Git** | Comes with macOS. Linux: `sudo apt install git` |
| **An Anthropic account** | [claude.ai](https://claude.ai/) — Pro, Max, Team, or Enterprise |
| **An Apify account** | [apify.com](https://apify.com/) — free tier works |
| **Your Apify API token** | [console.apify.com/account/integrations](https://console.apify.com/account/integrations) — copy your Personal API token |

Not sure if you have Node.js? Run `node --version` in your terminal. If you see `v18.x.x` or higher, you're good.

---

## Quick Start

### 1. Clone this repo

```bash
git clone https://github.com/0xmerkle/ai-that-works-apr14-2026-starter-kit.git
cd ai-that-works-apr14-2026-starter-kit
```

### 2. Run the setup script

```bash
./setup.sh
```

The script will:
1. Check your system (OS, Node.js, npm)
2. Install Claude Code if you don't have it
3. Ask for your Apify API token
4. Install the **Apify Agent Skills** (4 core skills — see [wizard walkthrough](#apify-agent-skills-wizard) below)
5. Install the **Apify Awesome Skills** (9 use-case skills, copied directly into `.claude/skills/`)
6. Install the `mcpc` CLI tool

### 3. Start Claude Code

```bash
claude
```

That's it. You're ready to go.

---

## Apify Agent Skills Wizard

During setup, `npx skills add apify/agent-skills` will open an interactive picker that looks like this:

```
◆ Select skills to install (space to toggle)
  ■ apify-actor-development
  □ apify-actorization
  □ apify-generate-output-schema
  □ apify-ultimate-scraper
```

**Press `a` to select all four skills, then press `Enter`.**

Here's what each one does:

| Skill | What it does | Who it's for |
|---|---|---|
| **apify-ultimate-scraper** | Scrapes 55+ platforms — Instagram, Google Maps, Amazon, TikTok, YouTube, Walmart, TripAdvisor, and more. Automatically picks the right Apify Actor for the platform you need. | Everyone |
| **apify-actor-development** | Scaffolds, builds, tests, and deploys Apify Actors in JavaScript, TypeScript, or Python. Follows best practices and generates proper schemas. | Developers |
| **apify-actorization** | Converts an existing project (scraper, API wrapper, automation) into a deployable Apify Actor with proper input/output handling. | Developers |
| **apify-generate-output-schema** | Generates output schema files for Apify Actors so downstream tools know what data shape to expect. | Developers |

> If you're not building Actors and just want to scrape data, `apify-ultimate-scraper` is the one that matters most. But select all — they don't conflict.

---

## Awesome Skills (Installed Automatically)

These 9 skills are copied directly into your `.claude/skills/` directory during setup. No wizard needed — they're just there.

| Skill | What it does |
|---|---|
| **apify-lead-generation** | Generate B2B/B2C leads by scraping business directories, social profiles, and contact data from Google Maps, LinkedIn, Instagram, and more. |
| **apify-competitor-intelligence** | Analyze competitor strategies, content, pricing, ads, and market positioning across Google Maps, Instagram, Facebook, YouTube, and TikTok. |
| **apify-brand-reputation-monitoring** | Track reviews, ratings, and sentiment across Google Maps, TripAdvisor, Instagram, and YouTube. |
| **apify-ecommerce** | Pricing intelligence, product research, and customer sentiment across Amazon, Walmart, eBay, and 50+ marketplaces. |
| **apify-content-analytics** | Track engagement metrics, measure campaign ROI, and analyze content performance on Instagram, Facebook, YouTube, and TikTok. |
| **apify-influencer-discovery** | Find and evaluate influencers for brand partnerships and verify audience authenticity on Instagram, YouTube, and TikTok. |
| **apify-market-research** | Analyze market conditions, geographic opportunities, and consumer behavior using Google Maps, Facebook, Instagram, and TripAdvisor data. |
| **apify-trend-analysis** | Discover and track emerging trends across Google Trends, Instagram, TikTok, and YouTube. |
| **apify-audience-analysis** | Understand audience demographics, preferences, and engagement patterns on Instagram, Facebook, YouTube, and TikTok. |

---

## Try Your First Prompt

Once Claude Code is running, paste this:

```
Find 50 coffee shops in Austin, TX with at least 4 stars on Google Maps.
Get their name, address, phone number, website, rating, and review count.
Export as CSV.
```

Claude Code will automatically use the right skill to find the scraper, run it, and return structured data.

More example prompts are in [`first-prompt.md`](./first-prompt.md).

---

## What Got Installed

After running `setup.sh`, your project looks like this:

```
ai-that-works-apr14-2026-starter-kit/
├── .agents/
│   └── skills/             ← Agent Skills (from npx skills add)
├── .claude/
│   └── skills/             ← Awesome Skills (copied from repo)
│       ├── apify-lead-generation/
│       ├── apify-competitor-intelligence/
│       ├── apify-brand-reputation-monitoring/
│       ├── apify-ecommerce/
│       ├── apify-content-analytics/
│       ├── apify-influencer-discovery/
│       ├── apify-market-research/
│       ├── apify-trend-analysis/
│       └── apify-audience-analysis/
├── .env                    ← Your Apify API token (git-ignored)
├── CLAUDE.md               ← Project context for Claude Code
├── first-prompt.md         ← Example prompts to try
└── setup.sh                ← The setup script you just ran
```

---

## Supported Platforms

| Platform | Status |
|---|---|
| macOS (Apple Silicon) | Fully supported |
| macOS (Intel) | Fully supported |
| Linux (Ubuntu 18.04+) | Fully supported |
| Windows (WSL) | Works via WSL — see [setup guide](https://learn.microsoft.com/en-us/windows/wsl/install) |
| Windows (native) | Not supported — use WSL |

---

## Troubleshooting

See [`troubleshooting.md`](./troubleshooting.md) for common issues and fixes.

**Quick fixes:**

- **"command not found: claude"** — Run the setup script again, or install manually: `curl -fsSL https://claude.ai/install.sh | bash`
- **"APIFY_TOKEN not set"** — Copy your token from [console.apify.com/account/integrations](https://console.apify.com/account/integrations) and add it to your `.env` file
- **"Node.js version too old"** — Download the latest LTS from [nodejs.org](https://nodejs.org/)
- **Skills not loading** — Make sure you're running `claude` from inside this project directory

---

## Links

- [Apify Agent Skills](https://github.com/apify/agent-skills) — Core skills (scraper, actor dev)
- [Apify Awesome Skills](https://github.com/apify/awesome-skills) — Use-case skills (lead gen, competitor intel, etc.)
- [Claude Code docs](https://docs.claude.com/en/docs/claude-code)
- [Apify docs](https://docs.apify.com/)
- [AI That Works meetup](https://lu.ma/ai-that-works)

---

Built for the AI That Works meetup — presented by [Apify](https://apify.com).
