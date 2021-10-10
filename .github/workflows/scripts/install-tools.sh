#!/bin/bash

flutter config --no-analytics
echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH
echo "$HOME/_flutter/.pub-cache/bin" >> $GITHUB_PATH
echo "$HOME/_flutter/bin/cache/dart-sdk/bin" >> $GITHUB_PATH
flutter pub get
