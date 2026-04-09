#!/bin/bash

# repo-researcher/scripts/sync_repo.sh
# Syncs a GitHub repository to a local cache and outputs the absolute path.

REPO_INPUT=$1
CACHE_DIR="${HOME}/.gemini/cache/repos"

if [ -z "$REPO_INPUT" ]; then
  echo "Error: No repository provided. Usage: sync_repo.sh <owner/repo or URL>"
  exit 1
fi

# Normalize repo input to a directory name
# Handle both https://github.com/owner/repo.git and owner/repo
REPO_SLUG=$(echo "$REPO_INPUT" | sed -E 's|.*github.com/||' | sed -E 's|\.git$||' | sed 's|/|_|g')
TARGET_DIR="${CACHE_DIR}/${REPO_SLUG}"

mkdir -p "$CACHE_DIR"

if [ -d "$TARGET_DIR" ]; then
  # Already exists, update it
  (cd "$TARGET_DIR" && git pull --quiet)
else
  # Clone it
  # Ensure input is a URL for git clone
  if [[ ! "$REPO_INPUT" =~ ^http ]]; then
    REPO_URL="https://github.com/${REPO_INPUT}.git"
  else
    REPO_URL="$REPO_INPUT"
  fi
  git clone --quiet "$REPO_URL" "$TARGET_DIR"
fi

# Output the absolute path for the agent to use
realpath "$TARGET_DIR"
