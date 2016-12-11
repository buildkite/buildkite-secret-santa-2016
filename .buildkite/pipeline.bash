#!/bin/bash

set -eu

cat <<PIPELINE
steps:
  - command: "readme.bash"
    label: "🎄 Readme"
    artifact_paths: "*.gif"
  - block
PIPELINE

for name in Jess Harriet Sam Keith Tim; do
  cat <<PIPELINE
  - block: "📝 $name"
    prompt: "Dear Secret Santa…"
    fields:
      - text: "My hint for xmas is…"
        key: "hint-$name"
      - text: "Please send my xmas presents to…"
        key: "address-$name"
PIPELINE
done

cat <<PIPELINE
  - block
  - command: "notify-santas-magical-unicorns.bash"
    label: "💌 :santa::skin-tone-3:"
PIPELINE
