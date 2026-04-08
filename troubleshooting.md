# Troubleshooting

Common issues and how to fix them.

---

## "command not found: claude"

Claude Code isn't in your PATH. Try:

```bash
# Re-run the installer
curl -fsSL https://claude.ai/install.sh | bash

# Restart your terminal (or source your profile)
source ~/.bashrc   # or ~/.zshrc on macOS
```

If you installed via npm instead: `npm install -g @anthropic-ai/claude-code`

---

## "APIFY_TOKEN not set" or skills fail to run Actors

Your Apify API token isn't configured. Fix it:

1. Get your token from [console.apify.com/account/integrations](https://console.apify.com/account/integrations)
2. Add it to your `.env` file:
   ```
   APIFY_TOKEN=apify_api_your_token_here
   ```
3. Make sure you're running Claude Code from inside this project directory

---

## "Node.js version too old"

The Apify skill scripts require Node.js 18+ (for the `--env-file` flag). Check your version:

```bash
node --version
```

If it's below v18, update:

- **macOS/Linux with nvm:** `nvm install --lts`
- **Direct download:** [nodejs.org](https://nodejs.org/)
- **Homebrew (macOS):** `brew install node`

---

## Skills aren't loading / Claude doesn't use the right skill

Make sure you're running `claude` from inside this project directory (where `.claude/skills/` exists). Claude Code reads skills relative to your current directory.

```bash
cd ai-that-works-starter-kit
claude
```

If skills were installed but the directory looks empty:

```bash
# Re-install skills
npx skills add apify/agent-skills
```

---

## "mcpc: command not found"

The `mcpc` CLI tool isn't installed globally. Install it:

```bash
npm install -g @apify/mcpc
```

---

## Claude Code asks me to log in

On first launch, Claude Code opens a browser for authentication. If the browser doesn't open:

1. Press `c` in the terminal to copy the login URL
2. Paste it into your browser manually
3. Sign in with your Anthropic account (Pro, Max, Team, or Enterprise)

---

## Setup script fails on Windows

The setup script only supports macOS and Linux. On Windows:

1. Install [WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/windows/wsl/install)
2. Open a WSL terminal
3. Follow the setup steps from there — everything works the same as Linux

---

## Still stuck?

- [Claude Code docs](https://docs.claude.com/en/docs/claude-code)
- [Apify docs](https://docs.apify.com/)
- Ask in the AI That Works community or raise your hand at the event!
