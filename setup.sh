#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────
# AI That Works — Starter Kit Setup
# Sets up Claude Code + Apify Agent Skills on your machine.
# Supports macOS and Linux.
# ─────────────────────────────────────────────────────────────

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m' # No color

print_step() {
  echo ""
  echo -e "${ORANGE}▸${NC} ${BOLD}$1${NC}"
}

print_ok() {
  echo -e "  ${GREEN}✓${NC} $1"
}

print_fail() {
  echo -e "  ${RED}✗${NC} $1"
}

print_info() {
  echo -e "  ${DIM}$1${NC}"
}

# ─────────────────────────────────────────────────────────────
# Header
# ─────────────────────────────────────────────────────────────

echo ""
echo -e "${ORANGE}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${ORANGE}║${NC}  ${BOLD}AI That Works — Starter Kit Setup${NC}            ${ORANGE}║${NC}"
echo -e "${ORANGE}║${NC}  Claude Code + Apify Agent Skills             ${ORANGE}║${NC}"
echo -e "${ORANGE}╚═══════════════════════════════════════════════╝${NC}"

# ─────────────────────────────────────────────────────────────
# 1. Check OS
# ─────────────────────────────────────────────────────────────

print_step "Checking operating system..."

OS="$(uname -s)"
case "$OS" in
  Darwin)
    print_ok "macOS detected"
    ;;
  Linux)
    print_ok "Linux detected"
    ;;
  MINGW*|MSYS*|CYGWIN*)
    print_fail "Windows detected (native)"
    echo ""
    echo "    This setup script requires macOS or Linux."
    echo "    On Windows, please install WSL first:"
    echo "    https://learn.microsoft.com/en-us/windows/wsl/install"
    echo ""
    echo "    Then re-run this script inside WSL."
    exit 1
    ;;
  *)
    print_fail "Unknown OS: $OS"
    echo "    This script supports macOS and Linux."
    exit 1
    ;;
esac

# ─────────────────────────────────────────────────────────────
# 2. Check Node.js
# ─────────────────────────────────────────────────────────────

print_step "Checking Node.js..."

if ! command -v node &> /dev/null; then
  print_fail "Node.js is not installed"
  echo ""
  echo "    Install Node.js 18+ from: https://nodejs.org/"
  echo "    Or use a version manager like nvm:"
  echo "    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"
  echo "    nvm install --lts"
  exit 1
fi

NODE_VERSION=$(node --version | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
  print_fail "Node.js version is too old (v$(node --version))"
  echo "    Version 18 or higher is required."
  echo "    Download the latest LTS from: https://nodejs.org/"
  exit 1
fi

print_ok "Node.js $(node --version)"

# Also check npm
if ! command -v npm &> /dev/null; then
  print_fail "npm is not installed (should come with Node.js)"
  exit 1
fi

print_ok "npm $(npm --version)"

# ─────────────────────────────────────────────────────────────
# 3. Check / Install Claude Code
# ─────────────────────────────────────────────────────────────

print_step "Checking Claude Code..."

if command -v claude &> /dev/null; then
  print_ok "Claude Code is already installed"
  print_info "$(claude --version 2>/dev/null || echo 'version check skipped')"
else
  print_info "Claude Code not found — installing..."
  echo ""

  if [ "$OS" = "Darwin" ] || [ "$OS" = "Linux" ]; then
    curl -fsSL https://claude.ai/install.sh | bash
  fi

  # Reload PATH
  export PATH="$HOME/.claude/bin:$HOME/.local/bin:$PATH"

  if command -v claude &> /dev/null; then
    print_ok "Claude Code installed successfully"
  else
    print_fail "Claude Code installation may need a terminal restart"
    echo "    Close and reopen your terminal, then run this script again."
    echo "    Or install manually: curl -fsSL https://claude.ai/install.sh | bash"
    exit 1
  fi
fi

# ─────────────────────────────────────────────────────────────
# 4. Check / Set Apify API Token
# ─────────────────────────────────────────────────────────────

print_step "Checking Apify API token..."

ENV_FILE="$(pwd)/.env"

# Check if token already exists in .env or environment
if [ -f "$ENV_FILE" ] && grep -q "APIFY_TOKEN=" "$ENV_FILE" 2>/dev/null; then
  EXISTING_TOKEN=$(grep "APIFY_TOKEN=" "$ENV_FILE" | head -1 | cut -d= -f2 | tr -d ' "'"'"'')
  if [ -n "$EXISTING_TOKEN" ] && [ "$EXISTING_TOKEN" != "your_apify_api_token_here" ]; then
    print_ok "Apify token found in .env"
  else
    print_info "Token placeholder found — need your real token"
    NEED_TOKEN=true
  fi
elif [ -n "${APIFY_TOKEN:-}" ]; then
  print_ok "Apify token found in environment"
  # Write it to .env for skill scripts
  echo "APIFY_TOKEN=$APIFY_TOKEN" > "$ENV_FILE"
  print_info "Saved to .env"
else
  NEED_TOKEN=true
fi

if [ "${NEED_TOKEN:-false}" = true ]; then
  echo ""
  echo "    Your Apify API token is needed for the skills to work."
  echo "    Get it from: https://console.apify.com/account/integrations"
  echo ""
  read -rp "    Paste your Apify API token: " USER_TOKEN

  if [ -z "$USER_TOKEN" ]; then
    print_fail "No token entered — you can add it later to .env"
    cp -n "$(pwd)/.env.example" "$ENV_FILE" 2>/dev/null || true
  else
    echo "APIFY_TOKEN=$USER_TOKEN" > "$ENV_FILE"
    print_ok "Token saved to .env"
  fi
fi

# ─────────────────────────────────────────────────────────────
# 5. Install Apify Agent Skills (interactive — 4 core skills)
# ─────────────────────────────────────────────────────────────

print_step "Installing Apify Agent Skills (core)..."
echo ""
echo -e "  A skill picker will appear with 4 skills."
echo -e "  Press ${ORANGE}a${NC} to select all, then ${ORANGE}Enter${NC} to confirm."
echo ""
echo -e "  ${DIM}The 4 core skills:${NC}"
echo -e "  ${DIM}  • apify-ultimate-scraper    — Scrape 55+ platforms${NC}"
echo -e "  ${DIM}  • apify-actor-development   — Build & deploy Actors${NC}"
echo -e "  ${DIM}  • apify-actorization        — Convert code to Actors${NC}"
echo -e "  ${DIM}  • apify-generate-output-schema — Generate Actor schemas${NC}"
echo ""

npx skills add apify/agent-skills

echo ""
print_ok "Apify Agent Skills installed"

# ─────────────────────────────────────────────────────────────
# 6. Install Awesome Skills (9 use-case skills → .claude/skills/)
# ─────────────────────────────────────────────────────────────

print_step "Installing Apify Awesome Skills (use cases)..."

SKILLS_DIR="$(pwd)/.claude/skills"
TEMP_DIR=$(mktemp -d)

print_info "Cloning apify/awesome-skills..."

git clone --quiet https://github.com/apify/awesome-skills.git "$TEMP_DIR/awesome-skills"

# Create .claude/skills if it doesn't exist
mkdir -p "$SKILLS_DIR"

# Copy each skill folder into .claude/skills/
SKILL_COUNT=0
for skill_dir in "$TEMP_DIR/awesome-skills/skills/"*/; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    cp -r "$skill_dir" "$SKILLS_DIR/$skill_name"
    SKILL_COUNT=$((SKILL_COUNT + 1))
    print_ok "$skill_name"
  fi
done

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo ""
print_ok "$SKILL_COUNT awesome skills installed to .claude/skills/"

# ─────────────────────────────────────────────────────────────
# 7. Install mcpc CLI tool
# ─────────────────────────────────────────────────────────────

print_step "Installing mcpc CLI tool..."

if command -v mcpc &> /dev/null; then
  print_ok "mcpc is already installed"
else
  npm install -g @apify/mcpc
  print_ok "mcpc installed"
fi

# ─────────────────────────────────────────────────────────────
# 8. Summary
# ─────────────────────────────────────────────────────────────

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}  ${BOLD}${GREEN}Setup complete!${NC}                               ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════╝${NC}"
echo ""
echo "  What's ready:"
echo -e "  ${GREEN}✓${NC} Claude Code"
echo -e "  ${GREEN}✓${NC} Apify Agent Skills (4 core via npx skills)"
echo -e "  ${GREEN}✓${NC} Apify Awesome Skills ($SKILL_COUNT use-case skills in .claude/skills/)"
echo -e "  ${GREEN}✓${NC} mcpc CLI tool"
echo -e "  ${GREEN}✓${NC} Environment configured"
echo ""
echo -e "  ${BOLD}To get started:${NC}"
echo ""
echo -e "    ${ORANGE}claude${NC}"
echo ""
echo "  Then try this prompt:"
echo ""
echo -e "    ${DIM}Find 50 coffee shops in Austin, TX with at least${NC}"
echo -e "    ${DIM}4 stars on Google Maps. Get their name, address,${NC}"
echo -e "    ${DIM}phone, website, rating, and review count. Export CSV.${NC}"
echo ""
echo -e "  More prompts in: ${BOLD}first-prompt.md${NC}"
echo ""
