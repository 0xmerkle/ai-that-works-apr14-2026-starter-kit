# AI That Works — Starter Kit

Get Claude Code + Apify Agent Skills running on your machine in under 5 minutes.

Built for the [AI That Works](https://lu.ma/ai-that-works) meetup in Austin, TX — presented by [Apify](https://apify.com).

---

## At the Event? Start Here

You'll need Claude Code for this demo. If you already ran `./setup.sh`, skip to Step 3.

### Step 1: Clone and setup

```bash
git clone https://github.com/0xmerkle/ai-that-works-apr14-2026-starter-kit.git
cd ai-that-works-apr14-2026-starter-kit
./setup.sh
```

The script installs Claude Code, configures your Apify API token, and loads 13 skills (4 core agent skills + 9 use-case skills). Takes about 2 minutes.

### Step 2: Start Claude Code

```bash
claude
```

### Step 3: Pick your skill

This kit comes with 9 pre-built "awesome skills" — each one is a ready-to-go AI workflow powered by real web data. Pick the one that sounds most useful to you:

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

Once you've picked a skill, copy and paste its starter prompt into Claude Code. Each prompt is designed to produce real results in 1-2 minutes.

**Open the prompts file:**

```bash
cat first-prompt.md
```

Or just pick one below:

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

### Step 5: Make it yours

Now that you've seen a skill in action, customize it. Ask Claude Code:

```
What skill did you just use? Show me the SKILL.md file.
```

Claude will show you the markdown file that powered the whole workflow. It's just a recipe — steps, data sources, and output format. Now tell Claude what you'd change:

- *"I only care about Instagram influencers under 50K followers"*
- *"Add a column for website URL and filter out anything without a phone number"*
- *"Change the output to JSON instead of CSV"*
- *"I want this for Denver, not Austin"*
- *"Also include their top 3 most-liked posts"*

Claude will update the skill file for you. Run your prompt again and see different results. You just customized an AI workflow without writing any code.

### Bonus: Build a skill from scratch

Want to create a completely new skill for your own workflow? See [`build-your-own-skill.md`](./build-your-own-skill.md) for a prompt you can paste into Claude Code that walks you through the entire process — from figuring out what you need, to finding the right data sources, to generating and testing the skill.

---

## Setup Details

### What You Need

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
- [AI That Works meetup](https://lu.ma/ai-that-works)

---

Built for the AI That Works meetup — presented by [Apify](https://apify.com).
