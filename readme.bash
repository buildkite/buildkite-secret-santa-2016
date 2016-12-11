#!/bin/bash

set -eu

function inline_image {
  printf "\033]1338;url=%s;alt=%s\a\n" "$1" "$2"
}

echo "+++ :christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree::buildkite::christmas_tree:"

inline_image 'artifact://secret-santa.gif' 'Buildkite Secret Santa 2016'

./xmas-tree.bash

echo
echo -e "                \033[31mWelcome to the Buildkite Secret Santa\033[0m 👋"
echo
echo -e "           Tell Santa your wishes. And when everyone is done,"
echo -e "              Santa’s magical unicorns will let each of us"
echo -e "               know by email who we received, and a hint"
echo -e "                 for what they’d \033[31m<3\033[0m for Christmas 🦄"
echo
