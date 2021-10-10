#!/bin/bash

BRANCH=$1

git clone https://github.com/flutter/flutter.git --depth 1 -b $BRANCH $HOME/_flutter
echo "$HOME/_flutter/bin" >> $GITHUB_PATH
