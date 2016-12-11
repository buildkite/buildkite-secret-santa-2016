#!/bin/bash

set -eu

function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

echo "+++ :christmas_tree::christmas_tree::christmas_tree::christmas_tree::christmas_tree::christmas_tree:"

./xmas-tree.bash

inline_image 'artifact://secret-santa.gif' 'Buildkite Secret Santa 2016'

echo
echo "$(tput setaf 1)"
echo "            Welcome to the Buildkite Secret Santa 👋"
echo "$(tput sgr0)"
echo
echo "        Tell Santa your wishes. And when everyone is done,"
echo "          Santa’s magical unicorns will let each of us"
echo "           know by email who we received, and a hint"
echo "             for what they’d <3 for Christmas 🦄"
