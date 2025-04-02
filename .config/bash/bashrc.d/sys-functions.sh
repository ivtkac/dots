#!/usr/bin/env bash

# Exraction file
ex() {
  if [ -f "$1" ]; then
    ext=$(file --mime-type -b "$1")

    case "$ext" in
      application/x-bzip2) bunzip2 "$1" ;;
      application/x-gzip) gunzip "$1" ;;
      application/x-tar) tar xf "$1" ;;
      application/zip) unzip "$1" ;;
      application/x-7z-compressed) 7za x "$1" ;;
      application/x-rar) unrar x "$1" ;;
      application/x-xz) tar xf "$1" ;;
      application/vnd.debian.binary-package) ar x "$1" ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Sort top process
pssort() {
    local sort_option=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --mem)      
                [[ -z "$sort_option" ]] && sort_option="-%mem" || sort_option+=",-%mem" ;;
            --cpu) 
                [[ -z "$sort_option" ]] && sort_option="-%cpu" || sort_option+=",-%cpu" ;;
            -h|--help)
                echo '
                Usage: pssort [OPTIONS]
                    --mem   Sort by memory usage
                    --cpu   Sort by cpu usage
                '
                return 0 ;;
            *) 
                echo "Invalid option: $1"
                return 1 ;;
        esac
        shift
    done

    if [[ -z "$sort_option" ]]; then
       echo "Usage: pssort [--mem] [--cpu]"
       return 1 
    fi

    ps -eo pid,ppid,cmd,%mem,%cpu --sort="$sort_option" | head
}

find_large() {
  if [ -z "$1" ]; then
    echo "Please provide a size threshold in MB."
    return 1
  fi

  find . -type f -size +"$1"M -exec ls -lh {} \; | awk '{print $9 ": " $5}'
}
