#!/usr/bin/env python3

"""This module generates a markdown table based on gzip json files
generated from MemGator.
"""

import argparse
import gzip
import json
from pathlib import Path


def main():
    """Generate markdown table based on MemGator files found within
    a directory.
    """
    parser = argparse.ArgumentParser(
        prog="MemGator-Markdown",
        description = "Generates a markdown table based on MemGator output."
    )

    parser.add_argument("directory", type=Path, help="Path to output files.")

    args = parser.parse_args()

    if not args.directory.is_dir():
        print("Invalid directory supplied.")
        return

    for file in args.directory.iterdir():
        if file.suffixes != [".json", ".gz"]:
            continue

        with gzip.open(file, 'r') as fin:
            try:
                jstr = json.loads(fin.read().decode('utf-8'))
                print(len(jstr['mementos']['list']))
            except json.decoder.JSONDecodeError:
                continue


    print("| Mementos | URI-Rs |")


if __name__ == "__main__":
    main()
