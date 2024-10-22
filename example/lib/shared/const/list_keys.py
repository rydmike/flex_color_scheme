#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This script extracts all the keys from the store.dart file
# and prints them in a format that can be copied and pasted into
# a Dart list called Storage.storageKeys in store.dart.

import re

def extract_keys(file_path):
    with open(file_path, 'r') as file:
        content = file.read()

    regex = re.compile(r'^\s*static const String (key\w+) =\s*\'[^\']*\'\s*;', re.MULTILINE | re.DOTALL)
    matches = regex.findall(content)

    for match in matches:
        print(f"{match},")

if __name__ == "__main__":
    extract_keys('store.dart')