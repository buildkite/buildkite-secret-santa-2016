#!/bin/bash

set -euo pipefail

# Embed an image in console output
function inline_image { printf "\033]1338;url=%s;alt=%s\a\n" "$1" "$2"; }

# Color functions
function c_red   { printf "\033[31m"; }
function c_reset { printf "\033[0m";  }

echo "+++ :christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree:"

inline_image 'artifact://pipeline/secret-santa.gif' 'Buildkite Secret Santa 2016'

./pipeline/xmas-tree.bash

cat <<WELCOME

               $(c_red)Welcome to the Buildkite Secret Santa$(c_reset) 👋

          Tell Santa your wishes. And when everyone is done,
             Santa’s magical unicorns will let each of us
              know by email who we received, and a hint
                for what they’d $(c_red)<3$(c_reset) for Christmas 🦄
WELCOME
