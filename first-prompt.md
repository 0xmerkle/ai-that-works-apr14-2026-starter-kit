# First Prompts — Try These in Claude Code

Open Claude Code (`claude`) in this directory and paste any of these prompts. Each one uses a different Apify Agent Skill.

---

## Lead Generation

```
Find 50 coffee shops in Austin, TX with at least 4 stars on Google Maps.
Get their name, address, phone number, website, rating, and review count.
Export as CSV.
```

## Competitor Intelligence

```
Compare these 3 Austin co-working spaces: Capital Factory, WeWork Austin,
and Industrious Austin. Scrape their Google Maps reviews and ratings.
Summarize what customers love and hate about each one.
```

## Brand Monitoring

```
Monitor what people are saying about Franklin Barbecue in Austin.
Scrape their latest Google Maps reviews. Run sentiment analysis and
tell me if the vibe is shifting — are people still as enthusiastic?
```

## E-Commerce Research

```
I'm launching a hot sauce brand in Austin. Search Amazon for the top 20
best-selling hot sauces. Get their prices, ratings, review counts, and
the most common complaints from 1-star reviews.
```

## Content Analytics

```
Analyze the last 30 posts from @visitaustin on Instagram. Which content
types get the most engagement? What posting times work best?
```

## Influencer Discovery

```
Find 15 Austin-based food and lifestyle influencers on Instagram with
10k-100k followers. Get their engagement rate, average likes, and
posting frequency.
```

## Market Research

```
I want to open a yoga studio in Austin. How many yoga studios are there,
what are their ratings, and what neighborhoods are underserved?
Use Google Maps data.
```

## Trend Analysis

```
What are the trending topics in Austin's tech scene? Check Google Trends
for "Austin AI", "Austin startups", and "Austin tech jobs" over the
last 90 days.
```

## Audience Analysis

```
Analyze the audience of @saboratx on Instagram. Who's engaging with
their content? What are the peak engagement times and what content
themes get the most interaction?
```

---

Each prompt maps to a skill in `.claude/skills/`. Claude Code picks the right one automatically.
