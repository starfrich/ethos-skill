#!/bin/sh
set -e

# Detect OS and set default skills directory
if [ -n "$CLAUDE_SKILLS_DIR" ]; then
  SKILLS_DIR="$CLAUDE_SKILLS_DIR"
elif [ "$(uname -s 2>/dev/null)" = "Darwin" ] || [ "$(uname -s 2>/dev/null)" = "Linux" ]; then
  SKILLS_DIR="$HOME/.claude/skills"
else
  # Windows (Git Bash / MSYS2)
  SKILLS_DIR="$USERPROFILE/.claude/skills"
fi

SKILL_DIR="$SKILLS_DIR/ethos-network"

echo "Installing ethos-network skill to $SKILL_DIR..."

if [ -d "$SKILL_DIR" ]; then
  echo "Updating existing installation..."
  git -C "$SKILL_DIR" pull
else
  mkdir -p "$SKILLS_DIR"
  git clone https://github.com/starfrich/ethos-network "$SKILL_DIR"
fi

echo "Done. Use /ethos-network in Claude Code to activate the skill."
