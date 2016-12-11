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
echo "Tell Santa your wishes. And when everyone is done,"
echo "Santa’s magical unicorns 🦄 will let each of us"
echo "know by email who we received, and a hint for what"
echo "they’d ❤️ for Christmas."
echo

./xmas-tree.bash
