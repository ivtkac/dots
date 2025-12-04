#!/usr/bin/env bash

set -euo pipefail

INPUT_DIR="$HOME/Documents/Notes"
SCRIPT_DIR="$HOME/Projects/notes"
OUTPUT_DIR="$HOME/Projects/quartz/content"

pushd "$SCRIPT_DIR" || exit 1

echo "Transfer notes to quartz..."

uv run transfer_notes.py --input-dir="$INPUT_DIR" --output-dir="$OUTPUT_DIR" --skip-tags="private"

echo "Copy attachments..."

cp -rf "$INPUT_DIR/attachments" "$OUTPUT_DIR/attachments"

pushd "$OUTPUT_DIR/.." || exit 1

echo "Sync quartz..."

npx quartz sync --no-pull

popd || exit 1
