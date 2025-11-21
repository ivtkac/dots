#!/usr/bin/env bash

set -euo pipefail

INPUT_DIR="$HOME/Documents/Notes"
OUTPUT_DIR="$HOME/Projects/notes"

pushd "$OUTPUT_DIR" || exit 1

uv run transfer_notes.py --input-dir="$INPUT_DIR" --output-dir="$OUTPUT_DIR/notes" --skip-tags=sexuality

git add .
git commit -m "vault backup: $(date "+%Y-%m-%d %H:%M:%S")"
git push

popd || exit 1
