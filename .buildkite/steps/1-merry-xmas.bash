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
echo "Tell Santa your wishes, and when everyone is done"
echo "Santa’s helpers will let each of us know by email"
echo "who we received, their address, and a hint for what"
echo "they’d ❤️ for Christmas."
