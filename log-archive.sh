#!/bin/bash

OPTIND=1
log_dir="/var/log"
out_dir=$(pwd)

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_NAME="log_archive_$TIMESTAMP.tar.gz"

while getopts "h?:l:o:" opt; do
    case $opt in
        h|\?)
            echo "Usage: $0 [-l log_dir] [-o out_dir]"
            exit 0
            ;;
        l) log_dir="$OPTARG" ;;
        o) out_dir="$OPTARG" ;;
        \?) echo "Invalid option: -$OPTARG" >&2 ;;
    esac
done

tar -zcvf "$out_dir/$LOG_NAME" "$log_dir"
