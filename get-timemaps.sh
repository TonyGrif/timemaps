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

if [[ ! -d "timemaps/logs" ]]; then
    echo "Creating logs directory"
    mkdir timemaps/logs
fi

echo "Hash,URI" > timemaps/Keys.csv

while read line; do
    md5=`echo -n "$line" | md5sum | awk '{print $1}'`
    echo "${md5},${line}" >> timemaps/Keys.csv

    ./memgator-linux-amd64 \
        -a https://raw.githubusercontent.com/odu-cs432-websci/public/main/archives.json \
        -b "timemaps/logs/benchmarks.txt" \
        -c "tgrif007@odu.edu" \
        -F 2 \
        -f JSON \
        -l "timemaps/logs/info.txt" \
        "$line" \
        > "timemaps/${md5}.json"
    sleep 30
done < $1
