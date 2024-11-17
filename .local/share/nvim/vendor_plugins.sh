#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR"

prepend_path() {
  while read -r file; do
    echo "$1/$file"
  done
}

# ensure everything is installed: nvim --headless "+Lazy! install" +qa

for plugin in lazy/*; do
  echo vendoring $(basename $plugin)

  # git normally won't allow you to `git add` a file
  # within a nested git repo, so we use `git update-index`
  git -C "$plugin" ls-files \
    | prepend_path "$plugin" \
    | tr '\n' '\0' \
    | xargs -0 git update-index --add
done

