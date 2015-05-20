#!/bin/bash

# If you plan to deploy your blog on GitHub, use this wrapper script to
# ensure your previewing environment matches that of GitHub. You might 
# want to do `bundle install` first.

cd -P "$(dirname "${BASH_SOURCE[0]}")"
bundle exec jekyll serve --watch "$@"

