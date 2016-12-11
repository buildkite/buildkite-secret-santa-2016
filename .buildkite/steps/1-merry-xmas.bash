#!/bin/bash

set -eu

function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

echo "+++ :christmas_tree: <3"

inline_image 'artifact://secret-santa.gif' 'Buildkite Secret Santa 2016'
