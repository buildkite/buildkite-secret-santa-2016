#!/bin/bash

set -eu

function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

buildkite-agent artifact upload secret-santa.gif

echo "+++ :christmas_tree: <3"

inline_image 'artifact://secret-santa.gif' 'Buildkite Secret Santa 2016'
