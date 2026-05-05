#!/bin/bash

OPTIND=1
log_dir="/var/log"
out_dir="/var/log"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_NAME="log_archive_$TIMESTAMP.tar.gz"

while getopts "hl:o:" opt; do
    case $opt in
        h)
            echo "Usage: $0 [-l log_dir] [-o out_dir]"
            exit 0
            ;;
        l) log_dir="$OPTARG" ;;
        o) out_dir="$OPTARG" ;;
        \?)
            echo "Usage: $0 [-l log_dir] [-o out_dir]"
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

mkdir -p "$out_dir/archive"

tar --exclude="$out_dir/archive" -zcvf "$out_dir/archive/$LOG_NAME" "$log_dir"

echo "$TIMESTAMP - $LOG_NAME" >> "$out_dir/archive/log_archive.log"
