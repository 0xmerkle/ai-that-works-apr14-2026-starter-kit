# Build Your Own Skill

Want to create a skill from scratch for your own workflow? This guide walks you through it.

A **skill** is a markdown file that teaches Claude Code how to do a specific task. The skills you already used (lead generation, competitor intel, etc.) are all just SKILL.md files with step-by-step instructions. You can build your own.

---

## How it works

Anthropic recommends a simple process: **do the task first, then capture the pattern.**

1. You describe a task you do repeatedly
2. Claude interviews you to understand the full workflow
3. Claude finds the right Apify Actors (data tools) for each step
4. Claude writes the skill and shows it to you
5. You approve it, Claude saves it, you test it immediately

The whole process takes 10-15 minutes.

---

## The Prompt

Copy and paste this into Claude Code:

```
I want you to help me build a skill — a reusable set of instructions that teaches you how to do a specific task for me using tools from the Apify platform (apify.com/store).

Here's how this should work:

**Step 1 — Understand my problem**
Ask me what I'm trying to accomplish. I'll describe it the way I'd describe it to a coworker. Ask follow-up questions to understand:
- What I'm doing manually today (the full process, step by step)
- Where I'm getting information from (which platforms, websites, sources)
- What criteria or decisions I'm making along the way
- What the end result looks like (spreadsheet, report, list, etc.)
- How often I do this and whether it changes per project/client

Keep asking until you can summarize my full workflow back to me. Once you do, I'll confirm or correct it before we move on.

**Step 2 — Find the right tools**
Based on my workflow, search the Apify Store (apify.com/store) to find Actors that handle the data collection parts. For each Actor you recommend, tell me what it does and why it fits. Just the ones that matter — don't overwhelm me.

**Step 3 — Design the skill**
Take my confirmed workflow and the Actors you found, and design a skill that:
- Has a clear, numbered process you can follow every time
- Asks me the minimum questions needed at the start (what changes per use — like the niche, location, brand)
- Knows which Actor to use for which step
- Handles errors gracefully (no results, missing token, etc.)
- Outputs results in the format I described
- Is testable immediately with a single natural language request

**Step 4 — Show me the skill**
Show me the complete SKILL.md file inline. It should have:
- YAML frontmatter with a name and specific description
- A structured workflow with numbered steps
- Actor routing (which Actor for which task)
- Input parameters (what I provide each time)
- Output format (what gets delivered)
- Error handling

Don't save anything yet. Walk me through what you built and why.

**Step 5 — Save and test**
Once I approve it (or after any edits), save it to .claude/skills/[skill-name]/SKILL.md and tell me exactly what to type to try it out.

---

Important:
- Don't ask me to confirm at every step. Interview me, summarize once, then build.
- If I'm vague, ask me to clarify. Don't guess.
- Keep the skill under 500 lines — concise is better.
- This should feel like working with a smart colleague, not filling out a form.
```

---

## After you build it

Once your skill is saved, test it by giving Claude Code a natural language request that should trigger it. For example, if you built a skill for finding podcast guests, just type:

```
Find me 10 potential podcast guests in the AI/ML space with audiences over 5K.
```

If it works — great, you just automated a workflow. If something's off, tell Claude what to fix and it'll update the skill. The best skills come from iterating: run it, see what's wrong, improve it, repeat.

---

## Tips from the community

- **Start specific, not general.** A skill that does one thing well is better than one that tries to do everything. "Find Instagram influencers in a niche" beats "do all my marketing."
- **The description matters.** Claude uses the description to decide when to trigger a skill. Include what it does AND when to use it: "Finds and vets Instagram influencers for brand partnerships. Use when the user asks about influencer discovery, creator outreach, or brand ambassadors."
- **Skills are folders, not files.** If your skill grows complex, split it into SKILL.md (the main instructions) plus reference files that Claude loads on demand. Keep SKILL.md as the overview.
- **Iterate, don't perfect.** The first version won't be perfect. Run it 3 times, improve each time. That's the process.
