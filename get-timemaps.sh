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
    ./memgator-linux-amd64 \
        -a https://raw.githubusercontent.com/odu-cs432-websci/public/main/archives.json \
        -c "tgrif007@odu.edu" \
        -F 2 -f JSON -V "$line"
    sleep 30
done < $1
