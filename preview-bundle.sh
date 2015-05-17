#!/bin/bash

cd -P "$(dirname "${BASH_SOURCE[0]}")"
bundle exec jekyll serve --watch

