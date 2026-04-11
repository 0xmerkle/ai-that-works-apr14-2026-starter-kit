# AI That Works — Starter Kit

This project has Apify Agent Skills installed. When the user asks you to scrape data, generate leads, analyze competitors, monitor brands, or do any web data task, use the appropriate Apify skill.

## Available Skills

The `.claude/skills/` directory contains 9 Apify Awesome Skills for lead generation, competitor intelligence, brand monitoring, e-commerce research, content analytics, influencer discovery, market research, trend analysis, and audience analysis.

The `.agents/skills/` directory contains 4 Apify Agent Skills including the universal scraper, actor development, actorization, and output schema generation.

## Environment

- The `.env` file contains the user's `APIFY_TOKEN` for authenticating with Apify's API.
- Use the `mcpc` CLI tool or the `run_actor.js` scripts in skill reference directories to execute Apify Actors.
- Always use `node --env-file=.env` when running scripts that need the API token.

## Key Files

- `first-prompt.md` — Starter prompts for each of the 9 awesome skills
- `build-your-own-skill.md` — Guide for creating new skills from scratch
- `troubleshooting.md` — Common issues and fixes

## First Time?

If the user seems new, suggest they try one of the starter prompts from `first-prompt.md`. Keep explanations concise and focus on getting results.
