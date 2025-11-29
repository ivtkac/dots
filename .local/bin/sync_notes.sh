#!/usr/bin/env bash

set -euo pipefail

INPUT_DIR="$HOME/Documents/Notes"
OUTPUT_DIR="$HOME/Projects/quartz"

pushd "$OUTPUT_DIR" || exit 1

echo "Transfer notes to quartz"

rsync -av --delete --exclude={'journal','private','templates','bases','.obsidian','.git'} "$INPUT_DIR"/* "$OUTPUT_DIR"/content/

echo "Sync quartz"

npx quartz sync

popd || exit 1
