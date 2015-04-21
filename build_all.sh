#!/usr/bin/env sh
set -e
bundle install
cd char_counter
cd ../tenis
bundle exec rake
