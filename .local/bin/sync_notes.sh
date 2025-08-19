#!/usr/bin/env bash

set -euo pipefail

NOTES_DIR="${NOTES_DIR:-$HOME/Documents/Notes}"
VAULT_DIR="${VAULT_DIR:-$HOME/Documents/Vault}"

rsync -av --include="*/" --include="*.md" --exclude="*" "$NOTES_DIR/notes/" "$VAULT_DIR/"

rsync -av "$NOTES_DIR/_attachments/" "$VAULT_DIR/_attachments/"

pushd "$VAULT_DIR" || exit 1

git add .
git commit -m "vault backup: $(date "+%Y-%m-%d %H:%M:%S")"
git push

popd || exit 1
