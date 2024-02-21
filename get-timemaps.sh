#!/usr/bin/env bash

#  ███████████
# ░█░░░███░░░█
# ░   ░███  ░   ██████  ████████   █████ ████
#     ░███     ███░░███░░███░░███ ░░███ ░███
#     ░███    ░███ ░███ ░███ ░███  ░███ ░███
#     ░███    ░███ ░███ ░███ ░███  ░███ ░███
#     █████   ░░██████  ████ █████ ░░███████
#    ░░░░░     ░░░░░░  ░░░░ ░░░░░   ░░░░░███
#                                   ███ ░███
#                                  ░░██████
#                                   ░░░░░░
#
# Requirements:
#   MemGator (https://github.com/oduwsdl/MemGator)

if [[ ! -d "timemaps" ]]; then
    echo "Creating timemaps directory"
    mkdir timemaps
fi

while read line; do
    echo "$line"
done < $1
