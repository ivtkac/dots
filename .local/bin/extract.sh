#!/bin/bash

set -euo pipefail

### COLORS ###
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

# Check archive type
is_archive() {
  case $(file --mime-type -b "$1") in
    application/gzip|application/x-tar|application/zip|application/x-rar|application/x-7z-compressed)
      return 0
      ;;
    *) return 1 ;;
  esac
}

# Extract archive based on mime type
extract() {
  local archive="$1"
  local mime
  mime="$(file --mime-type -b "$archive")"
  local out

  >&2 echo -e "${BLUE} Detected: $mime${RESET}"

  case "$mime" in
    application/gzip)
      out="${archive%.*}"
      gunzip -c "$archive" > "$out"
      ;;
    application/x-tar)
      tar -xf "$archive"
      out=$(tar -tf "$archive" | head -n1)
      ;;
    application/zip)
      unzip -o "$archive" >/dev/null
      out=$(unzip -l "$archive" | awk 'NR==4 { print $4 }')
      ;;
    application/x-rar)
      unrar x -o+ "$archive" >/dev/null
      out=$(unrar lb "$archive" | head -n1)
      ;;
    application/x-7z-compressed)
      7z x -y "$archive" >/dev/null
      out=$(7z l "$current_file" | awk '/^[ ]+[0-9]+/ {print $NF; exit}')
      ;;
    *)
      echo -e "${RED} Unsupported archive type: $mime${RESET}"
      exit 1
      ;;
  esac

  echo "$out"
}

### Script starts here ###
if [[ $# -ne 1 ]]; then
  echo "Usage: $(basename "$0") <archive>"
  exit 1
fi

archive="$1"
if [ ! -f "$archive" ]; then
  echo -e "${RED} Error: '$archive' is not a valid file.${RESET}"
  exit 1
fi

WORKDIR=$(mktemp -d "./extracted-XXX" )

cp "$archive" "$WORKDIR/"
cd "$WORKDIR"

echo -e "\n${GREEN} 🚀 Starting extraction…${RESET}"

current_file="$(basename "$archive")"
if ! is_archive "$current_file"; then
  echo -e "${YELLOW} Looks like it's not archive. Bye!${RESET}"
  exit 2
fi

while is_archive "$current_file"; do
  next_file=$(extract "$current_file")
  echo -e "${YELLOW} Extracted ${RED} $current_file${RESET}"

  rm -f "$current_file"

  if [[ -n "$next_file" && -f "$next_file" ]]; then
    if is_archive "$next_file"; then
        echo -e "${YELLOW} Found nested archive: ${RED} $next_file${RESET}"
        current_file="$next_file"
    fi
  else
    echo -e "${YELLOW} No further nested archives found or identified.${RESET}"
    break
  fi
done

echo -e "${GREEN} ✅ Done!${RESET}"
echo -e "\n Extracted files are in ${BLUE} $(pwd)/${RESET}"
