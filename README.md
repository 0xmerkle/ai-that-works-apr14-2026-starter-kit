# AI That Works — Starter Kit

Get Claude Code + Apify Agent Skills running on your machine in under 5 minutes.

Built for the AI That Works meetup in Austin, TX — presented by [Apify](https://apify.com).

---

## Why skills?

Anthropic (the company behind Claude) describes skills like recipes in a professional kitchen: MCP servers give the agent access to tools and ingredients, but **skills are the step-by-step recipes** that tell it how to use them well. The teams building the best AI agents aren't writing better prompts — they're building better skills.

Here's the thing the Anthropic team emphasizes: **the best skills come from iteration.** You do a task, see what works, capture the pattern into a skill, test it, improve it, repeat. The first draft is never the final product.

For the sake of time today, we're starting with skills that have already been created and tested — 9 ready-to-go workflows for common business tasks (lead generation, competitor research, e-commerce analysis, etc.). You'll pick one, run it with real data, and then **customize it** to get a feel for what the iteration process looks like. This is the same workflow Anthropic recommends, just fast-forwarded past the blank-page stage.

If you want to build a skill completely from scratch for your own workflow, there's a guide for that too — see [`build-your-own-skill.md`](./build-your-own-skill.md). That's more of a 15-30 minute project for after the event.

---

## Prerequisites

Before starting, make sure you have these ready. **If you're at the event and need help, raise your hand — we'll get you set up.**

| Requirement | How to check | How to get it |
|---|---|---|
| **macOS or Linux** | You're on a Mac or Linux machine | Windows users: install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) first |
| **Node.js 18+** | Run `node --version` in your terminal | [nodejs.org](https://nodejs.org/) — download the LTS version |
| **Git** | Run `git --version` in your terminal | Comes with macOS. Linux: `sudo apt install git` |
| **Claude Code** | Run `claude --version` in your terminal | Install: `curl -fsSL https://claude.ai/install.sh \| bash` then restart your terminal |
| **Anthropic account** | You can log in at [claude.ai](https://claude.ai/) | Sign up at [claude.ai](https://claude.ai/) — Pro, Max, Team, or Enterprise plan required |
| **Apify account** | You can log in at [apify.com](https://apify.com/) | Sign up at [apify.com](https://apify.com/) — free tier works |
| **Apify API token** | — | Copy from [console.apify.com/account/integrations](https://console.apify.com/account/integrations) |

### How to open your terminal

Everything in this guide runs in the **terminal** (also called the command line). Here's how to open it:

- **Mac:** Press `Cmd + Space` to open Spotlight, type **Terminal**, and press Enter.
- **Linux:** Press `Ctrl + Alt + T`, or find Terminal in your app launcher.
- **Windows (WSL):** Open the Start menu, search for **Ubuntu** or **WSL**, and open it.

Once your terminal is open, you'll type or paste commands into it for the rest of this guide.

---

## Let's Go

If you already ran `./setup.sh`, skip to [Step 3](#step-3-pick-your-skill).

### Step 1: Clone and setup

Open your terminal and paste these commands:

```bash
git clone https://github.com/0xmerkle/ai-that-works-apr14-2026-starter-kit.git
cd ai-that-works-apr14-2026-starter-kit
./setup.sh
```

The setup script will check your system, ask for your Apify API token, and install 13 skills (4 core agent skills + 9 use-case skills). Follow the prompts — when the skill picker appears, press `a` to select all, then `Enter`.

### Step 2: Start Claude Code

In the same terminal, type:

```bash
claude
```

This opens Claude Code — a conversational AI agent that runs directly in your terminal. If this is your first time, it'll open a browser window for you to log in with your Anthropic account.

Once you see the Claude Code prompt, you're ready.

### Step 3: Pick your skill

This kit comes with 9 pre-built skills. Each one is a ready-to-go AI workflow that pulls real web data. Pick the one that sounds most relevant to you:

| # | Skill | What it does | Try if you... |
|---|---|---|---|
| 1 | **Lead Generation** | Scrape business directories and contact data from Google Maps, LinkedIn, Instagram | ...need to find potential customers or partners |
| 2 | **Competitor Intelligence** | Analyze competitor reviews, pricing, content, and positioning | ...want to know what your competitors are doing |
| 3 | **Brand Monitoring** | Track reviews, ratings, and sentiment across platforms | ...care about what people say about a brand |
| 4 | **E-Commerce Research** | Pricing intelligence and product research on Amazon, Walmart, eBay | ...sell products or want to launch one |
| 5 | **Content Analytics** | Measure engagement, campaign ROI, and content performance | ...run social media or content marketing |
| 6 | **Influencer Discovery** | Find and vet influencers for brand partnerships | ...want to find creators to work with |
| 7 | **Market Research** | Analyze market conditions, geography, and consumer behavior | ...are exploring a new market or location |
| 8 | **Trend Analysis** | Track emerging trends across Google Trends and social platforms | ...want to spot what's next |
| 9 | **Audience Analysis** | Understand demographics, preferences, and engagement patterns | ...want to know who's engaging with content |

### Step 4: Run the starter prompt

Each skill has a starter prompt — a ready-made request you can copy and paste straight into Claude Code.

You can find all 9 starter prompts in [`first-prompt.md`](https://github.com/0xmerkle/ai-that-works-apr14-2026-starter-kit/blob/main/first-prompt.md), or just expand the one you picked below, copy the text, and paste it into Claude Code:

<details>
<summary><strong>1. Lead Generation</strong></summary>

```
Find 50 coffee shops in Austin, TX with at least 4 stars on Google Maps.
Get their name, address, phone number, website, rating, and review count.
Export as CSV.
```
</details>

<details>
<summary><strong>2. Competitor Intelligence</strong></summary>

```
Compare these 3 Austin co-working spaces: Capital Factory, WeWork Austin,
and Industrious Austin. Scrape their Google Maps reviews and ratings.
Summarize what customers love and hate about each one.
```
</details>

<details>
<summary><strong>3. Brand Monitoring</strong></summary>

```
Monitor what people are saying about Franklin Barbecue in Austin.
Scrape their latest Google Maps reviews. Run sentiment analysis and
tell me if the vibe is shifting — are people still as enthusiastic?
```
</details>

<details>
<summary><strong>4. E-Commerce Research</strong></summary>

```
I'm launching a hot sauce brand in Austin. Search Amazon for the top 20
best-selling hot sauces. Get their prices, ratings, review counts, and
the most common complaints from 1-star reviews.
```
</details>

<details>
<summary><strong>5. Content Analytics</strong></summary>

```
Analyze the last 30 posts from @visitaustin on Instagram. Which content
types get the most engagement? What posting times work best?
```
</details>

<details>
<summary><strong>6. Influencer Discovery</strong></summary>

```
Find 15 Austin-based food and lifestyle influencers on Instagram with
10k-100k followers. Get their engagement rate, average likes, and
posting frequency.
```
</details>

<details>
<summary><strong>7. Market Research</strong></summary>

```
I want to open a yoga studio in Austin. How many yoga studios are there,
what are their ratings, and what neighborhoods are underserved?
Use Google Maps data.
```
</details>

<details>
<summary><strong>8. Trend Analysis</strong></summary>

```
What are the trending topics in Austin's tech scene? Check Google Trends
for "Austin AI", "Austin startups", and "Austin tech jobs" over the
last 90 days.
```
</details>

<details>
<summary><strong>9. Audience Analysis</strong></summary>

```
Analyze the audience of @saboratx on Instagram. Who's engaging with
their content? What are the peak engagement times and what content
themes get the most interaction?
```
</details>

Paste your chosen prompt into Claude Code and let it run. Claude will automatically pick the right skill, find the right data tools, and bring back real results.

### Step 5: Make it yours

This is where it gets interesting — and where you start to see how building skills actually works.

The skill you just ran is a **first draft**. It worked, but it was built for a generic use case. Now think about something that would actually be useful to *you*. Maybe you want different data points. Maybe you care about a different city, a different platform, or a different industry. Maybe the output format isn't what you need.

Start by asking Claude Code what just happened:

```
What skill did you just use? Show me the SKILL.md file.
```

Claude will show you the markdown file that powered the whole workflow — the "recipe." It's just steps, data sources, and output format. Now tell Claude what you'd change. For example:

- *"I only care about Instagram influencers under 50K followers"*
- *"Add a column for website URL and filter out anything without a phone number"*
- *"Change the output to JSON instead of CSV"*
- *"I want this for Denver, not Austin"*
- *"Also include their top 3 most-liked posts"*

Claude will update the skill for you. Run your prompt again and you'll see different results.

**This is the iteration loop.** Define the skill, run it, look at the output, decide what's off, ask Claude to update it, run it again. That's exactly how the Anthropic team says the best skills get built — through repeated use and refinement, not by trying to get it perfect on the first try. The only difference is that today we started with an existing skill instead of a blank page, so you could skip ahead to the refinement part.

### Bonus: Build a skill from scratch

Want to create a completely new skill for your own workflow — starting from nothing? See [`build-your-own-skill.md`](./build-your-own-skill.md) for a prompt you can paste into Claude Code that walks you through the full process: figuring out what you need, finding the right data sources, generating the skill, and testing it. That's more of a 15-30 minute project, best done after the event when you have time to think through your specific use case.

---

## Setup Details

### What the setup script does

```bash
./setup.sh
```

1. Checks your system (OS, Node.js, npm)
2. Installs Claude Code if you don't have it
3. Asks for your Apify API token
4. Installs **Apify Agent Skills** — 4 core skills via `npx skills add apify/agent-skills`
5. Installs **Apify Awesome Skills** — 9 use-case skills, copied into `.claude/skills/`
6. Installs the `mcpc` CLI tool

### Apify Agent Skills wizard

During setup, a skill picker will appear:

```
◆ Select skills to install (space to toggle)
  ■ apify-actor-development
  □ apify-actorization
  □ apify-generate-output-schema
  □ apify-ultimate-scraper
```

**Press `a` to select all four skills, then press `Enter`.**

| Skill | What it does |
|---|---|
| **apify-ultimate-scraper** | Scrapes 55+ platforms — Instagram, Google Maps, Amazon, TikTok, YouTube, and more. Automatically picks the right Apify Actor. |
| **apify-actor-development** | Scaffolds, builds, tests, and deploys Apify Actors. For developers. |
| **apify-actorization** | Converts existing projects into deployable Apify Actors. For developers. |
| **apify-generate-output-schema** | Generates output schemas for Apify Actors. For developers. |

### What got installed

```
ai-that-works-apr14-2026-starter-kit/
├── .agents/
│   └── skills/             ← Agent Skills (from npx skills add)
├── .claude/
│   └── skills/             ← Awesome Skills (9 use-case skills)
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
├── first-prompt.md         ← Starter prompts for each skill
├── build-your-own-skill.md ← Guide to creating skills from scratch
└── setup.sh                ← The setup script
```

### Where do outputs go?

When Claude Code generates a file (CSV, JSON, report), it saves it to your current working directory. To find your results:

```bash
ls -lt *.csv *.json 2>/dev/null
```

> **Tip:** "Export as CSV" writes a file. "Show me the results" prints to terminal. Be specific about what you want.

---

## Troubleshooting

See [`troubleshooting.md`](./troubleshooting.md) for detailed fixes.

**Quick fixes:**

- **"command not found: claude"** — Run `curl -fsSL https://claude.ai/install.sh | bash` and restart your terminal
- **"APIFY_TOKEN not set"** — Get your token from [console.apify.com/account/integrations](https://console.apify.com/account/integrations) and add to `.env`
- **"Node.js version too old"** — Download LTS from [nodejs.org](https://nodejs.org/)
- **Skills not loading** — Make sure you're running `claude` from inside this project directory

---

## Supported Platforms

| Platform | Status |
|---|---|
| macOS (Apple Silicon) | Fully supported |
| macOS (Intel) | Fully supported |
| Linux (Ubuntu 18.04+) | Fully supported |
| Windows (WSL) | Works via WSL |
| Windows (native) | Not supported — use WSL |

---

## Links

- [Apify Agent Skills](https://github.com/apify/agent-skills) — Core skills (scraper, actor dev)
- [Apify Awesome Skills](https://github.com/apify/awesome-skills) — Use-case skills (lead gen, competitor intel, etc.)
- [Claude Code docs](https://docs.claude.com/en/docs/claude-code)
- [Apify docs](https://docs.apify.com/)
---

Built for the AI That Works meetup — presented by [Apify](https://apify.com).
