#!/bin/bash

set -euo pipefail

echo "+++ :christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree::unicorn::christmas_tree:"

if [[ ! -z "${BUILDKITE:-}" ]]; then
  NAMES=$(buildkite-agent meta-data get names)

  echo "Sending secret santa info for $NAMES…"
fi
