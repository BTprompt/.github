#!/usr/bin/env bash
# Stage everything, commit, and push to main.
# Usage: ./push.sh "commit message"
# If no message is given, uses a timestamped default.
set -e

cd "$(dirname "$0")"

MSG="${1:-Update portfolio content ($(date '+%Y-%m-%d %H:%M'))}"

git add -A
if git diff --cached --quiet; then
  echo "Nothing staged — already up to date."
else
  git commit -m "$MSG"
fi

git pull --rebase origin main
git push origin main
