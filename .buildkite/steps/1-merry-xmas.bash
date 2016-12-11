#!/bin/bash

set -eu

function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

buildkite-agent artifact upload secret-santa.gif

echo "+++ :christmas_tree::christmas_tree::christmas_tree::christmas_tree::christmas_tree::christmas_tree:"

inline_image 'artifact://secret-santa.gif' 'Buildkite Secret Santa 2016'

echo
echo "Welcome to the Buildkite Secret Santa! 👋"
echo
echo "Tell Santa your wishes, and when everyone is done Santa’s helpers will"
echo "notify you to tell you who you received, and a hint for what they’d like"
echo "for Christmas."

