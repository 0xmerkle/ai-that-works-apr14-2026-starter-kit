# AI That Works — Starter Kit

This project has Apify Agent Skills installed. When the user asks you to scrape data, generate leads, analyze competitors, monitor brands, or do any web data task, use the appropriate Apify skill.

## Available Skills

The `.claude/skills/` directory contains Apify Agent Skills for web scraping, lead generation, competitor intelligence, brand monitoring, e-commerce research, content analytics, influencer discovery, market research, trend analysis, and audience analysis.

## Environment

- The `.env` file contains the user's `APIFY_TOKEN` for authenticating with Apify's API.
- Use the `mcpc` CLI tool or the `run_actor.js` scripts in skill reference directories to execute Apify Actors.
- Always use `node --env-file=.env` when running scripts that need the API token.

## First Time?

If the user seems new, suggest they try a simple prompt like scraping Google Maps data for local businesses. Keep explanations concise and focus on getting results.
