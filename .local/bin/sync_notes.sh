#!/usr/bin/env bash

set -euo pipefail

INPUT_DIR="$HOME/Documents/Notes"
OUTPUT_DIR="$HOME/Projects/notes"

pushd "$OUTPUT_DIR" || exit 1

echo "Transfer notes to notes"

uv run transfer_notes.py --input-dir="$INPUT_DIR" --output-dir="$OUTPUT_DIR/notes" --skip-tags="job-hunt"

echo "Commit and push"

git add .
git commit -m "vault backup: $(date "+%Y-%m-%d %H:%M:%S")"
git push

# quartz

echo "Transfer notes to quartz"

uv run transfer_notes.py --input-dir="$INPUT_DIR" --output-dir="$HOME/Projects/quartz/content" --skip-tags="job-hunt"

pushd "$HOME/Projects/quartz" || exit 1

echo "Sync quartz"

npx quartz sync

popd || exit 1
