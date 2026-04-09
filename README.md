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

The script will check your system, install Claude Code (if needed), install Apify Agent Skills, and set up your environment. It will ask for your Apify API token if you haven't set one yet.

### 3. Start Claude Code

```bash
claude
```

That's it. You're ready to go.

---

## Try Your First Prompt

Once Claude Code is running, paste this:

```
Find 50 coffee shops in Austin, TX with at least 4 stars on Google Maps.
Get their name, address, phone number, website, rating, and review count.
Export as CSV.
```

Claude Code will automatically use the Apify Lead Generation skill to find the right scraper, run it, and return structured data.

More example prompts are in [`first-prompt.md`](./first-prompt.md).

---

## What Got Installed

After running `setup.sh`, your project has:

```
ai-that-works-apr14-2026-starter-kit/
├── .claude/
│   └── skills/           # Apify Agent Skills (auto-loaded by Claude Code)
├── .agents/
│   └── skills/           # Skill definitions and reference scripts
├── .env                  # Your Apify API token (git-ignored)
├── CLAUDE.md             # Project context for Claude Code
└── ...
```

**Skills installed:**

| Skill | What it does |
|---|---|
| `apify-ultimate-scraper` | Scrape 55+ platforms (Instagram, Google Maps, Amazon, TikTok, etc.) |
| `apify-actor-development` | Build and deploy your own Apify Actors |
| `apify-lead-generation` | Generate B2B/B2C leads from directories and social profiles |
| `apify-competitor-intelligence` | Analyze competitor strategies, pricing, and reviews |
| `apify-brand-reputation-monitoring` | Track reviews, ratings, and sentiment |
| `apify-ecommerce` | Pricing intelligence across 50+ marketplaces |
| `apify-content-analytics` | Measure content performance and engagement |
| `apify-influencer-discovery` | Find and evaluate influencers for partnerships |
| `apify-market-research` | Analyze market conditions and opportunities |
| `apify-trend-analysis` | Discover and track emerging trends |
| `apify-audience-analysis` | Understand audience demographics and behavior |

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

- [Apify Agent Skills repo](https://github.com/apify/agent-skills)
- [Apify Awesome Skills repo](https://github.com/apify/awesome-skills)
- [Claude Code docs](https://docs.claude.com/en/docs/claude-code)
- [Apify docs](https://docs.apify.com/)
- [AI That Works meetup](https://lu.ma/ai-that-works)

---

Built for the AI That Works meetup — presented by [Apify](https://apify.com).
