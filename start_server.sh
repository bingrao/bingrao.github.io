#!/bin/sh
rm Gemfile.lock
rm -fr _site
bundle exec jekyll serve --trace --no-watch
