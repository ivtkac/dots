#!/bin/bash
#
# Extract nested archives based on mime type
# Supports: tar, tar.gz, tar.xz, zip, rar, 7z, gzip

set -euo pipefail
IFS=$'\n\t'

declare -r SCRIPT_NAME="${0##*/}"
declare -r VERSION="1.0"

declare -r GREEN='\033[0;32m'
declare -r RED='\033[0;31m'
declare -r YELLOW='\033[0;33m'
declare -r CYAN='\033[0;36m'
declare -r RESET='\033[0m'

declare -r SUPPORTED_FORMATS=(
    "application/gzip"
    "application/x-tar"
    "application/zip"
    "application/x-rar"
    "application/x-7z-compressed"
    "application/x-bzip2"
    "application/x-xz"
)

log() {
    local level="$1"
    shift

    case "$level" in
    "INFO") [[ "$verbose" = true ]] && echo -e "${GREEN}[INFO]${RESET} $*" ;;
    "WARN") echo -e "${YELLOW}[WARN]${RESET} $*" >&2 ;;
    "ERROR") echo -e "${RED}[ERROR]${RESET} $*" >&2 ;;
    "DEBUG") [[ "$verbose" = true ]] && echo -e "${CYAN}[DEBUG]${RESET} $*" ;;
    esac
}

check_deps() {
    local tools=("file" "tar" "gzip" "gunzip")
    local optional_tools=("unzip" "unrar" "7z" "xz" "bzip2")
    local missing=()

    for tool in "${tools[@]}"; do
        if ! command -v "$tool" &>/dev/null; then
            missing+=("$tool")
        fi
    done

    if [[ "${#missing[@]}" -gt 0 ]]; then
        log "ERROR" "Missing required dependencies: ${missing[*]}"
        exit 1
    fi

    for tool in "${optional_tools[@]}"; do
        if ! command -v "$tool" &>/dev/null; then
            log "WARN" "Optional tool not found: $tool"
        fi
    done
}

is_archive() {
    local file="$1"
    local mime_type

    [[ -f "$file" ]] || return 1

    mime_type="$(file --mime-type -b "$file" 2>/dev/null)" || return 1

    for supported_format in "${SUPPORTED_FORMATS[@]}"; do
        [[ "$mime_type" == "$supported_format" ]] && return 0
    done

    return 1
}

extract() {
    local archive="$1"
    local mime_type out_file

    mime_type="$(file --mime-type -b "$archive" 2>/dev/null)"

    >&2 log "INFO" "Detected MIME type '${mime_type}'"

    case "$mime_type" in
    application/gzip)
        if [[ "$archive" == *.tar.gz || "$archive" == *.tgz ]]; then
            tar -xzf "$archive" || return 1
            out_file=$(tar -tf "$archive" 2>/dev/null | head -1)
        else
            if [[ "$archive" == *.* && "${archive%.*}" != "" ]]; then
                out_file="${archive%.*}"
            else
                out_file="$(basename "$archive").out"
            fi
            gunzip -c "$archive" >"$out_file" || return 1
        fi
        ;;
    application/x-tar)
        tar -xf "$archive" || return 1
        out_file=$(tar -tf "$archive" 2>/dev/null | head -1)
        ;;
    application/x-xz)
        if [[ "$archive" == *.tar.xz || "$archive" == *.txz ]]; then
            tar -xJf "$archive" || return 1
            out_file="${archive%.*}"
        else
            xz -dc "$archive" >"${archive%.xz}" || return 1
            out_file="${archive%.xz}"
        fi
        ;;
    application/x-bzip2)
        if [[ "$archive" == *.tar.bz2 || "$archive" == *.tbz2 ]]; then
            tar -xjf "$archive" || return 1
            out_file="${archive%.*}"
        else
            bzip2 -dc "$archive" >"${archive%.bz2}" || return 1
            if [[ "$archive" == "*.bz2" ]]; then
                out_file="${archive%.bz2}"
            else
                out_file="$(basename "$archive" .bz2).out"
            fi
        fi
        ;;
    application/zip)
        if ! command -v unzip >/dev/null 2>&1; then
            log "ERROR" "unzip command not found"
            return 1
        fi
        unzip -o "$archive" >/dev/null 2>&1 || return 1
        out_file=$(unzip -l "$archive" 2>/dev/null | awk 'NR==4 { print $4 }')
        ;;
    application/x-rar)
        if ! command -v unrar >/dev/null 2>&1; then
            log "ERROR" "unrar command not found"
            return 1
        fi
        unrar x -o+ "$archive" || return 1
        out_file=$(unrar lb "$archive" | head -n1)
        ;;
    application/x-7z-compressed)
        if ! command -v 7z >/dev/null 2>&1; then
            log "ERROR" "7z command not found"
            return 1
        fi
        7z x -y "$archive" || return 1
        out_file=$(7z l "$archive" | awk '/^[ ]+[0-9]+/ {print $NF; exit}')
        ;;
    *)
        log "ERROR" "Unsupported archive format: $mime_type"
        return 1
        ;;
    esac

    echo "$out_file"
}

usage() {
    cat <<EOF
$SCRIPT_NAME - Extracts files from archives.

Usage:
    $SCRIPT_NAME [OPTIONS] <archive>

OPTIONS:
    -h, --help          Display this help message and exit
    -v, --verbose       Enable verbose mode
    -o, --output DIR    Specify output directory
    -k, --keep-original Keep the original archive file
    -V, --version       Display version information and exit

SUPPORTED FORMATS:
    tar, tar.gz, tar.bz2, tar.xz, gz, bz2, xz, zip, rar, 7z
EOF
}

process_archive() {
    local archive="$1"
    local current_file="$archive"
    local next_file

    log "INFO" "🚀 Starting extraction…"

    if [[ "$output_dir" != "$(dirname "$current_file")" ]]; then
        keep_original=false
    fi

    while is_archive "$current_file"; do
        next_file=$(extract "$current_file")

        log "INFO" "Extracting  $current_file"

        if [[ "$current_file" != "$archive" ]] || [[ "$keep_original" = false ]]; then
            rm -f "$current_file"
            log "DEBUG" "Removed '$current_file'"
        fi

        if [[ -n "$next_file" && -f "$next_file" ]]; then
            if is_archive "$next_file"; then
                log "INFO" "Found nested archive  $next_file"
                current_file="$next_file"
            else
                log "INFO" "No further extraction needed"
                break
            fi
        else
            log "INFO" "No further nested archives found"
            break
        fi
    done
}

args=()
verbose=false
output_dir=""
keep_original=false

while [[ $# -gt 0 ]]; do
    case "$1" in
    -h | --help)
        usage
        exit
        ;;
    -V | --version)
        echo "$SCRIPT_NAME - Extracts files from archives."
        echo "Version: $VERSION"
        exit
        ;;
    -v | --verbose)
        verbose=true
        shift
        ;;
    -o | --output)
        if [[ $# -lt 2 ]] || [[ "$2" == -* ]]; then
            log "ERROR" "--output requires a directory as argument"
        fi
        output_dir="$2"
        shift 2
        ;;
    -k | --keep-original)
        keep_original=true
        shift
        ;;
    --)
        shift
        break
        ;;
    -*)
        log "ERROR" "Unknown option: $1"
        exit 1
        ;;
    *)
        args+=("$1")
        shift
        ;;
    esac
done

while [[ $# -gt 0 ]]; do
    args+=("$1")
    shift
done

if [[ ${#args[@]} -eq 0 ]]; then
    log "ERROR" "Archive file not specified"
    exit 1
elif [[ ${#args[@]} -gt 1 ]]; then
    log "ERROR" "Too many arguments. Expected only one archive file"
fi

archive="${args[0]}"

if [[ ! -f "$archive" ]]; then
    log "ERROR" "'$archive' is not a valid file"
    exit 1
fi

check_deps

output_dir="${output_dir:-$(dirname "$archive")}"

if [[ -f "$output_dir" ]]; then
    log "ERROR" "'$output_dir' is a file, not a directory"
    exit 1
elif [[ ! -d "$output_dir" ]]; then
    log "INFO" "Creating output directory '$output_dir'"
    mkdir -p "$output_dir" || {
        log "ERROR" "Failed to create output directory '$output_dir'"
        exit 1
    }
elif [[ ! -w "$output_dir" ]]; then
    log "ERROR" "Output directory '$output_dir' is not writable"
    exit 1
fi

if ! is_archive "$archive"; then
    log "ERROR" "'$archive' is not a supported archive format"
    exit 1
fi

archive_name="$(basename "$archive")"
work_archive="$output_dir/$archive_name"

if [[ "$archive" -ef "$work_archive" ]]; then
    cd "$output_dir"
    process_archive "$archive"
else
    log "DEBUG" "Copying archive to work directory"
    cp "$archive" "$work_archive" || {
        log "ERROR" "Failed to copy '$archive' to '$work_archive'"
        exit 1
    }

    cd "$output_dir"
    process_archive "$archive"

    if [[ "$keep_original" = false ]]; then
        rm -f "$work_archive"
    fi
fi

log "INFO" "Extracted files are in   $(pwd)/"
